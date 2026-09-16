Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0EB8C982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 19:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 613F460657;
	Wed, 16 Sep 2026 19:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSg2WgQcN7Tb; Wed, 16 Sep 2026 19:25:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 854E960668
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789586726;
	b=Z1VFbkX/2HQXAVIvIO1wTlDzAufQHhwS/ei3Gg6VwtsDpalT71t+2s4yg4pE2aJHW8Lb
	 uJIdMlPcrT+GwLqYxJPV/52Bgn2DzQRWdLTlDMj3u/iLcvT/pQUzj8n/8QQpxtxHlwZST
	 gD+r1dbIukpwOU9VgT0jtZLqe/HLUEi2pKYCNUIhTTriT/4xuvOyeorV/OBY8IPRPCtaQ
	 SPLHQMd6WPRRNmHxLVkWDHt5ejggJkWuud6v0CmpN1Jr/cEwQkyu4+1HaAndMTJonyrFU
	 kEoIRtv4mbCsbuJIzsQVi5zLSRWyGtG8yKvFsL0JBmdv6ElNez2gv9JlG0dNg3lrCDg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789586726;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=6GgYr393xJQINroKjvgWeKIGGSoLcpXGEKfE+yYLFxA=;
	b=jB64LRU1bR2va8Re5jD3wqToYCOozhu4pgwZIXT+QJeTuVHRceCTUsPeeUifsYDbRxbR
	 /ppprst25dktKmhMQQI9KsF0JL+2fU1+RTUWAcnvrPPgJh87oouTQfCeZ125oGmjIyyOe
	 4OR1/hvpgTUKcTFL8aaG3syVDMUopxE9U0YKiZU5G23Q1bSjNpTEUabkrxG059EkIbgrl
	 UKVhDQeON0wOcPJC7ScUMs6U5qDzIPL64tubzHcWY24HCWJ1hK7zCB22++yq3BJolxFga
	 Mjk1hp2mrNDjJMeKfwy3fNs3WzUSLlv/yZOK/I3A93wrNDFK3da+5WEifbjz8Qgb11g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789586726;
	bh=6GgYr393xJQINroKjvgWeKIGGSoLcpXGEKfE+yYLFxA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bAD8kuMzU1C9cVkMS+6dCeQyzRpstu6tOQFmVLt+hXFTzOm4fdHSBKTr5JzJ4Wgnn
	 qWddReIWyJ1Dqligz7x7p6YX0dDzozvYj1RNzlp3TZ55m2l4di2F/fDLWlcn/EnczK
	 vafdoI7tDRjCsK1ek2QfIYG75hAnhEKiSE7BV+Qu5VTr0EX4UlPDT8No3BZ1C0Apdl
	 g0CF8P0vbNGH/9nnW/2hyzD8pJ2oNlkRzYZ8win/52PtnLpiBG1MfNk6688C3B8uJ0
	 UcmRPOas9TDtks5DKKfYprovE4wMTRo0a4Nb/lCdgTIH5NIHLT31G1sIXF9+LeM1Fq
	 D/JuowiVmZPsg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 854E960668;
	Wed, 16 Sep 2026 19:25:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 22D042EB
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:25:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14B024054E
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:25:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id unrbVTFfTG30 for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 19:25:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 554E340543
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789586724;
 b=W6vlSi8dELpmKLQBhHfuowwFw47fVf1KkawTaYkPmZzZwWG3n44SeoDhlmjReRuxxD+W
 4A5DnFbYaRxYhQnLWl1+UVpNWr5/cIUPliq26EXxX/vLj2VewT8H3V32tKSO7gHv8TA9O
 i2n9ut7CbtS1ws5wAkDeNsCz/IpUg2LU+cJRncfVPEAp7ktxPw0JGGAv9a5AdCGa5NsVD
 4hEIxrdRbGDjZvVLY3wk4SaUpmAES22JEpEN03XDHfkiks8gIoyYNS38K3ULGha2u+fCj
 ssZbaJ6GeXMxGc+Q1ljEbLsG0/5y6oMXzacLGvriVPqe3WiWO81s9GiWOtNfJQEypqg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789586724;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=e8vZqgXkNznxPOTsXdfUpfqXu34og97ZiTmYoBGVHh4=;
 b=K7Ki56w5n/W1D6qB4hcyZcXnl1wHLwFdmWP2JLv0zWCPkBwWeCWMlzBFTQ9SjP7Dd6tz
 urd0qYULg741zqG5NM2Oj5TB86lFasUwCqLsP0MhTc84x4N0Ba3JludqmuE5uBl+I2iTo
 fS6FrNXmIUqmQ9GyoUK/mIxA6FDegzfpE+JzTVKZgK08E5o/3B8NLFlrQL4rK/5I0sJdq
 hvFpPja2Hbh1tCuWAwWn+1a4d2JiQvHr6YVZ08B6xLDn6whIgmSHfyRWJcCforomdLgVd
 3vhc3sypdRvcHgV1kAuj7LkIzlTMMUqSFvYNrEPks8Nil+AJefss8MgWw320v17rAGQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 554E340543
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:25:24 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFCED968A5; Wed, 16 Sep 2026 19:24:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 16 Sep 2026 21:24:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bfcba48c74a3f97588c3509097187293f67f15d1
X-Git-Newrev: cd6291f7c917dc75275bcf90fa851e2f741bfcee
X-Patchwork-Hint: ignore
Message-Id: <20260916192417.CFCED968A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tpm2-openssl: bump version to 1.3.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============2258856686267367705=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2258856686267367705==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cd6291f7c917dc75275bcf90fa851e2f741bfcee
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/tpm2-software/tpm2-openssl/releases/tag/1.3.0

