From: kaneda at chez.com <kaneda@chez.com>
Date: Fri, 04 May 2018 14:24:36 +0200
Subject: [Buildroot] Fighting with suid bit
In-Reply-To: <c41fae3e-3307-d3aa-8572-e65028237408@mind.be>
References: <ffeaf5280e229a536de5f81fba84c99b@chez.com>
 <c41fae3e-3307-d3aa-8572-e65028237408@mind.be>
Message-ID: <94873ecfb7c2d71d61d4ce5d76fd3cfb@chez.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

It seems you got something here....


/target
- ucon64 is 4755
- udevadm is 4755


rootfs.tar.gz
- ucon64 is 4755
- udevadm is 4755


rootfs.cpio
- ucon64 is 0755
- udevadm is 0755


As you can see, it's not only my own file, but also udevadm


So yes, it's on the Generating root filesystem image rootfs.cpio 
part....

I see it's using cpio --quiet -o -H newc
and that it uses _device_table.txt where is present
/usr/bin/ucon64    f 4755 0 0 - - - - -


What could I test more ?
is there a way to not delete _fakeroot.fs to make some tsts









Le 2018-05-03 23:02, Arnout Vandecappelle a ?crit?:
> On 03-05-18 18:52, kaneda at chez.com wrote:
>> Hi there,
>> 
>> I'm using buildroot to make a lightweight distro dedicated to retro 
>> dev
>> (https://bitbucket.org/SpritesMind/lilu).
>> usually, I find my answer on manual, mailing list or google but this 
>> time, I'm
>> lost :
>> 
>> One of my tools need raw io access to parallel port.
>> I solved this using the setuid bit but I'm unable to include it on my 
>> FS distro.
>> 
>> This tool has is own package so here is what I tried
>> 
>> define UCON64_INSTALL_TARGET_CMDS
>> ?? $(INSTALL) -D -m 4755 $(@D)/src/ucon64 $(TARGET_DIR)/usr/bin
> 
>  This might not work, it's possible that the suid bit is lost under 
> fakeroot.
> 
>  Note BTW that with -D, you should specify the full path of the target, 
> so
> 
> 	$(INSTALL) -D -m 4755 $(@D)/src/ucon64 $(TARGET_DIR)/usr/bin/ucon64
> 
>> endef
>> 
>> define UCON64_PERMISSIONS
>> ????/usr/bin/ucon64??? f 4755 0 0 - - - - -
> 
>  This should work however...
> 
>> endef
>> 
>> 
>> or throught buildroot config
>> 
>> 
>> BR2_ROOTFS_DEVICE_TABLE="system/device_table.txt
>> $(BR2_EXTERNAL)/board/neoware/ca21/device_table.txt"
>> 
>> with this device_table.txt :
>> /usr/bin/ucon64???????????????? f??? 4755??? 0??? 0??? -??? -??? -??? 
>> -??? -
>> 
>> 
>> I wonder if it's because I'm building a LiveCD with initrd
>> 
>> CONFIG_DEVTMPFS=y
>> CONFIG_DEVTMPFS_MOUNT=y
>> 
>> BR2_TARGET_ROOTFS_ISO9660=y
>> BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="$(BR2_EXTERNAL)/board/neoware/ca21/syslinux.cfg"
> 
>  You do have BR2_TARGET_ROOTFS_ISO9660_INITRD=y as well, right? (y is 
> the
> default). I don't think the iso9660 filesystem has support for the suid 
> bit.
> 
> 
>> BR2_TARGET_ROOTFS_ISO9660_HYBRID=y
>> BR2_TARGET_ROOTFS_TAR_GZIP=y
> 
>  You should also have a rootfs.tar.gz and a rootfs.cpio; can you check 
> in these
> two files whether the suid bit is set?
> 
>> BR2_TARGET_SYSLINUX=y
>> BR2_TARGET_SYSLINUX_ISOLINUX=y
>> BR2_TARGET_SYSLINUX_MBR=y
>> 
>> 
>> 
>> but whatever happens, I have /usr/bin/ucon64 0755 on boot and not 
>> 4755, which I
>> could fix with chmod but not perfect....
> 
>  Oh, if you can fix it with chmod, it can't be iso9660 since that's 
> readonly. Or
> are you doing something with overlayfs or something?
> 
>  Regards,
>  Arnout
> 
>> 
>> any idea , hint , trick ?
>> and sorry if it's a basic issue, I'm not a linux guru ;)
>> 
>> 
>> Regards
>> 
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
