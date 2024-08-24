Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA27C5472C
	for <buildroot@archiver.kernel.org>; Sat, 24 Aug 2024 14:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05CAB605BD;
	Sat, 24 Aug 2024 14:16:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id quNCgp4EvS_8; Sat, 24 Aug 2024 14:16:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2BC7605C7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2BC7605C7;
	Sat, 24 Aug 2024 14:16:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AA2CF1BF329
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 14:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 998C681A64
 for <buildroot@lists.busybox.net>; Sat, 24 Aug 2024 14:16:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B7tpc3TJJYKr for <buildroot@lists.busybox.net>;
 Sat, 24 Aug 2024 14:16:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 51D9D81A58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51D9D81A58
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51D9D81A58
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 14:16:26 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-53346132348so3401177e87.2
 for <buildroot@buildroot.org>; Sat, 24 Aug 2024 07:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724508984; x=1725113784;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nMq5ph03xk3sG8BS4UZ/1JWaRsoL+p7PtO/xOdff2ks=;
 b=pvib5JEPk9yP9ZH+q0VMTJSx5u+NEbPDFgeJeQoe3vhJlsrYbQHJyV1Y/rrk8jsu3q
 clNKdzOTgp1pqBf//1A9cSCfdWe/bbX6PdxqBFxBILYqenMj5AIqmCudHU5TdwDkdXMC
 g/uD0GZJYJ/xoZ6ZuyEPw0QD8TMDGBDlxO3oAe7N8T+ug1KmC0G1qqNk6hh5CWhBPhzb
 q/wCogz9fGA+mmccUDtxjLAqYRP99HYteYEGhfRVjkTVoWz5wjr8VN60VqmvVWyzmWA2
 tHNh0VAIYyrhC5Hxx3ZaTJcxzCBmUSMSoRuKkRUOm3yKSEsRRXtsK/IlWdIQM5aoBxxg
 otJg==
X-Gm-Message-State: AOJu0YzLQakZQ3FOkPylqSha8l9+BVFW5LF6a3d2H335VwoQw5D6qwNT
 TRrRVDMNyPoCuUFkf5WFaTldljgDOXQlbfVxbpIZ63bn4cmsuiw2AOq6mE1SKU58Q0w5LXph3JH
 4LP8=
X-Google-Smtp-Source: AGHT+IEZU5/Dc03EGezG2JjK6E3RCv7gygCibqJhqDEku1ofoFUQV8SFvFqc1kj1GhjVqks0rmI5vw==
X-Received: by 2002:a05:6512:39c5:b0:533:46cc:a736 with SMTP id
 2adb3069b0e04-534387be65emr3484691e87.37.1724508983456; 
 Sat, 24 Aug 2024 07:16:23 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-25-99-149.retail.telecomitalia.it. [79.25.99.149])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f4f46a2sm405908466b.208.2024.08.24.07.16.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Aug 2024 07:16:23 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 24 Aug 2024 16:16:16 +0200
Message-ID: <20240824141616.3139902-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1724508984; x=1725113784;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nMq5ph03xk3sG8BS4UZ/1JWaRsoL+p7PtO/xOdff2ks=;
 b=XdJ1Zf6tOUw00XdgmNYTdP6Ng3kIGyAXV55sBbsEKCfVnNvN1oumOc9KvvboY+daUj
 Njb3D6rXdAhaGriuWQjM53NOdaPltxMBrGOAetc+yFCL6v6d/umttiLlTakq3fb8Ivcd
 /dHnqPm1c9oeD5zlQHD0iL5wXUZS9yD6TqORs=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=XdJ1Zf6t
