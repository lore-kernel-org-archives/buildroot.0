From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Wed, 13 Aug 2014 19:12:53 +0000 (UTC)
Subject: [Buildroot] [Bug 7262] Generating locale en_US.UTF-8 fails on 64bit
 fedora linux host
In-Reply-To: <bug-7262-163@https.bugs.busybox.net/>
References: <bug-7262-163@https.bugs.busybox.net/>
Message-ID: <20140813191253.A9BED9D318@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=7262

Thomas De Schampheleire <patrickdepinguin@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|WORKSFORME                  |

--- Comment #6 from Thomas De Schampheleire <patrickdepinguin@gmail.com> 2014-08-13 19:12:53 UTC ---
(Reopen after more feedback from Romain)

Hi Romain, 

Thanks a lot for the strace!
It's odd though, as I don't see the same here. If I run the same strace in my
64-bit VirtualBox Fedora 20 installation, I see locale-archive is searched in
output/target/usr/lib/locale/, not lib64.

Looking in the sources of localedef: (just some snippets)

glibc/locale/programs/locarchive.c:57:
#define ARCHIVE_NAME LOCALEDIR "/locale-archive"

  if (output_prefix)
    memcpy (archivefname, output_prefix, prefix_len);
  strcpy (archivefname + prefix_len, ARCHIVE_NAME);
  strcpy (stpcpy (fname, archivefname), ".XXXXXX");

Makefile:
-DLOCALEDIR='"$(localedir)"'
localedir       = $(libdir)/locale
prefix          = /usr
exec_prefix     = ${prefix}
libdir          = ${exec_prefix}/lib

In the building of localedef, I can see in the build commands that
-DLOCALEDIR=/usr/lib/locale is passed.
Could you checked what is passed in your case? Is it lib64 or lib?

In locarchive.c, the filename that is used for the mktemp call is composed from
the prefix we pass (TARGET_DIR --> output/target) followed by the ARCHIVE_NAME.
This ARCHIVE_NAME starts with LOCALEDIR, which is thus supposed to be
/usr/lib/locale.

The only way I can see this failing (currently) is when LOCALEDIR in the build
commands of host-localedef is already using lib64, which would mean that either
the configure command does something unexpected, or the 'libdir' variable in
the localedef Makefile is overruled on the command-line.

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
