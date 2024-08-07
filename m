Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52C40C52D6F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 01:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1718C60668;
	Wed,  7 Aug 2024 01:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bo1pFW4rXVQh; Wed,  7 Aug 2024 01:36:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22BE360792
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22BE360792;
	Wed,  7 Aug 2024 01:36:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D84421BF2FE
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 01:36:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5C9C40180
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 01:36:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d8bGJGp92lrp for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 01:36:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=salvador.joseluis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4AE83404F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4AE83404F5
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4AE83404F5
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 01:36:31 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-36bb2047bf4so663814f8f.2
 for <buildroot@buildroot.org>; Tue, 06 Aug 2024 18:36:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722994589; x=1723599389;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XE1LVsvpI/8Su6m7phkQi1Fs8VMj4M2V8lb8nSMif/I=;
 b=wRzDfq+PXxVnlFMmnlgd8TbiaB9JiUC3jM6e+UVJ8w8LFMfIdhbjOp+mmhvh3L35A8
 05/aQSaFtZ3pULYnI47SkNKQb4SUrI9GMZS+T3dHNCHNHSzCFJrfCXUaER6XgY9oMRis
 e1umwWpV59Nnk6OYNn6T2HKtPwdKfpfbPrXEObGooawjCxNJyL/xAow+Bwfh1QSF4qPX
 pW6w2m51TXUmlp2zFoarKzZ/KSH2zOU43Ve8nE6Z9I53YGKAzU4Xjppz+zxSGgEwjCU2
 d9X/UEB8SsaAss20E7gUmBk5vPWLp/ENsNHnrvMw1bQX+zsyUgow+VlrX8EZCU2sYMfH
 Ng7A==
X-Gm-Message-State: AOJu0YzRj4PC5ot6lDoxKy4WPczsJiOgWIy2Es3CGOGUg7CP5ETBndhS
 BVgzY+wS3VZmTHjwced18iRuQRG5mUPWqqlsW8oUcsnXV899OLpgyF+kCw==
X-Google-Smtp-Source: AGHT+IHeuH+ujXE5qupE2FSmJV2RhYIq+QRvmFdCqCpOuWpc8DGV3ySq/KPdwBFSptadYj0NPLeT+g==
X-Received: by 2002:a5d:58ca:0:b0:368:7564:5a1d with SMTP id
 ffacd0b85a97d-36bbc10f5dcmr11255490f8f.35.1722994588859; 
 Tue, 06 Aug 2024 18:36:28 -0700 (PDT)
Received: from cuervo.intranet.jlsalvador.online ([78.30.23.54])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36bbcf1db70sm14190064f8f.32.2024.08.06.18.36.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Aug 2024 18:36:28 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  7 Aug 2024 03:34:44 +0200
Message-ID: <20240807013442.1514937-4-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240807013442.1514937-2-salvador.joseluis@gmail.com>
References: <20240807013442.1514937-2-salvador.joseluis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722994589; x=1723599389; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XE1LVsvpI/8Su6m7phkQi1Fs8VMj4M2V8lb8nSMif/I=;
 b=UhRR0SjOeNziuK5i7CCxVbySoa+oT5nDn8s/qimDlbQuNwj5LzNaUqE/0nsY7yJwl3
 1cMog1omI0BNWeAT5nvuP/h7Wbj4S+RClnGmxVC8yKqgCDp37Y3Fbe/7mv1pkCPMuKAx
 8vvtn9sQYv3JKlHS8BPg23CRuW4SV6TtNXqvM3bhEJCZ41QcWRk3s1nm+MilL7RJ9/ES
 PuwNHmuRUoFwvleZO2dzO5++cNCi+mAVzw2NJDW50OZGG2wbyENFCN0yLG5NbvHkxTCK
 OosZ/Sl1P6PzEncX95SVXmHxTBxMB3kv+he9uLhWOVFMQSIZXmptvtBV67y1A0nU7pEy
 MGYg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UhRR0SjO
Subject: [Buildroot] [PATCH 2/2] package/zfs: bump version to 2.2.5
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
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>,
 =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U2lnbmVkLW9mZi1ieTogSm9zw6kgTHVpcyBTYWx2YWRvciBSdWZvIDxzYWx2YWRvci5qb3NlbHVp
c0BnbWFpbC5jb20+Ci0tLQogcGFja2FnZS96ZnMvemZzLmhhc2ggfCAyICstCiBwYWNrYWdlL3pm
cy96ZnMubWsgICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvemZzL3pmcy5oYXNoIGIvcGFja2FnZS96
ZnMvemZzLmhhc2gKaW5kZXggOWM4ZDRjZWM4NS4uOTU5OGFlZDk5MiAxMDA2NDQKLS0tIGEvcGFj
a2FnZS96ZnMvemZzLmhhc2gKKysrIGIvcGFja2FnZS96ZnMvemZzLmhhc2gKQEAgLTEsNSArMSw1
IEBACiAjIEZyb20gaHR0cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3JlbGVhc2VzL2Rvd25s
b2FkL3pmcy0yLjIuNC96ZnMtMi4yLjQuc2hhMjU2LmFzYwotc2hhMjU2ICA5NzkwOTA1Zjc2ODNk
NDE3NTk0MThlMWVmMzQzMjgyOGMzMTExNjY1NGZmMDQwZTkxMzU2ZmYxYzIxYzMxZWMwICB6ZnMt
Mi4yLjQudGFyLmd6CitzaGEyNTYgIDIzODhjZjZmMjljZDc1ZTg3ZDZkMDVlNDg1OGEwOWQ0MTlj
NGY4ODNhNjU4ZDUxZWY1Nzc5NjEyMWNkMDg4OTcgIHpmcy0yLjIuNS50YXIuZ3oKIAogIyBIYXNo
IGZvciBsaWNlbnNlIGZpbGVzOgogc2hhMjU2ICAxZmZiNzBjMzNjNGY3OWYwNGU5NDdmYWNjNWM3
ODUxZjI4OTYwOTI1NmFhY2I0N2ZjMTE1ZjcwMDQyN2Q5NTIwICBMSUNFTlNFCmRpZmYgLS1naXQg
YS9wYWNrYWdlL3pmcy96ZnMubWsgYi9wYWNrYWdlL3pmcy96ZnMubWsKaW5kZXggMzJjNGMwNzgz
OC4uMzJhZjg3ODBiOCAxMDA2NDQKLS0tIGEvcGFja2FnZS96ZnMvemZzLm1rCisrKyBiL3BhY2th
Z2UvemZzL3pmcy5tawpAQCAtNCw3ICs0LDcgQEAKICMKICMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
CiAKLVpGU19WRVJTSU9OID0gMi4yLjQKK1pGU19WRVJTSU9OID0gMi4yLjUKIFpGU19TSVRFID0g
aHR0cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3JlbGVhc2VzL2Rvd25sb2FkL3pmcy0kKFpG
U19WRVJTSU9OKQogWkZTX1NFTElOVVhfTU9EVUxFUyA9IHpmcwogWkZTX0xJQ0VOU0UgPSBDRERM
Ci0tIAoyLjQ2LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6
Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
