Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E42CAC04FFE
	for <buildroot@archiver.kernel.org>; Fri, 26 Apr 2024 08:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8842583750;
	Fri, 26 Apr 2024 08:57:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qwvGIOHAvVpG; Fri, 26 Apr 2024 08:57:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CB78837A4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CB78837A4;
	Fri, 26 Apr 2024 08:57:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CEB51BF59F
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 08:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5987341C61
 for <buildroot@lists.busybox.net>; Fri, 26 Apr 2024 08:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d7tniYaQio3f for <buildroot@lists.busybox.net>;
 Fri, 26 Apr 2024 08:57:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com;
 envelope-from=sairon@sairon.cz; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A5BAF4193B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A5BAF4193B
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A5BAF4193B
 for <buildroot@buildroot.org>; Fri, 26 Apr 2024 08:57:44 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2db13ca0363so29509911fa.3
 for <buildroot@buildroot.org>; Fri, 26 Apr 2024 01:57:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714121862; x=1714726662;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yFyggVbXyrpRhLSXVCPcq/mL3rbjouUY/veO2ZMNB58=;
 b=H1uWEukdyjpz4qdd3vKXD+OiWUKKb+MQU4XNe6OALHX44skJ+VAOmWK0tUiEQiPyiy
 NAS1/2aW+eKJqECkihrx74Z8DcjcnCoNY0H31OcUsx+7GPPl4KpvvwKvRMj8vgdCKghS
 QHHtxIAaynxn5EQFgNKnYO4hQtvWXRZxzsDtK7897HU5CiQFlqjT6UcbuGpj/MnPzEy5
 GftB0qL21550JGX5XPw8KqEM0AaJUP8uttW11M/hxh408s5ftY2pVsvi0uK221nFea2g
 Iux4xMhUmeqeO9UiQe5Nib40KtHKQljX0vDmqL6WsuqeTlPRNyUjkoN6ZHVYdJEbVnic
 tkgQ==
X-Gm-Message-State: AOJu0Yz8wKWo896eVpJrxqCpApGvQ3sUrT+MdClwY+UZmX6qNq0AQs2P
 MUBnLuSuX0lWE4K3ZxxBKtM0c6bGb1jORD9eAZ0I9q56jN2MAMjcPnGVruAmJGy8uRiJnMNpY2p
 j
X-Google-Smtp-Source: AGHT+IFqdXpxojkQgWDXr14IReYqk7k8SD+byx1oD10eeK0T11nXkR6YaZIfLh/PHDauvLRolLm5rA==
X-Received: by 2002:a2e:87c2:0:b0:2de:c912:ec08 with SMTP id
 v2-20020a2e87c2000000b002dec912ec08mr1248040ljj.16.1714121861905; 
 Fri, 26 Apr 2024 01:57:41 -0700 (PDT)
Received: from krabice.lan (ip-89-103-66-201.bb.vodafone.cz. [89.103.66.201])
 by smtp.gmail.com with ESMTPSA id
 bk5-20020a170907360500b00a58a67afd2fsm1979290ejc.53.2024.04.26.01.57.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Apr 2024 01:57:41 -0700 (PDT)
From: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
To: buildroot@buildroot.org
Date: Fri, 26 Apr 2024 10:57:32 +0200
Message-Id: <20240426085733.2573659-1-sairon@sairon.cz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sairon.cz; s=google; t=1714121862; x=1714726662; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yFyggVbXyrpRhLSXVCPcq/mL3rbjouUY/veO2ZMNB58=;
 b=AOPweyq1PDr7WBKB+Gorlor0pcAbENIK9RebPJcMcmncqyKO6HCG57SxFSGkphaFJr
 7NXTCOA6GGFbZOE13LzaFMpOAuOiw9mOUD/3VGIUBwDsvl+5iIwcz88iKN+SzICa/V5t
 QyKX/J2b6/cx/PDEYnuk/f8e0baO9NN/p0aEX+i9x23fidkerekM06t7R4AAY9su0FMd
 6BGYCDEN5yA2YNgWpglT/tQsUYqlrQqNLJpOX1PyS5I0AT4uD+oIxuo/pMYkruL8yoOF
 gOrUGhY4tfI2eZh/Y72tM/Sw0HmJL6y2EZ4kTG2JJQkeeJdf78tq1n5qKGlisfs9+7H9
 nIEg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=sairon.cz
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sairon.cz header.i=@sairon.cz header.a=rsa-sha256
 header.s=google header.b=AOPweyq1
