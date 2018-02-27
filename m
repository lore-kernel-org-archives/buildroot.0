From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 27 Feb 2018 22:45:23 +0100
Subject: [Buildroot] [NEXT 03/26] cpe-info: id prefix/suffix
In-Reply-To: <1519697441-54194-4-git-send-email-matthew.weber@rockwellcollins.com>
References: <1519697441-54194-1-git-send-email-matthew.weber@rockwellcollins.com>
 <1519697441-54194-4-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20180227224523.002a9e52@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 26 Feb 2018 20:10:18 -0600, Matt Weber wrote:

> +ifeq ($(1),linux)
> +	$(2)_CPE_PREFIX = $(CPE_PREFIX_OS)
> +else ifeq ($(1),linux-headers)
> +	$(2)_CPE_PREFIX = $(CPE_PREFIX_OS)

You can also do:

ifneq ($(filter linux linux-headers,$(1)),)
$(2)_CPE_PREFIX = $(CPE_PREFIX_OS)
else
$(2)_CPE_PREFIX = $(CPE_PREFIX_APP)
endif

But OK, it's not a big difference :)

>  $(1)-cpe-info: PKG=$(2)
>  $(1)-cpe-info:
> @@ -837,9 +849,9 @@ ifneq ($$(call qstrip,$$($(2)_SOURCE)),)
>  ifeq ($$(call qstrip,$$($(2)_CPE_ID)),)
>  	$(Q)$$(call cpe-manifest,"unknown",$$($(2)_CVE_PATCHED),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_ACTUAL_SOURCE_SITE))
>  else
> -	$(Q)$$(foreach id,$$($(2)_CPE_ID),$$(call cpe-manifest,$$(id),$$($(2)_CVE_PATCHED),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_ACTUAL_SOURCE_SITE))$$(sep))
> -endif
> -endif
> +	$(Q)$$(foreach id,$$($(2)_CPE_ID),$$(call cpe-manifest,$$($(2)_CPE_PREFIX):$$(id):$(CPE_SUFFIX),$$($(2)_CVE_PATCHED),$$($(2)_RAWNAME),$$($(2)_VERSION),$$($(2)_ACTUAL_SOURCE_SITE))$$(sep))
> +endif # ifeq ($$(call qstrip,$$($(2)_CPE_ID)),)
> +endif # ifneq ($$(call qstrip,$$($(2)_SOURCE)),)

These two comments after the endif's are good, but should have been
part of a previous commit, which was adding the endif's.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
http://bootlin.com
