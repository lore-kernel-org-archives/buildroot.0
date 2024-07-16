Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9742EC3DA59
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 06:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48786403BD;
	Tue, 16 Jul 2024 06:46:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rD_CPNLqtL8f; Tue, 16 Jul 2024 06:46:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C36C9402E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C36C9402E5;
	Tue, 16 Jul 2024 06:46:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E5EE91BF20D
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 06:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E09E1608C6
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 06:46:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KSYZN8JixTk4 for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 06:46:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::f36; helo=mail-qv1-xf36.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 112C2605A1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 112C2605A1
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 112C2605A1
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 06:46:21 +0000 (UTC)
Received: by mail-qv1-xf36.google.com with SMTP id
 6a1803df08f44-6b5f90373d4so51903326d6.0
 for <buildroot@buildroot.org>; Mon, 15 Jul 2024 23:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721112381; x=1721717181;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/0MASWWSMdBqBoT8jlcaWH1gtv5Rgp0az+HANvqry70=;
 b=BvbpWjHjUAvkWf9WrForhatZt2Ny5rmb3dN7WfXrRoazTLmkT/xtBvcPlD4tQocoFG
 vTCSSi9/gZbm60v3oJCelAUO8HsB/tkHKe4fOXVeygigekMBhMhTwL6cQY3+vm4DIjWm
 n7udD2uxQ+tf+g1sT5Avm+pydESqgE5O6cdSq3YnxfU9aC/WNMQVcSesozNkckgWO5Ik
 nrsJvsTFz9ZWBGhgv75lXgSrj3Bp6POzroydA+YKLBpd33DyrEgedKEzC0i7FiwBN1X7
 XXUhL2FBxkTSRSZNYJuTzUKOLYuHzfzrM/niSMQRtHZcy7sd1c64sIhcH3GikSLPlTmM
 Yl+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFaHbFhePmONFyuHYZWj25kSX627pzno2fMQZYHDGEF0sUM+cTA4X+eNRCwdgsoo2yHbHJ0RUQ26OXskJrHbl3M6uMgJUO4Q==
X-Gm-Message-State: AOJu0YwbYoH8Dezj8rvWFCxLSf2IhpVIavSpqzZ5hT5LD5x17L14glmT
 jLkdLQenmuABxbpXbOdc/oLpKyBLOu2L5eJUtptN30YWTMGGSuYp
X-Google-Smtp-Source: AGHT+IEYtXUDbYiAjRlGoqVqNUCi96itIz3fQYy7G9h3T2IL9/yFQddiXlvCrgjAB7/5sc1IlsY9zw==
X-Received: by 2002:a05:6214:258a:b0:6b5:2be1:cd6e with SMTP id
 6a1803df08f44-6b780f7975bmr13349626d6.4.1721112380559; 
 Mon, 15 Jul 2024 23:46:20 -0700 (PDT)
Received: from localhost ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6b773a036afsm16815736d6.84.2024.07.15.23.46.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jul 2024 23:46:19 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 16 Jul 2024 08:46:17 +0200
Message-Id: <D2QRF2XRV54A.YI13SBIAUJMY@gmail.com>
To: "Athaariq Ardhiansyah" <foss@athaariq.my.id>, <buildroot@buildroot.org>
From: =?utf-8?q?Ga=C3=ABl_PORTAY?= <gael.portay@gmail.com>
X-Mailer: aerc 0.18.0-0-g5f8620445ed9
References: <20240715160941.90353-1-foss@athaariq.my.id>
In-Reply-To: <20240715160941.90353-1-foss@athaariq.my.id>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721112381; x=1721717181; darn=buildroot.org;
 h=in-reply-to:references:from:subject:cc:to:message-id:date
 :content-transfer-encoding:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/0MASWWSMdBqBoT8jlcaWH1gtv5Rgp0az+HANvqry70=;
 b=SLZF9fKZgiFV2g4Uqneo9lRInL0LGbg/MWpf2X9WHHpKx8aX0FQnaIjlToc/Q7UkBy
 kfWdJZtWCU9B6hcVh7Dv7bScS1DAsud1EQzbzjytj7RUAMPz+TPIUCj+Nj8Wkhix8Jv1
 7jN++2NRDqShGo2WWAzwBT+uxeHuaV1Wl5dIjmz1fUX/Bc2+VCbs3lHuqjKzQAtUWHpj
 7l2xZHVld3Mb3FCwtvA4HRcSLCQbDSkVAgIrJ6ElwnNN7OP3UEuviREyydbeQhLPBshP
 xwcKZjIESXIk+nDXKegGL0ehnQz2/SgifXLsiWP5mi5iRKGMV9J2Q5Lc9ukaKZ4/c+QP
 WHbQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SLZF9fKZ
