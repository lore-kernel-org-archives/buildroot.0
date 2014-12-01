From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 1 Dec 2014 14:05:56 +0000
Subject: [Buildroot] [PATCH v3] Add a defconfig for MIPS Creator CI20
In-Reply-To: <87vblvhd4j.fsf@dell.be.48ers.dk>
References: <1417193009-65132-1-git-send-email-Vincent.Riera@imgtec.com>	<87wq6ejtsz.fsf@dell.be.48ers.dk>
 <547C3F7B.3060804@imgtec.com>	<87zjb7hdud.fsf@dell.be.48ers.dk>
 <547C4367.2070207@imgtec.com> <87vblvhd4j.fsf@dell.be.48ers.dk>
Message-ID: <547C75C4.2070204@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/01/2014 10:34 AM, Peter Korsgaard wrote:
>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
> 
> Hi,
> 
>>>>> Is mdev in any way required? We normally only enable the basic stuff
>  >> >> needed to get a booting system in the defconfigs.
>  >> 
>  >> > I have added mdev to the defconfig in order to get it working out of the
>  >> > box, because the kernel defconfig we are using doesn't have
>  >> > DEVTMPFS_MOUNT support, so if you rely on the default /dev management
>  >> > option (Dynamic using devtmpfs only) it will not work.
>  >> 
>  >> But when you build a kernel with Buildroot it will automatically enable
>  >> DEVTMPFS_MOUNT when needed (E.G. when the system isn't configured for a
>  >> static /dev), so that shouldn't be an issue?
> 
>  > I didn't know that. So, if you are using a custom defconfig to build the
>  > kernel, will Buildroot do more modifications depending on which /dev
>  > management you have selected? Will not respect your defconfig?
> 
> Exactly: We do some minimal config tweaks to ensure you have a working
> setup. See the logic in linux/linux.mk (LINUX_CONFIGURE_CMDS).

I have seen that file and I found this snippet:

$(if $(BR2_ROOTFS_DEVICE_CREATION_STATIC),,
  $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS,$(@D)/.config)
  $(call KCONFIG_ENABLE_OPT,CONFIG_DEVTMPFS_MOUNT,$(@D)/.config))

It adds those two options to the kernel config only if
BR2_ROOTFS_DEVICE_CREATION_STATIC has been selected. I think this is
also needed for BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS. I'm going
to test it right now to make sure.

Also, could you tell me why that if statement has two comma (,,) instead
of one? What's the different with having only one comma?

Cheers,
-- 
Vicente Olivert Riera
Graduate Software Engineer, MIPS Platforms
Imagination Technologies Limited
t: +44 (0)113 2429814
www.imgtec.com
