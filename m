From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 27 Jan 2010 18:55:22 +0000
Subject: [Buildroot] uClibc copying kernel headers
Message-ID: <4B608C1A.70901@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have been trying to work out who copied the kernel headers from 
toolchain into staging. It appears this is done in uclibc.mk

Looking at the makefile this seems to happen three times, first copying 
into $(TOOLCHAIN_DIR)/uClibc_dev/usr/include, then into 
$(STAGING_DIR)/usr/include and finally into $(TARGET_DIR)/usr/include 
(only if libc.a is on target)

All of these cases have different behaviour depending on whether ifeq 
($(LINUX_HEADERS_IS_KERNEL),y) is true. if it is it just copies all th 
files, otherwise it picks out a specific subset. However search all the 
buildroot files LINUX_HEADERS_IS_KERNEL is never mentioned except in 
uclibc.mk

Looking back through earlier buildroot versions, Peter removed the last 
mention to LINUX_HEADERS_IS_KERNEL with this commit to remove 2.4.x 
kernel header support 
http://lists.busybox.net/pipermail/buildroot/2009-February/026144.html

It appears that before this LINUX_HEADERS_IS_KERNEL was set true for 
2.6.x and false for 2.4.x. It looks to me like that change broke the 
copying of kernel headers for 2.6.x and left code in uclibc.mk that was 
meant for 2.4.x headers.

I think I can just change uclibc.mk so that it acts as if 
LINUX_HEADERS_IS_KERNEL is set.

Does this look right?

As an aside there looks to be an error in uclibc.mk at the moment on 
line 429, although that is code that i think should be removed.

I will attempt to make the changes and if it all works I will submit a patch

Will
