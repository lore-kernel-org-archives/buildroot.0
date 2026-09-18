Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C471FC982D8
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 18:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 913E540CAC;
	Fri, 18 Sep 2026 18:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eb0MoDPklNqG; Fri, 18 Sep 2026 18:45:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B16A840B95
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789757157;
	b=M2GgeRqBMR6p9So4SqJlEQ9El0UsSX0+obXBvCJiuvZtfqWOKP0qQZjYklD+Shp7fCCq
	 fNI6LGkJYAxEthU5dN6aImdnxm1ePtGysZfKoBh5VprDYbOKionBibXzJJkJwp/hxISkx
	 3pdby3ESSeS7xE7qE6YDT18mIK1cAIPhHQzlYs8ciRpD4KeX6ud/9c3nrH4I4/cZoeJxx
	 bMfNGV0irhTv9u8uNx/Y079Lw6j+HN0D5B3Lsu8/mOax9dyOSkUiw3KtaVO2F9q7aaT7C
	 sHDxj7OxngWdLFXLUnyIGDR6O/qqu1G+Gv4NB4+zWXWcQnOwy5B9E8gxmfKJ4pay8GQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789757157;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UI0V/cL4KzQQ03sMby3R2tcnXugPQ5YwYspsxAP2Gj0=;
	b=LtTy0nOKWrQLyapjkGvUsRNMiACstMI7aSX9k+F1bmEC//hYV7DVO8KdoSMetqhNQgIV
	 7szycr2WifEGxnMn0aaDx2TAZk+qho9UJe+LzT3wdiWFR9pfQM8fYV3XCeHKVfgqZlkH0
	 EA0FIIz5kpNOk9vQjyup8t6nmWhVuirCH+64snuDdfY7d8tIUlZ0FyvpzOskC1TWmckZy
	 uGvQPn9Ll8Ud/JDutnnhHVNfiDV3zDjwI3iZCGpRRNaBwmyOhhFi+qCQgTNn1lXYvVIJh
	 UjH1BtqBkl5Bd15MEJkMqKVXqfOiOD38dC6Jgibkj/3Ms0CX4Rw50VxMgr9q3Nkm9Og==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789757157;
	bh=UI0V/cL4KzQQ03sMby3R2tcnXugPQ5YwYspsxAP2Gj0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=U98JuuEnhlxja1nl5ZU6qfapYWFhJREwUeKYHxPRjfRs4Dqe8vAONqm96MubPhZTI
	 D4G81xtABPcczdWdp6sLa6MFrPkkNBA4lEUPwlyHpmLTGKHdBdlsltrAD4VS/FBBuP
	 ZdW+znYfiSX/B9ULAQmWk3DL1RJu0Jp4Nhux+UFN6dzzrFU9nMr4clARDL/qLKLakv
	 4cdg9RQMbhUCQjykq7QEG4GhFfVgAA1mNZIOpyyL1sCjNkWQ14SprXqK73B0i5nqfJ
	 nb8nscrs/1uN06JFZB+GHaSnIBwRBtQltmTQ0rsUZkMwC7vnubrRJWY50+c8dSz2Bm
	 4/kViIbpE8s2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B16A840B95;
	Fri, 18 Sep 2026 18:45:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CFFA13D
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AB0D812EF
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:45:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0a9hrd7L_AQr for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 18:45:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AAD62812D5
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789757155;
 b=epU0ybFPubv1O3+IL9gK7qb8LHnaOfnSOX0qYgufG6Vfv9/fbXkkb1QXuHZ4jiQV8l7i
 aEWWxL/WvrDp5ZCdquzV0SInflLSR0pLxh0c8qmZqX0mlF5bah/TuetBsB4mhLsOQS9ZS
 ZvuygQ9D1b4g72/upEdnXiSDbiNGRq/pXCUg3A5VnGZUTDGRZ/2iT8B7Ud3cKc8bH2Ry3
 E2kW/mNQxzM98YBxLTTQzx2gz1+LDhOH0DArSe062DQ6YEBJcu8i1f9xvsfzhtr2+rx1w
 Kh9m92vtBpE5mSccAPiHCfyvDYiMA1ZZJL5pHDs2y0Qs+z5ksByTwOfQrCI1JpXdf/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789757155;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=l02fEPHAbfQO0TZnT1s1a/4hCqW7ISI0Im3MOgR6//8=;
 b=NkitTOrpqH1RThr7pZMU8BCasq8CWHeuSPhEueSRBrTfEZiTtJTnyz33dh8c3phxqyKn
 HsW+OBPiYZ24lTmiEab18bPYZQcSRbwMxy3QCDCRswSRkSVwTx7PhEQAGXL0zYunXyxiT
 WfEWeqwAKgcbe6tGfvQqcJUWIs4h1oAbiWEtBIdtqdThWqRnm853Hc6bryXJ7jO0MCTMz
 3KurJjEjVfL71x1CrNWyFhhgZ5/1omqR6TSJ52NyJnOphDlA56GfGVzqa7Eow9htZDuiM
 qniJCF3Xbu/JIKAmIWsGQAVXubuxxdnRuZLPXzA90n6DQPzbZak6qOs9LqDxJGhJgsw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=rL+L3oAR; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=rL+L3oAR
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AAD62812D5
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 18:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789756923;
 bh=l02fEPHAbfQO0TZnT1s1a/4hCqW7ISI0Im3MOgR6//8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=rL+L3oARZzylRbyGiWJf7dTzB8CUEe0+G2A6yleF72lwZTRK+gfYBA+8YG8wRJAbn
 oBU8vi5ToqQnBOWszNwFgFGahzdCS0Q5OzwWuAxfWcIKFkiHaz7tiLEayi3Mx5En3i
 MemCfKOke3CNJC08KbiyXO6zWFPgXeQpIyMNbTz7Vk57NlFhSWqu1tIkW2k5eGHfDd
 qsJeys67ZHWMllghWv6q8YowQLrEUrhho7WNChW62Cr+fJjdZvBZC9aialcYG1TYGA
 7kLMEbnGcI7zoAO9uLpZOWqJ7D3+FUyK1PGzUZTDkjAu9cdA3zd6dTbRWJKtoWCUuy
 NVVn1mKo9eZNQ==
