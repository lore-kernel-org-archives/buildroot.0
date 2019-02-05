From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 13:18:12 +0100
Subject: [Buildroot] [PATCH] package/netsurf: fix build
In-Reply-To: <20190205083037.17170-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Tue, 5 Feb 2019 09:30:37 +0100")
References: <20190205083037.17170-1-peter@korsgaard.com>
Message-ID: <87a7japgxn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > Fixes:
 > http://autobuild.buildroot.net/results/a5b/a5bd8969c398fc3101ffaec4aa715a827aec5770/
 > http://autobuild.buildroot.net/results/441/44112e8ad03f47125bbf4b231d800ebd5beef24b/

 > After commit 122089ad (package/netsurf: use TMP_PREFIX inside the build
 > directory), the build fails with:

 >  COMPILE: src/stylesheet.c
 > In file included from src/stylesheet.c:12:0:
 > src/stylesheet.h:14:39: fatal error: libwapcaplet/libwapcaplet.h: No such file or directory
 >  #include <libwapcaplet/libwapcaplet.h>

 > The reason is that netsurf installs its internal libraries to TMP_PREFIX
 > during the build, and uses pkg-config to add the correct include/linker
 > flags when building/linking the rest.  Unfortunately this fails badly, as we
 > prefix STAGING_DIR to the paths returned by pkg-config, causing gcc to fail
 > to find the header / library files.

 > This worked (by accident) when we pointed TMP_PREFIX to STAGING_DIR/usr, as
 > STAGING_DIR/usr/include and STAGING_DIR/usr/lib are in the standard
 > include/library search paths.

 > Fix it by adding TMP_PREFIX/include and TMP_PREFIX/lib to the
 > include/library search paths.  We cannot easily add them to CFLAGS/LDFLAGS
 > as the makefiles do not use override when appending to them, so instead pass
 > both in CC (which is also used for linking).

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

It isn't very nice, but I don't think we have any better solution.

Committed, thanks.

-- 
Bye, Peter Korsgaard
