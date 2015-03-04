From: Laurent Colloud <laurent.colloud@free.fr>
Date: Wed, 04 Mar 2015 23:39:06 +0100
Subject: [Buildroot] [PATCH 08/10 v7] package/nvidia-tegra23-binaries:
 new package
In-Reply-To: <20150223124136.5fb4ea97@nserafini-N550JK>
References: <cover.1423597914.git.yann.morin.1998@free.fr>
 <af61ad6f5736862b334002ce47727c9ce3bb2ab3.1423597914.git.yann.morin.1998@free.fr>
 <20150221234636.50616706@free-electrons.com> <20150221225836.GB4246@free.fr>
 <20150223124136.5fb4ea97@nserafini-N550JK>
Message-ID: <54F7898A.6090601@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 23/02/15 12:41, Nicolas Serafini wrote:
> Yann, Thomas, All,
>
> On Sat, 21 Feb 2015 23:58:36 +0100
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>
>> Thomas, Nicolas, All,
>>
>> On 2015-02-21 23:46 +0100, Thomas Petazzoni spake thusly:
>>> On Tue, 10 Feb 2015 21:01:15 +0100, Yann E. MORIN wrote:
>>>
>>>> diff --git a/package/nvidia-tegra23/Config.in
>>>> b/package/nvidia-tegra23/Config.in new file mode 100644
>>>> index 0000000..950f2f8
>>>> --- /dev/null
>>>> +++ b/package/nvidia-tegra23/Config.in
>>>> @@ -0,0 +1,36 @@
>>>> +menuconfig BR2_PACKAGE_NVIDIA_TEGRA23
>>>> +	bool "nvidia-tegra23"
>>>> +	depends on BR2_cortex_a9
>>>> +	depends on BR2_ARM_EABIHF && BR2_TOOLCHAIN_USES_GLIBC
>>>> +	depends on BR2_PACKAGE_XORG7
>>>
>>> Why is X.org required? Those NVidia drivers provide an EGL
>>> implementation, so I would expect them to be usable without X.org,
>>> for example if you want to do Qt5 over eglfs. Isn't it the case?
>>
>> I'll let Nicolas reply on that one...
>
> The main problem with all theses Nvidia binaries is that if you take any
> libraries you have a dependency on X11 libraries.
>
> For exemple I only need gstreamer v4l2 capture, hardware format
> conversion with libgstnvvidconv and hardware encoding but I have to
> embed all binaries and X11 due to the dependency tree.
>
>>
>>>> +choice
>>>> +	prompt "X11 ABI version"
>>>> +	default BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V11
>>>> +	help
>>>> +	  Select Tegra X11 ABI version.
>>>> +
>>>> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V5
>>>> +	bool "X11 ABI 5"
>>>> +	help
>>>> +	  Tegra X11 ABI 5.
>>>> +
>>>> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V6
>>>> +	bool "X11 ABI 6"
>>>> +	help
>>>> +	  Tegra X11 ABI 6.
>>>> +
>>>> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V7
>>>> +	bool "X11 ABI 7"
>>>> +	help
>>>> +	  Tegra X11 ABI 7.
>>>> +
>>>> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V8
>>>> +	bool "X11 ABI 8"
>>>> +	help
>>>> +	  Tegra X11 ABI 8.
>>>> +
>>>> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V10
>>>> +	bool "X11 ABI 10"
>>>> +	help
>>>> +	  Tegra X11 ABI 10.
>>>> +
>>>> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V11
>>>> +	bool "X11 ABI 11"
>>>> +	help
>>>> +	  Tegra X11 ABI 11.
>>>> +
>>>> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V12
>>>> +	bool "X11 ABI 12"
>>>> +	help
>>>> +	  Tegra X11 ABI 12.
>>>> +
>>>> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V13
>>>> +	bool "X11 ABI 13"
>>>> +	help
>>>> +	  Tegra X11 ABI 13.
>>>> +
>>>> +config BR2_PACKAGE_NVIDIA_TEGRA23_BINARIES_X11ABI_V14
>>>> +	bool "X11 ABI 14"
>>>> +	help
>>>> +	  Tegra X11 ABI 14.
>>>
>>> Is this choice really useful? In Buildroot, we only support one
>>> version of the X.org server at a time, so only one ABI version.
>>
>> Ditto.
>>
>>> And currently, we have X.org server 1.17.1, which implementation the
>>> video driver ABI version 19. How can this work with the Tegra
>>> drivers if they only support up to ABI version 14 ?
>>
>> Ditto.
>
> You right, I have only tested with an old version (1.14.7) of X.org so
> this driver won't work with the 1.17.1 version. I don't know if Nvidia
> will provide new driver with support of latest ABI version.
> Currently I have no more hardware with display to test the graphics
> part.
>

