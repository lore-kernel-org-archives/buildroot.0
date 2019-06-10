From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Jun 2019 15:45:53 +0200
Subject: [Buildroot] [PATCH 1/1] iputils: set the permissions with
 IPUTILS_PERMISSIONS
In-Reply-To: <20190609230702.7068-1-petr.vorel@gmail.com>
References: <20190609230702.7068-1-petr.vorel@gmail.com>
Message-ID: <4bdc9d15-b7c2-3b46-bdda-306147fa8d94@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 10/06/2019 01:07, Petr Vorel wrote:
> for arping, clockdiff and ping. These require root permission for
> socket(). Upstream solution (script setcap-setuid.sh) requires
> setcap binary on the host and cap_net_raw+ep + libcap or setting
> setuid root executable which is dangerous).
> 
> This restores behavior used for version s20180629 (which was used
> for ping and traceroute6, but we don't build traceroute6 since s20190515).
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

 Applied to master, thanks. I updated the commit message a little.



> ---
> Hi,
> 
> it'd be great also create symlink ping -> ping6, but don't know how.

 This can be done with a post-install hook.

 Also, the bump to s20190515 should not have removed the traceroute6 program.
Could you make a second patch that adds it back?

 Regards,
 Arnout

> 
> Kind regards,
> Petr
> ---
>  package/iputils/iputils.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/iputils/iputils.mk b/package/iputils/iputils.mk
> index d9a51ece2a..8be54b4788 100644
> --- a/package/iputils/iputils.mk
> +++ b/package/iputils/iputils.mk
> @@ -52,4 +52,12 @@ endif
>  # XSL Stylesheets for DocBook 5 not packaged for buildroot
>  IPUTILS_CONF_OPTS += -DBUILD_MANS=false -DBUILD_HTML_MANS=false
>  
> +# handle permissions ourselves
> +IPUTILS_CONF_OPTS += -DNO_SETCAP_OR_SUID=true
> +define IPUTILS_PERMISSIONS
> +	/bin/arping      f 4755 0 0 - - - - -
> +	/bin/clockdiff   f 4755 0 0 - - - - -
> +	/bin/ping        f 4755 0 0 - - - - -
> +endef
> +
>  $(eval $(meson-package))
> 
