Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B681D39015
	for <buildroot@archiver.kernel.org>; Wed, 14 Jan 2026 19:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70947812F1;
	Wed, 14 Jan 2026 19:56:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XmrfspFa-VlT; Wed, 14 Jan 2026 19:56:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2AA8D83F2B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768420564;
	bh=g1ppArK0X14Zk+k7t/pP5opvNde11GOYMptTY9EHfCI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VjGPi9V+fHKKX1WTk1eB9A/bFtGBge3YOrj2SVOGYeRW7ZxZnS2Rr2pTXLCOtxWOe
	 zcCrKauDALW2rGgZcF3WJg53c7+0cDexyql3xend7z+iaN/yvNXRx+9MSns3H0Yi+g
	 9kL1aW9OlxyTZADcQ3FWJJcUpUyZiKnyYmrEapBIl2G/Pb57ct2HrOHVvk/FW12ZUq
	 vdDtwtrPLo95PJwiLuDszQYJQ7CMDQohKWBA5PvrxoOL+bXKlHRJ/CE6pW9Mvz5O7d
	 eSgD08c7L46BbCqRTH+H4fSGnED3f6FFmE6lG51lg/UwdwgeCBuDwP/PwWDtLkesOy
	 +xz4fJwzIyaTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AA8D83F2B;
	Wed, 14 Jan 2026 19:56:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id EAFE8232
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C169640AEF
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:55:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5-5r0cHRjGBa for <buildroot@buildroot.org>;
 Wed, 14 Jan 2026 19:55:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.148;
 helo=smtpdh19-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C18E940AF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C18E940AF5
Received: from smtpdh19-1.aruba.it (smtpdh19-1.aruba.it [62.149.155.148])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C18E940AF5
 for <buildroot@buildroot.org>; Wed, 14 Jan 2026 19:55:58 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id g6yBvKnf2clBZg6yCv3IPk; Wed, 14 Jan 2026 20:55:56 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 14 Jan 2026 20:55:52 +0100
Message-ID: <20260114195554.3979278-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260114195554.3979278-1-giulio.benetti@benettiengineering.com>
References: <20260114195554.3979278-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfFNpgAh27HonSyGlllFqCMwpvViZLiqnWMBx+35OnhxeMcpB9hr1LfHxmltLBMZOUdUsODwyhX1CVJ7Og4L2qlw+tUBZriQbjuML9Dq6O4ZPU1jKijF9
 QCyBQjHW3zZr8Z2Wv4ZTl9cGvecRgX7qSfT2Uo15CqBKUrC8pQSoF3WPEMujpzj1oWGjwPM/nM3aOjBgdf3ML5ZLoJRanjYxKR6vZDjxHpD4uwseTUHtt6I/
 IgFz0boyqFQQDKQO6+bp1X++nNntPjgagUWFlqDdUhFlqasUspEVdm/INRaVfcuF9ct+1rZAt7wlyCr7kvxEEQuuRtQlA//dyWfm6A/c84XKzwpL7n0ZwqJm
 2enh0aXEnHA6JnY3VyCqMAmPwjgbKtH54VYXrtSwWd88t9ao9TgaIAUD/2YO1vXAtcOkOT0j0dOYqBoz0lAHuQFdihn+/uVuVm/kJXGt5SSCFO+4hBVPAUxQ
 LfyzRLEq/inlVlwW2LBkiEw5uZzTfAY7xJyIfxmBNlY2Zx7I/PJxn5hlYRMbGwhZoc1BsXEgApjv75cq
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1768420556; bh=DE2HWXsJ933GRipd5QU66IfNXpbA8ZXE+R7ZK0u21DU=;
 h=From:To:Subject:Date:MIME-Version:Content-Type;
 b=PJHYxBWgx64qpTtBJN9NT8RdiUK897FUAPlSyk/yjIGeKOm95VAn9MyZnEzjdx2aL
 WQo6jI13NXAEgI5RftxjD9hGx+8IZWxM51LOcttzBy3eUtzZCXFLVslwBCG7cBivpn
 JjHyPVMsygH91+ILIQeGxHNYyM0Ies9W5M6B0ZKy/8ZyS3VMEBb572/awsxEe7Go+B
 tiACR+B9k+4QKdVV4WxsxU3n6dRzRqZBvfWwZCrkvm0Cl5LgYtbU3vrb9Qdvwv2sPZ
 WtU7faK0v16ggxaBcL80Pp9xckUh3EscQbnQm1IvsjIpPX4G3hzphcD4ro3e+pCC8F
 Z6f/tgorK3p5Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=PJHYxBWg
