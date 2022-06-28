Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B677CC43334
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 21:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24CC7813A5;
	Tue, 28 Jun 2022 21:42:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24CC7813A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7rD_wd0lKjxG; Tue, 28 Jun 2022 21:42:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56B48813B3;
	Tue, 28 Jun 2022 21:42:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56B48813B3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3097D1BF31F
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 21:42:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08EFA401BF
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 21:42:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08EFA401BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oUGyUxCfbTk2 for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 21:41:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91684400E9
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 91684400E9
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 21:41:55 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 be14-20020a05600c1e8e00b003a04a458c54so4386639wmb.3
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 14:41:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ubQvp+23kjUaQM++kpFNNvYBuyeMrLSnuqH/+O/xQ4E=;
 b=rvS1KbfpzMR2ME2A1erdDvxp6tb8GfZh5i+gXSOif6wsOoUL40KNJyh3EfDLQ1CKzt
 uJ5IfAublcAxUwK58b8rAZcv8TfGGIINhzqhu7SEDN+YSyDrjKNp1lGdLZc0BuvXJc49
 amCnbPdOd1C6uuKc7GZl+lta++U1WZwMAFTlSUl8/lNm3trXA2C1ds6hxEUU53Rs0Pw4
 yvniAf6w3NJ7NDlSrGVpAij7vxl1Z4pSfrw9oh1oUM1Ixeay1Og5f1reKbdZ3loazW9A
 K5LgVHPBSqegUoOU1PE+NRP+Xltf8G8u/9LO+dJ9to3RGwQg7GF0fzBeJRPFURFed0HO
 MobA==
X-Gm-Message-State: AJIora9TFpe9Pz4EMfntJSf8VX6Aa1v8LHd6clM3BdGDji6ydOoUqbkM
 uN+1qMOj8jVB97chVNY1Jjz4B4voTBY=
X-Google-Smtp-Source: AGRyM1s6217/sc9SD6NvN4BrDcRVF9DW/+rBKjlEZcpbUuVVFFBdIZoNNbT4pGAKqY1mMmoU/4lOEA==
X-Received: by 2002:a7b:cc99:0:b0:3a0:407b:4a77 with SMTP id
 p25-20020a7bcc99000000b003a0407b4a77mr1878113wma.18.1656452513339; 
 Tue, 28 Jun 2022 14:41:53 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 s8-20020a05600c384800b0039c948dbb61sm815185wmr.26.2022.06.28.14.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 14:41:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 23:39:04 +0200
Message-Id: <20220628213904.2899918-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ubQvp+23kjUaQM++kpFNNvYBuyeMrLSnuqH/+O/xQ4E=;
 b=dVul2kSGgxW/9h3uizSq/fJuYQ5I5kkQZ0LlylooEqCgUzMFudJD5f6qfM2GToh1w2
 8Sw58Filo1ZKokJftEMeVF4KR9YHM2OuKko5hGwbav92LYBLoBsXmN1JeMbJx+mcCOCw
 UtzQUj4+5nN7T0p3v09djq0lwATVpxTrqVVPIdRzglZXC48xl+V80h90Vk0yojXPRf29
 dUnT4BvoZYWHPLm9m0plwcRuL+tRX9/AxxTbBs7487qLC9a7HhXBhSpLK+D/96xBAw8C
 lNA3VlvO6A4gxd1ZKzxqc19YsQACZy8+dbTOdY0dATCrsWwGARfZbUK8XYUfX6IzG9uT
 5PPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dVul2kSG
