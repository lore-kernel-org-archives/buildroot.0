Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCD4C43458
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 20:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23FC56068C;
	Mon, 13 Jul 2026 20:39:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oiPja6ejUg0x; Mon, 13 Jul 2026 20:39:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0C9160621
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783975147;
	bh=0sgFQMmQCjRnXCkLQYREWKjkh2Rk7lvz/xN4MKapCHo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=eUbCrTu+8l/OYfeKfXSpuoxp9R+QJ4tHZw1MzxUqZYHw8s7zqiHowG4mvw80P0wx1
	 RBUXRQwdNjcDTZCdojlv91RqU2olUkyw1MqkhQ4d67obdJwVtjlvfAOGxZAhgfm4C5
	 KEJ0h7i3qYirIp8p7Y9WH5/iSndoVGTaLvR1r0b9L9XSMdF10c0RYs/653yeBsUce2
	 bjpZAnFevsF4xlt5Yxm0Hlu7kgYagrZVA+44pHkTkxOLdJY0jOKaWqkM8rQoSS3yFw
	 1m5rSJmTv1zVYlOCZRj2lj8WwCsVdT5cpt+kioNpEENN4IJfe3R6I7H0Ji5kty1bka
	 elHUIDwp6dIUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0C9160621;
	Mon, 13 Jul 2026 20:39:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F33B1238
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 20:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D952C80DFC
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 20:39:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fhh6UeQDbyH6 for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 20:39:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F148780D9F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F148780D9F
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F148780D9F
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 20:39:04 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 98e67ed59e1d1-38125cebfdaso354752a91.1
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 13:39:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783975144; x=1784579944;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PH2nNkQ5s+pHu9gVXon36W5pSu4T3U1Ede7U0bw3UbM=;
 b=QYxgvDHWx4q2/FceVZ0/fGYuYM0KO6SRSxBXvk3ZfVqC6qsp8hDIUFCpMut3voDw/b
 YP2MN+7PPnWad6gQDbXoRTZF+Or8FJQMlZ3vQf+GqG5dh6E2gHGRL32r7mJCyuSV1CWH
 iIcOnFVV3b1XsHkZc7rJkq2NjeFrTjB9w/79wOJjpwnTJQSTTtu9JomTimcTnTFnLm60
 fblnkM3Pv2BgI491Rh9UsjuFF+RMvRbdEcSTqX6dtOP54qCsNCw3/70Qipu7BGADA1Ye
 yLW0SWq3atW5QruwxJDfWvkJH54KCjt8MsOwHAEXd2LrP+F8CDW+VG2X/C/QZ0bBf71V
 l7wA==
X-Gm-Message-State: AOJu0YwewT1Rkl6pXWz0Y6MkQTwFLrtBrG8zKjMf2AVLNatqb03atg/I
 +AnKkpdHZ9bsLbtg3Q/NY7Gse0iefXlh7Nu3dq0P2EpPArYWHnPVKDIvPcJeDFKKXv5romxqtbS
 MR3RGFZl2PVfL
X-Gm-Gg: AfdE7cmt6LBMHQHXm7UAxYzeSbzfQPCboCGlP4wqwhGmHnso9geYtgqv0rYNFd2FXCg
 nD9wUFO29HGCTDPf1DF7IoIHVRuG++7aA7iDUXqlIHY0nPu0nifwKwUiEiHiGtSlmXrvA9BXKCE
 Q7p1v4yq9yWraNcnOU/NoD3KxdCqXi85BqJ9IT2x0O2ypuf5Hy8NcoqVCnwDxkD8CtPThHQUSwG
 My8C9ORYzX7kJCpxp7S5ydJsLEiPs9zyXLTS+emBQx215Z2VreudfbuzQKwBplzdy2eA7HT6kAn
 TxocGPTAk+vaKsJAcvrzUhklUVruwGGPDnY0w6x7SOS0AMQGRFl4U43oirrBq7cspSG2cI1uDG7
 ZwFhWvdbRt7gaI3dlTAyZRyzHF00Uw4/Q7bzbYKqfhnyAVP0mxvWIow10pnYas0yCZ3oVBz60TH
 kfXNPTwkElJ1DStrN17+snP7Lnz4AXSI4+Uosg4j+V3eRvck7ZK8E/
X-Received: by 2002:a17:90b:2e50:b0:38e:998:bbb4 with SMTP id
 98e67ed59e1d1-38e09a80035mr3091293a91.7.1783975143720; 
 Mon, 13 Jul 2026 13:39:03 -0700 (PDT)
