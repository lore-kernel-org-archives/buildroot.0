From: Simon Dawson <spdawson@gmail.com>
Date: Wed, 7 Mar 2012 21:14:13 +0000
Subject: [Buildroot] New package protobuf
In-Reply-To: <20120307202304.19ec2f11@skate>
References: <CAHt8ZCM9ZD=VSEc5UJ+98NTiwhYsAz0sGXCt+yNPVMAKCB8qtg@mail.gmail.com>
 <20120307202304.19ec2f11@skate>
Message-ID: <CAHt8ZCPFyS15PPKmQtWAaFNpDw4JKNvfFZgWegAJoA8v1GYxQw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas.

Thanks for your comments; re-worked patch attached below.

> Just curious, what does protobuf installs on the target? Is it a library? A utility?

Both a utility (/usr/bin/protoc, the protocol buffers compiler) and a
set of libraries (/usr/lib/libproto*.so) are installed on the target.

Simon.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---

diff --git a/package/Config.in b/package/Config.in
index 41cbb8c..a2d2006 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -387,6 +387,7 @@ source "package/liburcu/Config.in"
 source "package/lttng-libust/Config.in"
 source "package/orc/Config.in"
 source "package/poco/Config.in"
+source "package/protobuf/Config.in"
 source "package/startup-notification/Config.in"
 endmenu

diff --git a/package/protobuf/Config.in b/package/protobuf/Config.in
new file mode 100644
index 0000000..1b0085b
--- /dev/null
+++ b/package/protobuf/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PROTOBUF
+	bool "protobuf"
+	help
+	  Protocol buffers are Google's language-neutral, platform-neutral,
+	  extensible mechanism for serializing structured data.
+
+	  http://code.google.com/p/protobuf/
diff --git a/package/protobuf/protobuf.mk b/package/protobuf/protobuf.mk
new file mode 100644
index 0000000..f4d82cb
--- /dev/null
+++ b/package/protobuf/protobuf.mk
@@ -0,0 +1,15 @@
+#############################################################
+#
+# protobuf
+#
+#############################################################
+PROTOBUF_VERSION := 2.4.1
+PROTOBUF_SOURCE := protobuf-$(PROTOBUF_VERSION).tar.gz
+PROTOBUF_SITE := http://protobuf.googlecode.com/files/
+
+# N.B. Need to use host protoc during cross compilation.
+PROTOBUF_DEPENDENCIES := host-protobuf
+PROTOBUF_CONF_OPT := --with-protoc=$(HOST_DIR)/usr/bin/protoc
+
+$(eval $(call AUTOTARGETS))
+$(eval $(call AUTOTARGETS,host))
