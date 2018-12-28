From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Dec 2018 18:01:28 +0100
Subject: [Buildroot] [PATCH 0/3] Prepare Python support for top-level
 parallel build
Message-ID: <20181228170132.13049-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This series prepares our Python support for top-level parallel
build. To understand it, you need to read it from the last patch to
the first patch, because PATCH 1 is a consequence of PATCH 2, which is
itself a consequence of PATCH 3.

So, the problem started with the fact that when we install host Python
modules based on setuptools, we use the "regular" Python installation
process based on Python Eggs. This installation process has the
not-so-nice property of registering all installed Python Eggs in a
single common file:
$(HOST_DIR)/lib/python2.7/site-packages/easy-install.pth. Clearly,
this doesn't work well with per-package directory: if you have package
A that depends on host-python-B and host-python-C, with no dependency
relationship between host-python-B and host-python-C, when the
per-package directory for "A" gets created, it gets a version of the
easy-install.pth file either from host-python-B or host-python-C... so
it will not "see" one of them.

To fix this, we want to use the same installation process we use for
host Python modules than the one we use for target Python modules:
avoid Python Eggs, using the --single-version-externally-managed
setuptools option. This is the purpose of PATCH 3/3, which is simple
enough.

However, the story started becoming more complicated when we tried to
build host-meson. Indeed, host-meson needs host-python3 and its
installation process is based on setuptools. The issue is that when
Python 2.x is enabled for the target, or when no Python at all is
selected for the target, the default host Python version is 2.x, and
therefore host-python-setuptools is installed for Python 2.x, not
Python 3.x. This makes python-setuptools not usable for the
installation of host-meson. This was not visible until now, because
host-meson "transparently" falls back to distutils for its
installation process. *But* once you pass
--single-version-externally-managed, you have a problem: this option
is only supported by setuptools, not by distutils, so PATCH 3/3 breaks
the build of host-meson.

To solve this, we do something that we have been discussing for quite
a while: make sure python-setuptools can be available for host Python
3.x, even if Python 3.x is not the default host Python version. To
achieve this:

 - PATCH 1/3 adds a host-python3-setuptools package.

 - PATCH 2/3 changes the Python package infrastructure to use
   host-python3-setuptools or host-python-setuptools depending on the
   situation. host-python-setuptools is changed to always install for
   Python 2.x, regardless of what is the default host Python version
   so that host-python-setuptools and host-python3-setuptools never
   step on each other.

Hopefully this cover letter helps explain the overall situation
clearly enough. Let me know if additional details are needed. This
code has survived some extensive autobuilder testing, hopefully I
haven't missed any special case.

Best regards,

Thomas

Thomas Petazzoni (3):
  package/python3-setuptools: new package
  package/pkg-python: use host-python3-setuptools when needed
  package/pkg-python: use --single-version-externally-managed for host
    setuptools

 package/lirc-tools/lirc-tools.mk              |  2 +-
 package/pkg-python.mk                         | 39 +++++++---
 .../python-setuptools/python-setuptools.mk    |  1 +
 .../0001-add-executable.patch                 | 72 +++++++++++++++++++
 .../python3-setuptools.hash                   |  1 +
 .../python3-setuptools/python3-setuptools.mk  | 24 +++++++
 6 files changed, 129 insertions(+), 10 deletions(-)
 create mode 100644 package/python3-setuptools/0001-add-executable.patch
 create mode 120000 package/python3-setuptools/python3-setuptools.hash
 create mode 100644 package/python3-setuptools/python3-setuptools.mk

-- 
2.20.1
