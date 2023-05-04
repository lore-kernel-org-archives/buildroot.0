Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D50BC77B78
	for <buildroot@archiver.kernel.org>; Thu,  4 May 2023 10:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0DF0614DF;
	Thu,  4 May 2023 10:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0DF0614DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z7hDt-9JueA8; Thu,  4 May 2023 10:09:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE3D66155C;
	Thu,  4 May 2023 10:09:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE3D66155C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E48601BF3CB
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 10:09:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC622410B2
 for <buildroot@lists.busybox.net>; Thu,  4 May 2023 10:09:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC622410B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IIvF8D-iU_28 for <buildroot@lists.busybox.net>;
 Thu,  4 May 2023 10:09:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 68E0E408D3
 for <buildroot@buildroot.org>; Thu,  4 May 2023 10:09:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68E0E408D3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5399285C6C; Thu,  4 May 2023 10:09:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 4 May 2023 12:05:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 509a5d66c4672ce2e8418c3fe1aa5834ab4acb53
X-Git-Newrev: 3816471496036661b2032d5424d0496231b04ca7
X-Patchwork-Hint: ignore
Message-Id: <20230504100925.5399285C6C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dnsmasq: fix CVE-2023-28450
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3816471496036661b2032d5424d0496231b04ca7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adds the upstream patch that fixes the CVE.
No new release so far.

Signed-off-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-set-default-maximum-dns-udp-package-size.patch | 64 ++++++++++++++++++++++
 package/dnsmasq/dnsmasq.mk                         |  3 +
 2 files changed, 67 insertions(+)

diff --git a/package/dnsmasq/0001-set-default-maximum-dns-udp-package-size.patch b/package/dnsmasq/0001-set-default-maximum-dns-udp-package-size.patch
new file mode 100644
index 0000000000..4dd17ec069
--- /dev/null
+++ b/package/dnsmasq/0001-set-default-maximum-dns-udp-package-size.patch
@@ -0,0 +1,64 @@
+From eb92fb32b746f2104b0f370b5b295bb8dd4bd5e5 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Tue, 7 Mar 2023 22:07:46 +0000
+Subject: [PATCH] Set the default maximum DNS UDP packet size to 1232.
+Upstream: https://thekelleys.org.uk/gitweb/?p=dnsmasq.git;a=commit;h=eb92fb32b746f2104b0f370b5b295bb8dd4bd5e5
+
+http://www.dnsflagday.net/2020/ refers.
+
+Thanks to Xiang Li for the prompt.
+
+[dalang@gmx.at: backport from upstream]
+Signed-off-by: Daniel Lang <dalang@gmx.at>
+---
+ CHANGELOG     | 9 ++++++++
+ man/dnsmasq.8 | 3 ++-
+ src/config.h  | 2 +-
+ 3 files changed, 12 insertions(+), 2 deletions(-)
+
+diff --git a/CHANGELOG b/CHANGELOG
+index 3af20cf..52d8678 100644
+--- a/CHANGELOG
++++ b/CHANGELOG
+@@ -1,3 +1,12 @@ version 2.90
++version 2.90
++	Set the default maximum DNS UDP packet sice to 1232. This
++	has been the recommended value since 2020 because it's the
++	largest value that avoid fragmentation, and fragmentation
++	is just not reliable on the modern internet, especially
++	for IPv6. It's still possible to override this with
++	--edns-packet-max for special circumstances.
++
++
+ version 2.89
+         Fix bug introduced in 2.88 (commit fe91134b) which can result
+ 	in corruption of the DNS cache internal data structures and
+diff --git a/man/dnsmasq.8 b/man/dnsmasq.8
+index 41e2e04..5acb935 100644
+--- a/man/dnsmasq.8
++++ b/man/dnsmasq.8
+@@ -183,7 +183,8 @@ to zero completely disables DNS function, leaving only DHCP and/or TFTP.
+ .TP
+ .B \-P, --edns-packet-max=<size>
+ Specify the largest EDNS.0 UDP packet which is supported by the DNS
+-forwarder. Defaults to 4096, which is the RFC5625-recommended size.
++forwarder. Defaults to 1232, which is the recommended size following the
++DNS flag day in 2020. Only increase if you know what you are doing.
+ .TP
+ .B \-Q, --query-port=<query_port>
+ Send outbound DNS queries from, and listen for their replies on, the
+diff --git a/src/config.h b/src/config.h
+index 1e7b30f..37b374e 100644
+--- a/src/config.h
++++ b/src/config.h
+@@ -19,7 +19,7 @@
+ #define CHILD_LIFETIME 150 /* secs 'till terminated (RFC1035 suggests > 120s) */
+ #define TCP_MAX_QUERIES 100 /* Maximum number of queries per incoming TCP connection */
+ #define TCP_BACKLOG 32  /* kernel backlog limit for TCP connections */
+-#define EDNS_PKTSZ 4096 /* default max EDNS.0 UDP packet from RFC5625 */
++#define EDNS_PKTSZ 1232 /* default max EDNS.0 UDP packet from from  /dnsflagday.net/2020 */
+ #define SAFE_PKTSZ 1232 /* "go anywhere" UDP packet size, see https://dnsflagday.net/2020/ */
+ #define KEYBLOCK_LEN 40 /* choose to minimise fragmentation when storing DNSSEC keys */
+ #define DNSSEC_WORK 50 /* Max number of queries to validate one question */
+--
+2.20.1
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 58c5390433..9c05857f22 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -17,6 +17,9 @@ DNSMASQ_LICENSE_FILES = COPYING COPYING-v3
 DNSMASQ_CPE_ID_VENDOR = thekelleys
 DNSMASQ_SELINUX_MODULES = dnsmasq
 
+# 0001-set-default-maximum-dns-udp-package-size.patch
+DNSMASQ_IGNORE_CVES += CVE-2023-28450
+
 DNSMASQ_I18N = $(if $(BR2_SYSTEM_ENABLE_NLS),-i18n)
 
 ifneq ($(BR2_PACKAGE_DNSMASQ_DHCP),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
