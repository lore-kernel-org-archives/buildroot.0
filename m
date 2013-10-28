From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Oct 2013 20:27:48 +0100
Subject: [Buildroot] [PATCH v2 1/1] jack2: new package
In-Reply-To: <1382903456-5996-1-git-send-email-wzab01@gmail.com>
References: <1256826d-31b9-4b85-8834-35694e372fac@email.android.com>
 <1382658143-3850-1-git-send-email-wzab01@gmail.com>
 <1382744168-14259-1-git-send-email-wzab01@gmail.com>
 <20131027181024.14201db4@skate>
 <1382903456-5996-1-git-send-email-wzab01@gmail.com>
Message-ID: <20131028202748.3d03c78f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Wojciech M. Zabolotny,

On Sun, 27 Oct 2013 20:50:56 +0100, Wojciech M. Zabolotny wrote:
> Signed-off-by: Wojciech M. Zabolotny <wzab01@gmail.com>
> ---
> I have modified patch introducing the new "jack2" package, according
> to suggestions received from Thomas De Schampheleire and Thomas Petazzoni
> (corrections of formatting, dependencies and downloading of source form git).

Thanks for the followup patch. Some comments below.

> new file mode 100644
> index 0000000..0fb6ca2
> --- /dev/null
> +++ b/package/jack2/Config.in
> @@ -0,0 +1,23 @@
> +config BR2_PACKAGE_JACK2
> +	bool "jack2"
> +	depends on BR2_LARGEFILE
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	select BR2_PACKAGE_LIBSAMPLERATE
> +	select BR2_PACKAGE_LIBSNDFILE
> +	select BR2_PACKAGE_ALSA_LIB
> +	help
> +	  JACK Audio Connection Kit (server and example clients)
> +	  JACK is a low-latency sound server, allowing multiple applications to
> +	  connect to one audio device, and to share audio between themselves.
> + 	  This package contains the daemon jackd as well as some example clients.
> +
> +	  http://jackaudio.org/
> +
> +comment "jack2 uses libsndfile which requires a toolchain with LARGEFILE support"
> +        depends on !BR2_LARGEFILE
> +
> +comment "jack2 uses alsa-lib which requires a toolchain with threads support"
> +        depends on !BR2_TOOLCHAIN_HAS_THREADS

These comments should be only one comment. See also the recent commit
c3a832a7fb26fed8fd7834e96f09e3565b637f69, which updated the manual to
explain how such comments should be written.

> +
> +
> +

These empty new lines are not needed.

> diff --git a/package/jack2/jack2.mk b/package/jack2/jack2.mk
> new file mode 100644
> index 0000000..5ab751f
> --- /dev/null
> +++ b/package/jack2/jack2.mk
> @@ -0,0 +1,31 @@
> +################################################################################
> +#
> +# jack2
> +#
> +################################################################################
> +
> +JACK2_VERSION = 37976441044d69b91d61d8f6278949a39cf1b7b7
> +JACK2_SITE = http://github.com/jackaudio/jack2/tarball/$(JACK2_VERSION)
> +JACK2_LICENSE = LGPLv2.1+
> +JACK2_DEPENDENCIES = \
> +      libsamplerate \
> +      libsndfile

You have selected BR2_PACKAGE_ALSA_LIB above, but you don't depend on
them. Unless alsa-lib is a runtime-only dependency, and not a
build-dependency, this is wrong.

Also, I believe that since the dependency list is not too long, putting
it on one line is ok:

JACK2_DEPENDENCIES = libsamplerate libsndfile alsa-lib

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
