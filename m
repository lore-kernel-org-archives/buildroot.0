From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 27 Jul 2015 16:38:09 +0200
Subject: [Buildroot] [PATCH 1/1] gcc: make sure we don't have a copy of
 libiberty.a in host library dir
In-Reply-To: <1437039568-22957-1-git-send-email-viallard@syscom-instruments.com>
References: <1437039568-22957-1-git-send-email-viallard@syscom-instruments.com>
Message-ID: <55B64251.6010404@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Anthony,

Le 16/07/2015 11:39, Anthony Viallard a ?crit :
> With old gcc version (like with 4.7.4), libiberty.a is copied to
> library directory and it's not the behavior we want.
> 
> According to Arnout Vandecappelle, newer version of gcc
> have fixed the problem. But if you choose gcc 4.7.X, the problem
> is there. Therefore, I send this little patch which remove the
> bad file after the build is finished.
> 
> Signed-off-by: Anthony Viallard <viallard@syscom-instruments.com>
> ---

Thanks for your patch!

I had the same issue with gcc-4.8 and I tried to fix it with the following
patches (which was rejected):

http://patchwork.ozlabs.org/patch/460494/
http://patchwork.ozlabs.org/patch/449686/

However, after some investigation, here is the right fix from upstream:
http://patchwork.ozlabs.org/patch/470531/

The --disable-install-libiberty option was broken, that's why the internal
libiberty.a was installed in HOST_DIR.

Hopefully, the same patch apply on gcc-4.7:
http://patchwork.ozlabs.org/patch/500445/

Care to test it ?

Best regards,
Romain Naour

>  package/gcc/gcc-final/gcc-final.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
> index 16bf4ee..2cce860 100644
> --- a/package/gcc/gcc-final/gcc-final.mk
> +++ b/package/gcc/gcc-final/gcc-final.mk
> @@ -185,6 +185,12 @@ endef
>  HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_INSTALL_USR_LIBS
>  endif
>  
> +define HOST_GCC_FINAL_RM_LIBIBERTY_A
> +	rm -f $(HOST_DIR)/usr/lib/libiberty.a
> +endef
> +
> +HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_RM_LIBIBERTY_A
> +
>  ifeq ($(BR2_xtensa),y)
>  HOST_GCC_FINAL_CONF_OPTS += --enable-cxx-flags="$(TARGET_ABI)"
>  endif
> 
