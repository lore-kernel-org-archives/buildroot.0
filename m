From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 07 May 2013 15:30:04 +0200
Subject: [Buildroot] [PATCH] dropbear: disable standalone mode for nommu
In-Reply-To: <1367930399-28232-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Tue, 7 May 2013 09:39:59 -0300")
References: <1367930399-28232-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87li7q2a03.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> dropbear for nommu targets must disable the standalone (non-inetd) mode
 Gustavo> since the platform lacks fork(), fixes:
 Gustavo> http://autobuild.buildroot.net/results/ecbdfab10f54bec75c112bbf005bba9ae2b18dc8/

Then we should probably also not install the initscript. It would also be
good to move the initscript handling to DROPBEAR_INSTALL_INIT_SYSV while
we're at it.


 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/dropbear/dropbear.mk | 8 ++++++++
 Gustavo>  1 file changed, 8 insertions(+)

 Gustavo> diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
 Gustavo> index d5dfe6d..50f6100 100644
 Gustavo> --- a/package/dropbear/dropbear.mk
 Gustavo> +++ b/package/dropbear/dropbear.mk
 Gustavo> @@ -39,6 +39,14 @@ define DROPBEAR_BUILD_FEATURED
 Gustavo>  	$(SED) 's:.*\(#define DROPBEAR_SHA2_512_HMAC\).*:\1:' $(@D)/options.h
 Gustavo>  endef
 
 Gustavo> +define DROPBEAR_DISABLE_STANDALONE
 Gustavo> +	$(SED) 's:\(#define NON_INETD_MODE\):/*\1 */:' $(@D)/options.h
 Gustavo> +endef
 Gustavo> +
 Gustavo> +ifeq ($(BR2_USE_MMU),)
 Gustavo> +DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_STANDALONE
 Gustavo> +endif
 Gustavo> +
 Gustavo>  ifeq ($(BR2_PACKAGE_DROPBEAR_DISABLE_REVERSEDNS),y)
 Gustavo>  DROPBEAR_POST_EXTRACT_HOOKS += DROPBEAR_DISABLE_REVERSE_DNS
 Gustavo>  endif
 Gustavo> -- 
 Gustavo> 1.8.1.5

 Gustavo> _______________________________________________
 Gustavo> buildroot mailing list
 Gustavo> buildroot at busybox.net
 Gustavo> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
