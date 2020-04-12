From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Apr 2020 15:45:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/systemd: add openssl support
In-Reply-To: <20200308230355.18839-1-james.hilliard1@gmail.com>
References: <20200308230355.18839-1-james.hilliard1@gmail.com>
Message-ID: <20200412154509.47c24a13@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  8 Mar 2020 17:03:55 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/systemd/systemd.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> index 22165de2c1..5f91a2a5f9 100644
> --- a/package/systemd/systemd.mk
> +++ b/package/systemd/systemd.mk
> @@ -160,6 +160,13 @@ else
>  SYSTEMD_CONF_OPTS += -Dgcrypt=false
>  endif
>  
> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> +SYSTEMD_DEPENDENCIES += openssl
> +SYSTEMD_CONF_OPTS += -Dopenssl=true
> +else
> +SYSTEMD_CONF_OPTS += -Dopenssl=false
> +endif

I hesitated on this one, because openssl is used for:

 - dns-over-tls
 - systemd-homed
 - systemd-repart

and we already handle the availability of openssl in all of these
situations.

However, it is true that there is a -Dopenssl option that we don't
handle today, and it makes sense to handle it, if only do explicitly
disable openssl support when it's not available.

So I've applied to master. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
