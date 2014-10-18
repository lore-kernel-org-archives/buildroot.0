From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 18 Oct 2014 15:31:33 +0200
Subject: [Buildroot] [PATCH] fs/iso9660: add dependencies for make source
In-Reply-To: <CAGduivwDurQn5c5Qovk+K6ZUg86cneLCjq7dpEmPJ9x-9ak=Eg@mail.gmail.com>
References: <1413580605-57289-1-git-send-email-kaszak@gmail.com>
 <CAGduivwDurQn5c5Qovk+K6ZUg86cneLCjq7dpEmPJ9x-9ak=Eg@mail.gmail.com>
Message-ID: <54426BB5.6030903@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/10/14 12:31, Maxime Hadjinlian wrote:
> Hi Karoly, all
> 
> On Fri, Oct 17, 2014 at 11:16 PM, Karoly Kasza <kaszak@gmail.com> wrote:
>> The "iso image" rootfs target is a special one, as it does not use the
>> ROOTFS_TARGET infrastructure. The absence of ROOTFS_*_DEPENDENCIES
>> variable makes "make source" to skip this target's dependencies
>> (namely host-cdrkit and it's children) obstructing an offline build.

 Good catch!

>>
>> Signed-off-by: Karoly Kasza <kaszak@gmail.com>
>> ---
>>  fs/iso9660/iso9660.mk |    2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/fs/iso9660/iso9660.mk b/fs/iso9660/iso9660.mk
>> index b0e755d..5137026 100644
>> --- a/fs/iso9660/iso9660.mk
>> +++ b/fs/iso9660/iso9660.mk
>> @@ -10,6 +10,8 @@
>>  ISO9660_TARGET_DIR = $(BUILD_DIR)/iso9660
>>  ISO9660_BOOT_MENU := $(call qstrip,$(BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU))
>>
>> +ROOTFS_ISO9660_DEPENDENCIES = host-cdrkit host-fakeroot linux rootfs-cpio grub
>> +
>>  $(BINARIES_DIR)/rootfs.iso9660: host-cdrkit host-fakeroot linux rootfs-cpio grub

 You should use $(ROOTFS_ISO9660_DEPENDENCIES) here.

>>         @$(call MESSAGE,"Generating root filesystem image rootfs.iso9660")
>>         mkdir -p $(ISO9660_TARGET_DIR)
>> --
>> 1.7.10.4
> How about putting the dependencies variables on the top ?
> Also, please keep the dependencies alphabetically sorted.
> I know they are not ordered the line below, but it would be nice.

 Well, now they're ordered according to how they appear in the makefiles, i.e.
first the real packages, then the kernel, then the rootfs, then the bootloader.

 Hm, actually, the bootloader should come before the kernel in that reasoning...

 So alphabetically is probably better :-)


 Regards,
 Arnout

>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
