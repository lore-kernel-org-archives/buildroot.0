From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Mon, 13 Feb 2012 09:13:24 +0100
Subject: [Buildroot] [PATCH 2/2] x-loader: add custom git and tarball
 support
In-Reply-To: <201202111555.13197.arnout@mind.be>
References: <1328799108-19521-1-git-send-email-yegorslists@googlemail.com>
 <1328799108-19521-2-git-send-email-yegorslists@googlemail.com>
 <201202111555.13197.arnout@mind.be>
Message-ID: <4F38C624.7020505@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 11.02.2012 15:55, schrieb Arnout Vandecappelle:
> On Thursday 09 February 2012 15:51:48 yegorslists at googlemail.com wrote:
>> From: Yegor Yefremov <yegorslists@googlemail.com>
> 
>  First some general remarks:
> 
> - Make sure that existing (def)configs keep working as expected.  So
> setting BR2_TARGET_XLOADER and BR2_TARGET_XLOADER_BOARDNAME should be
> enough to get a working xloader.
> 
> - Are there actual public xloader tarballs that you would use?  If the
> purpose is to avoid git clones from gitorious, it's better to use the 
> PRIMARY_SITE feature.  If the purpose is to use a locally modified
> version, it's better to use the _OVERRIDE_SRCDIR feature.  And if the
> purpose is to avoid requiring git access, it's better to change the
> XLOADER_SITE to http://gitorious.org/x-loader/x-loader/archive-tarball
> and XLOADER_SOURCE to v1.5.1 (this is a version bump as well, obviously).

I think we don't really need support for tarballs. I've just taken the u-boot approach.
 
>> +choice
>> +	prompt "X-loader Version"
>> +	default BR2_TARGET_XLOADER_CUSTOM_GIT
>> +	help
>> +	  Select the specific X-loader version you want to use
>> +
>> +config BR2_TARGET_XLOADER_CUSTOM_TARBALL
>> +	bool "Custom tarball"
>> +
>> +config BR2_TARGET_XLOADER_CUSTOM_GIT
>> +	bool "Custom Git repository"
> 
>  Since you have to choose one of the two, it's strange to call them
> "custom".  Also, git comes before tarball in the alphabet.

ACK
 
>  Perhaps the best option is to add 'v1.5.1' as one of the options,
> that also solves my issue with existing defconfigs no longer working.

ACK
 
> [snip]
>> +config BR2_TARGET_XLOADER_VERSION
>> +	string
>> +	default "custom"	if BR2_TARGET_XLOADER_CUSTOM_TARBALL
>> +	default $BR2_TARGET_XLOADER_CUSTOM_GIT_VERSION if BR2_TARGET_XLOADER_CUSTOM_GIT
> 
>  I didn't know that it worked with the $.  Is there a difference between
> with and without?  If not, Peter, do we have a preference?
> 
>> +
>> +config BR2_TARGET_XLOADER_CUSTOM_PATCH_DIR
>> +	string "Custom patch dir"
>> +	help
>> +	  If your board requires custom patches, add the path to the
>> +	  directory containing the patches here. The patches must be
>> +	  named xloader-<version>-<something>.patch.
> 
>  Leave the version out of the name.  Especially if <version> is a git
> sha, this becomes annoyingly long.

Oh yes, it is annoying.
 
>  At the developer day, we decided that internal patches normally have no
> version number, and that if one is required (because multiple versions of
> the package exist), each version will have a separate directory.  For 
> external patches, the same pattern should be allowed.

I support this decision.

>  The linux patches require linux-*.patch, u-boot currently requires the
> version number to be there (but that will change I guess).
> 
> 
>> +ifeq ($(XLOADER_VERSION),custom)
>  A git branch may be called 'custom', so this is no reliable way to detect
> git vs. tarball.  But you can simply put
> ifeq ($(BR2_TARGET_XLOADER_CUSTOM_TARBALL),y)
> 
>> +# Handle custom X-loader tarballs as specified by the configuration
>  This remark is redundant.

ACK

>> +XLOADER_TARBALL = $(call qstrip,$(BR2_TARGET_XLOADER_CUSTOM_TARBALL_LOCATION))
>> +XLOADER_SITE    = $(dir $(XLOADER_TARBALL))
>> +XLOADER_SOURCE  = $(notdir $(XLOADER_TARBALL))
>> +else
>> +XLOADER_SITE        = $(call qstrip,$(BR2_TARGET_XLOADER_CUSTOM_GIT_REPO_URL))
>> +XLOADER_SITE_METHOD = git
>> +endif
>> +
>> +ifneq ($(call qstrip,$(BR2_TARGET_XLOADER_CUSTOM_PATCH_DIR)),)
>> +define XLOADER_APPLY_CUSTOM_PATCHES
>> +	support/scripts/apply-patches.sh $(@D) $(BR2_TARGET_XLOADER_CUSTOM_PATCH_DIR) \
>> +		xloader-$(XLOADER_VERSION)-\*.patch
>> +endef
>> +
>> +XLOADER_POST_PATCH_HOOKS += XLOADER_APPLY_CUSTOM_PATCHES
>> +endif
>> +
>>  XLOADER_INSTALL_IMAGES = YES
>>  
>>  define XLOADER_BUILD_CMDS

I'm using am3517 based board and it's x-loader is still in arago repo. That's why I wanted to introduce alternative x-loader repo. But after getting feedback from Arago, I would postpone reworking this patch and trying to get x-loader upstream. With arago repo I still have a problem, that signPG is missing. Had made a patch to solve this, but getting am3517 upstream were the best solution.

Yegor
