Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03CD8103E194
	for <buildroot@archiver.kernel.org>; Wed, 18 Mar 2026 14:58:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2BA960A68;
	Wed, 18 Mar 2026 14:58:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BNfCajFNfrQG; Wed, 18 Mar 2026 14:58:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1EB3608FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773845922;
	bh=PT5+DmXVB2xv/gUX0UiqS7htULnP4AoQX++TfX0MhN4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DwMkNlLavr/BT9wg/Nk6y/Isl3iHYSNoHWOvvjjU25J4AG9920ALXjPuAOr96S6xT
	 vyDPt8PKs8R42sQpZDIXYIZuW52Kk6DfFKGNkvo7eqc8iWXmHerbOih56HY6wwv4TC
	 uzfLJ4Au/8BWJwC+DtbLCtL2vvs+h7XYNi5LSQscdWSYNaWO5/O55zwDRo6eemfuR3
	 9/FDwRpM7P4mdMNXb05wR1rEfc4RDrRpCEdywmvCklQJ77+tJ0Z1/xGgsyMt1F/ufI
	 jfQ8GnjIuQC//f2rJPFiVtiIHmJgULyWoX0ZzYo8p+idi8dIjuMxuLWXlY575U6aLT
	 dEr5wTxmi23IA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1EB3608FB;
	Wed, 18 Mar 2026 14:58:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 92B711AD
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 14:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8459740368
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 14:58:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y4XwdCEPiDor for <buildroot@buildroot.org>;
 Wed, 18 Mar 2026 14:58:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com;
 envelope-from=lazzer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9B11A4007D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B11A4007D
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9B11A4007D
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 14:58:39 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-38bcdda57b0so6877971fa.3
 for <buildroot@buildroot.org>; Wed, 18 Mar 2026 07:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773845917; x=1774450717;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=0rSRRzzjoIr5RG/SEQK7iT1Js5F3fXdluyLWWnu4//o=;
 b=l9BERYAlHZYskglFJVMGbQN0A2G1YkqgWmNedxJPI0LhVYKpi6fFVYsNm1hxdrN9qe
 vF6TVTqcwTyzbzUchVZ+2nAWwR74ULRAlJ/a4iKYdmssGGdCmGEeLxrOCBxrhvEiyJHe
 DfWg+3/34apMGaLYQpQi+puO5AbJuzhgeLbfRo9SfVFTo3kXQ1Yy5P7EmM8IVO+AnC4v
 sokvOPA1bDL+L0Ngvk3DLPjMUqNdtaDGifhSF/v2scEHH6DherfXNaHO8rS4A5Tc/1z5
 lqmU/47xjxOSHL3qmDKz6v1Ju6MCWKG/gt+NG0QScia/9zvGvElaT+2GVVJmgvlSdRzN
 r5PA==
X-Gm-Message-State: AOJu0Yy8k6BFBSnMKEKFscXKE+T6N3RPwdGQycwt7Iu/E69+d+V9wKt2
 ABvwKDHXfX3tnWtx8QG83QZLOPq3wA650m1RUDtI8boXIRxGEw7VSOMNxorDbw==
X-Gm-Gg: ATEYQzzBSMB4mBXzqa6Hyk6nZ34f1cBqudZB+ickMFWTBCQwcWUTSeMQrQvVaD0czgM
 l9vmgPh2vEanI76+c9ADzbfoa3S7swwvnN0YtN71VJKIyKa5zrHMl1e03UkyVxGsugCGtzqNm5K
 u8P0qjEYNUOy1RmWH3Z/TU4o9brxEmUEervwO7uBUVmgkNNR63596R66MrjIZ/8zsUZjTMWGlrZ
 zaoksnCEZzFdcyyo8w4lSIqO94jnDPTLt2NzOaoWf+ujANCKAYy2CdxlRKplu/m344l/SW+iAx0
 oZC6lIIO9Ov0es/8RaCpe7aP18W4yM6xAGfkylt2yDuoKnLqsvaNbCnsrpfEAHdoKPWBSsdxswu
 WKaSbQto6TsKdTuW3y7nu4EwrDKlnDzAlH2bJz5aOgtUI+x+6tyd/pkMKBhOcSznBxBmPIY8SSk
 8TF1oAIYMf2U6SLBxXPwzftCgrDXQmR3t4ReL2BPyhEmowMvzb+ck6YkVEE8aHdQ==
X-Received: by 2002:a05:651c:3243:b0:38a:878b:b56d with SMTP id
 38308e7fff4ca-38bd57f2856mr15513601fa.15.1773845916444; 
 Wed, 18 Mar 2026 07:58:36 -0700 (PDT)
