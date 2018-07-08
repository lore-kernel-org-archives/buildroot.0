From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 8 Jul 2018 12:34:11 +0200
Subject: [Buildroot] [PATCH 01/50 v2] package/busybox: update to 1.29.0
In-Reply-To: <a4758f31d7bbdee7569e4aa3582ec01ebfbb0954.1531043163.git.yann.morin.1998@free.fr>
References: <cover.1531043163.git.yann.morin.1998@free.fr>
 <a4758f31d7bbdee7569e4aa3582ec01ebfbb0954.1531043163.git.yann.morin.1998@free.fr>
Message-ID: <b368fbde-13f8-d0d6-5a3c-4b0040c71b4e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 08-07-18 11:45, Yann E. MORIN wrote:
> The two patches are still needed, with the second needing a slight
> refresh around the edge.

 Is the first one really needed? If it is, the patch description should be
updated, because since 4e8dadfe4b9c it no longer replaces net/if_packet.h with
linux/if_packet.h since upstream no longer includes net/if_packet.h.

 It would be nice if the two patches (if really needed) could be upstreamed.

> 
> Since upstream has now full support to perform a noclobber install, drop
> of our hook and use the new install rule.

 I've corrected this sentence and applied to master, thanks.

> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Baruch Siach <baruch@tkos.co.il>
> Cc: Matt Weber <matthew.weber@rockwellcollins.com>
> 
> ---
> Notes: Matt, I did not carry your reviewd-by tag, as the patch entirely
> changed since you reviewed it. Thanks for your initial review! :-)
> 
> ---
> Changes v1?-> v2;
>   - bump version now it is released  (Baruch)
> ---
[snip]
>  define BUSYBOX_INSTALL_TARGET_CMDS
> -	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) install
> +	# Use the 'noclobber' install rule, to prevent BusyBox from overwriting
> +	# any full-blown versions of apps installed by other packages.
> +	$(BUSYBOX_MAKE_ENV) $(MAKE) $(BUSYBOX_MAKE_OPTS) -C $(@D) install-noclobber

 Small nit: I don't like comments within _CMDS very much, because they will
appear in the output (they are interpreted as shell commands, and the shell just
happens to treat # lines as comments as well). So I generally prefer to have the
comments _before_ the define.

 But I've left it as is for now. It's no big deal.

 Regards,
 Arnout

>  	$(BUSYBOX_INSTALL_INITTAB)
>  	$(BUSYBOX_INSTALL_UDHCPC_SCRIPT)
>  	$(BUSYBOX_INSTALL_MDEV_CONF)
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
