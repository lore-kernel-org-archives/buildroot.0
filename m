From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 13 Jul 2018 08:38:36 +0200
Subject: [Buildroot] [PATCH 2/5] support/docker: rename the Dockerfile and
 its accompanying file
In-Reply-To: <cover.1531463897.git.yann.morin.1998@free.fr>
References: <cover.1531463897.git.yann.morin.1998@free.fr>
Message-ID: <adea9d795751dd2ddcc2b205a7eb90da24990d7c.1531463897.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we only generate one docker image, for use by the gitlab-ci
infra.

However, users have expressed an interest in using that image for other
uses, like:

  - reproducing build failures as reported by the gitlab-ci jobs;

  - having a ready-to-use base image to use as-is, or as a template for
    further customisations.

Additionally, some users have reported the need for similar base images,
but based off different distros, with the same goals as above, plus:

  - reproducing build failures reported by users on other distros.

As a first step toward providing such images, rename our Dockerfile to
include the name and version of the distro it is based off.

We add a symlink so that we still have a 'base' image that we can
reference from the gitla-ci infra.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/docker/Dockerfile.base                                     | 1 +
 support/docker/{Dockerfile => Dockerfile.debian-stretch}           | 7 +++++--
 .../docker/{apt-sources.list => debian-stretch.apt-sources.list}   | 0
 3 files changed, 6 insertions(+), 2 deletions(-)
 create mode 120000 support/docker/Dockerfile.base
 rename support/docker/{Dockerfile => Dockerfile.debian-stretch} (87%)
 rename support/docker/{apt-sources.list => debian-stretch.apt-sources.list} (100%)

diff --git a/support/docker/Dockerfile.base b/support/docker/Dockerfile.base
new file mode 120000
index 0000000000..06a988b45e
--- /dev/null
+++ b/support/docker/Dockerfile.base
@@ -0,0 +1 @@
+Dockerfile.debian-stretch
\ No newline at end of file
diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile.debian-stretch
similarity index 87%
rename from support/docker/Dockerfile
rename to support/docker/Dockerfile.debian-stretch
index 36cd3b28a4..2a178e3ca4 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile.debian-stretch
@@ -1,6 +1,9 @@
+# vi: ft=dockerfile
 # This Dockerfile generates the docker image that gets used by Gitlab CI
 # To build it (YYYYMMDD.HHMM is the current date and time in UTC):
-#   sudo docker build -t buildroot/base:YYYYMMDD.HHMM support/docker
+#   sudo docker build -t buildroot/base:YYYYMMDD.HHMM \
+#                     -f support/docker/Dockerfile.debian-stretch \
+#                     support/docker
 #   sudo docker push buildroot/base:YYYYMMDD.HHMM
 
 # We use a specific tag for the base image *and* the corresponding date
@@ -16,7 +19,7 @@ description="Container with everything needed to run Buildroot"
 ENV DEBIAN_FRONTEND noninteractive
 
 # This repository can be a bit slow at times. Don't panic...
-COPY apt-sources.list /etc/apt/sources.list
+COPY debian-stretch.apt-sources.list /etc/apt/sources.list
 
 # The container has no package lists, so need to update first
 RUN dpkg --add-architecture i386 && \
diff --git a/support/docker/apt-sources.list b/support/docker/debian-stretch.apt-sources.list
similarity index 100%
rename from support/docker/apt-sources.list
rename to support/docker/debian-stretch.apt-sources.list
-- 
2.14.1
