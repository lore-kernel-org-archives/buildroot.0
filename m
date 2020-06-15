From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Mon, 15 Jun 2020 12:32:27 +0100
Subject: [Buildroot] [PATCH v3] package/libcamera: bump version to
 96fab38
In-Reply-To: <20200614170205.GH2346@scaer>
References: <20200611094228.14887-1-ps.report@gmx.net>
 <e96772e7-eec4-1b04-6889-1a11a05c4225@ideasonboard.com>
 <20200614170205.GH2346@scaer>
Message-ID: <2c5bda12-fde1-a43d-6bb9-6e3d3b94fbe3@ideasonboard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann

On 14/06/2020 18:02, Yann E. MORIN wrote:
> Kieran, All,
> 
> On 2020-06-11 11:18 +0100, Kieran Bingham spake thusly:
>> On 11/06/2020 10:42, Peter Seiderer wrote:
>>> - add host dependencies: openssl, pkgconf, python3-pyyaml
>>> - add dependencies: gnutls
>>> - changed from mandatory to optional dependency: udev
>>> - add dedicated pipeline configure options
>>> - add optional dependencies: boost, gstreamer1/gst1-plugins-base,
>>>   qt5base, tiff
>>> - update license info (Apache-2.0 omitted - applies only for android code)
>>>
>>> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>>> ---
>>> Changes v1 -> v2:
>>>   - re-add LIBCAMERA_LICENSE_FILES list (Kieran Bingham)
>>>   - fix typo in commit message (Kieran Bingham)
>>>   - add Reviewed-by from Kieran Bingham
>>
>> You could actually add this to the patch :-)
>>
>>   Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> 
> Pro-tip: if you do not indent that line, then patchwork will pick it up,
> and it will automatically be included in the patch when we apply it
> locally. ;-)


Argh, I didn't realise the indent would break Patchwork ;-( boo.

I don't think I normally indent the tags, In that instance I was
probably just highlighting that the changelog had mentioned the tag was
added, but it had been dropped.



>> With the pipelines being configurable now, I fear that by default - none
>> of them will get built.
> 
> Is that a problem? I mean, would the build break if none is enabled?
> 
> As I understand it, it would make sense that a thir-party provides a
> binary blob for their hardware, nd use none of the pipelines for the
> known boards, no?

Libcamera could be built without any I believe (/me goes to test).

Yes, libcamera will build successfully and cleanly with -Dpipelines=""



But a pipeline handler is always required for *operation*, and those can
not be 'binary blobs'.

Only the image processing algorithm (IPA) components can be an external
binary. There must be a corresponding (open source) pipeline-handler to
support the algorithms.


>> Should there be a default enabled? Perhaps at least the
>> BR2_PACKAGE_LIBCAMERA_PIPELINE_UVCVIDEO should probably be default y.
>> (but leave it configurable).
>>
>> And if you're doing defaults, is there a way to make the IPU3 default to
>> build on x86 targets, and the RPI/rkisp default on if an ARM target?
> 
> We usually do not have 'default y' options, because that is in the end
> so use-case-specific.

Ok.

> If it makes sense that no pipeline is enabled, I'm fine with having none
> enabled by default.

I guess my only thought would be to expect at least UVC support - but
hey, the target might not have USB - so it certainly is use-case specific.



