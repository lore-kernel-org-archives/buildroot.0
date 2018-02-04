From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 Feb 2018 15:44:23 +0100
Subject: [Buildroot] [PATCH 2/5] support/docker: don't be silent when
 setting up
In-Reply-To: <cover.1517755438.git.yann.morin.1998@free.fr>
References: <cover.1517755438.git.yann.morin.1998@free.fr>
Message-ID: <e2a95790d1028f53be0c8e4cb0f636410f7ab309.1517755438.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This image is not built very often, and when it is, it is important to
see what's going on, so don't be silent when installing packages from
the distro, and since that can take a bit of time it thus serves as
progress report...

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 support/docker/Dockerfile | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 23018585eb..aa2b38fcc9 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -13,16 +13,16 @@ ENV DEBIAN_FRONTEND noninteractive
 
 # The container has no package lists, so need to update first
 RUN dpkg --add-architecture i386 && \
-    apt-get update -y -qq && \
-    apt-get install -y -qq --no-install-recommends \
+    apt-get update -y && \
+    apt-get install -y --no-install-recommends \
         build-essential cmake libc6:i386 gcc-multilib \
         bc ca-certificates file locales rsync \
         cvs bzr git mercurial subversion wget \
         cpio unzip \
         libncurses5-dev \
         python-nose2 python-pexpect qemu-system-arm qemu-system-x86 && \
-    apt-get -q -y autoremove && \
-    apt-get -q -y clean
+    apt-get -y autoremove && \
+    apt-get -y clean
 
 # To be able to generate a toolchain with locales, enable one UTF-8 locale
 RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen && \
-- 
2.14.1