Received: from localhost.localdomain ([185.228.19.50])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38deea72fc3sm1185033a91.2.2026.07.13.13.39.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Jul 2026 13:39:03 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 13 Jul 2026 13:39:01 -0700
Message-ID: <20260713203901.24229-1-christian@aperture.us>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1783975144; x=1784579944; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=PH2nNkQ5s+pHu9gVXon36W5pSu4T3U1Ede7U0bw3UbM=;
 b=lffePOtxd+C8EPIEuYYVRT+criqnDNVdWW+abLu+j7hNLPUDrKNSArFs31OgYVJq/3
 qtoba5mkTXgGd4ciby76zrEVsDpvUM0GWR5MJQFrc/RI6mK6kVOsbd6ndZe9kYY1zQjb
 evNMvJ5u7CfeeC6HX8f2Y2HpjbXZ7j03Ll6kAELeAwyyDVAYRfyQOSTy01QeN8bHmXPp
 1Vow0qNVOicBMkUu+etQJPZnX6cjPtrWBgV3c8uXVUoSpMHuz72SuiVtRQOPOPnZyvwY
 cLyt+hwhJGPrZQv1ZdnkQastM5w+nOX3pjGHFEsxg4RV6QM0tYQguf8RLPovEGcyiUyh
 hTdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=lffePOtx
Subject: [Buildroot] [PATCH v1 1/1] package/go: security bump to version
 1.26.5
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Olivain <ju.o@free.fr>, James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@aperture.us>,
 Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issues:

CVE-2026-39822: os: root escape via symlink plus trailing slash

go1.26.5 (released 2026-07-07) includes security fixes to the crypto/tls and os packages, as well as bug fixes to the compiler, the runtime, the go command, and the net, os, and syscall packages.

https://go.dev/doc/devel/release#go1.26.5
Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/go/go.hash | 14 +++++++-------
 package/go/go.mk   |  2 +-
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index 69f2a3139c8..6c9c20be69e 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  1c646875d0aa8799133184ed57cf79ff24bdefe8c8820470602a9d3d6d9192b8  go1.26.3.src.tar.gz
-sha256  0ef3626a149b5811c813838c62b7d6618d03ea36047b32c90b0e4851cc42b1fa  go1.26.3.linux-386.tar.gz
-sha256  2b2cfc7148493da5e73981bffbf3353af381d5f93e789c82c79aff64962eb556  go1.26.3.linux-amd64.tar.gz
-sha256  9d89a3ea57d141c2b22d70083f2c8459ba3890f2d9e818e7e933b75614936565  go1.26.3.linux-arm64.tar.gz
-sha256  d44133d4c66b1451a1e247da26db7716f76a081c0169a75e6c84e1871e394320  go1.26.3.linux-armv6l.tar.gz
-sha256  dbd82b50530ead2beb1fd72215117380df3cb16332b51467116dc35b3691dd75  go1.26.3.linux-ppc64le.tar.gz
-sha256  5c0605b7175449f1c8e8cb02efaba2695caab914fad4dcedc764c2f4c6dfe6ca  go1.26.3.linux-s390x.tar.gz
+sha256  495be4bc87176ac567392e5b4116abd98466d33d7b49d41e764ccc6976b2dc42  go1.26.5.src.tar.gz
+sha256  88c162b204e6eefcc32499453b492e80209f4a4c78c33092636901c540fb0d05  go1.26.5.linux-386.tar.gz
+sha256  5c2c3b16caefa1d968a94c1daca04a7ca301a496d9b086e17ad77bb81393f053  go1.26.5.linux-amd64.tar.gz
+sha256  fe4789e92b1f33358680864bbe8704289e7bb5fc207d80623c308935bd696d49  go1.26.5.linux-arm64.tar.gz
+sha256  6dae9edab81c13bccf962dec15f1fd2ec26c14a6821b4d2c92dab4130c289d7a  go1.26.5.linux-armv6l.tar.gz
+sha256  c5d60e2b303bb612f20cd82786594b64874e73b35134025e27d3390bf284ae43  go1.26.5.linux-ppc64le.tar.gz
+sha256  09ce3c504c0323968b75a717244dca4f25cd4cf0443e5ff6bc0bfa74add89fa7  go1.26.5.linux-s390x.tar.gz
 sha256  911f8f5782931320f5b8d1160a76365b83aea6447ee6c04fa6d5591467db9dad  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index ebd0d418efa..a64d7538f85 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.26.3
+GO_VERSION = 1.26.5
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
