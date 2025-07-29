Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F682C87FC9
	for <buildroot@archiver.kernel.org>; Tue, 29 Jul 2025 08:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5A8041329;
	Tue, 29 Jul 2025 08:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XGdRFQ6NE9S0; Tue, 29 Jul 2025 08:33:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03C88412EA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03C88412EA;
	Tue, 29 Jul 2025 08:33:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B7466DA
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 08:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A90AF412EA
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 08:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZxyNUpHuI_i for <buildroot@buildroot.org>;
 Tue, 29 Jul 2025 08:33:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BDB95412A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDB95412A0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BDB95412A0
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 08:33:16 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-61530559887so3110556a12.1
 for <buildroot@buildroot.org>; Tue, 29 Jul 2025 01:33:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753777994; x=1754382794;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1MLApc5ciA0c/Vrl9cExCNGVfB2yO7WP3G425frIBtQ=;
 b=FpzkXNAqvHHSG74XWIitlJ74KNfS0TE0eJCrymFl2hHjMEsDrvDaqPehqOODsyWqqY
 G19M0uow/r32bVawfoWW8lFoeTS+E5AuiMLbuVstRPuJmOlMUbFA6JwB40kJfATMJkYH
 RYVvYn6UiU4e2Jj6UUNdiqafuTnSONbIJcKkqeooZE/1sWklV8oepH5rTJjixHzViSui
 HKmTvoLtvIrMlfxBIay6G/emHoett1a3TUPuuN5fYvSpXln7UnqXnxlUSl+YHRlC8WxW
 ubTn1FXedeQJ56JyAV3SnqZxObQ6he+rrumJfhkeiFlmVeH9zUJ8wkXqvVQxD8YS0mGJ
 EjGQ==
X-Gm-Message-State: AOJu0YxC+HUHR2IfWqtEZOdqL8hQB1nfFc8SJWqqVwcixcFTbqJhy32+
 m82fZ/Rk2Acna1lbYu8HGBU6mlxyaGa7pcINveEGsapQauhtWmpiSjHDiKaK
X-Gm-Gg: ASbGncuiPjS32VeQshagtJ7/TwW0h2aGleTYiFRZY2t0xRxwUwac32DhwcdRron9oZ2
 warN0LLCmbV1xRPJMQtC4TQsWVSmCG5IQ5P3xqD9yu2Ww0oYlpNVBx8XjzOoyBOgN6uK1w6mQQx
 9fVYIAwPSrAINlZ3UGiLY99DK3wgg+AeEPLZWxEmmV0U9jzT8z2WHXcsDrY+vLeR5OU3nxNOfAh
 ArsjOTO+OahxntYlaaV76J4wdt9dgT1Vh2+LZwQKG2JVXOJC0Wx64zZIoTYMpYN0aGcDfcKVivf
 rSLKBKNI03KImKI/uok0t7K3Xgv/ajwb38tKKmKHZkEXORfNJl/eAfKWXymlr6ZpIp6/q1O7LVs
 dn9aWol0V/XY1rJqvdRnk8XuCIeIsz4yVaAHI
X-Google-Smtp-Source: AGHT+IEpv4Fm1z1atdRzXcHAMa6GnOrm0u2go5acVL7Hn/InI5sjAEfEHUqdHlifzt35Bj8hJfZHQQ==
X-Received: by 2002:a05:6402:34d5:b0:606:ebd9:c58b with SMTP id
 4fb4d7f45d1cf-614f1bdd877mr12561730a12.1.1753777994197; 
 Tue, 29 Jul 2025 01:33:14 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61558c0779fsm1451566a12.27.2025.07.29.01.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 01:33:13 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com
