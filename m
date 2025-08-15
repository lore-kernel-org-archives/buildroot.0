Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3060CCA0ED1
	for <buildroot@archiver.kernel.org>; Fri, 15 Aug 2025 12:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D930660E40;
	Fri, 15 Aug 2025 12:24:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qxj5OoQHmQoR; Fri, 15 Aug 2025 12:24:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E69160E44
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E69160E44;
	Fri, 15 Aug 2025 12:24:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C7123196
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 12:24:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB67C60E41
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 12:24:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mALV0sK2HlGP for <buildroot@buildroot.org>;
 Fri, 15 Aug 2025 12:24:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B03B160E3E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B03B160E3E
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B03B160E3E
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 12:24:02 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-6188b690517so2872876a12.1
 for <buildroot@buildroot.org>; Fri, 15 Aug 2025 05:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755260640; x=1755865440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EHeamGBQjLVk5p7kRBC56c16MPuGHnw3Lrqc7NKk1DI=;
 b=VztHurZ+fejOCAzPzNjw9vbpYtePSZaF8ijUowL3J0B6vW+UYWiSrt68PLPbJ+jA/F
 NisAkLawMQeH+9OrdxcktJF1enkQUpQ/QYMAyizTR16vnMqoh9bsCB3rJxd/tUfk6TTD
 jDgfM+CpXp+a4YEF0NvfafH4N/ZJ2zUxPnSDsT/qpku2+qdJh/q3CwUT2iEVhGm5bTH4
 ixAit8b9/m49NVaNobkFvP6GH7RTUIRYQoWbONCxxJF2RzeWIXkvSbRQCUNQUnsbcUJr
 6YmZQ6lbwEcJpDdtQpJU8ibT6JEiKSlcNRqpz+30WrKDNp47O7ixfvSwWvDj1Fy2KG7F
 jsyg==
X-Gm-Message-State: AOJu0YzAOdo2oQHSXzVejNF/6ON1/E5GAyobEiew8c+ILA4gFe7RKunt
 Ugoriu6EVaE+/F98T1LYcXvzViFX3QC2xKdks2+JwjVNMnxdNI0KsMwqnJUv09w=
X-Gm-Gg: ASbGnctuNExYTUrDaP7SH5/ZhHVQBDMVnbeHPyuxM/zfL4guxcCsvxOHeuN+zpG5xDp
 F9ISm1PjZ41jQU8sVrg7fjKy+KzW7tzMCVDkVylzrjNTJsDyhbtNJ5483+SHX99DUEF7sj4RiWX
 50mcRMgq9OGRdCgCevMoI1CEgf+klQkfHL/eUxuc1G4Et9/Ob+M0YfPpLHO7Qr0+NYnFlOVaNdm
 3Cjg+s/nb8Lo2gm2fFct2fy2vgil+COgRH/iBvwrdR8PSXVanAER409+XG1RmByuyF5mFg+iiyH
 TZoseAwh91WrRKiQtwxOtK9mhnHx+st7hjFyR7ZaC2RMTPKRLxUGcOHM1UUbDDdxViN9jpdeI4u
 OAIlHs75IKSdbqUKtBzJ2L1J0PAQe7ML4SUfc0M9DkcVD/yOu
X-Google-Smtp-Source: AGHT+IGsZE93ttX+jjf93bDPRwD+Eo4XwYv/H85mo5JWc3D1q/iL8k6SJusH85zaA7USLruA6LsW9g==
X-Received: by 2002:a17:907:6d17:b0:ae6:d47a:105d with SMTP id
 a640c23a62f3a-afcdc30d190mr168053566b.55.1755260640322; 
 Fri, 15 Aug 2025 05:24:00 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-afcdce53f54sm141387466b.24.2025.08.15.05.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 05:23:59 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: elmehdi.younes@smile.fr, thomas.petazzoni@bootlin.com,
 romain.naour@smile.fr
Date: Fri, 15 Aug 2025 14:23:23 +0200
Message-ID: <20250815122358.92152-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <40493e73-af96-4c23-a118-ec1a83aa5936@smile.fr>
References: <40493e73-af96-4c23-a118-ec1a83aa5936@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1755260640; x=1755865440; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EHeamGBQjLVk5p7kRBC56c16MPuGHnw3Lrqc7NKk1DI=;
 b=l0IfcUuRfROkWWkXnA+h1a4PdBz7C2TS3F1G7iQB407E2VOcmfATeWRCYVOS/pEV2Q
 ZZ+6J1qx443NtJzV5lLQBY6dwqcu66kSLHzMXfoMMaQlwOENqWRnBNOOek+jMCR6C1+H
 Fq9ce4sCGweyEq0cAiF0iWt7EpTwOjacemFJwscUIKIt9UBidJ/BPdCd5GSBKpohvny6
 g5PEOBp3K2dUdM7JCghp9Nkg66YL4S8L9Krpn6F+WLWVeLstPTWp57RM291VphecB7VA
 qih8F59sXjJAM/9VmAwXgiI38ICq7rlup5fhiGlP8p6aBBPyZsXHXP80A+ZB2ACwLnNk
 kBBQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=l0IfcUuR
