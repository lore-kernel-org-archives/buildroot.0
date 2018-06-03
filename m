From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Jun 2018 11:08:20 +0200
Subject: [Buildroot] [PATCH 3/5] support/docker: use the distro-provided
 flake8
In-Reply-To: <cover.1528016895.git.yann.morin.1998@free.fr>
References: <cover.1528016895.git.yann.morin.1998@free.fr>
Message-ID: <da9bacac268b43b39d8b6661d11157db36dacd4f.1528016895.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we install flake8 and its dependencies via pip. We
tried to be reproducible by pinning the version of those python
packages, but we did forget quite a few of them, and thus some
dependencies for flake8 are installed as uncontrolled versions.

Furthermore, before we install flake8 and its dependencies, we
forcibly update pip, setuptools, and wheels packages to their
latest versions. This explicitly breaks reproducibility.

While we could enforce a specific version of all those packages
and still grab them from PyPI, we can simply grab them from the
distribution-provided packages instead.

Since we're using a pinned version of stretch, this already
guarantees we'll reproducibly get the same versions over and
over again. Besides, we just need to list flake8 as a package to
install to automatically get all its dependencies (again, in a
reproducible way).

This has the slight unfortunate drawback of downgrading flake8
to version 3.2.1, from version 3.5.0, as well as downgrading a
few of flake8's dependencies, as noticed by Ricardo:
    http://lists.busybox.net/pipermail/buildroot/2018-May/222376.html

However, as Ricardo said, there isn't "any serious limitation of
this old version, the release notes for a version in the between
mentions 'Dramatically improve the performance' but we have a
limited number of scripts and running on Gitlab for all of them
still takes less than 5 minutes".

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>

---
Changes v1 -> v2:
  - improve commit log to mention downgrading of flake8  (Ricardo)
  - correctly use python2's version of flake8, not python3's  (Ricardo)
  - fix typoes  (Ricardo)
---
 support/docker/Dockerfile | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index fe9e643a34..8d40aeecdf 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -35,9 +35,9 @@ RUN apt-get install -y --no-install-recommends \
         libncurses5-dev \
         locales \
         mercurial \
+        python-flake8 \
         python-nose2 \
         python-pexpect \
-        python-pip \
         qemu-system-arm \
         qemu-system-x86 \
         rsync \
@@ -48,14 +48,6 @@ RUN apt-get install -y --no-install-recommends \
     apt-get -y autoremove && \
     apt-get -y clean
 
-# For check-flake8
-RUN python -m pip install --upgrade pip setuptools wheel && \
-    pip install -q \
-        flake8==3.5.0 \
-        mccabe==0.6.1 \
-        pycodestyle==2.3.1 \
-        pyflakes==1.6.0
-
 # To be able to generate a toolchain with locales, enable one UTF-8 locale
 RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen && \
     /usr/sbin/locale-gen
-- 
2.14.1
