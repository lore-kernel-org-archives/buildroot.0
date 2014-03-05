From: Samuel Martin <s.martin49@gmail.com>
Date: Wed,  5 Mar 2014 23:04:39 +0100
Subject: [Buildroot] [PATCH 0/6] host-python2 hard dependency
Message-ID: <1394057085-10399-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,


Recently, the autobuilders have triggered some host package failures caused by
an unmet host-python(2) dependency.

These failures happen when python3 is selected for the target; in such cases,
the host python is also python3. However, some packages indirectly require a
python2 interpreter available for the host because they have some build scripts
(crda, in a *.py script, uses m2crypto which can only be built for python2) or
use a build-system non-python3-compliant (all packages based on Scons).

This series intends to fix this issue.

First, Buildroot needs to be able to manage the python symlink installation.
The idea behind this is, in the host tree, the python symlink points to the
interpreter the same version as the one in the target tree.
So, we can have:
- if python(2) is installed in the target:
  $(HOST_DIR)/usr/bin/python -> python2
- if python3 is installed in the target:
  $(HOST_DIR)/usr/bin/python -> python3
  $(HOST_DIR)/usr/bin/python2 -> python2.7
This is done in the patches 1/6 and 2/6.

The 3rd patch enhance the python infrastructure to allow setting the host python
requirement for a package using the host-python-package infrastructure. This
patch adds a new variable *_FORCE_HOST_PYTHON to be set to the interpreter name
('python2' or 'python3'), which, if set, will take care of adding the right host
python dependency and using the right interpreter in the build/install commands.

The last 3 packages fix the wrong dependency, so the build failures. Note that,
crda explicitly depends on host-python, while this dependency is automatically
(implicitly) pulled in the python-m2crypto package via the *_FORCE_HOST_PYTHON
usage.


Yours,
Samuel


Samuel Martin (6):
  python: rework python symlinks installation
  python3: rework python symlinks installation
  pkg-python: support host-python dependency different from the python
    in the target
  scons: force host-python dependency to be python2
  python-m2crypto: requires host-python2
  crda: override python interperter

 docs/manual/adding-packages-python.txt             |  8 ++++
 ...file-allow-to-override-python-interpreter.patch | 34 +++++++++++++++
 package/crda/crda.mk                               |  8 +++-
 package/pkg-python.mk                              | 50 ++++++++++++++++++++--
 package/python-m2crypto/python-m2crypto.mk         | 10 +++--
 .../python/python-011-remove-python-symlink.patch  | 29 +++++++++++++
 package/python/python.mk                           | 32 ++++++++++++++
 package/python3/python3.mk                         |  9 ++++
 package/scons/scons.mk                             |  4 +-
 9 files changed, 175 insertions(+), 9 deletions(-)
 create mode 100644 package/crda/crda-0001-Makefile-allow-to-override-python-interpreter.patch
 create mode 100644 package/python/python-011-remove-python-symlink.patch

--
1.9.0
