From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed,  7 May 2014 11:00:30 +0000 (UTC)
Subject: [Buildroot] [Bug 5396] Boot hangs when starting samba if
 BR2_ENABLE_LOCALE is enabled
In-Reply-To: <bug-5396-163@https.bugs.busybox.net/>
References: <bug-5396-163@https.bugs.busybox.net/>
Message-ID: <20140507110030.704E89CB2A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5396

--- Comment #5 from Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> 2014-05-07 11:00:29 UTC ---
I tried reproducing this problem using qemu in two cases:
- external glibc toolchain
- internal uclibc toolchain (locale enabled)

on current git (based on 2014.02, soon to become 2014.05).

In both cases, the system booted correctly (including samba). Manually starting
'smbd -FS' also gives no problems. 

Note that in the case of !BR2_ENABLE_LOCALE, a config option was added in
Buildroot:

config BR2_PACKAGE_SAMBA_LIBICONV
        bool "extended encodings (libiconv)"
        depends on !BR2_ENABLE_LOCALE
        select BR2_PACKAGE_LIBICONV
        help
          Include libiconv support for extended conversion of filename
          enconding. Samba has built-in support for UTF-8, ISO-8859-1
          and ASCII, so this is only required if you want to support
          other encodings.

In this case, the .mk file does:
ifeq ($(BR2_PACKAGE_SAMBA_LIBICONV),y)
SAMBA_DEPENDENCIES += libiconv
SAMBA_CONF_OPT += --with-libiconv=$(STAGING_DIR)
else
SAMBA_CONF_OPT += --with-libiconv=""
endif

but this bug report is about the case when locale is enabled.

Jonathan Liu: could you retest this scenario on a recent buildroot version and
let us know the result? If you still experience a problem, please share your
.config file.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
