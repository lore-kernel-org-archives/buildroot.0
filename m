From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 May 2018 22:30:50 +0200
Subject: [Buildroot] [PATCH] package/ncurses: enable widechar for host
 build
In-Reply-To: <20180508153139.0d807f82@windsurf.home>
References: <20180426190845.21415-1-arnout@mind.be>
 <20180503075808.26367-1-arnout@mind.be> <20180503194507.GB2453@scaer>
 <20180508153139.0d807f82@windsurf.home>
Message-ID: <076570fa-ba56-34bc-7b71-3fa726e81e75@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-05-18 15:31, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 3 May 2018 21:45:07 +0200, Yann E. MORIN wrote:
> 
>> What about overriding HOSTCC when calling linux-menuconfig:
>>
>>     diff --git a/linux/linux.mk b/linux/linux.mk
>>     index 9e646baffc..75a256ff9e 100644
>>     --- a/linux/linux.mk
>>     +++ b/linux/linux.mk
>>     @@ -235,7 +235,7 @@ LINUX_KCONFIG_FILE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE))
>>      endif
>>      LINUX_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES))
>>      LINUX_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
>>     -LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS)
>>     +LINUX_KCONFIG_OPTS = $(LINUX_MAKE_FLAGS) HOSTCC="$(HOSTCC)"
>>      
>>      # If no package has yet set it, set it from the Kconfig option
>>      LINUX_NEEDS_MODULES ?= $(BR2_LINUX_NEEDS_MODULES)
>>
>> We should not need any library from HOST_DIR when we run menuconfig.
>>
>> Note: we may still want to enable widechar in host-ncurses for other
>> reasons, though. But with the proposdal above, there is no lopnger any
>> mix of system ncurses vs our own.
> 
> Arnout, any comment on Yann's proposal? I have to say my preference
> goes to Yann's solution, as it's the one that ensures there is no
> mixing of ncurses between the one we build in HOST_DIR and the one
> provided by the system.

 As noted in another thread, the same problem might occur for another package.
Basically, kconfig will fail if we pass the normal HOST_CONFIGURE_OPTS. But I
guess it's not likely that we ever have a package that does that, since kconfig
packages are normally target packages, and kconfig doesn't listen to
CFLAGS_FOR_BUILD/LDFLAGS_FOR_BUILD.

 So OK, Yann, can you prepare a patch? I've marked this patch as Rejected.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
