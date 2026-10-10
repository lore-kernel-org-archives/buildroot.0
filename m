Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DF5CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 08:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2C2A60727;
	Sat, 10 Oct 2026 08:42:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oBD4lwPoVuzK; Sat, 10 Oct 2026 08:42:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 13A2D6066D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791621763;
	b=fjSjUpXeWpgCD38XSebbhunxFxGaNDAKSLXizEEMH5mZ8vAuFXwsb2ChhNjSWahwB6e/
	 0rtbKdhPZL+PJsKOE/JEeoHacHQ1ZMboeHS24Xk6EnsdaLks8pobzGzq50YWJrqebf9zX
	 4+2bXzujnwE+jYp5h1qivzBiu7aYHZGwEqYHKXDYD8XYVUDFctNnPLLBjFiwx7sr2FBQ8
	 sZNgjvTvcJ6GEmV3kxyFLB0trj3Kn2u8M+xqfsYQn3BrEoSXEgkD2oCINq4uBkm9zZA1G
	 LcNS9tHxDGeC/GrsdrJwzIanu50jjNIVUVnBaJPlmig6yEGaGY2xnm14Z5aDJ39qfeQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791621763;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=xWBEP6FI0taoMqfmx6Kl7uUYwt2JzUw73LHmql3g3ks=;
	b=Qh/awiFB4eDmjMmHCvbA8eHsFRNR7raEK2p0yvCC+y+vVqPEy8w+9zPmoc/aUEUoD55o
	 3nVDL2ikpjtJCM8P60ZDtiGylPvuki0B7+OVbMaazRhyNXE2eaq8ZBe2yvGOqXJUPyY+p
	 s9Scx/uDilisqH26WqQOXiftPmZ9Wp48S+BOnL+UkR0Ld0KW9iH6SovuXRe37vEARzUgy
	 HdiRzo1CJgTr0SvEIpnPYg0qL0ydncKG4yuyjfATKFcIKCSy2BxHJ4RsXx6HAsryYFYeZ
	 Db+JOnb4cm+DPH6wiHyo6X1j78z/Y4BnNJ6xnq/NiWpPsiQ7Qtc8UvmO9oAVM5TQXFA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791621763;
	bh=xWBEP6FI0taoMqfmx6Kl7uUYwt2JzUw73LHmql3g3ks=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UCim2j+gWf5YGQld+yUqSp9ASsw4jpI9wy0t5G/4ZsXPEU9cvsuoSWcyAv1a+BsXh
	 1fJKA5Dzlj3WPYfDf8xUNcwtQluQQ730791crjxJ5oEoXr3JX4Rut66a0Mzr3+mSQs
	 OsiAHYCWaKkwBeB1Uw08pRwRO+XLPYYIWfwbEHIz1E1YjKJAH6f/UE7cBb7a4Hmm3m
	 FZO2gPzgnEANb2pr6q/ymUQWiW7aaJAGF7bra/bOu/OXC020aLFKf5FzHp4mDuirDk
	 Cm7avcIE9q8OIPpc5DXFcrooGyOm1dw+WZSxDjRHa0gs6MOkp+MHTWMB4mMLYCBxQr
	 QXBiTM70jTSbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13A2D6066D;
	Sat, 10 Oct 2026 08:42:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BD9D8380
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AFC1A4006F
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oWISTjPQySbx for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 08:42:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org EEC1C40004
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791621761;
 b=MyDdq3wuO+FS5S6N3strxU4Okn2knFEM/bzDRSMzvnumBgr3zdOCK/ATzTMd1tRhtMMO
 lsAg9mteYCpAiF5zm8v1pUMPoiRfDkILyo9NUVqsAkAMBPg98rm1wUcJ2c9mMQGnlIncc
 69w5ovNlZyHawaZhOJZ/7I7q8ukVNWA7nLDH1QPmtoAhkwY0vJxosH+6QiB+BA9yzV3bO
 4Hk2ACiYjlbs1l5yf1we5oiqMmS7kLu4RUCoXbb0iloFZqHhJzwUmuGNTAKDOB1glFhJy
 /QCBngn/+QtpGNLR50zXfbVlOmlUFx4dNPZpIuKBvY1YaJfpoc7CBQxVFCJLrJQgxzw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791621761;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=kEyTe/lmozDzG2tYeQNEIQazPOVY2VQwtaaN5sAMvb4=;
 b=Gs4WnfrK972330qHeuY1yuJu5Gm4J6j2KJ5ACpKpZR1AAnZTZDspIDzKRv/xlPIpU/SE
 /CoyBDXx05n7SeRiJK7XEI+Rz82A58Ky/Uaz00BJJWWQDTgt5zGEDQ268TkNI0nSzt3gc
 ra0HqDDzAi4agMPxJgqMqCkcsUdKAWaS2maLDCR5JCSH9XZ4h6wXC3LU9UP6/dPKzpRnL
 BeubiMTa0ySSCr1McixPHx3MzMXFVppB9txy9iqp7IToQcOyg8XkIxkFmUJUCd1dQ16Pg
 gDhYVOww9ZzysM2r4ECqMG82C6Gt674RnKAgQzyw/0syVPuxMX6MMa37rEwUf3PRy1g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EEC1C40004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 08:42:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C54228F027; Sat, 10 Oct 2026 08:41:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 10:42:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a16d792813d4c06de7745057c5b65496f30b05e4
X-Git-Newrev: 6fc480e3bd59fc00d78f222650d548c18f9c532c
X-Patchwork-Hint: ignore
Message-Id: <20261010084122.C54228F027@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libesmtp: fix build with OpenSSL
 4.0.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6fc480e3bd59fc00d78f222650d548c18f9c532c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch b/package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch
new file mode 100644
index 0000000000..f38435b68a
--- /dev/null
+++ b/package/libesmtp/0001-Fix-build-with-OpenSSL-4.0-opaque-ASN1_STRING.patch
@@ -0,0 +1,36 @@
+From 0705423e2596a21e2d4e1f3fd492792956a4bad3 Mon Sep 17 00:00:00 2001
+From: Ravi Kant Sharma <ravi.kant.sharma@canonical.com>
+Date: Tue, 28 Jul 2026 20:35:48 +0200
+Subject: [PATCH] Fix build with OpenSSL 4.0 opaque ASN1_STRING
+
+OpenSSL 4.0 made ASN1_STRING opaque, so direct access to ->data and
+->length fields no longer compiles. Use ASN1_STRING_get0_data() and
+ASN1_STRING_length() accessors which are available since OpenSSL 1.1.0.
+
+Fixes #33
+
+Upstream: https://github.com/libesmtp/libESMTP/pull/34
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ smtp-tls.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/smtp-tls.c b/smtp-tls.c
+index 9f3e50e..981284e 100644
+--- a/smtp-tls.c
++++ b/smtp-tls.c
+@@ -599,8 +599,8 @@ check_acceptable_security (smtp_session_t session, SSL *ssl)
+ 
+ 	      if (name->type == GEN_DNS)
+ 		{
+-		  const char *ia5str = (const char *) name->d.ia5->data;
+-		  size_t ia5len = name->d.ia5->length;
++		  const char *ia5str = (const char *) ASN1_STRING_get0_data(name->d.ia5);
++		  size_t ia5len = ASN1_STRING_length(name->d.ia5);
+ 
+ 		  hasaltname = 1;
+ 		  if (strlen (ia5str) == ia5len && match_domain (host, ia5str))
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
