Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3603FC48BC3
	for <buildroot@archiver.kernel.org>; Tue, 20 Feb 2024 18:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CAE0F41516;
	Tue, 20 Feb 2024 18:02:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6JlldaW7CAiK; Tue, 20 Feb 2024 18:02:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29EE041519
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29EE041519;
	Tue, 20 Feb 2024 18:02:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7A5291BF48D
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 18:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 68D9781F51
 for <buildroot@lists.busybox.net>; Tue, 20 Feb 2024 18:02:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YSbnDqMj2j72 for <buildroot@lists.busybox.net>;
 Tue, 20 Feb 2024 18:02:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F13F581F58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F13F581F58
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F13F581F58
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 18:02:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0164.dip0.t-ipconnect.de [91.58.1.100])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 15DD5A4C0EB9
 for <buildroot@buildroot.org>; Tue, 20 Feb 2024 19:02:25 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34876)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rcURk-0000000049D-1t1i
 for buildroot@buildroot.org; Tue, 20 Feb 2024 19:02:24 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 20 Feb 2024 19:02:23 +0100
Message-Id: <20240220180224.42576-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1708452145;
 bh=wwQ1/s+ZfQTx0itzOZzTPugUHbpmGnWx5tA4FP6Dmp8=;
 h=From:To:Subject:Date:From;
 b=hQ1XNEuvwi5WpOldtALd9M4FDohknnR2XxDpBfYLModAbUEFuwWzT4YUgDdGwWaGB
 +eHxmW8ipXYO2riyfaSspSuzRq+0nfgfAx85wuT2kT5uHNmqofW80xZTCpO71Qk0Fs
 iQH9np6hYBb68NZKPNOToSym2iX3fhcGui5/Wep/tiXwWF/f534VvEQwjmVLEbl8QI
 S+KYGMFk7ny6un755W9wiQvfv2aCFj3wZcJdHgoUracMtReVlsRBulYD9m1+Z/2v2v
 z/O4fEbNJLDsJtIdckTIGpEOJBA6ryxKBsBjzksn0pPmtnv0HvjpPGwzgZ5nhGGNhc
 wpDxyob5A6lCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=hQ1XNEuv
Subject: [Buildroot] [PATCH 1/2] package/dnsmasq: security bump version to
 2.90
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://thekelleys.org.uk/dnsmasq/CHANGELOG

Release notes:
https://lists.thekelleys.org.uk/pipermail/dnsmasq-discuss/2024q1/017430.html

Fixes CVE 2023-50387 and CVE 2023-50868.

Removed patch which is included in this release.
Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...default-maximum-dns-udp-package-size.patch | 64 -------------------
 package/dnsmasq/dnsmasq.hash                  |  4 +-
 package/dnsmasq/dnsmasq.mk                    |  4 +-
 3 files changed, 4 insertions(+), 68 deletions(-)
 delete mode 100644 package/dnsmasq/0001-set-default-maximum-dns-udp-package-size.patch

