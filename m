Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB369C9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6B4C40B18;
	Sun, 27 Sep 2026 10:54:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zF9mY56lYXr3; Sun, 27 Sep 2026 10:54:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D677540B10
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506493;
	b=mtAuNavtUBLuU5KuOSrwoyfQXrI8pc+2aaixXR16yzvfO9AtnL2pCc9T0/ae1Hz0TVH3
	 KibYl10psr2xVc7kuSg6Ql/oLwp+VRRWyOTSHaR3oR7Fw9hOoFFA13jZ4Yl+8tdIW64EA
	 SXlZj1tQMjumf0Qn0M+MvogNOOqOKmyQ2DKWgGfuQKqb1t/OmNmSxpmxZ3aDfSuxeiW+Y
	 X2WI7C2FO/Z8qj8E+LhuqARopIuhuCmfbNF6dAPIJFAj/Au3jpdZIi5BmiQVeWaqGLfIM
	 Hzib5WYj7QR/YJ3YcnK18MAvE/cITVnHkFN62Dt/IqHFEcUYHr2VkBAv1kN1hiHwbJg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506493;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7HJQcqabToS50lIpqdaHWmxm3w2SRGOYz/TVG5/Tzus=;
	b=WMTJ7Q0RWIEUPg/VOHk7OGF+QH4NtUFEo/9W5l0mQrp0t4DFjV9bT1wV4aVuifWbFg7N
	 2JC/ygFI/gOk3Nr78hSWfLcoG2X+U3z01gsP0RWdygXzsyrsIxhwXBmkDR9ec5hoRQ1lN
	 jUsJq8TMIm0uuILlqLYIY0wiCNa/XkbsO7tIzj7096jccoY4M3JQLQKEZ0uSZjTvBcMTR
	 uRoxKtHSrJ/IFzV7oWbnUUYD9N/vKj0cBqIWtcIzRSUSh1FRv8J8i0b+b4v2naaqryxK6
	 IOVRMP8rCjMtS05heB/G+1XZo2/FAnqvHa2x5Fb6QM/+WaRjENTJbvadq61Zn+640Fw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506492;
	bh=7HJQcqabToS50lIpqdaHWmxm3w2SRGOYz/TVG5/Tzus=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=b3TDoem0UFomwgDjtrUt2V7qAQcVrOM7DwjVNDPrOnQIAWRQcODslBQWq9tFl0Wf3
	 lHxpCC3yICT1brCLruPLCvczi8DxZUeKLK+YbiBbOK4aLCVYfdLASGDPFoE2bam0IP
	 z1PR7pbEHwnIq5iOyI2pqMO3y6Wtrn/mkTF/2QHa0WAPMjVvxYZ/R74yp0aKmohy2S
	 DG8Qs6t6vxAVzkVYdX6u9wddzvRNxcG3AzW2PKnyx72HlWWYii2T7P2lM6aIUlILsp
	 5+rNRLJrB4IBiuotfg9UUnaioT3TD4UhtmU6oHOoPPZjoRSoJgTM3rRcgTmb/Sa7g4
	 pu+LS0tK7rOFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D677540B10;
	Sun, 27 Sep 2026 10:54:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D8EE6335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:54:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE6A780E07
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:54:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IjoXsRdiKqCD for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:54:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CD392810D1
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506491;
 b=ibXOKB2VZs19sZscMydJRPGWqmP291rCT5367R2qPJBog2Ej8xvArnHwiOWN4BVU6n68
 51DEB8oNBHRK5AeWoNZMAnRB5oSrdJJ1wxuHEcFKTIoFwoWF0Q7RwHDkR9mVDEEqPAIR1
 8tIaVuYwwVGS6l3+x5VJVBWjU1hwRVhdL2gPF5BddmrLnX14xrm2qCpA2LoBrgtHv2kbz
 qJnrKDKu2k9T65qQreoEavSI0W1+P0ZaJ1slgbILGPI09dA39oSbRGXO9kDwzW55Rs4j+
 0R21JV1Nnyzh4V70ZjQLgcjIiS+04kkYZlfynJXETV3OmJQF3io5J+CS3IErOJk/58g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506491;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=UTTrzdFT64qWE94loi2rLwOT8Cr/BOq6ifW37i0ttzk=;
 b=bV014pFcyz46zEMEp40SNuFqRwIzr2E5ANLjny/hn+EmgBPfTWff/XTemneNCFsCXCz9
 CQMxz8X1K3gDmJ7jhbBxuch2+i1J+UjC3TQ4iBlKBqLLvdjGWaDDEU0dvtXtHEW2yEVTW
 shM2EYCQa/x37Km5+dIfnuI1W/9VgPq0VGxHRaWRU5ysj3GYj2J85dyMg0/B9lUfXGtLc
 E6oyb7rpB3E26czBQutDV3Hwxw2lbGwwaeg7YT2N6p5Y5cH/Dh6gJNQ0MCuugC985zPI9
 zBFui/HOcsWCercn2/DMkLkfBv8DIKIXlCiGN6fYbf3KzSL1oRtfnwONx6QFFCq1ivw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jbk9dwMM; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=jbk9dwMM
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CD392810D1
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505857;
 bh=UTTrzdFT64qWE94loi2rLwOT8Cr/BOq6ifW37i0ttzk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=jbk9dwMMSdbU79q35cNChgBGQdDcUEUQWgSPL/909edDWY43kzBklYdgIsi8yXW2F
 gu5u4Kj8lq+4Rywx1ORpz2s7Q4nR/dvXZA8aPE53hhUBu2Z62+W7AUGmzybOkibJVy
 4fzPLlrc5AJ6hSe4mzXqjK15gR25MLZvYN2K/JgpqZUnSPZLWgZMTv0/dNx1XRu5xC
 9ephVlwjxScHszN4jprj0xFAOimXC4PK8uD7fSS5r7tSjbg4pH7Amnn6B18Zs9qFWv
 amJVbGdZMi4/Je+uKXgOy69B+hrleJ16QYM9aH23tf/NigIv1VIRWWEGZdJJykDZV9
 IPR6/O1Y0UG0A==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 jnzeyMxcphv1eVqR3oQAhHYWn2XHJpXlXwG0VVvRMNMLqg4Gk3pSJKXwx6am6WS+8LgDqOSnl1A
 8aGJr6UthAhh7hCCDRrJtKWgSH5IBFkLdgxoEvJPnbXlmeN0R6VxGQeu45+orQ+IqBCZfg8Vjws
 IAgI8+1Q5FGfMrErOn+fiat9CNCYg7uVeQXRaF89UfEEZBdfkwO7sVCTNKRmyiI4y3FWLa2MFS4
 nNSQ/04job7MyzQYlLh0ixKGNGfZjio9xfQQ1HEjJYBc5f95+vy1/XvgCn20FKth0EYn4t2vbXy
 JLMkSPOLhVQARjeVLjpnnvr1Xa6KQFWHeE/8q+aj6O4PFJBbv5ZRgVMv1cY51uTTz6Yo6qpDLeY
 dBnNKud0n5LRvkGQyeyizO6bcAchX7u/9KRkxVGtnObCyXrTEjpFD4bdVEEJk7rQKafacqe6FQf
 +VaXCBNPWpeF/qz2nEfDMtQ24tNDo7HUQFfzdVdGkNCWB4r1ZM1lSVU/kKDhcdJzv3D42ea2grf
 x9sUbkAomUqsDW5EUrdzrdh0w/ytWnl7MUGwslm6bQoC/TVyA3BpAzH8RsbBVXUJ/NUMxc8M66j
 4mehOXNSPk2ABqKvVJIFuBfXWGS5VJGNkWxwyri6YIVWfiCh+ZZ7xUN3c4KOAhQL99UohLI18a5
 OGewURDJzKA7cNxrbuVdD
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 48553A4C4FAE;
 Sun, 27 Sep 2026 12:44:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLb-0000000007a-14GH;
 Sun, 27 Sep 2026 10:43:07 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:42:07 +0200
