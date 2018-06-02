From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  3 Jun 2018 00:19:34 +0200
Subject: [Buildroot] [PATCH 4/4] support/docker: use the distro-provided
 flake8
In-Reply-To: <cover.1527977964.git.yann.morin.1998@free.fr>
References: <cover.1527977964.git.yann.morin.1998@free.fr>
Message-ID: <ff32083db8641c38fa6d02f731870583b24c4dab.1527977964.git.yann.morin.1998@free.fr>
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

Since we're using a pinned versiomn of stretch, this already
guarantees we'll reproducibily get the same versions over and
over again. Besides, we just need to list flake8 as a package to
install to automatically get all its dependencies (again, in a
reproducible way).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
 support/docker/Dockerfile | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 4f08a54f06..57c9ef78fa 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -29,6 +29,7 @@ RUN apt-get install -y --no-install-recommends \
         cpio \
         cvs \
         file \
+        flake8 \
         g++-multilib \
         git \
         libc6:i386 \
@@ -47,14 +48,6 @@ RUN apt-get install -y --no-install-recommends \
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
