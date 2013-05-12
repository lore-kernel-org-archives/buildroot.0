From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 12 May 2013 20:43:49 +0200
Subject: [Buildroot] [PATCH] Add package gpu-viv-bin-mx6q to the
 freescale-imx directory
In-Reply-To: <20130511122006.694f3942@skate>
References: <1368129212-4892-1-git-send-email-h.fijnvandraat@inter.nl.net>
 <1368129212-4892-2-git-send-email-h.fijnvandraat@inter.nl.net>
 <20130511122006.694f3942@skate>
Message-ID: <518FE2E5.60904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/05/13 12:20, Thomas Petazzoni wrote:
> Dear Henk Fijnvandraat,
>
> Arnout made some good comments, I have a few others below.
>
> On Thu,  9 May 2013 21:53:32 +0200, Henk Fijnvandraat wrote:
[snip]
>> +# The archive is a shell-self-extractor of a bzipped tar. It happens
>> +# to extract in the correct directory (gpu-viv-bin-mx6q-x.y.z)
>> +# The --force makes sure it doesn't fail if the source dir already exists.
>> +# The --auto-accept skips the license check - not needed for us
>> +# because we have legal-info.
>> +define GPU_VIV_BIN_MX6Q_EXTRACT_CMDS
>> +	cd $(BUILD_DIR); \
>> +	sh $(DL_DIR)/$(GPU_VIV_BIN_MX6Q_SOURCE) --force --auto-accept
>> +endef
>
> I think we generally prefer to have the entire command executed in a
> sub-shell, i.e:
>
> 	(cd $(BUILD_DIR); \
> 	 sh $(DL_DIR)/$(GPU_VIV_BIN_MX6Q_SOURCE) --force --auto-accept)

  Begging to differ here... I don't see much point of having three levels 
of shells. make already starts a shell, then we start another shell to 
run the extractor script. The third level added by the () looks pretty 
redundant to me.


> Also, what guarantees us that it will actually be extracted to the
> right subfilter in $(BUILD_DIR) ?

  Well, that's mentioned in the comment above :-). If it would be 
extracted into a different directory, the only option would be to rename 
it - but you still need to know the name of the directory in which it is 
extracted by the extractor script.


>> +define GPU_VIV_BIN_MX6Q_INSTALL_STAGING_CMDS
>> +	cp -r $(@D)/usr/* $(STAGING_DIR)/usr
>> +endef
>> +
>> +ifdef $(BR2_PACKAGE_GPU_VIV_BIN_IMX6Q_EXAMPLES)
>> +define GPU_VIV_BIN_MX6Q_INSTALL_EXAMPLES
>> +	cp -r $(@D)/opt/* $(TARGET_DIR)/opt
>> +endef
>> +endif
>
> Maybe usr/share/gpu-viv-imx6q/examples/ is a better location than opt/ ?

  Agreed, except that normally the share/ directory contains 
platform-independent things like man pages, while the examples are all 
binaries.


> Also, the installation steps should be after the build steps. It
> doesn't change anything from a functional point of view, but it's the
> way we write all packages, just because it is more logical.
>
>> +ifeq ($(BR2_PACKAGE_XORG7),y)
>> +GPU_VIV_BIN_MX6Q_LIB_TARGET = x11
>> +else
>> +# DirectFB is not supported (wrong version)
>> +GPU_VIV_BIN_MX6Q_LIB_TARGET = fb
>> +endif
>
> Hum, so if X.org is not selected, this package installs something that
> doesn't work? Seems strange.

  Comment could be better: directfb (called dfb by this package) doesn't 
work, but fb (= linux framebuffer without windowing layer) works.


> Also, I see that this installs EGL libraries, I thought EGL was here to
> allow the creation of OpenGL contexts when there is no windowing system
> such as X.org. For example, with the Rasberry Pi libraries, you can
> have EGL+OpenGL and Qt running on top of it, without DirectFB or X.org.
> Isn't that also possible here?
>
> Are you sure that the "fb" target actually requires DirectFB ?
>
>> +# Instead of building, we fix up the inconsistencies that exist
>> +# in the upstream archive here.
>> +# Make sure these commands are idempotent.
>> +define GPU_VIV_BIN_MX6Q_BUILD_CMDS
>> +	$(SED) 's/defined(LINUX)/defined(__linux__)/g' $(@D)/usr/include/*/*.h
>> +	for lib in EGL GAL VIVANTE; do \
>> +		ln -sf lib$${lib}-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so \
>> +			$(@D)/usr/lib/lib$${lib}.so; \
>> +	done
>> +	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so.1
>> +	ln -sf libGL.so.1.2 $(@D)/usr/lib/libGL.so
>> +endef
>> +
>> +# On the target, remove the unused libraries.
>> +# Note that this is _required_, else ldconfig may create symlinks
>> +# to the wrong library
>> +define GPU_VIV_BIN_MX6Q_INSTALL_TARGET_CMDS
>> +	$(GPU_VIV_BIN_MX6Q_INSTALL_EXAMPLES)
>> +	cp -a $(@D)/usr/lib $(TARGET_DIR)/usr
>> +	for lib in EGL GAL VIVANTE; do \
>> +		for f in $(TARGET_DIR)/usr/lib/lib$${lib}-*.so; do \
>> +			case $$f in \
>> +				*-$(GPU_VIV_BIN_MX6Q_LIB_TARGET).so) : ;; \
>> +				*) $(RM) $$f ;; \
>> +			esac; \
>> +		done; \
>> +	done
>
> Isn't it either to only copy the relevant libraries instead of copying
> everything, and then remove everything that's not useful?

  There are 16 libraries to install, so it makes sense to use a wildcard. 
And I couldn't find a glob pattern that excludes the -x11 and -dfb files. 
So removing them was easier.

[In case it wasn't clear: Henk and I collaborated on this patch]

  Regards,
  Arnout

>
> Thanks!
>
> Thomas
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
