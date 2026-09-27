Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDEDC9830E
	for <buildroot@archiver.kernel.org>; Sun, 27 Sep 2026 10:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A830C40A35;
	Sun, 27 Sep 2026 10:50:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2eTMVKEBXM4v; Sun, 27 Sep 2026 10:50:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BA0E640A18
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790506256;
	b=kE+GEaAwVeFTcamIXlLaP90SUQBeIhbPYCT8+NsSo9FccLa1RzW6BlqYa4+ARvVlnh3q
	 16Xd6r9NC6/3puZSuStGdflNxvoXabpeylcSNCBJ7xPOf6vWlP5lytRCtaC6s7aQJ5Lrk
	 vOhS8IkU6hnTDvAMVuc01qKnap4mLJ4Mj6yZRX6gLryZeimzOGQz/k6rmny2dFjALG8uH
	 tbkTSB3/DxZ7ZSz+4cmtF4pzN3UyCAzFyXhxq13NaPKvhfyTj0bFk5v1TxX9v6jBLV/pw
	 YMhIzSbqkBvXhqtinPARc6KZ2msBLxiIZcKj7P1XPAD2EVOj+aEsRHoQ1fR9+ZMdZfg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790506256;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=OGrc8qs9EZHP2LtKQiF7fmOv5gjt9nhRTXBSk5i9eZs=;
	b=TQI7KNycrxGYjEaTvdQCBRWhnxBbLJortcsIMSKyqQYUc6bDrtmVBNuI/4BYcg7/XxVc
	 n4TaWEv4Ly4xeVdSxhBV4/swGkVcdfi0C7tiTr0EISEw9yQXV+DAHC22fmRdO0P/MFJUW
	 n/DqKvadnBVm45QcsP5KkzKuySz+wdkydxHB13442YdkHrmXbgPBXTp88hWD78mxqCmiK
	 NuuLOXyFDxV9wpieF7nrf48Qvz0dPSJ8AFLEvxwYLeS1xoyFxSscCqGyuAYJbJsfbYxzl
	 dMtAoCwncQ8T3k40lsksDwHS/TqFU1wRWkRV/mtj1LdCrHoaYOfWSSVT/T8IpzEnUNg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790506256;
	bh=OGrc8qs9EZHP2LtKQiF7fmOv5gjt9nhRTXBSk5i9eZs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RLlasFJXQRmQ/qQr1diw3oE/t0UUg2bXImq7sqidu0+QBz0fxR66apEESahXDUdBC
	 NEeTONcMW2zYOh9iMzkw8uUwH5nT2y9+vPlxa2eCe/4q4dalo7CZemyDvuMKq7EDYY
	 Do+QVjEp9PHQrpCyOu5D1DHjdl8S4rPAM3J806OLlvj1XGMaXJMdyXYBeh8BeQl/SS
	 IXGpDA1eS5UL93cL+RLrlaxW3rnNTAX3iha8aJm60sGgk2zANq6ZcZJC/0q41K1RzT
	 hHIq8a1BBxRrkGmAlsT8qFpLEt3GlfXC3uK5Owqfi/5MSWuO6krGvfcc2NYurK11El
	 1b/YWIC4+bFiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA0E640A18;
	Sun, 27 Sep 2026 10:50:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 441AF335
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:50:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29D45810C7
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:50:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ig-1OLpjKN2o for <buildroot@buildroot.org>;
 Sun, 27 Sep 2026 10:50:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6FB7A810C6
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790506254;
 b=APSjxBVM6d4VIQS8+55Dq8cmKau7/XOhSd/zNuRZoO89+GyyDujlOzHlMQH1zojEzYqp
 wf8qE5l6OcrmRNucsVNnJ8lddwDR1TDQ+ueHstMNxNnyKE5EskQUrja27c0kOjhdOrU4k
 1+f99pJjNPXE0zF83/jrv62N7AcOZ3kydM70ZB8pElT0qFZkB3i2faJlnPSlLvzI3w8i1
 1YvzUfrDYqeoWEgOC8x7ZJCpo6BWcNOOxIo/K/KQVy0QPqSjKJuO5WkpiQMR8cm763lEh
 NKVswDyFk94WUka+i7JXQe53XG+aq9a3tIzET88digCsJg27iRcV0rRH17sG74gFDeA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790506254;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=olLC4+YoYODPLQ4YD2SVA8Ucm2l7Gqe0j8OVcy6qtxc=;
 b=WdkiVvQ70iPcc8F6CSaTrxLR3PNGeXWhLOppXMJnYQQI39CLXwConoZHJn0PdGq6p61H
 /ITDe9ocgZko4QKzqTsTTACX8h1KvTVvhRQ2ZO4vXw6Yqz4eFPiYPEmL+5v/bG5NlcQ4e
 QhOgVVyUxnftuO+x+1KK+Hcg25xwp0CmCEVMXkMSs462h8V9V1TOOiivSJ2HXkBzlC984
 7YsBwXnhl7xzTBxa/EpbOm3p5RC0vqRNvEvVrIy4KRmBbzHBgzW4PRUrOqGKAw029PdGR
 UOaLZq4sVIjD6/nBlBG9M19HsX0djmWHqzrHwjU6ogK8lsYzagYgfjY4A0b/uPPaJkg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="TPz/J6ED"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=TPz/J6ED
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6FB7A810C6
 for <buildroot@buildroot.org>; Sun, 27 Sep 2026 10:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790505847;
 bh=olLC4+YoYODPLQ4YD2SVA8Ucm2l7Gqe0j8OVcy6qtxc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=TPz/J6EDoQwVOTrLiqGJxRbAMhAT6fk3NdbF7h6h8PqzXdDvZsFWTsrVtTci+3OzG
 dkgH5Z6CRs/cKYZv8Vs9C+ZnjxA4K0dUqqnt7i9Gr0Hurd0RNQKl+fecqZ3FWbd1TA
 x31DA8cyYYRIxs9C0XsXPNdaZO3FLWUX2W0/sUF+x1P25D4mhSxaLTa/9+lyyftm/3
 /H9Mmbe4pvxqvkuNMl9sMMZ4RfQ4etxvVOfQz6MsyawrGIZkekSc4x9Nubq9fnHT1p
 B4nbQbu6JYawkg4zVQVLIgo7guOxG5gDfbeK5pfYJug32pOGsrHtePzLUkHLiyksii
 H/sp2I16BFcaA==
