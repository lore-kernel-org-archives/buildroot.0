Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56307CC6B1A
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:48:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE9614056B;
	Tue, 13 Oct 2026 17:48:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xhw449Q4SIzB; Tue, 13 Oct 2026 17:48:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 894A6403AE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791913687;
	b=S04te6StUbT741Ss3vUQlLOsem5JEW9PlZKs6XIgWFQiJRZN9PJi2CtuHzAo0o3N632M
	 I7S6VxeOOFcukJFisfIhBuZu47risE5PWFixeUdcm8TEfiE3ijdQxBDwOwBrkws9bbmEM
	 kMTPq3LYiUt9ApTMgI4kQvQjBi3MiB0CXvpeG8o644wggtMajbU16cT9jSCB31ro6dUXM
	 7lHpzqYXR69PkKbCFoU8biFNAy3YIutXIEb/7xGI5MaPjDPbnKEl0pJNmKjRSvjA3Q2MH
	 3vLnFWUGsLukEQYCfXawY5KNOpF5zqapLN9prAjI27uuOL3r7vZxVhZFcQj02Qv4PXQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791913687;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Delivered-To:Received:X-Original-To:Received:Date:
	 MIME-Version:Message-Id:X-B4-Tracking:X-Change-ID:To:X-Mailer:
	 X-Last-TLS-Session-Version:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=EsF694Tlp5KUOgI54QL4eMVW0UTwU8wM4ta53ei9Bnc=;
	b=QCg46wwpWHunGirnU6JKUNCtNHY6pFZC0T35MHlnczsi7dVHHTQy/QRP1a0EGBJr7JnQ
	 D/kL6KkmZfmp5Y7/OUBzNcIYzbti7u9nrGh1g2pbELpfQoFjsWd6tNqLYR9HLpaVjpRQZ
	 PxP1B+W/TiSD1fPm98PJZCplJGa6G8MN/XmA19YHX9I81eEzzSbXN9/76h1Id7F/5idUb
	 OTp0DjD8DNpFgEYr8OIcYGOojkJmKUB9JmRf7WliyUgCBQNfM3yu+grAlNFxKnnRGbmVt
	 jxPXV4oQ2JCEOdyuZC1VQBJqAvcm72wNXwHOsCtwpi4WLLZMYJzZ747zmke6uaoO15w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791913687;
	bh=EsF694Tlp5KUOgI54QL4eMVW0UTwU8wM4ta53ei9Bnc=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=PNRivm5sZyafdK23zqUZZ9m4DnI6RyUHZ5DindfKi1qWZov2ZG3JwSwgGrjjdU/5g
	 2yp5iM8AkKfQFRwt+aKRd/KJZvU1Y9jjvYJK31GvzWHRlhfmLPtNw9gxw7MHvlFsJQ
	 M53Qq2I6qMDDsGEMprwdQhcPfi3tvToOXS9pssmdiS4tUFVsZDVlp4tBw9dWFbM2pn
	 rF8lefpzmMbWN2I+ToupbmA+o+enyN6buE9/ovZdMoVnqijULM161MHBucvuzmD6MC
	 qX+0gwASzyNVcIcoJUdeZu8E4FQq7fGzsH3xv7G78lgLEUovVOoyI6gQ6UOChIJEg5
	 Osuv8jFmHl0tQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 894A6403AE;
	Tue, 13 Oct 2026 17:48:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EA7975
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00586605E5
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:48:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gpezW60Xd_hx for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:48:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 68BE3605AC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791913684;
 b=Laqu1Uw/knfsLzOgTYx6muxUk8XxiBFxQFcLU5o5BpUN3vkqwGzNMnK6njmHD0X7EB7u
 xAUkJWimvJDrz+QrJC7r31Y6hkUlKvlerbemBk9ZgjDwWkDXps3/WlflvXDkvJSQ44sNh
 v1hq53hoyX69u4cyNPq1P0UrRnx5LMWXfGBhpStM7FVUyUhzRHLBY7T/RhtaAG2284KVT
 KVw4cRCwerTTnmhU1bUehPGQVJip9WhXsIr+06EO5uZkC+bEYsmkeBPwVcahUkx4frY3K
 mQ8HGY3Xwbv7GkdbY3KlXACxjxdu4FRnYcjvxwLFRPBiFxezgVoaDVhSXaGv/T9miYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791913684;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Delivered-To:
 Received:X-Original-To:Received:DKIM-Signature:From:Date:Subject:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Last-TLS-Session-Version:
 X-TUID:X-Last-TLS-Session-Version:X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=QA6i9gRpba/iZHojJ/pDHqxOW4qCqXOpEavXqlwMmBU=;
 b=lhGxWhZVXxO/5mHVl4UmUY8TW/t1F8VnmxBHiFxrwT16AUFBx8SCqsKPpoHhcnpB0Gpw
 fNZDBPeDSlWxazOuhBhdoZyXACRarZG4CGlSk8CeGJvOaIKdadV+nX7vi0AShTBKePoBO
 4+4kBXetoW9EnbS+TjG0+4s+zlK8MJyK6w6bw6tCaUF2cTNv5Qd18/pW9b5gPfV5JaXAC
 7GtN8bSd9OlVmOBvEzBkUnD+DVPD08hcMKpLi6x3OKXwWR5XC1ThGxBbSt8WkbtOo4Zhx
 /gxJqTLaDURCx2L2n/lfK6EGKsIOw7pQAzFdwuQ/Gl0Xx6VeM6GOar+uIwstqO2JGYw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=ZHBbi1r8; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="TX/eY8fo"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68BE3605AC
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:48:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 1379C4E4120F
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:48:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D60E460362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:48:00 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 2904E11D7183A; Tue, 13 Oct 2026 19:47:41 +0200 (CEST)
Received: from mail.galae.net ([172.22.1.253]) by 9e7fea892943 with LMTP
 id 0I92Lhk5zWrzOxQAtaWaaQ
 (envelope-from <alexis.lothore@bootlin.com>)
 for <alexis.lothore@bootlin.com>; Mon, 12 Oct 2026 21:46:33 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BBA4811D703F9; 
 Mon, 12 Oct 2026 21:46:27 +0200 (CEST)
