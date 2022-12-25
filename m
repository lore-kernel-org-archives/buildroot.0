Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD85AC4167B
	for <buildroot@archiver.kernel.org>; Sun, 25 Dec 2022 22:08:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5917560A92;
	Sun, 25 Dec 2022 22:08:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5917560A92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EucxRvIr9E44; Sun, 25 Dec 2022 22:08:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FBFA60A79;
	Sun, 25 Dec 2022 22:08:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FBFA60A79
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CDBAA1BF381
 for <buildroot@lists.busybox.net>; Sun, 25 Dec 2022 22:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8D0360A79
 for <buildroot@lists.busybox.net>; Sun, 25 Dec 2022 22:08:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8D0360A79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kayx8uv9xt-r for <buildroot@lists.busybox.net>;
 Sun, 25 Dec 2022 22:08:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7887B607F4
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7887B607F4
 for <buildroot@buildroot.org>; Sun, 25 Dec 2022 22:08:25 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t15so50228wro.9
 for <buildroot@buildroot.org>; Sun, 25 Dec 2022 14:08:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=54wokudEuxhXuv8kyu8aqWZqCDxFv855X063D8auoik=;
 b=fkX4SkNChdQjsGgb68jLXsLJ9wYk5gDzMAh6xT4+Fuhc6t5UAVAH0kTTRYwwgZqfng
 ouYsNQ4HvPHWyyzSWR5CvedZf8VmndAXoX2rsOlW80EykMEoTrV/AgdAhYAo7gJRJEgu
 1w761OeHeaRMUhT0a9CL+jujoGVNIxZMMDttt8EbmY/hdbFPFUoR+8KDStSxKGQmc3RS
 gPfyd9oijK2WqI6ClVbHm4u1ckZtToNneJ7Q/b9EL1g8ZxP4qtX7evffyUAeh3RRdywT
 TsFJRiisjTvH+bAT51kzCLUZ9IO3rTA6x5gUiq6omUcyCSLy6IGNp7HdbPU+AZ0+jW3m
 EFRA==
X-Gm-Message-State: AFqh2koGRwSOsiy829sPFxcnsgbN2wsZSJDqoJr4ZODzyLf7Vl2pF1jh
 sktN27XcCFaDxQ6/1dxgXXC6SRlWutY=
X-Google-Smtp-Source: AMrXdXtFwv5cqnNMNQfN+CXVFP25vcmj8A3FQ07ChQkLh8MlfX80PlqKqgkKw9PoAn/19McyJieC/g==
X-Received: by 2002:adf:aada:0:b0:26f:596b:1fb8 with SMTP id
 i26-20020adfaada000000b0026f596b1fb8mr10358214wrc.44.1672006103425; 
 Sun, 25 Dec 2022 14:08:23 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:bc00:ef48:c4a5:90b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a5d490f000000b00236883f2f5csm8622257wrq.94.2022.12.25.14.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Dec 2022 14:08:23 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 25 Dec 2022 23:08:22 +0100
Message-Id: <cover.1672006091.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=54wokudEuxhXuv8kyu8aqWZqCDxFv855X063D8auoik=;
 b=oruq2Nnk0RFWN1Zmkvhxy74b9ArHeMXqEc0VnlJp9SpsaiIPnQuj3+KJ4GIxWOdyyf
 ygArZq91EuivOcZtWktK7yx63ZBUsoQVI3kuaO1D+Cp+VfG4P//ILLIOPPH3AiImHHhA
 se96jCBNRqecOGTWDGGaycJdlyyfr0Q+vRyUCo3/vOSFckAEXKsaY4sGO6JGi1bBUe4i
 O5nGcVrQ3bLz9ROIlqqKOQ4sipdj2R/YnVqaR6Uv6eQeR0LYWkCStj3+kbt6AnB3drkS
 umPXHVO7mMY5UDw1DghraBQTyirdAiyD+pjUaw/iD2jvwAijdTT+AID4FVBS48fbnCg8
 7eQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=oruq2Nnk
Subject: [Buildroot] [PATCH 0/3 v4] system: add option to handle /var as an
 overlayfs with r/o rootfs (branch yem/systemdify-var)
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
Cc: =?UTF-8?q?Je=CC=81re=CC=81my=20Rosen?= <jeremy.rosen@smile.fr>,
 "Yann E . MORIN" <yann.morin@orange.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Norbert Lange <nolange79@gmail.com>, Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQWxsIQoKVGhpcyB0aHJlZS1wYXRjaCBzZXJpZXMgaW50cm9kdWNlcyBhbiBhbHRlcm5h
