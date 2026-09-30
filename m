Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0964CA5FD2
	for <buildroot@archiver.kernel.org>; Thu,  1 Oct 2026 14:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A1A140D9D;
	Thu,  1 Oct 2026 14:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QDbGHB0m7U63; Thu,  1 Oct 2026 14:23:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 8AA2940DB2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790864621;
	b=Ex1Ao43YjgMwZPfQlAuaRGAukfiHj0351POMUIXE2zNqC3Sb8C9akJ3ZK4epcuKwfSGb
	 D8AgFQmKx9Z3kOWNxZVZFkseZMSeryNiBEV9nfelqqaa1VSJPb1roYZM+fRCoA2/MY4eH
	 n9ya1I22ragytI8T0sX0fhvmRSXyrz+Tes3ux4Yi5tztz1IkvSufZnxy0fgiVVoRAgbsh
	 flyTIe++mo02SqH0/s++8+Ir2cfJu3Dy7Dgtn+NvEhs/T8HzPuzJ1HkzLV6JJ5qEOfjK/
	 kGTm1PZJXEG8ugJpdgN3WmG0s3+FFl5WHeH3ijhXOIFrh68cB/OJYNgiVjxMoGxGA6Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790864621;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=nsslaTk3k1GPNxRfgBQSAfZGZM1DahkgSVaTVDCq2RU=;
	b=hliylRZkAZpMMoBnejX6oO/4XPXOSbXSwvFDk2ESpiKo4XBrW/di+kPH+j8uehVpPJcj
	 Siaob6d6h1OeLT4Ulbg0WyJRK+gJgEiJyl9W6YI4ypMlnsC+R1INptc9ZDK/5U/HGQQ/u
	 z8yMMQx97KBb0kztrG5yqAiHbaRCVdy7TBHZYmm7eZq3gArQS3D8Ih+EDsXcRhw54yx8c
	 fwsnl2/INoHfx25VfNgJ7gxd5Jj6JZJymE/nRO9iU1ouUcxXppP/xbDBN+eqeJdvnceLp
	 l6tDDM526uiAaL4ywLEKy0M8JzLDiDoLMz2bXTET+i9YFOoLgm8SLsrGAUQuPpXiRTg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790864621;
	bh=nsslaTk3k1GPNxRfgBQSAfZGZM1DahkgSVaTVDCq2RU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=epq/iNHisKp6i9nP5I1kWEp1iICkobSmv4xwGxbEGUjdcpwp2ew12PYDYW5MWwn2l
	 4swVpURUWdYMyTt5jR/+ScKR/6dt6drk/Zbq0OdZeI4hIuvRXmi9nK7d4Zd0/SRCeF
	 RvUi8UCZYFrJpVwdFWyKAwu6sw+9pa7oc23lIAbDW4fZMgRxDXu2DQK8+VX/QQ17KE
	 8wQhIZTaOeDntLe38DiEuQYwba44MxgD3QkuztoWUrwMH9onjCYZQO+sv7e8d0EDOh
	 s9IX+eLyQg0kPXJ7Drb01eSq6oaZrnyd/+bbazN6TNDPUvFge7tiTuBnyEemAn5459
	 7BfHkql0nIvBQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AA2940DB2;
	Thu,  1 Oct 2026 14:23:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E4FD31FE5
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D49E4606CA
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DCmyi6dadcYo for <buildroot@buildroot.org>;
 Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 32803607F0
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790864563;
 b=LOWEjGFqaDl/j8OtB6kf6dtl3enmyiX2aypeAut04p/TWV0zyyMhXQ1h+4qkvu/NyYaW
 jefI3ctuTl88srRyViJhc0lMXRwwQIcQFWPjW8ECeGqZ3FhIIHosveRvnSsDAhcwIWHGH
 hLhxrMzU4jJke7QRhD+DAt4J28a7YWpsiTL7kZrGdFAbLRvbbsbYPiPG0Tgbm3unJMuZg
 upJpTuhbRtlIZp1PT69xP3ohSAhRUZK6mRd/8YAR6ZPedeP1E6sGkFoQiEgk2mLGJetU+
 RynC+CuYWE1XNfT/DOqixkgF8T1Ws63fpaqA1M0DDd7VEwsK4TjV7Vq/4Za6/s/ldBg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790864563;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=zMcg3ndEP8ULGgCC58eJkcfUUzASTPYTOqGxlbSy2mg=;
 b=jbN3rsBHM6fzYNFctkK6qkIxRsVXmmZoA9C9WJ+2uPGP33ihGkOfBxbVHUC+jqPw0X1P
 SmzrkZU61I8UwX1H5rv37yEk/H1rjFl6EqMzcfNhV3oXR8+SDwD39115OYeEtpdAykIM2
 /TCG9Maighzh/wSt66XRX6UG/0Lya21l8PkUBY0Fs7p2PQzTSu/BRjqPjFW3UzCvHTYCt
 wieKLKBr0egoz6b8w2EQoN2mparVmqcRAqZKlCDP7tnIKH5hWzrnSXUh10o05W241TGXJ
 1rGbBg8ElNZSvGvo/nkpfkYCK3G5+q/DTeVwQh6DmxAQQmC4u8kgechq3CKLL0sDhBA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 32803607F0
 for <buildroot@buildroot.org>; Thu,  1 Oct 2026 14:22:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7ACCD9843B; Thu,  1 Oct 2026 14:21:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 30 Sep 2026 16:09:45 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 52c50abcd00c452c65d4e93bd7097371d8f1abc9
X-Git-Newrev: 328e2e7a802349aa2b48129cc75ef820aa2d1421
X-Patchwork-Hint: ignore
Message-Id: <20261001142129.7ACCD9843B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/php: security
 bump version to 8.5.11
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
Content-Type: multipart/mixed; boundary="===============0161265749176716791=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0161265749176716791==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/328e2e7a802349aa2b48129cc75ef820aa2d1421
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

https://news-web.php.net/php.announce/506
https://www.php.net/ChangeLog-8.php#8.5.11
https://github.com/php/php-src/blob/php-8.5.11/NEWS

Fixes CVE-2025-1218, CVE-2025-14181, CVE-2026-6103, CVE-2026-17545,
CVE-2026-91765, CVE-2026-91766, CVE-2026-91767, CVE-2026-91768,
CVE-2026-91769, CVE-2026-92842 & CVE-2026-93682.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f07eeff6dfd4b2ca9065e18b6c84e6ed9bc236c8)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/php/php.hash | 2 +-
 package/php/php.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/php/php.hash b/package/php/php.hash
index 0b3d87fd97..0f2b6785bf 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php?source=Y
-sha256  6a8bebaa4d5a979a38db29a9373e9851f60c6b11f72172c585947e78f3081957  php-8.5.10.tar.xz
+sha256  d9be75c08e8c316f4c8f4194d8fbe1750a15f6a6d9d4e3fe72082abeeb800360  php-8.5.11.tar.xz
 
 # License file
 sha256  b42e4df5e50e6ecda1047d503d6d91d71032d09ed1027ba1ef29eed26f890c5a  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index ac5730a22c..48525b7e29 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.5.10
+PHP_VERSION = 8.5.11
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES

--===============0161265749176716791==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0161265749176716791==--
