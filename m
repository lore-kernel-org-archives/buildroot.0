From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Oct 2015 09:57:09 +0100
Subject: [Buildroot] [PATCH v4 1/1] gnuradio: gnuradio-python: add
 missing runtime dependency to python-numpy
In-Reply-To: <1444053686-6756-1-git-send-email-gwenj@trabucayre.com>
References: <1444053686-6756-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20151006095709.63820114@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On Mon,  5 Oct 2015 16:01:26 +0200, Gwenhael Goavec-Merou wrote:

> diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
> index e264a21..8da1a13 100644
> --- a/package/gnuradio/Config.in
> +++ b/package/gnuradio/Config.in
> @@ -47,6 +47,7 @@ config BR2_PACKAGE_GNURADIO_PYTHON
>  	bool "python support"
>  	select BR2_PACKAGE_BOOST_PYTHON
>  	select BR2_PACKAGE_PYTHON
> +	select BR2_PACKAGE_PYTHON_NUMPY #runtime

When you "select" an option, you must replicate the "depends on" of
that option into the selecting option. In this case, python-numpy has
the following depends on:

        # Numpy has some CPU specific code
        depends on BR2_aarch64 || BR2_arm || BR2_armeb || BR2_i386 \
                || BR2_mips || BR2_mipsel || BR2_powerpc || BR2_powerpc64 \
                || BR2_sh || BR2_x86_64

So you should replicate that into gnuradio/Config.in. However, since
this is horrible, here is what we do in such cases:

 * Introduce a hidden BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS that
   encodes this dependency.

 * And then use this option in python-numpy/Config.in and
   gnuradio/Config.in.

You can grep for ARCH_SUPPORTS in Buildroot to see other examples.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
