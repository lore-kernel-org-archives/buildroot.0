From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Apr 2016 23:56:34 +0200
Subject: [Buildroot] [PATCH v12 02/31] package/freeswitch: enable
 optional modules
In-Reply-To: <1460281299-2385-3-git-send-email-bernd.kuhls@t-online.de>
References: <1460281299-2385-1-git-send-email-bernd.kuhls@t-online.de>
 <1460281299-2385-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <570EC092.30702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/10/16 11:41, Bernd Kuhls wrote:
> All these modules have no external dependencies.
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>   package/freeswitch/freeswitch.mk | 76 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 76 insertions(+)
>
> diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
> index 69a7ee2..f1903c1 100644
> --- a/package/freeswitch/freeswitch.mk
> +++ b/package/freeswitch/freeswitch.mk
[snip]
> +define FREESWITCH_ENABLE_MODULE # (option, file)
> +	echo '$(1)' >> $(2)
> +endef
> +
> +define FREESWITCH_ENABLE_MODULES
> +	$(foreach mod,$(FREESWITCH_ENABLED_MODULES),\
> +		$(call FREESWITCH_ENABLE_MODULE,$(mod),$(@D)/modules.conf)$(sep))

  I don't particularly like this way of doing it. AFAICS you only have enabled 
modules, so you could just do:

	$(Q)echo $(FREESWITCH_ENABLED_MODULES) \
		| tr ' ' '\n' \
		> $(@D)/modules.conf

  (and then you can remove the reset modules hook).

  Regards,
  Arnout

> +endef
> +
> +FREESWITCH_PRE_CONFIGURE_HOOKS += FREESWITCH_ENABLE_MODULES
> +
>   $(eval $(autotools-package))
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
