From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 18 Feb 2013 16:33:41 +0100
Subject: [Buildroot] multchoice menu with kconfig
In-Reply-To: <5122315C.3070806@petroprogram.com>
References: <5122315C.3070806@petroprogram.com>
Message-ID: <512249D5.5020107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/02/13 14:49, Stefan Fr?berg wrote:
> Could someone show me how to make a multi-choice menu with kconfig
> language with the ability to select
> several menu entries and then storing those values as a space separated
> string variable.
>
> Let's say I have the following locales:
>
> af
> ak
> ar
> as
> ast
> etc .... bazillion other locale values
>
> and I would like to be able to select as many of those locales I want.
> Let's say I select locales "ak" and "ast" and then store them in a
> variable like BR2_PACKAGE_FOO_LOCALES so that it would look like
>
> BR2_PACKAGE_FOO_LOCALES = "ak ast"
>
> how to do that in the least amount of typing ?

  I don't think that's possible. You have no other option than to make a 
bunch of bool options, and convert them to strings in the .mk file.

Config.in:
config BR2_PACKAGE_FOO_LOCALE_AF
	bool "af"

config BR2_PACKAGE_FOO_LOCALE_AK
	bool "ak"

foo.mk:
FOO_LOCALE += $(if $(BR2_PACKAGE_FOO_LOCALE_AF),af)
FOO_LOCALE += $(if $(BR2_PACKAGE_FOO_LOCALE_AK),ak)


  Obviously you could write a script to generate all this. But I doubt we 
want to have it in the first place. In particular for locales, the 
BR2_ENABLE_LOCALE_WHITELIST fits our needs. And having a list of locales 
as a string isn't too user-unfriendly.

  If this is for the iso-codes package: the locales stuff is already 
covered by the generic options. I don't know what Thomas was going on 
about, because most of the 14MB gets removed again in the finalize step...

  The only thing that perhaps could be made optional is the installation 
of the xml files.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
