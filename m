Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B322D116EA
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 17:15:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1DB96074C;
	Sat, 29 Nov 2025 17:15:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1HO2RENCzzWH; Sat, 29 Nov 2025 17:15:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26FC760719
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26FC760719;
	Sat, 29 Nov 2025 17:15:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02919273
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 17:15:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3F6840C1C
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 17:15:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K4hrB5cKReXB for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 17:15:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a2e; helo=mail-vk1-xa2e.google.com;
 envelope-from=softwarej@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F4BA40BF8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F4BA40BF8
Received: from mail-vk1-xa2e.google.com (mail-vk1-xa2e.google.com
 [IPv6:2607:f8b0:4864:20::a2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F4BA40BF8
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 17:15:05 +0000 (UTC)
Received: by mail-vk1-xa2e.google.com with SMTP id
 71dfb90a1353d-5597a426807so1941067e0c.2
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 09:15:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764436504; x=1765041304;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yNk7lLCEBem1O94mvI6uX/6jdYDzDonjC1pnFDSJfBY=;
 b=Lv2/DcD8BJsMIv+TwBEiMPuI0u4EmH+A17gNJKo+fJ1ds6ne3a76HsotXYl+emymk0
 bZ7c/Q6S38hW4lCy5zfq/koHSlOjpXIjXPrcYIeMgINwCKe9LqWLtoPksI7rlbVV90Yl
 J4JhqO5rp0Gdek2bnhqOjjy2L05MUt+6NshYm73gJG7BwMbgTgIALLrZUKqkWftzR6hS
 SmHKrcVWGopnqQ5hhmg2onJBrGywrX9oXkMnipZy7jB3LSEx79LJGnU6QIhUBTakTRej
 qF6TTVzKdicgqv5XCGHZfLZb5Ah4tvLZyslz7A1n1PSpddAjLpT+n2cW3BF143T17C3D
 LPXA==
X-Gm-Message-State: AOJu0YzMYlM4LgYa2vZQfh5qNk9Pr3en9oP3gWIUqafSL1UMABKJNVvy
 2bn9RMTyyKImpNuz2O6hNtXBKFiBIQt5VhfWoKFnBL6GqpGYYONwPiC3esbDCt1+DW5jyTfdXm9
 jE92L0iQhqxhynOClSCGXlTXj6nSMWQAMoVyr
X-Gm-Gg: ASbGncvomSoDd629fY3VK5D3a0Wd5lqid29Y4DqqT7W01mc75J72qv2bA6WaJ0ETWVb
 e/bj+nRQKtLwNMEVFvj9ulOyvYDbjZ3vhy1WClAFP+1sPNzJ959CssdWdl3yjS9fPm3iZci4QCw
 gAIWeCKC88CQ0m16Og6Fsmb5t+Ps9ccnkioQWZ6auoOmlf0jPGIu7o/0/sLzSp+eLQJyAy64m/C
 amxBBvlDqDQOnrMo7OlAqnIR+/j/7y26PbNWGgOiLXDbuiEcOHnT1QsVkrWiPBUebLuOcc=
X-Google-Smtp-Source: AGHT+IFX6bP1QO9VXSMiCer6lU+m4r7BpCdoLcWXMn05ewsDBP2CEq7bm7qZGz1fJptF7xaq5zZCLIbXjFQv8wC7LrI=
X-Received: by 2002:a05:6122:2893:b0:55b:1a3a:aae5 with SMTP id
 71dfb90a1353d-55b8f00e3c4mr11974035e0c.16.1764436503895; Sat, 29 Nov 2025
 09:15:03 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Date: Sat, 29 Nov 2025 18:14:53 +0100
X-Gm-Features: AWmQ_blnHoUXHT1dqzrcWSeVdF9PvCcTlJ8JzgHmYNwdzJaUzHGPGbOP3u-_zog
Message-ID: <CAH+XeQYPBnXkXq4Fu0aBJ2UBR_U31ypza4z-1jf2Y78aWWiv-g@mail.gmail.com>
To: Baruch Siach via buildroot <buildroot@buildroot.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764436504; x=1765041304; darn=buildroot.org;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yNk7lLCEBem1O94mvI6uX/6jdYDzDonjC1pnFDSJfBY=;
 b=QKAU6enZ4ZElr8aGNwPkhhdosXfh4AqiIMFPFk1WTdgy/mwsxKAVAU/6wgA6RTFdJm
 lBYHQgQdNP2fsYPngnBGteu1hcbiQaNYkGov7wdzMWeOxoRbFbPDpwd18YhsnAKH/QDt
 hAHs5yu/L335sZQcNfUK/T3O+10AjlX3eRERb8+Mt0+AxOvLTw/ZN05ZLAAnT0SBfYRl
 UAKnB2w4y0+zOmUukf/NMQhvZq2l6eqwLM1nfZCNibov2vGmAAEfOqS51ND211rEZkXE
 9p34R5qvZEDbmsq5+aChjayP29TiqWfgkHZ2IC5hBnrOu5gJCpdA37mpTopO91o6uUts
 gF2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QKAU6enZ
Subject: [Buildroot] Compilation Issue with Commit
 793ebd5d28095c8df45a0d183d273d8a84b3f0a4
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

SGVsbG8gWWFubiwKClRoZSBjb21taXQgNzkzZWJkNWQyODA5NWM4ZGY0NWEwZDE4M2QyNzNkOGE4
NGIzZjBhNCBicm9rZSBteSBjb21waWxhdGlvbi4KQW4gQUkgc3VnZ2VzdGVkIHRoYXQgdGhlIHBy
b2JsZW0gaXMgYmVjYXVzZSB0aGUgc2NyaXB0CmBzdXBwb3J0L3NjcmlwdHMvY2hlY2stbWVyZ2Vk
YCByZXF1aXJlcyB0aGUgZm9sbG93aW5nIGNoYW5nZToKCmRpZmYgLS1naXQgYS9zdXBwb3J0L3Nj
cmlwdHMvY2hlY2stbWVyZ2VkIGIvc3VwcG9ydC9zY3JpcHRzL2NoZWNrLW1lcmdlZAppbmRleCA0
NDdhYmZkODE1Li4yM2ZkYWFjMmM4IDEwMDc1NQotLS0gYS9zdXBwb3J0L3NjcmlwdHMvY2hlY2st
bWVyZ2VkCisrKyBiL3N1cHBvcnQvc2NyaXB0cy9jaGVjay1tZXJnZWQKQEAgLTQ3LDYgKzQ3LDgg
QEAgd2hpbGUgZ2V0b3B0cyAidDp1YiIgT1BUOyBkbwogICAgICAgIGVzYWMKIGRvbmUKCitzaGlm
dCAkKChPUFRJTkQtMSkpCisKIGlmIFsgIiR7dHlwZX0iID0gInNrZWxldG9uIiBdOyB0aGVuCiAg
ICAgICAgc3RyaWN0PXRydWUKIGVsc2UKCkFmdGVyIGFwcGx5aW5nIHRoaXMgY2hhbmdlLCBteSBj
b21waWxhdGlvbiB3b3JrcyBhZ2FpbiwgaW4gdGhlIHNhbWUKd2F5IGFzIHJldmVydGluZyBjb21t
aXQgNzkzZWJkNWQyODA5NWM4ZGY0NWEwZDE4M2QyNzNkOGE4NGIzZjBhNC4KSSBoYXZlbuKAmXQg
Y2hlY2tlZCB0aGUgcmVhc29uIGZvciB0aGlzIGBzaGlmdGAgbXlzZWxmLgoKR3JlZXRpbmdzLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
