From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Feb 2018 21:57:53 +0100
Subject: [Buildroot] [git commit] support/docker: use a fixed Debian snapshot
Message-ID: <20180204210102.BC7C288391@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5fdf5e4099ac8ca624b27f3b01d2a3eafb13e4f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since we're now using a specific base image tag, we need to also use a
specific, stable repository to get additional packages from for this
image.

As such, use the Debian snapshot that matches the base image.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/docker/Dockerfile       | 7 +++++++
 support/docker/apt-sources.list | 4 ++++
 2 files changed, 11 insertions(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 49b74b88bd..f18d195f37 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -3,7 +3,11 @@
 #   sudo docker build -t buildroot/base support/docker
 #   sudo docker push buildroot/base
 
+# We use a specific tag for the base image *and* the corresponding date
+# for the repository., so do not forget to update the apt-sources.list
+# file that is shipped next to this Dockerfile.
 FROM debian:stretch-20171210
+
 LABEL maintainer="Buildroot mailing list <buildroot@buildroot.org>" \
       vendor="Buildroot" \
 description="Container with everything needed to run Buildroot"
@@ -11,6 +15,9 @@ description="Container with everything needed to run Buildroot"
 # Setup environment
 ENV DEBIAN_FRONTEND noninteractive
 
+# This repository can be a bit slow at times. Don't panic...
+COPY apt-sources.list /etc/apt/sources.list
+
 # The container has no package lists, so need to update first
 RUN dpkg --add-architecture i386 && \
     apt-get update -y && \
diff --git a/support/docker/apt-sources.list b/support/docker/apt-sources.list
new file mode 100644
index 0000000000..789fb8fc17
--- /dev/null
+++ b/support/docker/apt-sources.list
@@ -0,0 +1,4 @@
+# Latest just before 20171210T000000Z:
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20171209T220346Z/ stretch main
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian/20171209T220346Z/ stretch-updates main
+deb [check-valid-until=no] http://snapshot.debian.org/archive/debian-security/20171209T224618Z/ stretch/updates main
