From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Jul 2018 08:38:37 +0200
Subject: [Buildroot] [PATCH 3/5] support/docker: add a Fedore-28 based image
In-Reply-To: <cover.1531463897.git.yann.morin.1998@free.fr>
References: <cover.1531463897.git.yann.morin.1998@free.fr>
Message-ID: <2738bd4dedf368eb12a7564eff1c2c33b696691f.1531463897.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hopefully, this image is reproducible, since we are not using any update
repository, and from the looks of it, the repository of the release is
never touched.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/docker/Dockerfile.fedora-28 | 48 +++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 support/docker/Dockerfile.fedora-28

diff --git a/support/docker/Dockerfile.fedora-28 b/support/docker/Dockerfile.fedora-28
new file mode 100644
index 0000000000..7b8e193bc4
--- /dev/null
+++ b/support/docker/Dockerfile.fedora-28
@@ -0,0 +1,48 @@
+# vi: ft=dockerfile
+# Note: this dockerfile is not reproducible, because the repository
+# where we fetch packages from is not pinned to a specific point in
+# time; i.e. we'll get whatever is current at the moment we build.
+
+FROM fedora:28
+
+# Fedora's Dokerfile does not provide a edefault command
+CMD ["bash"]
+
+LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
+      vendor="Buildroot" \
+      description="Container based on Fedora 28, with everything needed to run Buildroot already installed"
+
+# Remove the repository with updates, so we only
+# get packages as they were at time of release.
+RUN rm -f /etc/yum.repos.d/fedora-updates*.repo && \
+    dnf -y install \
+        @development-tools \
+        bc \
+        bzip2 \
+        bzr \
+        cpio \
+        cvs \
+        file \
+        gcc-c++ \
+        git \
+        ncurses-devel \
+        mercurial \
+        perl-ExtUtils-MakeMaker \
+        perl-Thread-Queue \
+        python-nose2 \
+        python-pexpect \
+        qemu-system-arm \
+        qemu-system-x86 \
+        rsync \
+        subversion \
+        unzip \
+        wget \
+    && dnf -y clean all
+
+RUN useradd -ms /bin/bash br-user && \
+    chown -R br-user:br-user /home/br-user
+
+USER br-user
+WORKDIR /home/br-user
+ENV HOME /home/br-user
+ENV LC_ALL en_US.UTF-8
-- 
2.14.1