> 
> [--SNIP--]
>>> -comment "libcamera needs udev and a toolchain w/ C++, threads, gcc >= 5"
>>> +if BR2_PACKAGE_LIBCAMERA
>>> +
>>> +config BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3
>>> +	bool "libcamera ipu3 pipeline"
> 
> No need to have 'libcamera' in the prompt: menuconfig will proprely
> indent it below the main symbol, so that it is obvious that it is a
> libcamera opiton.
> 
> Also, since there are more than 5 such sub-options, it would be nice to
> have them in a submenu, by changing the main symbol from 'config' to
> 'menuconfig':
> 
>     menuconfig BR2_PACKAGE_LIBCAMERA
>         bool "libcamera"
>         depends blabla
> 
>     if BR2_PACKAGE_LIBCAMERA
> 
>     # sub-options, and menuconfig will automatically put
>     # them in a sub-menu of hte main symbol, above.
> 
>     endif
> 
>>> +	help
>>> +	  libcamera ipu3 pipeline
> 
> A help text that just repeats the prompt is useless. If you have nothing
> else to say, just do not add a help entry.
> 
> (note :the two comments above apply to all pipeline sub-options, of
> course).
> 
>>> +config BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI
>>> +	bool "libcamera raspberrypi pipeline"
>>> +	depends on BR2_USE_WCHAR # boost (already enforced for gnutls)
>>> +	select BR2_PACKAGE_BOOST
>>> +	help
>>> +	  libcamera raspberrypi pipeline
>>> +
>>> +config BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1
>>> +	bool "libcamera rkisp1 pipeline"
>>> +	help
>>> +	  libcamera rkips1 pipeline
>>> +
>>> +config BR2_PACKAGE_LIBCAMERA_PIPELINE_SIMPLE
>>> +	bool "libcamera simple pipeline"
>>> +	help
>>> +	  libcamera simple pipeline
>>> +
>>> +config BR2_PACKAGE_LIBCAMERA_PIPELINE_UVCVIDEO
>>> +	bool "libcamera uvcvideo pipeline"
>>> +	help
>>> +	  libcamera uvcvideo pipeline
>>> +
>>> +
> 
> Spurious empty line.
> 
>>> +config BR2_PACKAGE_LIBCAMERA_PIPELINE_VIMC
>>> +	bool "libcamera vimc pipeline"
>>> +	help
>>> +	  libcamera vimc pipeline
>>> +
>>> +endif # BR2_PACKAGE_LIBCAMERA
>>> +
>>> +comment "libcamera needs a toolchain w/ C++, threads, wchar, dynamic library, gcc >= 5"
>>>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
>>> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_PACKAGE_HAS_UDEV
>>> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
>>> diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
>>> index 6f721d87ee..907764de63 100644
>>> --- a/package/libcamera/libcamera.hash
>>> +++ b/package/libcamera/libcamera.hash
>>> @@ -1,3 +1,12 @@
>>> -sha256 cbaa7e06059717f71b57f9c20135c86d5f121d9aab10bfc20513ba5d04478756  libcamera-448393f77ec9e37cb807e8e8d35c1a4877d253d4.tar.gz
>>> -sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  licenses/gnu-gpl-2.0.txt
>>> -sha256 592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  licenses/gnu-lgpl-2.1.txt
>>> +sha256  6995be9d707ba3bcbe7a79bad894484561ee686f68b6523943ada7c0f6607e86  libcamera-96fab38e02792a109c0d35ca2154e95a7b4c8fcb.tar.gz
>>> +
>>> +# license files
>>> +sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
>>> +sha256  e11af671c491efac2f94c1d752bea92f4308ca2450c7d11e582e4b48c40e4de1  LICENSES/BSD-3-Clause.txt
>>> +sha256  6a573fb2f9082662978cf21fb153096df0a1981deaea7dbc10a11046fe005d9f  LICENSES/CC0-1.0.txt
>>> +sha256  ec3732087acf8c52429a020d6bba362ff578705bdb53365a21744485ec15b0e6  LICENSES/CC-BY-SA-4.0.txt
>>> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSES/GPL-2.0-only.txt
>>> +sha256  606aa26338f69ce178f1cbc648b7574aec4b5bbaeb20f4df36ff49010cb8fbbd  LICENSES/GPL-2.0-or-later.txt
>>> +sha256  1ccf09bf2f598308df4bed9cd8e9657dc5cd0973d2800318f2e241486e2edf3f  LICENSES/LGPL-2.1-or-later.txt
>>> +sha256  3f9e477523febab58de8b716ccfbcf02e6ef1c8e7728953905e8558637abe2a9  LICENSES/Linux-syscall-note.txt
>>> +sha256  8f25018489d6fe0dec34a352314c38dc146247b7de65735790f4398a92afa84b  LICENSES/MIT.txt
>>> diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
>>> index d209a38df3..c7513d2e68 100644
>>> --- a/package/libcamera/libcamera.mk
>>> +++ b/package/libcamera/libcamera.mk
>>> @@ -5,14 +5,69 @@
>>>  ################################################################################
>>>  
>>>  LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
>>> -LIBCAMERA_VERSION = 448393f77ec9e37cb807e8e8d35c1a4877d253d4
>>> +LIBCAMERA_VERSION = 96fab38e02792a109c0d35ca2154e95a7b4c8fcb
>>>  LIBCAMERA_SITE_METHOD = git
>>> -LIBCAMERA_DEPENDENCIES = udev
>>> -LIBCAMERA_CONF_OPTS = -Dtest=false -Ddocumentation=false
>>> +LIBCAMERA_DEPENDENCIES = \
>>> +	host-openssl \
>>> +	host-pkgconf \
>>> +	host-python3-pyyaml \
>>> +	gnutls
>>> +LIBCAMERA_CONF_OPTS = \
>>> +	-Dandroid=false \
>>> +	-Ddocumentation=false \
>>> +	-Dtest=false \
>>> +	-Dv4l2=false
>>>  LIBCAMERA_INSTALL_STAGING = yes
>>> -LIBCAMERA_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (utils)
>>> +LIBCAMERA_LICENSE = \
>>> +	LGPL-2.1+ (library), \
>>> +	GPL-2.0+ (utils), \
>>> +	MIT (qcam/assets/feathericons), \
>>> +	BSD-2-Clause (raspberrypi), \
>>> +	GPL-2.0 with Linux-syscall-note or BSD-3-Clause (linux kernel headers), \
>>> +	CC0-1.0 (meson build system), \
>>> +	CC-BY-SA-4.0 (doc)
>>>  LIBCAMERA_LICENSE_FILES = \
>>> -	licenses/gnu-gpl-2.0.txt \
>>> -	licenses/gnu-lgpl-2.1.txt
>>> +	LICENSES/LGPL-2.1-or-later.txt \
>>> +	LICENSES/GPL-2.0-or-later.txt \
>>> +	LICENSES/MIT.txt \
>>> +	LICENSES/BSD-2-Clause.txt \
>>> +	LICENSES/GPL-2.0-only.txt \
>>> +	LICENSES/Linux-syscall-note.txt \
>>> +	LICENSES/BSD-3-Clause.txt \
>>> +	LICENSES/CC0-1.0.txt \
>>> +	LICENSES/CC-BY-SA-4.0.txt
> 
> All those licensing info should be explained in the commit log, please.
> 
>>> +LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3) += ipu3
>>> +ifeq ($(BR2_PACKAGE_LIBCAMERA_PIPELINE_RASPBERRYPI),y)
>>> +LIBCAMERA_PIPELINES-y += raspberrypi
>>> +LIBCAMERA_DEPENDENCIES += boost
>>> +endif
>>> +LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1) += rkisp1
>>> +LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_SIMPLE) += simple
>>> +LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_UVCVIDEO) += uvcvideo
>>> +LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_VIMC) += vimc
>>> +
>>> +LIBCAMERA_CONF_OPTS += -Dpipelines=$(subst $(space),$(comma),$(LIBCAMERA_PIPELINES-y))
>>> +
>>> +# gstreamer-video-1.0, gstreamer-allocators-1.0
>>> +ifeq ($(BR2_PACKAGE_GSTREAMER1)$(BR2_PACKAGE_GST1_PLUGINS_BASE),yy)
>>> +LIBCAMERA_CONF_OPTS += -Dgstreamer=enabled
>>> +LIBCAMERA_DEPENDENCIES += gstreamer1 gst1-plugins-base
>>> +endif
>>> +
>>> +ifeq ($(BR2_PACKAGE_QT5BASE)$(BR2_PACKAGE_QT5BASE_GUI)$(BR2_PACKAGE_QT5BASE_WIDGETS),yyy)
>>> +LIBCAMERA_DEPENDENCIES += qt5base
>>> +ifeq ($(BR2_PACKAGE_QT5TOOLS)$(BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS),yy)
> 
> BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS is already a sub-option of BR2_PACKAGE_QT5TOOLS,
> so the former can't be enabled if the latter is not. Thus, the following
> condition is enough:
> 
>     ifeq ($(BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS),y)
> 
>>> +LIBCAMERA_DEPENDENCIES += qt5tools
>>> +endif
>>> +endif
>>> +
>>> +ifeq ($(BR2_PACKAGE_TIFF),y)
>>> +LIBCAMERA_DEPENDENCIES += tiff
>>> +endif
>>> +
>>> +ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
>>> +LIBCAMERA_DEPENDENCIES += udev
>>> +endif
> 
> Are there any option to explicitly drive the enabling or disabling of
> those two dependencies (tiff and udev)?


No, udev is enabled in libcamera if it is found at build time, otherwise
we fall back to sysfs enumeration (which is not quite so good, and I
fear less tested :S ).

If libtiff is not found, then RAW DNG support will be disabled in the
qcam test application, but the application will still function without it.



> Regards,
> Yann E. MORIN.
> 
>>>  $(eval $(meson-package))
>>>
>>
>> -- 
>> Regards
>> --
>> Kieran
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
> 

-- 
Regards
--
Kieran