Date: Mon, 12 Oct 2026 21:46:21 +0200
MIME-Version: 1.0
Message-Id: <20261012-bump_python_scp-v1-1-1cbf01f03cc3@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBG4avIrBtIAgrpVUqRGv/oFBpDRqVFv
 LupLr/FexsJMkPoXm2UsbLwFAvMrSI/vuIAxX0xWW0bo41V3fJJbfrN4xRb8UlZ1CG4HtDOUal
 SRuDveXw8L8vSveHn/4b2/QBxbkZecwAAAA==
X-Change-ID: 20261012-bump_python_scp-2e5ff9dee099
To: buildroot@buildroot.org
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-TUID: K54a7H0wBRle
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 2904E11D7183A
X-Spamd-Result: default: False [-5.50 / 30.00]; BAYES_HAM(-5.50)[99.99%];
 MIME_GOOD(-0.10)[text/plain]; RCVD_NO_TLS_LAST(0.10)[];
 FORWARDED(0.00)[alexis.lothore@bootlin.com];
 TAGGED_RCPT(0.00)[];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 MIME_TRACE(0.00)[0:+]; TO_DN_SOME(0.00)[]; BCC(0.00)[];
 DKIM_SIGNED(0.00)[bootlin.com:s=dkim]; ARC_NA(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; FROM_HAS_DN(0.00)[];
 NEURAL_HAM(-0.00)[-1.000]; TO_MATCH_ENVRCPT_SOME(0.00)[];
 RCVD_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[];
 PREVIOUSLY_DELIVERED(0.00)[alexis.lothore@bootlin.com];
 RECEIVED_HELO_LOCALHOST(0.00)[];
 URIBL_BLOCKED(0.00)[pypi.org:url,localhost:rdns,localhost:helo,pythonhosted.org:url,bootlin.com:mid,bootlin.com:email];
 FREEMAIL_CC(0.00)[bootlin.com,gmail.com,googlemail.com];
 RCPT_COUNT_FIVE(0.00)[5]
Subject: [Buildroot] [PATCH] package/python-scp: bump version to 0.16.2
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
From: =?utf-8?q?Alexis_Lothor=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2hhbmdlbG9nIGF2YWlsYWJsZSBhdApodHRwczovL2dpdGh1Yi5jb20vamJhcmRpbi9zY3AucHkv
Y29tbWl0LzIxMzA4Yjg5MTYwYzMxMTY0YmZlYmM5Yjc5YWVhNzEwZDQ5OTA3NjkKClNpZ25lZC1v
ZmYtYnk6IEFsZXhpcyBMb3Rob3LDqSA8YWxleGlzLmxvdGhvcmVAYm9vdGxpbi5jb20+Ci0tLQog
cGFja2FnZS9weXRob24tc2NwL3B5dGhvbi1zY3AuaGFzaCB8IDQgKystLQogcGFja2FnZS9weXRo
b24tc2NwL3B5dGhvbi1zY3AubWsgICB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9weXRob24tc2Nw
L3B5dGhvbi1zY3AuaGFzaCBiL3BhY2thZ2UvcHl0aG9uLXNjcC9weXRob24tc2NwLmhhc2gKaW5k
ZXggYTgyNDg3YWRiZDcxLi44ODM5MTYzY2JmNTcgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcHl0aG9u
LXNjcC9weXRob24tc2NwLmhhc2gKKysrIGIvcGFja2FnZS9weXRob24tc2NwL3B5dGhvbi1zY3Au
aGFzaApAQCAtMSw1ICsxLDUgQEAKICMgbWQ1LCBzaGEyNTYgZnJvbSBodHRwczovL3B5cGkub3Jn
L3B5cGkvc2NwL2pzb24KLW1kNSAgODU3Y2UyMTQ5NDg1ZWM1OTFkOGMxMDc2ZDhlNzQ1MTYgIHNj
cC0wLjE2LjEudGFyLmd6Ci1zaGEyNTYgIDNmMmIyNjBiZjliZDRjMmI2ODU3ZjY5N2ExZDdlOGVk
YzI2ZmE1NjkyODJiNzcwMjdlODQ5ZGZlMWU0ODU4MGEgIHNjcC0wLjE2LjEudGFyLmd6CittZDUg
IDAyNTU5OTQ1NzBjYjg0MjdlNGNjODQyMTg0YzRlMDM3ICBzY3AtMC4xNi4yLnRhci5negorc2hh
MjU2ICBkMDQ5ZjlhYTc3ZGI0MDQyYzQ0YjkyMmNlY2FiZTk3ZWYwNzE2ZmIzMzRhOTU3MDFkNjhk
MWM3OTkxNjg0ZmMyICBzY3AtMC4xNi4yLnRhci5negogIyBMb2NhbGx5IGNvbXB1dGVkIHNoYTI1
NiBjaGVja3N1bXMKIHNoYTI1NiAgMjQ1NWNmMGZjNzhlMTM3NzJiZjEwZWY1ZjIwOWU3ZWI4NjI1
NzA2ZDY3MWIyZjQyMGNjOGFkZDM3ZDU0OGMxYyAgTElDRU5TRS50eHQKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvcHl0aG9uLXNjcC9weXRob24tc2NwLm1rIGIvcGFja2FnZS9weXRob24tc2NwL3B5dGhv
bi1zY3AubWsKaW5kZXggYTIyMjRlNjU0ZThiLi44NjhlZWRkZjg1ODUgMTAwNjQ0Ci0tLSBhL3Bh
Y2thZ2UvcHl0aG9uLXNjcC9weXRob24tc2NwLm1rCisrKyBiL3BhY2thZ2UvcHl0aG9uLXNjcC9w
eXRob24tc2NwLm1rCkBAIC00LDkgKzQsOSBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
IAotUFlUSE9OX1NDUF9WRVJTSU9OID0gMC4xNi4xCitQWVRIT05fU0NQX1ZFUlNJT04gPSAwLjE2
LjIKIFBZVEhPTl9TQ1BfU09VUkNFID0gc2NwLSQoUFlUSE9OX1NDUF9WRVJTSU9OKS50YXIuZ3oK
LVBZVEhPTl9TQ1BfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVkLm9yZy9wYWNrYWdl
cy9mOC8zNS9mY2VmNDVkNTJkNzZhNmRjNzA3NzhjMTFlZWE3MTlmZjBhYjU1MDU5NGJjNTFlNTVl
NjZkMjhiNWY0MjQKK1BZVEhPTl9TQ1BfU0lURSA9IGh0dHBzOi8vZmlsZXMucHl0aG9uaG9zdGVk
Lm9yZy9wYWNrYWdlcy8zOC9jMy80ZDAyMzA2NjRiN2M1MDViYTJmYTdiZjlmZTRiZWU4M2Y2ZjFm
YTE5NWU4NjVhZDdmOTJiMTI5MTdlNTkKIFBZVEhPTl9TQ1BfU0VUVVBfVFlQRSA9IHNldHVwdG9v
bHMKIFBZVEhPTl9TQ1BfTElDRU5TRSA9IExHUEwtMi4xKwogUFlUSE9OX1NDUF9MSUNFTlNFX0ZJ
TEVTID0gTElDRU5TRS50eHQKCi0tLQpiYXNlLWNvbW1pdDogZTE3Y2ZjOWIzYjcyODA1OWQ5N2Y5
ZjhjNGQ4OTBiNDQ0NDEyNWQxZQpjaGFuZ2UtaWQ6IDIwMjYxMDEyLWJ1bXBfcHl0aG9uX3NjcC0y
ZTVmZjlkZWUwOTkKCkJlc3QgcmVnYXJkcywKLS0gIApBbGV4aXMgTG90aG9yw6kgPGFsZXhpcy5s
b3Rob3JlQGJvb3RsaW4uY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
