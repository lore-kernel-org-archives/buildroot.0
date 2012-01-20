From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 20 Jan 2012 22:42:19 +0100
Subject: [Buildroot] [PATCH 1/2] udev: bump to 177
In-Reply-To: <4F191C7C.3010600@visionsystems.de>
References: <1326874717-1666-1-git-send-email-yegorslists@googlemail.com>
 <201201191522.03177.arnout@mind.be> <4F191C7C.3010600@visionsystems.de>
Message-ID: <201201202242.19955.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 20 January 2012 08:49:16 Yegor Yefremov wrote:
> Am 19.01.2012 15:22, schrieb Arnout Vandecappelle:
> > On Wednesday 18 January 2012 09:18:36 yegorslists at googlemail.com wrote:
[snip]
> >> +	select BR2_PACKAGE_E2FSPROGS
> >> +	select BR2_PACKAGE_USBUTILS
> > 
> >  Are these dependencies really required now?  They're kind of
> > silly if you don't have e2fs or USB on your target system...
> 
> At least with the same config options they are required. I haven't found any option to disable these dependencies.

 Okay, I looked at it in more detail...

- e2fsprogs is only needed for libblkid.  You can get that from util-linux 
too, and that one is way smaller (plus it defaults to leaving out everything
except libblkid and libuuid).  Actually e2fsprogs is a nice example.  Note BTW
that util-linux depends on LARGEFILE and WCHAR, so these dependencies (+ 
the comment) should be added to the udev config as well - and therefore also 
to BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV.

- usbutils is only needed for the usb.ids.  Giving the --with-usb-ids-path
removes the dependency.

[snip]
> >>  	--libexecdir=/lib/udev	\
 I didn't notice before, but this dumps the udev stuff into /lib/udev/udev/
which I don't think is your intention.  It should be --libexecdir=/lib

> >> +	--with-pci-ids-path=$(TARGET_DIR)/usr/share/hwdata/pci.ids	\
> > 
> >> +	--with-usb-ids-path=$(TARGET_DIR)/usr/share/hwdata/usb.ids	\
> > 
> >  I haven't actually ran it, but:
> > 
> > - I have the usb.ids in /usr/share/usb.ids
> > 
> > - I don't get pci.ids (that one should come from pciutils or directly
> > from http://pciids.sourceforge.net/pci.ids)
> 
> You're right. I have over reacted, as I've seen that udev can't find usb.ids (usbutils dependency). hwdata is responsible for pci.ids, so I'll move it to extras case.
>  
> > - shouldn't the $(TARGET_DIR) be removed?
> 
> What do you mean? Why removing $(TARGET_DIR)?

 I should have explained that better.  The path is only used in a C file
that will be executed on the target (configure doesn't actually check the
validity of the path).  So your linked udevd will have something like
$ strings -a target/lib/udev/udev/udevd | grep hwdata
/home/arnout/src/buildroot/output-ext-toolchain-x86_64/target/usr/share/hwdata/pci.ids
/home/arnout/src/buildroot/output-ext-toolchain-x86_64/target/usr/share/hwdata/usb.ids
Clearly, on my targe there is no /home/arnout directory.

> >  Note that these comments have nothing to do with the version bump, so
> > any changes should either go in a separate patch or be documented in the
> > commit message (and extent the short message with 'and other fixes').
> 
> I'll include all the issues in my next commit message. All these changes are "bump related".

 With "these comments" I meant the incorrect hwdata and the $(TARGET_DIR),
which were already there in the previous version (and thus were bugs).

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
