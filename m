Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64042C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 22:31:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D9C1860249
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 22:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D9C1860249
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EDC8425AB;
	Sat,  4 Sep 2021 22:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b4RMQSJDUPJQ; Sat,  4 Sep 2021 22:31:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F39514258D;
	Sat,  4 Sep 2021 22:31:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 837EB1BF391
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 22:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 72B2E4258D
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 22:31:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nitysGuKyLhW for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 22:31:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 75F1042586
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 22:31:20 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id x6so3867125wrv.13
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 15:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QKuXnzWXRHSMbxK0FLkNO2o4oCF2/ofaTvoXz5QHa/0=;
 b=gv7eVsgr0GfETtOVogUkWQ6rtKE8GtrnA7mvtFbJpPMb8FFyMqnJA+nn3nsMGoTgP3
 L+iSrgpesXZpF0HPBCib1N19EwsTLudp8qlDjJDYGwYHC669svQXTWDqdUj4rbLUpmU8
 63AMENt6QsPErHhR8fdMSyPG71PEjIVLae17pX9qIWodkj9Qzr1CavC0jAgB49tLeycw
 lEFt0sd9xYhfM4K9DxWNaH6CpVbQ+VY414V20myrhIOnwUb5jyPLajmK4pp4WWcNKWZj
 VQyYZDBLZ67/+2aLEz15S09df96JBVoDSAKgcJzL6QMn3hipwTT2Y0MYonQ6/Oi780lh
 yQ8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QKuXnzWXRHSMbxK0FLkNO2o4oCF2/ofaTvoXz5QHa/0=;
 b=YvWSa3g7qU9mijr9l1ovx9XFsjnSS/ws1DDEtEj2+gkSmAN9ltq5EHOLXeO8mvSmHe
 Rwf+4unBVtVFMPn/5qrqcmqA8urahjTjgwvHus6sQR/yklKBjmfAf3oGep46alIpuqsa
 bi2GkMQ3Jot/Jr/i/BnwvLVfmtYyxHMY34juLgKHNCt7XHih5lXjSHOD3Uuguu8ASAdp
 FkMQnV71uh0OfBrRsajUstauHOIV0LXJHsRZcC4W1yRBk2+jkNi9gESPvcVdpH5HDLfT
 +MmYaIJ1BMIn1SaZojfKihv7RvqZNKwPxyi0zPkllYUx2DjYX5h+RJhICPfGFMy4aPNl
 FtKA==
X-Gm-Message-State: AOAM530fBzeoSehfk1F54558D8UDh6RYVxuqFv9qLXau19FQhPq+0Ioh
 R71bphezmwlf717LNaXiu780ZaeW6avN3w==
X-Google-Smtp-Source: ABdhPJyZJBhKRSajNXo/7QpwoaSDcG4AvKO6Fye8nI4JfprC/M6F1N7qzPnmow2/VjkUlq947aNVrw==
X-Received: by 2002:adf:9e4d:: with SMTP id v13mr5680986wre.419.1630794678481; 
 Sat, 04 Sep 2021 15:31:18 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id l11sm3429229wrb.15.2021.09.04.15.31.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 15:31:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Sep 2021 00:31:15 +0200
