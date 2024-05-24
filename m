Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E52BC25B74
	for <buildroot@archiver.kernel.org>; Fri, 24 May 2024 17:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38D11833AE;
	Fri, 24 May 2024 17:56:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EzcyA3bzDHS6; Fri, 24 May 2024 17:56:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E96382BD6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E96382BD6;
	Fri, 24 May 2024 17:56:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B69AE1CF2DE
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 17:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2E8F60ACF
 for <buildroot@lists.busybox.net>; Fri, 24 May 2024 17:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2mXS7NBUQp70 for <buildroot@lists.busybox.net>;
 Fri, 24 May 2024 17:56:35 +0000 (UTC)
X-Greylist: delayed 7222 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 24 May 2024 17:56:33 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7619A608F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7619A608F5
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=160.92.124.110;
 helo=smtp-outgoing-2003.laposte.net; envelope-from=vincent.stehle@laposte.net;
 receiver=<UNKNOWN> 
Received: from smtp-outgoing-2003.laposte.net (smtp-outgoing-2003.laposte.net
 [160.92.124.110])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7619A608F5
 for <buildroot@buildroot.org>; Fri, 24 May 2024 17:56:33 +0000 (UTC)
X-mail-filterd: {"version":"1.7.5","queueID":"4Vm8lq1pkSzjWvm","contextId":
 "f2d29caa-bcf2-41ae-a9f0-9074a1ee413b"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
 by mlpnf0116.laposte.net (SMTP Server) with ESMTP id 4Vm8lq1pkSzjWvm;
 Fri, 24 May 2024 17:56:07 +0200 (CEST)
X-mail-filterd: {"version":"1.7.5","queueID":"4Vm8lq17q5zjWvW","contextId":
 "4525b0a8-89c9-4139-86e3-c3caff459631"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 40
X-lpn-spamlevel: not-spam
Received: from romuald.bergerie (88-169-129-225.subs.proxad.net
 [88.169.129.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mlpnf0116.laposte.net (SMTP Server) with ESMTPSA id 4Vm8lq17q5zjWvW;
 Fri, 24 May 2024 17:56:07 +0200 (CEST)
Received: from radicelle (radicelle.bergerie [192.168.42.3])
 by romuald.bergerie (Postfix) with ESMTP id 95F775D97955;
 Fri, 24 May 2024 17:56:05 +0200 (CEST)
Received: from vincent by radicelle with local (Exim 4.97)
 (envelope-from <vincent@radicelle.bergerie>)
 id 1sAXHK-000000000qG-486n; Fri, 24 May 2024 17:56:22 +0200
To: buildroot@buildroot.org
Date: Fri, 24 May 2024 17:56:17 +0200
Message-ID: <20240524155617.3231-1-vincent.stehle@laposte.net>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=laposte.net; s=lpn-wlmd; t=1716573391;
 bh=PNiHYPGWFicBoP1hi65YsjlX8EtzYiMyXDiJleoppUs=;
 h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 b=mSjSyrcoC6/WEzf7yrJsGLYHLcPVWZ0TolIBf8BedHukGHzuqvaCmQ2BOYcSPCvp3cPKCu3Vdt7xEndCrDJk4C380AaSw3BDxEvHSxi6w1YYfdd7a+jt5K9uv5xIBkaV2RzBHbCMesasju6AnbADw8PiADTCYvE4bVKYhQxtweyaW3aV7EyDVEUPtj3GkmDn5GNodb4uFx3A4/EqxoP+PumWKzmbe37E+wzkLgJMS3c9Oxw2OSYyu2PBaQK8pYKTzW7w2aIzNfniAlReVxkh65BOVXrExH8a8Ete5wZqokqYoWYaXXY7buTEiOw0KRC3fOzV1HHIAazXgnYjpQBTqw==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=laposte.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=laposte.net header.i=@laposte.net header.a=rsa-sha256
 header.s=lpn-wlmd header.b=mSjSyrco
Subject: [Buildroot] [PATCH] configs/uevm5432_defconfig: bump Linux and
 U-Boot
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
From: =?utf-8?q?Vincent_Stehl=C3=A9_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Cc: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LSBCdW1wIExpbnV4IGtlcm5lbCB0byB2Ni44LjEwLgogIFRoZSBEZXZpY2V0cmVlIGhhcyBtb3Zl
ZDsgdXBkYXRlIG91ciBjb25maWcgYWNjb3JkaW5nbHkuCgotIEJ1bXAgVS1Cb290IHRvIDIwMjMu
MDQuCiAgVGhpcyBpcyB0aGUgbW9zdCByZWNlbnQgdmVyc2lvbiB3ZSBjYW4gdXNlIGFzIFUtQm9v
dCAyMDIzLjA3IGRyb3BwZWQKICBzdXBwb3J0IGZvciB0aGUgdWV2bS4KICBPcGVuU1NMIGlzIG5v
dyByZXF1aXJlZCBmb3IgdGhlIGJ1aWxkLgogIFRoZSBkZWZhdWx0IGJvb3QgbWV0aG9kIGhhcyBj
aGFuZ2VkOyBzd2l0Y2ggdG8gYm9vdGluZyB3aXRoIGFuIGV4dGxpbnV4CiAgY29uZmlndXJhdGlv
biB0byBvdmVyY29tZSB0aGlzLgoKU2lnbmVkLW9mZi1ieTogVmluY2VudCBTdGVobMOpIDx2aW5j
ZW50LnN0ZWhsZUBsYXBvc3RlLm5ldD4KLS0tCiBib2FyZC91ZXZtNTQzMi9leHRsaW51eC5jb25m
IHwgIDQgKysrKwogYm9hcmQvdWV2bTU0MzIvZ2VuaW1hZ2UuY2ZnICB8ICA2ICsrKystLQogYm9h
cmQvdWV2bTU0MzIvcG9zdC1idWlsZC5zaCB8ICA2ICsrKysrKwogY29uZmlncy91ZXZtNTQzMl9k
ZWZjb25maWcgICB8IDEzICsrKysrKystLS0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0
aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBib2FyZC91ZXZtNTQz
Mi9leHRsaW51eC5jb25mCiBjcmVhdGUgbW9kZSAxMDA3NTUgYm9hcmQvdWV2bTU0MzIvcG9zdC1i
dWlsZC5zaAoKZGlmZiAtLWdpdCBhL2JvYXJkL3Vldm01NDMyL2V4dGxpbnV4LmNvbmYgYi9ib2Fy
ZC91ZXZtNTQzMi9leHRsaW51eC5jb25mCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAw
MDAwMDAuLjUwZjNjZDMwZmIKLS0tIC9kZXYvbnVsbAorKysgYi9ib2FyZC91ZXZtNTQzMi9leHRs
aW51eC5jb25mCkBAIC0wLDAgKzEsNCBAQAorbGFiZWwgdWV2bTU0MzItYnVpbGRyb290CisgIGtl
cm5lbCAvekltYWdlCisgIGZkdCAvb21hcDUtdWV2bS5kdGIKKyAgYXBwZW5kIHJvb3Q9L2Rldi9t
bWNibGswcDIgcncgcm9vdGZzdHlwZT1leHQ0IHJvb3R3YWl0IGNvbnNvbGU9dHR5TzIsMTE1MjAw
CmRpZmYgLS1naXQgYS9ib2FyZC91ZXZtNTQzMi9nZW5pbWFnZS5jZmcgYi9ib2FyZC91ZXZtNTQz
Mi9nZW5pbWFnZS5jZmcKaW5kZXggZGZlMzg4MjI3ZS4uN2JiOTBlMTk4YiAxMDA2NDQKLS0tIGEv
Ym9hcmQvdWV2bTU0MzIvZ2VuaW1hZ2UuY2ZnCisrKyBiL2JvYXJkL3Vldm01NDMyL2dlbmltYWdl
LmNmZwpAQCAtMiw3ICsyLDEwIEBAIGltYWdlIGJvb3QudmZhdCB7CiAJdmZhdCB7CiAJCWZpbGVz
ID0gewogCQkJIk1MTyIsCi0JCQkidS1ib290LmltZyIKKwkJCSJ1LWJvb3QuaW1nIiwKKwkJCSJ6
SW1hZ2UiLAorCQkJIm9tYXA1LXVldm0uZHRiIiwKKwkJCSJleHRsaW51eCIKIAkJfQogCX0KIApA
QCAtMjIsNiArMjUsNSBAQCBpbWFnZSBzZGNhcmQuaW1nIHsKIAlwYXJ0aXRpb24gcm9vdGZzIHsK
IAkJcGFydGl0aW9uLXR5cGUgPSAweDgzCiAJCWltYWdlID0gInJvb3Rmcy5leHQ0IgotCQlzaXpl
ID0gNTEyTQogCX0KIH0KZGlmZiAtLWdpdCBhL2JvYXJkL3Vldm01NDMyL3Bvc3QtYnVpbGQuc2gg
Yi9ib2FyZC91ZXZtNTQzMi9wb3N0LWJ1aWxkLnNoCm5ldyBmaWxlIG1vZGUgMTAwNzU1CmluZGV4
IDAwMDAwMDAwMDAuLmY5MGY3NmQ4YjUKLS0tIC9kZXYvbnVsbAorKysgYi9ib2FyZC91ZXZtNTQz
Mi9wb3N0LWJ1aWxkLnNoCkBAIC0wLDAgKzEsNiBAQAorIyEvYmluL3NoCitzZXQgLWUKKworQk9B
UkRfRElSPSIkKGRpcm5hbWUgIiQwIikiCisKK2luc3RhbGwgLW0gMDY0NCAtRCAiJEJPQVJEX0RJ
UiIvZXh0bGludXguY29uZiAiJEJJTkFSSUVTX0RJUiIvZXh0bGludXgvZXh0bGludXguY29uZgpk
aWZmIC0tZ2l0IGEvY29uZmlncy91ZXZtNTQzMl9kZWZjb25maWcgYi9jb25maWdzL3Vldm01NDMy
X2RlZmNvbmZpZwppbmRleCA3YjlhNDMwOWM2Li4wM2RjNzg5ZmE4IDEwMDY0NAotLS0gYS9jb25m
aWdzL3Vldm01NDMyX2RlZmNvbmZpZworKysgYi9jb25maWdzL3Vldm01NDMyX2RlZmNvbmZpZwpA
QCAtMyw4ICszLDggQEAgQlIyX2FybT15CiBCUjJfY29ydGV4X2ExNT15CiBCUjJfQVJNX0ZQVV9O
RU9OX1ZGUFY0PXkKIAotIyBMaW51eCBoZWFkZXJzIHNhbWUgYXMga2VybmVsLCBhIDUuMTIgc2Vy
aWVzCi1CUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzVfMTI9eQorIyBMaW51
eCBoZWFkZXJzIHNhbWUgYXMga2VybmVsLCBhIDYuOCBzZXJpZXMKK0JSMl9QQUNLQUdFX0hPU1Rf
TElOVVhfSEVBREVSU19DVVNUT01fNl84PXkKIAogIyBTeXN0ZW0KIEJSMl9ST09URlNfREVWSUNF
X0NSRUFUSU9OX0RZTkFNSUNfTURFVj15CkBAIC0xMiwxNyArMTIsMTcgQEAgQlIyX1RBUkdFVF9H
RU5FUklDX0dFVFRZX1BPUlQ9InR0eVMyIgogQlIyX1NZU1RFTV9ESENQPSJldGgwIgogCiAjIElt
YWdlCitCUjJfUk9PVEZTX1BPU1RfQlVJTERfU0NSSVBUPSJib2FyZC91ZXZtNTQzMi9wb3N0LWJ1
aWxkLnNoIgogQlIyX1JPT1RGU19QT1NUX0lNQUdFX1NDUklQVD0ic3VwcG9ydC9zY3JpcHRzL2dl
bmltYWdlLnNoIgogQlIyX1JPT1RGU19QT1NUX1NDUklQVF9BUkdTPSItYyBib2FyZC91ZXZtNTQz
Mi9nZW5pbWFnZS5jZmciCiAKICMgS2VybmVsCiBCUjJfTElOVVhfS0VSTkVMPXkKIEJSMl9MSU5V
WF9LRVJORUxfQ1VTVE9NX1ZFUlNJT049eQotQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lP
Tl9WQUxVRT0iNS4xMi4yIgorQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0i
Ni44LjEwIgogQlIyX0xJTlVYX0tFUk5FTF9ERUZDT05GSUc9Im9tYXAycGx1cyIKIEJSMl9MSU5V
WF9LRVJORUxfRFRTX1NVUFBPUlQ9eQotQlIyX0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9
Im9tYXA1LXVldm0iCi1CUjJfTElOVVhfS0VSTkVMX0lOU1RBTExfVEFSR0VUPXkKK0JSMl9MSU5V
WF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJ0aS9vbWFwL29tYXA1LXVldm0iCiBCUjJfTElOVVhf
S0VSTkVMX05FRURTX0hPU1RfT1BFTlNTTD15CiAKICMgRmlsZXN5c3RlbQpAQCAtMzQsOCArMzQs
OSBAQCBCUjJfVEFSR0VUX1JPT1RGU19FWFQyXzQ9eQogQlIyX1RBUkdFVF9VQk9PVD15CiBCUjJf
VEFSR0VUX1VCT09UX0JVSUxEX1NZU1RFTV9LQ09ORklHPXkKIEJSMl9UQVJHRVRfVUJPT1RfQ1VT
VE9NX1ZFUlNJT049eQotQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAy
MS4wNCIKK0JSMl9UQVJHRVRfVUJPT1RfQ1VTVE9NX1ZFUlNJT05fVkFMVUU9IjIwMjMuMDQiCiBC
UjJfVEFSR0VUX1VCT09UX0JPQVJEX0RFRkNPTkZJRz0ib21hcDVfdWV2bSIKK0JSMl9UQVJHRVRf
VUJPT1RfTkVFRFNfT1BFTlNTTD15CiBCUjJfVEFSR0VUX1VCT09UX0ZPUk1BVF9JTUc9eQogQlIy
X1RBUkdFVF9VQk9PVF9TUEw9eQogQlIyX1RBUkdFVF9VQk9PVF9TUExfTkFNRT0iTUxPIgotLSAK
Mi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
