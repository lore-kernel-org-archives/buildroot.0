Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FDFC6FA82
	for <buildroot@archiver.kernel.org>; Tue, 27 Sep 2022 10:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 414D240AE1;
	Tue, 27 Sep 2022 10:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 414D240AE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IPDYtLqefxyz; Tue, 27 Sep 2022 10:58:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C84C40574;
	Tue, 27 Sep 2022 10:58:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C84C40574
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D47671BF297
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 10:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 022B24050F
 for <buildroot@lists.busybox.net>; Tue, 27 Sep 2022 10:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 022B24050F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Unm_BRh00Tdw for <buildroot@lists.busybox.net>;
 Tue, 27 Sep 2022 10:58:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CF7C40353
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5CF7C40353
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 10:58:31 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 d12-20020a05600c3acc00b003b4c12e47f3so5205282wms.4
 for <buildroot@buildroot.org>; Tue, 27 Sep 2022 03:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=dGWDlh5UiVIhAp7kLfcNlglBoejiEv0NdZ1qd96OndQ=;
 b=z0YEbvoua0VddHAUVwNcFqCv/svtIJAxuqLbDEVWA1dHooNIAAyvEgja0Dtgj9nW6F
 2MuGi1uikItydMKssRma86dTdNIo8h/y2XTjQ3jJAZ9UTBWsxXnqyPQU6I0RprBcIZBz
 TeOArgaol7v+mW6zVWnhWdsvAWVWLOxDjQaRZ4mpPxToeanzR3SweCvqW9nKeHYxrtIg
 J74DFeOiM7wZkRsVo/6Nd3bzvZbcNloiMkucbPSir8MY/OydXN9M3702/FnipcvVpH1M
 5Cq8Nb/k0tz8AXYpyddmTgpRpquNz5lnYTm7kUfVTfvoiMy68chH6OHRTwAlbj7ThcsU
 ve+Q==
X-Gm-Message-State: ACrzQf0X/myZtMEtnU5XBxCG/mhybt4RIRhW2LTTFmBd7OL/g+83IK6L
 vnfH/NufTl2yJanIw5tMXGRnTVaA5jlPJQ==
X-Google-Smtp-Source: AMsMyM72VMVekcvd4hymSlTtCfsumubyu1/uTk2kP6FyLYQhR0VIKb+NbgoSbWxBnGnbBA8w4EaXrQ==
X-Received: by 2002:a05:600c:3b13:b0:3b4:757d:93a5 with SMTP id
 m19-20020a05600c3b1300b003b4757d93a5mr2144025wms.183.1664276309453; 
 Tue, 27 Sep 2022 03:58:29 -0700 (PDT)
Received: from centennial.enunes.eu (ip-78-45-66-209.bb.vodafone.cz.
 [78.45.66.209]) by smtp.gmail.com with ESMTPSA id
 be10-20020a05600c1e8a00b003b47ff307e1sm1412227wmb.31.2022.09.27.03.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 03:58:28 -0700 (PDT)
From: Erico Nunes <nunes.erico@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Sep 2022 12:58:17 +0200
Message-Id: <20220927105817.760742-1-nunes.erico@gmail.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=dGWDlh5UiVIhAp7kLfcNlglBoejiEv0NdZ1qd96OndQ=;
 b=BFkznztyJrC4JuAgd5J+cxbG7jPv6jft9XNPq0jK0WeXHeGZJ5kcx8NI1/Pfg9HZ0X
 CyQLDjAkSXoYrqK50WBcpz/0KkRlQbWbjjfTnXdndJgbchTu9vWrLvCGj6Jv3kgB7nlC
 FpIHlsuc9qnXNqKOe9cSM3C882eeIfNGbdn2wWztIqyo1M6mz+aeskL4nxKrqGpZWMsN
 1rhVD1yps6PgWKRm0Wgy79HMYGStq7+43nJvDHLJ2LdGJYkxJWr6KO3qdvMm6MUnhHik
 /8F3Ns4HTNwUfjswApOLu+XiYOaHLJyu/eoTBFPXqt6L7fvCcznNWmPnCtceV9fEtMlJ
 vSMA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BFkznzty
Subject: [Buildroot] [PATCH] package/fwts: bump to version 22.09.00
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

