Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C518CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 18:02:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB8C4402E7;
	Fri, 13 Oct 2023 18:02:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB8C4402E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bgi-h0bYrVfa; Fri, 13 Oct 2023 18:02:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68AFA404E0;
	Fri, 13 Oct 2023 18:02:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68AFA404E0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D052A1BF326
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A781840901
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 18:02:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A781840901
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xaPOy8kXEVrl for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 18:02:05 +0000 (UTC)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3BB12402E7
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 18:02:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BB12402E7
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40572aeb6d0so24380845e9.1
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 11:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697220123; x=1697824923;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A0k6fwCRfJdjscqiDBnArQ9UzIVEWVMfQdQ76fLJmfk=;
 b=feqH6wt0MHKFEp9WyEVVRc4GhtzqzcUzgFlcs49my5WZSNuDDURCtZwgkykadXJSmG
 W159Gpc8R5v6anYRbgRNvY05yx2QdBrHK5T4WAJrCx0ioVHKvLXjvnL/pJP6xlaU5GMR
 y0hXjmzZwfUntoH0B+N4LJesRSigcmQ6otxeN0MBQAkO36ghJJ+loPs42xBWSbLJUXFk
 bCBy3BDBdMi83+IH7FZfkZNvNivbeoCpEwa7I9Tr5EZgz4A49g+JDr3u0FdScZEPcf1t
 JQwa67Zv/1kl16qnNrqZS2Yg5ievsFfek6P8ETv5i0uveCwxmku52TLU4oAP9kfD+Y+p
 oP9Q==
X-Gm-Message-State: AOJu0Yy/DLBX+Iigosj9YyD4ll/rpg+pY0j8bEQJI3j9vDXYBN04oD4T
 U0Ycvh2Ja/bdf/FGW3vcEJ4Hj9vFsTjoYUrejTrE6nCa
X-Google-Smtp-Source: AGHT+IEA5hhN5AN/CVhUjKLKFEf9oBFDFO2uk3TPzW4ifdsVq1qb8URObkGO25ZuecDhovUCWDpUlg==
X-Received: by 2002:a1c:4b11:0:b0:405:3455:e1a3 with SMTP id
 y17-20020a1c4b11000000b004053455e1a3mr24735617wma.17.1697220122861; 
 Fri, 13 Oct 2023 11:02:02 -0700 (PDT)
Received: from archlinux.. ([2a01:e0a:ce:f2f0:2a6b:35ff:feb8:77d9])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a05600c354900b0040531f5c51asm788860wmq.5.2023.10.13.11.02.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 11:02:02 -0700 (PDT)
From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 20:01:43 +0200
Message-ID: <20231013180145.162565-2-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231013180145.162565-1-gael.portay@rtone.fr>
References: <20231013180145.162565-1-gael.portay@rtone.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rtone.fr; s=google; t=1697220123; x=1697824923; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A0k6fwCRfJdjscqiDBnArQ9UzIVEWVMfQdQ76fLJmfk=;
 b=V0+yARUj9C2YsnerhQ1P9G3A78qa7pMzbpl0QtY002kuJyqlYi4cIt+TVVGDUXwsrU
 WyGmWKzhrPGeZ8kVFYaW/BUNjJt25WGr1/FxvVueWbF9hOIOp7SQl0C96Xu10+Rzj8Nb
 1zGOCaF/e3hyDwV8kwlplDb+bLu0ddsnvBEYs=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=rtone.fr header.i=@rtone.fr
 header.a=rsa-sha256 header.s=google header.b=V0+yARUj
