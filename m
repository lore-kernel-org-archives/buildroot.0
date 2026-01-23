Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420F2D74ED9
	for <buildroot@archiver.kernel.org>; Fri, 23 Jan 2026 14:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A34F40AE5;
	Fri, 23 Jan 2026 14:11:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T4tp_FyesyLe; Fri, 23 Jan 2026 14:11:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EE6340ADF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769177469;
	bh=1Fl5tnmF/7X1jkS2gk0Bi7vtiAlK5jwIAJAAjaRh0XI=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qEUtFFryijOGnCGfujGelE8C9hRGuobfTcpysuh2xoe2LMjqoekl9S+6yv5+KBKvJ
	 vj2WQTlSaIdXLYBo6XqqJNm+KcfLq6FX3kkwNIoJSKCGLDtegD7QYUgPzOM1vfYPex
	 4LlSOAuhiFUiwK69HTBvWlCSwP7oTagtrrwrfJNhbbGgCy8HcRQGGDODOoLUgDRnAv
	 lZOHYPYWpo8yGZn1z3pgsq93x5XtuyuxSX6erOHh+z7U6s67lQDJUUNMug+OTcydic
	 vpko8VplSwE76NmdooiLnh9bCNFKt88LK8d8VHT2PeOqXDwV3jKlmaYs9RKRkKs7EX
	 VUl7kvTDd5cQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EE6340ADF;
	Fri, 23 Jan 2026 14:11:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ACF93122
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 14:11:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 92CE56087A
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 14:11:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Msu9F1zIrtn3 for <buildroot@buildroot.org>;
 Fri, 23 Jan 2026 14:11:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0E2E660841
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E2E660841
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E2E660841
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 14:11:05 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 3D03831E0BA7; Fri, 23 Jan 2026 15:10:59 +0100 (CET)
Date: Fri, 23 Jan 2026 15:10:59 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aXOBc0KVRl7qTTrK@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1769177459; bh=f9PiAVl4XhXa4w0fqMCRrnZBgkoKLjqO5VwrNZTQv5Q=;
 h=Date:From:To:Subject:From;
 b=bCcEqijiEC4kShjYlkeI4wevsmRZJWStV1h5Qd7gBNNpPY6WXL7bJQ73r6WaCGdH0
 hyAEAV7pLxZZSJ5kzoTUp65n1TWxnmqc1/nqfwApnjq+rklmvxaGywHZwGLgGIcbug
 0NZQbXxQ8PoX0ZIa9W8zC2gWLlqyL7tAIQBaEFyY0wV68XEsjtA1wfGEiH2ziklvUk
 Qmw7agmiQ6EAdtlrmAulviDZVvle+MA3NNUcJFCKLixQUClE8aePDn+/gAT6rgVck7
 LQGmz1UXQ12vc10Ky9sIZvaZwgIP+TWD1nygNoRZV0azMm0fbLu4H3HAZtWjqiEXLG
 HrYx3+suXxfFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=bCcEqiji
Subject: [Buildroot] [PATCH 1/2 v2] package/strongswan: fix security related
 bug
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

Add patch for CVE-2025-62291.
https://nvd.nist.gov/vuln/detail/CVE-2025-62291

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 ...001-eap_mschapv2_failure_request_len.patch | 46 +++++++++++++++++++
 package/strongswan/strongswan.mk              |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 package/strongswan/0001-eap_mschapv2_failure_request_len.patch

diff --git a/package/strongswan/0001-eap_mschapv2_failure_request_len.patch b/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
new file mode 100644
index 0000000000..8442cc7816
--- /dev/null
+++ b/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
@@ -0,0 +1,46 @@
+From dda24815d148b91209ebf2d27e3a7acefe9b6435 Mon Sep 17 00:00:00 2001
+From: Tobias Brunner <tobias@strongswan.org>
+Date: Thu, 9 Oct 2025 11:33:45 +0200
+Subject: [PATCH] eap-mschapv2: Fix length check for Failure Request packets on
+ the client
+
+For message lengths between 6 and 8, subtracting HEADER_LEN (9) causes
+`message_len` to become negative, which is then used in calls to malloc()
+and memcpy() that both take size_t arguments, causing an integer
+underflow.
+
+For 6 and 7, the huge size requested from malloc() will fail (it exceeds
+PTRDIFF_MAX) and the returned NULL pointer will cause a segmentation
+fault in memcpy().
+
+However, for 8, the allocation is 0, which succeeds.  But then the -1
+passed to memcpy() causes a heap-based buffer overflow (and possibly a
+segmentation fault when attempting to read/write that much data).
+Fortunately, if compiled with -D_FORTIFY_SOURCE=3 (the default on e.g.
+Ubuntu), the compiler will use __memcpy_chk(), which prevents that buffer
+overflow and causes the daemon to get aborted immediately instead.
+
+Fixes: f98cdf7a4765 ("adding plugin for EAP-MS-CHAPv2")
+Fixes: CVE-2025-62291
+Upstream: https://github.com/strongswan/strongswan/commit/c687ada6a6f68913651e355fd09f906893096b32
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c b/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c
+index 21cc95a6a360..35faad2e0bb5 100644
+--- a/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c
++++ b/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c
+@@ -974,7 +974,7 @@ static status_t process_peer_failure(private_eap_mschapv2_t *this,
+ 	data = in->get_data(in);
+ 	eap = (eap_mschapv2_header_t*)data.ptr;
+ 
+-	if (data.len < 3) /* we want at least an error code: E=e */
++	if (data.len < HEADER_LEN + 3) /* we want at least an error code: E=e */
+ 	{
+ 		DBG1(DBG_IKE, "received invalid EAP-MS-CHAPv2 message: too short");
+ 		return FAILED;
+-- 
+2.43.0
+
diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 9719242327..c0147c00df 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -12,6 +12,7 @@ STRONGSWAN_LICENSE_FILES = COPYING LICENSE
 STRONGSWAN_CPE_ID_VENDOR = strongswan
 STRONGSWAN_DEPENDENCIES = host-pkgconf
 STRONGSWAN_INSTALL_STAGING = YES
+STRONGSWAN_IGNORE_CVES += CVE-2025-62291
 STRONGSWAN_CONF_OPTS += \
 	--without-lib-prefix \
 	--enable-led \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
