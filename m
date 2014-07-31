From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 31 Jul 2014 17:38:30 +0000 (UTC)
Subject: [Buildroot] [Bug 7286] systemd 215 doesn't build
In-Reply-To: <bug-7286-163@https.bugs.busybox.net/>
References: <bug-7286-163@https.bugs.busybox.net/>
Message-ID: <20140731173830.23B469D342@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7286

--- Comment #5 from Eric Le Bihan <eric.le.bihan.dev@free.fr> 2014-07-31 17:38:29 UTC ---
The build fails because systemd is configured with the --enable-compat-libs
option.
This option has been added because since systemd 209, some libraries have been
merged into libsystemd.so:

 - libsystemd-daemon.so
 - libsystemd-id128.so
 - libsystemd-journal.so
 - libsystemd-login.so

When this option is enabled, the deprecated libraries will be built, so
external programs, which depend on them and have not yet migrated to
libsystemd, can still compile. But these libs will refer to the parts used to
build libsystemd.

For example, if we look at libsystemd-journal.so, we can see that is built from
libsystemd-journal.c. This file is generated from:

- src/compat-libs/linkwarning.h
- src/compat-libs/libsystemd-journal.sym

Via some macros in linkwarning.h the symbols will be compiled as an unallocated
section and linking to them will cause a warning to be printed.

From the build log, we can see that GCC complains the symbol is being defined
twice:

{{
/tmp/ccEK7EwW.ltrans13.ltrans.o: In function `sd_journal_reliable_fd':
ccEK7EwW.ltrans13.o:(.text+0x784): multiple definition of
`sd_journal_reliable_fd'
libsystemd_journal_internal_la-sd-journal.o (symbol from plugin):(.text+0x0):
first defined here
}}

In the attached Buildroot config file, we have "BR2_OPTIMIZE_2=y", which adds
"-Wp,-D_FORTIFY_SOURCE=2" to CPPFLAGS and "-flto -ffat-lto-objects" to CFLAGS.

I tried the attached configuration with ccache disabled and "BR2_OPTIMIZE_S=y",
which cause the aforementioned options to be dropped, and the build is
successful.

In the configure script, there is a check for these options, but it seems to
only print a warning message...

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
