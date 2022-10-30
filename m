Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE3DECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 12:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7987C4034A;
	Sun, 30 Oct 2022 12:56:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7987C4034A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W_X24WyEX1W9; Sun, 30 Oct 2022 12:56:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B249402E0;
	Sun, 30 Oct 2022 12:56:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B249402E0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D25EF1BF48B
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 12:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB6C04025F
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 12:56:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB6C04025F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id emooWfcG0gAx for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 12:55:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73E234013A
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 73E234013A
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 12:55:59 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 b20-20020a05600c4e1400b003cc28585e2fso6560367wmq.1
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 05:55:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YR0GN8+0TjWEZ+W6LUZzA1DuVw1C3L9tpEZ6ZhQahJ8=;
 b=6aaYNbWSzK4KGErXny2MmLu0f5BRvYW+MJtvauDsFSpNEsdlTiuXxRELRmeS9lxEiu
 Wh7gIW+xauhaCpAluuhXvl4MmBeG+zg8aV0/79EzZNRErHyPM/FOdf8DFld6UqUYUu3M
 Mozod3tVUcIJGlb6+QsPb/xvW+lBTrZ5jIXJoLClGjEz8KiPU7b8W53UoSrjgXcpyK6p
 2iffqWgTbUPRM3yyEnLWBTtXRXTOKlkrAY5GL0KJJpUBLxkiTMCC0gM4zjv4KcMTKlUz
 5k3NLLpw5Z2Gm+LoWiyGb9Pki2psMI2O48lfgcREe8S+nBXqYT3Vwnvw+6NOvQDv4XxK
 ocTg==
X-Gm-Message-State: ACrzQf0c/swZPiyF5dXARX5ntTvruTSiCJoWOFU8sRc8NNbIVJ7IDC5/
 gOUbsdF61iqXWArKk9dbl0rBw/g9r4o=
X-Google-Smtp-Source: AMsMyM7UQt/eALlnUVuX9tEQXAnvvHDXyyXKCe3DSSapoa03A+ODreGgGm+6EwEwgqUl9+uN6LG4tQ==
X-Received: by 2002:a05:600c:46ce:b0:3c6:f243:8d74 with SMTP id
 q14-20020a05600c46ce00b003c6f2438d74mr15303160wmo.166.1667134557320; 
 Sun, 30 Oct 2022 05:55:57 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 m2-20020a5d4a02000000b00236695ff94fsm4153349wrq.34.2022.10.30.05.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 05:55:56 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 13:55:54 +0100
Message-Id: <20221030125554.394467-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YR0GN8+0TjWEZ+W6LUZzA1DuVw1C3L9tpEZ6ZhQahJ8=;
 b=S3KmYwNZXvJEKrjKl37Cd++6z/ELij+7yIB5yXZgYL3kAZlcBeGimjByT3heHJbfoo
 6VpOQpFiCc9Qqykt99KTadRoP8O91lOjbK1WyIA2sB59BsF3DF6H+AKUSPirSIBicSQs
 wSHmnxlUdKP8KjlJnQt4XVCJHsY/DzIa+Ax6WRsoNDJXrWuf3T5X5LT4lgMkj9qup01G
 0UlUUwWL4rUt4CYiuEVLFe3/UJ0bJXmcx8AJ4AeC7qIVAPtevlDuMkGFjSWZ8oBocOqm
 xlwOblz9bYK1LnFfmR8+HJxuOySYr0lrQJd/TQYWZCpR3MkqNekqTfMblL5Z/cKRgLq3
 UoOA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=S3KmYwNZ