I confirm that video playback works on Tegra 3 using X.org v1.14.7.
As far as I know, Nvidia won't release any new version of those drivers 
for Tegra 2 and Tegra 3 so we'll have to keep using an old version of X.org.

>>
>>>> +NVIDIA_TEGRA23_BINARIES_VERSION	=
>>>> $(NVIDIA_TEGRA23_VERSION)
>>>
>>> Spacing issue here.
>>
>> Sure.
>>
>>>> +NVIDIA_TEGRA23_BINARIES_SITE = $(NVIDIA_TEGRA23_SITE)
>>>> +NVIDIA_TEGRA23_BINARIES_SOURCE =
>>>> $(NVIDIA_TEGRA23_BASE)_R$(NVIDIA_TEGRA23_BINARIES_VERSION)_armhf.tbz2
>>>> + +NVIDIA_TEGRA23_BINARIES_LICENSE = License For Customer Use of
>>>> NVIDIA Software +NVIDIA_TEGRA23_BINARIES_LICENSE_FILES =
>>>> nv_tegra/LICENSE +
>>>> +NVIDIA_TEGRA23_BINARIES_INSTALL_STAGING = YES
>>>> +NVIDIA_TEGRA23_BINARIES_INSTALL_TARGET = YES
>>>
>>> Last line not needed, it's the default.
>>
>> Indeed, my bad.
>>
>>>> +NVIDIA_TEGRA23_BINARIES_DEPENDENCIES = mesa3d-headers \
>>>> +	xlib_libX11 xlib_libXext xlib_libXv
>>>
>>> A comment above this explaining why even though those are not build
>>> dependencies of nvidia-tegra23-binaries they should still be listed
>>> in the DEPENDENCIES would be useful.
>>
>> Yup, like the one you added in nvidia-x86.
>>
>>>> +define NVIDIA_TEGRA23_BINARIES_INSTALL_LIBS
>>>> +	$(foreach lib,$(NVIDIA_TEGRA23_BINARIES_LIBRARIES),
>>>> +		$(INSTALL) -D -m 0644
>>>> $(@D)/nv_tegra/nvidia_drivers/usr/lib/$(lib) \
>>>> +			$(1)/usr/lib/$(lib); \
>>>> +	)
>>>> +	(cd $(1)/usr/lib; \
>>>> +		ln -sf libGLESv2.so.2 libGLESv2.so; \
>>>> +		ln -sf libGLESv1_CM.so.1 libGLESv1_CM.so; \
>>>> +		ln -sf libEGL.so.1 libEGL.so \
>>>> +	)
>>>> +endef
>>>> +
>>>> +define NVIDIA_TEGRA23_BINARIES_INSTALL_STAGING_CMDS
>>>> +	$(call
>>>> NVIDIA_TEGRA23_BINARIES_INSTALL_LIBS,$(STAGING_DIR))
>>>> +	$(foreach pkgconfig,$(NVIDIA_TEGRA23_BINARIES_PKGCONFIG),
>>>> +		$(INSTALL) -D -m 0644
>>>> package/nvidia-tegra23/nvidia-tegra23-binaries/$(pkgconfig) \
>>>> +
>>>> $(STAGING_DIR)/usr/lib/pkgconfig/$(pkgconfig); \
>>>> +	)
>>>
>>> Don't we need a $(sep) here in the foreach loop?
>>
>> Eh, no, because the command ends up with a semi-colon ';', so the
>> whole 'foreach' generates what POSIX calls a 'list' of commands, like:
>>      foo; bar; buz;
>>
>> And it is valid to end a (list of) command(s) with a semi-colon.
>>
>> But maybe, for consistency with all foreach instances, we should be
>> using a $(sep), indeed.
>>
>>>> +endef
>>>> +
>>>> +define NVIDIA_TEGRA23_BINARIES_INSTALL_TARGET_CMDS
>>>> +	$(call
>>>> NVIDIA_TEGRA23_BINARIES_INSTALL_LIBS,$(TARGET_DIR))
>>>> +	$(foreach firmware,$(NVIDIA_TEGRA23_BINARIES_FIRMWARE),
>>>> +		$(INSTALL) -D -m 0644
>>>> $(@D)/nv_tegra/nvidia_drivers/lib/firmware/$(firmware) \
>>>> +			$(TARGET_DIR)/lib/firmware/$(firmware); \
>>>> +	)
>>>
>>> Ditto.
>>
>> Ditto.
>>
>> Regards,
>> Yann E. MORIN.
>>
>
>
>

Regards,
Laurent Colloud
