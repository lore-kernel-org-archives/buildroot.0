Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ACC5C27C79
	for <buildroot@archiver.kernel.org>; Thu, 20 Jun 2024 11:09:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEE6D434E5;
	Thu, 20 Jun 2024 11:09:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VjaNqjmuywUg; Thu, 20 Jun 2024 11:09:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81729434EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81729434EC;
	Thu, 20 Jun 2024 11:09:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 98F041BF425
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 11:09:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8543081254
 for <buildroot@lists.busybox.net>; Thu, 20 Jun 2024 11:09:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J0901RY4b20o for <buildroot@lists.busybox.net>;
 Thu, 20 Jun 2024 11:09:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=gero.schwaericke@grandcentrix.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 23D57811FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23D57811FD
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 23D57811FD
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 11:09:16 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a6f7b785a01so75923366b.1
 for <buildroot@buildroot.org>; Thu, 20 Jun 2024 04:09:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718881754; x=1719486554;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TGb+KdJ13j7bVxjQ9FBC1JC9LdRTdNjCTc04Z5H3M1w=;
 b=i3kgeyMvMMdsA7TSfkGJdJVDWNFchPekT6E6YAwgihBZOVUveySWiUdHb8tezfb3yS
 xlyiVC9EeafAPkogNPBvNzj+R9Y9Z2urqX71Jl7uLoyCWns5LTV7o9/ZYyg609bPJWXo
 r/vfC0NcxV+ZBIi0BKyPfuw2aJLKTi9bYs5s2xRT5O5gEh5gNr3rZuALDeqDlz8WNyyn
 F3Ax9C5xeuoyEe9QwknfV9neyeF+e16L65wlMMyeUhZ+sTJNAXZtdc+YRzjTazVdFieB
 xIgvY1ysybTVIfnyas1GMukkgEOcjojuQq20Awx8vHd46JO/c/GDouKENJswTkbooXjf
 VCiA==
X-Gm-Message-State: AOJu0Yx5gkI0mrGZ4fqV6ZWh36NbQHZhqbAQEe03/HzfFljyrIPNG4JR
 ljY1M0vmmP5wdUUhFbJ4AKExw6c9uD6sEzE/UeYOAr3b04jSewZ9MFzEEKPq5Ps/8p/FJ4ZNfs0
 okCsVyrImlPHxxYAtuGOWB7a7HO1O4nw5CwYcIiqwEo5wD/thKnEZRIQMDC+tgZRj9Q+7R3e8p2
 Oeg8tD+Ka/ZVJ+hZIe9lfF+rFhHcCa9m5Cesqgw9xGEM25JVc4BDHEkEx0
X-Google-Smtp-Source: AGHT+IGnWq6/47yyxU3pnhgF0dm1iSepiG7+Qxv6cGtZ2y3dAFBw7aWKZY3PCouZJyJlBSVCTgCfGg==
X-Received: by 2002:a17:907:d50f:b0:a6f:ab9c:7780 with SMTP id
 a640c23a62f3a-a6fab9c7951mr317000666b.31.1718881754216; 
 Thu, 20 Jun 2024 04:09:14 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8109:8abb:b200:db1c:afe7:dfe5:258d])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56ecdd63sm756615566b.124.2024.06.20.04.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 04:09:14 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 20 Jun 2024 13:08:19 +0200
Message-ID: <20240620110905.1205820-1-gero.schwaericke@grandcentrix.net>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grandcentrix.net; s=google; t=1718881754; x=1719486554; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TGb+KdJ13j7bVxjQ9FBC1JC9LdRTdNjCTc04Z5H3M1w=;
 b=u/e7UVQyVvQPkYgiaac+YOc9uKE44lYGer0uvLIGo90qvZX6hBrxcmybfP65uR++io
 fSItZhCPEYmWg3C0h8OERjvqy9R152iQgxH8Wp7Ro8Mzyj+CkSET7YiscEksNHxunMSw
 FwncsBEGXC08cW0ZgtlGmXRxKgiwwFyJRKSFgIN6OV00Nle1DMSdiPsykLYBfsysukRB
 W9nzrOoKRTd1bjpaFycLxH8C00dtk+bhlXn4WOvskfMjJq10Wn1WECBFaqwN2xDmrJi0
 +cnzkMUHqVVc16jRl3fZOBCJ6HVU9P1dcOhKFC118wrzu2RBg/xW/+aj+PTqelxdcAWH
 ypug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grandcentrix.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grandcentrix.net header.i=@grandcentrix.net
 header.a=rsa-sha256 header.s=google header.b=u/e7UVQy
Subject: [Buildroot] [PATCH 0/2] board/ti/am6{2, 4}x-sk: update custom hashes
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
From: =?utf-8?q?Gero_Schw=C3=A4ricke_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Gero=20Schw=C3=A4ricke?=
 <gero.schwaericke@grandcentrix.net>
