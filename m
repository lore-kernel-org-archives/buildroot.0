Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4011BCD3427
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 12:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0857583BB5;
	Thu,  7 May 2026 12:35:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3uHzMT1SOoA; Thu,  7 May 2026 12:35:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57C7D83BB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778157345;
	bh=ZqRPCaFG2YJJSkYVv9iipMh/AltjFLTJHPxCp6wcR9I=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XYQCCnl24Sjrh/lt0WOKxs36rBBTgmC2srBjPa+RnNhsfveD0z7XDn0oeZgxyfXgT
	 mKOSb1cPcnRZR8ak+RYaQHpKW0WBVH3PktwIW6HnucXiNhN+3ojGmJxzTxLvPS2RW/
	 0ASe/u4Go9RcLzs8JIayhY+y/KQfr1V6m8AFjx7KvKWbNWXtAZqADsIpXLkBuUMhLa
	 rzlKZ3DDqA8TXFPzyQLBq7zPJkJ9O3hpjL+8TjwxuohPkuYQEPpSyjMmmSeFQQd6WL
	 w3xrHpNTgfUhtPNdh/iJDPQN9oE6oAzX/rjfaoVpoiGDi5+WCSC2x4lDLItlVDlsIO
	 0hhrG5voi91IQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57C7D83BB1;
	Thu,  7 May 2026 12:35:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 14153317
 for <buildroot@buildroot.org>; Thu,  7 May 2026 12:35:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EE37660F0C
 for <buildroot@buildroot.org>; Thu,  7 May 2026 12:35:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FfSk6Y-PD6zi for <buildroot@buildroot.org>;
 Thu,  7 May 2026 12:35:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.128.41;
 helo=mail-wm1-f41.google.com; envelope-from=thomas.devoogdt@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1091F60BAA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1091F60BAA
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1091F60BAA
 for <buildroot@buildroot.org>; Thu,  7 May 2026 12:35:42 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-48e56c1bf5dso4966115e9.3
 for <buildroot@buildroot.org>; Thu, 07 May 2026 05:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778157340; x=1778762140;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T5o9bx84dlyOH10KDFVaTMmkoIvkZZPY3H6UiMD3DLY=;
 b=rUrbJaofa+S5EIMOvXs0PmpcKGp853ZOJ1qtP+FEmbll1l4QxefzRx+GN1zYPq4W7T
 Omn4Crk8UwhgUl4B6XtVF4vipRamIVd1X4MSW6PaCvBD8AuF/Jcf3utE4P7MykUHS2eU
 G8f6amcUTgbWwmrHom/QAstHrBqjUfHO64Op87I18jZh2ulBsodcS4/j6C6qfIs0Hdyh
 fLlZzHMHsn44F3S+8S07bTvP694VqKGahowFJDQKVNzCLkwbAeFx1ViypNB7PFfxukHO
 ht5ZoxA2eHmQfRwHX91bW3PuDqIapQcIfCCgwhu2Igc4VqQCz4vDGV8Jl3DQvY+jDFo0
 UB+g==
X-Gm-Message-State: AOJu0YzAUkuIkvj4oOPRJbVuFo3611a9WuN5STCP3Y2oIv8aIZ4jWwo8
 ND5uCzP0fUozJGKQZmnQBtqmxdAzEzseJWk1RdgKzcXx820SAWcDmGMBBdcdEA==
X-Gm-Gg: AeBDiesUBSx4bU0xt9K/pA8BQ/pE1TNh+2USSoA8KqeaNpIBf7SJb6f1aS9WG1uD1Mq
 iAupFjop0B0Uc1qd3lwuRvOLJjiHa6t/Qu5d8U5EkDT+RtzzcRrLbIvmJo0AI7e3NFtwz1rlzhj
 yrLDt0pp3w1hJ7+nNeK0MLHJ+TXv88lD+SR5fOwVRPuZ23b/JDQ8eBU7c2stV1BliUp5SFF2MDM
 zy3WnV2sXBkQNGn630jLoHshuAACQ43xcK14zbF6UvH88996os7xmK5T8ZkyvETKNKcPN5FxnA/
 1ZoU1zL7Binjxw0SxO+sRgkLUgSzx6wMFZuDTeOmvSFd+CcXoGppJwt6dV94aDgeMrthSinxIMg
 C7NiEowlu0mzfeq/EZplH2tkoVcgVk5+0fIEVO37b2McU/m6gO1C+0X6s37qj5MKvPeObJ0lcrb
 0Kk79InJ20KPQyTsKGiCY10FrML2wq0igvIR5hWdrB58aEl1Pnu72T2jrOSnfnFj/fNvjpnkmTR
 cwXxUNmul8g+9MZvm3MBksTzPgIlvrXQzDZhuIusnLSN94fn2+Kca0WFQgUQ0/ZG1+m6TjiVG0g
 pTDiyaWsonDPQ1W4tJs=
X-Received: by 2002:a05:600d:8451:b0:487:219e:42d with SMTP id
 5b1f17b1804b1-48e53f33f08mr81991995e9.11.1778157340115; 
 Thu, 07 May 2026 05:35:40 -0700 (PDT)
