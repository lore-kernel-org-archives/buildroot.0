Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5EC3C9830E
	for <buildroot@archiver.kernel.org>; Thu, 24 Sep 2026 18:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9188640F82;
	Thu, 24 Sep 2026 18:58:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njADEur3Fdw4; Thu, 24 Sep 2026 18:58:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4F6F940ACB
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790276306;
	b=i+6f0YySjG/hxtWVRrvontXbjLSppwuG/M/ZGH5iz1xHAJSx19mndEIq3sHWf2UbVWGG
	 HfN8rBNBn6f/t1Hyc9oOPjiGySaxNVvlz8yXjlKqVXjYkScOYPyVTph2x7WZIDEBwRKMT
	 TRibeqGW7d3BnnADSKow9QQVSDKZIvxe+LFt9GshsdSGWDpgyCHnIODAulg0tqNjt4TRp
	 lQB2IxpXctJoqXzi/+8xx/haMnASAYcU/8dEgo4W4Fdu5FWxRA2L0scUndLvdi15XixI/
	 8M2xsBkBFpBEDqdTzTU3RIHMT73rfAf/JgVQnlDnNzejLbPqnGT9+fxfnmqQkm6xvjA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790276306;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=IZB6kTl+yFkVPoP0vWBRBlPxfCwzw4713kw0N8r/VSA=;
	b=E24bidyolwjqRTG9Pcref0etXXAJDYtlZbKB7Zy0he5bavtZoKlgOWQutWKD5Z7FVFan
	 2cuaTEcpA7iq4eEDmVy11VUMF1JEWI86VGeuU10D30gbsmSSq5JDs/oS+P50HsJ3C5R6b
	 24oAONxmvzb2igoruTAJNinjFvrCE2yP7rAjZNrATyMFz8Evy5VzCAqAZtBJ/fGNLQ4Y8
	 EV6GRHeMSpYfIF4VTqAMFPTiE6guGJHjQ39ES8NfaZ/AO3UsR8KgD9NbvVpkyES4mZ0Z/
	 ifMnYwqlVH+sG1EbKRwdNjNYJyJqdDRhbwGaAMye/c2r7Vomn6W37UU6+daKLWRqWxg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790276306;
	bh=IZB6kTl+yFkVPoP0vWBRBlPxfCwzw4713kw0N8r/VSA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KnWcJjk17bhIY79XBmXjDTBewVZSK3ZaNk0L6k0BXILJFv+2di9W4oQPonVdh7R7E
	 kjMe4E4BK5WzhuwOPIv4qf7ek7D4lG/Ljg1Mu5Yl2O685aWgT5CF95OSvQIa1XVyHt
	 XuNWhxXBERW+NRsh/qjZfSnyiYoNOQKg1nTkfFFw0atMzs5vrEOOvLH9QMz34d36co
	 aIG2GvD+UaBsDHlSSrrX26t06K6EiaAsUs0JHEXI0v2foKCAgYZwgEaErW0cB0yTJy
	 RntnmksVtXSnpftZ+ung+11aDS6cItCoYYSIkVEneCiyx+dkTMdeUvIKBaN9hwZKab
	 SbSYncbGTikeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F6F940ACB;
	Thu, 24 Sep 2026 18:58:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 33715392
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 213CF404D3
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5dqsSIFU5w1q for <buildroot@buildroot.org>;
 Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 63BF0404B1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790276210;
 b=f8RBT6SUKYHrMh/E+I8qaK4gAZA5jVgMYcdKxbX9RFKqjvHMgBdxyejm1QreQfwdkbbZ
 NKyxXYxq9Pu3v3MQjswkT2uh4I3vrrQROMCZHYpft93KRyKP3qQn47x+4LqELxHH++TN6
 KFqfexOBLXu9Y5vY+jMBZJ4iR41P9maQylGLmNBQaNXlk+JhsRcyXBOY6zoI9651p790i
 kqTc6VBhFDQN336yUopDbBlm3xA959I+ZIiQyGdx32LgF5G6ig+Pui5JWW8ObbWnW8yEQ
 wn0SqKBIuHMNdpbJG7z6NLB2F3ZiXGTUg6CbwK7oUmK8WtitM0+wn0esykKwenwBhaQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790276210;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=HnMymiTV94dtvyDXUFzuwmxkDLnAJIozVkahWDE+j4U=;
 b=np+r1qOsIFU0t0z/t7AfXKL4DIHwJiz579tSAmm55wLjM73+kYjHy6vcqHIkBEOSoZVE
 m2NuFKCvcU+D6vwM0DzgGmPLsgZTFbp/qNsYvJS1KIa5aNzfsocWPdvsPE9+dJGgu1Wi7
 2+0bacfUkdi7GDnMei5nqGRxx31EuLhn+d0pRE9+8lte1+PyHbMU65y0TTgfcI1/MSIWK
 UGjPEn/s/YK5nf89pIUhJZijZHSVsyuh/hG77pq4UHX/VQAsBYUpgfHzMZl4poRaKBDHd
 yB8Y1JstuHhM4UpiMRjOvs/e3DK5Shd4TrVL3Mv0KR9uKpQN6yd7sTzJpMtSLIlLs2g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 63BF0404B1
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 18:56:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07104976B0; Thu, 24 Sep 2026 18:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 23 Sep 2026 17:45:53 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 2a1acd674a1da8ce964924a6199ccaff560ffe10
X-Git-Newrev: 69c37d796e1dea153297fb1589ee95778a563c0c
X-Patchwork-Hint: ignore
Message-Id: <20260924185540.07104976B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libheif: security
 bump version to 1.23.4
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
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4670858416528778430=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4670858416528778430==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/69c37d796e1dea153297fb1589ee95778a563c0c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://github.com/strukturag/libheif/releases/tag/v1.23.4

