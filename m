From: Denis OSTERLAND <denis.osterland@diehl.com>
Date: Tue, 9 Oct 2018 07:07:36 +0000
Subject: [Buildroot] [PATCH] u-boot: add option to generate env image
 from default env
In-Reply-To: <16db145d-edf3-787d-bb3c-3a50c340eb1c@mind.be>
References: <20181002053526.11374-1-Denis.Osterland@diehl.com>
 <16db145d-edf3-787d-bb3c-3a50c340eb1c@mind.be>
Message-ID: <1539068855.6269.16.camel@diehl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

thanks for the review.
Am Montag, den 08.10.2018, 19:33 +0200 schrieb Arnout Vandecappelle:
> > ?
> > +choice
> > +	prompt "source"
> ?It's not immediately obvious that this is the source of the envimage, so better
> "Source for environment".
clear
> 
> > 
> > +
> > +config BR2_TARGET_UBOOT_ENVIMAGE_TEXTFILE
> ?I would call this BR2_TARGET_UBOOT_ENVIMAGE_CUSTOM to be consistent with the
> other uses of custom config files. However, see below.
> 
> > 
> > +	bool "text file"
> ?Here as well: "custom".
okay
> 
> > 
> > +
> > +config BR2_TARGET_UBOOT_ENVIMAGE_BUIILTIN
> ?and here _DEFAULT
> 
> > 
> > +	bool "compiled in"
> ?and "default".
okay
> 
> > 
> > +	help
> > +	??Use the default env from u-boot image.
> > +	??requires >= v2018.03
> > +
> > +endchoice # source
> > +
> > ?config BR2_TARGET_UBOOT_ENVIMAGE_SOURCE
> > ?	string "Source files for environment"
> > +	depends on BR2_TARGET_UBOOT_ENVIMAGE_TEXTFILE
> ?However, I think it would be simpler to just allow this option to be empty. In
> other words, remove the choice, and add something like the following at the end
> of the help text:
> 
> 	??For U-Boot >= v2018.03, it is possible to leave this empty. In that
> 	??case, the default environment for the target configuration will be
> 	??used.
> 
> ?This is just an idea, if you don't like it, feel free to keep the current solution.
Well, I thought about it.
contra:
?- adds additional configuration switches
pro:
?- clear on first look (not required to read help first)
?- easier to extend (add other sources in future)
?- keeps current behavior (failed to build, if only BR2_TARGET_UBOOT_ENVIMAGE is selected)

I think it is not very likely that other sources were implemented.
Maybe it would be nice to just tick BR2_TARGET_UBOOT_ENVIMAGE and
empty default of SOURCE will lead to default env.

What do you think?
> 
> 
> > 
> > ?	help
> > ?	??Text files describing the environment. Files should have
> > ?	??lines of the form var=value, one per line. Blank lines and
> > diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
> > index c5abc125f3..ae9e38c8c2 100644
> > --- a/boot/uboot/uboot.mk
> > +++ b/boot/uboot/uboot.mk
> > @@ -263,7 +263,9 @@ endef
> > ?
> > ?ifneq ($(BR2_TARGET_UBOOT_ENVIMAGE),)
> > ?define UBOOT_GENERATE_ENV_IMAGE
> > -	cat $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)) \
> > +	$(if $(BR2_TARGET_UBOOT_ENVIMAGE_BUIILTIN), \
> ?With the choice removed, this test could be:
> 
> 	$(if $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)),
> 
> but then it is better to factor it out in a separate variable, e.g.
> UBOOT_GENERATE_ENV_FILE, that is protected by an ifdef.
indeed
> 
> > 
> > +	CROSS_COMPILE="$(TARGET_CROSS)" $(@D)/scripts/get_default_envs.sh $(@D), \
> > +	cat $(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE))) \
> > ?		>$(@D)/buildroot-env.txt
> > ?	$(HOST_DIR)/bin/mkenvimage -s $(BR2_TARGET_UBOOT_ENVIMAGE_SIZE) \
> > ?		$(if $(BR2_TARGET_UBOOT_ENVIMAGE_REDUNDANT),-r) \
> > @@ -376,9 +378,11 @@ endef
> > ?
> > ?ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE),y)
> > ?ifeq ($(BR_BUILDING),y)
> > +ifeq ($(BR2_TARGET_UBOOT_ENVIMAGE_TEXTFILE),y)
> > ?ifeq ($(call qstrip,$(BR2_TARGET_UBOOT_ENVIMAGE_SOURCE)),)
> > ?$(error Please define a source file for Uboot environment (BR2_TARGET_UBOOT_ENVIMAGE_SOURCE setting))
> > ?endif
> > +endif
> ?With the choice removed, this entire condition+error would just be removed.
remove code is always nice ;-)
> 
> ?Regards,
> ?Arnout
Regards Denis

Diehl Connectivity Solutions GmbH
Gesch?ftsf?hrung: Horst Leonberger
Sitz der Gesellschaft: N?rnberg - Registergericht: Amtsgericht
N?rnberg: HRB 32315
___________________________________________________________________________________________________

Der Inhalt der vorstehenden E-Mail ist nicht rechtlich bindend. Diese E-Mail enthaelt vertrauliche und/oder rechtlich geschuetzte Informationen.
Informieren Sie uns bitte, wenn Sie diese E-Mail faelschlicherweise erhalten haben. Bitte loeschen Sie in diesem Fall die Nachricht.
Jede unerlaubte Form der Reproduktion, Bekanntgabe, Aenderung, Verteilung und/oder Publikation dieser E-Mail ist strengstens untersagt.
The contents of the above mentioned e-mail is not legally binding. This e-mail contains confidential and/or legally protected information. Please inform us if you have received this e-mail by
mistake and delete it in such a case. Each unauthorized reproduction, disclosure, alteration, distribution and/or publication of this e-mail is strictly prohibited. 
