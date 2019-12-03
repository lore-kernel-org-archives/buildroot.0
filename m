From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 3 Dec 2019 10:52:18 +0100
Subject: [Buildroot] [PATCH] package/cryptsetup: use libargon2 when
 available
In-Reply-To: <20191203092715.4605-1-p.debruijn@unilogic.nl>
References: <20191203092715.4605-1-p.debruijn@unilogic.nl>
Message-ID: <20191203105218.3c692f32@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  3 Dec 2019 10:27:15 +0100
Pascal de Bruijn <p.debruijn@unilogic.nl> wrote:

> cryptsetup has an internal copy of libargon2, which is used by default,
> but when libargon2 is available as a proper system library this is a
> duplication.
> 
> Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
> ---
>  package/cryptsetup/cryptsetup.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
> index 7788bfb..2941328 100644
> --- a/package/cryptsetup/cryptsetup.mk
> +++ b/package/cryptsetup/cryptsetup.mk
> @@ -29,6 +29,10 @@ else
>  CRYPTSETUP_CONF_OPTS += --with-crypto_backend=kernel
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBARGON2),y)
> +CRYPTSETUP_CONF_OPTS += --enable-libargon2
> +endif

Then we want to use --disable-libargon2 when the libargon2 package is
not enabled. If libargon2 is mandatory for crypsetup, then we always
want to use the separate package rather than the internal copy from
cryptsetup.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
