From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Fri, 25 Oct 2013 10:26:51 -0500
Subject: [Buildroot] [PATCH 1/1] Added pyusb as a package
In-Reply-To: <1382705646-20583-1-git-send-email-wzab01@gmail.com>
References: <1382705646-20583-1-git-send-email-wzab01@gmail.com>
Message-ID: <OF7CA7B8E3.5FD89345-ON86257C0F.0052857B-86257C0F.0054D5D3@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Wojciech,

Please see some comments I have on this package below.

"Wojciech M. Zabolotny" <wzab01@gmail.com> wrote on 10/25/2013 07:54:06 
AM:

Your commit message title should be this:

python-pyusb: new package

To follow on with this, the folder name for this package 
should be "python-pyusb" instead of "pyusb" since all 
python packages have "python-" added to their name.

> Signed-off-by: Wojciech M. Zabolotny <wzab01@gmail.com>
> ---
>  package/Config.in       |  1 +
>  package/pyusb/Config.in | 10 ++++++++++
>  package/pyusb/pyusb.mk  | 22 ++++++++++++++++++++++
>  3 files changed, 33 insertions(+)
>  create mode 100644 package/pyusb/Config.in
>  create mode 100644 package/pyusb/pyusb.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 0e6f86c..591cc04 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -404,6 +404,7 @@ source "package/python-pyzmq/Config.in"
>  source "package/python-serial/Config.in"
>  source "package/python-setuptools/Config.in"
>  source "package/python-thrift/Config.in"
> +source "package/pyusb/Config.in"
>  endmenu
>  endif
>  source "package/python3/Config.in"
> diff --git a/package/pyusb/Config.in b/package/pyusb/Config.in
> new file mode 100644
> index 0000000..b0c714a
> --- /dev/null
> +++ b/package/pyusb/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_PYUSB
> +   bool "pyusb"
> +   depends on BR2_PACKAGE_PYTHON
> +   select BR2_PACKAGE_LIBUSB
> +   help
> +          The PyUSB module provides for Python easy access to the host
> +          machine's Universal Serial Bus (USB) system.
> +
> +     http://sourceforge.net/apps/trac/pyusb/

The formatting for the website URL is not correct. It should 
be a "tab" plus "two spaces".

> +
> diff --git a/package/pyusb/pyusb.mk b/package/pyusb/pyusb.mk
> new file mode 100644
> index 0000000..fde10c9
> --- /dev/null
> +++ b/package/pyusb/pyusb.mk
> @@ -0,0 +1,22 @@

As noted earlier, the package name should be python-pyusb. So all
references of pyusb should either be "python-pyusb" or "PYTHON_PYUSB"

> 
+################################################################################
> +#
> +# pyusb
> +#
> 
+################################################################################
> +
> +PYUSB_VERSION = 0546cad8980783c39f96db717005a550059b730f
> +PYUSB_SITE = git://github.com/walac/pyusb/

You should also define what the license type is for this package.
Taking a quick glance at the license for this package it appears
that it is a BSD-style license with 3-clauses. Thus you should
add the following:

PYTHON_PYUSB_LICENSE = BSD-3c

Please see the buildroot manual for more information on this:

http://buildroot.uclibc.org/downloads/manual/manual.html#legal-info

> +PYUSB_LICENSE_FILES = LICENSE
> +
> +PYUSB_DEPENDENCIES = python libusb
> +

For building and installing, I would like to see that you 
follow the standard way that we compile python packages for
cross-compiling. Though it appears that this package is
just .py files, by following this way it makes sure that
if ever in the future they. Please see the "python-pyparsing"
package makefile for how we like to have python packages.

http://git.buildroot.net/buildroot/tree/package/python-pyparsing/python-pyparsing.mk

> +define PYUSB_INSTALL_TARGET_CMDS
> +   (cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install \
> +      --prefix=$(TARGET_DIR)/usr)
> +endef
> +

There is no need for the uninstall commands any more. So please
remove.

> +define PYUSB_UNINSTALL_TARGET_CMDS
> +   rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pyusb*
> +endef
> +
> +$(eval $(generic-package))
> -- 
> 1.8.4.rc3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