Received: from tollan.addiva.ad (h-46-59-53-207.A259.priv.bahnhof.se.
 [46.59.53.207]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-38bd517df25sm6850761fa.15.2026.03.18.07.58.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Mar 2026 07:58:35 -0700 (PDT)
From: =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
To: buildroot@buildroot.org
Cc: Vadim Kochan <vadim4j@gmail.com>,
 =?UTF-8?q?Mattias=20Walstr=C3=B6m?= <lazzer@gmail.com>
Date: Wed, 18 Mar 2026 15:58:31 +0100
Message-ID: <20260318145831.2940242-1-lazzer@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Wires
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773845917; x=1774450717; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0rSRRzzjoIr5RG/SEQK7iT1Js5F3fXdluyLWWnu4//o=;
 b=DKcecmsEAEju4kQUQ2iOf/JihwzQOMqPv4Ydnpk9mbP2yYt73mQTMU2FBvILyuU6vT
 jZ3Jnp1LYeo01d0MaK/eylQ5EW2fZ3kVAIdarJyQ4NVTF9ix9DcVi3NYcrT1Oat2ldTm
 r0mQA1xPB+iPeIfoZySlh4HuvZfJlDmOCWqt0oa2TcUCR4zE2foVq4eKboiMm3ojGoIy
 8Rx2xYqSoOwP99SPTtvD5MT4GuSgYBNYyOrvfOl+ELp4q2x1mT2esvEMdvcWshanUyKP
 bZOz/RBgDblkqyjQtNpR9bXMi1d/CenlW0BVHV1J+SA5x7kTY+C5LxAGAMesTGCRp2Mq
 huMw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DKcecmsE
Subject: [Buildroot] [PATCH 1/1] package/frr: Bump version to 10.5.3
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rm9yIGNoYW5nZSBsb2csIHNlZToKICBodHRwczovL2dpdGh1Yi5jb20vRlJSb3V0aW5nL2Zyci9y
ZWxlYXNlcy90YWcvZnJyLTEwLjUuMwoKU2lnbmVkLW9mZi1ieTogTWF0dGlhcyBXYWxzdHLDtm0g
PGxhenplckBnbWFpbC5jb20+Ci0tLQogcGFja2FnZS9mcnIvZnJyLmhhc2ggfCAyICstCiBwYWNr
YWdlL2Zyci9mcnIubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZnJyL2Zyci5oYXNoIGIvcGFj
a2FnZS9mcnIvZnJyLmhhc2gKaW5kZXggZTg5YjUwNDJhOS4uMzQ5YzU2ZmMyNCAxMDA2NDQKLS0t
IGEvcGFja2FnZS9mcnIvZnJyLmhhc2gKKysrIGIvcGFja2FnZS9mcnIvZnJyLmhhc2gKQEAgLTEs
NSArMSw1IEBACiAjIExvY2FsbHkgY2FsY3VsYXRlZAotc2hhMjU2ICBmY2RkMWQzMjZiMmViZDFj
YzRiNjA3ZmUxNjgxZDQ3Njg2NTM3MWFjMDAyOGZjNTU5NWE3NWMwMGYzNzAxODllICBmcnItMTAu
NS4xLnRhci5negorc2hhMjU2ICBlY2M5NTAwOWI4OGU2NmRmMmM5MWJlMDJmYmYwYTNlYjhlMWRl
NDM0ZmQ2NTJlMGNiZjQ2ZjE5MTI2ZjcwOGVjICBmcnItMTAuNS4zLnRhci5negogc2hhMjU2ICA3
YmYwNTM5NTdkNmMzOGUzOWEwNmExMTJjNjBmZjM1YjIyOGQzYmQwM2VkYmU4YzlhMDM1MDhiMDUx
MTI4ZDE2ICBDT1BZSU5HCiBzaGEyNTYgIGY5ZTBjMjFmYWY3MzhkYTU4NjI4MWMwYmVhYWQzY2Q1
NjIwNGMxOTA4NWExMGZlMDVlNGQzZDdmOGI1ODYzZDIgIGRvYy9saWNlbnNlcy9CU0QtMi1DbGF1
c2UKIHNoYTI1NiAgYWNhMjk3YjhmZDNhNDNlM2JiMjAwZjFlMmUwNDNjMGRiNmM4OTczMjVmNWZm
N2YyM2Y3NTMwMzAyYTZiZjcxMyAgZG9jL2xpY2Vuc2VzL0JTRC0zLUNsYXVzZQpkaWZmIC0tZ2l0
IGEvcGFja2FnZS9mcnIvZnJyLm1rIGIvcGFja2FnZS9mcnIvZnJyLm1rCmluZGV4IDA0MjgyNDQy
ZmIuLjYxYTM0ZGU0ZDMgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvZnJyL2Zyci5taworKysgYi9wYWNr
YWdlL2Zyci9mcnIubWsKQEAgLTQsNyArNCw3IEBACiAjCiAjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IwogCi1GUlJfVkVSU0lPTiA9IDEwLjUuMQorRlJSX1ZFUlNJT04gPSAxMC41LjMKIEZSUl9TSVRF
ID0gJChjYWxsIGdpdGh1YixGUlJvdXRpbmcsZnJyLGZyci0kKEZSUl9WRVJTSU9OKSkKIEZSUl9M
SUNFTlNFID0gR1BMLTIuMCsKIEZSUl9MSUNFTlNFX0ZJTEVTID0gXAotLSAKMi40My4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
