Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67AF9C433EF
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 05:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E700A8193E;
	Mon,  9 May 2022 05:30:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VYpWrDByJzTw; Mon,  9 May 2022 05:30:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E44FD81916;
	Mon,  9 May 2022 05:30:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E1B111BF3D0
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 05:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CF1F4400DA
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 05:30:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CdT_Bo6BWwEt for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 05:30:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 311D9400C6
 for <buildroot@buildroot.org>; Mon,  9 May 2022 05:30:44 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id y32so21876684lfa.6
 for <buildroot@buildroot.org>; Sun, 08 May 2022 22:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unikie.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wp+ca/dw/b96EFYKqErQdGNHlqsN/0HJLF1jgdSJB2U=;
 b=G97Af1wY3JcMwMZHmH2/E9LvJHZoZuP5hoR5x/r2k5gRyuATxWfyVnDpeI0o6SVSny
 wAsArZWwDjYSjPaVgEEfAPhl+6CK474SQhwgFq9MgLshL5pOoUvJRjqtqDvmcnBUKSfX
 7gTf1/A9f2460o+reikk56NsN4kttHKjGqzfC5rOgNktq35UmdtlzQgcILdU7rgKoeIa
 mhcJY+6Jq8W02wLBQg2czydKjHgUVtOJuzZOH28eCxJwowKHNe66By0ciiRBCPPPBRo8
 Z83ij4PyPx9fAYlCB+5Nh8Qn+L7kwCsmLcGKASHy7jvfNBZwaNEmRRJNxjMu095M6g5y
 eWdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wp+ca/dw/b96EFYKqErQdGNHlqsN/0HJLF1jgdSJB2U=;
 b=jeg0zlZAp4h9NOCpK11q2REw12HolfknCDpj4wvQda/v0wqjyGt1DxOa7+ML8LjxHA
 jiVNg9VHzI/Zn+nMBowByRxyXQL7YZjM2FHzxEd9phfwAUDgwQSGGIbjaI3jMwDqac4q
 wR85SaJCC7+zyaqOoi7wSv6OMbm3xDZSM5AR5cPmMJsIWy5jvJYK76lonjJtSOGuuRD+
 paIndY7mJwEZ3s65zughr3unnxJg6Qc+Opbq32SsM5Tc5eiHuXZSgAIgBL0/0Dtegb/z
 5h+iRjJ9kwaRPqGo+B4WyWL7/DTUN2KvM+D51GtinovjsVN64QKPFF5ItSIv3Rzg7qYu
 1WaA==
X-Gm-Message-State: AOAM5319ulUFVYAJvwWMra7YqItYH9Osl0aiJ+o3xX6LavO7Uxr2Gb9O
 Xbc2ht0X9sVL7x+sTgE/G19sHkvF2uvj/x+b7RcoQGl4
X-Google-Smtp-Source: ABdhPJxhU5QPfCjAkOfK51vr/Qru/y9ijYE09HeFyuoFsBq+L4+1Rfl8t0uGbNjInbt0ICOmsylDiQ==
X-Received: by 2002:a05:6512:1196:b0:473:be8f:e921 with SMTP id
 g22-20020a056512119600b00473be8fe921mr11710748lfr.242.1652074241929; 
 Sun, 08 May 2022 22:30:41 -0700 (PDT)
Received: from Unikie-T14-Gen-2i.madriguera.foxhound.fi
 (dxtytb4cvnp0n-slf4chy-3.rev.dnainternet.fi.
 [2001:14ba:9c01:e0:515b:3cbf:bd24:c08c])
 by smtp.googlemail.com with ESMTPSA id
 o11-20020ac2494b000000b0047255d2118dsm1815572lfi.188.2022.05.08.22.30.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 22:30:41 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
