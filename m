Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11447C27C55
	for <buildroot@archiver.kernel.org>; Mon, 10 Jun 2024 09:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67ACC408B6;
	Mon, 10 Jun 2024 09:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Grmv7A2r_kuZ; Mon, 10 Jun 2024 09:39:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0145F408A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0145F408A5;
	Mon, 10 Jun 2024 09:39:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4FF561BF3C9
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 09:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E1746062A
 for <buildroot@lists.busybox.net>; Mon, 10 Jun 2024 09:39:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7fG1vhuKP9xV for <buildroot@lists.busybox.net>;
 Mon, 10 Jun 2024 09:39:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CF9156060E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF9156060E
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF9156060E
 for <buildroot@buildroot.org>; Mon, 10 Jun 2024 09:39:41 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a6ef64b092cso241287966b.1
 for <buildroot@buildroot.org>; Mon, 10 Jun 2024 02:39:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718012378; x=1718617178;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bdLTNHO5X45HJNMQrSatYz9YYmRJBDzze5Y2105SC5M=;
 b=dN07nZVVmvS7PAjcWbOGvm66BA404EVknwSvp08c/IUhVZ6Poj+jN1oX9/nCLpGx6W
 D58GZsDWaGH/gecMGlXEt8Mhi3tdPSQFX/dt5tiTZQ/pyzukLuDBtNlAVwMgOIepabVn
 Bg3hp/SpXwJTgMjUvvn689D2ADOCXWQukAT0VzWVAFilXw5zCmKQvbZGdmJ+iGtQEV7d
 D4izMbchAGp+zPKMetVMSg8PhIcXVdJWxB8rM7LiJq+rjG5ZIFQaNXOXhACziyEyMOGs
 ef0/rYD7HLnIEYVxKx0XdLC1L3T6cZnPavlbrrE3fBtf8t3DTMR47vHH/TH1Yhwabbd5
 Avgg==
X-Gm-Message-State: AOJu0YwL8FvQo3zzd1VFZpqD3YhgUJ3DI24OfrzgDFs56BeJc5u+RfsG
 o6OKkn5K0X53m2aj4wrJdH0oQARAfuj2rMMP4Fm3UyzRl0qMC2NpVAObwQ==
X-Google-Smtp-Source: AGHT+IElgXcnOMikJtOdyvApMWP56ijKCHgShbxZTPW7nbI32f21/pi1ZLvlwmAGGbKnTyqAOtUZOw==
X-Received: by 2002:a17:906:81a:b0:a6f:1f6a:1da1 with SMTP id
 a640c23a62f3a-a6f1f6a1e11mr125635366b.41.1718012376989; 
 Mon, 10 Jun 2024 02:39:36 -0700 (PDT)
Received: from development2.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f1f4ed5dfsm110523466b.130.2024.06.10.02.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jun 2024 02:39:36 -0700 (PDT)
From: yegorslists@googlemail.com
To: buildroot@buildroot.org
Date: Mon, 10 Jun 2024 11:38:33 +0200
Message-Id: <20240610093833.1871754-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1718012378; x=1718617178; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bdLTNHO5X45HJNMQrSatYz9YYmRJBDzze5Y2105SC5M=;
 b=I2W00IedXyLOG8uilicT5ceWe45wu3I9t7uQizvAZ4Tb//zwMINQ14HyMSGjQyMTTV
 HDaDU6/7C8RXFGi7p8z/yYs9L+JsMO9h/YGJlaTI6mtMLsQl1GlhqMIZt2aA/2rZGHYz
 OdHynO7XwpBvNa6820iYMnlzFNZ47eTgJqYhOjja4xGSyKc4j8O+1C6gnBqs9gNpi3NQ
 mcuALQb5CIvgqBInvJz37laq1E9hA2s3DjY1FcVtDja8SlDKJOhDdMTf/vq0q7vChCvU
 +jPgLYyH5e/kWdEVHwZa79cGKRtPqtcibzeaI86aegsjfgNF2rZPjdG/B5dP9YoG/Om+
 FT2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=I2W00Ied
