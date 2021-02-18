From: Ivo Grondman <buildroot@grondman.net>
Date: Thu, 18 Feb 2021 18:24:25 +0100
Subject: [Buildroot] Forcing a Python package to be built/installed with
 Python3
Message-ID: <66577029-8BDB-43C9-97E3-45442AE23E6B@grondman.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

Using Buildroot 2020.11.2 in a Vagrant VM based on the Vagrantfile supplied by Buildroot, I?m testing my own Python package (setuptools based) with utils/test-pkg, but even though my Config.in clearly mentions the dependency on Python3 (as suggested by the docs), the tests fail and looking at the logs I can see that it?s using Python 2.7. Everything does work when I don?t have Python2 installed, but I want to make sure that even if it *is* installed, it will not be used for the build/install of this package.

I know about HOST_PYTHON_FOO_NEEDS_HOST_PYTHON that can be set to python2 or python3, but the package I?m trying to build is not a host package.

My Config.in:
######
config BR2_PACKAGE_MY_PYTHON_PACKAGE
	bool ?my-python-package"
	default y
	depends on BR2_PACKAGE_PYTHON3
	help
	  Some help text.
######

My my-python-package.mk:
######
MY_PYTHON_PACKAGE_VERSION = 0.0.1
MY_PYTHON_PACKAGE_SOURCE = my-package-$(MY_PYTHON_PACKAGE_VERSION).tar.gz
MY_PYTHON_PACKAGE_SITE = file://$(BR2_EXTERNAL_MYTREE_PATH)
MY_PYTHON_PACKAGE_SETUP_TYPE = setuptools
MY_PYTHON_PACKAGE_LICENSE = Other
MY_PYTHON_PACKAGE_LICENSE_FILES = LICENSE.md
$(eval $(python-package))
######

I?m using a local file here as my package is not on the public PyPI server but on a Gitlab PyPI package registry and I couldn?t figure out how to connect Buildroot to that, so I?m downloading the tarball from there before calling make, which brings me to another question: the documentation states that I should be able to use a local file path as LIBFOO_SITE, but if I do it without the ?file://? bit, I?ll get errors that I didn?t provide a scheme. Perhaps this should be changed in the documentation, which now states that "LIBFOO_SITE=/opt/software/libfoo.tar.gz? is valid?

Any help is greatly appreciated.

Best regards,

Ivo Grondman
