From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Aug 2017 22:28:08 +0200
Subject: [Buildroot] [PATCH] pppd: Do not overwrite /etc/resolv.conf
In-Reply-To: <20170828155604.24229-1-jer@airfi.aero>
References: <20170828155604.24229-1-jer@airfi.aero>
Message-ID: <140e8e93-df14-fea5-ada5-4e1aa4636f94@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-08-17 17:56, Jeroen Roovers wrote:
> With option usepeerdns, pppd by default writes to /etc/ppp/resolv.conf,
> which is not very useful and might be impossible. However, when more
> than one interface can be used for DNS resolution, pppd will overwrite
> any existing entries when /etc/resolv.conf is used instead, which is
> bad. 

 I agree that this is bad.

> Fix this by setting the path to a place we assume is always
> writeable, /tmp/ppp-resolv.conf, and which does not interfere with other
> mechanisms that write DNS resolver configurations.

 However, this is a regression. People who currently have ppp as their only
interface, or who never have ppp and ethernet running at the same time,
currently have a fully working solution. With this change, DNS doesn't work
anymore over ppp unless you add some script to merge /tmp/ppp-resolv.conf with
/tmp/resolv.conf

 So I think this patch should be combined with a /etc/ppp/ip-up (and ip-down)
script that updates /etc/resolv.conf, similar like how udhcpc.script does it.

 I guess you must have something like that anyway, otherwise you would never
have DNS over ppp, right?

 Regards,
 Arnout

> ---
>  package/pppd/pppd.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pppd/pppd.mk b/package/pppd/pppd.mk
> index 6139c5b085..47937730d5 100644
> --- a/package/pppd/pppd.mk
> +++ b/package/pppd/pppd.mk
> @@ -36,10 +36,10 @@ PPPD_POST_EXTRACT_HOOKS += PPPD_DROP_INTERNAL_IF_PPOL2TP_H
>  
>  # pppd defaults to /etc/ppp/resolv.conf, which not be writable and is
>  # definitely not useful since the C library only uses
> -# /etc/resolv.conf. Therefore, we change pppd to use /etc/resolv.conf
> +# /etc/resolv.conf. Therefore, we change pppd to use /tmp/ppp-resolv.conf
>  # instead.
>  define PPPD_SET_RESOLV_CONF
> -	$(SED) 's,ppp/resolv.conf,resolv.conf,' $(@D)/pppd/pathnames.h
> +	$(SED) 's,/etc/ppp/resolv.conf,/tmp/ppp-resolv.conf,' $(@D)/pppd/pathnames.h
>  endef
>  PPPD_POST_EXTRACT_HOOKS += PPPD_SET_RESOLV_CONF
>  
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
