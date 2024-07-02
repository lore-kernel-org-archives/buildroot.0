Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25C8AC30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 19:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D206960BEC;
	Tue,  2 Jul 2024 19:13:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QNkBYee8dFcl; Tue,  2 Jul 2024 19:13:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 832B860BE2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 832B860BE2;
	Tue,  2 Jul 2024 19:13:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 467E21BF303
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:13:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 329C883F11
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:13:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id luDmYxmLUm9u for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 19:13:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 14B1583F0F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14B1583F0F
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 14B1583F0F
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 19:13:29 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2ebeefb9a7fso51513401fa.0
 for <buildroot@buildroot.org>; Tue, 02 Jul 2024 12:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719947607; x=1720552407;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=29nNDWqQSLaPyhLY8mAtjign3NY/e5P7JabJQZLVz0M=;
 b=uVF3rjx/LLAIByWy5QJK+0YD5Ib7shtCHWZyASU04rpe3DR7L3qC5CwF/RdwYoHVJD
 PlQC2HsqGfeM9CY8Q7Bryxnlb03ZTpWMowPl1I0Fv6KJwNNmMSyBi7zo92jKtwHOgT/+
 /XF+J0OMMc+AK3Kvi3KS+MT6BF9xFU6Psh4Sc1tKqzKQipNL5aV85rsKXRp0Y4I4ywci
 5r4cLNfbOQrCaXmx9tdmJ/7b2IQzU5fRLPHvUJqk5KARvGJXIorsuf9v9S67p6WfNCRQ
 kXYKnC043V2jpXnxVb9XV3/VTOyZGUDhtzHu8Gvzyh/ZLB6uaoGGJjFVioBr8PJAH0qn
 P8Iw==
X-Gm-Message-State: AOJu0Yw4D/8Kwdl2zfmJ0cBztUORnlF/Ioh6PG7z4BaHbS47im2L5lpM
 la5qkcOzaOoQ9Xc2XOdskSJvHe6KNhFbMpM7GQ24dmF6iBBKhVFvNgMt5VXlo2O/ehH5+l8Qnla
 DO0w=
X-Google-Smtp-Source: AGHT+IGM8Sko/BreyEklOxYe//nwtRBVJgKg/YnJN+WN9UjfYJL3RvK46P2Ul/S4C63hJtXqAXgqEg==
X-Received: by 2002:a05:6512:10ca:b0:52c:8a12:3d3b with SMTP id
 2adb3069b0e04-52e82731d3amr7422143e87.56.1719947607406; 
 Tue, 02 Jul 2024 12:13:27 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a752cb50dc7sm172094066b.101.2024.07.02.12.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 12:13:27 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  2 Jul 2024 21:13:11 +0200
Message-ID: <20240702191319.2460210-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1719947607; x=1720552407;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=29nNDWqQSLaPyhLY8mAtjign3NY/e5P7JabJQZLVz0M=;
 b=Pp/ajPYliP+wOfrTSOY64kmuXP1H+FK0yakNxrfU4jrWt8gZpm4fm4kujJWqesNHbI
 Iq3vAljdLGpKWKToDRO0hC56nbcTgUIGVC6VM0iHtM4nd8rahuo7+vmb3c9O8HZKivhy
 w5FiDl6pu05WToY80wup7fxq86gUc/2zYie+o=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Pp/ajPYl
Subject: [Buildroot] [PATCH 1/1] package/libnfs: update the patches to be
 applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q29tbWl0IDhmODhhNjQ0ZWQ3ZDYgKCJzdXBwb3J0L3NjcmlwdHMvYXBwbHktcGF0Y2hlcy5zaDog
