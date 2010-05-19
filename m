From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 19 May 2010 14:55:36 +0100
Subject: [Buildroot] Converting packages to autotools leading to more in
	target filesystem
Message-ID: <4BF3EDD8.2070809@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have been updating a project to use the latest buildroot from git and 
I have noticed a change in the size of the target filesystem.

This is caused by the conversion of certain packages to use the 
autotools infrastructure. The two packages in the tree I have noticed it 
for are libsysfs and libraw1394. These are both libraries and previously 
the install step for the target just copied the libraries into 
$(TARGET_DIR)/usr/lib.

With the conversion to autotools instead the target install step is 
calling install-strip on the Makefile in the package source. This 
correctly installs the library but it also copies a number of test 
applications that come bundled with the library. For my project where 
filesystem size is constrained this can cause problems. If a system was 
not constrained for filesystem size I can see that the test applications 
could be useful to allow someone to test the library was working correctly.

I was easily able to remove the unwanted applications by adding a 
INSTALL_TARGET_CMDS override for the package as below:

--- a/package/libraw1394/libraw1394.mk
+++ b/package/libraw1394/libraw1394.mk
@@ -8,4 +8,8 @@ LIBRAW1394_SOURCE:=libraw1394-$(LIBRAW1394_VERSION).tar.gz
  LIBRAW1394_SITE:=http://www.kernel.org/pub/linux/libs/ieee1394/
  LIBRAW1394_INSTALL_STAGING=YES

+define LIBRAW1394_INSTALL_TARGET_CMDS
+       $(MAKE) DESTDIR=$(TARGET_DIR)  install-strip -C 
$(BUILD_DIR)/libraw1394-$(LIBRAW1394_VERSION)/src
+endef
+
  $(eval $(call AUTOTARGETS,package,libraw1394))

This works fine but forces all users to have a cut down install. Is this 
a problem people think is worth solving? If so I will look at changing 
it so that the autotools infrastructure can choose (depending on a 
global config option) to either install the entire package or you can 
specify make targets that only install some of the package.

Will