Update license hash due to copyright year bump:
https://github.com/tpm2-software/tpm2-openssl/commit/3fb3a5ff7fcd9921ad6e933aed8f34e8e63d46db

Pass -Wno-error to make sure warnings are not treated as errors, to
workaround the fact that -Werror is pasedd by the build system since
upstream commit
https://github.com/tpm2-software/tpm2-openssl/commit/c3a8758cad1520d36d6cb87aa87ff8012f3283d8
first included in this release.

This fixes a build error seen with the Gitlab pipelines for
bootlin-aarch64-glibc-old:

src/tpm2-provider-encoder.c:
 In function ‘tpm2_rsa_encoder_encode_SubjectPublicKeyInfo_der’:
 src/tpm2-provider-encoder.c:86:71: error: the comparison will always  evaluate as ‘true’ for the address of ‘tpm2_rsa_encode_public_
SubjectPublicKeyInfo_der’ will never be NULL [-Werror=address]

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tpm2-openssl/tpm2-openssl.hash | 4 ++--
 package/tpm2-openssl/tpm2-openssl.mk   | 6 +++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/package/tpm2-openssl/tpm2-openssl.hash b/package/tpm2-openssl/tpm2-openssl.hash
index ee15ee885f..36ef705069 100644
--- a/package/tpm2-openssl/tpm2-openssl.hash
+++ b/package/tpm2-openssl/tpm2-openssl.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  2ee15da2dceae1466ffba868e75a00b119d752babc1b6a2792286336a3324fb0  tpm2-openssl-1.2.0.tar.gz
-sha256  7ffba9d66226eb67abb9747ce1cd47477d566143a8ded597bbd974c6fb5fe9f5  LICENSE
+sha256  9a9aca55d4265ec501bcf9c56d21d6ca18dba902553f21c888fe725b42ea9964  tpm2-openssl-1.3.0.tar.gz
+sha256  355dd0ed306eaba0b7397542973b0bdcce84fed036a58f94be8cf7d75f42deba  LICENSE
diff --git a/package/tpm2-openssl/tpm2-openssl.mk b/package/tpm2-openssl/tpm2-openssl.mk
index ed590c2f47..60bdf3cf4f 100644
--- a/package/tpm2-openssl/tpm2-openssl.mk
+++ b/package/tpm2-openssl/tpm2-openssl.mk
@@ -4,13 +4,17 @@
 #
 ################################################################################
 
-TPM2_OPENSSL_VERSION = 1.2.0
+TPM2_OPENSSL_VERSION = 1.3.0
 TPM2_OPENSSL_SITE = https://github.com/tpm2-software/tpm2-openssl/releases/download/$(TPM2_OPENSSL_VERSION)
 TPM2_OPENSSL_LICENSE = BSD-3-Clause
 TPM2_OPENSSL_LICENSE_FILES = LICENSE
 TPM2_OPENSSL_INSTALL_STAGING = YES
 TPM2_OPENSSL_DEPENDENCIES = host-pkgconf openssl tpm2-tss
 
+# Need to disable -Werror to avoid warnings being treated as errors
+# with some gcc versions
+TPM2_OPENSSL_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -Wno-error"
+
 # Provide --with-modulesdir to avoid using abs_builddir and DESTDIR
 # (also defined as absolute path) at the same time to define modules
 # install path (am__installdirs).

--===============2258856686267367705==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2258856686267367705==--