Fixes the following CVEs:

(CVE numbers will be added when assigned.)

CVE-2026-XXXXX (GHSA-vg7w-rp49-4fc2)
CVE-2026-XXXXX (GHSA-xrp2-63fq-jm8q)
CVE-2026-XXXXX (GHSA-prgh-72vc-3xmc)
CVE-2026-XXXXX (GHSA-fqpw-fj22-78w4)
CVE-2026-XXXXX (GHSA-4rv4-953r-p24q)
CVE-2026-XXXXX (GHSA-rhgw-q5g8-xjh2)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 053c724d6efad1412f2a6c4b460b0f0c36517085)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libheif/libheif.hash | 4 ++--
 package/libheif/libheif.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libheif/libheif.hash b/package/libheif/libheif.hash
index 6001e84ce9..78f59f6b67 100644
--- a/package/libheif/libheif.hash
+++ b/package/libheif/libheif.hash
@@ -1,4 +1,4 @@
-# From https://github.com/strukturag/libheif/releases/tag/v1.23.3
-sha256  11c1179e0e4bec33624b87f22ec42c1e993a40d946d44d26f9c431cf1456a863  libheif-1.23.3.tar.gz
+# From https://github.com/strukturag/libheif/releases/tag/v1.23.4
+sha256  d0c02b4b0e978f34a1974b6f3eea7975a537bf7a9195ffeea38e7242ff316fdd  libheif-1.23.4.tar.gz
 # Locally computed:
 sha256  fa81ce652315b013359d6e8e4744335f31a50c7c192907176d3632f78a3b4596  COPYING
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 1614dafc74..3428646016 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBHEIF_VERSION = 1.23.3
+LIBHEIF_VERSION = 1.23.4
 LIBHEIF_SITE = https://github.com/strukturag/libheif/releases/download/v$(LIBHEIF_VERSION)
 LIBHEIF_LICENSE = LGPL-3.0+
 LIBHEIF_LICENSE_FILES = COPYING

--===============4670858416528778430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4670858416528778430==--
