From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Jul 2017 16:34:53 +0200
Subject: [Buildroot] [PATCH v6 10/10] package/qt5base: provide "qt.conf"
 to make "qmake" relocatable
In-Reply-To: <51297962-b3bc-bd68-8dee-3a1ad8ca92ae@grandegger.com>
References: <1499185359-8293-1-git-send-email-wg@grandegger.com>
 <1499185359-8293-11-git-send-email-wg@grandegger.com>
 <ccd502d6-648b-7a9d-1d64-6e14eb90196f@mind.be>
 <a3612c93-7e2a-f2e0-0fbd-9d93bd4e759a@grandegger.com>
 <57657dbc-eca2-a352-ae7c-902a01c9ce73@grandegger.com>
 <51297962-b3bc-bd68-8dee-3a1ad8ca92ae@grandegger.com>
Message-ID: <24dc9c2a-ac2a-b11f-320c-ec9c8fca5bfd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-07-17 15:48, Wolfgang Grandegger wrote:
> Hello,
> 
> Am 05.07.2017 um 12:28 schrieb Wolfgang Grandegger:
>> Am 05.07.2017 um 11:30 schrieb Wolfgang Grandegger:
>>> Hello Arnout,
>>>
>>> Am 05.07.2017 um 10:59 schrieb Arnout Vandecappelle:
>>>>    Hi Wolfgang,
>>>>
>>>> On 04-07-17 18:22, Wolfgang Grandegger wrote:
>>>>> The file "qt.conf" can be used to override the hard-coded paths that are
>>>>> compiled into the Qt library. We need it to make "qmake" relocatable.
>>>>
>>>>    All qt5 packages are failing because of this, e.g.
>>>> http://autobuild.buildroot.net/results/33e/33eb7b7ef7d232bed2432d1d44fd80a4fc8c4e2d
>>>>
>>>>
>>>> qt5serialport: installs files in
>>>> /accts/mlweber1/instance-2/output/host/usr/x86_64-buildroot-linux-uclibc/sysroot//accts/mlweber1/instance-2/output
>>>>
>>>>
>>>>
>>>>    Can you have a look?
>>>
>>> I know the problem! The patched used an old version (from an old series)
>>> of "qt.conf.in"..., sorry!
>>
>> The patch is reverted now. So just for the records, the patch below
>> fixes the problem. I'm going to provide a proper patch with my next
>> series. This also shows, that if "qt.conf" is in place, it's active and
>> will always overwrite the pathes compiled into qmake... which will break
>> the idea of "make sdk" somehow.
> 
> What about making the relocation stuff configurable as shown in the patch below.
> The advantage is that it could also control the generation of the "qt.conf",
> for example.

 I don't really think this is worth it. Much simpler to always have the
possibility to sdk-ize it by running 'make sdk'.

> 
> Wolfgang.
> 
>>From 43ef9954f1b5b92e97b5774081a263f2ce068c5f Mon Sep 17 00:00:00 2001
> From: Wolfgang Grandegger <wg@grandegger.com>
> Date: Wed, 5 Jul 2017 15:36:21 +0200
> Subject: [RFC PATCH] core: add config option to make SDK (host dir) relocatable
> 
> ---
>  Config.in | 18 ++++++++++++++++++
>  Makefile  |  5 +++++
>  2 files changed, 23 insertions(+)
> 
> diff --git a/Config.in b/Config.in
> index 72ceadf..57f899c 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -721,6 +721,24 @@ config BR2_REPRODUCIBLE
>  	  This is labeled as an experimental feature, as not all
>  	  packages behave properly to ensure reproducibility.
>  
> +config BR2_RELOCATABLE
> +	bool "Make a relocatable SDK (experimental)"
> +	help
> +	  This option will build a relocatable SDK (host dir). That
> +	  is the directory to store all the binary files that are
> +	  built for the host but also the cross compilation toolchain
> +	  when building the internal buildroot toolchain. It also
> +	  includes the "sysroot" tree required for cross compilation.
> +	  The relocatable host directory can then be moved to a new
> +	  location as shown below:
> +
> +	    $ cd <buildroot-build-directory>
> +	    $ cp -r host <the-new-directory>/sdk
> +	    $ <the-new-directory>/sdk/relocate-sdk.sh
> +
> +	  After executing the script "relocate-sdk.sh" once, it can
> +	  be used for external builds.

 This text is very useful but should be in the manual instead.

> +
>  endmenu
>  
>  endmenu
> diff --git a/Makefile b/Makefile
> index 57191d1..962f80a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -460,6 +460,7 @@ endif
>  # these locations, so export them so it is easier to use
>  export BR2_CONFIG
>  export BR2_REPRODUCIBLE
> +export BR2_RELOCATABLE
>  export TARGET_DIR
>  export STAGING_DIR
>  export HOST_DIR
> @@ -554,10 +555,12 @@ world: target-post-image host-finalize
>  
>  .PHONY: host-finalize
>  host-finalize:

 Make this 'sdk' instead of host-finalize, and add it to help: as well.

> +ifeq ($(BR2_RELOCATABLE),y)
>  	@$(call MESSAGE,"Rendering the SDK relocatable")
>  	$(TOPDIR)/support/scripts/fix-rpath host
>  	install $(TOPDIR)/support/misc/relocate-sdk.sh $(HOST_DIR)
>  	echo $(HOST_DIR) > $(HOST_DIR)/share/buildroot/sdk-location
> +endif
>  
>  # We need patchelf for RPATH sanitization
>  PACKAGES += host-patchelf
> @@ -730,10 +733,12 @@ endif
>  		$(call MESSAGE,"Executing post-build script $(s)"); \
>  		$(EXTRA_ENV) $(s) $(TARGET_DIR) $(call qstrip,$(BR2_ROOTFS_POST_SCRIPT_ARGS))$(sep))
>  
> +ifeq ($(BR2_RELOCATABLE),y)
>  	@$(call MESSAGE,"Sanitizing RPATH in staging tree")
>  	$(TOPDIR)/support/scripts/fix-rpath staging
>  	@$(call MESSAGE,"Sanitizing RPATH in target tree")
>  	$(TOPDIR)/support/scripts/fix-rpath target

 This has nothing to do with making it relocatable, it is always necessary to
sanitize the rpaths in target. Well, it's not really necessary, things work as
they are now, but it would be an improvement.


 Regards,
 Arnout


> +endif
>  
>  .PHONY: target-post-image
>  target-post-image: $(TARGETS_ROOTFS) target-finalize
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
