From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Apr 2021 23:12:37 +0200
Subject: [Buildroot] [PATCH] package/python-wpaspy: add python-wpaspy
In-Reply-To: <20210412151341.50721-1-matthew.weber@rockwellcollins.com>
References: <20210412151341.50721-1-matthew.weber@rockwellcollins.com>
Message-ID: <20210421231237.5dbe42be@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

On Mon, 12 Apr 2021 10:13:41 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> From: Jared Bents <jared.bents@rockwellcollins.com>
> 
> Update to add python-wpaspy. It is a package that includes
> python bindings for wpa_ctrl.
> 
> Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
> Signed-off-by: Kalpesh Panchal <kalpesh.panchal@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>

Thanks for the patch. Minor nit, commit title should be
"package/python-wpaspy: new package". Of course, I have more
comments/questions below.


> diff --git a/package/python-wpaspy/0001-wpaspy-update-setup.py-to-use-wpaspy.py.patch b/package/python-wpaspy/0001-wpaspy-update-setup.py-to-use-wpaspy.py.patch
> new file mode 100644
> index 0000000000..bfa6e9609a
> --- /dev/null
> +++ b/package/python-wpaspy/0001-wpaspy-update-setup.py-to-use-wpaspy.py.patch
> @@ -0,0 +1,45 @@
> +From b25579dd576ef125741fc72bd39239cb7e60a1e5 Mon Sep 17 00:00:00 2001
> +From: Jared Bents <jared.bents@rockwellcollins.com>
> +Date: Wed, 1 Apr 2020 10:58:49 -0500
> +Subject: [PATCH] wpaspy: update setup.py to use wpaspy.py
> +
> +update setup.py to use wpaspy.py instead of wpaspy.c due to
> +information from Jouni Malinen in the linked mailing list
> +correspondence

This commit log is very unclear, I don't understand what it means. It
proposes to use a pure-Python implementation, instead of a C-based
Python extension? Why?

The commit log only says *what* it does, but it should say *why* it
does that.

> +http://lists.infradead.org/pipermail/hostap/2020-April/041575.html

This link doesn't exist. There were no posts in April 2020 on this
mailing list it seems.


> diff --git a/package/python-wpaspy/Config.in b/package/python-wpaspy/Config.in
> new file mode 100644
> index 0000000000..a35cefb86c
> --- /dev/null
> +++ b/package/python-wpaspy/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PYTHON_WPASPY
> +	bool "python-wpaspy"
> +	depends on BR2_PACKAGE_WPA_SUPPLICANT #runtime dependency

Nit:

	depends on BR2_PACKAGE_WPA_SUPPLICANT # runtime

> +	help
> +	  Python bindings for wpa_ctrl
> +	  (wpa_supplicant/hostapd control interface)

An upstream homepage would be nice to have.

> diff --git a/package/python-wpaspy/python-wpaspy.mk b/package/python-wpaspy/python-wpaspy.mk
> new file mode 100644
> index 0000000000..45d12844c6
> --- /dev/null
> +++ b/package/python-wpaspy/python-wpaspy.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# python-wpaspy
> +#
> +################################################################################
> +
> +PYTHON_WPASPY_VERSION = 2_9
> +PYTHON_WPASPY_SOURCE = hostap_$(PYTHON_WPASPY_VERSION).tar.gz
> +PYTHON_WPASPY_SITE = https://w1.fi/cgit/hostap/snapshot

I was a bit confused by why you are fetching from Git, instead of using
the wpa_supplicant or hostapd tarball. But it seems like the wpaspy
subdir is only available in the Git repository. Is this the reason for
fetching this Git snapshot? If so, it would be good to state it
somewhere, at least in the commit log.

Also, is there a need for this 2.9 version to be in sync between this
and the wpa_supplicant package ?

> +PYTHON_WPASPY_SUBDIR = wpaspy
> +PYTHON_WPASPY_CFLAGS = $(TARGET_CFLAGS)

This line has no effect.

> +PYTHON_WPASPY_LICENSE = BSD-3-Clause
> +PYTHON_WPASPY_LICENSE_FILES = README
> +PYTHON_WPASPY_CPE_ID_VENDOR = w1.fi

OK, but does CPE knows about python-wpaspy as a product of w1.fi ?

> +PYTHON_WPASPY_SETUP_TYPE = distutils
> +
> +$(eval $(python-package))

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
