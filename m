From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Dec 2018 20:48:42 +0100
Subject: [Buildroot] [PATCH v2 2/2] [RFC] package/pkg-waf.mk: mimic
 selection of host-waf
In-Reply-To: <443080149.125007180.1545408255922.JavaMail.zimbra@datacom.com.br>
References: <20181221002221.16024-1-casantos@datacom.com.br>
 <20181221002221.16024-2-casantos@datacom.com.br>
 <20181221163430.56a34588@windsurf>
 <443080149.125007180.1545408255922.JavaMail.zimbra@datacom.com.br>
Message-ID: <20181221204842.12bb0cb3@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Dec 2018 14:04:15 -0200 (BRST), Carlos Santos wrote:

> > I understand the idea that doing this avoids repeating a "select
> > BR2_PACKAGE_HOST_WAF" in all packages using host-waf. However, I don't
> > think we want to go down the route of setting those variables from the
> > make logic. I don't have a very strong argument to defend this
> > position, but to me it looks more logical that we continue to use
> > kconfig-level "select" to enable those config options.  
> 
> Thanks for reviewing this.
> 
> So we need to make mpv select BR2_PACKAGE_HOST_WAF, right?

Yes, all packages that set <pkg>_NEEDS_EXTERNAL_WAF would need to
select BR2_PACKAGE_HOST_WAF.

Long term, we would add a check like we have for the target packages
that verifies that if a target package is being built, its Config.in
option is enabled:

define CHECK_ONE_DEPENDENCY
ifeq ($$($(2)_TYPE),target)
ifeq ($$($(2)_IS_VIRTUAL),)
ifneq ($$($$($(2)_KCONFIG_VAR)),y)
$$(error $$($(2)_NAME) is in the dependency chain of $$($(1)_NAME) that \
has added it to its _DEPENDENCIES variable without selecting it or \
depending on it from Config.in)
endif
endif
endif
endef

$(foreach pkg,$(call UPPERCASE,$(PACKAGES)),\
        $(foreach dep,$(call UPPERCASE,$($(pkg)_FINAL_ALL_DEPENDENCIES)),\
                $(eval $(call CHECK_ONE_DEPENDENCY,$(pkg),$(dep))$(sep))))

endif

This will ensure that all host packages have a Config.in option, and
that it is properly selected in all situations. However, this obviously
requires that all host packages are converted, and all reverse
dependencies have the appropriate selects. This is going to take a long
time :-)

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
