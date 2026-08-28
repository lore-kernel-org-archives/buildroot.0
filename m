Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFF8C61DBD
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 16:47:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2564180AC6;
	Fri, 28 Aug 2026 16:47:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id REd2STyX-rBI; Fri, 28 Aug 2026 16:47:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787935638;
	bh=PMmziiDAIZZRqxlPJ7+eUz8N5VWCQHK0Arux758xxfY=;
	h=Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=n31l0dOfM8+uzVMjqISTTy7soRA+Pt6fzGALYlG7VuJDWgqkJyLgjIuMvLuLvSNcG
	 rk/PUBO/V9V8gF2PBmFHdPpxRFZPWvpno7glvkpqPJyXVzhjg/HZnoNmv1a8YEvpoo
	 Ze/HSuy+tvWX34axeEXcgu6TemUX36LXNUXOKYR/JntkpMXtWtvZcaU+azw3jSBdbr
	 6OyNYMlfnNpWD4Fg7pAIDAgFr5RcWl6f9EBUbiUFNu6rPaJm7u+UY4tMRc8bdaFMmE
	 tU+tTQ1yMfrHXaVUdKE5gc3kWGzf9qTuV8AzTM6ZKL8oTGl0CGuRkEa/OdR/d6GXaW
	 OPDFYTIh2QC4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5825680998;
	Fri, 28 Aug 2026 16:47:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 60E9F334
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 16:47:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5E8FB40396
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 16:47:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CXe8yGbycoYC for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 16:47:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=theo.lebrun@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5382340310
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 16:47:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 829C14E41407;
 Fri, 28 Aug 2026 16:47:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5739860537;
 Fri, 28 Aug 2026 16:47:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 408BD11C783A6; 
 Fri, 28 Aug 2026 18:47:08 +0200 (CEST)
Date: Fri, 28 Aug 2026 18:46:48 +0200
MIME-Version: 1.0
Message-Id: <20260828-xdp-tools-tleb-v1-2-463c25b5a99b@bootlin.com>
References: <20260828-xdp-tools-tleb-v1-0-463c25b5a99b@bootlin.com>
In-Reply-To: <20260828-xdp-tools-tleb-v1-0-463c25b5a99b@bootlin.com>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>, Daniel Lang <dalang@gmx.at>, 
 Joseph Kogut <joseph.kogut@gmail.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Valentin Korenblit <valentinkorenblit@gmail.com>, 
 =?utf-8?q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 Jimmy Wesolowski <Jimmy.Wesolowski@mobileye.com>, 
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
X-Mailer: b4 0.15-dev
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 2/4] package/bpftool: allow building on MIPS
 architecture
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
From: =?utf-8?q?Th=C3=A9o_Lebrun_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bGliYnBmIHN1cHBvcnRzIE1JUFMgc2luY2UgY29tbWl0IGM4NmNiMjcgKCJicGYsIG1pcHM6IEZp
eCBidWlsZCBlcnJvcnMKYWJvdXQgX19OUl9icGYgdW5kZWNsYXJlZCIsIDIwMjEtMTEtMjUpLiBV
bmJsb2NrIHRoZSBidWlsZCBieSBhIHNldHRpbmcKQlIyX1BBQ0tBR0VfQlBGVE9PTF9BUkNIX1NV
UFBPUlRTPXkgaWYgYSBCUjJfbWlwcyogZW50cnkgaXMgc2V0LgoKQnVpbHQgYW5kIHRlc3RlZCBv
biBCUjJfbWlwc182NHI2LgoKU2lnbmVkLW9mZi1ieTogVGjDqW8gTGVicnVuIDx0aGVvLmxlYnJ1
bkBib290bGluLmNvbT4KLS0tCiBwYWNrYWdlL2JwZnRvb2wvQ29uZmlnLmluIHwgMSArCiAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2JwZnRvb2wv
Q29uZmlnLmluIGIvcGFja2FnZS9icGZ0b29sL0NvbmZpZy5pbgppbmRleCA5NTAwYmFmMTFlLi41
NWIzMWM2MTc0IDEwMDY0NAotLS0gYS9wYWNrYWdlL2JwZnRvb2wvQ29uZmlnLmluCisrKyBiL3Bh
Y2thZ2UvYnBmdG9vbC9Db25maWcuaW4KQEAgLTgsNiArOCw3IEBAIGNvbmZpZyBCUjJfUEFDS0FH
RV9CUEZUT09MX0FSQ0hfU1VQUE9SVFMKIAlkZWZhdWx0IHkgaWYgQlIyX3Jpc2N2CiAJZGVmYXVs
dCB5IGlmIEJSMl9zcGFyYyB8fCBCUjJfc3BhcmM2NAogCWRlZmF1bHQgeSBpZiBCUjJfczM5MHgK
KwlkZWZhdWx0IHkgaWYgQlIyX21pcHMgfHwgQlIyX21pcHNlbCB8fCBCUjJfbWlwczY0IHx8IEJS
Ml9taXBzNjRlbAogCiBjb25maWcgQlIyX1BBQ0tBR0VfQlBGVE9PTAogCWJvb2wgImJwZnRvb2wi
CgotLSAKMi41NS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