Subject: [Buildroot] [v6, 1/2] package/uutils-coreutils: new package
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

SGkgRWwgTWVoZGksCgpUaGFua3MgYSBsb3QgZm9yIHRlc3RpbmcgYW5kIGZvciBzaGFyaW5nIHRo
ZSBkZXRhaWxzLiBJIHJlYWxseSBhcHByZWNpYXRlIGl0LgoKQWNjb3JkaW5nIG15IGV4cGVyaWVu
Y2UsIHRoZSAnLVdpbmNvbXBhdGlibGUtcG9pbnRlci10eXBlcycgaXNzdWUgaXMgcHJldHR5CmNv
bW1vbiB3aGVuIG1vdmluZyB0byBHQ0MgMTUuCgogIC0gSeKAmXZlIHNlZW4gaXQgbWFueSB0aW1l
cyBiZWZvcmUgaW4gb3RoZXIgcHJvamVjdHMKICAtIEl04oCZcyBtZW50aW9uZWQgaW4gcnVzdC1v
bmlnIFsxXQogIC0gT3RoZXIgcGFja2FnZXMgaW4gQnVpbGRyb290IGhhdmUgYWxzbyBydW4gaW50
byBpdCBbMl0KCkFzIHRoZSBwcm9ibGVtIGlzIHF1aXRlIHdpZGVzcHJlYWQsIGl0IGhhcyBhbHJl
YWR5IGJlZW4gc29sdmVkIG9uIHRoZSAnbWFpbicKYnJhbmNoIGJ5IHVwZGF0aW5nIHRoZSBvbmln
dXJ1bWEgY3JhdGUgdmVyc2lvbi4gSSB0cmllZCB0aGUgbGF0ZXN0IHZlcnNpb24KKDllNTBmN2Yp
LiBOb3cgYnVpbGQgd2l0aCBCb290bGluIGFuZCBnbGliYyBpcyBmaW5lLgoKCi4vdXRpbHMvdGVz
dC1wa2cgLXAgdXV0aWxzLWNvcmV1dGlscyAgLWMgdXV0aWxzLWNvcmV1dGlscy5jb25maWcKICAg
ICAgICAgICAgICAgICAgICBib290bGluLWFybXY1LXVjbGliYyBbMS82XTogU0tJUFBFRAogICAg
ICAgICAgICAgICAgICAgICBib290bGluLWFybXY3LWdsaWJjIFsyLzZdOiBPSwogICAgICAgICAg
ICAgICAgICAgYm9vdGxpbi1hcm12N20tdWNsaWJjIFszLzZdOiBTS0lQUEVECiAgICAgICAgICAg
ICAgICAgICAgIGJvb3RsaW4teDg2LTY0LW11c2wgWzQvNl06IE9LCiAgICAgICAgICAgICAgICAg
ICAgICBici1hcm0tZnVsbC1zdGF0aWMgWzUvNl06IFNLSVBQRUQKICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBhcm0tYWFyY2g2NCBbNi82XTogT0sKNiBidWlsZHMsIDMgc2tpcHBlZCwgMCBi
dWlsZCBmYWlsZWQsIDAgbGVnYWwtaW5mbyBmYWlsZWQsIDAgc2hvdy1pbmZvIGZhaWxlZAoKU28s
IEkgc3VnZ2VzdCB3ZSBjb25jZW50cmF0ZSBvbiBvdGhlciBhcmVhcyBmb3IgaW1wcm92ZW1lbnQu
IEluIHRoZSBtZWFudGltZSwKdGhlIG5ldyByZWxlYXNlIG9mIHV1dGlscy1jb3JldXRpbHMgd2ls
bCBiZWNvbWUgYXZhaWxhYmxlLCBhbmQgdGhlIGlzc3VlIHdpbGwKZGlzYXBwZWFyIGF1dG9tYXRp
Y2FsbHkuIElmIG5vdCwgdGhlbiB3ZSBrbm93IHRoZSByZWFzb24gYW5kIHRoZSB3b3JrYXJvdW5k
cyB0bwpjb3BlIHdpdGggaXQuCgpbMV0gLSBodHRwczovL2dpdGh1Yi5jb20vcnVzdC1vbmlnL3J1
c3Qtb25pZy9pc3N1ZXMvMTkxClsyXSAtIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9v
dC8yMDI1MDczMDE5MDExOC40NDg5OTctMS1iZXJuZEBrdWhscy5uZXQvCgpSZWdhcmRzLApBbGV4
YW5kZXIKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