Subject: [Buildroot] [PATCH 16/17] configs/olimex_a33_olinuxino: bump Linux
 to 6.18.5 and U-Boot to 2026.01
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
Cc: Leon Anavi <leon.anavi@konsulko.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhlIHBhdGNoOgoqIGJ1bXBzIExpbnV4IGtlcm5lbCB0byB2ZXJzaW9uIDYuMTguNQoqIGJ1bXBz
IFUtQm9vdCB0byB2ZXJzaW9uIDIwMjYuMDEKKiBmb3JjZXMgY2hlY2sgaGFzaGVzCiogc3dpdGNo
ZXMgdG8gZXh0bGludXgKClNpZ25lZC1vZmYtYnk6IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVu
ZXR0aUBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgotLS0KIGJvYXJkL29saW1leC9hMzNfb2xpbnV4
aW5vL2Jvb3QuY21kICAgICAgfCAgNSAtLS0tLQogYm9hcmQvb2xpbWV4L2EzM19vbGludXhpbm8v
Z2VuaW1hZ2UuY2ZnICB8IDE3IC0tLS0tLS0tLS0tLS0tLS0tCiBib2FyZC9vbGltZXgvYTMzX29s
aW51eGluby9wb3N0LWJ1aWxkLnNoIHwgIDIgLS0KIGJvYXJkL29saW1leC9hMzNfb2xpbnV4aW5v
L3JlYWRtZS50eHQgICAgfCAgMiArLQogY29uZmlncy9vbGltZXhfYTMzX29saW51eGlub19kZWZj
b25maWcgICB8IDE4ICsrKysrKysrKy0tLS0tLS0tLQogNSBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspLCAzNCBkZWxldGlvbnMoLSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBib2FyZC9vbGlt
ZXgvYTMzX29saW51eGluby9ib290LmNtZAogZGVsZXRlIG1vZGUgMTAwNjQ0IGJvYXJkL29saW1l
eC9hMzNfb2xpbnV4aW5vL2dlbmltYWdlLmNmZwogZGVsZXRlIG1vZGUgMTAwNzU1IGJvYXJkL29s
aW1leC9hMzNfb2xpbnV4aW5vL3Bvc3QtYnVpbGQuc2gKCmRpZmYgLS1naXQgYS9ib2FyZC9vbGlt
ZXgvYTMzX29saW51eGluby9ib290LmNtZCBiL2JvYXJkL29saW1leC9hMzNfb2xpbnV4aW5vL2Jv
b3QuY21kCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCA0NGQ5MjM5YTk0Li4wMDAwMDAw
MDAwCi0tLSBhL2JvYXJkL29saW1leC9hMzNfb2xpbnV4aW5vL2Jvb3QuY21kCisrKyAvZGV2L251
bGwKQEAgLTEsNSArMCwwIEBACi1zZXRlbnYgYm9vdGFyZ3MgY29uc29sZT10dHlTMCwxMTUyMDAg
cm9vdD0vZGV2L21tY2JsazBwMSByb290d2FpdCBwYW5pYz0xMCAke2V4dHJhfQotZXh0NGxvYWQg
bW1jIDAgMHg0OTAwMDAwMCAvYm9vdC8ke2ZkdGZpbGV9Ci1leHQ0bG9hZCBtbWMgMCAweDQ2MDAw
MDAwIC9ib290L3pJbWFnZQotZW52IHNldCBmZHRfaGlnaCBmZmZmZmZmZgotYm9vdHogMHg0NjAw
MDAwMCAtIDB4NDkwMDAwMDAKZGlmZiAtLWdpdCBhL2JvYXJkL29saW1leC9hMzNfb2xpbnV4aW5v
L2dlbmltYWdlLmNmZyBiL2JvYXJkL29saW1leC9hMzNfb2xpbnV4aW5vL2dlbmltYWdlLmNmZwpk
ZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggYjQ4ZTEyYTgzMS4uMDAwMDAwMDAwMAotLS0g
YS9ib2FyZC9vbGltZXgvYTMzX29saW51eGluby9nZW5pbWFnZS5jZmcKKysrIC9kZXYvbnVsbApA
QCAtMSwxNyArMCwwIEBACi1pbWFnZSBzZGNhcmQuaW1nIHsKLQloZGltYWdlIHsKLQl9Ci0KLQlw
YXJ0aXRpb24gdS1ib290IHsKLQkJaW4tcGFydGl0aW9uLXRhYmxlID0gIm5vIgotCQlpbWFnZSA9
ICJ1LWJvb3Qtc3VueGktd2l0aC1zcGwuYmluIgotCQlvZmZzZXQgPSA4SwotCQlzaXplID0gMTAx
NksgIyAxTUIgLSA4S0IKLQl9Ci0KLQlwYXJ0aXRpb24gcm9vdGZzIHsKLQkJcGFydGl0aW9uLXR5
cGUgPSAweDgzCi0JCWltYWdlID0gInJvb3Rmcy5leHQ0IgotCQlzaXplID0gNTEyTQotCX0KLX0K
ZGlmZiAtLWdpdCBhL2JvYXJkL29saW1leC9hMzNfb2xpbnV4aW5vL3Bvc3QtYnVpbGQuc2ggYi9i
b2FyZC9vbGltZXgvYTMzX29saW51eGluby9wb3N0LWJ1aWxkLnNoCmRlbGV0ZWQgZmlsZSBtb2Rl
IDEwMDc1NQppbmRleCBiNDE4MTIwNjUyLi4wMDAwMDAwMDAwCi0tLSBhL2JvYXJkL29saW1leC9h
MzNfb2xpbnV4aW5vL3Bvc3QtYnVpbGQuc2gKKysrIC9kZXYvbnVsbApAQCAtMSwyICswLDAgQEAK
LSMhL2Jpbi9zaAotY3AgJEJJTkFSSUVTX0RJUi9ib290LnNjciAkVEFSR0VUX0RJUi9ib290L2Jv
b3Quc2NyCmRpZmYgLS1naXQgYS9ib2FyZC9vbGltZXgvYTMzX29saW51eGluby9yZWFkbWUudHh0
IGIvYm9hcmQvb2xpbWV4L2EzM19vbGludXhpbm8vcmVhZG1lLnR4dAppbmRleCBiMTkwNjAyMDBj
Li42YWQwZGIyYTk2IDEwMDY0NAotLS0gYS9ib2FyZC9vbGltZXgvYTMzX29saW51eGluby9yZWFk
bWUudHh0CisrKyBiL2JvYXJkL29saW1leC9hMzNfb2xpbnV4aW5vL3JlYWRtZS50eHQKQEAgLTI1
LDcgKzI1LDcgQEAgUmVzdWx0IG9mIHRoZSBidWlsZAogQWZ0ZXIgYnVpbGRpbmcsIHlvdSBzaG91
bGQgZ2V0IGEgdHJlZSBsaWtlIHRoaXM6CiAKIG91dHB1dC9pbWFnZXMvCi3ilJzilIDilIAgYm9v
dC5zY3IKK+KUnOKUgOKUgCBleHRsaW51eAog4pSc4pSA4pSAIHJvb3Rmcy5leHQyCiDilJzilIDi
lIAgcm9vdGZzLmV4dDQgLT4gcm9vdGZzLmV4dDIKIOKUnOKUgOKUgCByb290ZnMudGFyCmRpZmYg
LS1naXQgYS9jb25maWdzL29saW1leF9hMzNfb2xpbnV4aW5vX2RlZmNvbmZpZyBiL2NvbmZpZ3Mv
b2xpbWV4X2EzM19vbGludXhpbm9fZGVmY29uZmlnCmluZGV4IDhjMDUzZWYzZDYuLjE5YTRhYzM3
YjEgMTAwNjQ0Ci0tLSBhL2NvbmZpZ3Mvb2xpbWV4X2EzM19vbGludXhpbm9fZGVmY29uZmlnCisr
KyBiL2NvbmZpZ3Mvb2xpbWV4X2EzM19vbGludXhpbm9fZGVmY29uZmlnCkBAIC0xLDM0ICsxLDM0
IEBACiBCUjJfYXJtPXkKIEJSMl9jb3J0ZXhfYTc9eQotQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9I
RUFERVJTX0NVU1RPTV82XzE9eQorQlIyX1BBQ0tBR0VfSE9TVF9MSU5VWF9IRUFERVJTX0NVU1RP
TV82XzE4PXkKK0JSMl9HTE9CQUxfUEFUQ0hfRElSPSJib2FyZC9vbGltZXgvYXh4LWNvbW1vbi9w
YXRjaGVzIgorQlIyX0RPV05MT0FEX0ZPUkNFX0NIRUNLX0hBU0hFUz15CiBCUjJfVEFSR0VUX0dF
TkVSSUNfSE9TVE5BTUU9IkEzMy1vbGludXhpbm8iCiBCUjJfVEFSR0VUX0dFTkVSSUNfSVNTVUU9
IldlbGNvbWUgdG8gQTMzIE9MaW51WGlubyEiCiBCUjJfVEFSR0VUX0dFTkVSSUNfR0VUVFlfUE9S
VD0idHR5UzAiCi1CUjJfUk9PVEZTX1BPU1RfQlVJTERfU0NSSVBUPSJib2FyZC9vbGltZXgvYTMz
X29saW51eGluby9wb3N0LWJ1aWxkLnNoIgorQlIyX1JPT1RGU19PVkVSTEFZPSJib2FyZC9vbGlt
ZXgvYXh4LWNvbW1vbi9yb290ZnNfb3ZlcmxheSIKIEJSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJ
UFQ9InN1cHBvcnQvc2NyaXB0cy9nZW5pbWFnZS5zaCIKLUJSMl9ST09URlNfUE9TVF9TQ1JJUFRf
QVJHUz0iLWMgYm9hcmQvb2xpbWV4L2EzM19vbGludXhpbm8vZ2VuaW1hZ2UuY2ZnIgorQlIyX1JP
T1RGU19QT1NUX1NDUklQVF9BUkdTPSItYyBib2FyZC9vbGltZXgvYXh4LWNvbW1vbi9nZW5pbWFn
ZS5jZmciCiBCUjJfTElOVVhfS0VSTkVMPXkKIEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX1ZFUlNJ
T049eQotQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iNi4xLjkiCitCUjJf
TElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OX1ZBTFVFPSI2LjE4LjUiCiBCUjJfTElOVVhfS0VS
TkVMX0RFRkNPTkZJRz0ic3VueGkiCiBCUjJfTElOVVhfS0VSTkVMX0RUU19TVVBQT1JUPXkKLUJS
Ml9MSU5VWF9LRVJORUxfSU5UUkVFX0RUU19OQU1FPSJzdW44aS1hMzMtb2xpbnV4aW5vIgorQlIy
X0xJTlVYX0tFUk5FTF9JTlRSRUVfRFRTX05BTUU9ImFsbHdpbm5lci9zdW44aS1hMzMtb2xpbnV4
aW5vIgogQlIyX0xJTlVYX0tFUk5FTF9JTlNUQUxMX1RBUkdFVD15CiBCUjJfVEFSR0VUX1JPT1RG
U19FWFQyPXkKIEJSMl9UQVJHRVRfUk9PVEZTX0VYVDJfND15CiBCUjJfVEFSR0VUX1VCT09UPXkK
IEJSMl9UQVJHRVRfVUJPT1RfQlVJTERfU1lTVEVNX0tDT05GSUc9eQogQlIyX1RBUkdFVF9VQk9P
VF9DVVNUT01fVkVSU0lPTj15Ci1CUjJfVEFSR0VUX1VCT09UX0NVU1RPTV9WRVJTSU9OX1ZBTFVF
PSIyMDIzLjAxIgorQlIyX1RBUkdFVF9VQk9PVF9DVVNUT01fVkVSU0lPTl9WQUxVRT0iMjAyNi4w
MSIKIEJSMl9UQVJHRVRfVUJPT1RfQk9BUkRfREVGQ09ORklHPSJBMzMtT0xpbnVYaW5vIgogQlIy
X1RBUkdFVF9VQk9PVF9ORUVEU19EVEM9eQogQlIyX1RBUkdFVF9VQk9PVF9ORUVEU19QWUxJQkZE
VD15CiBCUjJfVEFSR0VUX1VCT09UX05FRURTX09QRU5TU0w9eQorQlIyX1RBUkdFVF9VQk9PVF9O
RUVEU19HTlVUTFM9eQogQlIyX1RBUkdFVF9VQk9PVF9TUEw9eQogQlIyX1RBUkdFVF9VQk9PVF9T
UExfTkFNRT0idS1ib290LXN1bnhpLXdpdGgtc3BsLmJpbiIKIEJSMl9QQUNLQUdFX0hPU1RfRE9T
RlNUT09MUz15CiBCUjJfUEFDS0FHRV9IT1NUX0dFTklNQUdFPXkKIEJSMl9QQUNLQUdFX0hPU1Rf
TVRPT0xTPXkKLUJSMl9QQUNLQUdFX0hPU1RfVUJPT1RfVE9PTFM9eQotQlIyX1BBQ0tBR0VfSE9T
VF9VQk9PVF9UT09MU19CT09UX1NDUklQVD15Ci1CUjJfUEFDS0FHRV9IT1NUX1VCT09UX1RPT0xT
X0JPT1RfU0NSSVBUX1NPVVJDRT0iYm9hcmQvb2xpbWV4L2EzM19vbGludXhpbm8vYm9vdC5jbWQi
Ci0tIAoyLjQ3LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