c2V0IHRoZSBtYXhpbXVtCmZ1enogZmFjdG9yIHRvIDAiKSByZWR1Y2VkIHRoZSBmdXp6IGZhY3Rv
ci4KCkR1ZSB0byB0aGlzIGNoYW5nZSwgbGlibmZzIGZhaWxzIHRvIGJ1aWxkIHdpdGggb3V0cHV0
OgoKICAgIEFwcGx5aW5nIDAwMDEtRml4LWluY2x1ZGUtc3lzLXRpbWUuaC5wYXRjaCB1c2luZyBw
YXRjaDoKICAgIHBhdGNoaW5nIGZpbGUgaW5jbHVkZS9uZnNjL2xpYm5mcy5oCiAgICBIdW5rICMx
IEZBSUxFRCBhdCAyNC4KICAgIDEgb3V0IG9mIDEgaHVuayBGQUlMRUQgLS0gc2F2aW5nIHJlamVj
dHMgdG8gZmlsZSBpbmNsdWRlL25mc2MvbGlibmZzLmgucmVqCgpUaGlzIGNvbW1pdCByZWZyZXNo
ZXMgdGhlIHBhY2thZ2UgcGF0Y2ggb24gdGhlIGN1cnJlbnQgcGFja2FnZSB2ZXJzaW9uLgoKU2ln
bmVkLW9mZi1ieTogRGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlv
bnMuY29tPgotLS0KIHBhY2thZ2UvbGlibmZzLzAwMDEtRml4LWluY2x1ZGUtc3lzLXRpbWUuaC5w
YXRjaCB8IDYgKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibmZzLzAwMDEtRml4LWluY2x1ZGUtc3lz
LXRpbWUuaC5wYXRjaCBiL3BhY2thZ2UvbGlibmZzLzAwMDEtRml4LWluY2x1ZGUtc3lzLXRpbWUu
aC5wYXRjaAppbmRleCBjMzc3OWYxM2EyNjIuLjAzMTkzZDZkNzFhMSAxMDA2NDQKLS0tIGEvcGFj
a2FnZS9saWJuZnMvMDAwMS1GaXgtaW5jbHVkZS1zeXMtdGltZS5oLnBhdGNoCisrKyBiL3BhY2th
Z2UvbGlibmZzLzAwMDEtRml4LWluY2x1ZGUtc3lzLXRpbWUuaC5wYXRjaApAQCAtMTYsNiArMTYs
OCBAQCBVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL3NhaGxiZXJnL2xpYm5mcy9pc3N1ZXMv
MjcyCiBTaWduZWQtb2ZmLWJ5OiBKw7ZyZyBLcmF1c2UgPGpvZXJnLmtyYXVzZUBlbWJlZGRlZC5y
b2Nrcz4KIFtGYWJyaWNlOiB1cGRhdGUgZm9yIDUuMC4yXQogU2lnbmVkLW9mZi1ieTogRmFicmlj
ZSBGb250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+CitbRGFyaW86IG1ha2UgdGhl
IHBhdGNoIHRvIGJlIGFwcGxpZWQgd2l0aCBmdXp6IGZhY3RvciAwXQorU2lnbmVkLW9mZi1ieTog
RGFyaW8gQmluYWNjaGkgPGRhcmlvLmJpbmFjY2hpQGFtYXJ1bGFzb2x1dGlvbnMuY29tPgogLS0t
CiAgaW5jbHVkZS9uZnNjL2xpYm5mcy5oIHwgNSAtLS0tLQogIDEgZmlsZSBjaGFuZ2VkLCA1IGRl
bGV0aW9ucygtKQpAQCAtMjQsOCArMjYsOCBAQCBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9uZnNjL2xp
Ym5mcy5oIGIvaW5jbHVkZS9uZnNjL2xpYm5mcy5oCiBpbmRleCAwOWRjZjFjLi5iNmRiNThjIDEw
MDc1NQogLS0tIGEvaW5jbHVkZS9uZnNjL2xpYm5mcy5oCiArKysgYi9pbmNsdWRlL25mc2MvbGli
bmZzLmgKLUBAIC0yNCwxMiArMjQsNyBAQAotICNkZWZpbmUgX0xJQk5GU19IXworQEAgLTI4LDEy
ICsyOCw3IEBACisgI2VuZGlmCiAgCiAgI2luY2x1ZGUgPHN0ZGludC5oPgogLSNpZiBkZWZpbmVk
KF9fQU5EUk9JRF9fKSB8fCBkZWZpbmVkKEFST1MpIHx8IGRlZmluZWQoX19QUFVfXykgXAotLSAK
Mi40My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