Subject: [Buildroot] [PATCH] package/dbus: set runstatedir to /run
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
Cc: =?UTF-8?q?Jan=20=C4=8Cerm=C3=A1k?= <sairon@sairon.cz>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

REJ1cyAxLjE0Lnggbm93IGhhcyB0aGUgQ29udGFpbmVyczEgaW50ZXJmYWNlIHdoaWNoIHVzZXMg
cGF0aCBpbgpydW5zdGF0ZWRpciAoYnkgZGVmYXVsdCBzZXQgdG8gL3Zhci9ydW4pIGZvciBjcmVh
dGluZyBzb2NrZXRzLiBXaXRoIHRoZQpkZWZhdWx0LCBTeXN0ZW1kIGNvbXBsYWlucyBhYm91dCBp
dCBiZWluZyBhIGxlZ2FjeSBkaXJlY3Rvcnk6CgpzeXN0ZW1kLXRtcGZpbGVzWzEwMl06IC91c3Iv
bGliL3RtcGZpbGVzLmQvZGJ1cy5jb25mOjEzOiBMaW5lIHJlZmVyZW5jZXMKcGF0aCBiZWxvdyBs
ZWdhY3kgZGlyZWN0b3J5IC92YXIvcnVuLywgdXBkYXRpbmcgL3Zhci9ydW4vZGJ1cy9jb250YWlu
ZXJzCuKGkiAvcnVuL2RidXMvY29udGFpbmVyczsgcGxlYXNlIHVwZGF0ZSB0aGUgdG1wZmlsZXMu
ZC8gZHJvcC1pbiBmaWxlCmFjY29yZGluZ2x5LgoKU2V0IHRoZSBjb25maWd1cmUgb3B0aW9uIHJ1
bnN0YXRlZGlyIHRvIC9ydW4gdG8gdXNlIHRoZSBwcmVmZXJyZWQgcGF0aAp0byBhdm9pZCB0aGUg
d2FybmluZyBhbmQgdXNlIHRoZSAvcnVuIGRpcmVjdG9yeSBjb25zaXN0ZW50bHkuIFNldHRpbmcK
dGhlIHZhbHVlIG9ubHkgYWZmZWN0cyB0aGUgcGF0aCBvZiB0aGVzZSBzb2NrZXRzIGFuZCB0byB0
aGUgUElEIGZpbGUsCndoaWNoIGlzIGFscmVhZHkgZXhwbGljaXRseSBzZXQgYnkgYW5vdGhlciBv
cHRpb24uCgpTaWduZWQtb2ZmLWJ5OiBKYW4gxIxlcm3DoWsgPHNhaXJvbkBzYWlyb24uY3o+Ci0t
LQogcGFja2FnZS9kYnVzL2RidXMubWsgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3BhY2thZ2UvZGJ1cy9kYnVzLm1r
IGIvcGFja2FnZS9kYnVzL2RidXMubWsKaW5kZXggMDk3Yjg5MjA1ZS4uYzYwYmY0NzNjZCAxMDA2
NDQKLS0tIGEvcGFja2FnZS9kYnVzL2RidXMubWsKKysrIGIvcGFja2FnZS9kYnVzL2RidXMubWsK
QEAgLTMzLDcgKzMzLDggQEAgREJVU19DT05GX09QVFMgPSBcCiAJLS1kaXNhYmxlLXhtbC1kb2Nz
IFwKIAktLWRpc2FibGUtZG94eWdlbi1kb2NzIFwKIAktLXdpdGgtc3lzdGVtLXNvY2tldD0vcnVu
L2RidXMvc3lzdGVtX2J1c19zb2NrZXQgXAotCS0td2l0aC1zeXN0ZW0tcGlkLWZpbGU9L3J1bi9t
ZXNzYWdlYnVzLnBpZAorCS0td2l0aC1zeXN0ZW0tcGlkLWZpbGU9L3J1bi9tZXNzYWdlYnVzLnBp
ZCBcCisJLS1ydW5zdGF0ZWRpcj0vcnVuCiAKIGlmZXEgKCQoQlIyX1NUQVRJQ19MSUJTKSx5KQog
REJVU19DT05GX09QVFMgKz0gTElCUz0nLXB0aHJlYWQnCi0tIAoyLjM0LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
