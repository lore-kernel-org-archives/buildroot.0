From: Alvaro G. M. <alvaro.gamez@hazent.com>
Date: Sun, 4 Dec 2016 16:33:28 +0100
Subject: [Buildroot] [PATCH v3 1/1] libxmlrpc: bump to 1.39.11
In-Reply-To: <20161204150600.0bfe0ead@free-electrons.com>
References: <CAM+bi4vAks48DSkjARGDsoMiG7p+X=+frremEZbjaQnG5GQHYw@mail.gmail.com>
 <1479207044-12290-1-git-send-email-alvaro.gamez@hazent.com>
 <20161204150600.0bfe0ead@free-electrons.com>
Message-ID: <20161204153328.GA27936@collins.gmr.ssr.upm.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Dec 04, 2016 at 03:06:00PM +0100, Thomas Petazzoni wrote:
> All of them look like this:
> 
> make[3]: Entering directory `/accts/mlweber1/rc-buildroot-test/scripts/instance-1/output/build/libxmlrpc-1.39.11/lib/libutil++'
> /accts/mlweber1/rc-buildroot-test/scripts/instance-1/output/build/libxmlrpc-1.39.11/lib/libutil++/Makefile:109: depend.mk: No such file or directory
> cat /dev/null >depend.mk
> ln -s /accts/mlweber1/rc-buildroot-test/scripts/instance-1/output/build/libxmlrpc-1.39.11 srcdir
> ln -s /accts/mlweber1/rc-buildroot-test/scripts/instance-1/output/build/libxmlrpc-1.39.11 blddir
> make[3]: Leaving directory `/accts/mlweber1/rc-buildroot-test/scripts/instance-1/output/build/libxmlrpc-1.39.11/lib/libutil++'
> 
> Could you have a look and provide a patch to fix this?

Hi, Thomas

I already know the cause for this and the patch is simple.  However, before
sending the proposed patch as a git am commitable email, I'd like to query
about which shall be the best way to provide it.

The issue is that this version of libxmlrpc includes new subdir libutils++,
which requires c++ but without which the library can perform its function
perfectly. The way to solve this then is to patch lib/Makefile as inlined
below, making this directory compilable only if there's c++ support.

The question is: given that there is already a patch in buildroot called
0002-fix-non-cplusplus-build.patch which does exactly the same on a
different file (lib/util/Makefile), should I modify this patch to include
both changes, as the name and description of the patch is basically the
same, or should I provide another .patch file for this to include under
package/libxmlrpc?

These are the contents of proposed patch:

--- lib/Makefile	2015-12-30 05:22:14.000000000 +0100
+++ /tmp/Makefile	2016-12-04 16:26:05.006320880 +0100
@@ -9,7 +9,10 @@
 
 # Build up SUBDIRS:
 SUBDIRS = 
-SUBDIRS += util libutil libutil++
+SUBDIRS += util libutil
+ifeq ($(ENABLE_CPLUSPLUS),yes)
+  SUBDIRS += libutil++
+endif
 ifeq ($(ENABLE_ABYSS_SERVER),yes)
   SUBDIRS += abyss
   ifeq ($(ENABLE_CPLUSPLUS),yes)


Thank you!

-- 
Alvaro G. M.
