From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 7 Jul 2015 01:18:51 +0200
Subject: [Buildroot] [PATCH v7 1/1] Added linux drivers backports project
In-Reply-To: <20150703223340.GK3652@free.fr>
References: <1435791533-25991-1-git-send-email-petr.vorel@gmail.com>
 <20150703223340.GK3652@free.fr>
Message-ID: <559B0CDB.7010600@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/04/15 00:33, Yann E. MORIN wrote:
> Petr, All,
> 
> On 2015-07-02 00:58 +0200, Petr Vorel spake thusly:
>> https://backports.wiki.kernel.org
>>
>> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
>> Cc: Arnout Vandecappelle <arnout@mind.be>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
> 
> Here's a quick and definitely not thourough review of this patch.

 Which means you can expect a few more iterations :-(

[snip]
>> +LINUX_BACKPORTS_DEPENDENCIES = linux
>> +# FIXME: does linux extracting, patching, but we need also linux to be configured.
>> +LINUX_BACKPORTS_PATCH_DEPENDENCIES = linux
> 
> You can drop the 'FIXME:' and just state:
> 
>     # We need linux to be extracted and patch first before we are patched,
>     # but we also need it to be built before we are configured, hence we do
>     # need both dependencies:
>     LINUX_BACKPORTS_PATCH_DEPENDENCIES = linux
>     LINUX_BACKPORTS_DEPENDENCIES = linux

 Actually, the _PATCH_DEPENDENCIES are not needed because of the explicit extra
dependency below. At least, I don't think the patching of backports requires
linux to be extracted and patched, right?

> 
>> +LINUX_BACKPORTS_MAKE_OPTS = \
>> +	$(LINUX_MAKE_FLAGS) \
>> +	KLIB_BUILD=$(LINUX_DIR) \
>> +	KLIB=$(TARGET_DIR)
>> +
>> +ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG),y)
>> +LINUX_BACKPORTS_SOURCE_CONFIG = $(LINUX_BACKPORTS_DIR)/defconfigs/$(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG))
> 
> Do not use $(LINUX_BACKPORTS_DIR) but use $(@D) instead.

 That's not possible, because it is used as the target of a rule in pkg-kconfig.mk.

> 
>> +else ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG),y)
>> +LINUX_BACKPORTS_SOURCE_CONFIG = $(BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE)
> 
> You need to qstrip that one as well.
> 
>> +endif
>> +
>> +# backports configure needs a configured kernel
>> +# FIXME: not used as we'd need to assign LINUX_BACKPORTS_SOURCE_CONFIG with :=,
>> +# but then we don't get $(LINUX_BACKPORTS_DIR) evaluated.
> 
> Would using $(@D) like I suggest above solve this issue?

 That would make the rule below expand to:

$(@D)/defconfigs/...: linux

and $(@D) is empty because we're not within a rule expansion. Same thing in the
dependency rules in pkg-kconfig.mk.

> 
>> +$(LINUX_BACKPORTS_SOURCE_CONFIG): linux

 The correct dependency is the one I added with my patch (but then expanded for
linux-backports):

$(LINUX_BACKPORTS_DIR)/.config: linux

 However, LINUX_BACKPORTS_DIR is not defined yet, so this rule should be added
at the end of the file, after $(eval $(kconfig-package)).

>> +
>> +define LINUX_BACKPORTS_BUILD_CMDS
>> +	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_BACKPORTS_MAKE_OPTS) -C $(@D)
> 
> Would it work if you were to write (note the added trailing 'modules'):
> 
>     $(TARGET_MAKE_ENV) $(MAKE) $(LINUX_BACKPORTS_MAKE_OPTS) \
>         -C $(@D) modules

 Don't you mean -C $(LINUX_DIR) M=$(@D) modules? That's what kernel-module would
add, right?

> 
> I ask, because I have a pending series that provides an infra for
> building kernel modules:
>     http://git.buildroot.org/~ymorin/git/buildroot/log/?h=yem/kernel-modules
> 
> and it looks like that would probably help you quite a lot here...
> 
> Also, you probably want to use $(LINUX_MAKE_ENV) instead of just
> $(TARGET_MAKE_ENV).
> 
>> +endef
>> +
>> +define LINUX_BACKPORTS_INSTALL_TARGET_CMDS
>> +	$(TARGET_MAKE_ENV) $(MAKE) $(LINUX_BACKPORTS_MAKE_OPTS) \
> 
> Ditto $(LINUX_MAKE_ENV).
> 
>> +		-C $(LINUX_DIR) M=$(@D) \
>> +		INSTALL_MOD_DIR=backports \
>> +		modules_install
>> +endef
>> +
>> +LINUX_BACKPORTS_KCONFIG_FILE = $(LINUX_BACKPORTS_SOURCE_CONFIG)
> 
> Why don't you directly assign to LINUX_BACKPORTS_KCONFIG_FILE without
> using the intermediate LINUX_BACKPORTS_SOURCE_CONFIG ?

 Because in linux.mk, barebox.mk and at91bootstrap3.mk these redundant
intermediate variables exist. They should be removed from there.


 Regards,
 Arnout


> 
>> +LINUX_BACKPORTS_KCONFIG_FRAGMENT_FILES = $(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_CONFIG_FRAGMENT_FILES))
>> +LINUX_BACKPORTS_KCONFIG_EDITORS = menuconfig xconfig gconfig nconfig
>> +LINUX_BACKPORTS_KCONFIG_OPTS = $(LINUX_BACKPORTS_MAKE_OPTS)
>> +
>> +$(eval $(kconfig-package))
>> +
>> +# Checks to give errors that the user can understand
>> +ifeq ($(filter source,$(MAKECMDGOALS)),)
> 
> We now have a variable that explicitly states whether we are building or
> not:
> 
>     ifeq ($(BR_BUILDING),y)
> 
>> +ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_DEFCONFIG),y)
>> +ifeq ($(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG)),)
>> +$(error No linux-backports defconfig name specified, check your BR2_PACKAGE_LINUX_BACKPORTS_DEFCONFIG setting)
>> +endif
>> +endif
>> +
>> +ifeq ($(BR2_PACKAGE_LINUX_BACKPORTS_USE_CUSTOM_CONFIG),y)
>> +ifeq ($(call qstrip,$(BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE)),)
>> +$(error No linux-backports configuration file specified, check your BR2_PACKAGE_LINUX_BACKPORTS_CUSTOM_CONFIG_FILE setting)
>> +endif
>> +endif
>> +
>> +endif
> 
> When nesting ifeq-blocks, we like having the endif statements remind to
> which ifeq they apply, like so:
> 
>     endif # BR_BUILDING
> 
> so the file stays readable.
> 
> Regards,
> Yann E. MORIN.
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
