From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Nov 2017 21:42:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/python-networkmanager: Bump to
 version 2.0.1
In-Reply-To: <20171102202328.21391-1-petr.vorel@gmail.com>
References: <20171102202328.21391-1-petr.vorel@gmail.com>
Message-ID: <20171102214250.24cecf69@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  2 Nov 2017 21:23:28 +0100, Petr Vorel wrote:

>  config BR2_PACKAGE_PYTHON_NETWORKMANAGER
>  	bool "python-networkmanager"
>  	depends on BR2_PACKAGE_NETWORK_MANAGER # runtime
> -	depends on BR2_USE_WCHAR # dbus-python
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus-python
> -	depends on BR2_PACKAGE_DBUS # dbus-python

We want to keep those "depends on", because they match the select of
dbus-python. Yes, perhaps network-manager has the same dependencies
today, but we don't want to rely on that.

> -	select BR2_PACKAGE_DBUS_PYTHON
> +	select BR2_PACKAGE_DBUS_PYTHON # runtime
> +	select BR2_PACKAGE_PYTHON_SIX # runtime

This seems to be a new runtime dependency, it would be worth mentioning
in the commit log.

>  	help
> -	  python-networkmanager wraps NetworkManagers D-Bus interface
> -	  so you can be less verbose when talking to NetworkManager
> -	  from python. All interfaces have been wrapped in classes,
> -	  properties are exposed as python properties and function
> -	  calls are forwarded to the correct interface.
> +	  Easy communication with NetworkManager.

The original help text looks a look better, why drop it?

Did you use scanpypi to generate this new package perhaps?
> -PYTHON_NETWORKMANAGER_VERSION = 1.2.1
> -PYTHON_NETWORKMANAGER_SITE = https://pypi.python.org/packages/e7/b1/09993250ceea9e03bc65fbabcd5286540200292c011b22237b2963c11471
> -PYTHON_NETWORKMANAGER_SETUP_TYPE = distutils
> -PYTHON_NETWORKMANAGER_LICENSE = GPL-3.0+
> +PYTHON_NETWORKMANAGER_VERSION = 2.0.1
> +PYTHON_NETWORKMANAGER_SOURCE = python-networkmanager-$(PYTHON_NETWORKMANAGER_VERSION).tar.gz
> +PYTHON_NETWORKMANAGER_SITE = https://pypi.python.org/packages/d7/f9/5cbd99fd24a072875ce048e48d1754285f137aab447de8fee63b6cba990a
> +PYTHON_NETWORKMANAGER_SETUP_TYPE = setuptools
> +PYTHON_NETWORKMANAGER_LICENSE = zlib/libpng License

To me, the license looks exactly like the Zlib license
(https://zlib.net/zlib_license.html) and not like the libpng license
(http://libpng.org/pub/png/src/libpng-LICENSE.txt). So perhaps:

PYTHON_NETWORKMANAGER_LICENSE = Zlib

would be more accurate here (and would have the advantage of using a
SPDX license code).

Could you look into those different comments and submit an updated
version?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