Date: Tue, 29 Jul 2025 10:33:00 +0200
Message-ID: <20250729083312.39534-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728224414.6d0833d2@windsurf>
References: <20250728224414.6d0833d2@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753777994; x=1754382794; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1MLApc5ciA0c/Vrl9cExCNGVfB2yO7WP3G425frIBtQ=;
 b=Zlz3qSSBfmjuEWy8KRHVFTvQBRGZHtUBY4Wjzc9gKyiGB0+YFO8gG3Bcs0PoHcg3ed
 eoEHpKboqUjoEejlYnrQm8k+NVSMpUkJtJXDtMSjW4Mp6HnycMh7PMlMoGNcSPqOiemg
 8tgM47ADKwoevp+CTH5pRMcFcezPA7Y9zNvYnQwTc+gyo+gIFdre7h/xKETYepg2yxIj
 LY1odqmskWtPnI/+AzOegmovjfnFTWj9JF1usVtn+aKhh3+sjeTV08P4QUfAe08HQsQI
 1ll2Kb7hOoQYlUcBDBzmiQnrBLe+9fGIUFwpet8hXbvDM6H4JB4WloLllPnmVvM7h96n
 iOjw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Zlz3qSSB
Subject: [Buildroot] [v1,1/1] package/zellij: new package
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

SGVsbG8gVGhvbWFzLAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3IGFuZCBoZWxwZnVsIGNvbW1lbnRz
LiBJ4oCZbGwgcHJlcGFyZSB2MiB3aXRoIHRoZSBmaXhlcy4KCj4gPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS96ZWxsaWovQ29uZmlnLmluIGIvcGFja2FnZS96ZWxsaWovQ29uZmlnLmluCj4gPiBuZXcg
ZmlsZSBtb2RlIDEwMDY0NAo+ID4gaW5kZXggMDAwMDAwMDAwMC4uMjQzODM1MTFjZQo+ID4gLS0t
IC9kZXYvbnVsbAo+ID4gKysrIGIvcGFja2FnZS96ZWxsaWovQ29uZmlnLmluCj4gPiBAQCAtMCww
ICsxLDE1IEBACj4gPiArY29uZmlnIEJSMl9QQUNLQUdFX1pFTExJSgo+ID4gKwlib29sICJ6ZWxs
aWoiCj4gPiArCWRlcGVuZHMgb24gQlIyX3g4Nl82NCB8fCBCUjJfeDg2X2k2ODYgfHwgQlIyX2Fh
cmNoNjQKPiAKPiBJcyB0aGVyZSByZWFsbHkgc29tZXRoaW5nIGFyY2hpdGVjdHVyZS1zcGVjaWZp
YyBpbiB6ZWxsaWo/CgpVbmZvcnR1bmF0ZWx5LCB5ZXMuIFVuZGVyIHRoZSBob29kLCBaZWxsaWog
cmVsaWVzIG9uIHRoZSBjcmFuZWxpZnQgY3JhdGUgWzFdLAp3aGljaCBpcyByZXN0cmljdGl2ZSBp
biB0ZXJtcyBvZiBzdXBwb3J0ZWQgcGxhdGZvcm1zLiBJ4oCZdmUgb2JzZXJ2ZWQgY29tcGlsYXRp
b24KaXNzdWVzIGR1cmluZyBidWlsZHMgZm9yIFJQSTMsIFFFTVUgYW5kIG90aGVycy4gRWFjaCB0
aW1lIGNhdXNlZCBieSB0aGlzIGNyYXRlCmR1ZSB0byB1bnN1cHBvcnRlZCBwbGF0Zm9ybXMuIFNv
LCBJIGRlY2lkZWQgdG8gdGFrZSBhIGNvbnNlcnZhdGl2ZSBhcHByb2FjaApoZXJlLiBQb3NzaWJs
eSwgd2UgY2FuIGV4cGFuZCB0aGUgbGlzdCBvZiBzdXBwb3J0ZWQgcGxhdGZvcm1zIG92ZXIgdGlt
ZS4KClsxXSBodHRwczovL2RvY3MucnMvY3JhbmVsaWZ0LWNvZGVnZW4vMC4xMjIuMC9jcmFuZWxp
ZnRfY29kZWdlbi8KClRoYW5rIHlvdQoKQWxleGFuZGVyCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
