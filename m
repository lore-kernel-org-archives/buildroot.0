From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Dec 2016 23:50:10 +0100
Subject: [Buildroot] [PATCH 1/2] python-jsonschema: new package
In-Reply-To: <1477419935-86355-1-git-send-email-fabrice.fontaine@orange.com>
References: <1477419935-86355-1-git-send-email-fabrice.fontaine@orange.com>
Message-ID: <20161217235010.5e947286@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 25 Oct 2016 20:25:34 +0200, Fabrice Fontaine wrote:
> An implementation of JSON Schema validation for Python.
> 
> http://github.com/Julian/jsonschema
> 
> Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>

This doesn't build (the host package) due to a missing dependency on
host-python-vcversioner. This package doesn't exist yet, but it's easy
enough to create with scanpypi. See below what I've added.

Without this dependency, building jsonschema fails with:

Couldn't find index page for 'vcversioner' (maybe misspelled?)
Download error on https://pypi.python.org/simple/: unknown url type: https -- Some packages may not be found!
No local packages or download links found for vcversioner
Traceback (most recent call last):
  File "setup.py", line 44, in <module>
    vcversioner={"version_module_paths" : ["jsonschema/_version.py"]},
  File "/home/test/buildroot/output/host/usr/lib/python3.5/distutils/core.py", line 108, in setup
    _setup_distribution = dist = klass(attrs)
  File "build/bdist.linux-x86_64/egg/setuptools/dist.py", line 268, in __init__
  File "build/bdist.linux-x86_64/egg/setuptools/dist.py", line 313, in fetch_build_eggs
  File "build/bdist.linux-x86_64/egg/pkg_resources/__init__.py", line 846, in resolve
  File "build/bdist.linux-x86_64/egg/pkg_resources/__init__.py", line 1091, in best_match
  File "build/bdist.linux-x86_64/egg/pkg_resources/__init__.py", line 1103, in obtain
  File "build/bdist.linux-x86_64/egg/setuptools/dist.py", line 380, in fetch_build_egg
  File "build/bdist.linux-x86_64/egg/setuptools/command/easy_install.py", line 633, in easy_install
distutils.errors.DistutilsError: Could not find suitable distribution for Requirement.parse('vcversioner')
make: *** [/home/test/buildroot/output/build/host-python-jsonschema-2.5.1/.stamp_built] Error 1

Here is python-vcversioner.mk:

################################################################################
#
# python-vcversioner
#
################################################################################

PYTHON_VCVERSIONER_VERSION = 2.16.0.0
PYTHON_VCVERSIONER_SOURCE = vcversioner-$(PYTHON_VCVERSIONER_VERSION).tar.gz
PYTHON_VCVERSIONER_SITE = https://pypi.python.org/packages/c5/cc/33162c0a7b28a4d8c83da07bc2b12cee58c120b4a9e8bba31c41c8d35a16
PYTHON_VCVERSIONER_SETUP_TYPE = setuptools
PYTHON_VCVERSIONER_LICENSE = ISC License (ISCL)

$(eval $(host-python-package))

And python-vcversioner.hash:

# md5 from https://pypi.python.org/pypi/vcversioner/json, sha256 locally computed
md5     aab6ef5e0cf8614a1b1140ed5b7f107d  vcversioner-2.16.0.0.tar.gz
sha256  dae60c17a479781f44a4010701833f1829140b1eeccd258762a74974aa06e19b  vcversioner-2.16.0.0.tar.gz

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