Subject: Re: [Buildroot] [PATCH v5 1/3] package/rpi-firmware: bump version
 to 1.20240529
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQXRoYWFyaXEsCgpPbiBNb24gSnVsIDE1LCAyMDI0IGF0IDY6MDkgUE0gQ0VTVCwgQXRo
YWFyaXEgQXJkaGlhbnN5YWggd3JvdGU6Cj4gRFRCIEZpcm13YXJlIHN1cHBvcnQgZm9yIFJhc3Bi
ZXJyeSBQaSA1IHNpbmNlIDEuMjAyNDAzMDYgYW5kIHNldmVyYWwKPiBjcml0aWNhbCBidWcgZml4
ZXMgaW5jbHVkaW5nIFdpLUZpIGJyZWFrYWdlIG9uIEJDTTI3MTIgY2hpcC4KPgoKSSBhbSBzdGls
bCBhIGJpdCBwZXJwbGV4IGFib3V0IHRoZSBjb21taXQgbWVzc2FnZSA6LwoKQXMgaXQgd2FzIHNh
aWQsIEJSIGluc3RhbGxzIHRoZSBkdGJzIGZyb20gdGhlIGxpbnV4IGtlcm5lbCBwYWNrYWdlLCBh
bmQKdGh1cywgdGhlIGR0YnMgYXJlICoqTk9UKiogZnJvbSB0aGUgcnBpLWZpcm13YXJlIHBhY2th
Z2UsIHNvIEkgZ3Vlc3MgdGhlCmJ1bXAgd291bGQgbm90IGZpeCBhbnl0aGluZy4KClVubGVzcyB0
aGUgZml4ZXMgY29tZSBmcm9tIHRoZSBkdGIgb3ZlcmxheXMgeW91IGhhdmUgaW5zdGFsbGVkLiBC
dXQsIGlmCm5vdCwgSSB3b3VsZCBsZWF2ZSBpdCBibGFuaywgYmVjYXVzZSBpdCBjb3VsZCBiZSB3
cm9uZyBhbmQgY29uZnVzaW5nLgoKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ycGktZmlybXdhcmUv
cnBpLWZpcm13YXJlLm1rIGIvcGFja2FnZS9ycGktZmlybXdhcmUvcnBpLWZpcm13YXJlLm1rCj4g
aW5kZXggN2FlOWZmNmMyOC4uODEwNjZmMGZjMCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3JwaS1m
aXJtd2FyZS9ycGktZmlybXdhcmUubWsKPiArKysgYi9wYWNrYWdlL3JwaS1maXJtd2FyZS9ycGkt
ZmlybXdhcmUubWsKPiBAQCAtNCw3ICs0LDcgQEAKPiAgIwo+ICAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwo+ICAKCkFzIHJlcXVlc3RlZCBieSBUaG9tYXMsIHlvdSBjYW4gYWRkIHRoZSBmb2xsb3dp
bmcgY29tbWVudDoKCgkjIFBsZWFzZSBrZWVwIGluIHN5bmMgd2l0aCBjb25maWdzL3Jhc3BiZXJy
eXBpKl9kZWNvbmZpZwoKPiAtUlBJX0ZJUk1XQVJFX1ZFUlNJT04gPSA1NDc2NzIwZDUyY2Y1Nzlk
YzE2Mjc3MTUyNjJiMzBiYTEyNDI1MjVlCj4gK1JQSV9GSVJNV0FSRV9WRVJTSU9OID0gMS4yMDI0
MDUyOQo+ICBSUElfRklSTVdBUkVfU0lURSA9ICQoY2FsbCBnaXRodWIscmFzcGJlcnJ5cGksZmly
bXdhcmUsJChSUElfRklSTVdBUkVfVkVSU0lPTikpCj4gIFJQSV9GSVJNV0FSRV9MSUNFTlNFID0g
QlNELTMtQ2xhdXNlCj4gIFJQSV9GSVJNV0FSRV9MSUNFTlNFX0ZJTEVTID0gYm9vdC9MSUNFTkNF
LmJyb2FkY29tCgpSZWdhcmRzLApHYcOrbApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
