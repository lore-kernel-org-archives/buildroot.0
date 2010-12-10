From: Robert Szentmihalyi <robert.szentmihalyi@helvetica-it.com>
Date: Sat, 11 Dec 2010 00:28:50 +0100
Subject: [Buildroot] YAFFS2 support for buildroot
In-Reply-To: <20101209203302.60ee10ac@surf>
References: <201012081744.10248.robert.szentmihalyi@helvetica-it.com>
	<201012082347.55945.robert.szentmihalyi@helvetica-it.com>
	<20101209203302.60ee10ac@surf>
Message-ID: <201012110028.50680.robert.szentmihalyi@helvetica-it.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Donnerstag, 9. Dezember 2010, Thomas Petazzoni wrote:
> 
> Yes, the GENTARGETS and AUTOTARGETS infrastructure can both pull
> sources from a git repository. Something like :
> 
> YAFFSTOOLS_SITE = git://foobar.org
> YAFFSTOOLS_VERSION = somegitcommitid
> 
> See http://buildroot.org/downloads/buildroot.html#generic-reference for
> more details

The download now works and I have solved the other issues, but I still don't 
quite see how to effectively implement yaffstools.mk for building mkyaffsimage 
and mkyaffs2image.

How do I refer to the kernel directory?
I have attached my cuurent yaffstools.mk and the original Makefile from git.
Maybe you could have a look at it in case you have a few spare minutes :-)

> 
> > I did that and I added
> > source "fs/yaffs2/Config.in"
> > to
> > fs/Config.in,
> > but the option does not appear under "target filesystem options".
> 
> Could you post what you have done exactly ? Because from this
> description, it should just work.
> 

I have found the problem that caused this in the meantime.

Thanks for your help,
 Robert

-- 
Robert Szentmih?lyi
Technischer Leiter

Helvetica IT AG
Bahnhofstrasse 15
CH-8890 Flums SG

Tel +41 81 733 15 67
Fax +41 81 733 15 68
Mobil +41 79 252 97 80

Niederlassung Deutschland:
Leopoldstrasse 244
DE-80807 M?nchen

Tel +49 89 20 80 39 508

http://www.helvetica-it.com
-------------- next part --------------
#############################################################
#
# yaffs-utils
#
#############################################################

YAFFSTOOLS_SITE = git://www.aleph1.co.uk/yaffs2
YAFFSTOOLS_VERSION = 0e2c2639d6f9ac7b09c93550f9bfa03fdb734eef


define YAFFS_BUILD_CMDS
 $(TARGET_MAKE_ENV) $(MAKE) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" -C $(@D)
endef

define YAFFS_INSTALL_TARGET_CMDS
 install -D -m 755 $(@D)/mkyaffsimage $(TARGET_DIR)/usr/sbin/mkyaffsimage
 install -D -m 755 $(@D)/mkyaffs2image $(TARGET_DIR)/usr/sbin/mkyaffs2image
endef

define HOST_YAFFS_BUILD_CMDS
 $(HOST_MAKE_ENV) $(MAKE) CFLAGS="$(HOST_CFLAGS) -Wall -O2 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64" LDFLAGS="$(HOST_LDFLAGS)" -C $(@D)
endef

define HOST_YAFFS_INSTALL_CMDS
 install -D -m 755 $(@D)/mkyaffsimage $(HOST_DIR)/usr/sbin/mkyaffsimage
 install -D -m 755 $(@D)/mkyaffs2image $(HOST_DIR)/usr/sbin/mkyaffs2image
endef

$(eval $(call GENTARGETS,package,yaffstools))
$(eval $(call GENTARGETS,package,yaffstools,host))
-------------- next part --------------
A non-text attachment was scrubbed...
Name: Makefile
Type: text/x-makefile
Size: 1739 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20101211/e5349a99/attachment.bin>
