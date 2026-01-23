Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 891D0D74ED9
	for <buildroot@archiver.kernel.org>; Fri, 23 Jan 2026 14:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F65383BAD;
	Fri, 23 Jan 2026 14:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UsUwYzJmYzaR; Fri, 23 Jan 2026 14:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EB0D83BD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769177555;
	bh=Ye2jRYjYKL15/Jngv74RDCJmqBZx3nDxo+SGRgGw8cE=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CaIYNH/vzizZclFGQCuBrh+5d0ns0bm+u1VSUZvbw48d8To2un24mV4HscIY0crzT
	 hGXO5anG2unjCuRAmRQILpBzz0fVoU5Ouli4dJniPEfGt3SQWuxtVZW5ySqX2vQxso
	 SD/8VZH4vdMZYi6+qC+QfjYbe8d0L/auEySdLvYZfuDlntWJtJOCkQsb1CJgYtkLgp
	 hul8L3Op3wOGWeaTcEM7KvsNoZVWX0cH1xYMEku6AvwY0BqFeC3VWUJ9WEo8oapSG2
	 9fIrbaBKfSQ5aCiR61lgeNzZhQl1vNSvaqWaLk7PL0bqp79kbbN/zLSHx6twmOCJG+
	 /L7TEXPIS8ekA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EB0D83BD4;
	Fri, 23 Jan 2026 14:12:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4576D122
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 14:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FBB7403C3
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 14:12:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y-5yQFTgFA2a for <buildroot@buildroot.org>;
 Fri, 23 Jan 2026 14:12:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1828:2000:679::23; helo=helium.openadk.org;
 envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1971D400CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1971D400CE
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1971D400CE
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 14:12:32 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 6A57331E0BB1; Fri, 23 Jan 2026 15:12:31 +0100 (CET)
Date: Fri, 23 Jan 2026 15:12:31 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aXOBz2JS9ziiRenK@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1769177551; bh=iInzdcTUJ33XvuFhKbabAI2DoEg2JJN40RjbOjYJdNQ=;
 h=Date:From:To:Subject:From;
 b=cSDsycoMRbbOJnCLpr6Bo1KU6LqBy0i8uaim+C9Hs1QnoxgYd5eThaO8YNKHx3YKv
 7ZVMQEmpRem2I7eSgCutwmd8BvadHzCLVTy0mHrB1m3U2JIvxdITfUs+3oIsqsmEK1
 d7pZnq1mWFkDjIcccojvFtbh3UIEvRZCWOYkWcQBdnIaf5STy5pdGlYYgS4/YAp3R9
 vmr1t832W1jjjP5Siy09cCRrohNMFyT2AhV6xyFkRGY/pdNIYWiaE/zqW9kjlrqAnj
 pQCaSf92afuKHgXpYJApjvi7Tlmjv8HeWETIkUCVT1TUkzr97BL/onXqBzZj1eS2Ew
 6goWwcffuZP0Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=cSDsycoM
Subject: [Buildroot] [PATCH 2/2 v2] package/strongswan: update to 6.0.4
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

See here for Changes:
https://github.com/strongswan/strongswan/releases/tag/6.0.4

Enable minimal required kernel config options.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
v1->v2:
  - remove patch 0001 and CVE ignore
---
 ...001-eap_mschapv2_failure_request_len.patch | 46 -------------------
 1 file changed, 46 deletions(-)
 delete mode 100644 package/strongswan/0001-eap_mschapv2_failure_request_len.patch

diff --git a/package/strongswan/0001-eap_mschapv2_failure_request_len.patch b/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
deleted file mode 100644
index 8442cc7816..0000000000
--- a/package/strongswan/0001-eap_mschapv2_failure_request_len.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-From dda24815d148b91209ebf2d27e3a7acefe9b6435 Mon Sep 17 00:00:00 2001
-From: Tobias Brunner <tobias@strongswan.org>
-Date: Thu, 9 Oct 2025 11:33:45 +0200
-Subject: [PATCH] eap-mschapv2: Fix length check for Failure Request packets on
- the client
-
-For message lengths between 6 and 8, subtracting HEADER_LEN (9) causes
-`message_len` to become negative, which is then used in calls to malloc()
-and memcpy() that both take size_t arguments, causing an integer
-underflow.
-
-For 6 and 7, the huge size requested from malloc() will fail (it exceeds
-PTRDIFF_MAX) and the returned NULL pointer will cause a segmentation
-fault in memcpy().
-
-However, for 8, the allocation is 0, which succeeds.  But then the -1
-passed to memcpy() causes a heap-based buffer overflow (and possibly a
-segmentation fault when attempting to read/write that much data).
-Fortunately, if compiled with -D_FORTIFY_SOURCE=3 (the default on e.g.
-Ubuntu), the compiler will use __memcpy_chk(), which prevents that buffer
-overflow and causes the daemon to get aborted immediately instead.
-
-Fixes: f98cdf7a4765 ("adding plugin for EAP-MS-CHAPv2")
-Fixes: CVE-2025-62291
-Upstream: https://github.com/strongswan/strongswan/commit/c687ada6a6f68913651e355fd09f906893096b32
-Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
----
- src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c b/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c
-index 21cc95a6a360..35faad2e0bb5 100644
---- a/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c
-+++ b/src/libcharon/plugins/eap_mschapv2/eap_mschapv2.c
-@@ -974,7 +974,7 @@ static status_t process_peer_failure(private_eap_mschapv2_t *this,
- 	data = in->get_data(in);
- 	eap = (eap_mschapv2_header_t*)data.ptr;
- 
--	if (data.len < 3) /* we want at least an error code: E=e */
-+	if (data.len < HEADER_LEN + 3) /* we want at least an error code: E=e */
- 	{
- 		DBG1(DBG_IKE, "received invalid EAP-MS-CHAPv2 message: too short");
- 		return FAILED;
--- 
-2.43.0
-
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