dGUgb3B0aW9uIHRvIGhhbmRsZSAvdmFyIGFzCmFuIG92ZXJsYXlmcywgd2hlbiB1c2luZyBhIHJl
YWQtb25seSByb290ZnMgd2l0aCBzeXN0ZW1kLgoKVGhlIHJhdGlvbmFsZSBiZWhpbmQgd2FudGlu
ZyB0byB1c2UgYW4gb3ZlcmxheWZzIHJhdGhlciB0aGFuIHRoZSBmYWN0b3J5CndlIHVzZWQgdG8g
Y3JlYXRlIHNvIGZhciwgaXMgdGhhdCBpbiBzb21lIGNvcm5lci1jYXNlcywgdGhlIGZhY3Rvcnkg
ZG9lcwpub3Qgd29yaywgYW5kIGNhbid0IGVhc2lseSBiZSBmaXhlZCAobWVzbWVyaXNpbmcgaGFu
ZC13YXZpbmcuLi4pLCB3aGlsZQp0aGUgb3ZlcmxheWZzIEp1c3QtV29ya3PihKIgKGF0IHRoZSBl
eHBlbnNlIG9mIGEgbGl0dGxlIHRyaWNrZXJ5IGF0CnJ1bnRpbWUpLgoKVGhpcyBzZXJpZXMgd291
bGQgbm90IGhhdmUgYmVlbiBlbnRpcmVseSBwb3NzaWJsZSB3aXRob3V0IHRoZSBpbnB1dCBmcm9t
Ck5vcmJlcnQsIHdobyBwcm92aWRlZCB0aGUgYmFzaXMgZm9yIHRoZSBvdmVybGF5ZnMtYmFzZWQg
c29sdXRpb24sIGFuZApleHBsYW5hdGlvbnMgb24gaG93IHRoaW5ncyBmaXQgdG9nZXRoZXIgaW4g
YSBzeXN0ZW1kIHN5c3RlbS4gVGhhbmtzIQoKQ2hhbmdlcyB2MyAtPiB2NDoKICAtIGRyb3AgcGF0
Y2hlcyBhbHJlYWR5IGFwcGxpZWQKICAtIHNwbGl0IG1vdW50aW5nIHRoZSBiYXNlIHRtcGZzIG91
dCBvZiB0aGUgc2VydmljZSB1bml0IGFuZCBpbnRvIGl0cwogICAgb3duIC5tb3VudCB1bml0CiAg
LSByZW5hbWUgdGhlIHNlcnZpY2UgdW5pdCB0byBhIG1vcmUgYXBwcm9wcmlhdGUgbmFtZQogIC0g
dXBkYXRlIGV4cGxhbmF0aW9ucyBvbiBob3MgdG8gcHJvdmlkZSBvbmUncyBvd24gYmFja2luZyBz
dG9yZQogICAgaW5zdGVhZCBvZiB0aGUgdG1wZnMKCkNoYW5nZXMgdjIgLT4gdjM6CiAgLSBpbnRy
b2R1Y2UgdGhlIG92ZXJsYXlmcy1iYXNlZCBwcm9wb3NhbCBmcm9tIE5vcmJlcnQKICAtIHNvbWUg
cmV3b3JkaW5nCiAgLSBzb21lIHR5cG8gZml4ZXMgKHlhaCwgWWFubiBiZWluZyBZYW5uIGJlaW5n
IG1lLi4uKQoKQ2hhbmdlcyB2MSAtPiB2MjoKICAtIHNwbGl0IFlhbm5Ad29yayBpbml0aWFsIHBh
dGNoIGludG8gdGhlIGZpcnN0IHR3byBwYXRjaAogIC0gbW92ZSB0aGUgc3lzdGVtZC10bXBmaWxl
IGhhbmRsaW5nIHRvIHRoZSBza2VsZXRvbgogIC0gaW50cm9kdWNlIG9wdGlvbnMgdG8gZW5hYmxl
L2Rpc2FibGUgZmFjdG9yeSBvciBzeXN0ZW1kLXRtcGZpbGVzCgpSZWdhcmRzLApZYW5uIEUuIE1P
UklOLgoKCi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0KWWFubiBFLiBNT1JJTiAoMyk6CiAgICAgIHN5c3RlbTogaW50cm9kdWNl
IGEgY2hvaWNlIGZvciAvdmFyIG1hbmFnZW1lbnQKICAgICAgc3lzdGVtOiBhZGQgb3B0aW9uIHRv
IHVzZSBhbiBvdmVybGF5ZnMgb24gL3ZhciBvbiBhIHIvbyByb290IHcvIHN5c3RlbWQKICAgICAg
c3VwcG9ydC90ZXN0aW5nOiBhZGQgc3lzdGVtZCB0ZXN0cyBmb3IgZmFjdG9yeSBhbmQgb3Zlcmxh
eWZzCgogLi4uL3NrZWxldG9uLWluaXQtc3lzdGVtZC97ID0+IGZhY3Rvcnl9L3Zhci5tb3VudCAg
fCAgIDAKIC4uLi9vdmVybGF5ZnMvcHJlcGFyZS12YXItb3ZlcmxheS5zZXJ2aWNlICAgICAgICAg
IHwgIDE5ICsrCiAuLi4vb3ZlcmxheWZzL3J1bi1idWlsZHJvb3QtbW91bnRzLXZhci5tb3VudCAg
ICAgICB8ICAxMiArKwogcGFja2FnZS9za2VsZXRvbi1pbml0LXN5c3RlbWQvb3ZlcmxheWZzL3Zh
ci5tb3VudCAgfCAgMTQgKysKIC4uLi9za2VsZXRvbi1pbml0LXN5c3RlbWQvc2tlbGV0b24taW5p
dC1zeXN0ZW1kLm1rIHwgIDI4ICsrLQogLi4uL3Rlc3RpbmcvY29uZi9vdmVybGF5ZnMta2VybmVs
LWZyYWdtZW50LmNvbmZpZyAgfCAgIDEgKwogLi4uL3J1bi1idWlsZHJvb3QtbW91bnRzLXZhci5t
b3VudC5kL2Jhc2UuY29uZiAgICAgfCAgIDIgKwogc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL2luaXQv
dGVzdF9zeXN0ZW1kLnB5ICAgICAgICAgfCAyMDkgKysrKysrKysrKysrKysrKysrKystCiBzeXN0
ZW0vQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0OCArKysr
LQogOSBmaWxlcyBjaGFuZ2VkLCAzMTEgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRpb25zKC0pCiBy
ZW5hbWUgcGFja2FnZS9za2VsZXRvbi1pbml0LXN5c3RlbWQveyA9PiBmYWN0b3J5fS92YXIubW91
bnQgKDEwMCUpCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9za2VsZXRvbi1pbml0LXN5c3Rl
bWQvb3ZlcmxheWZzL3ByZXBhcmUtdmFyLW92ZXJsYXkuc2VydmljZQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2Uvc2tlbGV0b24taW5pdC1zeXN0ZW1kL292ZXJsYXlmcy9ydW4tYnVpbGRyb290
LW1vdW50cy12YXIubW91bnQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3NrZWxldG9uLWlu
aXQtc3lzdGVtZC9vdmVybGF5ZnMvdmFyLm1vdW50CiBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9y
dC90ZXN0aW5nL2NvbmYvb3ZlcmxheWZzLWtlcm5lbC1mcmFnbWVudC5jb25maWcKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvaW5pdC9zeXN0ZW1kLW92ZXJsYXkvdXNy
L2xpYi9zeXN0ZW1kL3N5c3RlbS9ydW4tYnVpbGRyb290LW1vdW50cy12YXIubW91bnQuZC9iYXNl
LmNvbmYKCi0tIAouLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLgp8ICBZYW5uIEUuIE1PUklOICB8IFJl
YWwtVGltZSBFbWJlZGRlZCB8IC8iXCBBU0NJSSBSSUJCT04gfCBFcmljcycgY29uc3BpcmFjeTog
fAp8ICszMyA2NjIgMzc2IDA1NiB8IFNvZnR3YXJlICBEZXNpZ25lciB8IFwgLyBDQU1QQUlHTiAg
ICAgfCAgX19fICAgICAgICAgICAgICAgfAp8ICszMyA1NjEgMDk5IDQyNyBgLS0tLS0tLS0tLS0t
Li0tLS0tLS06ICBYICBBR0FJTlNUICAgICAgfCAgXGUvICBUaGVyZSBpcyBubyAgfAp8IGh0dHA6
Ly95bW9yaW4uaXMtYS1nZWVrLm9yZy8gfCBfLypcXyB8IC8gXCBIVE1MIE1BSUwgICAgfCAgIHYg
ICBjb25zcGlyYWN5LiAgfAonLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS1e
LS0tLS0tLS0tLS0tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLS0tJwpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
