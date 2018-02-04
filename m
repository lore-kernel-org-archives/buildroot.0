From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Feb 2018 21:52:03 +0100
Subject: [Buildroot] [git commit] support/docker: limit the number of layers
Message-ID: <20180204210102.9B08E88391@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7517aef4dcfbf6ae298f41f3ddd1187523b016e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The official documentation [0] suggests limiting the number of layers
generated from a dockerfile. A layer is created for each RUN (and COPY
and ADD) command. But we are only ever interested in the final image,
so the intermediate layers are useless to us.

Limit the number of RUN commands to limit the number of generated
layers.

[0] https://docs.docker.com/develop/develop-images/dockerfile_best-practices/#minimize-the-number-of-layers

Reported-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/docker/Dockerfile | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index ebb471f7e5..23018585eb 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -11,25 +11,25 @@ description="Container with everything needed to run Buildroot"
 # Setup environment
 ENV DEBIAN_FRONTEND noninteractive
 
-RUN dpkg --add-architecture i386
 # The container has no package lists, so need to update first
-RUN apt-get update -y -qq
-RUN apt-get install -y -qq --no-install-recommends \
-    build-essential cmake libc6:i386 gcc-multilib \
-    bc ca-certificates file locales rsync \
-    cvs bzr git mercurial subversion wget \
-    cpio unzip \
-    libncurses5-dev \
-    python-nose2 python-pexpect qemu-system-arm qemu-system-x86
-RUN apt-get -q -y autoremove
-RUN apt-get -q -y clean
+RUN dpkg --add-architecture i386 && \
+    apt-get update -y -qq && \
+    apt-get install -y -qq --no-install-recommends \
+        build-essential cmake libc6:i386 gcc-multilib \
+        bc ca-certificates file locales rsync \
+        cvs bzr git mercurial subversion wget \
+        cpio unzip \
+        libncurses5-dev \
+        python-nose2 python-pexpect qemu-system-arm qemu-system-x86 && \
+    apt-get -q -y autoremove && \
+    apt-get -q -y clean
 
 # To be able to generate a toolchain with locales, enable one UTF-8 locale
-RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen
-RUN /usr/sbin/locale-gen
+RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen && \
+    /usr/sbin/locale-gen
 
-RUN useradd -ms /bin/bash br-user
-RUN chown -R br-user:br-user /home/br-user
+RUN useradd -ms /bin/bash br-user && \
+    chown -R br-user:br-user /home/br-user
 
 USER br-user
 WORKDIR /home/br-user
