From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 29 Feb 2020 23:39:47 +0100
Subject: [Buildroot] [PATCH 1/1] package/suricata: fix CVE-2019-18792
Message-ID: <20200229223947.4061978-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

An issue was discovered in Suricata 5.0.0. It is possible to
bypass/evade any tcp based signature by overlapping a TCP segment with a
fake FIN packet. The fake FIN packet is injected just before the PUSH
ACK packet we want to bypass. The PUSH ACK packet (containing the data)
will be ignored by Suricata because it overlaps the FIN packet (the
sequence and ack number are identical in the two packets). The client
will ignore the fake FIN packet because the ACK flag is not set. Both
linux and windows clients are ignoring the injected packet.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...004-stream-reject-broken-ACK-packets.patch | 40 +++++++++++++++++++
 package/suricata/suricata.mk                  |  3 ++
 2 files changed, 43 insertions(+)
 create mode 100644 package/suricata/0004-stream-reject-broken-ACK-packets.patch

diff --git a/package/suricata/0004-stream-reject-broken-ACK-packets.patch b/package/suricata/0004-stream-reject-broken-ACK-packets.patch
new file mode 100644
index 0000000000..9670d73158
--- /dev/null
+++ b/package/suricata/0004-stream-reject-broken-ACK-packets.patch
@@ -0,0 +1,40 @@
+From 1c63d3905852f746ccde7e2585600b2199cefb4b Mon Sep 17 00:00:00 2001
+From: Victor Julien <victor@inliniac.net>
+Date: Thu, 21 Nov 2019 16:10:21 +0100
+Subject: [PATCH] stream: reject broken ACK packets
+
+Fix evasion posibility by rejecting packets with a broken ACK field.
+These packets have a non-0 ACK field, but do not have a ACK flag set.
+
+Bug #3324.
+
+Reported-by: Nicolas Adba
+(cherry picked from commit fa692df37a796c3330c81988d15ef1a219afc006)
+[Retrieved from:
+https://github.com/OISF/suricata/commit/1c63d3905852f746ccde7e2585600b2199cefb4b]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/stream-tcp.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/stream-tcp.c b/src/stream-tcp.c
+index 35e489acba..8653d670c6 100644
+--- a/src/stream-tcp.c
++++ b/src/stream-tcp.c
+@@ -4759,6 +4759,7 @@ int StreamTcpPacket (ThreadVars *tv, Packet *p, StreamTcpThread *stt,
+     /* broken TCP http://ask.wireshark.org/questions/3183/acknowledgment-number-broken-tcp-the-acknowledge-field-is-nonzero-while-the-ack-flag-is-not-set */
+     if (!(p->tcph->th_flags & TH_ACK) && TCP_GET_ACK(p) != 0) {
+         StreamTcpSetEvent(p, STREAM_PKT_BROKEN_ACK);
++        goto error;
+     }
+ 
+     /* If we are on IPS mode, and got a drop action triggered from
+@@ -6883,7 +6884,7 @@ static int StreamTcpTest10 (void)
+ 
+     tcph.th_win = htons(5480);
+     tcph.th_seq = htonl(10);
+-    tcph.th_ack = htonl(11);
++    tcph.th_ack = 0;
+     tcph.th_flags = TH_SYN;
+     p->tcph = &tcph;
+ 
diff --git a/package/suricata/suricata.mk b/package/suricata/suricata.mk
index b1f0e18dbc..2cc0c656ff 100644
--- a/package/suricata/suricata.mk
+++ b/package/suricata/suricata.mk
@@ -11,6 +11,9 @@ SURICATA_LICENSE_FILES = COPYING LICENSE
 # We're patching configure.ac
 SURICATA_AUTORECONF = YES
 
+# 0004-stream-reject-broken-ACK-packets.patch
+SURICATA_IGNORE_CVES += CVE-2019-18792 
+
 SURICATA_DEPENDENCIES = \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_JANSSON),jansson) \
-- 
2.25.0
