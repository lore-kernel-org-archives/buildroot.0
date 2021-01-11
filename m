From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Jan 2021 00:11:16 +0100
Subject: [Buildroot] [PATCH v4 1/5] package/nvidia-modprobe: new package
In-Reply-To: <e9cde36d-d4bd-0752-de06-1cc9a75b0cac@gmail.com>
References: <20201119075328.8599-1-christian@paral.in>
 <c39da99f-96c6-66ef-8f49-4655112a5441@gmail.com>
 <CA+h8R2rq67w5b0qhgcMZewNehLKx-CRBDxOX1faixhv6QP=WPg@mail.gmail.com>
 <e9cde36d-d4bd-0752-de06-1cc9a75b0cac@gmail.com>
Message-ID: <9f11acd4-80ba-7e24-2d30-2b5096438bb1@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 21/11/2020 23:49, Romain Naour wrote:
> Hello Christian,
> 
> Le 21/11/2020 ? 21:32, Christian Stewart a ?crit?:
>> Hi Romain,
>>
>> On Sat, Nov 21, 2020 at 2:19 AM Romain Naour <romain.naour@gmail.com> wrote:
>>
>> [snip]
>>
>>>> +NVIDIA_MODPROBE_VERSION = 450.57
>>>> +NVIDIA_MODPROBE_SITE = $(call github,NVIDIA,nvidia-modprobe,$(NVIDIA_MODPROBE_VERSION))
>>>> +NVIDIA_MODPROBE_LICENSE = GPL-2
>>>
>>> The license should use identifier like GPL-2.0 or GPL-2.0+.
>>> Here it should be GPL-2.0.
>>
>> Ok, noted.
>>
>>>> +NVIDIA_MODPROBE_LICENSE_FILES = COPYING
>>>> +
>>>> +NVIDIA_MODPROBE_DEPENDENCIES = host-pkgconf
>>>
>>> Why ? the binary is build by using gcc directly without any build system.
>>
>> At one point I had errors about pkgconf, so I added the dependency.
>> Will try building it without the dependency and see if it works.
> 
> I tried without host-pkgconf and nvidia-modprobe build.
> 
>>
>>>> +NVIDIA_MODPROBE_INSTALL_STAGING = YES
>>>> +
>>>> +define NVIDIA_MODPROBE_BUILD_CMDS
>>>> +     mkdir -p $(@D)/bin
>>>> +     $(TARGET_MAKE_ENV) $(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) \
>>>> +             -I $(@D)/common-utils -I $(@D)/modprobe-utils \
>>>> +             -o $(@D)/bin/nvidia-modprobe \
>>>> +             -DNV_LINUX=true -DPROGRAM_NAME=\"nvidia-modprobe\" \
>>>> +             -DNVIDIA_VERSION=\"$(NVIDIA_MODPROBE_VERSION)\" \
>>>> +             $(@D)/nvidia-modprobe.c $(@D)/modprobe-utils/nvidia-modprobe-utils.c \
>>>> +             $(@D)/modprobe-utils/pci-sysfs.c $(@D)/common-utils/common-utils.c \
>>>> +             $(@D)/common-utils/msg.c $(@D)/common-utils/nvgetopt.c
>>>> +endef
>>>
>>> There is a Makefile why not using it ?
>>> Ok it want to install the man pages but it should be easy to fix it.
>>
>> The makefile was not working correctly and doing a lot of extra stuff
>> we don't need.

 I double-checked, and indeed it's not working correctly. But actually, only
because it tries to generate the manpages with a program compiled for the
target. It's easily solved with


>> Why is storing the simplified build commands in the makefile via a
>> patch more clear / easy to maintain than directly in the Buildroot
>> makefiles?

 As indicated by Romain, it's more maintainable to reuse the existing Makefile
than having to update the source file list when it changes.

 That said, if the Makefile needs to be patched, and the patch is not
upstreamable, then it's OK to explicitly have the build command in the Buildroot
.mk file.


>>
>> If necessary, I will re-format this into the makefile via a patch for
>> the next revision. But this definitely works fine as-is and we are
>> unlikely to need a more complicated build script for this package in
>> the future.
> 
> It was not clear why you don't use the Makefile provided by Nvidia.
> Indeed the build is ok as is but we should use the Makefile provided by the
> package if possible. I'm ok to keep as is if the Makefile provided by Nvidia
> doesn't work with Buildroot.
> 
> Note: there are some examples of packages installing a Makefile instead of
> calling gcc from package.mk:
> 
> $ find package/ -name Makefile
> package/ramsmp/Makefile
> package/dhrystone/Makefile
> package/ramspeed/Makefile
> 
> For simple program like fan-ctrl there is no Makefile:
> package/fan-ctrl/fan-ctrl.mk
 I don't think for this one a separate Makefile is warranted.

> 
>>
>>>> +define NVIDIA_MODPROBE_INSTALL_STAGING_CMDS
>>>> +     $(INSTALL) -D -m 644 $(@D)/modprobe-utils/nvidia-modprobe-utils.h \
>>>> +             $(STAGING_DIR)/usr/include/nvidia-modprobe-utils/nvidia-modprobe-utils.h
>>>> +     $(INSTALL) -D -m 644 $(@D)/modprobe-utils/pci-enum.h \
>>>> +             $(STAGING_DIR)/usr/include/nvidia-modprobe-utils/pci-enum.h
>>>> +     $(INSTALL) -D -m 644 $(@D)/common-utils/common-utils.h \
>>>> +             $(STAGING_DIR)/usr/include/nvidia-modprobe-utils/nvidia-common-utils.h
>>>> +     $(INSTALL) -D -m 644 $(@D)/common-utils/msg.h \
>>>> +             $(STAGING_DIR)/usr/include/nvidia-modprobe-utils/msg.h
>>>> +     $(INSTALL) -D -m 644 $(@D)/common-utils/nvgetopt.h \
>>>> +             $(STAGING_DIR)/usr/include/nvidia-modprobe-utils/nvgetopt.h

 Why do you install these to staging? There is no library installed to staging,
and the upstream Makefile also doesn't install these, so they would seem to be
internal headers...

>>>> +endef
>>>
>>> Same, we really don't want to maintain the gcc command line and the list of
>>> installed files. The Makefile must do it for us :)
>>
>> Why? The list won't change. How is storing it in a patch file easier
>> to maintain than in this makefile?
> 
> How do you know that this list won't change when the package will be updated to
> a newer version ?
> 
> Usually we prefer using:
> make -C $(@D) DEST_DIR=$(STAGING_DIR) install

 That one definitely won't work because it also installs man pages which can't
be generated, and it tries to strip the binary with the wrong strip program.


 Regards,
 Arnout

>>>> +
>>>> +define NVIDIA_MODPROBE_INSTALL_TARGET_CMDS
>>>> +     $(INSTALL) -m 0755 $(@D)/bin/nvidia-modprobe \
>>>> +             $(TARGET_DIR)/usr/bin/nvidia-modprobe
>>>> +endef
>>>
>>> Same.
>>
>> ??
> 
> Usually we prefer using:
> make -C $(@D) DEST_DIR=$(TARGET_DIR) install
> 
> The headers installed are removed by Buildroot during target-finalize.
> 
> Best regards,
> Romain
> 
> 
>>
>> Best,
>> Christian
>>
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
