From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 2 Jul 2017 18:13:23 +0200
Subject: [Buildroot] [PATCH 2/3] Add Dockerfile for CI
In-Reply-To: <20170702161324.485-1-arnout@mind.be>
References: <20170702161324.485-1-arnout@mind.be>
Message-ID: <20170702161324.485-2-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For Gitlab-CI, we want to avoid re-generating the minimal install to
be able to run tests all the time. So let's create a docker image that
we can post on Docker Hub and then pull.

For the time being, this is just what we need for running our CI. Later
we can produce something that is also useful for users.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/docker/Dockerfile | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 support/docker/Dockerfile

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
new file mode 100644
index 0000000000..d45b23dc23
--- /dev/null
+++ b/support/docker/Dockerfile
@@ -0,0 +1,30 @@
+# This Dockerfile generates the docker image that gets used by Gitlab CI
+# To build it:
+#   sudo docker build -t buildroot/base support/docker
+#   sudo docker push buildroot/base
+
+FROM debian:stable
+LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
+      vendor="Buildroot" \
+description="Container with everything needed to run Buildroot"
+
+# Setup environment
+ENV DEBIAN_FRONTEND noninteractive
+
+RUN dpkg --add-architecture i386
+# The container has no package lists, so need to update first
+RUN apt-get update -y -qq
+RUN apt-get install -y -qq --no-install-recommends \
+    build-essential cmake libc6:i386 gcc-multilib \
+    bc ca-certificates file locales rsync \
+    cvs bzr git mercurial subversion wget \
+    cpio unzip \
+    libncurses5-dev \
+    python-nose2 python-pexpect qemu-system-arm qemu-system-x86
+RUN apt-get -q -y autoremove
+RUN apt-get -q -y clean
+
+# To be able to generate a toolchain with locales, enable one UTF-8 locale
+RUN sed -i 's/# \(en_US.UTF-8\)/\1/' /etc/locale.gen
+RUN /usr/sbin/locale-gen
+
-- 
2.13.2
