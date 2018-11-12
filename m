From: Andreas Naumann <dev@andin.de>
Date: Mon, 12 Nov 2018 13:53:05 +0100
Subject: [Buildroot] [PATCH 1/2] fs: Add common rootfs dependencies to
 PACKAGES
In-Reply-To: <f91c9608-9c78-222a-fc88-232e7a4b639a@mind.be>
References: <20181108130417.1277-1-anaumann@ultratronik.de>
 <20181108130417.1277-2-anaumann@ultratronik.de>
 <f91c9608-9c78-222a-fc88-232e7a4b639a@mind.be>
Message-ID: <7c555849-2594-6776-4a40-2a4e416ab914@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

Am 09.11.18 um 23:11 schrieb Arnout Vandecappelle:
> 
> 
> On 08/11/2018 14:04, Andreas Naumann wrote:
...
>> +PACKAGES += $(ROOTFS_COMMON_DEPENDENCIES)
> 
>   I don't really like this, for the simple reason that it will enable the
> dependencies even if they are not needed because we're not building any rootfs.

good point, I dont like that either. I'd propose to change/move the 
patch into something like
   PACKAGES += $$(filter-out $$(PACKAGES),$$(ROOTFS_COMMON_DEPENDENCIES))
inside the rootfs-conditional clause at the bottom of fs/common.mk. 
Actually I'm not sure the filter-out stuff is really needed since 
duplicate targets may accumulate in PACKAGES anyway.

best regards,
Andreas

> 
>   It's a small thing though, and working around it is a lot more complicated (you
> could e.g. select a new Config.in symbol that is selected by all the rootfses).
> And when we ever get the Config.in.host for all host packages, it's solved
> already. So
> 
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> 
>   Regards,
>   Arnout
> 
>>   
>>   $(ROOTFS_COMMON_TAR): ROOTFS=COMMON
>>   $(ROOTFS_COMMON_TAR): FAKEROOT_SCRIPT=$(FS_DIR)/fakeroot.fs
>>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
