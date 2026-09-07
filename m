Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C30C8C79FA0
	for <buildroot@archiver.kernel.org>; Mon,  7 Sep 2026 13:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50A524055E;
	Mon,  7 Sep 2026 13:48:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kzc7ajEbhaaT; Mon,  7 Sep 2026 13:47:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 1B99C4052F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788788878;
	b=Xwz9y69/RP2a+rig/9d/J6eSyE0vqzxgYcSleBBDD/GmcUUqgyj27wc7ato6U8V2UhZk
	 f/cCr28KEhsDs+csxAA1BVDJeUziG6gI2u3Ow12SZJtuu6f6Pz8J51YRk5m58W/KQW5Xc
	 AQFJFLv3gPc4tNh7bt2vG/loy/UUdpB5mh7tOdYMpW9Rgu9m7N883Sjk4/jkSZ5xVH0ld
	 Yg66+FVRvLVt+Ug3k0f/bJbG8eCCFN5sBtsClshpwjPKdio07WvGpo5P/4ZiNlZq/ojFZ
	 Re1NZoe5XVe57NbS4DT8E/rKnIBdcjv7vW8OFofYSIgUTXmA228HNrqaiV3Z63oePHw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788788878;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:X-Mailer:X-Last-TLS-Session-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=OVrRzeJxtBz0/wbKxeRX5Hu1bDrVnfpkM+yWMli9MPI=;
	b=qMiyKb4ZgW8SWQSTEeAnE05AuSAJNvFoU1pbk529bJ7VzLDLdRB7jx4yEjRZ9dr1JNSQ
	 O8aWdGyZtdNluknyN6g7AAX45UUMY0lvHI1QwRXsF72K/2mRYlmVmnsJ4SD1NLDp9lRtm
	 qWKZ57SN9CxXRAiSeVq7wxhiQUYUrtxcvJzXApgvkX5M8gnfg0kp9PfdZ8EzC0FcYPF95
	 OgiG88PT9PDgk8wxc/ErjjTn1AQ8NwN9PXZmEzfQDxx6+Gzu63oK1t2Q6t/rpvME4G/0G
	 FwQ1TS+q7YBiM2kbfuOjCIYH9gXKBiS8u70I+Q3qL4lLraUlx88DrNf2nfFEql0YbUg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788788878;
	bh=OVrRzeJxtBz0/wbKxeRX5Hu1bDrVnfpkM+yWMli9MPI=;
	h=Date:References:In-Reply-To:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cP1x/6i3T8OZZ8wqBjoAAOIvK3666/V9PK9XHAFkiK634zfa2ofC8xP8LFx/UrwFx
	 czsLJr15mIw9fd8J4Q4iCsvVgjZbhI8gJQSc0+bK0aQ355UmzvC8CjdunRAU1gEoRJ
	 2X3juvAdQGRTwI9iYiPuAeMjQBJcFiY5XDotwaYPsnVOJ2pvNUXUzs45oltsvZmyCd
	 wPCvY5Aik5H/EcvSvQHim58POWRJy5A1ac1Daa3Av5iShVy4wzeV8cD8/fNnHjWWPL
	 J7Ac37hwM2hhR5IKaBMQX2ohMJdFoSxAq/5xCXrEiBBuhyA7M0rmGlaFRn5PeFzFYo
	 seDNEWY6G41Nw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B99C4052F;
	Mon,  7 Sep 2026 13:47:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AF7F5A48
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 13:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A16146065C
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 13:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oAO7mG7GkCvA for <buildroot@buildroot.org>;
 Mon,  7 Sep 2026 13:47:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 7530C6064F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788788872;
 b=aBNOLQOYKPrC3UcFmFFxhb7Xn8volYO0kxMMH1Rt1xnrSwhr+SjbqDAIFpuMIfskDHtj
 lTYC5BXdZIxeZwSdvuIEtAUA58T9dnZgpNGrnkGYUc5KCPQ7hmwHbVwAXhVEBfS9W083b
 7eXYGV+nSbFnpCncTnriaUfvxsyFOvePG/XMeIw8O1GR7msJOUFj7jleeI2pSH4fmIdYm
 lBEcUpvyns1f7+YbWpB3bf3PRCnxK9L3NYwRSUsW+/AKUpkB4A6nEMc3RwFhjIASPpc9g
 6bTZHmwSZuchTGoQ2vY+WZ3JwtzkDsnrj2zVntiOSQFwjYQVw7x8Tfxf8iZGZLfz0QA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788788872;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:Date:
 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
 X-Last-TLS-Session-Version;
 bh=Fq/FLv4cB9DhNqQAF0n0729fJ8U1r9o14xseb9V4U+E=;
 b=YYuLc7DKzXWoPBUBxyHuhE1FsIJ3wXSP+lb40eGhRPcWy365e/hlH1bOUC+jGambFPrf
 dcnGg1nJWvOUUn0KvTOuoJX1YfHZ3FgebDFh8N7cK6waCzN4GRN+5HgsviwPG9UkWVCGM
 aGB/h/8EH1cBJOzkoJ4CpG5Uc/6O8KBSUh19lAHLN/bb8N0J2ArInHZIw7G1ouZrx+SiL
 g28g1gYx9LoqAXyKALIq+OMho33ZO+GGRDCV2+yy9g68Hcqz7HA+lYUERVk5Jc098Mqee
 zAUgp0kn81OppXhvsyLcJ6hl9GM5SN65gYPikpMCq1fxHXqEu436g+hfXS3ji93bmEw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=EJzqmpsT; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=alexis.lothore@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7530C6064F
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 13:47:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 00DFE1A1A3C
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 13:47:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CB82460383
 for <buildroot@buildroot.org>; Mon,  7 Sep 2026 13:47:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 5530011C7AF1F; 
 Mon,  7 Sep 2026 15:47:49 +0200 (CEST)
