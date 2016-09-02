From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Fri, 02 Sep 2016 06:08:12 +0000
Subject: [Buildroot] [Bug 9216] New: log4cpp package build fails to build
	within install
Message-ID: <bug-9216-163@https.bugs.busybox.net/>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=9216

            Bug ID: 9216
           Summary: log4cpp package build fails to build within install
           Product: buildroot
           Version: 2016.05
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P5
         Component: Other
          Assignee: unassigned at buildroot.uclibc.org
          Reporter: martin.guethle at bachmann-technology.com
                CC: buildroot at uclibc.org
  Target Milestone: ---

Hi together,

after I've seen that there log4cpp is now part of the buildroot, I've appended
the related package to the 2016.5 version, by getting the related stuff from
the git repository in the newest version.

The compile itself works fine, but it fails when run as user, as the related
install part tries to write data to /usr/doc, where now write access is
allowed.

Searching around for the different compile flags from log4cpp itself, it shown
up, that the problem can be suppressed, by deactivating the logging itself with
the following line in the log4cpp.mk:

LOG4CPP_CONF_OPTS += "--disable-doxygen"

But this part deactivates all kind of documentation stuff.

I've tried a couple of different things to change path specification done via
the LOG4CPP_STAGING_CONFIG_SCRIPT_FIXUP definition.
I.e  the following ones:
--datarootdir
--mandir
--docdir
Not all at once, but tried some variants. But didn't help.

The reduced build log part to the relevant part is:

/bin/bash ../config/mkinstalldirs /usr/share/man/man3
/usr/bin/install -c -m 644 ./man/man3/log4cpp.3/usr/share/man/man3/log4cpp.3
/usr/bin/install: cannot create regular file '/usr/share/man/man3/log4cpp.3':
Permission denied

If the full build log is necessary, I can append it, too.

As I've not run through the whole Makefile, it seems like some of the path
definitions is not done in a correct way.

Hope there is a cleaner way to allow the compile the package and keeping all
parts of documentation alive and present within the output staging folder.

Never the less thanks for appending the log4cpp package to the infrastructure

Greets
Martin

-- 
You are receiving this mail because:
You are on the CC list for the bug.
