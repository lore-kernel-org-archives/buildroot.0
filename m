Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F23C433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 13:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3522D40B38;
	Sun, 29 May 2022 13:19:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ng-Gf4nELygX; Sun, 29 May 2022 13:19:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D0AF40BD6;
	Sun, 29 May 2022 13:19:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7606B1BF969
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 13:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 735E461100
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 13:18:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id grBPVMb1SLri for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 13:18:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5EB1B60F08
 for <buildroot@buildroot.org>; Sun, 29 May 2022 13:18:23 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id k16so7133282wrg.7
 for <buildroot@buildroot.org>; Sun, 29 May 2022 06:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XqsN3C4F0QpxMIra+6Qeg1nthpYjZXfae0IsDKoivB0=;
 b=d/0Yy5x0VH5RflYeIX7oj2AVYAHAR6SyLDyeQECQbpxSdWK40ruiix/qKVe6BRG0So
 CDcYhMn/ubl3T/QO7RjTBXahWEhQW71duZnT+znW3lpHv0IpOGXVuTs2USfyNMqDdpvU
 4ZQmBGJ0jUkojOgesU9StTga3s9W1//NAtqc5NIxL+1ioAGAXMDJE9wfUU2J+0SaJDAK
 nvkTWaEkJR4hTDEa0LABOMzu8zImtp/imr/Ae80N82lfK5ZMy7fL0GzD82hayJ7EDh5c
 0ikDPeceEamedu9G9P2HL2k4O+PBYFdh2hmXQaMG1uCpLwxRCLBuc13TmNk5ewyXN0iX
 stdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XqsN3C4F0QpxMIra+6Qeg1nthpYjZXfae0IsDKoivB0=;
 b=zO1hWN/lpjhtbeUsTeislzYvJ69i/TuGaihITNKTsut127C8IvyTKxCNWiSpcdPEQ5
 CyhbHFtGdlsrmIrphFbHOs9IIXLq7q2iakqb+6cVm0EGVjdDuXvzMRdH9dg47EtOawS0
 idbAqG17+xSn1KUTPpPLqK9t1LrTl32ZHmgPFr5nW52emHbCHIbgYsyqJP7wghSp/hpe
 HQHO9o846XJvxmpzOSeYw5aW3VH1q8xAnZHmBXP+ByvarIeMemNtHPxy+Bkv0ij76bdT
 lOJKxHw0Ovprv0b8CUkYg4geifjHksSEssNsNlOAv+TIm+siZeVJKUQKvIJIy0iDdM4u
 tjuA==
X-Gm-Message-State: AOAM530HduKEsX2ihbhqiTYKQUUrRPLtt5H8TjRzCabTkCIKIXK0krVS
 zghqegQolIDosE9/nGy6Q0rUtZAv9Ww=
X-Google-Smtp-Source: ABdhPJyNwf/onAeEMIX8SQtd6BccsmVJGx1IIbhKlj4SD1S8Y5MshsG4hpNOVIkcSkN9DUH4rLlG/A==
X-Received: by 2002:a5d:4ccc:0:b0:210:179c:e503 with SMTP id
 c12-20020a5d4ccc000000b00210179ce503mr10141851wrt.151.1653830301613; 
 Sun, 29 May 2022 06:18:21 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a05600c34cf00b003949dbc3790sm7492562wmq.18.2022.05.29.06.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 06:18:21 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 May 2022 15:18:03 +0200
