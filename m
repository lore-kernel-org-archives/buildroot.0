From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 30 May 2020 14:47:30 +0200
Subject: [Buildroot] [PATCH v2 2/7] board/guest: documentation and sample
 files
In-Reply-To: <20200530124735.1384078-1-francois.perrad@gadz.org>
References: <20200530124735.1384078-1-francois.perrad@gadz.org>
Message-ID: <20200530124735.1384078-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS             |  1 +
 board/guest/Dockerfile |  3 +++
 board/guest/readme.txt | 53 ++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 57 insertions(+)
 create mode 100644 board/guest/Dockerfile
 create mode 100644 board/guest/readme.txt

diff --git a/DEVELOPERS b/DEVELOPERS
index e930c011b..a9cff405c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -932,6 +932,7 @@ N:	Francisco Gonzalez <gzmorell@gmail.com>
 F:	package/ser2net/
 
 N:	Francois Perrad <francois.perrad@gadz.org>
+F:	board/guest/
 F:	board/olimex/a20_olinuxino
 F:	board/olimex/imx233_olinuxino/
 F:	configs/guest_*
diff --git a/board/guest/Dockerfile b/board/guest/Dockerfile
new file mode 100644
index 000000000..712a134c9
--- /dev/null
+++ b/board/guest/Dockerfile
@@ -0,0 +1,3 @@
+FROM scratch
+ADD rootfs.tar /
+CMD ["/bin/ash"]
diff --git a/board/guest/readme.txt b/board/guest/readme.txt
new file mode 100644
index 000000000..40664dc99
--- /dev/null
+++ b/board/guest/readme.txt
@@ -0,0 +1,53 @@
+Container - Guest
+
+Intro
+=====
+
+Buildroot supports some OS-level virtualization tools: Docker, LXC, systemd-nspawn.
+These tools are built on an host image.
+
+A container could be created from a rootfs (guest image) built by Buildroot with a guest_*_defconfig
+
+The following defconfig are available:
+    - guest_arm_a7_defconfig
+    - guest_arm_a9_defconfig
+    - guest_x86_64_defconfig
+
+The artifact produced by these defconfig is the file output/images/rootfs.tar.
+The guest has no bootloader, no kernel.
+
+How to with Docker
+==================
+
+A Docker image could created with a Dockerfile and few commands are needed:
+
+    # dockerd &
+
+    $ cat Dockerfile
+    FROM scratch
+    ADD rootfs.tar /
+    CMD ["/bin/ash"]
+    $ docker build --tag br:guest .
+    $ docker images
+    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
+    br                  guest               0c54c85a3452        42 seconds ago      1.75MB
+
+The Docker image could be exported and imported with the commands `docker save` and `docker load`.
+
+And the Docker image could be launched:
+
+    $ docker run -it br:guest
+        / # ls -l /bin/sh
+        lrwxrwxrwx    1 root     root             7 Mar 11 15:46 /bin/sh -> busybox
+        / # exit
+
+How to with systemd-nspawn
+==========================
+
+Extract rootfs.tar in a directory container.
+
+    # systemd-nspawn -D container
+        # ls -l /bin/sh
+        lrwxrwxrwx    1 1002     1002             7 Mar 11 15:46 /bin/sh -> busybox
+        # exit
+
-- 
2.25.1
