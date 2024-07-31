Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31188C3DA7F
	for <buildroot@archiver.kernel.org>; Wed, 31 Jul 2024 12:04:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D299A405A3;
	Wed, 31 Jul 2024 12:04:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j8sSmsrShGtQ; Wed, 31 Jul 2024 12:04:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D9D640290
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D9D640290;
	Wed, 31 Jul 2024 12:04:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F9091BF23C
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 12:04:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08D144038E
 for <buildroot@lists.busybox.net>; Wed, 31 Jul 2024 12:04:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5rpVCRlUdOTI for <buildroot@lists.busybox.net>;
 Wed, 31 Jul 2024 12:04:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B9C2940340
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9C2940340
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9C2940340
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 12:04:32 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-428035c0bb2so4893735e9.1
 for <buildroot@buildroot.org>; Wed, 31 Jul 2024 05:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722427470; x=1723032270;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GkpBBXM0x3zyEk1JF9YnTnU2+B+4yV7Lpx4fn/Ja4Ac=;
 b=csZ66CAlq/S40xu+R6l7grCYy90R0aHN02A5NYGWlBlDDU61jAI+ka9pgSeJUuz+N2
 d9g1K/wygpuONR+ySnUYxSGb9mFwy6ubXgxXo8L0Pyqq9FLYuu88CUZ8wcMy63ezISqn
 n2m2ztVl7d3nDt9zydcTrguwZ9xLKLlJON1xxVjiqorO5cYsnS4E3n8IH6x+wnp0w6vf
 C6ffqT6wl6E523P1JtNON9a4UFkxoTa1svPDCRchLg4Srcbi5Mh5QJRP9lKE75zYxhUd
 7Jsi1m5zAbDHCpKLvbal9azbxtaT7Iud/WZmgtox5DAn5ddebyhvxQ/jOZ9kwhNoXQ4r
 /8rw==
X-Gm-Message-State: AOJu0Yyi1e+Zyc/toDYjFwEiciUrQ+m1XkC+QRWIZ7en1t4p5t7kwX1+
 pcQYDGh0vmNaGfRQWrtzf8y7rkaL0glSHAivDVsAGcmofsa4kKKrkgjJEduKRkq80A==
X-Google-Smtp-Source: AGHT+IEMQKXCgQ6V3oyjMR/FbpIX0H4lszBqvVE2IgqpEwW8fgaSqa85n2oQ+sRtF8QJwjmJ1beHLw==
X-Received: by 2002:a05:6000:196e:b0:367:938f:550 with SMTP id
 ffacd0b85a97d-36b8c905b06mr3284220f8f.25.1722427469946; 
 Wed, 31 Jul 2024 05:04:29 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:3a7c:76ff:fe01:6f05])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4282bac614esm18467015e9.24.2024.07.31.05.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 05:04:29 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Wed, 31 Jul 2024 14:04:24 +0200
Message-ID: <20240731120426.307069-1-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722427470; x=1723032270; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GkpBBXM0x3zyEk1JF9YnTnU2+B+4yV7Lpx4fn/Ja4Ac=;
 b=WD+z6qjFEdXZ38O7lo4uCKvaN2FGGgzp/JIxNnkfwwgxKzgQwmFvz09hv7ovSbLHNi
 rVNby+rEfI8NZIF7eyvzxzHVM4WuG2Sxqs0yoYBCQLXzHqYz08by5sOv5GEZE6JoRmoM
 yNNByV7xsBqLgwdMkZ/B1rF2OrdRrBaSyI+G5/E33iySMoD+t0Q4CJK0JXLYfG7ZvEfh
 8Zd2tA/FNO5hRX23jMXBnOfzAVrivOPFqwz1sWiENEXISCYO0ifCidnjsyhkRWCCue+0
 6XCYpbwcL66xUzLy9/qC3pL0mxw7Iq66gDtamAmbf5FkFOownDO4a3Z6LbkOUrN2WKqE
 T4Jg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WD+z6qjF