X-KAS-Sym: v3:f51bdf72230551df:E60HSyKhvB/hjcOqjRN2FvcietonHg90tfBpdvJcFX1mV
 R+j6vuZST8LDBP8bI0YRByE7nnM8zo+J+Ss4/QfhH2rb1nZfmO3VL3WnTn4nRbVwBJk3fqEiiBR
 BcIUKL3D+tUbUY93P8XEXOPODFFTmbLRGZyG36MuC0yO1SCN7BpjWHnbwmJ351icj6h05v9k2IN
 Bt/GPH999d0pB27dQV9xkwjqVNcmstoO0TQaQ2Cjw4/UgevRPy7drDGL0hLAagZjTYF6H8SZSRj
 XAHROvBIIhQEG70eTpyXHeSoGFZnWeYqBa4vq9sbHMsU9OvNLLKcoUiiZ7ymf97ke0uUad1g==:
 3ukJ2EbzjhbpGDFJBseVQiSl721WCaP+iGigYc9I/0QMreXifkwf3vM00SS18e6rJe5IvlV3Y6t
 hN5EUzUzY+QweKRy1Fh4PQLH3cwENFg3cWlrhr7BCGLG5DXzLiENPoC+ARvmFbig0G/bTys825n
 71WVHRT5l3P/JgD/HwuT2p5nkYy9a/A7ZBeT7IZXFR+HrMaXfcJkvP/AvrxGoGqsl69UC0qUfxe
 CDPlabdbWvQ+wQqb3ioWbjA1bshDA1IAWNt/WBCZgxE3GOA64Wzg8wC9NJ3z9Ynid3iB3jBTypQ
 eUMqsaimMK/km7q59WxS2i3B1moEqrXiziWCDgV331X1tNib+eTTi5u1+/piKDdnPiCVss/T9DK
 uSQARw8yP/nGFSw1gNZ4hXitdVYxU1PxEiCLnA/Fea8eAQC/e13VRNqK3Lxc6MHYdpzj3T2/S5T
 qxY47vfJDvRiRSdfFHT4MXwHmPQPq4OpP9veI+dyfo3qXRhDzJQ6nm3EzzMD+R+esdJCvek4PlN
 PwsQ0HmdV0elSg0nnIsAKKNsMGDvRxAYL9gBIFA/V6tgTomFhiE4rU9xuHr844RxUPr4ibAFLtu
 ykExoJg/08p525jXSk3TPdYOH5W9QLitENZOEvxRIrN6nus1A+rmzvVSdEIjB2y+y5rHFz2dT+I
 7vjnn5UWUFns=
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1CB99A4C4F9E;
 Sun, 27 Sep 2026 12:44:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52850)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xAmLY-0000000007a-0E1O;
 Sun, 27 Sep 2026 10:43:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 27 Sep 2026 12:41:48 +0200
Message-ID: <20260927104301.1801638-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260927104301.1801638-1-bernd@kuhls.net>
References: <20260927104301.1801638-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
Subject: [Buildroot] [PATCH v6 10/82] package/boost: contract needs thread
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

From: Michael Nosthoff <buildroot@heine.tech>

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/boost/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 70e99aef11..929a9c3869 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -90,8 +90,9 @@ comment "boost-context needs a toolchain w/ C++11, gcc>=4.8"
 
 config BR2_PACKAGE_BOOST_CONTRACT
 	bool "boost-contract"
-	# pthread_condattr_setclock
-	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_condattr_setclock
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread -> atomic
+	select BR2_PACKAGE_BOOST_THREAD
 	help
 	  Contract programming for C++.
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
