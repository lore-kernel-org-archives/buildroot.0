From: =?UTF-8?q?Bj=C3=B8rn=20Forsman?= <bjorn.forsman@gmail.com>
Date: Thu, 22 Oct 2015 10:22:30 +0200
Subject: [Buildroot] [PATCH 1/2] Makefile: use root-relative -f path for
	/sbin/ldconfig
Message-ID: <1445502151-25735-1-git-send-email-bjorn.forsman@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Without this, the -f path argument is ignored:

 $ strace -f -s128 /sbin/ldconfig -r /home/vagrant/buildroot/output/target -f /home/vagrant/buildroot/output/target/etc/ld.so.conf |& grep "ld\.so\.conf"
 execve("/sbin/ldconfig", ["/sbin/ldconfig", "-r", "/home/vagrant/buildroot/output/target", "-f", "/home/vagrant/buildroot/output/target/etc/ld.so.conf"], [/* 61 vars */]) = 0
 execve("/sbin/ldconfig.real", ["/sbin/ldconfig.real", "-r", "/home/vagrant/buildroot/output/target", "-f", "/home/vagrant/buildroot/output/target/etc/ld.so.conf"], [/* 61 vars */]) = 0
 write(2, "Warning: ignoring configuration file that cannot be opened: /home/vagrant/buildroot/output/target/etc/ld.so.conf", 112Warning: ignoring configuration file that cannot be opened: /home/vagrant/buildroot/output/target/etc/ld.so.conf) = 112

Proof that using root-relative path -f path (/etc/ld.so.conf, without
$(TARGET_DIR) in front) picks up the correct file:

 $ strace -f -s128 /sbin/ldconfig -r /home/vagrant/buildroot/output/target -f /etc/ld.so.conf |& grep "ld\.so\.conf"
 execve("/sbin/ldconfig", ["/sbin/ldconfig", "-r", "/home/vagrant/buildroot/output/target", "-f", "/etc/ld.so.conf"], [/* 61 vars */]) = 0
 execve("/sbin/ldconfig.real", ["/sbin/ldconfig.real", "-r", "/home/vagrant/buildroot/output/target", "-f", "/etc/ld.so.conf"], [/* 61 vars */]) = 0
 lstat("/home/vagrant/buildroot/output/target/etc/ld.so.conf", {st_mode=S_IFREG|0644, st_size=0, ...}) = 0
 open("/home/vagrant/buildroot/output/target/etc/ld.so.conf", O_RDONLY) = 3

Tested on Ubuntu 14.04.

 $ /sbin/ldconfig --version
 ldconfig (Ubuntu EGLIBC 2.19-0ubuntu6.6) 2.19
 ...

$(TARGET_CROSS)ldconfig behaves differently (at least the ldconfig I
tested, which was built by Buildroot) and should not have root-relative
-f path. If it does, it will pick up host /etc/ld.so.conf file.

Signed-off-by: Bj?rn Forsman <bjorn.forsman@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index dd8959f..61ce1f9 100644
--- a/Makefile
+++ b/Makefile
@@ -607,7 +607,7 @@ endif
 					-f $(TARGET_DIR)/etc/ld.so.conf; \
 	else \
 		/sbin/ldconfig -r $(TARGET_DIR) \
-			       -f $(TARGET_DIR)/etc/ld.so.conf; \
+			       -f /etc/ld.so.conf; \
 	fi
 	( \
 		echo "NAME=Buildroot"; \
-- 
2.5.2
