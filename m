From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Apr 2015 22:07:26 +0200
Subject: [Buildroot] [git commit] package/rng-tools: add systemd support for
	rngd
Message-ID: <20150422200821.1398081D6D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=22cb51e1a2cdff07f220d7519d05934f6ce1bf2c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add rngd.service for systemd. Also patch rngd with patch from Fedora to
ignore failure if no hwrng present:
https://bugzilla.redhat.com/show_bug.cgi?id=892178

[Thomas:
 - rename patch to the proper naming convention
 - add description and SoB to patch
 - install service file to /usr/lib/systemd and not /lib/systemd
 - use a relative symbolic link instead of an absolute one]

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rng-tools/0001-rngd-exit-code.patch |   22 ++++++++++++++++++++++
 package/rng-tools/rng-tools.mk              |    8 ++++++++
 package/rng-tools/rngd.service              |    9 +++++++++
 3 files changed, 39 insertions(+), 0 deletions(-)

diff --git a/package/rng-tools/0001-rngd-exit-code.patch b/package/rng-tools/0001-rngd-exit-code.patch
new file mode 100644
index 0000000..709e20c
--- /dev/null
+++ b/package/rng-tools/0001-rngd-exit-code.patch
@@ -0,0 +1,22 @@
+Exit with a special value when RNG modules are not available
+
+Instead of returning with an error, exit with a special value when the
+RNG kernel modules are not present in the kernel. This is not really a
+hard failure.
+
+Patch borrowed from Fedora, at
+http://pkgs.fedoraproject.org/cgit/rng-tools.git/tree/rngd-exit-code.patch.
+
+Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
+
+--- a/rngd.c
++++ b/rngd.c
+@@ -319,7 +319,7 @@ int main(int argc, char **argv)
+ 			message(LOG_DAEMON|LOG_ERR,
+ 				"Maybe RNG device modules are not loaded\n");
+ 		}
+-		return 1;
++		return 66;
+ 	}
+ 
+ 	if (arguments->verbose) {
diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
index 5b89656..8648c4f 100644
--- a/package/rng-tools/rng-tools.mk
+++ b/package/rng-tools/rng-tools.mk
@@ -21,4 +21,12 @@ else
 RNG_TOOLS_CONF_OPTS += --without-libgcrypt
 endif
 
+define RNG_TOOLS_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 644 package/rng-tools/rngd.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/rngd.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/rngd.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/rngd.service
+endef
+
 $(eval $(autotools-package))
diff --git a/package/rng-tools/rngd.service b/package/rng-tools/rngd.service
new file mode 100644
index 0000000..3bdc4c1
--- /dev/null
+++ b/package/rng-tools/rngd.service
@@ -0,0 +1,9 @@
+[Unit]
+Description=Hardware RNG Entropy Gatherer Daemon
+
+[Service]
+ExecStart=/usr/sbin/rngd -f
+SuccessExitStatus=66
+
+[Install]
+WantedBy=multi-user.target
