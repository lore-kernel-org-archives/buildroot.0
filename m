From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 14:23:13 +0200
Subject: [Buildroot] [RESEND PATCH v3 1/1] package/iputils: add configs
 to select which binaries are built
In-Reply-To: <4e8f64ec-1797-a418-79d7-701380a767db@gmail.com>
References: <20190829191722.18761-1-alejandro.gonzalez.correo@gmail.com>
 <4e8f64ec-1797-a418-79d7-701380a767db@gmail.com>
Message-ID: <20190915142313.7abf39df@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alejandro,

On Sun, 15 Sep 2019 12:05:46 +0200
Alejandro Gonz?lez <alejandro.gonzalez.correo@gmail.com> wrote:


> +config BR2_PACKAGE_IPUTILS_NINFOD
> +	bool "ninfod"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # ninfod requires <pthread.h>
> +	depends on BR2_PACKAGE_NETTLE || BR2_PACKAGE_LIBGCRYPT || BR2_PACKAGE_OPENSSL || BR2_PACKAGE_LINUX_HEADERS

Do we really want to handle this with depends on ? This is indeed what
is the closest to what the current package does, but when we have
sub-options, we generally use "select" to enable the appropriate
dependencies. In this case, it's not easy to know if there is a
preferred crypto provider though, so perhaps what you did is the best.

However, reviewing your commit, I realized we already have this
dependency on BR2_PACKAGE_LINUX_HEADERS, and this is completely bogus.
BR2_PACKAGE_LINUX_HEADERS is only valid when an internal toolchain is
used. When an external toolchain is used, BR2_PACKAGE_LINUX_HEADERS is
always disabled. So it shouldn't be used in packages. This is something
that should be fixed in iputils. In fact, kernel headers are always
available, as they are provided by the toolchain. So this dependency
doesn't make sense.

Could you investigate how USE_CRYPTO=kernel is working, i.e which
APIs/headers it requires ?

Besides this particular problem, the rest of the patch looks good to me.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
