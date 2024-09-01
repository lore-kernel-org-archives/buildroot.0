Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47285CD3420
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 16:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D620E80E6F;
	Sun,  1 Sep 2024 16:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0s0_wGkqLDcQ; Sun,  1 Sep 2024 16:40:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0C6B80E76
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0C6B80E76;
	Sun,  1 Sep 2024 16:40:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CD5EC1BF30C
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 16:40:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C85BA6062F
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 16:40:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XgHhIUyE98Ue for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 16:40:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 70485600CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70485600CC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 70485600CC
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 16:40:12 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([87.78.25.164]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNbox-1sRs5y3y6F-00MNZg; Sun, 01
 Sep 2024 18:40:10 +0200
Date: Sun, 01 Sep 2024 18:40:07 +0200
MIME-Version: 1.0
Message-Id: <20240901-aer-v2-1-2080780f907d@gmx.net>
X-B4-Tracking: v=1; b=H4sIAOaY1GYC/1WMQQ6CMBBFr0JmbU2nrQZdeQ/DgpYBZmExU9JgS
 O9uZefy/fz3dkgkTAnuzQ5CmRMvsYI5NRDmPk6keKgMRhunbxpVT6KGYOwljC251kJ9voVG3o7
 Ks6s8c1oX+RzRjL/138+oUGnr0bjgr87jY3pt50grdKWUL9OUQhmUAAAA
To: buildroot@buildroot.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1725208809; l=1277;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=FmGUzu46AgTi9BNrVuwbeuvAYAFQLc+mjOJ+7ziOURU=;
 b=pLFTUWFdrm7Yw3Dnclna0+XeKNfG6IV4rUJOo4GjgyyuaPCgfnTk+p7+Z5d75gq01y05Fx8v6
 0SOcuiU+21hAqN1R7AW4f88O2VATr1Jx+O3ErrOp9CKxmQfcNSkemJq
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:zTt2H+rP9nW95egnxPrF8jvYG1m5p0sH4HjaMs3whj31OO7gI2+
 BogA92xInIn1HnJor0XGd6QHxM7coNhp+WQLkCc74s0222tTG0yxzhpo4yv1Z4J3Aysn9hO
 +LU7fNOTZI3KSRzPGnBTnmCXLeBLrCosW4lZ/+Z6psMDQxkUhKs7EVFEKblr3GK2sGhiYYA
 n8vd8wDkIdBrymwnhuydQ==
UI-OutboundReport: notjunk:1;M01:P0:juxMPrmjgus=;SsSGlMo8lxAozlGZzyhyHLBW3fu
 svm5EB92IxKgcGm2i0HnbwKjjVPVstzsZmH7D0OsTNz9LRV2RYCoAduVGPm2FmePsbjxK0E9o
 w2/Sf0yyLQGtF4PjLG7qyVDiEZy3pAf53aIcvLl3kypI1/5YvmeayJlmRhkvx3DJ3k3sIuq/d
 VziS7uoWideW0P4/CVhUI53fPun81MKf3+0+A9XZfnHTV9Vmbb8p3bnPO3yePcypjKL4rYuYb
 hYuE0tPVDjU3JVwZrXcLYRiwGk44r8h+EgBClm7daGNEqHG8MX92cPkK9jTtMBJKB5yikuLnr
 qtAzcCLsbjDRtrW5JMlsz1JXvMB9gLWfhihp6rZHmD6K7yXNWpO6YsARKCcNrQNEtiiUFBUtf
 h1RbKFfZ0cJkP9ixGdOyHONGi44XUvnTP2j3d02xtf96Z36p4VM25nXw24NnDlN2j+0xl0yua
 odtGmKGeXO5B3RmpmBZ+ZS6aH3kOY/hjBWVf8qfAU2S2Sbptft7RquL8qQZ/qUOLm2JBRkHSW
 nT70gUphFK/VK18l1sAYkzH7ohOZTsGlSG6Cc0PkVBBJufA9jRnDf+19pNcOluYpTn67gPBVP
 UeoF5VEv1/xxgpYnY2AOZ0IPfXgHESc/Eog9Fc6OHehQLGbh5FDgKy9Skr6vSUbu3mrjSIAI6
 hljPRnMWptqeDT0lltDDn/ByRrzH8+yNWdlEL/aZuIOQ0YyH5b5tXmijpWTkNgG6zRY41O2b1
 Ojds8MTW2t3/xAZStZotsgC3xloZMhvjB3wDfemf5xTDWsl3eOII5fCaKVHJ7RQxWu1z6AD8P
 CZ271FfHh/KrDrBN4WGwvTxA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1725208810; x=1725813610; i=j.neuschaefer@gmx.net;
 bh=UFvdNn/HbcVfPQCsg2qI+hvm1fW76JfNgYmjsnDesaY=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:To:Cc:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=N55lILX208wv4pJiGpZ0QbB6TN3WyeZPnN+nLhEH5LaejS08tr6/EBdCtOJdIQKO
 nTwAFLT8Okb7IKkOCUsqpgy6IkEx2huo2AHCA96Tx9Nzklm7EmDbP9SyGCpTV12IW
 Y2SC/ilwpBj0oWLEcShKRiKfFkkxzn41tUw+gl4v10NzI87HYr3jhimomDA9OM6iZ
 oOzFgebrUryidpvuXnfCfvmv7445UaNHZoXEMEeLG6jtZnU0lDElQDs1FNVZsgwQj
 QzlyNEdIJ95N3rESZJni6J7s5AKDsyS42na+bxJHj17RoVIr3n8PPl/5Z09u7zCkS
 KdX7ID4w1VCinAGTBg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=N55lILX2
Subject: [Buildroot] [PATCH v2] package/aer-inject: switch upstream
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

QWNjb3JkaW5nIHRvIGEgY29tbWl0IGluIExpbnV4WzFdLCB0aGUgdXBzdHJlYW0gb2YgYWVyLWlu
amVjdCBjaGFuZ2VkIHRvCmh0dHBzOi8vZ2l0aHViLmNvbS9pbnRlbC9hZXItaW5qZWN0LgoKWzFd
OiBodHRwczovL2dpdC5rZXJuZWwub3JnL2xpbnVzL2EyOWU1MjkwZTM1NjZhZTRkYjRlNmZlNWYz
MWNhZjIzMTE4YzgyYjYKClNpZ25lZC1vZmYtYnk6IEouIE5ldXNjaMOkZmVyIDxqLm5ldXNjaGFl
ZmVyQGdteC5uZXQ+Ci0tLQpDaGFuZ2VzIGluIHYyOgotIEtlZXAgU0lURV9NRVRIT0QgdGhlIGdh
bWUgKGdpdCkKLSBGaXggUy1vLWIgbGluZQotIExpbmsgdG8gdjE6IGh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL3IvMjAyNDA5MDEtYWVyLXYxLTEtMDNiMTI0Y2I2NGIxQGdteC5uZXQKLS0tCiBwYWNr
YWdlL2Flci1pbmplY3QvYWVyLWluamVjdC5tayB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvYWVyLWluamVj
dC9hZXItaW5qZWN0Lm1rIGIvcGFja2FnZS9hZXItaW5qZWN0L2Flci1pbmplY3QubWsKaW5kZXgg
NmJjOWNiNDRkYS4uNzUxNmVmNjNhYyAxMDA2NDQKLS0tIGEvcGFja2FnZS9hZXItaW5qZWN0L2Fl
ci1pbmplY3QubWsKKysrIGIvcGFja2FnZS9hZXItaW5qZWN0L2Flci1pbmplY3QubWsKQEAgLTUs
NyArNSw3IEBACiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIwoKIEFFUl9JTkpFQ1RfVkVSU0lPTiA9
IDliZDVlMmM3ODg2ZmNhNzJmMTM5Y2Q4NDAyNDg4YTIyMzU5NTdkNDEKLUFFUl9JTkpFQ1RfU0lU
RSA9IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2dvbmcu
Y2hlbi9hZXItaW5qZWN0LmdpdAorQUVSX0lOSkVDVF9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29t
L2ludGVsL2Flci1pbmplY3QuZ2l0CiBBRVJfSU5KRUNUX1NJVEVfTUVUSE9EID0gZ2l0CiBBRVJf
SU5KRUNUX0xJQ0VOU0UgPSBHUEwtMi4wCiBBRVJfSU5KRUNUX0xJQ0VOU0VfRklMRVMgPSBSRUFE
TUUKCi0tLQpiYXNlLWNvbW1pdDogMzc4MDE3NjdmNjhjMDU1MDBmMWQ0NDk1YjViYWFjMGU3MzQw
ZjdhOQpjaGFuZ2UtaWQ6IDIwMjQwOTAxLWFlci1kYzIzNWNmOGU0ODMKCkJlc3QgcmVnYXJkcywK
LS0KSi4gTmV1c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
