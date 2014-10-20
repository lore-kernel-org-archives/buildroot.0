From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 20 Oct 2014 21:54:26 +0200
Subject: [Buildroot] [PATCH] ngrep: update include path of libpcap so bpf.h
	can be found
Message-ID: <1413834866-22111-1-git-send-email-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

The libpcap headers have moved from /usr/include to /usr/include/pcap,
although /usr/include/pcap.h still exists for backwards-compatibility
(but is a stub that simply includes pcap/pcap.h).
The ngrep package tries to find bpf.h based on the include statements in
pcap.h. If we point ngrep to /usr/include/pcap.h, bpf.h will not be
found and the associated functionality will not work.

The fix is to pass the new include path to the ngrep configure step.

Fixes bug #7370

[1] https://bugs.busybox.net/show_bug.cgi?id=7370

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
---
 package/ngrep/ngrep.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ngrep/ngrep.mk b/package/ngrep/ngrep.mk
index b7e0eb6..eb63e17 100644
--- a/package/ngrep/ngrep.mk
+++ b/package/ngrep/ngrep.mk
@@ -18,7 +18,7 @@ endif
 NGREP_CONF_ENV += LIBS+="$(NGREP_LIBS)"
 
 NGREP_CONF_OPTS =  \
-	--with-pcap-includes=$(STAGING_DIR)/usr/include \
+	--with-pcap-includes=$(STAGING_DIR)/usr/include/pcap \
 	--enable-pcre \
 	--with-pcre=$(STAGING_DIR)/usr \
 	--disable-dropprivs
-- 
1.8.5.1