U2lnbmVkLW9mZi1ieTogRXJpY28gTnVuZXMgPG51bmVzLmVyaWNvQGdtYWlsLmNvbT4KLS0tCiAu
Li4vZnd0cy8wMDAxLWJ1aWxkLWRvLW5vdC11c2UtV2Vycm9yLnBhdGNoICAgfCAyNiArKysrKysr
KystLS0tLS0tLS0tCiBwYWNrYWdlL2Z3dHMvZnd0cy5oYXNoICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgMiArLQogcGFja2FnZS9md3RzL2Z3dHMubWsgICAgICAgICAgICAgICAgICAgICAgICAg
IHwgIDIgKy0KIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9md3RzLzAwMDEtYnVpbGQtZG8tbm90LXVzZS1XZXJy
b3IucGF0Y2ggYi9wYWNrYWdlL2Z3dHMvMDAwMS1idWlsZC1kby1ub3QtdXNlLVdlcnJvci5wYXRj
aAppbmRleCA3MTVjNGY2M2E1Li5jNmE4NDUzN2VkIDEwMDY0NAotLS0gYS9wYWNrYWdlL2Z3dHMv
MDAwMS1idWlsZC1kby1ub3QtdXNlLVdlcnJvci5wYXRjaAorKysgYi9wYWNrYWdlL2Z3dHMvMDAw
MS1idWlsZC1kby1ub3QtdXNlLVdlcnJvci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTQ4
MWMyZjk5MGZmYTcxZjIwNWQ0YjlkYWYwODIzZTcxMjY5YTdmMyBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gZmViMDUyNzFiNDg0YjE1OGMxNDYxMTgzOWY5NjgxMDllOWNmMzA4MiBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEVyaWNvIE51bmVzIDxudW5lcy5lcmljb0BnbWFp
bC5jb20+CiBEYXRlOiBGcmksIDEyIEF1ZyAyMDE2IDIzOjExOjU2ICswMjAwCiBTdWJqZWN0OiBb
UEFUQ0hdIGZ3dHM6IGRvIG5vdCB1c2UgLVdlcnJvcgpAQCAtMjUsNyArMjUsNyBAQCBTaWduZWQt
b2ZmLWJ5OiBWaW5jZW50IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGxhcG9zdGUubmV0PgogIDQg
ZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogCiBkaWZmIC0t
Z2l0IGEvY29uZmlndXJlLmFjIGIvY29uZmlndXJlLmFjCi1pbmRleCBmNDBjMzY3OC4uMGZmNTAy
NWIgMTAwNjQ0CitpbmRleCBjYTJmNTRlMi4uZWQ1ODRhYmYgMTAwNjQ0CiAtLS0gYS9jb25maWd1
cmUuYWMKICsrKyBiL2NvbmZpZ3VyZS5hYwogQEAgLTEsNSArMSw1IEBACkBAIC0zNiwyNSArMzYs
MjUgQEAgaW5kZXggZjQwYzM2NzguLjBmZjUwMjViIDEwMDY0NAogIAkgIEFDX0NBTk9OSUNBTF9I
T1NUCiAgCSAgQUNfQ09ORklHX01BQ1JPX0RJUihbbTRdKQogZGlmZiAtLWdpdCBhL3NyYy9NYWtl
ZmlsZS5hbSBiL3NyYy9NYWtlZmlsZS5hbQotaW5kZXggY2RhYmIzODYuLjdjMmU1NzMwIDEwMDY0
NAoraW5kZXggM2JiMzVlNWMuLmU5ZmU5MmZlIDEwMDY0NAogLS0tIGEvc3JjL01ha2VmaWxlLmFt
CiArKysgYi9zcmMvTWFrZWZpbGUuYW0KLUBAIC0xMiw3ICsxMiw3IEBAIEFNX0NQUEZMQUdTID0g
XAotIAktSSQodG9wX3NyY2Rpcikvc3JjL2FjcGljYS9zb3VyY2UvY29tcGlsZXIJXAorQEAgLTEz
LDcgKzEzLDcgQEAgQU1fQ1BQRkxBR1MgPSBcCiAgCS1JJCh0b3Bfc3JjZGlyKS9lZmlfcnVudGlt
ZQkJCVwKLSAJLXB0aHJlYWQgYHBrZy1jb25maWcgLS1jZmxhZ3MgZ2xpYi0yLjAgZ2lvLTIuMGAg
XAorIAktSSQodG9wX3NyY2Rpcikvc21jY2NfdGVzdAkJCVwKKyAJLXB0aHJlYWQJCQkJCVwKIC0J
LVdhbGwgLVdlcnJvciAtV2V4dHJhCQkJCVwKLSsJLVdhbGwgLVdleHRyYQkJCQkJXAorKwktV2Fs
bCAtV2V4dHJhCQkJCVwKICAJLVduby1hZGRyZXNzLW9mLXBhY2tlZC1tZW1iZXIJCQlcCiAgCS1X
ZmxvYXQtZXF1YWwgLVdtaXNzaW5nLWRlY2xhcmF0aW9ucwkJXAogIAktV25vLWxvbmctbG9uZyAt
V3JlZHVuZGFudC1kZWNscyAtV3NoYWRvdwlcCiBkaWZmIC0tZ2l0IGEvc3JjL2xpYi9zcmMvTWFr
ZWZpbGUuYW0gYi9zcmMvbGliL3NyYy9NYWtlZmlsZS5hbQotaW5kZXggNTVjNTJiNDEuLjUwZWZh
OTdhIDEwMDY0NAoraW5kZXggZDVkNTNkZDcuLjc2YzQ4ZDRkIDEwMDY0NAogLS0tIGEvc3JjL2xp
Yi9zcmMvTWFrZWZpbGUuYW0KICsrKyBiL3NyYy9saWIvc3JjL01ha2VmaWxlLmFtCi1AQCAtMjUs
NyArMjUsNyBAQCBBTV9DUFBGTEFHUyA9IFwKLSAJYHBrZy1jb25maWcgLS1zaWxlbmNlLWVycm9y
cyAtLWNmbGFncyBqc29uLWNgCVwKLSAJYHBrZy1jb25maWcgLS1jZmxhZ3MgZ2xpYi0yLjAgZ2lv
LTIuMGAgCQlcCitAQCAtMjIsNyArMjIsNyBAQCBBTV9DUFBGTEFHUyA9IFwKKyAJLUkkKHRvcF9z
cmNkaXIpL3NyYy9hY3BpY2Evc291cmNlL2luY2x1ZGUJXAorIAktSSQodG9wX3NyY2Rpcikvc3Jj
L2FjcGljYS9zb3VyY2UvY29tcGlsZXIJXAogIAktRERBVEFST09URElSPVwiJChkYXRhcm9vdGRp
cilcIgkJXAogLQktV2FsbCAtV2Vycm9yIC1XZXh0cmEJCQkJXAogKwktV2FsbCAtV2V4dHJhCQkJ
CQlcCkBAIC02Miw3ICs2Miw3IEBAIGluZGV4IDU1YzUyYjQxLi41MGVmYTk3YSAxMDA2NDQKICAK
ICBwa2dsaWJfTFRMSUJSQVJJRVMgPSBsaWJmd3RzLmxhCiBkaWZmIC0tZ2l0IGEvc3JjL3V0aWxp
dGllcy9NYWtlZmlsZS5hbSBiL3NyYy91dGlsaXRpZXMvTWFrZWZpbGUuYW0KLWluZGV4IDFmYzBm
YzAyLi41MzYxNGUzMyAxMDA2NDQKK2luZGV4IGRlMzhmMDcwLi43ODU5NzVmZiAxMDA2NDQKIC0t
LSBhL3NyYy91dGlsaXRpZXMvTWFrZWZpbGUuYW0KICsrKyBiL3NyYy91dGlsaXRpZXMvTWFrZWZp
bGUuYW0KIEBAIC0xNiw3ICsxNiw3IEBACkBAIC03NSw1ICs3NSw1IEBAIGluZGV4IDFmYzBmYzAy
Li41MzYxNGUzMyAxMDA2NDQKICAKICBiaW5fUFJPR1JBTVMgPSBrZXJuZWxzY2FuCiAtLSAKLTIu
MzAuMgorMi4zNi4xCiAKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnd0cy9md3RzLmhhc2ggYi9wYWNr
YWdlL2Z3dHMvZnd0cy5oYXNoCmluZGV4IDg2MzQ5ODBlMDMuLjYxMmJjNzY4ZGQgMTAwNjQ0Ci0t
LSBhL3BhY2thZ2UvZnd0cy9md3RzLmhhc2gKKysrIGIvcGFja2FnZS9md3RzL2Z3dHMuaGFzaApA
QCAtMSw1ICsxLDUgQEAKICMgSGFzaCBmcm9tOiBodHRwOi8vZnd0cy51YnVudHUuY29tL3JlbGVh
c2UvU0hBMjU2U1VNUwotc2hhMjU2ICAxN2QxZjBiOTYzOWUwZjliMDkyZWQ4MjMzYmUyZDYzZDZj
NDRlYThkMmE3NmJlMGZiNTkwMmNjODY3OTYxMzc0ICBmd3RzLVYyMS4xMS4wMC50YXIuZ3oKK3No
YTI1NiAgZmVlMWMzMjNmYjk3MjVjMmI5OWMzNDhjNDM0ZDYzMTk2MzkxY2FkNjY1NjZkMzRiNDI3
MDdlNTVkMTRkN2YyNSAgZnd0cy1WMjIuMDkuMDAudGFyLmd6CiAKICMgSGFzaCBmb3IgbGljZW5z
ZSBmaWxlCiBzaGEyNTYgIGZiYmVhNzQ4NTU1NjM1ZGQ4YzdlNmUyZjk5Y2RkZDc3OGY1ZWUzZjll
MzUxMDc3NTE4M2JmOTc5OTA3NmU1ZTUgIGRlYmlhbi9jb3B5cmlnaHQKZGlmZiAtLWdpdCBhL3Bh
Y2thZ2UvZnd0cy9md3RzLm1rIGIvcGFja2FnZS9md3RzL2Z3dHMubWsKaW5kZXggNjYzNGNkYzQw
ZS4uYjIwOGFhMGMxNCAxMDA2NDQKLS0tIGEvcGFja2FnZS9md3RzL2Z3dHMubWsKKysrIGIvcGFj
a2FnZS9md3RzL2Z3dHMubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIwogCi1GV1RTX1ZFUlNJT04gPSAyMS4xMS4wMAorRldUU19WRVJTSU9OID0gMjIuMDkuMDAK
IEZXVFNfU09VUkNFID0gZnd0cy1WJChGV1RTX1ZFUlNJT04pLnRhci5negogRldUU19TSVRFID0g
aHR0cDovL2Z3dHMudWJ1bnR1LmNvbS9yZWxlYXNlCiBGV1RTX1NUUklQX0NPTVBPTkVOVFMgPSAw
Ci0tIAoyLjM3LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