Subject: [Buildroot] [PATCH] package/tftpd: bump to latest git commit
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPgoKRml4ZXMg
dGhlIGZvbGxvd2luZyBlcnJvciB3aGVuIGNvbXBpbGVkIGFnYWluc3QgR0NDIDE0Lng6Cgp0ZnRw
LmM6IEluIGZ1bmN0aW9uIOKAmHRmdHBfc2VuZGZpbGXigJk6CnRmdHAuYzo4ODo1OiBlcnJvcjog
aW1wbGljaXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYYnNkX3NpZ25hbOKAmTsgZGlkCnlv
dSBtZWFuIOKAmHNzaWduYWzigJk/IFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQog
ICA4OCB8ICAgICBic2Rfc2lnbmFsKFNJR0FMUk0sIHRpbWVyKTsKICAgICAgfCAgICAgXn5+fn5+
fn5+fgogICAgICB8ICAgICBzc2lnbmFsCnRmdHAuYzo4ODo1OiB3YXJuaW5nOiBuZXN0ZWQgZXh0
ZXJuIGRlY2xhcmF0aW9uIG9mIOKAmGJzZF9zaWduYWzigJkgWy1XbmVzdGVkLWV4dGVybnNdCm1h
aW4uYzogSW4gZnVuY3Rpb24g4oCYbWFpbuKAmToKbWFpbi5jOjMwODo1OiBlcnJvcjogaW1wbGlj
aXQgZGVjbGFyYXRpb24gb2YgZnVuY3Rpb24g4oCYYnNkX3NpZ25hbOKAmTsKZGlkIHlvdSBtZWFu
IOKAmHNzaWduYWzigJk/IFstV2ltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQogIDMwOCB8
ICAgICBic2Rfc2lnbmFsKFNJR0lOVCwgaW50cik7CiAgICAgIHwgICAgIF5+fn5+fn5+fn4KICAg
ICAgfCAgICAgc3NpZ25hbAptYWluLmM6MzA4OjU6IHdhcm5pbmc6IG5lc3RlZCBleHRlcm4gZGVj
bGFyYXRpb24gb2Yg4oCYYnNkX3NpZ25hbOKAmSBbLVduZXN0ZWQtZXh0ZXJuc10KClJlbW92ZSBh
biB1cHN0cmVhbWVkIHBhdGNoLgoKdGZ0cGQvdGZ0cGQuYyBoYXMgY2hhbmdlZCwgaGVuY2UsIGNo
YW5nZSBpdHMgY2hlY2tzdW0uCgpTaWduZWQtb2ZmLWJ5OiBZZWdvciBZZWZyZW1vdiA8eWVnb3Jz
bGlzdHNAZ29vZ2xlbWFpbC5jb20+Ci0tLQogLmNoZWNrcGFja2FnZWlnbm9yZSAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDEgLQogLi4udGVybi1xdWFsaWZpZXItdG8tZml4LWdjYy0xMC54
LWJ1aWxkLnBhdGNoIHwgMjkgLS0tLS0tLS0tLS0tLS0tLS0tLQogcGFja2FnZS90ZnRwZC90ZnRw
ZC5oYXNoICAgICAgICAgICAgICAgICAgICAgIHwgIDQgKy0tCiBwYWNrYWdlL3RmdHBkL3RmdHBk
Lm1rICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKQogZGVsZXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uv
dGZ0cGQvMDAwMS1Vc2UtZXh0ZXJuLXF1YWxpZmllci10by1maXgtZ2NjLTEwLngtYnVpbGQucGF0
Y2gKCmRpZmYgLS1naXQgYS8uY2hlY2twYWNrYWdlaWdub3JlIGIvLmNoZWNrcGFja2FnZWlnbm9y
ZQppbmRleCA4YTIxYjNmMTU1Li5hZWNmMTRiMWUzIDEwMDY0NAotLS0gYS8uY2hlY2twYWNrYWdl
aWdub3JlCisrKyBiLy5jaGVja3BhY2thZ2VpZ25vcmUKQEAgLTE0NjAsNyArMTQ2MCw2IEBAIHBh
Y2thZ2UvdGFza2QvMDAwMi1Vc2UtY29ycmVjdC12YXJpYWJsZXMtZm9yLUdudVRMUy1kZXRlY3Rp
b24ucGF0Y2ggbGliX3BhdGNoLlVwCiBwYWNrYWdlL3Rhc2tkLzAwMDMtQ01ha2VMaXN0cy11c2Ut
cGtnLWNvbmZpZy11dWlkLWRldGVjdGlvbi5wYXRjaCBsaWJfcGF0Y2guVXBzdHJlYW0KIHBhY2th
Z2UvdGNmLWFnZW50L1M1NXRjZi1hZ2VudCBTaGVsbGNoZWNrIGxpYl9zeXN2LlZhcmlhYmxlcwog
cGFja2FnZS90Y2wvMDAwMS1EaXNhYmxlLXRjbC1jb21wYXRpYmlsaXR5LWxheWVycy5wYXRjaCBs
aWJfcGF0Y2guVXBzdHJlYW0KLXBhY2thZ2UvdGZ0cGQvMDAwMS1Vc2UtZXh0ZXJuLXF1YWxpZmll
ci10by1maXgtZ2NjLTEwLngtYnVpbGQucGF0Y2ggbGliX3BhdGNoLlVwc3RyZWFtCiBwYWNrYWdl
L3RmdHBkL1M4MHRmdHBkLWhwYSBTaGVsbGNoZWNrIGxpYl9zeXN2LkluZGVudCBsaWJfc3lzdi5W
YXJpYWJsZXMKIHBhY2thZ2UvdGktZ2Z4LzAwMDEtbmV3Y2xrYXBpLnBhdGNoIGxpYl9wYXRjaC5V
cHN0cmVhbQogcGFja2FnZS90aS1nZngvMDAwMi1maXgtYnVpbGQtb21hcGxmYi1saW51eC5wYXRj
aCBsaWJfcGF0Y2guVXBzdHJlYW0KZGlmZiAtLWdpdCBhL3BhY2thZ2UvdGZ0cGQvMDAwMS1Vc2Ut
ZXh0ZXJuLXF1YWxpZmllci10by1maXgtZ2NjLTEwLngtYnVpbGQucGF0Y2ggYi9wYWNrYWdlL3Rm
dHBkLzAwMDEtVXNlLWV4dGVybi1xdWFsaWZpZXItdG8tZml4LWdjYy0xMC54LWJ1aWxkLnBhdGNo
CmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBjOTY0NTU1MzQ3Li4wMDAwMDAwMDAwCi0t
LSBhL3BhY2thZ2UvdGZ0cGQvMDAwMS1Vc2UtZXh0ZXJuLXF1YWxpZmllci10by1maXgtZ2NjLTEw
LngtYnVpbGQucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwyOSArMCwwIEBACi1Gcm9tIDZmOTk0
MTY2ZDg1NzE5NjFhMDg0Nzk3MzZhZTg2YzViYWEyYmI0N2YgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCi1Gcm9tOiBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29t
PgotRGF0ZTogRnJpLCA3IEF1ZyAyMDIwIDEyOjA3OjQ1ICswMjAwCi1TdWJqZWN0OiBbUEFUQ0hd
IFVzZSAiZXh0ZXJuIiBxdWFsaWZpZXIgdG8gZml4IGdjYyAxMC54IGJ1aWxkCi0KLVBhdGNoIGZy
b20KLWh0dHBzOi8vc3JjLmZlZG9yYXByb2plY3Qub3JnL3JwbXMvdGZ0cC9yYXcvbWFzdGVyL2Yv
dGZ0cC1ocGEtNS4yLWdjYzEwLnBhdGNoLgotCi1TaWduZWQtb2ZmLWJ5OiBUaG9tYXMgUGV0YXp6
b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPgotLS0tCi0gdGZ0cC90ZnRwLmMgfCAy
ICstCi0gMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCi0KLWRp
ZmYgLS1naXQgYS90ZnRwL3RmdHAuYyBiL3RmdHAvdGZ0cC5jCi1pbmRleCBkMTVkYTIyLi5kMDY3
Zjk2IDEwMDY0NAotLS0tIGEvdGZ0cC90ZnRwLmMKLSsrKyBiL3RmdHAvdGZ0cC5jCi1AQCAtNDgs
NyArNDgsNyBAQCBleHRlcm4gaW50IG1heHRpbWVvdXQ7Ci0gI2RlZmluZSBQS1RTSVpFICAgIFNF
R1NJWkUrNAotIGNoYXIgYWNrYnVmW1BLVFNJWkVdOwotIGludCB0aW1lb3V0OwotLXNpZ2ptcF9i
dWYgdG9wbGV2ZWw7Ci0rZXh0ZXJuIHNpZ2ptcF9idWYgdG9wbGV2ZWw7Ci0gc2lnam1wX2J1ZiB0
aW1lb3V0YnVmOwotIAotIHN0YXRpYyB2b2lkIG5hayhpbnQsIGNvbnN0IGNoYXIgKik7Ci0tLSAK
LTIuMjYuMgotCmRpZmYgLS1naXQgYS9wYWNrYWdlL3RmdHBkL3RmdHBkLmhhc2ggYi9wYWNrYWdl
L3RmdHBkL3RmdHBkLmhhc2gKaW5kZXggNjZlNmIwZDI2Yy4uM2ZhYjlkYmEwNyAxMDA2NDQKLS0t
IGEvcGFja2FnZS90ZnRwZC90ZnRwZC5oYXNoCisrKyBiL3BhY2thZ2UvdGZ0cGQvdGZ0cGQuaGFz
aApAQCAtMSw1ICsxLDUgQEAKICMgTG9jYWxseSBjYWxjdWxhdGVkCi1zaGEyNTYgIDBlYjIzY2Vj
YTU0ZWFjMzY0OGNhNDI1NGE0NjY0MjQxNDgzZGRjNmJlZjM2OTU4ZTFjZjIzYmM5OTRkMTU4NjMg
IHRmdHBkLWIyYjM0Y2VjYzhjYmMxOGZmNmYxZmMwMGJkYTZhZTZlOTAxMWU2YzctZ2l0NC50YXIu
Z3oKK3NoYTI1NiAgOWJkYjNlMmFiMmI2OGU0ZDhjZDA1N2QxMDIzOTVjMzYyYmFmMDdjN2IwNTJm
MWQ1ZTQwZTUxOTBhZmVjYzE1ZSAgdGZ0cGQtZTUyYWY0MjA3YTZlMDlhMWJhMjFmNjFkNmY4NWQ4
YjJiMWU2ZWZjMC1naXQ0LnRhci5negogCiAjIEhhc2ggZm9yIGxpY2Vuc2UgZmlsZQotc2hhMjU2
ICA2Nzc1NGViZDhmMjY1NTcxZDMyMjZhYzk3ZTUyMWIxYmQ2ZmQ4YTYxMzYzZWNkNGFiNzgwNmE2
ZjkwZWZhYjkyICB0ZnRwZC90ZnRwZC5jCitzaGEyNTYgIDU5MzZkMDc2NGNiNmU4ZjJmNWNlOGEx
MWMyNDlkODEwMzdiNWYyNzVmNTk4M2U4NTM4ZWU0ZmJlNTcxOTUzNjkgIHRmdHBkL3RmdHBkLmMK
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvdGZ0cGQvdGZ0cGQubWsgYi9wYWNrYWdlL3RmdHBkL3RmdHBk
Lm1rCmluZGV4IGNlYWMyNDExOWUuLjgxYjY3ZjgyY2UgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvdGZ0
cGQvdGZ0cGQubWsKKysrIGIvcGFja2FnZS90ZnRwZC90ZnRwZC5tawpAQCAtNCw3ICs0LDcgQEAK
ICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLVRGVFBEX1ZFUlNJT04gPSBiMmIzNGNlY2M4
Y2JjMThmZjZmMWZjMDBiZGE2YWU2ZTkwMTFlNmM3CitURlRQRF9WRVJTSU9OID0gZTUyYWY0MjA3
YTZlMDlhMWJhMjFmNjFkNmY4NWQ4YjJiMWU2ZWZjMAogVEZUUERfU0lURSA9IGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9uZXR3b3JrL3RmdHAvdGZ0cC1ocGEuZ2l0CiBURlRQRF9TSVRF
X01FVEhPRCA9IGdpdAogVEZUUERfQ09ORl9PUFRTID0gLS13aXRob3V0LXRjcHdyYXBwZXJzCi0t
IAoyLjM0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9s
aXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
