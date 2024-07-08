Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2163FC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 22:45:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D802404A9;
	Mon,  8 Jul 2024 22:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OBDM-O-CHCtM; Mon,  8 Jul 2024 22:45:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BF6C4066E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BF6C4066E;
	Mon,  8 Jul 2024 22:45:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 83B7A1BF3DE
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 22:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E25560730
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 22:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UkRLmpX1QaBH for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 22:45:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 21D3D606FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21D3D606FF
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 21D3D606FF
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 22:45:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([78.34.165.29]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4hzj-1sHuch42Kd-012zSz; Tue, 09
 Jul 2024 00:45:37 +0200
Date: Tue, 09 Jul 2024 00:45:31 +0200
Message-Id: <20240709-tipidee-v2-0-a69a8668005e@gmx.net>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAtsjGYC/2WMQQ7CIBBFr9LMWswwoWl05T1MF0iHdhbSBgipa
 bi72K3L9//LOyBxFE5w7w6IXCTJGhrQpQO32DCzkqkxEJLBAY3KssnErJgJrdPoBm+h2VtkL/t
 Zeo6NF0l5jZ8zXPRv/W8UrVD17PFm6NXe/jG/92vgDGOt9QvSXrfQnAAAAA==
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720478736; l=1860;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=TqtiQxPaANY3fz/PffDI4bBHxpHSCbAMqwBuNNIMBRM=;
 b=+khXhZM689S1nDQbip2zI5bRip64EdlPgBqyKK4fgItR+vBY7hdzyFD3/R+jI0/0Ie3yYyUDk
 MGKQuKnER0ZCqMrh4fE2U5IbHVeQLpfqUgjnQ6GfTRbD1ZH8170vqTf
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:ldAituyxUJPSRnSfzpB/ZCJP4YTU0lGyrw1z7s/pAjM/59g52N1
 ljFtDiXMzNzaDWmo6YKYupWpiHmXTyNU/WJXW+tg4LLOftLgSdnMdI1c6iGyrvfASx2dRjH
 Y152lx+kKvF3Ba5aSIMz1gZBYuyvjt+4fwWrw6Hg76MfogHUKen2imtShZswN/AtbdXmb1D
 HwVPII86RWaOYPAYgaF0w==
UI-OutboundReport: notjunk:1;M01:P0:ymHLhLU0rcg=;p8HbmasHAF3Yp0tw/OXyLpS5cl2
 W3Bh5z8UjkbLva3utCK4m1xiGURlswLFfOG+wMIL90SpKVwIYUAJfUzQGDhcsOQwOxjGAeEuG
 VYPHH55z9sZFRbjeAFgXS1FDoZVFZ68mlgyLBbknvBsroppn4+BsdsOe8HzCCxX3BplMEDnFm
 tgZWBBeNw+vhkTYWmiRA1HU5OGTl8mbHmtJaGDaujsYwvcda+aqdOBfovjUswkbm2Bxj04A1J
 8CFkzlT4fJZdY+fE5GE2Qyue/zFXWR/BsAdpD+3j0HzVIJxFzGAo/eq3P6uJ7KI8J5joyNsWz
 ZCBC7e0SZTkvQsU8iY/Zlrrulq96CPRzYAeAQt/rgke+uZ1pOYz1Oa0W+IgWlqp+tyonTGYcw
 yTioNMclFvMbrpNkmwgFLVe0omFX0/kWJsdTmRIAKIvPNT3T5ih0uUq4CNoytsRlHOhLz8+SR
 nQJKlv0SEmnpuo2XJ45+5hsSoHINf9J7m7G/o4qEtviqfmIHclqbrSAClw15DvsY4ep+wqrMk
 Wd99MXRRxRTZW4U/QOzrJ7QGOvwZtEMGxIts/0TNBJCSZkfMbsSO795AyHhtbssUQoU3+JoJm
 KVfZd4IkHT5k3mfWMSmvkLXA4kFI5MIDxttArZQfSrpxZc++ycoIaxPm7PUU8Fjnf8QTYaCM4
 QyLu+jlHS8W/UhKPTqfE0Mk3Ws/JOGLopzqLPPnhKAPhY3ayQYkdwbOWZdxp3BYJV0j+Nq1kl
 J0eIiJbrMbNohpNBFRmUTaEoRn58zVCWcbnxUDrF/CUIdqdoD4h/8RtJu7V9xxpPXktrAiazf
 aPq11iGpPzZDtC/3LWM7wNs0jJczPC7+fCSU50ozHZu7s=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720478737; x=1721083537; i=j.neuschaefer@gmx.net;
 bh=IDLE63ha5BLfrjiDSgW1g9pXWF2A5f622NJf1KXahxo=;
 h=X-UI-Sender-Class:From:Subject:Date:Message-Id:MIME-Version:
 Content-Type:Content-Transfer-Encoding:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=RR7P9qQoH9/cgwkNdxl8c4WCIGoa5aANdZxdw1nSP0l+mUVPh6o1YfbJEJVuu5pY
 bbtVykLZWBCKZmv5nUFu0l4p/a6E3Bp0AYSurmlfiAciTTfnA6ICz1RMPTPcR6yfk
 Vtvk+k4V9HCcjHQpI0n0sjydYxENyfiavgmzd9Q13orVua+alNgDK47bWAVSxqrgb
 EC0iyo/a7WvlbtqaAFM3FgDym8laXflAy53Y+RpPHQMwEOAQZcWVVkiJ1XJCJ7+Ef
 xbbzJ95EjNK2yRpoKFgxzTVb9mh5mm559d4Q0SOFP2rA+p1+Nb3zERQaHc0Kl6Q8G
 y5df2I03OauBBgbleA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=RR7P9qQo
Subject: [Buildroot] [PATCH v2 0/8] Various skarnet.org updates and new
 tipidee package
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KLS0t
CkNoYW5nZXMgaW4gdjI6Ci0gQWRkIG1pc3NpbmcgU2lnbmVkLW9mZi1ieSB0YWdzCi0gVXBkYXRl
IGxpY2Vuc2UgZmlsZSBoYXNoZXMgd2hlcmUgbmVjZXNzYXJ5Ci0gTGluayB0byB2MTogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDcwNC10aXBpZGVlLXYxLTAtNWVmMDk0MmIyMDI1QGdt
eC5uZXQKCi0tLQpKLiBOZXVzY2jDpGZlciAoOCk6CiAgICAgIHNrYWxpYnM6IGJ1bXAgdG8gdmVy
c2lvbiAyLjE0LjIuMAogICAgICBzNjogYnVtcCB0byB2ZXJzaW9uIDIuMTMuMC4xCiAgICAgIGV4
ZWNsaW5lOiBidW1wIHRvIHZlcnNpb24gMi45LjYuMAogICAgICBzNi1uZXR3b3JraW5nOiBidW1w
IHRvIHZlcnNpb24gMi43LjAuMwogICAgICBzNi1yYzogYnVtcCB0byB2ZXJzaW9uIDAuNS40LjMK
ICAgICAgbWRldmQ6IGJ1bXAgdG8gdmVyc2lvbiAwLjEuNi40CiAgICAgIHM2LWRuczogYnVtcCB0
byB2ZXJzaW9uIDIuMy43LjIKICAgICAgdGlwaWRlZTogbmV3IHBhY2thZ2UKCiBwYWNrYWdlL0Nv
bmZpZy5pbiAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9Db25maWcuaW4u
aG9zdCAgICAgICAgICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvZXhlY2xpbmUvZXhlY2xpbmUu
aGFzaCAgICAgICAgICAgfCAgMiArLQogcGFja2FnZS9leGVjbGluZS9leGVjbGluZS5tayAgICAg
ICAgICAgICB8ICAyICstCiBwYWNrYWdlL21kZXZkL21kZXZkLmhhc2ggICAgICAgICAgICAgICAg
IHwgIDQgKy0KIHBhY2thZ2UvbWRldmQvbWRldmQubWsgICAgICAgICAgICAgICAgICAgfCAgMiAr
LQogcGFja2FnZS9zNi1kbnMvczYtZG5zLmhhc2ggICAgICAgICAgICAgICB8ICA0ICstCiBwYWNr
YWdlL3M2LWRucy9zNi1kbnMubWsgICAgICAgICAgICAgICAgIHwgIDIgKy0KIHBhY2thZ2UvczYt
bmV0d29ya2luZy9zNi1uZXR3b3JraW5nLmhhc2ggfCAgMiArLQogcGFja2FnZS9zNi1uZXR3b3Jr
aW5nL3M2LW5ldHdvcmtpbmcubWsgICB8ICAyICstCiBwYWNrYWdlL3M2LXJjL3M2LXJjLmhhc2gg
ICAgICAgICAgICAgICAgIHwgIDQgKy0KIHBhY2thZ2UvczYtcmMvczYtcmMubWsgICAgICAgICAg
ICAgICAgICAgfCAgMiArLQogcGFja2FnZS9zNi9zNi5oYXNoICAgICAgICAgICAgICAgICAgICAg
ICB8ICAyICstCiBwYWNrYWdlL3M2L3M2Lm1rICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIg
Ky0KIHBhY2thZ2Uvc2thbGlicy9za2FsaWJzLmhhc2ggICAgICAgICAgICAgfCAgMiArLQogcGFj
a2FnZS9za2FsaWJzL3NrYWxpYnMubWsgICAgICAgICAgICAgICB8ICAyICstCiBwYWNrYWdlL3Rp
cGlkZWUvQ29uZmlnLmluICAgICAgICAgICAgICAgIHwgMzcgKysrKysrKysrKysrKysrKwogcGFj
a2FnZS90aXBpZGVlL0NvbmZpZy5pbi5ob3N0ICAgICAgICAgICB8ICA4ICsrKysKIHBhY2thZ2Uv
dGlwaWRlZS90aXBpZGVlLmhhc2ggICAgICAgICAgICAgfCAgMyArKwogcGFja2FnZS90aXBpZGVl
L3RpcGlkZWUubWsgICAgICAgICAgICAgICB8IDcyICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCiAyMCBmaWxlcyBjaGFuZ2VkLCAxMzkgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25z
KC0pCi0tLQpiYXNlLWNvbW1pdDogM2ViYzdjNjlkNTY0MzBjMzRlYmE0Yzg2OWQxZDRmZTRkMWU4
ZGU1NQpjaGFuZ2UtaWQ6IDIwMjQwNzA0LXRpcGlkZWUtZWUyMGFjMTBjN2ZhCgpCZXN0IHJlZ2Fy
ZHMsCi0tCkouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFlZmVyQGdteC5uZXQ+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
