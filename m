Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F23C3DA49
	for <buildroot@archiver.kernel.org>; Thu, 25 Jul 2024 15:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 711F860674;
	Thu, 25 Jul 2024 15:38:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fvgh212-98M0; Thu, 25 Jul 2024 15:38:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F3A860A9A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F3A860A9A;
	Thu, 25 Jul 2024 15:38:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F2CE31BF357
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 15:38:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1CD8409B2
 for <buildroot@lists.busybox.net>; Thu, 25 Jul 2024 15:38:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4IS6CEhH4MsF for <buildroot@lists.busybox.net>;
 Thu, 25 Jul 2024 15:38:00 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com;
 envelope-from=flavio.tapajos@newtesc.com.br; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0DEB740731
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DEB740731
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0DEB740731
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 15:37:59 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2cd48ad7f0dso892471a91.0
 for <buildroot@buildroot.org>; Thu, 25 Jul 2024 08:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721921879; x=1722526679;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oBKbVAe9Ft+SRdWsS89ERY2uYbdLWFAaiFmz0NB9jqI=;
 b=kOEHA+H/+JdavbHA22cUmPVJyRar0qGWFoLOrmKXUhfwR/Oh4Ghmc/06/IaOQTV3gM
 sf50IT9SlhEENit96arDWskkguYAnt0yOLwkcomSTCzns6hWd9euz7eAtX84TFAtmbaR
 aJ1wH3QW2dVxSsQAq3r+Sbiim5QTIkhCPCB7Honj9Mt7OWaQ/DV2I/LcCX7Z1yMFcDET
 5uzHS+XL/06eUvrSQ5vWiAl0W6sVm4equhDozoQ7p9ZB2/UTAGXhxW8EfWb3wDOYzBf0
 GZfMrUUO5vrb35cZkOXF34NgcKlJVsmNABc3GY4TPA3BvKnePtqpF/kZgwzp+l8iXfWi
 EB9Q==
X-Gm-Message-State: AOJu0Yyg4KCrJk0ZOtzAkgvYdJIBQwHOrXvym9YGxpmT8Uop4AvWHLk+
 jLTQKr8VcyUBNPn1yVN6J5PzZzQD5lEjCmlZpUY06yuyT/mLkB87Q8QPhwyD/oZkoYnvk6XzdTd
 H
X-Google-Smtp-Source: AGHT+IGvxA18cExJd2l4NwcUwqnEPG7bMH4RH8JMXNcvdOeJ22hPWW8kTqGvt4zxL/Ro3zz9CM+vSQ==
X-Received: by 2002:a17:90a:5e4e:b0:2c9:1012:b323 with SMTP id
 98e67ed59e1d1-2cf2eb6afb5mr2696180a91.27.1721921878989; 
 Thu, 25 Jul 2024 08:37:58 -0700 (PDT)
Received: from niltesque.newtesc.com.br ([187.120.6.114])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2cf28c9c764sm1703749a91.26.2024.07.25.08.37.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jul 2024 08:37:58 -0700 (PDT)
From: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>
To: buildroot@buildroot.org
Date: Thu, 25 Jul 2024 12:37:40 -0300
Message-ID: <20240725153743.101494-1-flavio.tapajos@newtesc.com.br>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=newtesc-com-br.20230601.gappssmtp.com; s=20230601; t=1721921879; x=1722526679;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oBKbVAe9Ft+SRdWsS89ERY2uYbdLWFAaiFmz0NB9jqI=;
 b=YzaFYIhVgritC1CjYelPi57QwTcDfZQ6wxqviCnRj9Nc+JF41buufNDJDPgwuf95cv
 4T2KjgTZ/HbjmtsMcShtLiz5MZJpV/O6ORx9KdnKYHdLQSCTtUxKwVc27GxxiGOHzHAc
 7AgG0djLhKVzyJJ0s4C3G5dc5kkLtfy4rcjcf+nva2T1ekqHaMsE2kmJHQ1FZafWU4if
 +zWGhBgVyOO5U1mAuFutS/JRBs8+vr1hHqpIdbT2uSpv8MJaW4HzPzrQWJ8qBnmUSGH6
 E2wKUiMtd0X4nLQ2NZfIh6IjutcXMz/UCNye/wn392lDKrt84WNgpweLR0YYZwxv6/5t
 7YNA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=newtesc.com.br
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=newtesc-com-br.20230601.gappssmtp.com
 header.i=@newtesc-com-br.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=YzaFYIhV