Message-Id: <20220529131811.481017-3-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220529131811.481017-1-romain.naour@gmail.com>
References: <20220529131811.481017-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for-next 03/11] package/gcc: disable
 libsanitizer for mips64{el} w/ n32 ABI
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bGlic2FuaXRpemVyIGhhcyBiZWVuIGVuYWJsZWQgZm9yIG1pcHM2NHtlbH0gaW4gZ2NjIDEyIFsx
XSBidXQgaXQKZmFpbCB0byBidWlsZCB3aGVuIG4zMiBBQkkgaXMgdXNlZDoKCkluIGZpbGUgaW5j
bHVkZWQgZnJvbSBvdXRwdXQvbWlwczY0ZWwtYnVpbGRyb290LWxpbnV4LWdudS9zeXNyb290L3Vz
ci9pbmNsdWRlL2JpdHMvc3RhdC5oOjI1LAogICAgICAgICAgICAgICAgIGZyb20gb3V0cHV0L21p
cHM2NGVsLWJ1aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91c3IvaW5jbHVkZS9mY250bC5oOjc4
LAogICAgICAgICAgICAgICAgIGZyb20gLi4vLi4vLi4vLi4vbGlic2FuaXRpemVyL3Nhbml0aXpl
cl9jb21tb24vc2FuaXRpemVyX2xpbnV4LmNwcDo1NToKb3V0cHV0L21pcHM2NGVsLWJ1aWxkcm9v
dC1saW51eC1nbnUvc3lzcm9vdC91c3IvaW5jbHVkZS9iaXRzL3N0cnVjdF9zdGF0Lmg6MTkwOjg6
IGVycm9yOiByZWRlZmluaXRpb24gb2Yg4oCYc3RydWN0IHN0YXQ2NOKAmQogIDE5MCB8IHN0cnVj
dCBzdGF0NjQKICAgICAgfCAgICAgICAgXn5+fn5+CgpJbiBmaWxlIGluY2x1ZGVkIGZyb20gLi4v
Li4vLi4vLi4vbGlic2FuaXRpemVyL3Nhbml0aXplcl9jb21tb24vc2FuaXRpemVyX2xpbnV4LmNw
cDo0OToKb3V0cHV0L21pcHM2NGVsLWJ1aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91c3IvaW5j
bHVkZS9hc20vc3RhdC5oOjUyOjg6IG5vdGU6IHByZXZpb3VzIGRlZmluaXRpb24gb2Yg4oCYc3Ry
dWN0IHN0YXQ2NOKAmQogICA1MiB8IHN0cnVjdCBzdGF0NjQgewogICAgICB8ICAgICAgICBefn5+
fn4KCkRpc2FibGUgbGlic2FuaXRpemVyIGZvciBtaXBzNjQgd2l0aCBuMzIgQUJJLgoKTm90ZTog
T25seSBnbGliYyB0b29sY2hhaW5zIGFyZSBhZmZlY3RlZCBzaW5jZSBsaWJzYW5pdGl6ZXIgaXMK
ZGlzYWJsZWQgZm9yIG11c2wgYW5kIHVDbGliYy1uZyB0b29sY2hhaW5zIFsyXS4KCkZpeGVzOgpo
dHRwczovL2dpdGxhYi5jb20va3VidTkzL3Rvb2xjaGFpbnMtYnVpbGRlci8tL2pvYnMvMjUxMDE3
ODY1MQoKWzFdIGh0dHBzOi8vZ2NjLmdudS5vcmcvZ2l0Lz9wPWdjYy5naXQ7YT1jb21taXRkaWZm
O2g9MzQ0ZTZmOWYyYWJjZmY5YjJiYjRiMjZiNjkzYmU0YTU5OTI3MmY0MwpbMl0gaHR0cHM6Ly9n
aXQuYnVpbGRyb290Lm5ldC9idWlsZHJvb3QvY29tbWl0Lz9pZD01ZjRkNjU4ZDg4OGI1MzlkZTlh
NjI0N2FlNWIxYTA5OTlkZTVkNGVjCgpTaWduZWQtb2ZmLWJ5OiBSb21haW4gTmFvdXIgPHJvbWFp
bi5uYW91ckBnbWFpbC5jb20+Ci0tLQogcGFja2FnZS9nY2MvZ2NjLm1rIHwgNyArKysrKysrCiAx
IGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9nY2Mv
Z2NjLm1rIGIvcGFja2FnZS9nY2MvZ2NjLm1rCmluZGV4IGI5NDAzMjdjODMuLmUxZjM5MzVlNTYg
MTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZ2NjL2djYy5taworKysgYi9wYWNrYWdlL2djYy9nY2MubWsK
QEAgLTEzOCw2ICsxMzgsMTMgQEAgaWZlcSAoJChCUjJfc3BhcmMpJChCUjJfc3BhcmM2NCkseSkK
IEhPU1RfR0NDX0NPTU1PTl9DT05GX09QVFMgKz0gLS1kaXNhYmxlLWxpYnNhbml0aXplcgogZW5k
aWYKIAorIyBsaWJzYW5pdGl6ZXIgaXMgYXZhaWxhYmxlIGZvciBtaXBzNjR7ZWx9IHNpbmNlIGdj
YyAxMiBidXQgZmFpbCB0byBidWlsZAorIyB3aXRoIG4zMiBBQkkgZHVlIHRvIHN0cnVjdCBzdGF0
NjQgZGVmaW5pdGlvbiBjbGFzaCBkdWUgdG8gbWl4aW5nCisjIGtlcm5lbCBhbmQgdXNlciBoZWFk
ZXJzLgoraWZlcSAoJChCUjJfbWlwczY0KSQoQlIyX21pcHM2NGVsKSQoQlIyX01JUFNfTkFCSTMy
KSx5eSkKK0hPU1RfR0NDX0NPTU1PTl9DT05GX09QVFMgKz0gLS1kaXNhYmxlLWxpYnNhbml0aXpl
cgorZW5kaWYKKwogIyBUaGUgbG9naWMgaW4gbGliYmFja3RyYWNlL2NvbmZpZ3VyZS5hYyB0byBk
ZXRlY3QgaWYgX19zeW5jIGJ1aWx0aW5zCiAjIGFyZSBhdmFpbGFibGUgYXNzdW1lcyB0aGV5IGFy
ZSBhcyBzb29uIGFzIHRhcmdldF9zdWJkaXIgaXMgbm90CiAjIGVtcHR5LCBpLmUgd2hlbiBjcm9z
cy1jb21waWxpbmcuIEhvd2V2ZXIsIHNvbWUgcGxhdGZvcm1zIGRvIG5vdCBoYXZlCi0tIAoyLjM1
LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
