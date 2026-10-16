Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF9A3CCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96AE640787;
	Fri, 16 Oct 2026 15:03:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sBniDS2hA1kC; Fri, 16 Oct 2026 15:03:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C8D6740653
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792163024;
	b=eO3jHNpoj0ozoBa5WAiYWew8e3O6aiT7mn+CnORvxZhUvCd47uKnNIX6QdfAb/SWry4R
	 M+uUsc7Hr8SEc6cs50FrwyI1n18qze2lhulddlMU+JtHB9J43UNW5AJTHq2USVABvdFM6
	 j16ujqPe77ijS4XiFnKfEx0nGHy2/H4wSMLdV4OyDxilEnStwukl+cwh7QnrXYrBwbsnG
	 eL/ghL6znfVXUOlucjncMCvtCCzLwEJCJnRdrmQbb+JbpLORE0kOR0ZCbozdljSUMwXpJ
	 vMzf2tSefuyhD4yHpX9hl91woCXaMUI0jfF704D8SmDQqmODt6qV402Ba6JNe+djS5w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792163024;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Lz68R87UWXZv5b6W18yaZjO3VqK+zCwaWKJmRtilPgg=;
	b=I0RLugznUWHt4K+bW6YkjGfvbjO5bcOHMBNQC1MeHFZUatfj6sybBl5EzRByFQ2QEfk8
	 bfJZ3EwoOlmm/taUCvnfYl90MxA1DPYhWyKywgPuMoycC27G8WUyDlX1XQY8keKYy5AUZ
	 SLG7lb25S1uOIPMmefMLcYOWYwYm+ev9R1LmzguAgB5jZJG1gmiIg95CWWtwQtAQXGD/M
	 47hc/XmglYJdZrCiw3lxxbfo7pPQ+F+EKrXKJWE+hOXItLV78JCapFAgWAO00z8LPxa3x
	 5f75dqzuIh17UTg79LTmRyVRQBCqkXj6HGA1qn5ZZon0C7kKbYYN1KxHhL7v/azvcYQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792163024;
	bh=Lz68R87UWXZv5b6W18yaZjO3VqK+zCwaWKJmRtilPgg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=bpBfjJ4feq2tR3CNTgM2M6HiILPkHV11KOJwWpeEp9gzQW8ZUXQzTy8ImaPzU4cgh
	 YKbccdvQBqCwzQsj8uUmGIKMTtncHZ9//6G9ryySbSCYVU2mr07ddvjEr8KGdwoT6D
	 YX/k2yVRPjK2GAJgKq/d225EssRti5lW2fj+1w8yRlTseyIZV3YQt9C7Gn0+O1IK6n
	 sE+71+p/XMz6A/w58F9Wv1OCnlA69nbWAZqQmu1S3RQSpo6VK6QlXt204OWrsTzW/1
	 o99pRplFr/QUytSt6N1gTy9O4UAQkq31BHxcyhY45elQPnGimTvv9wPApdWv9DUTqe
	 g0BnLXCAwhqRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8D6740653;
	Fri, 16 Oct 2026 15:03:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E14DA255
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C63A960B27
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B61DNN6hUw69 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:03:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A4E7C60B21
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792163022;
 b=HmuBj2/owJWUGifqXEar3WHCBT7BAPybgPQeDylTd+VOY/y8slei3VLHfPSLRTauW05x
 pY9xUk10dRj1uIEQZWpAgmLlgA9QqAyiRvqcqX+Yc7ak6942ycWEpKBAu9cQ982cpZI+w
 bZMsia2hRpDGr7EVVpWqvXeq1aRVbWoZG8Gc8h2l9VGsCwrVlRXx34h6L1RgwxcY/01b/
 tXZgSxFZlrG3pV0ipNuc4Q5hsqB6lnOX3jOrDvZRRhoTqJXkknlCitimlTkeRrKzN5Ue9
 lNOa1UnjPa5BC6c0Ja3PhIvo55dLU1f5OBoBq/06N5exiX45FHm5VUHq02Ph60gtqOQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792163022;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Type:Content-Transfer-Encoding;
 bh=wStAs2JUw1/vcKS6ghNSuTt03HLDq++c+AmjnfxxHbg=;
 b=fbzylu0TOknwltgxfVB0kKGfq4/Pk9YEoZ8epNPaPA18/eXaiQB1PPBT43DkRVzILnmJ
 ORbALYAMWPeengNkVPgJK1Rb1+DQAkgx6C1fMK8dJUPbMmAdtvYbhkppHLhog0oMOg2T/
 tNRSzEZ9N7In/JOTFCMNXx/ELXCQ9GrNRCjkJsPgaeE+fj/8SUIDSFAuGKVLJ1Ssmw45o
 w6DTNl3Zmg5mei87OP5kkloM+eszPephB21tbGzrrBLwZNTEQ63Te1XRDvoYavj4FiMDc
 SKqcKZ57HHCRcufjXPF72y7B1eT/oBplQW66bru1nIYvIyLulYc4Wyi2YqJbfHd6pRA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=hUm8quTt; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A4E7C60B21
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:03:41 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4a1b07c3c5fso564095e9.1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:03:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792163020; x=1792767820;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=wStAs2JUw1/vcKS6ghNSuTt03HLDq++c+AmjnfxxHbg=;
 b=yy2C4oUMZ2CQ3wsGDBMl7xZoaAaQoGj81b5EQHiFTQGxsTjN0yIYYAhMlRxmCABysM
 aMjo6xFSk18S3b2KmIj66Q92qKNADua/U1FHi9qDxW9yvHaLGsCQrZ66L6Qg5It2LdZ4
 Aj64GmSeGC8tKxVLTINcvddhY+NExyHtLjLRWbSqO+bIeOJ813mNtjYfRPaetaRRNd9l
 WtQOKDOziujPT4dOYTJDR7wyydvM6HaoJvG5ka99obz3gmfXvg5jazwuK4O4csHXLgUt
 pDtNP2OFVec96JWwepv1eYYFuxju+vW9KBVR39mToQrZjGCjVSvPPxbLfJ4GkuJUX9bQ
 dkBA==
