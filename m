From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 2 Sep 2015 21:58:56 +0200
Subject: [Buildroot] [PATCH 1/1] gnuradio: gnuradio-python
 gnuradio-utils: add missing dependency to python-numpy
In-Reply-To: <1441215894-31473-1-git-send-email-gwenj@trabucayre.com>
References: <1441215894-31473-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20150902215856.7b880583@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gwenhael Goavec-Merou,

On Wed,  2 Sep 2015 19:44:54 +0200, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Some python blocks needs python-numpy present.
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Hum, this commit log doesn't quite explain what's going, I believe. At
least not sufficiently.

> ---
>  package/gnuradio/Config.in   | 9 ++++++++-
>  package/gnuradio/gnuradio.mk | 2 +-
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
> index e264a21..ea37d74 100644
> --- a/package/gnuradio/Config.in
> +++ b/package/gnuradio/Config.in
> @@ -43,16 +43,23 @@ config BR2_PACKAGE_GNURADIO_FEC
>  	help
>  	  FEC signal processing blocks
>  
> +comment "gr-python depends on numpy"
> +	depends on !BR2_PACKAGE_PYTHON_NUMPY
> +
>  config BR2_PACKAGE_GNURADIO_PYTHON
>  	bool "python support"
> +	depends on BR2_PACKAGE_PYTHON_NUMPY
>  	select BR2_PACKAGE_BOOST_PYTHON
>  	select BR2_PACKAGE_PYTHON

It's really weird to "select BR2_PACKAGE_PYTHON", but to "depends on
BR2_PACKAGE_PYTHON_NUMPY".

If anything, it would make a lot more sense to do the opposite: hide
the Python support option is Python is not available (using a "depends
on BR2_PACKAGE_PYTHON), and once Python is available and this option is
enabled, automatically enabled Python Numpy.

Or maybe you were worried about the architecture dependencies of Python
Numpy, and the fact that duplicating them in gnuradio isn't nice?

In this case, introduce a BR2_PACKAGE_GNURADIO_ARCH_SUPPORTS hidden
variable in package/python-numpy/Config.in. Grep for other
ARCH_SUPPORTS variable to see how they are used.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