X-KAS-Sym: v3:f51bdf72230551df:lkseH4ZbqNj6+SWeyhXOROAVDVA4wctn5GqYnvj392NxznN0rSxqdWBYYBdhITxI14gBE1k+pJkBIChL3/t/lCKYI3GtmdM3wrKpFumwg08Wm/sNokIQQ6E7zEBL3K1/hdJasLCtPFWYZLZ4DnysL3d4pK5HKpKudG9dMfXruRPXYqC+sKlv7VCmjdbM67WcbSYib/I5z3KXlTx93kwxaIjh7oHXDaIgSs3BBwdUhzwgu27GIhhGPs84OFj8HKUhaehmsatqjfsuhHQOPWGzMJyclLrqdN8RENcGlb3kAp1RNMG5gE4Srsk7d6rPHzd5pP0v2pHDKySwyfSJf2xgPw==:qEieoh7PtMXV1j33nPDC41HycFcQH0kosOtZky1dOmPR8x46YhHnW37X1oC85hS/4YaWk/mjK/wwuYS4e8jCcMiyGR/9tf7WcJKSePrzkO8ebG7KbixCmfbE/Il75qbNXqf/n/eQsB08LKCQfGxNRgr9zwYHDC61LRaCnFk9TvYD4suBh5nVmYSQwcdHM8aTcLvSGyGuHOlJFdG0xFTF0TvNB2i8u0LA+dXoUdY9dJQFYYBn9GsoQSpDlx39v8+64Y3FaQ9fXqP+ED9LDFBN0J0kYZXdd7pV7Fwpf/66Wdys381+mL6ybDUFdA5XCqBEqmXf1I6dzdq6SapFBmkhtFLqg52PlAd29lYhX0S63po9yI0SyEwYHWZJK3hT5KgEYCZ4jLfJe7XBejVn3Y5x6s0G3sK4tasRUDYJSTezvDszAjJwUPSQcbFLQOq+IoYZ0691tdD1avhVmSz9bz0UpUmRNqeUa07XnjKPHkbaxZfdWNB/GFlPhitlD1f8Uo2yxSV+wNtZacKbocuLjmmuQR/+qJX02h9o/NLGPQA7ts3OFwzWr8f6B5axyNXoHW8b4c9HWzxnlcYuHoI6IzZgjHxG1q0Fui77bzuJP8KMv59dCa
 71AwwLcSrGGKEnqvVXEQZsAS3fKvvmLHrMozgSBEOK74Fbnd8FGqK3tX92w2RoFjJLhGdc+DNc
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id F02D8A4C470C;
 Fri, 18 Sep 2026 20:42:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:59900)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x7dX1-000000007cB-34hS;
 Fri, 18 Sep 2026 18:41:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 18 Sep 2026 20:41:29 +0200
Message-ID: <20260918184140.3631274-68-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260918184140.3631274-1-bernd@kuhls.net>
References: <20260918184140.3631274-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH 67/77] package/sscep: Fix build with OpenSSL
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
Cc: Koen Martens <gmc@sonologic.nl>,
 Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../0003-Fix-build-with-OpenSSL-4.x.patch     | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 package/sscep/0003-Fix-build-with-OpenSSL-4.x.patch

diff --git a/package/sscep/0003-Fix-build-with-OpenSSL-4.x.patch b/package/sscep/0003-Fix-build-with-OpenSSL-4.x.patch
new file mode 100644
index 0000000000..61fdc692d4
--- /dev/null
+++ b/package/sscep/0003-Fix-build-with-OpenSSL-4.x.patch
@@ -0,0 +1,33 @@
+From 813ebb01ee32c35474ec8eb65464f698ccd6495f Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Thu, 10 Sep 2026 00:00:21 +0200
+Subject: [PATCH] Fix build with OpenSSL 4.x
+
+Upstream: https://github.com/certnanny/sscep/pull/192
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/fileutils.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/fileutils.c b/src/fileutils.c
+index 7b846b7..27608f0 100644
+--- a/src/fileutils.c
++++ b/src/fileutils.c
+@@ -447,10 +447,10 @@ guess_ca_certs(const char* filename, X509_NAME *issuer_name,
+ 		if (!is_issuer) {
+ 			/* X509_get_key_usage(cert[i]) is not in older openssl */
+ 			ASN1_BIT_STRING *usage = X509_get_ext_d2i(cert[i], NID_key_usage, NULL, NULL);
+-			if (usage && (usage->length > 0)) {
+-				if (usage->data[0] & KU_DIGITAL_SIGNATURE)
++			if (usage && (ASN1_STRING_length(usage) > 0)) {
++				if (ASN1_STRING_get0_data(usage)[0] & KU_DIGITAL_SIGNATURE)
+ 					*sigc = cert[i];
+-				if (usage->data[0] & KU_KEY_ENCIPHERMENT)
++				if (ASN1_STRING_get0_data(usage)[0] & KU_KEY_ENCIPHERMENT)
+ 					*encc = cert[i];
+ 			} else {
+ 				/* no usability constraints */
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