Date: Mon, 07 Sep 2026 15:47:37 +0200
MIME-Version: 1.0
Message-Id: <20260907-fix_openscap-v2-2-28f8f6ee3248@bootlin.com>
References: <20260907-fix_openscap-v2-0-28f8f6ee3248@bootlin.com>
In-Reply-To: <20260907-fix_openscap-v2-0-28f8f6ee3248@bootlin.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH v2 2/2] support/testing: add tests for openscap
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWRkIGJhc2ljIHRlc3RzIGZvciBvcGVuc2NhcCwgZW5zdXJpbmcgdGhhdCBpdCBidWlsZHMgYW5k
IHJ1bnMgYSBtaW5pbWFsCmNvbW1hbmQgd2l0aCBkaWZmZXJlbnQgY3J5cHRvZ3JhcGhpYyBiYWNr
ZW5kczoKLSBsaWJnY3J5cHQKLSBsaWJuc3MKLSBubyBjcnlwdG8gYmFja2VuZAoKU2lnbmVkLW9m
Zi1ieTogQWxleGlzIExvdGhvcsOpIDxhbGV4aXMubG90aG9yZUBib290bGluLmNvbT4KLS0tCiBz
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X29wZW5zY2FwLnB5ICAgICB8IDYzICsr
KysrKysrKysrKysrKysrKysrKysKIC4uLi9yb290ZnMtb3ZlcmxheS9yb290L2JlbmNobWFyay54
bWwgICAgICAgICAgICAgIHwgIDUgKysKIDIgZmlsZXMgY2hhbmdlZCwgNjggaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rfb3BlbnNj
YXAucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X29wZW5zY2FwLnB5Cm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uMDg1MjdkMjhhYTRkCi0tLSAv
ZGV2L251bGwKKysrIGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9vcGVuc2Nh
cC5weQpAQCAtMCwwICsxLDYzIEBACitpbXBvcnQgb3MKKworaW1wb3J0IGluZnJhLmJhc2V0ZXN0
CisKKworY2xhc3MgVGVzdE9wZW5TQ0FQQmFzZShpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgorICAg
IGNvbmZpZyA9ICIiIgorICAgICAgICBCUjJfYXJtPXkKKyAgICAgICAgQlIyX2NvcnRleF9hOD15
CisgICAgICAgIEJSMl9BUk1fRUFCSUhGPXkKKyAgICAgICAgQlIyX1RPT0xDSEFJTl9FWFRFUk5B
TD15CisgICAgICAgIEJSMl9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTj15CisgICAgICAgIEJS
Ml9UT09MQ0hBSU5fRVhURVJOQUxfQk9PVExJTl9BUk1WN19FQUJJSEZfR0xJQkNfU1RBQkxFPXkK
KyAgICAgICAgQlIyX1BBQ0tBR0VfT1BFTlNDQVA9eQorICAgICAgICBCUjJfUk9PVEZTX09WRVJM
QVk9Int9IgorICAgICAgICBCUjJfVEFSR0VUX1JPT1RGU19DUElPPXkKKyAgICAgICAgIyBCUjJf
VEFSR0VUX1JPT1RGU19UQVIgaXMgbm90IHNldAorICAgICAgICAiIiIuZm9ybWF0KAorICAgICAg
ICAgICAgICAgIGluZnJhLmZpbGVwYXRoKCJ0ZXN0cy9wYWNrYWdlL3Rlc3Rfb3BlbnNjYXAvcm9v
dGZzLW92ZXJsYXkiKSkKKworICAgIGRlZiB0ZXN0X3J1bihzZWxmKToKKyAgICAgICAgY3Bpb19m
aWxlID0gb3MucGF0aC5qb2luKHNlbGYuYnVpbGRkaXIsICJpbWFnZXMiLCAicm9vdGZzLmNwaW8i
KQorICAgICAgICBzZWxmLmVtdWxhdG9yLmJvb3QoCisgICAgICAgICAgICBhcmNoPSJhcm12NyIs
CisgICAgICAgICAgICBrZXJuZWw9ImJ1aWx0aW4iLAorICAgICAgICAgICAgb3B0aW9ucz1bIi1t
IiwgIjUxMk0iLCAiLWluaXRyZCIsIGNwaW9fZmlsZV0sCisgICAgICAgICkKKyAgICAgICAgc2Vs
Zi5lbXVsYXRvci5sb2dpbigpCisKKyAgICAgICAgb3V0LCByZXQgPSBzZWxmLmVtdWxhdG9yLnJ1
bigib3NjYXAgLS12ZXJzaW9uIikKKyAgICAgICAgc2VsZi5hc3NlcnRFcXVhbChyZXQsIDApCisK
KyAgICAgICAgb3V0LCByZXQgPSBzZWxmLmVtdWxhdG9yLnJ1bigib3NjYXAgaW5mbyAvcm9vdC9i
ZW5jaG1hcmsueG1sIikKKyAgICAgICAgc2VsZi5hc3NlcnRFcXVhbChyZXQsIDApCisgICAgICAg
IHNlbGYuYXNzZXJ0SW4oIkRvY3VtZW50IHR5cGU6IFhDQ0RGIENoZWNrbGlzdCIsICJcbiIuam9p
bihvdXQpKQorCisKK2NsYXNzIFRlc3RPcGVuU0NBUEdjcnlwdChUZXN0T3BlblNDQVBCYXNlKToK
KyAgICAiIiJUZXN0IG9wZW5zY2FwIHVzaW5nIHRoZSBnY3J5cHQgY3J5cHRvIGJhY2tlbmQuIiIi
CisKKyAgICBjb25maWcgPSAoCisgICAgICAgIFRlc3RPcGVuU0NBUEJhc2UuY29uZmlnCisgICAg
ICAgICsgIiIiCisgICAgICAgIEJSMl9QQUNLQUdFX0xJQkdDUllQVD15CisgICAgICAgICIiIgor
ICAgICkKKworCitjbGFzcyBUZXN0T3BlblNDQVBOc3MoVGVzdE9wZW5TQ0FQQmFzZSk6CisgICAg
IiIiVGVzdCBvcGVuc2NhcCB1c2luZyB0aGUgbnNzIGNyeXB0byBiYWNrZW5kLiIiIgorCisgICAg
Y29uZmlnID0gKAorICAgICAgICBUZXN0T3BlblNDQVBCYXNlLmNvbmZpZworICAgICAgICArICIi
IgorICAgICAgICBCUjJfUEFDS0FHRV9MSUJOU1M9eQorICAgICAgICAiIiIKKyAgICApCisKKwor
Y2xhc3MgVGVzdE9wZW5TQ0FQTm9DcnlwdG8oVGVzdE9wZW5TQ0FQQmFzZSk6CisgICAgIiIiVGVz
dCBvcGVuc2NhcCB3aXRob3V0IGFueSBjcnlwdG8gYmFja2VuZC4iIiIKKworICAgIGNvbmZpZyA9
IFRlc3RPcGVuU0NBUEJhc2UuY29uZmlnCmRpZmYgLS1naXQgYS9zdXBwb3J0L3Rlc3RpbmcvdGVz
dHMvcGFja2FnZS90ZXN0X29wZW5zY2FwL3Jvb3Rmcy1vdmVybGF5L3Jvb3QvYmVuY2htYXJrLnht
bCBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3Rfb3BlbnNjYXAvcm9vdGZzLW92
ZXJsYXkvcm9vdC9iZW5jaG1hcmsueG1sCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAwMC4uYWFjMGYxZTBmYTlhCi0tLSAvZGV2L251bGwKKysrIGIvc3VwcG9ydC90ZXN0aW5n
L3Rlc3RzL3BhY2thZ2UvdGVzdF9vcGVuc2NhcC9yb290ZnMtb3ZlcmxheS9yb290L2JlbmNobWFy
ay54bWwKQEAgLTAsMCArMSw1IEBACis8P3htbCB2ZXJzaW9uPSIxLjAiIGVuY29kaW5nPSJVVEYt
OCI/PgorPHhjY2RmOkJlbmNobWFyayB4bWxuczp4Y2NkZj0iaHR0cDovL2NoZWNrbGlzdHMubmlz
dC5nb3YveGNjZGYvMS4yIiBpZD0ieGNjZGZfb3JnLmJ1aWxkcm9vdC5iZW5jaG1hcmsiPgorICA8
eGNjZGY6c3RhdHVzPmFjY2VwdGVkPC94Y2NkZjpzdGF0dXM+CisgIDx4Y2NkZjp2ZXJzaW9uPjEu
MDwveGNjZGY6dmVyc2lvbj4KKzwveGNjZGY6QmVuY2htYXJrPgoKLS0gCjIuNTUuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
