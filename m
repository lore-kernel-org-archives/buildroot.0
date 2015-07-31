From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 31 Jul 2015 23:33:46 +0200
Subject: [Buildroot] [PATCH v7 1/1] package/swupdate: new package
In-Reply-To: <1438373661.26917.11.camel@embedded.rocks>
References: <1437160940-11930-1-git-send-email-joerg.krause@embedded.rocks>
 <55B7B009.1080202@openwide.fr> <1438373661.26917.11.camel@embedded.rocks>
Message-ID: <55BBE9BA.1060603@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi J?rg,

Le 31/07/2015 22:14, J?rg Krause a ?crit :
> On Di, 2015-07-28 at 18:38 +0200, Romain Naour wrote:
>> Hi J?rg,
> 
> [snip]
> 
>> Can you check for toolchain dependencies ?
>>
>> swupdate seems depends on BR2_TOOLCHAIN_HAS_THREADS since pthread functions are
>> used all over the place.
>>
>> Also, when mongoose web server is enable swupdate must also depends 
>> on BR2_USE_MMU.
>> I don't know if swupdate can really be used in a mmu less system, so 
>> it's ok if
>> swupdate depends on BR2_USE_MMU even when mongoose support is 
>> disabled.
> 
> You're right! I'll add those dependencies.
> 
> [snip]
> 
> 
>> Some days after your sent this patch, the 2015.07 release has been 
>> tagged in the
>> repository. It's only 3 commits after this one.
> 
> I'll update to this version.
> 
> [snip]
> 
>> It not obvious that you must enable CONFIG_DOWNLOAD in 
>> swupdate
>> config to use
>> libcurl. I don't know how to express this dependency, so a comment is 
>> welcome here.
> 
> Actually, you've to select libcurl first to be able to enable
> CONFIG_DOWNLOAD. A comment about this is in the help text.

Ha, ok. I missed it ;-)

> 
>> Have you tried to use $(call 
>> KCONFIG_ENABLE_OPT,CONFIG_DOWNLOAD,$(@D)/.config)
>> in KCONFIG_FIXUP_CMDS ?
> 
> I followed Arnouts suggestion [1] to remove all the user options that
> update the .config file as the user can just make swupdate-menuconfig.
> The help text tells the user which other packages may be of interest.

IIUC, the swupdate-menuconfig will not display some options if corresponding
dependencies are not meet. This is great!

But what do you think about a comment in the swupdate Kconfig ?
Something like (untested):

config DOWNLOAD
	bool "Enable image downloading"
	default n
	depends on HAVE_LIBCURL
	help
	  Enable update from image URL using libcurl. Files are downloaded
	  completely before installation begins.

comment "image downloading needs libcurl"
	depends on !HAVE_LIBCURL

> 
>> Sorry for the late review.
> 
> Never mind! Thanks for the review!

You're welcome!

I'll review your new patch.

Best regards,
Romain

> 
> [1]
> http://patchwork.ozlabs.org/patch/451763/
> 