Received: from KORLIN44614.barco.com (d528f5fde.static.telenet.be.
 [82.143.95.222]) by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-48e530cda1csm40463855e9.15.2026.05.07.05.35.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2026 05:35:39 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Cc: Petr Vorel <petr.vorel@gmail.com>,
 Devreese Jorik <jorik.devreese@barco.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
Date: Thu,  7 May 2026 14:35:34 +0200
Message-ID: <20260507123534.318763-1-thomas@devoogdt.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=devoogdt.com
Subject: [Buildroot] [PATCH v1] support/kconfig: fix compiler warnings
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

RnJvbTogRGV2cmVlc2UgSm9yaWsgPGpvcmlrLmRldnJlZXNlQGJhcmNvLmNvbT4KCkNvbW1pdCAz
MjQ2MTJkNjhlMDlkMGRiNDRjNTFjNDUxYmM2Yjg3NDY2ZjdmODc0IGZpeGVkIHNldmVyYWwgY29t
cGlsZXIgd2FybmluZ3MsCmJ1dCBhY3R1YWxseSBpbnRyb2R1Y2VkIGEgbmV3IG9uZSBieSBpbmNy
ZWFzaW5nIHRoZSBidWZmZXIgc2l6ZSBpbiBjb25mZGF0YS5jIHRoYXQgZ2V0cyBwYXNzZWQKYWxv
bmcgdG8gZmlsZV93cml0ZV9kZXAgaW4gdXRpbC5jLCBiZWNhdXNlIGJ1ZjIncyBzaXplIHdhc24n
dCBpbmNyZWFzZWQgYWxvbmcgd2l0aCBpdC4KCi4vdXRpbC5jOiBJbiBmdW5jdGlvbiDigJhmaWxl
X3dyaXRlX2RlcOKAmToKLi91dGlsLmM6ODY6MjY6IHdhcm5pbmc6IOKAmCVz4oCZIGRpcmVjdGl2
ZSB3cml0aW5nIDEwIG9yIG1vcmUgYnl0ZXMgaW50byBhIHJlZ2lvbiBvZiBzaXplIGJldHdlZW4g
MSBhbmQgNDA5NyBbLVdmb3JtYXQtb3ZlcmZsb3c9XQogICA4NiB8ICAgICAgICAgc3ByaW50Zihi
dWYyLCAiJXMlcyIsIGRpciwgbmFtZSk7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
IF5+Ci4vdXRpbC5jOjg2Ojk6IG5vdGU6IOKAmHNwcmludGbigJkgb3V0cHV0IDExIG9yIG1vcmUg
Ynl0ZXMgKGFzc3VtaW5nIDQxMDcpIGludG8gYSBkZXN0aW5hdGlvbiBvZiBzaXplIDQwOTcKICAg
ODYgfCAgICAgICAgIHNwcmludGYoYnVmMiwgIiVzJXMiLCBkaXIsIG5hbWUpOwogICAgICB8ICAg
ICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KCkZpeCB0aGlzIGJ5IGluY3Jl
YXNpbmcgdGhlIHNpemUgb2YgYnVmMiB0byBtYXRjaCB0aGUgcGFzc2VkIGJ1ZmZlciBzaXplLgoK
U2lnbmVkLW9mZi1ieTogRGV2cmVlc2UgSm9yaWsgPGpvcmlrLmRldnJlZXNlQGJhcmNvLmNvbT4K
U2lnbmVkLW9mZi1ieTogVGhvbWFzIERldm9vZ2R0IDx0aG9tYXMuZGV2b29nZHRAYmFyY28uY29t
PgotLS0KIHN1cHBvcnQva2NvbmZpZy91dGlsLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9zdXBwb3J0L2tjb25maWcv
dXRpbC5jIGIvc3VwcG9ydC9rY29uZmlnL3V0aWwuYwppbmRleCA4NjY1ZjViYjg5Zi4uYzJlNzk3
OWFjMTUgMTAwNjQ0Ci0tLSBhL3N1cHBvcnQva2NvbmZpZy91dGlsLmMKKysrIGIvc3VwcG9ydC9r
Y29uZmlnL3V0aWwuYwpAQCAtMzUsNyArMzUsNyBAQCBzdHJ1Y3QgZmlsZSAqZmlsZV9sb29rdXAo
Y29uc3QgY2hhciAqbmFtZSkKIGludCBmaWxlX3dyaXRlX2RlcChjb25zdCBjaGFyICpuYW1lKQog
ewogCWNoYXIgKnN0cjsKLQljaGFyIGJ1ZltQQVRIX01BWCsyMF0sIGJ1ZjJbUEFUSF9NQVgrMV0s
IGRpcltQQVRIX01BWCsxXTsKKwljaGFyIGJ1ZltQQVRIX01BWCsyMF0sIGJ1ZjJbUEFUSF9NQVgr
MjBdLCBkaXJbUEFUSF9NQVgrMV07CiAJc3RydWN0IHN5bWJvbCAqc3ltLCAqZW52X3N5bTsKIAlz
dHJ1Y3QgZXhwciAqZTsKIAlzdHJ1Y3QgZmlsZSAqZmlsZTsKLS0gCjIuNDMuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
