From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 29 Nov 2017 17:38:15 +0100
Subject: [Buildroot] [git commit] libevent: disable openssl for host
Message-ID: <20171129163118.5A265810D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=66426bfbc8de807d779bc08e2a5b28566a5a4c68
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libevent/libevent.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libevent/libevent.mk b/package/libevent/libevent.mk
index fc4108f..65bf1c2 100644
--- a/package/libevent/libevent.mk
+++ b/package/libevent/libevent.mk
@@ -12,6 +12,7 @@ LIBEVENT_LICENSE_FILES = LICENSE
 # For 0001-Disable-building-test-programs.patch
 LIBEVENT_AUTORECONF = YES
 LIBEVENT_CONF_OPTS = --disable-samples
+HOST_LIBEVENT_CONF_OPTS = --disable-samples --disable-openssl
 
 define LIBEVENT_REMOVE_PYSCRIPT
 	rm $(TARGET_DIR)/usr/bin/event_rpcgen.py
