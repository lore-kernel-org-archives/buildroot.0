From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 1 Dec 2019 10:01:51 +0100
Subject: [Buildroot] [PATCH 1/2] package/python-gobject: depend on
 python2
In-Reply-To: <20191201030656.3691270-1-aduskett@gmail.com>
References: <20191201030656.3691270-1-aduskett@gmail.com>
Message-ID: <20191201100151.5c964815@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 30 Nov 2019 19:06:55 -0800
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Version 2.86.6 of python-gobject is quite old and no longer works with
> Python versions > 3.7. When importing a user will recieve the following error:
> 
> Traceback (most recent call last):
>   File "<stdin>", line 1, in <module>
>   File "/usr/lib/python3.8/site-packages/gobject/__init__.py", line 26, in
>   <module>
>   File "/usr/lib/python3.8/site-packages/glib/__init__.py", line 22, in <module>
> SystemError: initialization of _glib raised unreported exception
> 
> Because new versions of python-gobject require gobject-introspection, which is
> not currently available in Buildroot, add a dependency on python2 to prevent
> users from receiving the above error.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>

This commit "fixes" bug https://bugs.busybox.net/show_bug.cgi?id=12286

> diff --git a/package/python-gobject/Config.in b/package/python-gobject/Config.in
> index 475ff25185..fa801cd411 100644
> --- a/package/python-gobject/Config.in
> +++ b/package/python-gobject/Config.in
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_PYTHON_GOBJECT
>  	depends on BR2_USE_WCHAR # libglib2
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
>  	depends on BR2_USE_MMU # libglib2
> +	depends on BR2_PACKAGE_PYTHON # Broken with python 3.8

You forgot to update the Config.in comment regarding this new
dependency. I don't know if we need to show a comment about this being
not available with Python 3.x, but at least the existing comment about
threads/wchar dependency should only be shown if BR2_PACKAGE_PYTHON=y.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