Subject: [Buildroot] [PATCH v3 0/2] rpi-utils replaces rpi-userland
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
 Samuel Martin <s.martin49@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8sCgpUaGUgcGFja2FnZSBycGktdXNlcmxhbmQgaGFzIGJlZW4gbWFya2VkIGFzIGFuY2ll
bnQgYW5kIGRlcHJlY2F0ZWRbMV0KbmluZS1tb250aCBhZ28uCgpUaGlzIHBhdGNoIHNlcmllcyBh
ZGRzIGl0cyByZXBsYWNpbmcgcGFja2FnZSBycGktdXRpbHMgKGZpcnN0IHBhdGNoKSwKYW5kIGl0
IGFkZHMgdGhlIG1lc3NhZ2UgaW4gdGhlIHJwaS11c2VybGFuZCBoZWxwIChzZWNvbmQgcGF0Y2gp
LgoKVGVsbCBtZSBpZiB0aGUgcGFja2FnZSBzaG91bGQgZ28gaW4gdGhlIGxlZ2FjeSB0aGluZy4K
ClsxXTogaHR0cHM6Ly9naXRodWIuY29tL3Jhc3BiZXJyeXBpL3VzZXJsYW5kL2NvbW1pdC85NmE3
MzM0YWU5ZDVmYzlkYjdhYzkyZTU5ODUyMzc3ZGY2M2YxODQ4CgpDaGFuZ2VzIHNpbmNlIHYxOgog
LSBBZGQgbXlzZWxmIHRvIERFVkVMT1BFUlMgKHJwaS11dGlscykKIC0gQWRkIG1pc3NpbmcgZW50
cnkgaW4gcGFja2FnZXMvQ29uZmlnLmluIChycGktdXRpbHMpCiAtIEFkZCBuZWVkZWQgY29tbWVu
dCBmb3IgZ2xpYmMvbXVzbCB0b29sY2hhaW5zIHdpdGggZHluYW1pYyBsaWJyYXJ5CiAgIChycGkt
dXRpbHMpCiAtIEFkZCBkZXBlbmRzIG9uICFCUjJfVE9PTENIQUlOX1VTRVNfVUNMSUJDIChycGkt
dXRpbHMpCgpDaGFuZ2VzIHNpbmNlIHYyOgogLSBSZW1vdmUgZGVwZW5kcyBvbiAhQlIyX1RPT0xD
SEFJTl9VU0VTX1VDTElCQwoKUmVnYXJkcywKR2HDq2wgUE9SVEFZICgyKToKICBwYWNrYWdlL3Jw
aS11dGlsczogbmV3IHBhY2thZ2UKICBwYWNrYWdlL3JwaS11c2VybGFuZDogcGFja2FnZSBpcyBk
ZXByZWNhdGVkCgogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgfCAgMyArKysKIHBh
Y2thZ2UvQ29uZmlnLmluICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9ycGktdXNlcmxh
bmQvQ29uZmlnLmluICAgfCAxMSArKysrKysrKysrKwogcGFja2FnZS9ycGktdXRpbHMvQ29uZmln
LmluICAgICAgfCAxMiArKysrKysrKysrKysKIHBhY2thZ2UvcnBpLXV0aWxzL3JwaS11dGlscy5o
YXNoIHwgIDMgKysrCiBwYWNrYWdlL3JwaS11dGlscy9ycGktdXRpbHMubWsgICB8IDE4ICsrKysr
KysrKysrKysrKysrKwogNiBmaWxlcyBjaGFuZ2VkLCA0OCBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS9ycGktdXRpbHMvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2
NDQgcGFja2FnZS9ycGktdXRpbHMvcnBpLXV0aWxzLmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL3JwaS11dGlscy9ycGktdXRpbHMubWsKCi0tIAoyLjQ2LjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