Subject: [Buildroot] [PATCH 1/1] package/babeld: bump to version 1.10
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LSBSZW1vdmVkIHRoZSBkaXNhbWJpZ3VhdGlvbiBjb2RlOiBzb3VyY2Utc3BlY2lmaWMgcm91dGlu
ZyBpcyBubyBsb25nZXIKICBzdXBwb3J0ZWQgZm9yIElQdjQsIGFuZCBmb3IgSVB2NiBvbmx5IG9u
IExpbnV4IDMuMTEgb3IgbGF0ZXIuCi0gRml4ZWQgYW4gaXNzdWUgaGFuZGxpbmcgb2YgcmV0cmFj
dGlvbnMgd2l0aCBubyBuZXh0IGhvcCwgd2hpY2ggY2F1c2VkCiAgaW50ZXJvcGVyYWJpbGl0eSBw
cm9ibGVtcyB3aXRoIEJJUkQuICBUaGFua3MgdG8gRmFiaWFuIEJsw6RzZS4KLSBJZiBza2lwLWtl
cm5lbC1zZXR1cCBpcyBzZXQsIHdlIG5vIGxvbmdlciBkaXNhYmxlIHRoZSBycF9maWx0ZXIsIHdo
aWNoCiAgbWFrZXMgYmFiZWxkIHdvcmsgaW4gY29udGFpbmVycy4gIFRoYW5rcyB0byBNYXJ0aW4g
V2VpbmVsdC4KCkZpeGVzOgotIGh0dHA6Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm9yZy9yZXN1bHRz
LzI0NDcwNjBjODZhY2YxYmQ4ZDZlZTBiY2Y4ZjliNmFkY2RmYzUwYzkKClNpZ25lZC1vZmYtYnk6
IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25zLmNvbT4KLS0t
CiBwYWNrYWdlL2JhYmVsZC9iYWJlbGQuaGFzaCB8IDIgKy0KIHBhY2thZ2UvYmFiZWxkL2JhYmVs
ZC5tayAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9iYWJlbGQvYmFiZWxkLmhhc2ggYi9wYWNrYWdl
L2JhYmVsZC9iYWJlbGQuaGFzaAppbmRleCAyZTA1MTNlZmEwMTAuLjg0NmMyMWRkMjljNiAxMDA2
NDQKLS0tIGEvcGFja2FnZS9iYWJlbGQvYmFiZWxkLmhhc2gKKysrIGIvcGFja2FnZS9iYWJlbGQv
YmFiZWxkLmhhc2gKQEAgLTEsMyArMSwzIEBACiAjIExvY2FsbHkgY29tcHV0ZWQKLXNoYTI1NiAg
MTU0ZjAwZTBhOGJmMzVkNmVhOTAyODg4NmMzZGM1YzNjMzQyZGQxYTM2N2RmNTVlZjI5YTU0N2I3
NTg2N2YwNyAgYmFiZWxkLTEuOS4yLnRhci5negorc2hhMjU2ICBhNWY1NGEwODMyMjY0MGU5NzM5
OWJmNGQxNDExYTM0MzE5ZTZlMjc3ZmJiNmZjNDk2NmYzOGExN2Q3MmE4ZGVhICBiYWJlbGQtMS4x
MC50YXIuZ3oKIHNoYTI1NiAgYjQxNWM0MTI5MmNlZGVmNmM5N2IyNDM2MDllNTA1NTI4ODdjMjkz
NDM1NjZjNjM5ZjIzMjgyZDMxZWZkMmFmZCAgTElDRU5DRQpkaWZmIC0tZ2l0IGEvcGFja2FnZS9i
YWJlbGQvYmFiZWxkLm1rIGIvcGFja2FnZS9iYWJlbGQvYmFiZWxkLm1rCmluZGV4IDc4NWZhMmJj
ZTlmMS4uOGVjNWQ1N2QzZjA0IDEwMDY0NAotLS0gYS9wYWNrYWdlL2JhYmVsZC9iYWJlbGQubWsK
KysrIGIvcGFja2FnZS9iYWJlbGQvYmFiZWxkLm1rCkBAIC00LDcgKzQsNyBAQAogIwogIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMKIAotQkFCRUxEX1ZFUlNJT04gPSAxLjkuMgorQkFCRUxEX1ZFUlNJ
T04gPSAxLjEwCiBCQUJFTERfU0lURSA9IGh0dHA6Ly93d3cucHBzLnVuaXYtcGFyaXMtZGlkZXJv
dC5mci9+amNoL3NvZnR3YXJlL2ZpbGVzCiBCQUJFTERfTElDRU5TRSA9IE1JVAogQkFCRUxEX0xJ
Q0VOU0VfRklMRVMgPSBMSUNFTkNFCi0tIAoyLjQzLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
