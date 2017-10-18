From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Oct 2017 22:30:10 +0200
Subject: [Buildroot] [V2 1/3] prosody: refactor with PROSODY_CONF_OPTS
 variable
In-Reply-To: <20171018164650.514-1-francois.perrad@gadz.org>
References: <20171018164650.514-1-francois.perrad@gadz.org>
Message-ID: <20171018223010.7e2142be@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Oct 2017 18:46:48 +0200, Francois Perrad wrote:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/prosody/prosody.mk | 19 ++++++++++---------
>  1 file changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/package/prosody/prosody.mk b/package/prosody/prosody.mk
> index f7a325b46..5669f7707 100644
> --- a/package/prosody/prosody.mk
> +++ b/package/prosody/prosody.mk
> @@ -18,16 +18,17 @@ ifeq ($(BR2_PACKAGE_LUAJIT),y)
>  PROSODY_DEPENDENCIES += luajit
>  endif
>  
> +PROSODY_CONF_OPTS = \
> +	--with-lua=$(STAGING_DIR)/usr \
> +	--c-compiler=$(TARGET_CC) \
> +	--cflags="$(TARGET_CFLAGS)" \
> +	--linker=$(TARGET_CC) \
> +	--ldflags="$(TARGET_LDFLAGS) -shared" \
> +	--sysconfdir=/etc/prosody \
> +	--prefix=/usr
> +
>  define PROSODY_CONFIGURE_CMDS
> -	cd $(@D) && \
> -		$(TARGET_CONFIGURE_OPTS) \
> -		./configure --prefix=/usr \
> -		--c-compiler=$(TARGET_CC) \
> -		--cflags="$(TARGET_CFLAGS)" \
> -		--linker=$(TARGET_CC) \
> -		--ldflags="$(TARGET_LDFLAGS) -shared" \
> -		--sysconfdir=/etc/prosody \
> -		--with-lua=$(STAGING_DIR)/usr
> +	cd $(@D) && ./configure $(PROSODY_CONF_OPTS)

This has a pretty strong side-effect: $(TARGET_CONFIGURE_OPTS) is no
longer passed in the environment. It is unrelated to the refactoring,
and not explained anywhere in the commit log.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
