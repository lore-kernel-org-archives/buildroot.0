From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 28 Nov 2017 17:23:21 +0200
Subject: [Buildroot] [PATCH] libevent: disable openssl for host
Message-ID: <ee53e592d9f9bab35454d044fdcdae3ac67a9b45.1511882601.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As host-libevent does not depend on host-openssl, it might attempt to
build against the host installed openssl. This does not work very well
on various hosts. Since we don't really need encryption support in
host-libevent just disable openssl support.

Disable build of example code as we already do for the target libevent.

Should fix:
http://autobuild.buildroot.net/results/403/403886e3afc6d5d18a138f4b0651f3c5a50ed064/
http://autobuild.buildroot.net/results/a2a/a2a84692049b0fb8038f1ad4b06554ecdac32e3c/
http://autobuild.buildroot.net/results/a36/a36abb1ac556a8b50e140ea1851955744b152608/

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/libevent/libevent.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index fc4108f6fd08..65bf1c2b7b9f 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -12,6 +12,7 @@ LIBEVENT_LICENSE_FILES = LICENSE
 # For 0001-Disable-building-test-programs.patch
 LIBEVENT_AUTORECONF = YES
 LIBEVENT_CONF_OPTS = --disable-samples
+HOST_LIBEVENT_CONF_OPTS = --disable-samples --disable-openssl
 
 define LIBEVENT_REMOVE_PYSCRIPT
 	rm $(TARGET_DIR)/usr/bin/event_rpcgen.py
-- 
2.15.0
