From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Jul 2015 14:55:03 +0200
Subject: [Buildroot] [PATCH] c-icap: fix config script by adding
 $(STAGING_DIR) prefix to link path. It fixes c-icap-modules build.
In-Reply-To: <1437568841-20180-1-git-send-email-guillaume.gardet@oliseo.fr>
References: <1437568841-20180-1-git-send-email-guillaume.gardet@oliseo.fr>
Message-ID: <20150722145503.01f5bd26@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Guillaume,

Thanks for the patch!

On Wed, 22 Jul 2015 14:40:41 +0200, Guillaume GARDET wrote:
> Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Signed-off-by: Guillaume GARDET <guillaume.gardet@oliseo.fr>
> 
> ---
>  package/c-icap/c-icap.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
> index 0f42b6c..00a250b 100644
> --- a/package/c-icap/c-icap.mk
> +++ b/package/c-icap/c-icap.mk
> @@ -57,6 +57,8 @@ define C_ICAP_TUNE_INSTALLATION
>  		$(STAGING_DIR)/usr/bin/{c-icap,c-icap-libicapapi}-config
>  	$(SED) 's%INCDIR2=.*%INCDIR2=$(STAGING_DIR)/usr/include/c_icap%' \
>  		$(STAGING_DIR)/usr/bin/{c-icap,c-icap-libicapapi}-config
> +	$(SED) 's%LIBS="-L%LIBS="-L$(STAGING_DIR)%' \
> +		$(STAGING_DIR)/usr/bin/c-icap-libicapapi-config

Ah, right, I missed this one! However, I think it's useless to keep
this -L option, this $(STAGING_DIR)/usr/lib is already in the library
search path for the cross-compiler.

What about just:

	$(SED) 's%-L$LIBDIR %%' $(STAGING_DIR)/usr/bin/c-icap-libicapapi-config

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