Cc: =?UTF-8?q?Gero=20Schw=C3=A4ricke?= <gero.schwaericke@grandcentrix.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIGZvbGxvd2luZyB0d28gY29tbWl0cyBidW1wZWQgdGhlIHUtYm9vdCB2ZXJzaW9uLCBidXQg
bWlzc2VkIHVwZGF0aW5nCnRoZSBjdXN0b20gaGFzaGVzOgoKICBjYzI5MTBhN2RiIGNvbmZpZ3Mv
dGlfYW02Mnhfc2tfZGVmY29uZmlnOiB1cGRhdGUgVS1Cb290IHRvIHYyMDI0LjA0CiAgN2VmZDc1
ODY3YyBjb25maWdzL3RpX2FtNjR4X3NrX2RlZmNvbmZpZzogdXBkYXRlIFUtQm9vdCB0byB2MjAy
NC4wNAoKR2VuZXJhdGVkIHdpdGgKCiAgLi91dGlscy9hZGQtY3VzdG9tLWhhc2hlcwoKQnVpbGQg
c3VjY2VlZGVkIHNpbmNlIHUtYm9vdCBsYXRlc3QgaXMgY3VycmVubHkgYWxzbyB2MjAyNC4wNCwg
YnV0IHRoaXMKd2lsbCBicmVhayBpbiB0aGUgZnV0dXJlLgoKLS0KR2VybyBTY2h3w6RyaWNrZSAo
Mik6CiAgYm9hcmQvdGkvYW02Mngtc2s6IHVwZGF0ZSBjdXN0b20gaGFzaGVzCiAgYm9hcmQvdGkv
YW02NHgtc2s6IHVwZGF0ZSBjdXN0b20gaGFzaGVzCgogLi4uL3BhdGNoZXMvYXJtLXRydXN0ZWQt
ZmlybXdhcmUvYXJtLXRydXN0ZWQtZmlybXdhcmUuaGFzaCAgICB8IDIgKy0KIC4uLi90aS9hbTYy
eC1zay9wYXRjaGVzL3RpLWszLXI1LWxvYWRlci90aS1rMy1yNS1sb2FkZXIuaGFzaCAgfCA0ICsr
LS0KIGJvYXJkL3RpL2FtNjJ4LXNrL3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFzaCAgICAgICAgICAg
ICAgICAgICAgfCA0ICsrLS0KIC4uLi9wYXRjaGVzL2FybS10cnVzdGVkLWZpcm13YXJlL2FybS10
cnVzdGVkLWZpcm13YXJlLmhhc2ggICAgfCAyICstCiAuLi4vdGkvYW02NHgtc2svcGF0Y2hlcy90
aS1rMy1yNS1sb2FkZXIvdGktazMtcjUtbG9hZGVyLmhhc2ggIHwgMyArKy0KIGJvYXJkL3RpL2Ft
NjR4LXNrL3BhdGNoZXMvdWJvb3QvdWJvb3QuaGFzaCAgICAgICAgICAgICAgICAgICAgfCA0ICsr
LS0KIDYgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCi0t
IAoyLjQ1LjIKCgotLSAKCgoK4oCT4oCT4oCTCgoKZ3JhbmRjZW50cml4IEdtYkggfCBBIFZvZGFm
b25lIENvbXBhbnnCoMK3wqBIb2x6bWFya3QgMcKgwrfCoDUwNjc2IAoqQ29sb2duZSrCoHzCoFBo
b2VuaXhzZWVzdHJhc3NlIDE4wqDCt8KgNDQyNjMgKkRvcnRtdW5kKsKgwrfCoEdlcm1hbnkKfMKg
aW4gCjxodHRwczovL3d3dy5saW5rZWRpbi5jb20vY29tcGFueS9ncmFuZGNlbnRyaXg+IHwgcGhv
bmU6ICs0OS0yMjEtNjc3LTg2MC0wIAp8wqBlbWFpbDogaGVsbG9AZ3JhbmRjZW50cml4Lm5ldCA8
bWFpbHRvOmhlbGxvQGdyYW5kY2VudHJpeC5uZXQ+CgoKZ3JhbmRjZW50cml4IGNhcmVzIGFib3V0
wqBwcml2YWN5IAo8aHR0cHM6Ly9ncmFuZGNlbnRyaXgubmV0L2RlL3BhZ2VzL3ByaXZhY3ltYWls
Lz4KCkFtdHNnZXJpY2h0IEvDtmxuIHwgSFJCIMKgCjcwMTE5IHwgR2VzY2jDpGZ0c2bDvGhyZXI6
IE0uIEtyw7ZtZXIswqAgUi4gSMOkbmVsIHwgVVN0Li1JZE5yLjogREUyNjYzMzM5NjkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWls
aW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qu
b3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