Subject: [Buildroot] [PATCH 1/1] package/dahdi-linux: fix build with kernel
 >= 5.18
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSB3aXRoIGtlcm5lbCA+PSA1LjE4IHJhaXNl
ZCBzaW5jZSBidW1wIHRvCnZlcnNpb24gMy4yLjAgaW4gY29tbWl0IDZjYmZlZDBkYmY0M2M1ZTA0
ZTNjYzU0M2I2NDJlM2M5OTZiZmVkOTc6CgovaG9tZS9hdXRvYnVpbGQvYXV0b2J1aWxkL2luc3Rh
bmNlLTAvb3V0cHV0LTEvYnVpbGQvZGFoZGktbGludXgtMy4yLjAvZHJpdmVycy9kYWhkaS93Y3Q0
eHhwL2Jhc2UuYzogSW4gZnVuY3Rpb24g4oCYdDRfYWxsb2NhdGVfYnVmZmVyc+KAmToKL2hvbWUv
YXV0b2J1aWxkL2F1dG9idWlsZC9pbnN0YW5jZS0wL291dHB1dC0xL2J1aWxkL2RhaGRpLWxpbnV4
LTMuMi4wL2RyaXZlcnMvZGFoZGkvd2N0NHh4cC9iYXNlLmM6Mzg2NDoxNzogZXJyb3I6IGltcGxp
Y2l0IGRlY2xhcmF0aW9uIG9mIGZ1bmN0aW9uIOKAmHBjaV9hbGxvY19jb25zaXN0ZW504oCZIFst
V2Vycm9yPWltcGxpY2l0LWZ1bmN0aW9uLWRlY2xhcmF0aW9uXQogMzg2NCB8ICAgICAgICAgYWxs
b2MgPSBwY2lfYWxsb2NfY29uc2lzdGVudCh3Yy0+ZGV2LCBudW1idWZzICogVDRfQkFTRV9TSVpF
KHdjKSAqIDIsCiAgICAgIHwgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+CgpG
aXhlczoKIC0gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3Qub3JnL3Jlc3VsdHMvZGRhY2Q4MDdk
ZGRlYjE2NDllOTU3MjY0YWM1N2JiYTI3ZDliYjQ2MwoKU2lnbmVkLW9mZi1ieTogRmFicmljZSBG
b250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+Ci0tLQogLi4ubGF0aW9uLWlzc3Vl
cy1vbi1saW51eC1rZXJuZWwtNS0xOC0wLnBhdGNoIHwgNTggKysrKysrKysrKysrKysrKysrKwog
MSBmaWxlIGNoYW5nZWQsIDU4IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNr
YWdlL2RhaGRpLWxpbnV4LzAwMDMtRml4ZWQtY29tcGlsYXRpb24taXNzdWVzLW9uLWxpbnV4LWtl
cm5lbC01LTE4LTAucGF0Y2gKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2RhaGRpLWxpbnV4LzAwMDMt
Rml4ZWQtY29tcGlsYXRpb24taXNzdWVzLW9uLWxpbnV4LWtlcm5lbC01LTE4LTAucGF0Y2ggYi9w
YWNrYWdlL2RhaGRpLWxpbnV4LzAwMDMtRml4ZWQtY29tcGlsYXRpb24taXNzdWVzLW9uLWxpbnV4
LWtlcm5lbC01LTE4LTAucGF0Y2gKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAw
MC4uYTg5NmRlZjM3NQotLS0gL2Rldi9udWxsCisrKyBiL3BhY2thZ2UvZGFoZGktbGludXgvMDAw
My1GaXhlZC1jb21waWxhdGlvbi1pc3N1ZXMtb24tbGludXgta2VybmVsLTUtMTgtMC5wYXRjaApA
QCAtMCwwICsxLDU4IEBACitGcm9tIGRiYjQzMTAxYzJhOTIwNWI2NzIyM2IwMDZiZjc1YzI5ZWJh
ZGNlZDkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBQdXNoa2FyIFNpbmdoIDxwc2lu
Z2hAc2FuZ29tYS5jb20+CitEYXRlOiBUdWUsIDIgQXVnIDIwMjIgMTk6NDA6MDAgKzA1MzAKK1N1
YmplY3Q6IFtQQVRDSF0gRml4ZWQgY29tcGlsYXRpb24gaXNzdWVzIG9uIGxpbnV4IGtlcm5lbCA+
PSA1LjE4LjAKKworV2l0aCBrZXJuZWwgNS4xOCBhbmQgaGlnaGVyCitQQ0k6IFJlbW92ZSB0aGUg
ZGVwcmVjYXRlZCAicGNpLWRtYS1jb21wYXQuaCIgQVBJCisKK1RoZSBjb21taXQgd2lsbCBtYWtl
IHN1cmUgdG8gaW1wcGxlbWVudCBwY2kgZG1hIHJlbGF0ZWQgYXBpJ3MKK1tSZXRyaWV2ZWQgZnJv
bToKK2h0dHBzOi8vZ2l0aHViLmNvbS9hc3Rlcmlzay9kYWhkaS1saW51eC9jb21taXQvZGJiNDMx
MDFjMmE5MjA1YjY3MjIzYjAwNmJmNzVjMjllYmFkY2VkOV0KK1NpZ25lZC1vZmYtYnk6IEZhYnJp
Y2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21haWwuY29tPgorLS0tCisgaW5jbHVkZS9k
YWhkaS9rZXJuZWwuaCB8IDMxICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKKyAxIGZp
bGUgY2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKQorCitkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kYWhk
aS9rZXJuZWwuaCBiL2luY2x1ZGUvZGFoZGkva2VybmVsLmgKK2luZGV4IGVkODFlOWUzLi4zNWU5
M2JjNCAxMDA2NDQKKy0tLSBhL2luY2x1ZGUvZGFoZGkva2VybmVsLmgKKysrKyBiL2luY2x1ZGUv
ZGFoZGkva2VybmVsLmgKK0BAIC01OCw2ICs1OCwzNyBAQAorIAorICNpbmNsdWRlIDxsaW51eC9w
b2xsLmg+CisgCisrI2lmIExJTlVYX1ZFUlNJT05fQ09ERSA+PSBLRVJORUxfVkVSU0lPTig1LCAx
OCwgMCkKKysjaW5jbHVkZSA8bGludXgvcGNpLmg+CisrI2luY2x1ZGUgPGxpbnV4L2RtYS1tYXBw
aW5nLmg+CisrCisrc3RhdGljIGlubGluZSB2b2lkICpwY2lfYWxsb2NfY29uc2lzdGVudChzdHJ1
Y3QgcGNpX2RldiAqaHdkZXYsIHNpemVfdCBzaXplLCBkbWFfYWRkcl90ICpkbWFfaGFuZGxlKQor
K3sKKysgICAgcmV0dXJuIGRtYV9hbGxvY19jb2hlcmVudChod2RldiA9PSBOVUxMID8gTlVMTCA6
ICZod2Rldi0+ZGV2LCBzaXplLCBkbWFfaGFuZGxlLCBHRlBfQVRPTUlDKTsKKyt9CisrCisrc3Rh
dGljIGlubGluZSB2b2lkIHBjaV9mcmVlX2NvbnNpc3RlbnQoc3RydWN0IHBjaV9kZXYgKmh3ZGV2
LCBzaXplX3Qgc2l6ZSwgdm9pZCAqdmFkZHIsIGRtYV9hZGRyX3QgZG1hX2hhbmRsZSkKKyt7Cisr
ICAgIGRtYV9mcmVlX2NvaGVyZW50KGh3ZGV2ID09IE5VTEwgPyBOVUxMIDogJmh3ZGV2LT5kZXYs
IHNpemUsIHZhZGRyLCBkbWFfaGFuZGxlKTsKKyt9CisrCisrc3RhdGljIGlubGluZSBkbWFfYWRk
cl90IHBjaV9tYXBfc2luZ2xlKHN0cnVjdCBwY2lfZGV2ICpod2Rldiwgdm9pZCAqcHRyLCBzaXpl
X3Qgc2l6ZSwgaW50IGRpcmVjdGlvbikKKyt7CisrICAgIHJldHVybiBkbWFfbWFwX3NpbmdsZSgm
aHdkZXYtPmRldiwgcHRyLCBzaXplLCAoZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24pZGlyZWN0aW9u
KTsKKyt9CisrCisrc3RhdGljIGlubGluZSB2b2lkIHBjaV91bm1hcF9zaW5nbGUoc3RydWN0IHBj
aV9kZXYgKmh3ZGV2LCBkbWFfYWRkcl90IGRtYV9hZGRyLCBzaXplX3Qgc2l6ZSwgaW50IGRpcmVj
dGlvbikKKyt7CisrICAgIGRtYV91bm1hcF9zaW5nbGUoJmh3ZGV2LT5kZXYsIGRtYV9hZGRyLCBz
aXplLCAoZW51bSBkbWFfZGF0YV9kaXJlY3Rpb24pZGlyZWN0aW9uKTsKKyt9CisrCisrc3RhdGlj
IGlubGluZSBpbnQgcGNpX3NldF9kbWFfbWFzayhzdHJ1Y3QgcGNpX2RldiAqZGV2LCB1NjQgbWFz
aykKKyt7CisrICAgIHJldHVybiBkbWFfc2V0X21hc2soJmRldi0+ZGV2LCBtYXNrKTsKKyt9Cisr
CisrI2VuZGlmCisrCisgI2lmIExJTlVYX1ZFUlNJT05fQ09ERSA+PSBLRVJORUxfVkVSU0lPTigy
LCA2LCAyOSkKKyAjZGVmaW5lIEhBVkVfTkVUX0RFVklDRV9PUFMKKyAjZW5kaWYKLS0gCjIuMzUu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
