From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 26 Aug 2014 12:51:43 +0100
Subject: [Buildroot] [PATCH] libev: don't install event.h
In-Reply-To: <1409052977-12935-1-git-send-email-gustavo@zacarias.com.ar>
References: <1409052977-12935-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <53FC74CF.5050608@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/26/2014 12:36 PM, Gustavo Zacarias wrote:
> It's a 'compatibility layer' with libevent which we:
> 1) Don't need
> 2) Possibly outdated with respect to libevent2
> 3) Causes build failures
>
> Fixes:
> http://autobuild.buildroot.net/results/451/4510fe02ef3497803ed27bf339dca07b3b073c10/
>
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> ---
>   package/libev/libev.mk | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/package/libev/libev.mk b/package/libev/libev.mk
> index a6ff3a9..dc42858 100644
> --- a/package/libev/libev.mk
> +++ b/package/libev/libev.mk
> @@ -10,4 +10,11 @@ LIBEV_INSTALL_STAGING = YES
>   LIBEV_LICENSE = BSD-2c or GPLv2+
>   LIBEV_LICENSE_FILES = LICENSE
>
> +# The 'compatibility' event.h header conflicts with libevent
> +# It's completely unnecessary for BR packages so remove it
> +define LIBEV_DISABLE_EVENT_H_INSTALL
> +	$(SED) 's/ event.h//' $(@D)/Makefile.in
> +endef
> +LIBEV_POST_PATCH_HOOKS += LIBEV_DISABLE_EVENT_H_INSTALL
> +
>   $(eval $(autotools-package))
>

Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

-- 
Vincent
