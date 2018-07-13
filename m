From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Jul 2018 08:38:38 +0200
Subject: [Buildroot] [PATCH 4/5] support/docker: add an Arch image
In-Reply-To: <cover.1531463897.git.yann.morin.1998@free.fr>
References: <cover.1531463897.git.yann.morin.1998@free.fr>
Message-ID: <b909713a26b89db6eae65efffa7e05a8136fd9df.1531463897.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hopefully, this image is reproducible, since we are using a tagged
base image, plus a pinned repository mirror.

As for the Debian-stretch Dockerfile, we refresh the repository and
install packages in two different layers (see commit c4f844ff321
(support/docker: run apt-get update and apt-get install in two RUNs)
for in-depth explanations.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/docker/Dockerfile.arch-2018.07.01 | 40 +++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 support/docker/Dockerfile.arch-2018.07.01

diff --git a/support/docker/Dockerfile.arch-2018.07.01 b/support/docker/Dockerfile.arch-2018.07.01
new file mode 100644
index 0000000000..65e74d0fdb
--- /dev/null
+++ b/support/docker/Dockerfile.arch-2018.07.01
@@ -0,0 +1,40 @@
+# vi: ft=dockerfile
+
+# When updating this version, please also update it below.
+FROM base/devel:2018.07.01
+
+LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
+      vendor="Buildroot" \
+      description="Container based on Arch 2018.07.01, with everything needed to run Buildroot already installed"
+
+# Pin the repository to a known version
+RUN echo 'Server=https://archive.archlinux.org/repos/2018/07/01/$repo/os/$arch' \
+        > /etc/pacman.d/mirrorlist && \
+    pacman -Sy
+RUN pacman --noconfirm -S \
+        bc \
+        bzr \
+        cvs \
+        cpio \
+        flake8 \
+        git \
+        mercurial \
+        python \
+        python-nose2 \
+        python-pexpect \
+        qemu \
+        qemu-arch-extra \
+        rsync \
+        subversion \
+        unzip \
+        wget
+
+RUN sed -i 's/# *\(en_US.UTF-8\)/\1/' /etc/locale.gen \
+    && /usr/sbin/locale-gen
+
+RUN useradd -ms /bin/bash br-user
+
+USER br-user
+WORKDIR /home/br-user
+ENV HOME /home/br-user
+ENV LC_ALL en_US.UTF-8
-- 
2.14.1