Message-ID: <20260927104301.1801638-30-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v6 29/82] package/poco: bump version to 1.15.3
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
Cc: Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Simon Dawson <spdawson@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, David GOUARIN <dgouarin@gmail.com>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Romain Naour <romain.naour@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/pocoproject/poco/blob/poco-1.15.3-release/CHANGELOG

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/poco/poco.hash | 2 +-
 package/poco/poco.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poco/poco.hash b/package/poco/poco.hash
index 6979a9a1e4..4c132f9742 100644
--- a/package/poco/poco.hash
+++ b/package/poco/poco.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  47394ea7ddb7b0a40e1a5be896f8f5dc77cfdc4f561d2e7131ecf582df5a0c3a  poco-1.14.2.tar.gz
+sha256  4f112fea59e0c65f0fffe30a4957f8d66cf41528c21dd9903e6d7550022c794e  poco-1.15.3.tar.gz
 sha256  c4b1e1e5f36d8331737231fefcc30f5714326aec7c387ad59a8115eb0ba7d6b5  LICENSE
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 63279d530e..7e2a9014bd 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCO_VERSION = 1.14.2
+POCO_VERSION = 1.15.3
 POCO_SITE = $(call github,pocoproject,poco,poco-$(POCO_VERSION)-release)
 POCO_LICENSE = BSL-1.0
 POCO_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