Subject: [Buildroot] [PATCH 1/3] Revert "rsyslog: not available on musl"
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Konstantin Menyaev <KAMenyaev@salutedevices.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogS29uc3RhbnRpbiBNZW55YWV2IDxLQU1lbnlhZXZAc2FsdXRlZGV2aWNlcy5jb20+CgpU
aGlzIHJldmVydHMgY29tbWl0IGNlYTgxYjY5MjVkZTE2NmUyZmQyYzc1YTUxYWVhOTQ0MjBmN2Yw
NmEuCgpyc3lzbG9nIG5vdyBidWlsZHMgc3VjY2Vzc2Z1bGx5IHdpdGggbXVzbAoKU2lnbmVkLW9m
Zi1ieTogS29uc3RhbnRpbiBNZW55YWV2IDxLQU1lbnlhZXZAc2FsdXRlZGV2aWNlcy5jb20+ClNp
Z25lZC1vZmYtYnk6IEZsw6F2aW8gVGFwYWrDs3MgPGZsYXZpby50YXBham9zQG5ld3Rlc2MuY29t
LmJyPgotLS0KIHBhY2thZ2UvcnN5c2xvZy9Db25maWcuaW4gfCA2ICsrLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNr
YWdlL3JzeXNsb2cvQ29uZmlnLmluIGIvcGFja2FnZS9yc3lzbG9nL0NvbmZpZy5pbgppbmRleCAz
YmEzMjYxOTFhLi5kOWU4YjFhYjZmIDEwMDY0NAotLS0gYS9wYWNrYWdlL3JzeXNsb2cvQ29uZmln
LmluCisrKyBiL3BhY2thZ2UvcnN5c2xvZy9Db25maWcuaW4KQEAgLTMsNyArMyw2IEBAIGNvbmZp
ZyBCUjJfUEFDS0FHRV9SU1lTTE9HCiAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJF
QURTCiAJZGVwZW5kcyBvbiBCUjJfVVNFX01NVSAjIGZvcmsoKQogCWRlcGVuZHMgb24gIUJSMl9T
VEFUSUNfTElCUyAjIG1vZHVsZXMKLQlkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX1VTRVNfTVVT
TCAjIEdMT0JfQlJBQ0UKIAkjIFByb3BhZ2F0ZSB0aGUgZXhhY3Qgc2FtZSBkZXBlbmRlbmN5IGZy
b20gbGliZmFzdGpzb24sCiAJIyBldmVuIHRob3VnaCByc3lzbG9nIGFscmVhZHkgZGVwZW5kcyBv
biB0aHJlYWRzIGZvciBpdHNlbGY6CiAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19TWU5D
XzQgfHwgQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEUwpAQCAtMTgsOSArMTcsOCBAQCBjb25maWcg
QlIyX1BBQ0tBR0VfUlNZU0xPRwogCiAJICBodHRwOi8vd3d3LnJzeXNsb2cuY29tCiAKLWNvbW1l
bnQgInJzeXNsb2cgbmVlZHMgYSB1Q2xpYmMgb3IgZ2xpYmMgdG9vbGNoYWluIHcvIHRocmVhZHMs
IGR5bmFtaWMgbGlicmFyeSIKK2NvbW1lbnQgInJzeXNsb2cgbmVlZHMgYSB0b29sY2hhaW4gdy8g
dGhyZWFkcywgZHluYW1pYyBsaWJyYXJ5IgogCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUKIAlkZXBl
bmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1NZTkNfNAotCWRlcGVuZHMgb24gIUJSMl9UT09MQ0hB
SU5fSEFTX1RIUkVBRFMgfHwgQlIyX1NUQVRJQ19MSUJTIFwKLQkJfHwgQlIyX1RPT0xDSEFJTl9V
U0VTX01VU0wKKwlkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX0hBU19USFJFQURTIHx8IEJSMl9T
VEFUSUNfTElCUwogCWRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfQlVTWUJPWF9TSE9XX09USEVSUwot
LSAKMi40NS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