diff --git a/package/dnsmasq/0001-set-default-maximum-dns-udp-package-size.patch b/package/dnsmasq/0001-set-default-maximum-dns-udp-package-size.patch
deleted file mode 100644
index 4dd17ec069..0000000000
--- a/package/dnsmasq/0001-set-default-maximum-dns-udp-package-size.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From eb92fb32b746f2104b0f370b5b295bb8dd4bd5e5 Mon Sep 17 00:00:00 2001
-From: Simon Kelley <simon@thekelleys.org.uk>
-Date: Tue, 7 Mar 2023 22:07:46 +0000
-Subject: [PATCH] Set the default maximum DNS UDP packet size to 1232.
-Upstream: https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=eb92fb32b746f2104b0f370b5b295bb8dd4bd5e5
-
-http://www.dnsflagday.net/2020/ refers.
-
-Thanks to Xiang Li for the prompt.
-
-[dalang@gmx.at: backport from upstream]
-Signed-off-by: Daniel Lang <dalang@gmx.at>
----
- CHANGELOG     | 9 ++++++++
- man/dnsmasq.8 | 3 ++-
- src/config.h  | 2 +-
- 3 files changed, 12 insertions(+), 2 deletions(-)
-
-diff --git a/CHANGELOG b/CHANGELOG
-index 3af20cf..52d8678 100644
---- a/CHANGELOG
-+++ b/CHANGELOG
-@@ -1,3 +1,12 @@ version 2.90
-+version 2.90
-+	Set the default maximum DNS UDP packet sice to 1232. This
-+	has been the recommended value since 2020 because it's the
-+	largest value that avoid fragmentation, and fragmentation
-+	is just not reliable on the modern internet, especially
-+	for IPv6. It's still possible to override this with
-+	--edns-packet-max for special circumstances.
-+
-+
- version 2.89
-         Fix bug introduced in 2.88 (commit fe91134b) which can result
- 	in corruption of the DNS cache internal data structures and
-diff --git a/man/dnsmasq.8 b/man/dnsmasq.8
-index 41e2e04..5acb935 100644
---- a/man/dnsmasq.8
-+++ b/man/dnsmasq.8
-@@ -183,7 +183,8 @@ to zero completely disables DNS function, leaving only DHCP and/or TFTP.
- .TP
- .B \-P, --edns-packet-max=<size>
- Specify the largest EDNS.0 UDP packet which is supported by the DNS
--forwarder. Defaults to 4096, which is the RFC5625-recommended size.
-+forwarder. Defaults to 1232, which is the recommended size following the
-+DNS flag day in 2020. Only increase if you know what you are doing.
- .TP
- .B \-Q, --query-port=<query_port>
- Send outbound DNS queries from, and listen for their replies on, the
-diff --git a/src/config.h b/src/config.h
-index 1e7b30f..37b374e 100644
---- a/src/config.h
-+++ b/src/config.h
-@@ -19,7 +19,7 @@
- #define CHILD_LIFETIME 150 /* secs 'till terminated (RFC1035 suggests > 120s) */
- #define TCP_MAX_QUERIES 100 /* Maximum number of queries per incoming TCP connection */
- #define TCP_BACKLOG 32  /* kernel backlog limit for TCP connections */
--#define EDNS_PKTSZ 4096 /* default max EDNS.0 UDP packet from RFC5625 */
-+#define EDNS_PKTSZ 1232 /* default max EDNS.0 UDP packet from from  /dnsflagday.net/2020 */
- #define SAFE_PKTSZ 1232 /* "go anywhere" UDP packet size, see https://dnsflagday.net/2020/ */
- #define KEYBLOCK_LEN 40 /* choose to minimise fragmentation when storing DNSSEC keys */
- #define DNSSEC_WORK 50 /* Max number of queries to validate one question */
---
-2.20.1
diff --git a/package/dnsmasq/dnsmasq.hash b/package/dnsmasq/dnsmasq.hash
index 02ffb2656b..d11e8af590 100644
--- a/package/dnsmasq/dnsmasq.hash
+++ b/package/dnsmasq/dnsmasq.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.89.tar.xz.asc
-sha256  02bd230346cf0b9d5909f5e151df168b2707103785eb616b56685855adebb609  dnsmasq-2.89.tar.xz
+# https://www.thekelleys.org.uk/dnsmasq/dnsmasq-2.90.tar.xz.asc
+sha256  8e50309bd837bfec9649a812e066c09b6988b73d749b7d293c06c57d46a109e4  dnsmasq-2.90.tar.xz
 # Locally calculated
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING-v3
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 9c05857f22..9f342cb049 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DNSMASQ_VERSION = 2.89
+DNSMASQ_VERSION = 2.90
 DNSMASQ_SOURCE = dnsmasq-$(DNSMASQ_VERSION).tar.xz
-DNSMASQ_SITE = http://thekelleys.org.uk/dnsmasq
+DNSMASQ_SITE = https://thekelleys.org.uk/dnsmasq
 DNSMASQ_MAKE_ENV = $(TARGET_MAKE_ENV) CC="$(TARGET_CC)"
 DNSMASQ_MAKE_OPTS = COPTS="$(DNSMASQ_COPTS)" PREFIX=/usr CFLAGS="$(TARGET_CFLAGS)"
 DNSMASQ_MAKE_OPTS += DESTDIR=$(TARGET_DIR) LDFLAGS="$(TARGET_LDFLAGS)" \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