Message-Id: <20210904223115.545819-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libglib2: fix build with glibc >=
 2.34
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Rml4IHRoZSBmb2xsb3dpbmcgYnVpbGQgZmFpbHVyZSB3aXRoIGdsaWJjID49IDIuMzQ6CgouLi9n
bGliL2dzcGF3bi5jOiBJbiBmdW5jdGlvbiAnc2FmZV9jbG9zZWZyb20nOgouLi9nbGliL2dzcGF3
bi5jOjE0OTc6NzogZXJyb3I6IHRvbyBmZXcgYXJndW1lbnRzIHRvIGZ1bmN0aW9uICdjbG9zZV9y
YW5nZScKIDE0OTcgfCAgIGlmIChjbG9zZV9yYW5nZSAobG93ZmQsIEdfTUFYVUlOVCkgIT0gMCAm
JiBlcnJubyA9PSBFTk9TWVMpCiAgICAgIHwgICAgICAgXn5+fn5+fn5+fn4KCkZpeGVzOgogLSBo
dHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5vcmcvcmVzdWx0cy9jYmMwOTEzZmEyY2M0ODZkZWI2
NGIwN2I1YjEzMzQxYTVhOTcwMjVlCgpTaWduZWQtb2ZmLWJ5OiBGYWJyaWNlIEZvbnRhaW5lIDxm
b250YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4KLS0tCiAuLi50bHktdXNlLTMtcGFyYW1ldGVycy1m
b3ItY2xvc2VfcmFuZ2UucGF0Y2ggfCAzMyArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgMzMgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGliZ2xp
YjIvMDAwNC1jb3JyZWN0bHktdXNlLTMtcGFyYW1ldGVycy1mb3ItY2xvc2VfcmFuZ2UucGF0Y2gK
CmRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmdsaWIyLzAwMDQtY29ycmVjdGx5LXVzZS0zLXBhcmFt
ZXRlcnMtZm9yLWNsb3NlX3JhbmdlLnBhdGNoIGIvcGFja2FnZS9saWJnbGliMi8wMDA0LWNvcnJl
Y3RseS11c2UtMy1wYXJhbWV0ZXJzLWZvci1jbG9zZV9yYW5nZS5wYXRjaApuZXcgZmlsZSBtb2Rl
IDEwMDY0NAppbmRleCAwMDAwMDAwMDAwLi5iZmNhNGIxNGVmCi0tLSAvZGV2L251bGwKKysrIGIv
cGFja2FnZS9saWJnbGliMi8wMDA0LWNvcnJlY3RseS11c2UtMy1wYXJhbWV0ZXJzLWZvci1jbG9z
ZV9yYW5nZS5wYXRjaApAQCAtMCwwICsxLDMzIEBACitGcm9tIGI3MTExN2Q4OTQzNGRiODNkMzRi
YzFiOTgxY2EwM2Q0YmUyOTk1NzYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBLaGVt
IFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgorRGF0ZTogVGh1LCA4IEp1bCAyMDIxIDE3OjI2OjQz
IC0wNzAwCitTdWJqZWN0OiBbUEFUQ0hdIGNvcnJlY3RseSB1c2UgMyBwYXJhbWV0ZXJzIGZvciBj
bG9zZV9yYW5nZQorCitsaWJjIGltcGxlbWVudGF0aW9uIGhhcyAzIHBhcmFtZXRlciBlLmcuCito
dHRwczovL3d3dy5mcmVlYnNkLm9yZy9jZ2kvbWFuLmNnaT9xdWVyeT1jbG9zZV9yYW5nZSZzZWt0
aW9uPTImZm9ybWF0PWh0bWwKKworU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdt
YWlsLmNvbT4KKworW1JldHJpZXZlZCBmcm9tOgoraHR0cHM6Ly9naXRsYWIuZ25vbWUub3JnL0dO
T01FL2dsaWIvLS9jb21taXQvYjcxMTE3ZDg5NDM0ZGI4M2QzNGJjMWI5ODFjYTAzZDRiZTI5OTU3
Nl0KK1NpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPgorLS0tCisgZ2xpYi9nc3Bhd24uYyB8IDIgKy0KKyAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKKworZGlmZiAtLWdpdCBhL2dsaWIvZ3NwYXduLmMg
Yi9nbGliL2dzcGF3bi5jCitpbmRleCA4OTk2NDdjMmYuLjMwNzNhMTBhNCAxMDA2NDQKKy0tLSBh
L2dsaWIvZ3NwYXduLmMKKysrKyBiL2dsaWIvZ3NwYXduLmMKK0BAIC0xNTIwLDcgKzE1MjAsNyBA
QCBzYWZlX2Nsb3NlZnJvbSAoaW50IGxvd2ZkKQorICAgICoKKyAgICAqIEhhbmRsZSBFTk9TWVMg
aW4gY2FzZSBpdOKAmXMgc3VwcG9ydGVkIGluIGxpYmMgYnV0IG5vdCB0aGUga2VybmVsOyBpZiBz
bywKKyAgICAqIGZhbGwgYmFjayB0byBzYWZlX2Zkd2FsaygpLiAqLworLSAgaWYgKGNsb3NlX3Jh
bmdlIChsb3dmZCwgR19NQVhVSU5UKSAhPSAwICYmIGVycm5vID09IEVOT1NZUykKKysgIGlmIChj
bG9zZV9yYW5nZSAobG93ZmQsIEdfTUFYVUlOVCwgMCkgIT0gMCAmJiBlcnJubyA9PSBFTk9TWVMp
CisgI2VuZGlmICAvKiBIQVZFX0NMT1NFX1JBTkdFICovCisgICAodm9pZCkgc2FmZV9mZHdhbGsg
KGNsb3NlX2Z1bmMsIEdJTlRfVE9fUE9JTlRFUiAobG93ZmQpKTsKKyAjZW5kaWYKKy0tIAorR2l0
TGFiCisKLS0gCjIuMzMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAbGlzdHMuYnVpbGRyb290
Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJv
b3QK
