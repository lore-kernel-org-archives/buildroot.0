From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Mon, 16 Mar 2015 08:51:16 +0100
Subject: [Buildroot] [PATCH 3/7 v5] package/fftw: add ARM optimisations
In-Reply-To: <571d54234d6782550cbf3ecfe3df20d886ec9d01.1426465664.git.yann.morin.1998@free.fr>
References: <cover.1426465664.git.yann.morin.1998@free.fr>
 <571d54234d6782550cbf3ecfe3df20d886ec9d01.1426465664.git.yann.morin.1998@free.fr>
Message-ID: <20150316085116.640f0ffc@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN
On Mon, 16 Mar 2015 01:31:43 +0100
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

[SNIP
>  
> +# ARM optimisations
> +FFTW_CONF_OPTS += $(if $(BR2_ARM_CPU_HAS_NEON),--enable,--disable)-neon
> +
>  $(eval $(autotools-package))

--enable-neon must be enabled only if --enable-single is enabled. Without this,
configure fails.

Something like :

ifeq ($(BR2_ARM_CPU_HAS_NEON)$(BR2_PACKAGE_FFTW_PRECISION_SINGLE),yy)
FFTW_CONF_OPTS += --enable-neon
else
FFTW_CONF_OPTS += --disable-neon
endif
must be used 

Regards.
Gwenhael Goavec-Merou
