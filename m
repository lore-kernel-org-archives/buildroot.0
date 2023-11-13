Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C3C5C4332F
	for <buildroot@archiver.kernel.org>; Mon, 13 Nov 2023 00:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA14560B94;
	Mon, 13 Nov 2023 00:58:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA14560B94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FG0Wll29a5s4; Mon, 13 Nov 2023 00:58:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20DF860AAE;
	Mon, 13 Nov 2023 00:58:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20DF860AAE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6CC221BF947
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 00:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B6FE81FAF
 for <buildroot@lists.busybox.net>; Mon, 13 Nov 2023 00:58:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B6FE81FAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qwq0S96PtdMB for <buildroot@lists.busybox.net>;
 Mon, 13 Nov 2023 00:58:55 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43A6681FAC
 for <buildroot@buildroot.org>; Mon, 13 Nov 2023 00:58:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 43A6681FAC
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4083f613275so32064485e9.2
 for <buildroot@buildroot.org>; Sun, 12 Nov 2023 16:58:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699837133; x=1700441933;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6RmFGKEujT3pwafxAYGOs/kvM/n2IeeK6figvl7aPdw=;
 b=oroyRXeHhdmGLYKfep7QWVUXPeLT4DQfRil2NVYW01npfAT7qn2VjGMKNvuo/vffPF
 Z4B605uh2ay/n6NvuFDkDGIS59jkO/mlBwm/cKVUds44vfMDWvK0Rd3Sb39/gXPXFzLr
 NRpPpWLKvC+luGQlYQ8nmrWP7KXkzsadHggPd1MzJTFfv9wZdAt1uVv4Uv7VkfzOzLsL
 ToM0Va1MgsMTunNU49+2nmb/rlT6fWnaKaxcDn0Mav/eQwfbIMYvHKtxZ5Gfl8ZwnEla
 JwcQ99n9NYreyqK+9cXn8zlwPWqYAKqJKAWnm4ShceQKhGivAKZWIaw9RRutWNSGRmt2
 YkzA==
X-Gm-Message-State: AOJu0YxSwDXLikLskTDx63E+4xOGHpCUMUUHvbzKpY3iFW8RZXMhgfc4
 8rivV4M2iYXrhDmCKDU+sfrufVmJP6wwVg==
X-Google-Smtp-Source: AGHT+IHeQEBBpCNQ1YkwPejGkITYVEhEnAHcqlR/R5LUaZ+33g8ZMngcW8IdN4RbdEQ8+NmBg8ugSg==
X-Received: by 2002:a1c:790b:0:b0:409:7aa9:a903 with SMTP id
 l11-20020a1c790b000000b004097aa9a903mr4367958wme.19.1699837133045; 
 Sun, 12 Nov 2023 16:58:53 -0800 (PST)
Received: from cuervo.lan ([78.30.17.56]) by smtp.gmail.com with ESMTPSA id
 c20-20020a05600c0ad400b0040588d85b3asm11912268wmr.15.2023.11.12.16.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Nov 2023 16:58:52 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 13 Nov 2023 01:58:34 +0100
Message-ID: <20231113005833.3858363-2-salvador.joseluis@gmail.com>
X-Mailer: git-send-email 2.42.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699837133; x=1700441933; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6RmFGKEujT3pwafxAYGOs/kvM/n2IeeK6figvl7aPdw=;
 b=dR2FDpw2kpEGYOpvRk/SO6mFAvQsFps3xOTxI9E4RJ8BVi+Ll83APACZI0UUU1y2wf
 GEgLtsPykugtCZv/yE4Avd8MhJxIYt5tAZnqGxd0fBVT3xmi9lG9tljt0dfvGQWDYSua
 +z6lW53BM8gOwxh5XaBCQnn/8RlFJ5I3z10/4NK0O/uJ+JujFpUtLAEBsAHLJ1m26nFZ
 yhlLLS4jkwtPPCF3WX2hYuSlzObbUn8K/OViSvEOx30v/zNyiX4KdJsbIfNFkkgI03nH
 HKHUDD6wrxzig2aAd2JVTxZAGVQL5OSqJfhA6hgSYYdU6TEekHDP5KRjt8XJdzYFv8GV
 7Jnw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dR2FDpw2