To: buildroot@buildroot.org
Date: Mon,  9 May 2022 08:30:40 +0300
Message-Id: <20220509053040.1023928-1-jose.pekkarinen@unikie.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/alfred: version bump to 2022.1
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
Cc: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSm9zw6kgUGVra2FyaW5lbiA8am9zZS5wZWtrYXJpbmVuQHVuaWtpZS5j
b20+Ci0tLQogcGFja2FnZS9hbGZyZWQvYWxmcmVkLmhhc2ggfCA2ICsrKy0tLQogcGFja2FnZS9h
bGZyZWQvYWxmcmVkLm1rICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2FsZnJlZC9hbGZyZWQuaGFz
aCBiL3BhY2thZ2UvYWxmcmVkL2FsZnJlZC5oYXNoCmluZGV4IDJkYTdlYjMxYzguLjIxNTNkMTdl
OTAgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvYWxmcmVkL2FsZnJlZC5oYXNoCisrKyBiL3BhY2thZ2Uv
YWxmcmVkL2FsZnJlZC5oYXNoCkBAIC0xLDUgKzEsNSBAQAotIyBGcm9tIGh0dHBzOi8vZG93bmxv
YWRzLm9wZW4tbWVzaC5vcmcvYmF0bWFuL3N0YWJsZS9zb3VyY2VzL2FsZnJlZC9hbGZyZWQtMjAy
Mi4wLnRhci5nei5zaGExCi1zaGExICA4ZTAwNzg5ZDNlMWU1Yzk1OWRkOTg1ODA5ODYxZmY2MjRk
MzcyNjk0ICBhbGZyZWQtMjAyMi4wLnRhci5negorIyBGcm9tIGh0dHBzOi8vZG93bmxvYWRzLm9w
ZW4tbWVzaC5vcmcvYmF0bWFuL3N0YWJsZS9zb3VyY2VzL2FsZnJlZC9hbGZyZWQtMjAyMi4xLnRh
ci5nei5zaGExCitzaGExICAxNGU5MTZiZGE3MDZjY2ZmNTEwZjJlYTAwYmIzMTQzYzU4MmM5ZmYy
ICBhbGZyZWQtMjAyMi4xLnRhci5negogIyBMb2NhbGx5IGNvbXB1dGVkCi1zaGEyNTYgIGFiYmEx
ZGFjNjFlY2NmY2Q2MzI5ZTczMzFkMDU1NWZlY2M5Mzc3NjBmYjM2YzZjZjU1Y2U2YzFkNzUxY2Zk
OTggIGFsZnJlZC0yMDIyLjAudGFyLmd6CitzaGEyNTYgIDNhMGFjMmJiMjZlMGNiM2YyNzMyZDQ4
NzM2NjlhMGEyMmU5ODI1ZThmOWE4ZTdhYmFjOTg2MzYzZjI3NTA5N2YgIGFsZnJlZC0yMDIyLjEu
dGFyLmd6CiBzaGEyNTYgIGNlY2JmNTNkMTE0OGUxMzI1NmFjMjlmOGI5MDA2NTViN2ZjOGRjMTJk
NTk5MzlhOTViYzIzMjNlYTE3NDcwMjUgIExJQ0VOU0VTL3ByZWZlcnJlZC9HUEwtMi4wCmRpZmYg
LS1naXQgYS9wYWNrYWdlL2FsZnJlZC9hbGZyZWQubWsgYi9wYWNrYWdlL2FsZnJlZC9hbGZyZWQu
bWsKaW5kZXggMjRiOTk1NmIxMS4uOWFmMTE5MzFjMSAxMDA2NDQKLS0tIGEvcGFja2FnZS9hbGZy
ZWQvYWxmcmVkLm1rCisrKyBiL3BhY2thZ2UvYWxmcmVkL2FsZnJlZC5tawpAQCAtNCw3ICs0LDcg
QEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjCiAKLUFMRlJFRF9WRVJTSU9OID0gMjAyMi4w
CitBTEZSRURfVkVSU0lPTiA9IDIwMjIuMQogQUxGUkVEX1NJVEUgPSBodHRwczovL2Rvd25sb2Fk
cy5vcGVuLW1lc2gub3JnL2JhdG1hbi9zdGFibGUvc291cmNlcy9hbGZyZWQKIEFMRlJFRF9MSUNF
TlNFID0gR1BMLTIuMAogQUxGUkVEX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFUy9wcmVmZXJyZWQv
R1BMLTIuMAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
