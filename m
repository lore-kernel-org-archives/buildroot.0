From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 21 Jun 2020 09:59:55 +0200
Subject: [Buildroot] [PATCH v3 2/7] board/guest: documentation and sample
 files
In-Reply-To: <20200621080000.180089-1-francois.perrad@gadz.org>
References: <20200621080000.180089-1-francois.perrad@gadz.org>
Message-ID: <20200621080000.180089-3-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 DEVELOPERS             |   1 +
 board/guest/Dockerfile |   2 +
 board/guest/readme.txt | 143 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 146 insertions(+)
 create mode 100644 board/guest/Dockerfile
 create mode 100644 board/guest/readme.txt

diff --git a/DEVELOPERS b/DEVELOPERS
index 035a75358..2ec84e611 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -904,6 +904,7 @@ N:	Francisco Gonzalez <gzmorell@gmail.com>
 F:	package/ser2net/
 
 N:	Francois Perrad <francois.perrad@gadz.org>
+F:	board/guest/
 F:	board/olimex/a20_olinuxino
 F:	board/olimex/imx233_olinuxino/
 F:	configs/guest_*
diff --git a/board/guest/Dockerfile b/board/guest/Dockerfile
new file mode 100644
index 000000000..d218acad1
--- /dev/null
+++ b/board/guest/Dockerfile
@@ -0,0 +1,2 @@
+FROM scratch
+ADD rootfs.tar /
diff --git a/board/guest/readme.txt b/board/guest/readme.txt
new file mode 100644
index 000000000..31087ef38
--- /dev/null
+++ b/board/guest/readme.txt
@@ -0,0 +1,143 @@
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
+    $ docker build --tag br:guest .
+    $ docker images
+    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
+    br                  guest               0c54c85a3452        42 seconds ago      1.75MB
+
+The Docker image could be exported and imported with the commands `docker save` and `docker load`.
+
+And the Docker image could be launched in interactive mode:
+
+    $ docker run -it br:guest /bin/ash
+        / # ls -l /bin/ash
+        lrwxrwxrwx    1 root     root             7 Mar 11 15:46 /bin/ash -> busybox
+        / # exit
+
+This Docker image is like a toy, for serious thinks like running in daemon mode with a systemd init,
+another Dockerfile is needed, see the following example adapted from [SkiffOS](https://github.com/paralin/SkiffOS)
+
+    $ cat Dockerfile
+    FROM scratch
+
+    ENV container docker
+    ENV init /lib/systemd/systemd
+    ENV LC_ALL C
+
+    ADD rootfs.tar /
+
+    USER root
+    RUN find /etc/systemd/system \
+             /usr/lib/systemd/system \
+             \( -path '*.wants/*' \
+             -name '*swapon*' \
+             -or -name '*ntpd*' \
+             -or -name '*resolved*' \
+             -or -name '*udev*' \
+             -or -name '*rdisc*' \
+             -or -name '*freedesktop*' \
+             -or -name '*persist-resize*' \
+             -or -name '*NetworkManager*' \
+             -or -name '*remount-fs*' \
+             -or -name '*getty*' \
+             -or -name '*.mount' \
+             -or -name '*remote-fs*' \) \
+             -exec echo \{} \; \
+             -exec rm \{} \;
+
+    VOLUME [ "/sys/fs/cgroup" ]
+    ENTRYPOINT ["/usr/lib/systemd/systemd"]
+
+    $ docker build --tag br:guest .
+    $ docker images
+    REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
+    br                  guest               0ce72ab89517        10 seconds ago      19.9MB
+
+Running in daemon mode:
+
+    $ docker run -d \
+        --privileged \
+        --cap-add=NET_ADMIN \
+        --security-opt seccomp=unconfined \
+        --stop-signal=SIGRTMIN+3 \
+        --tmpfs /run \
+        --tmpfs /run/lock \
+        -t \
+        -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
+        br:guest
+    $ docker ps
+    CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
+    14cc7dabc0c2        br:guest            "/usr/lib/systemd/sy..." 5 seconds ago       Up 5 seconds                            distracted_chaum
+
+Execute an interactive command in the running container:
+
+    $ docker exec -it 14cc7dabc0c2 /bin/ash
+    / # ps
+    PID   USER     COMMAND
+        1 root     /usr/lib/systemd/systemd
+       15 root     /usr/lib/systemd/systemd-journald
+       24 dbus     /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation --syslog-only
+       38 root     /bin/ash
+       44 root     ps
+    / #
+    / # exit
+
+Finally, stoping the container:
+
+    $ docker stop 14cc7dabc0c2
+
+
+How to with systemd-nspawn
+==========================
+
+On the host side, BR2_PACKAGE_SYSTEMD_MACHINED is needed (or run systemd-nspawn with --register=no).
+
+Extract rootfs.tar in a directory /usr/lib/machines/container.
+
+Running in interactive mode:
+
+    # systemd-nspawn --machine=container
+        # ps
+        PID   USER     COMMAND
+            1 root     -sh
+            3 root     ps
+        # exit
+
+Running in daemon mode (with the guest systemd init):
+
+    # systemd-nspawn --machine=container --boot
+        # ps
+        PID   USER     COMMAND
+            1 root     /usr/lib/systemd/systemd
+           11 root     /usr/lib/systemd/systemd-journald
+           20 systemd- /usr/lib/systemd/systemd-resolved
+           23 root     -sh
+           24 dbus     /usr/bin/dbud-daemon --system --address=systemd: --nofork --nopi
+           33 root     ps
+        # halt
-- 
2.25.1