Subject: [Buildroot] [RFC PATCH 1/3] package/rpi-firmware: bump version for
 pi5 support
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
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBidW1wcyB0byA3ZTljMjA2M2ZjMTUyNzRmYmM0ZGFiMWNhNjE0ZjkyMjg4MzRkODgxWzFd
IHRoYXQgc3RhdGVzCiJBZGQgc3VwcG9ydCBmb3IgUEkgNSIsIGFuZCBpdCB1cGRhdGVzIHRoZSBj
b21tZW50cyBvZiBQaTQgdmFyaWFudHMgZm9yClBpNS4KCk5vdGU6IFRoYXQgY29tbWl0IGJ1bXBz
IHRoZSBrZXJuZWwgZmlsZXMgKGltYWdlcywgbW9kdWxlcywgZGV2aWNlLXRyZWVzCmFuZCBkZXZp
Y2UtdHJlZSBvdmVybGF5cykgYnV0IGl0IGRvZXMgbm90IGJ1bXAgdGhlIGJvb3Rsb2FkZXIgZmls
ZXMgZm9yClZDIChzdGFydC5lbGYsIGZpeHVwLmRhdCkuIFRoaXMgYnVtcCBhcHBlYXJzIHRvIG5v
dCBiZSByZWFsbHkgbmVlZGVkIHRvCmJyaW5nIHRoZSBzdXBwb3J0IGZvciB0aGUgUGkgNTsgaXQg
YXNzdW1lcyB0aGUgUGk1J3MgVkM3IHVzZXMgdGhlIGV4YWN0CnNhbWUgZmlsZXMgYXMgdGhlIFBp
NCdzIFZDNiAoaS5lLiBzdGFydDQuZWxmLCBmaXh1cDQuZGF0LCBhbmQgY2QsIHggYW5kCmRlYnVn
IHZhcmlhbnRzKSBhdCBsZWFzdCBmb3Igbm93LgoKWzFdOiBodHRwczovL2dpdGh1Yi5jb20vcmFz
cGJlcnJ5cGkvZmlybXdhcmUvY29tbWl0LzdlOWMyMDYzZmMxNTI3NGZiYzRkYWIxY2E2MTRmOTIy
ODgzNGQ4ODEKClNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXlAcnRvbmUu
ZnI+Ci0tLQogcGFja2FnZS9ycGktZmlybXdhcmUvQ29uZmlnLmluICAgICAgICAgfCAyMiArKysr
KysrKysrKy0tLS0tLS0tLS0tCiBwYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUuaGFz
aCB8ICAyICstCiBwYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUubWsgICB8ICAyICst
CiAzIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvcnBpLWZpcm13YXJlL0NvbmZpZy5pbiBiL3BhY2thZ2UvcnBpLWZp
cm13YXJlL0NvbmZpZy5pbgppbmRleCBhOWFlYWVkNzQ1Li45MGFkMzVmZDNjIDEwMDY0NAotLS0g
YS9wYWNrYWdlL3JwaS1maXJtd2FyZS9Db25maWcuaW4KKysrIGIvcGFja2FnZS9ycGktZmlybXdh
cmUvQ29uZmlnLmluCkBAIC0xNCw5ICsxNCw5IEBAIGlmIEJSMl9QQUNLQUdFX1JQSV9GSVJNV0FS
RQogY29uZmlnIEJSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRV9CT09UQ09ERV9CSU4KIAlib29sICJy
cGkgMC8xLzIvMyBib290Y29kZS5iaW4iCiAJaGVscAotCSAgVGhlIGJvb3Rjb2RlLmJpbiBmb3Ig
dmVyc2lvbnMgWmVyby8xLzIvMyAobm90IG5lZWRlZCBvbiBycGk0LAotCSAgYmVjYXVzZSBpdCBo
YXMgYmVlbiByZXBsYWNlZCBieSBib290IGNvZGUgaW4gdGhlIG9uYm9hcmQKLQkgIEVFUFJPTSku
CisJICBUaGUgYm9vdGNvZGUuYmluIGZvciB2ZXJzaW9ucyBaZXJvLzEvMi8zIChub3QgbmVlZGVk
IG9uCisJICBycGk0LzUsIGJlY2F1c2UgaXQgaGFzIGJlZW4gcmVwbGFjZWQgYnkgYm9vdCBjb2Rl
IGluIHRoZQorCSAgb25ib2FyZCBFRVBST00pLgogCiBjb25maWcgQlIyX1BBQ0tBR0VfUlBJX0ZJ
Uk1XQVJFX1ZBUklBTlRfUEkKIAlib29sICJycGkgMC8xLzIvMyAoZGVmYXVsdCkiCkBAIC00MSwy
NyArNDEsMjcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRV9WQVJJQU5UX1BJX0RC
CiAJICBUaGUgZGVidWcgc2V0IG9mIGZpbGVzIGZvciB2ZXJzaW9ucyBaZXJvLzEvMi8zLgogCiBj
b25maWcgQlIyX1BBQ0tBR0VfUlBJX0ZJUk1XQVJFX1ZBUklBTlRfUEk0Ci0JYm9vbCAicnBpIDQg
KGRlZmF1bHQpIgorCWJvb2wgInJwaSA0LzUgKGRlZmF1bHQpIgogCWhlbHAKLQkgIFRoZSBkZWZh
dWx0IHNldCBvZiBmaWxlcyBmb3IgdmVyc2lvbnMgNCAoc3RhbmRhcmQgR1BVCisJICBUaGUgZGVm
YXVsdCBzZXQgb2YgZmlsZXMgZm9yIHZlcnNpb25zIDQvNSAoc3RhbmRhcmQgR1BVCiAJICBmZWF0
dXJlcykuCiAKIGNvbmZpZyBCUjJfUEFDS0FHRV9SUElfRklSTVdBUkVfVkFSSUFOVF9QSTRfWAot
CWJvb2wgInJwaSA0IChleHRlbmRlZCkiCisJYm9vbCAicnBpIDQvNSAoZXh0ZW5kZWQpIgogCWhl
bHAKLQkgIFRoZSBleHRlbmRlZCBzZXQgb2YgZmlsZXMgZm9yIHZlcnNpb25zIDQgKGFkZGl0aW9u
YWwgR1BVCisJICBUaGUgZXh0ZW5kZWQgc2V0IG9mIGZpbGVzIGZvciB2ZXJzaW9ucyA0LzUgKGFk
ZGl0aW9uYWwgR1BVCiAJICBmZWF0dXJlcywgZWcuIG1vcmUgYXVkaW8vdmlkZW8gY29kZWNzKS4K
IAogY29uZmlnIEJSMl9QQUNLQUdFX1JQSV9GSVJNV0FSRV9WQVJJQU5UX1BJNF9DRAotCWJvb2wg
InJwaSA0IChjdXQtZG93bikiCisJYm9vbCAicnBpIDQvNSAoY3V0LWRvd24pIgogCWhlbHAKLQkg
IFRoZSBjdXQtZG93biBzZXQgb2YgZmlsZXMgZm9yIHZlcnNpb25zIDQgKG9ubHkgZmVhdHVyZXMK
KwkgIFRoZSBjdXQtZG93biBzZXQgb2YgZmlsZXMgZm9yIHZlcnNpb25zIDQvNSAob25seSBmZWF0
dXJlcwogCSAgcmVxdWlyZWQgdG8gYm9vdCBhIExpbnV4IGtlcm5lbCkuCiAKIGNvbmZpZyBCUjJf
UEFDS0FHRV9SUElfRklSTVdBUkVfVkFSSUFOVF9QSTRfREIKLQlib29sICJycGkgNCAoZGVidWcp
IgorCWJvb2wgInJwaSA0LzUgKGRlYnVnKSIKIAloZWxwCi0JICBUaGUgZGVidWcgc2V0IG9mIGZp
bGVzIGZvciB2ZXJzaW9ucyA0LgorCSAgVGhlIGRlYnVnIHNldCBvZiBmaWxlcyBmb3IgdmVyc2lv
bnMgNC81LgogCiBjb25maWcgQlIyX1BBQ0tBR0VfUlBJX0ZJUk1XQVJFX0NPTkZJR19GSUxFCiAJ
c3RyaW5nICJQYXRoIHRvIGEgZmlsZSBzdG9yZWQgYXMgYm9vdC9jb25maWcudHh0IgpkaWZmIC0t
Z2l0IGEvcGFja2FnZS9ycGktZmlybXdhcmUvcnBpLWZpcm13YXJlLmhhc2ggYi9wYWNrYWdlL3Jw
aS1maXJtd2FyZS9ycGktZmlybXdhcmUuaGFzaAppbmRleCBlYzEzMTE1ZjNiLi42NTk2MTM1OTFk
IDEwMDY0NAotLS0gYS9wYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUuaGFzaAorKysg
Yi9wYWNrYWdlL3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUuaGFzaApAQCAtMSwzICsxLDMgQEAK
ICMgTG9jYWxseSBjb21wdXRlZAotc2hhMjU2ICAzM2FlYTJjYjljM2JlOTRjM2RkNmE5NmZiYjM0
NDNlZWU1YWYxZGM1ZmM5MTQwZTFmYWRjNTA4MzI5ODMwNjRlICBycGktZmlybXdhcmUtM2YyMGI4
MzJiMjdjZDczMGRlYjY0MTliNTcwZjMxYTk4MTY3ZWVmNi50YXIuZ3oKK3NoYTI1NiAgZjM0NDJm
YjgwOTY2ZmFmMWUyOGEzMmY5ZDliOTFhY2I0Yjg3YzZmZjMzZjBjZWQ0MTc5ZWM2Y2NiZmE5MmM2
NSAgcnBpLWZpcm13YXJlLTdlOWMyMDYzZmMxNTI3NGZiYzRkYWIxY2E2MTRmOTIyODgzNGQ4ODEu
dGFyLmd6CiBzaGEyNTYgIGM3MjgzZmY1MWY4NjNkOTNhMjc1YzY2ZTNiNGNiMDgwMjFhNWRkNGQ4
YzFlN2FjYzQ3ZDg3MmZiZTUyZDNkNmIgIGJvb3QvTElDRU5DRS5icm9hZGNvbQpkaWZmIC0tZ2l0
IGEvcGFja2FnZS9ycGktZmlybXdhcmUvcnBpLWZpcm13YXJlLm1rIGIvcGFja2FnZS9ycGktZmly
bXdhcmUvcnBpLWZpcm13YXJlLm1rCmluZGV4IDUzZDZkOGNhMDYuLmU3NjVkMGVhODIgMTAwNjQ0
Ci0tLSBhL3BhY2thZ2UvcnBpLWZpcm13YXJlL3JwaS1maXJtd2FyZS5taworKysgYi9wYWNrYWdl
L3JwaS1maXJtd2FyZS9ycGktZmlybXdhcmUubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIwogCi1SUElfRklSTVdBUkVfVkVSU0lPTiA9IDNmMjBiODMyYjI3Y2Q3
MzBkZWI2NDE5YjU3MGYzMWE5ODE2N2VlZjYKK1JQSV9GSVJNV0FSRV9WRVJTSU9OID0gN2U5YzIw
NjNmYzE1Mjc0ZmJjNGRhYjFjYTYxNGY5MjI4ODM0ZDg4MQogUlBJX0ZJUk1XQVJFX1NJVEUgPSAk
KGNhbGwgZ2l0aHViLHJhc3BiZXJyeXBpLGZpcm13YXJlLCQoUlBJX0ZJUk1XQVJFX1ZFUlNJT04p
KQogUlBJX0ZJUk1XQVJFX0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UKIFJQSV9GSVJNV0FSRV9MSUNF
TlNFX0ZJTEVTID0gYm9vdC9MSUNFTkNFLmJyb2FkY29tCi0tIAoyLjQyLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
