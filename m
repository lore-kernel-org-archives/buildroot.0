Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A02A7CCD184
	for <buildroot@archiver.kernel.org>; Tue, 21 Oct 2025 12:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AA786069E;
	Tue, 21 Oct 2025 12:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uzV0Yq2E1dR3; Tue, 21 Oct 2025 12:03:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71209606D9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71209606D9;
	Tue, 21 Oct 2025 12:03:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 19F6E70A
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 12:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0069380664
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 12:03:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xT6KktFGjE97 for <buildroot@buildroot.org>;
 Tue, 21 Oct 2025 12:03:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DCC9C8065F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCC9C8065F
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCC9C8065F
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 12:03:56 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-475c1f433d8so1153255e9.3
 for <buildroot@buildroot.org>; Tue, 21 Oct 2025 05:03:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761048235; x=1761653035;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wppy1NI/8CZD/o2Ropy5BgN2PvLElcTNJWDqFN+ocrw=;
 b=YPiEFKNtHCbPy3q99wtXB4cKDKry2ePLR9UYGNR7/11vGLwYLSKiSzUTDgY+pZfizu
 qv2yuUAp3ucX7Iez1SnKqgOaJjuqOEg9PH2eEUQHhgy2gMSlm9ntswaSiK4V85DB2mXi
 u97kX7ToNPcNapGixP6Tn+USglKtz7Dw/6c+V2qTQhrc9J6t3fFtaHGlyamyg7N+0HXU
 jqIFSbpd8q/UbiKKxMCbrxz0GeU21dG5BKVjiRPN4F6kZvCeFbkhAgUFf+tplV/BQVRk
 2Gr/V+nD/Gkip27T5ntnCeJTqRPsRZGkPEkxMqsZbqQiq+MJr5ve1HE9N4zVorswhbTT
 eQww==
X-Gm-Message-State: AOJu0YwbcYDLBJm4TFNwhvJm60IcbS0ajiBCyL9/GKXbF7+8HphisTZ/
 kClxcWyRmSkgeXVUFaqzCAJ0bpKf/ya09Ril8SRJZYIWRN8GI8SrYsouYMekdw==
X-Gm-Gg: ASbGncs5G3tGSTMA69x9J5xeNxGQq8Cxn1DLKl/q2LAxbAGhxnnYC24Rm6hMUG2HT62
 hMyFBt5ugJOs/hE/IW4Fbq7xbj37B5NjadL3E8jCxOBKsAUQVlE8KwyEDWxTCWMPrKvJI0k8/Wp
 4nYa06j5fh2hXNLr5lFDcC700yQnr8bALGtAb2D+rWIthDq13kahToPfuMkq2ViPl1eP3dBrGBg
 qEr21FTuthnP3ayDhmYxNsu5OVazvZ6pyTOjomQC1jJKXI9HpsgFHqyTdT3Mh9NnyNM6+W72XlI
 xhmHUV2hC1JOtDlTwz5q54XmfkbIdQ9I73ehVE8fs8kkv7j1Q6G0z9ZIuGEpRWvbMoDmj+joDDD
 EpjimW3ORM1L3Qu5+FA2EGjDX0N847tslN4sCc7dikA/T4j+NRRIpFlGYtdpPC+EmqcXhr1lKPD
 UYYQ==
X-Google-Smtp-Source: AGHT+IFy8FviLLLyINdEyaN+7A5VM/K+KdXYNTSjAnhhoG/vIK2TjQdCQAQ47zt3xJ1BccWUsqPWKg==
X-Received: by 2002:a05:600c:3553:b0:471:a73:a9d2 with SMTP id
 5b1f17b1804b1-471178a6484mr118054615e9.11.1761048234492; 
 Tue, 21 Oct 2025 05:03:54 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:7dc:f6df:77e5:8474])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471529598c9sm192462405e9.5.2025.10.21.05.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Oct 2025 05:03:54 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vincent Jardin <vjardin@free.fr>,
	Maxime Leroy <maxime@leroys.fr>
Date: Tue, 21 Oct 2025 14:03:37 +0200
Message-ID: <20251021120342.483933-1-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761048235; x=1761653035; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=wppy1NI/8CZD/o2Ropy5BgN2PvLElcTNJWDqFN+ocrw=;
 b=dEclPAFYpkg+z3xwvTmq7ubZ5tnHNi8QXT8pO7Ys9IU1loS0uW+z3OEz8y7aAuHQdF
 MllboGr5wQ519u8gGst8KCMCEDbnlkA0eR4v6AuhPkDo6ELnPkIbWVZQ33l+O54Cdy6S
 4YVMAh5XNXuRmJ0w1FRSMiHDTYX7nuWIlhFMiOJhNKWCq+pYTrGdYfYuMvFxenAV/lNU
 TiAwQBweWEQL2gKXQ3Vpk5eKneMHyuvlX00qC6Vmv+TdPKa1nw5PN6JenUak0e0LZEB6
 qNXfzGLCJIa1T614IrV126DXpKAbCy3KC6CdfZobDQIYtccRhcYzPwkP6fiGmLRMx6Yu
 u7tw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=dEclPAFY
Subject: [Buildroot] [PATCH 0/5] package/dpdk: version bump and selectable
 build components
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

VGhpcyBzZXJpZXMgYnVtcHMgRFBESyB0byAyNC4xMS4zIGFuZCBhZGRzIG9wdGlvbnMgdG8gZW5h
YmxlL2Rpc2FibGUga2VybmVsIG1vZHVsZXMsCmRyaXZlcnMsIGxpYnJhcmllcywgYW5kIGFwcHMs
IG1hdGNoaW5nIE1lc29u4oCZcyBzZWxlY3Rpb24gbW9kZWwKYW5kIGFsbG93aW5nIHNtYWxsZXIg
YnVpbGRzLgoKVGVzdGVkIG1hbnVhbGx5IG9uIHg4Nl82NCBhbmQgTlhQIERQQUEyLgpDSSBwYXNz
ZWQgZm9yIGJ1aWxkIGFuZCBydW50aW1lOgoKICAgIGJ1aWxkOiBodHRwczovL2dpdGxhYi5jb20v
bWF4aW1lLWxlcm95L2J1aWxkcm9vdC8tL3BpcGVsaW5lcy8yMTExMTIyOTI1CiAgICB0ZXN0OiBo
dHRwczovL2dpdGxhYi5jb20vbWF4aW1lLWxlcm95L2J1aWxkcm9vdC8tL3BpcGVsaW5lcy8yMTEx
MTM3MTc1CgpNYXhpbWUgTGVyb3kgKDUpOgogIHBhY2thZ2UvZHBkazogYnVtcCB0byAyNC4xMS4z
IHZlcnNpb24KICBwYWNrYWdlL2RwZGs6IGFkZCB0b2dnbGUgZm9yIGRlcHJlY2F0ZWQga2VybmVs
IG1vZHVsZXMKICBwYWNrYWdlL2RwZGs6IG1ha2UgZHJpdmVycyBzZWxlY3RhYmxlCiAgcGFja2Fn
ZS9kcGRrOiBtYWtlIGxpYnJhcmllcyBzZWxlY3RhYmxlCiAgcGFja2FnZS9kcGRrOiBtYWtlIGFw
cHMgc2VsZWN0YWJsZQoKIHBhY2thZ2UvZHBkay9Db25maWcuaW4gfCA0OSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHBhY2thZ2UvZHBkay9kcGRrLmhhc2ggfCAg
MiArLQogcGFja2FnZS9kcGRrL2RwZGsubWsgICB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0KIDMgZmlsZXMgY2hhbmdlZCwgODUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