X-Gm-Message-State: AFq9FYI+Wh8bKKDE1X+8C062nEdwlz2bk1Vs5qKCb98iViuyMwAI2Hre
 EWqw/2AfyvKcmWtjNblhLsgQySiKfzyEqtZEBJC+q646kl6jCc4MuV7fJUmwPFoigvfaDKPIdEM
 gtaq+5SM=
X-Gm-Gg: AYBFou2jSPeOgQ7X8G5aclhyX3EDBIo5cHKnrIUoxNiB07nqOiz/u9aBJk0n3p79hFK
 7dtrPrAEjMuG2Nri2t6x9z0tXQVb5BTHLyHCqS4RFkZ1kPwCOlI1lhy7uS0SOiZVwdO8Sv/Clti
 tJWtNNu4a8JCDFFj75FuffhI7eVou5AFbikmGaukx0gBVgDxJ5rbKETb+TmuglMQM6r49JjilHr
 dczOuQpCxlRe7cK5hWsM6GzM6xtsjTd6T3VPToqX6REK1ComJGcBWt9nTeus5nloT+KfMBAjWYk
 a5WkvnUvhXjnuMcjmiMyS9kBPbS22dtuw6gsivKSbo1f7in4x+7xgRfaDF95UKXHkMTFVmau2UW
 P+usoHif8vcErhTw2HrdLWiLKZeo9oHYMx4pi1/NeTTsSfvMxXeOoPxJ5jTsMSxSS96E7nYnNiM
 Bh/cVK6pRT02R0EwXDiGMUDmuK/GypM+QbOFTpcLFEzpfKZUfpNQj5oqD1nYrvFpzaOh6spQZNh
 wn6fJrQwnULr/Olx/k5HUMbpzi+kZkDgxVk6OpaFg==