Subject: [Buildroot] [PATCH 1/1] package/sbc: bump to version 2.0
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RHJvcCBwYXRjaCAoYWxyZWFkeSBpbiB2ZXJzaW9uKQoKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2JsdWV0b290aC9zYmMuZ2l0L3RyZWUvQ2hhbmdlTG9nP2g9Mi4wCgpTaWduZWQtb2Zm
LWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxmb250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KLS0tCiAu
Li4tc2JjX3ByaW1pdGl2ZXMtRml4LWJ1aWxkLW9uLW5vbi14ODYucGF0Y2ggfCA0OSAtLS0tLS0t
LS0tLS0tLS0tLS0tCiBwYWNrYWdlL3NiYy9zYmMuaGFzaCAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMiArLQogcGFja2FnZS9zYmMvc2JjLm1rICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA1MSBkZWxldGlvbnMo
LSkKIGRlbGV0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL3NiYy8wMDAxLXNiY19wcmltaXRpdmVzLUZp
eC1idWlsZC1vbi1ub24teDg2LnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9zYmMvMDAwMS1z
YmNfcHJpbWl0aXZlcy1GaXgtYnVpbGQtb24tbm9uLXg4Ni5wYXRjaCBiL3BhY2thZ2Uvc2JjLzAw
MDEtc2JjX3ByaW1pdGl2ZXMtRml4LWJ1aWxkLW9uLW5vbi14ODYucGF0Y2gKZGVsZXRlZCBmaWxl
IG1vZGUgMTAwNjQ0CmluZGV4IDNlZDczZWJkODguLjAwMDAwMDAwMDAKLS0tIGEvcGFja2FnZS9z
YmMvMDAwMS1zYmNfcHJpbWl0aXZlcy1GaXgtYnVpbGQtb24tbm9uLXg4Ni5wYXRjaAorKysgL2Rl
di9udWxsCkBAIC0xLDQ5ICswLDAgQEAKLUZyb20gOTA5YTliZGY3YWIxNDNlMWYwYmFhZjk3MzZi
YWViZDNjZDc5YWFjZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IE1hcml1cyBCYWtr
ZSA8bWFyaXVzQGdudS5vcmc+Ci1EYXRlOiBUdWUsIDIyIERlYyAyMDIwIDExOjA0OjI2ICswMDAw
Ci1TdWJqZWN0OiBbUEFUQ0hdIHNiY19wcmltaXRpdmVzOiBGaXggYnVpbGQgb24gbm9uLXg4Ni4K
LU1JTUUtVmVyc2lvbjogMS4wCi1Db250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRG
LTgKLUNvbnRlbnQtVHJhbnNmZXItRW5jb2Rpbmc6IDhiaXQKLQotRG9uJ3QgY2FsbCBfX2J1aWx0
aW5fY3B1X2luaXQgdW5sZXNzIHRhcmdldGluZyBpMzg2IG9yIHg4Nl82NC4KLU90aGVyd2lzZSB3
ZSBnZXQgYW4gZXJyb3IgYXQgbGluayB0aW1lOgotCi0gIENDICAgICAgIHNiYy9zYmNfcHJpbWl0
aXZlcy5sbwotc2JjL3NiY19wcmltaXRpdmVzLmM6IEluIGZ1bmN0aW9uIOKAmHNiY19pbml0X3By
aW1pdGl2ZXNfeDg24oCZOgotc2JjL3NiY19wcmltaXRpdmVzLmM6NTk2OjI6IHdhcm5pbmc6IGlt
cGxpY2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmF9fYnVpbHRpbl9jcHVfaW5pdOKAmTsg
ZGlkIHlvdSBtZWFuIOKAmF9fYnVpbHRpbl9pcmludOKAmT8gWy1XaW1wbGljaXQtZnVuY3Rpb24t
ZGVjbGFyYXRpb25dCi1bLi4uXQotICBDQ0xEICAgICBzcmMvc2JjZGVjCi1sZDogc2JjLy5saWJz
L2xpYnNiYy1wcml2YXRlLmEoc2JjX3ByaW1pdGl2ZXMubyk6IGluIGZ1bmN0aW9uIGBzYmNfaW5p
dF9wcmltaXRpdmVzJzoKLXNiY19wcmltaXRpdmVzLmM6KC50ZXh0KzB4M2EzMCk6IHVuZGVmaW5l
ZCByZWZlcmVuY2UgdG8gYF9fYnVpbHRpbl9jcHVfaW5pdCcKLQotU2lnbmVkLW9mZi1ieTogUGll
cnJlLUplYW4gVGV4aWVyIDx0ZXhpZXIucGoyQGdtYWlsLmNvbT4KLVtVcHN0cmVhbSBzdGF0dXM6
IGJhY2twb3J0IGZyb20gdXBzdHJlYW0gY29tbWl0IDkwOWE5YmRmN2FiMTQzZTFmMGJhYWY5NzM2
YmFlYmQzY2Q3OWFhY2ZdCi0KLS0tLQotIHNiYy9zYmNfcHJpbWl0aXZlcy5jIHwgMiArKwotIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKLQotZGlmZiAtLWdpdCBhL3NiYy9zYmNfcHJp
bWl0aXZlcy5jIGIvc2JjL3NiY19wcmltaXRpdmVzLmMKLWluZGV4IDk3YTc1YmUuLjA5YzIxNGEg
MTAwNjQ0Ci0tLS0gYS9zYmMvc2JjX3ByaW1pdGl2ZXMuYwotKysrIGIvc2JjL3NiY19wcmltaXRp
dmVzLmMKLUBAIC01OTMsNiArNTkzLDcgQEAgc3RhdGljIGludCBzYmNfY2FsY19zY2FsZWZhY3Rv
cnNfaigKLSAKLSBzdGF0aWMgdm9pZCBzYmNfaW5pdF9wcmltaXRpdmVzX3g4NihzdHJ1Y3Qgc2Jj
X2VuY29kZXJfc3RhdGUgKnN0YXRlKQotIHsKLSsjaWYgZGVmaW5lZChfX3g4Nl82NF9fKSB8fCBk
ZWZpbmVkKF9faTM4Nl9fKQotIAlfX2J1aWx0aW5fY3B1X2luaXQoKTsKLSAKLSAjaWZkZWYgU0JD
X0JVSUxEX1dJVEhfTU1YX1NVUFBPUlQKLUBAIC02MDQsNiArNjA1LDcgQEAgc3RhdGljIHZvaWQg
c2JjX2luaXRfcHJpbWl0aXZlc194ODYoc3RydWN0IHNiY19lbmNvZGVyX3N0YXRlICpzdGF0ZSkK
LSAJaWYgKF9fYnVpbHRpbl9jcHVfc3VwcG9ydHMoInNzZTQuMiIpKQotIAkJc2JjX2luaXRfcHJp
bWl0aXZlc19zc2Uoc3RhdGUpOwotICNlbmRpZgotKyNlbmRpZgotIH0KLSAKLSAvKgotLS0gCi0y
LjE3LjEKLQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9zYmMvc2JjLmhhc2ggYi9wYWNrYWdlL3NiYy9z
YmMuaGFzaAppbmRleCBiZWIzYjIzMmE4Li5iMDgwYzA2MjA1IDEwMDY0NAotLS0gYS9wYWNrYWdl
L3NiYy9zYmMuaGFzaAorKysgYi9wYWNrYWdlL3NiYy9zYmMuaGFzaApAQCAtMSw1ICsxLDUgQEAK
ICMgRnJvbSBodHRwczovL3d3dy5rZXJuZWwub3JnL3B1Yi9saW51eC9ibHVldG9vdGgvc2hhMjU2
c3Vtcy5hc2MKLXNoYTI1NiAgMGNiYWQ2OTgyM2E5OWU4NDIxZmUwNzAwZThjZjllZWI4ZmEwYzFh
ZDI4ZThkYmMyMTgyYjMzNTM1MDc5MzFkMiAgc2JjLTEuNS50YXIueHoKK3NoYTI1NiAgOGYxMjM2
OGUxZGJiZjU1ZTE0NTM2NTIwNDczY2ZiMzM4Yzg0YjM5MjkzOWNjOWI2NDI5ODM2MGZkNGEwNzk5
MiAgc2JjLTIuMC50YXIueHoKIAogIyBzaGEyNTYgbG9jYWxseSBjb21wdXRlZAogc2hhMjU2ICBi
NDk5ZWRkZWJkYTA1YTg4NTllMzJiODIwYTY0NTc3ZDkxZjFkZTJiNTJlZmEyYTE1NzVhMmNiNDAw
MGJjMjU5ICBDT1BZSU5HCmRpZmYgLS1naXQgYS9wYWNrYWdlL3NiYy9zYmMubWsgYi9wYWNrYWdl
L3NiYy9zYmMubWsKaW5kZXggYWY1Y2YyOTFhMy4uNzQ0Y2U1Zjg5NSAxMDA2NDQKLS0tIGEvcGFj
a2FnZS9zYmMvc2JjLm1rCisrKyBiL3BhY2thZ2Uvc2JjL3NiYy5tawpAQCAtNCw3ICs0LDcgQEAK
ICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLVNCQ19WRVJTSU9OID0gMS41CitTQkNfVkVS
U0lPTiA9IDIuMAogU0JDX1NPVVJDRSA9IHNiYy0kKFNCQ19WRVJTSU9OKS50YXIueHoKIFNCQ19T
SVRFID0gJChCUjJfS0VSTkVMX01JUlJPUikvbGludXgvYmx1ZXRvb3RoCiBTQkNfSU5TVEFMTF9T
VEFHSU5HID0gWUVTCi0tIAoyLjM1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
