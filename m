Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B519C43458
	for <buildroot@archiver.kernel.org>; Wed,  8 Jul 2026 07:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A35F160E38;
	Wed,  8 Jul 2026 07:24:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qsyuMpk-Om7D; Wed,  8 Jul 2026 07:24:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CDE3F60E3A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783495484;
	bh=h8IlLIHtL7WVSNX2nJvwT1RqFIU71ojHQlBKvF8moMk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=OnoNU7+KxNkbky44VPmYNBdN0uRGvh7BTufiRPOrO7LTSzwp1CYim+3YsKcivFfTz
	 iThZVC/Ym3cHPSn3Hv5AsjPjPG+Udnf9TO26rqxACivX/bWiqr5ffSIQK+JmDpWkkf
	 /kpqRoGEaU+5pj8x4X7fVE1FpPPZ00ww96zYXICmdhCQX6g524yfIkKDn1z8qP+lKZ
	 j3NmPJeV7AbftZS5uNf5lkHfTc08zBapygNgZ87JRFOhRaUZyh2+7C1/ma1dmHcGy0
	 NL+b62hkD0U4QHFNWtpoqn0leLRBiAfOx1VE5w5G3nMQf5DcJH1sUZ+giW413y0YZ/
	 J9r8m6DmCipiQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDE3F60E3A;
	Wed,  8 Jul 2026 07:24:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C888315C
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 07:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A982560E38
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 07:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NP3zXQ-CaDLv for <buildroot@buildroot.org>;
 Wed,  8 Jul 2026 07:24:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:4f8:1c0c:5073::1; helo=mail.heine.tech;
 envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6144F60E3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6144F60E3A
Received: from mail.heine.tech (mail.heine.tech [IPv6:2a01:4f8:1c0c:5073::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6144F60E3A
 for <buildroot@buildroot.org>; Wed,  8 Jul 2026 07:24:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 0596B1814BE; Wed,  8 Jul 2026 09:24:35 +0200 (CEST)
To: buildroot@buildroot.org
Date: Wed,  8 Jul 2026 09:23:52 +0200
Message-ID: <20260708072408.19685-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1783495477; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=4sQ89Zx+IW4vwDuDOU/2TkogvEHTkUFNiNK3Iac6lhE=;
 b=B1B8y1Y+Rv68akDu170p/91KGFMRwywI5bLaP7WHTRscvCu1ADPeHeln9NBfINRIxrJhiY
 NhB4JrDvWiCmW9gUDRBIyNvWfhYSslCr8TjY10EciHpkpCR2JqO3zNRe6zlKvdmmVBNO/S
 xaJT5cqkYNZtmxml1ytjitr6/A0ordY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=B1B8y1Y+
Subject: [Buildroot] [PATCH] package/fmt: fix 32-bit builds
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Semyon Kolganov <semenak94@mail.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Provide a fallback when native __int128 is not available.

Fixes:
https://autobuild.buildroot.org/results/39df217ad5a1036d5e606ae0e8291d885e9d0e1a/

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 ...001-fix-fallback-uint128-bitwise-not.patch | 42 +++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 package/fmt/0001-fix-fallback-uint128-bitwise-not.patch

diff --git a/package/fmt/0001-fix-fallback-uint128-bitwise-not.patch b/package/fmt/0001-fix-fallback-uint128-bitwise-not.patch
new file mode 100644
index 0000000000..123c43ab2c
--- /dev/null
+++ b/package/fmt/0001-fix-fallback-uint128-bitwise-not.patch
@@ -0,0 +1,42 @@
+From 588b3a0f8f6a8bcf2a959cae882d5b2703e86737 Mon Sep 17 00:00:00 2001
+From: Vinay Kumar <vkslog69@gmail.com>
+Date: Thu, 18 Jun 2026 12:22:12 +0530
+Subject: [PATCH] Fix fallback uint128 bitwise not (#4813)
+
+Upstream: https://github.com/fmtlib/fmt/commit/588b3a0f8f6a8bcf2a959cae882d5b2703e86737
+Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
+---
+ include/fmt/format.h | 3 +++
+ test/format-test.cc  | 5 +++++
+ 2 files changed, 8 insertions(+)
+
+diff --git a/include/fmt/format.h b/include/fmt/format.h
+index 5044befdd863..570627922c62 100644
+--- a/include/fmt/format.h
++++ b/include/fmt/format.h
+@@ -326,6 +326,9 @@ class uint128 {
+       -> uint128 {
+     return {lhs.hi_ & rhs.hi_, lhs.lo_ & rhs.lo_};
+   }
++  friend constexpr auto operator~(const uint128& n) -> uint128 {
++    return {~n.hi_, ~n.lo_};
++  }
+   friend FMT_CONSTEXPR auto operator+(const uint128& lhs, const uint128& rhs)
+       -> uint128 {
+     auto result = uint128(lhs);
+diff --git a/test/format-test.cc b/test/format-test.cc
+index 9a2258d5921f..8c2670a19fc3 100644
+--- a/test/format-test.cc
++++ b/test/format-test.cc
+@@ -82,6 +82,11 @@ TEST(uint128_test, minus) {
+   EXPECT_EQ(n - 2, 40);
+ }
+ 
++TEST(uint128_test, bitwise_not) {
++  auto n = ~uint128(0x123456789abcdef0, 0x0fedcba987654321);
++  EXPECT_EQ(n, uint128(0xedcba9876543210f, 0xf0123456789abcde));
++}
++
+ TEST(uint128_test, plus_assign) {
+   auto n = uint128(32);
+   n += uint128(10);
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