X-Received: by 2002:a05:600c:3e8d:b0:4a1:6916:798 with SMTP id
 5b1f17b1804b1-4a1d75fa219mr1724245e9.14.1792163019670; 
 Fri, 16 Oct 2026 08:03:39 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1c8ad6451sm64021275e9.4.2026.10.16.08.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:03:39 -0700 (PDT)
To: buildroot@buildroot.org,
	Alexander Shirokov <shirokovalexs@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:03:36 +0200
Message-ID: <20261016150338.66223-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260922131858.103751-1-shirokovalexs@gmail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [v2 1/1] package/nnn: add BR2_TOOLCHAIN_HAS_THREADS
 dependency
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gbm5uIGxpbmtzIGFnYWluc3QgcHRocmVhZC4gU3BlY2lmeSB0aGUgZGVw
ZW5kZW5jeSB0byBhdm9pZAo+IHVuZXhwZWN0ZWQgYnVpbGQgZmFpbHVyZXMgb24gdG9vbGNoYWlu
cyBsYWNraW5nIHRocmVhZCBzdXBwb3J0IChlLmcuCj4gYnItYXJtLWZ1bGwtbm90aHJlYWQpLgo+
IAo+IEZpeGVzOiA3ODU2ZTQxNjg1YTE3OWZkZGE3YjIxYTEwNDU1ZTUyZmU1ZmE1Y2IwICgicGFj
a2FnZS9ubm46IG5ldyBwYWNrYWdlIikKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgU2hpcm9r
b3YgPHNoaXJva292YWxleHNAZ21haWwuY29tPgoKQXBwbGllZCB0byAyMDI2LjA4LnguIFRoYW5r
cwoKPiAtLS0KPiAgcGFja2FnZS9ubm4vQ29uZmlnLmluIHwgNSArKystLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL25ubi9Db25maWcuaW4gYi9wYWNrYWdlL25ubi9Db25maWcuaW4KPiBpbmRleCA2NGNm
YThlMGE1Li41NTVhYjg2NGQ5IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvbm5uL0NvbmZpZy5pbgo+
ICsrKyBiL3BhY2thZ2Uvbm5uL0NvbmZpZy5pbgo+IEBAIC0xLDYgKzEsNyBAQAo+ICBjb25maWcg
QlIyX1BBQ0tBR0VfTk5OCj4gIAlib29sICJubm4iCj4gIAlkZXBlbmRzIG9uIEJSMl9VU0VfTU1V
ICMgZm9yawo+ICsJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTCj4gIAkjIEJ1
aWxkaW5nIG5ubiB3aXRob3V0IHdpZGVjaGFyL1VURiBzdXBwb3J0IGlzIHRoZW9yZXRpY2FsbHkK
PiAgCSMgcG9zc2libGUsIGJ1dCBpbiBwcmFjdGljZSBpdCBsZWFkcyB0byB1bnN0YWJsZSBidWls
ZHMuCj4gIAkjIFRoYXTigJlzIHdoeSB0aGUgV0NIQVIgZGVwZW5kZW5jeSBpcyBoZXJlLgo+IEBA
IC0xNSw2ICsxNiw2IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9OTk4KPiAgCj4gIAkgIGh0dHBzOi8v
Z2l0aHViLmNvbS9qYXJ1bi9ubm4KPiAgCj4gLWNvbW1lbnQgIm5ubiBuZWVkcyBhIHRvb2xjaGFp
biB3aXRoIHdjaGFyIgo+ICtjb21tZW50ICJubm4gbmVlZHMgYSB0b29sY2hhaW4gd2l0aCB3Y2hh
ciwgdGhyZWFkcyIKPiAgCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUgIyBmb3JrCj4gLQlkZXBlbmRz
IG9uICFCUjJfVVNFX1dDSEFSCj4gKwlkZXBlbmRzIG9uICFCUjJfVVNFX1dDSEFSIHx8ICFCUjJf
VE9PTENIQUlOX0hBU19USFJFQURTCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
