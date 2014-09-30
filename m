From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Sep 2014 23:38:55 +0200
Subject: [Buildroot] [PATCH 0/6] Python improvements: PEP 3147 fix and misc
	updates
Message-ID: <1412113141-17650-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The main purpose of this patch series is to fix the PEP 3147 handling
with Python 3.

For those not familiar with PEP 3147, here is a quick explanation. In
Python 2.x, before PEP 3147, the .py and corresponding byte-compiled
.pyc were stored in the same directory. With PEP 3147, the .py and
.pyc are stored in a separate location: the .py in the original place,
and the .pyc in a __pycache__ subdirectory. In addition, the .pyc in
__pycache__ will not be considered by Python if the corresponding .py
is not available. This is a problem for Buildroot, as we try to save
space, and by default remove all .py files and keep only .pyc files.

For the Python standard library itself, this issue is already handled
by python3-004-old-stdlib-cache.patch. But for external modules, the
issue is not handled, and basically, external modules are not found if
only the .pyc file is on the target.

The first commit of this patch series is solving this problem by
introducing an additional patch adjusting the distutils logic in
Python 3 to install the .pyc file in their old, non-PEP3147
location. This solves both distutils and setuptools packages, because
setuptools relies on distutils internally.

Note that this solution has my preference over the solution proposed
by Philippe Proux in
http://patchwork.ozlabs.org/patch/373082/. Philippe's solution consist
in fixing the problem entirely in target-finalize. But this means that
after the package is installed, the .pyc files do not exist in their
real location, and they are created only in target-finalize. This
would prevent any per-package installed size analysis, as I've
proposed through a few patches some time ago.

The other patches require less explanations:

 - The second patch cleans up some useless __pycache__ directories
   that are created because of an incomplete isolution between the
   target build and the host build of Python.

 - The third, fourth and fifth patches make version bumps/improvements
   in various Python packages.

Philippe, Christophe, if you could test this patch series, and see if
it fixes the Python 3 problems you had with external modules, it would
be great!

Thanks,

Thomas

Thomas Petazzoni (6):
  python3: add distutils fix for PEP 3147 issue
  python3: remove unneeded __pycache__ directories
  python-pyparsing: bump to version 2.0.2, enable on Python 3
  python-setuptools: bump to version 5.8
  python-pyasn: requires the zlib Python module
  python, python3: convert py/pyc removal to TARGET_FINALIZE_HOOKS

 Makefile                                           |  6 ---
 package/python-pyasn/Config.in                     |  2 +
 package/python-pyparsing/Config.in                 |  2 +-
 package/python-pyparsing/python-pyparsing.mk       |  2 +-
 .../python-setuptools-0001-add-executable.patch    | 55 ++++++++++++++++++++++
 .../python-setuptools-add-executable.patch         | 50 --------------------
 package/python-setuptools/python-setuptools.mk     |  6 +--
 package/python/python.mk                           | 14 ++++++
 .../python3/python3-016-distutils-no-pep3147.patch | 36 ++++++++++++++
 package/python3/python3.mk                         | 18 +++++++
 10 files changed, 130 insertions(+), 61 deletions(-)
 create mode 100644 package/python-setuptools/python-setuptools-0001-add-executable.patch
 delete mode 100644 package/python-setuptools/python-setuptools-add-executable.patch
 create mode 100644 package/python3/python3-016-distutils-no-pep3147.patch

-- 
2.0.0