Subject: [Buildroot] [PATCH] package/zfs: bump version to 2.2.0
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
Cc: =?UTF-8?q?Jos=C3=A9=20Luis=20Salvador=20Rufo?=
 <salvador.joseluis@gmail.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmVtb3ZlZCBiYWNrcG9ydGVkIHBhdGNoOgotIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuemZzL3pm
cy9jb21taXQvYmMzZjEyYmZhYzE1MmEwYzI4OTUxY2VjOTIzNDBiYTE0ZjljY2VlOS5wYXRjaAoK
VXBkYXRlZCBaRlMgdGVzdCB0byBwYXNzIHRoaXMgbmV3IHZlcnNpb24uCgpTaWduZWQtb2ZmLWJ5
OiBKb3PDqSBMdWlzIFNhbHZhZG9yIFJ1Zm8gPHNhbHZhZG9yLmpvc2VsdWlzQGdtYWlsLmNvbT4K
LS0tCiBwYWNrYWdlL3pmcy96ZnMuaGFzaCAgICAgICAgICAgICAgICAgICAgICB8IDUgKystLS0K
IHBhY2thZ2UvemZzL3pmcy5tayAgICAgICAgICAgICAgICAgICAgICAgIHwgMyArLS0KIHN1cHBv
cnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfemZzLnB5IHwgNCArKy0tCiAzIGZpbGVzIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9wYWNr
YWdlL3pmcy96ZnMuaGFzaCBiL3BhY2thZ2UvemZzL3pmcy5oYXNoCmluZGV4IDNhNzNlNWU5NGYu
LmIwMmM0OTIzNGEgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvemZzL3pmcy5oYXNoCisrKyBiL3BhY2th
Z2UvemZzL3pmcy5oYXNoCkBAIC0xLDYgKzEsNSBAQAotIyBGcm9tIGh0dHBzOi8vZ2l0aHViLmNv
bS9vcGVuemZzL3pmcy9yZWxlYXNlcy9kb3dubG9hZC96ZnMtMi4xLjEyL3pmcy0yLjEuMTIuc2hh
MjU2LmFzYwotc2hhMjU2ICA2NGRhYTI2YWVkM2UxMmM5MzFmNmY0NDEzZDc1MjdjNGViZGI4ZGEz
NTQxNmIzNTYxNTJiNWY5ZmRkNGM2ZTZkICB6ZnMtMi4xLjEyLnRhci5negotc2hhMjU2ICA5NmEy
NzM1M2ZlNzE3ZmYyYzhiOTVkZWI4YjAwOWM0ZWI3NTAzMDNjNjQwMGUyZDhhMjU4MmFiMWVjMTJi
MjVhICBiYzNmMTJiZmFjMTUyYTBjMjg5NTFjZWM5MjM0MGJhMTRmOWNjZWU5LnBhdGNoCisjIExv
Y2FsbHkgY29tcHV0ZWQKK3NoYTI1NiAgNDIwMzVmZDA1OWZhYTI1YTA5Y2Q1MTFiMjRhNTdiOGFk
MTI4NWNiNjkxMjdmMmEwMDQzYjk4NTYyYzVlYzY5MCAgemZzLTIuMi4wLnRhci5negogCiAjIEhh
c2ggZm9yIGxpY2Vuc2UgZmlsZXM6CiBzaGEyNTYgIDFmZmI3MGMzM2M0Zjc5ZjA0ZTk0N2ZhY2M1
Yzc4NTFmMjg5NjA5MjU2YWFjYjQ3ZmMxMTVmNzAwNDI3ZDk1MjAgIExJQ0VOU0UKZGlmZiAtLWdp
dCBhL3BhY2thZ2UvemZzL3pmcy5tayBiL3BhY2thZ2UvemZzL3pmcy5tawppbmRleCBmMDQ2MWVh
OWVjLi5kODU5NTZjOThiIDEwMDY0NAotLS0gYS9wYWNrYWdlL3pmcy96ZnMubWsKKysrIGIvcGFj
a2FnZS96ZnMvemZzLm1rCkBAIC00LDkgKzQsOCBAQAogIwogIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMKIAotWkZTX1ZFUlNJT04gPSAyLjEuMTIKK1pGU19WRVJTSU9OID0gMi4yLjAKIFpGU19TSVRF
ID0gaHR0cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZzL3JlbGVhc2VzL2Rvd25sb2FkL3pmcy0k
KFpGU19WRVJTSU9OKQotWkZTX1BBVENIID0gaHR0cHM6Ly9naXRodWIuY29tL29wZW56ZnMvemZz
L2NvbW1pdC9iYzNmMTJiZmFjMTUyYTBjMjg5NTFjZWM5MjM0MGJhMTRmOWNjZWU5LnBhdGNoCiBa
RlNfU0VMSU5VWF9NT0RVTEVTID0gemZzCiBaRlNfTElDRU5TRSA9IENEREwKIFpGU19MSUNFTlNF
X0ZJTEVTID0gTElDRU5TRSBDT1BZUklHSFQKZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90
ZXN0cy9wYWNrYWdlL3Rlc3RfemZzLnB5IGIvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uv
dGVzdF96ZnMucHkKaW5kZXggMWYwMWRkZDc2OC4uMjdkYmMyODY5YiAxMDA2NDQKLS0tIGEvc3Vw
cG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMucHkKKysrIGIvc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF96ZnMucHkKQEAgLTQwLDExICs0MCwxMSBAQCBjbGFzcyBU
ZXN0WmZzQmFzZShpbmZyYS5iYXNldGVzdC5CUlRlc3QpOgogCiAgICAgICAgIGNtZHMgPSBbCiAg
ICAgICAgICAgICAjIEluaXQKLSAgICAgICAgICAgICJtb2Rwcm9iZSB6ZnMiLAorICAgICAgICAg
ICAgIm1vZHByb2JlIHpmcyAmJiBzbGVlcCAyIiwKICAgICAgICAgICAgICJtb3VudCAtbyByZW1v
dW50LHNpemU9MTMyTSAvdG1wIiwKICAgICAgICAgICAgICJmYWxsb2NhdGUgLWwgNjRNIC90bXAv
Y29udGFpbmVyMS5yYXciLAogICAgICAgICAgICAgImZhbGxvY2F0ZSAtbCA2NE0gL3RtcC9jb250
YWluZXIyLnJhdyIsCi0gICAgICAgICAgICAienBvb2wgY3JlYXRlIC1tIC9wb29sIHBvb2wgcmFp
ZHogL3RtcC9jb250YWluZXIxLnJhdyAvdG1wL2NvbnRhaW5lcjIucmF3IiwKKyAgICAgICAgICAg
ICJ6cG9vbCBjcmVhdGUgcG9vbCByYWlkeiAvdG1wL2NvbnRhaW5lcjEucmF3IC90bXAvY29udGFp
bmVyMi5yYXciLAogICAgICAgICAgICAgImRkIGlmPS9kZXYvdXJhbmRvbSBicz0xTSBjb3VudD04
IG9mPS9wb29sL3VyYW5kb20iLAogICAgICAgICAgICAgInNoYTI1NnN1bSAvcG9vbC91cmFuZG9t
ID4gL3RtcC91cmFuZG9tLnNoYTI1NiIsCiAgICAgICAgICAgICAjIENoZWNrIFpGUwotLSAKMi40
Mi4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
