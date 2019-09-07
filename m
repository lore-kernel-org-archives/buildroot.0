From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 21:48:30 +0200
Subject: [Buildroot] [PATCH] package/pppd: use uclibc libcrypt instead
 of openssl
In-Reply-To: <20190907183517.6176-1-alexander.i.mukhin@gmail.com>
References: <20190907143245.22f1dc70@windsurf>
 <20190907183517.6176-1-alexander.i.mukhin@gmail.com>
Message-ID: <20190907214830.37b71daa@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  7 Sep 2019 21:35:17 +0300
Alexander Mukhin <alexander.i.mukhin@gmail.com> wrote:

> glibc since 2.28 dropped DES encryption routines setkey() and encrypt(),
> but uclibc still provides them. So, if building with uclibc, we can
> avoid using huge openssl library.
> 
> Signed-off-by: Alexander Mukhin <alexander.i.mukhin@gmail.com>

I've applied, after doing one small change, see below.

> +PPPD_MAKE_OPTS = HAVE_INET6=y
> +ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
>  PPPD_DEPENDENCIES = openssl

I changed this to PPPD_DEPENDENCIES += instead of PPPD_DEPENDENCIES =.
Indeed, we're now in a conditional block, and we want to avoid
overwriting any PPPD_DEPENDENCIES assignment  that could have been done
before that. There is none in the current pppd.mk, but one could be
added in the future, so we really like to use += to add conditional
dependencies.

Thanks for your contribution!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
