Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F91C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 13:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25ACD60898;
	Fri, 12 Apr 2024 13:27:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o2GpzCzmdEmj; Fri, 12 Apr 2024 13:27:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A5CD2608A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5CD2608A3;
	Fri, 12 Apr 2024 13:27:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3F5F91BF3A9
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 13:27:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9849280F62
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 13:27:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hkJ3Qteb5VEi for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 13:27:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A033A80F53
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A033A80F53
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A033A80F53
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 13:27:40 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3465921600dso740663f8f.3
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 06:27:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712928458; x=1713533258;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=75UEMKxW3PENqC1yVV06gj0fYqrizarhnJJGgz8j1PE=;
 b=MTha1cHs77Mx/JZkHHVyuMGX2uP2usgiRqMjAQVHjqCpOnOoaQCptK0XcH+6hRQzrs
 WzCZUALOdESXFcJTFj9ZmHtv949lFkSLf1431UjFDX2BYEpBFwiyEWZHykMsA7ze9lJU
 2d/Euj/yY+WSIYaSOUiYUapNBDto4J9nR73btSGVJjlM3tui6g9yo83+k//x14rYbmPG
 sAKzbLAVCWv6e9U8E1Qj4qlf8sekZ3D52Sndlhfpkz9EV3eob4QHq93qHRLGapklaW/q
 gbiw1y1R0uEo5pV5nQPBDF4B/bShQh0pl3t+NIEXIw3Y4euCcYFVq1kO1PCcoJ0pY2j0
 l7lg==
X-Gm-Message-State: AOJu0YzP0qFTq2csI/8gCUtKM1btj9QFoVaStmUWQ3xGIuZY/9pD7CEf
 QR4RWPEHGD8CCK8F+jx4ISKs/tYEyxascLO8EWAuKMWKMXf9JjMbhNJDxmKmusmyZ7Kd3Q0NUIA
 Yf4U=
X-Google-Smtp-Source: AGHT+IEoxUKkhIi0J9BSuCsgmtOCsPfvPNgwWikcslMNuTu3AEHf/HR7e6vdRk0DFwrSHIkbEUSh4A==
X-Received: by 2002:adf:fe90:0:b0:343:740c:5d14 with SMTP id
 l16-20020adffe90000000b00343740c5d14mr1734712wrr.31.1712928457822; 
 Fri, 12 Apr 2024 06:27:37 -0700 (PDT)
Received: from localhost.localdomain ([79.132.235.33])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a5d6a84000000b00343a66f6be4sm4288163wru.24.2024.04.12.06.27.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 06:27:37 -0700 (PDT)
X-Google-Original-From: Thomas Perale <thomas.perale@mind.be>
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 15:26:52 +0200
Message-ID: <20240412132659.1168317-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1712928458; x=1713533258; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=75UEMKxW3PENqC1yVV06gj0fYqrizarhnJJGgz8j1PE=;
 b=LgVHALkrQqymeEPmvAxGXdpme9/nUg2f8GtxXRo4Xe2Qa77CSeZwxPdZ1YYjCqOzw/
 tfVTkkZenFNSnxELoZ7cyTPqH88j3lAb8ixTTlOOpzdxYFa65r/o5kCtOED4qpPFgdXL
 UtBJ/WqAlMJv8yJCEXneK69+ayCAGQVM2vouE6FtXSzgE7jp2NgBxztniBhV8gsIsZCE
 UcPBgfa0quxyapD3FED1/NMST0MMfCxFC+XjDu+seV5g0VieFHgevfpnpLKxpCzIS9NN
 Q7W4SeZHY6scdb2HvD24ZK7tqe8z7uRnBK9zYuv8YvZr6BXMWgWCqPabeFsRy9G72RNM
 9tGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=LgVHALkr
Subject: [Buildroot] [PATCH 0/6]  support for a pre-built Go compiler
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@essensium.com>
Cc: Christian Stewart <christian@aperture.us>,
 Geoff Levand <geoff@infradead.org>, Anisse Astier <anisse@astier.eu>,
 Thomas Perale <thomas.perale@mind.be>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW1wcm92ZW1lbnQgc3VnZ2VzdGVkIG9uIHRoZSBidWlsZHJvb3QgVE9ETyBsaXN0IChodHRwczov
L3d3dy5lbGludXgub3JnL0J1aWxkcm9vdCNUb2RvX2xpc3QpLgpUaGlzIHBhdGNoIGFkZHMgc3Vw
cG9ydCBmb3IgYSBwcmUtYnVpbHQgdmVyc2lvbiBvZiB0aGUgR28gY29tcGlsZXIgdGhhdApkb2Vz
bid0IHJlcXVpcmUgdXNlcnMgdG8gZ28gdGhyb3VnaCB0aGUgZGlmZmVyZW50IGNvbXBpbGF0aW9u
IHN0YWdlcyBvZgp0aGUgR28gY29tcGlsZXIgYW5kIHNwZWVkcyB1cCB0aGUgb3ZlcmFsbCBidWls
ZCB0aW1lLgoKVGhpcyBwYXRjaCBpcyBhIG5ldyB2ZXJzaW9uIG9mIHRoZSBwcm9wb3NhbCBJIG1h
ZGUgbGFzdCB5ZWFyCihzZWUgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYnVpbGRyb290L0NBK2g4
UjJwTlJyQnNDaEtTM1BIUXRUMF9yc1ZGM1dpM0x3TVREOWpLRm9LZjFvdDItQUBtYWlsLmdtYWls
LmNvbS8jYikKYW5kIGEgcmViYXNlIG9mIG15IHByZXZpb3VzIHBhdGNoIChodHRwczovL2xvcmUu
a2VybmVsLm9yZy9idWlsZHJvb3QvMjAyMzEwMDQxNDIzMDMuMjAzNTIwLTUtdGhvbWFzLnBlcmFs
ZUBlc3NlbnNpdW0uY29tL1QvKQp0byBzdXBwb3J0IG5ldyBHbyAxLjIyIHRoYXQgcmVxdWlyZSBh
IDNyZCBib290c3RyYXAgc3RhZ2UuCgpJdCBpbnRyb2R1Y2VzIGEgbmV3IGRpcmVjdG9yeSBzdHJ1
Y3R1cmUgZm9yIGhvc3QgY29tcGlsZXJzIHdpdGggZGlmZmVyZW50CnByb3ZpZGVyczoKCiAgICBw
YWNrYWdlLwogICAg4pSc4pSAIGdvLyAgICAgICAgICAgICAgICAgICAgIDwtLSBWaXJ0dWFsIHBh
Y2thZ2UKICAgIOKUgiAg4pSc4pSAIGdvLXNyYy8gICAgICAgICAgICAgIDwtLSBCdWlsZCBmcm9t
IHNvdXJjZSBvcHRpb24KICAgIOKUgiAg4pSc4pSAIGdvLWJpbi8gICAgICAgICAgICAgIDwtLSBE
b3dubG9hZCBwcmUtYnVpbHQgb3B0aW9uCiAgICDilIIgIOKUnOKUgCBnby1ib290c3RyYXAtc3Rh
Z2UxLyA8LS0gRGVwZW5kZW5jeSBmb3IgZ28tYm9vdHN0cmFwLXN0YWdlMgogICAg4pSCICDilJzi
lIAgZ28tYm9vdHN0cmFwLXN0YWdlMi8gPC0tIERlcGVuZGVuY3kgZm9yIGdvLWJvb3RzdHJhcC1z
dGFnZTMKICAgIOKUgiAg4pSc4pSAIGdvLWJvb3RzdHJhcC1zdGFnZTMvIDwtLSBEZXBlbmRlbmN5
IGZvciBnby1zcmMKICAgIOKUgiAg4pSc4pSAIGdvLm1rICAgICAgICAgICAgICAgIDwtLSBDb21t
b24gdmFyaWFibGVzCiAgICDilIIgIOKUnOKUgCBDb25maWcuaW4gICAgICAgICAgICA8LS0gQ29t
bW9uIHZhcmlhYmxlcy92aXJ0dWFsIHBhY2thZ2UgZGVmaW5pdGlvbgoKVGhlIHN1YmRpcmVjdG9y
eSBzdHJ1Y3R1cmUgaXMgdXNlZCB0byBwdXQgdGhlIGBHT19WRVJTSU9OYCB2YXJpYWJsZSBpbgpj
b21tb24gYmV0d2VlbiB0aGUgZGlmZmVyZW50IHByb3ZpZGVycy4KClRoaXMgc3ViZGlyZWN0b3J5
IHByb3Bvc2FsIHNob3VsZCBiZSBleHRlbmRlZCB0byB0aGUgUnVzdCBjb21waWxlciBjYXNlIGFu
ZApOb2RlSlMgcHJvcG9zYWwgVGhvbWFzIFBldGF6em9uaSBkaWQgKGh0dHBzOi8vcGF0Y2h3b3Jr
Lm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3QvbGlzdC8/c2VyaWVzPTMxOTk2NykKdG8gdW5p
ZnkgdGhlIG5hbWluZyBvZiB0aGUgZGlmZmVyZW50IGNvbXBpbGVycyBvcHRpb25zLgoKVGhvbWFz
IFBlcmFsZSAoNik6CiAgREVWRUxPUEVSUzogYWRkIFRob21hcyBQZXJhbGUgZm9yICdnbycKICBw
YWNrYWdlL2dvOiBuZXcgc3ViZGlyZWN0b3J5IGZvciBnbyB2YXJpYW50cwogIHBhY2thZ2UvZ286
IG1ha2UgaG9zdCBwYWNrYWdlIGEgdmlydHVhbCBwYWNrYWdlCiAgcGFja2FnZS9wa2ctZ29sYW5n
OiBzZWxlY3QgZ28gY29tcGlsZXIKICBwYWNrYWdlL2dvL2dvLWJpbjogbmV3IGdvIHByb3ZpZGVy
CiAgc3VwcG9ydC90ZXN0aW5nOiBhZGQgdGVzdHMgZm9yIEdvIHByb3ZpZGVycwoKIC5jaGVja3Bh
Y2thZ2VpZ25vcmUgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAyICstCiBERVZFTE9QRVJT
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNiArLS0KIHBhY2thZ2UvQ29u
ZmlnLmluLmhvc3QgICAgICAgICAgICAgICAgICAgICAgICB8ICAzIC0tCiBwYWNrYWdlL2JhbGVu
YS1lbmdpbmUvQ29uZmlnLmluICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL2NuaS1wbHVn
aW5zL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL2NvbnRhaW5lcmQv
Q29uZmlnLmluICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL2NydWNpYmxlL0NvbmZp
Zy5pbiAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL2RlbHZlL0NvbmZpZy5pbiAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL2RlbHZlL0NvbmZpZy5pbi5ob3N0
ICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL2RvY2tlci1jbGkvQ29uZmlnLmluICAg
ICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL2RvY2tlci1jb21wb3NlL0NvbmZpZy5pbiAg
ICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL2RvY2tlci1lbmdpbmUvQ29uZmlnLmluICAgICAg
ICAgICAgICAgfCAgMSArCiBwYWNrYWdlL2VtYmlnZ2VuLWRpc2svQ29uZmlnLmluICAgICAgICAg
ICAgICAgfCAgMSArCiBwYWNrYWdlL2ZsYW5uZWwvQ29uZmlnLmluICAgICAgICAgICAgICAgICAg
ICAgfCAgMSArCiBwYWNrYWdlL2dpdGxhYi1ydW5uZXIvQ29uZmlnLmluICAgICAgICAgICAgICAg
fCAgMSArCiBwYWNrYWdlL2dvL0NvbmZpZy5pbi5ob3N0ICAgICAgICAgICAgICAgICAgICAgfCA0
NiArKysrKysrKysrKysrKysrCiBwYWNrYWdlL2dvL2dvLWJpbi9Db25maWcuaW4uaG9zdCAgICAg
ICAgICAgICAgfCAxNCArKysrKwogcGFja2FnZS9nby9nby1iaW4vZ28tYmluLmhhc2ggICAgICAg
ICAgICAgICAgIHwgIDggKysrCiBwYWNrYWdlL2dvL2dvLWJpbi9nby1iaW4ubWsgICAgICAgICAg
ICAgICAgICAgfCAxOSArKysrKysrCiAuLi4vZ28tYm9vdHN0cmFwLXN0YWdlMS9Db25maWcuaW4u
aG9zdCAgICAgICAgfCAgMAogLi4uL2dvLWJvb3RzdHJhcC1zdGFnZTEuaGFzaCAgICAgICAgICAg
ICAgICAgIHwgIDAKIC4uLi9nby1ib290c3RyYXAtc3RhZ2UxLm1rICAgICAgICAgICAgICAgICAg
ICB8ICAwCiAuLi4vZ28tYm9vdHN0cmFwLXN0YWdlMi9Db25maWcuaW4uaG9zdCAgICAgICAgfCAg
MAogLi4uL2dvLWJvb3RzdHJhcC1zdGFnZTIuaGFzaCAgICAgICAgICAgICAgICAgIHwgIDAKIC4u
Li9nby1ib290c3RyYXAtc3RhZ2UyLm1rICAgICAgICAgICAgICAgICAgICB8ICAwCiAuLi4vZ28t
Ym9vdHN0cmFwLXN0YWdlMy9Db25maWcuaW4uaG9zdCAgICAgICAgfCAgMAogLi4uL2dvLWJvb3Rz
dHJhcC1zdGFnZTMuaGFzaCAgICAgICAgICAgICAgICAgIHwgIDAKIC4uLi9nby1ib290c3RyYXAt
c3RhZ2UzLm1rICAgICAgICAgICAgICAgICAgICB8ICAwCiAuLi5leHBsaWNpdC1vcHRpb24tZm9y
LWNyb3NzY29tcGlsYXRpb24ucGF0Y2ggfCAgMAogLi4ubGR2Y3MtZmFsc2Utd2hlbi1idWlsZGlu
Zy1nby1ib290c3RyLnBhdGNoIHwgIDAKIHBhY2thZ2UvZ28ve2dvLmhhc2ggPT4gZ28tc3JjL2dv
LXNyYy5oYXNofSAgICB8ICAwCiBwYWNrYWdlL2dvL2dvLXNyYy9nby1zcmMubWsgICAgICAgICAg
ICAgICAgICAgfCA1NCArKysrKysrKysrKysrKysrKysrCiBwYWNrYWdlL2dvL2dvLm1rICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCA0MiArKy0tLS0tLS0tLS0tLS0KIHBhY2thZ2UvZ29j
cnlwdGZzL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvbWVuZGVy
LWFydGlmYWN0L0NvbmZpZy5pbi5ob3N0ICAgICAgICB8ICAxICsKIHBhY2thZ2UvbWVuZGVyLWNv
bm5lY3QvQ29uZmlnLmluICAgICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvbWVuZGVyL0NvbmZp
Zy5pbiAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvbW9ieS1idWlsZGtpdC9D
b25maWcuaW4gICAgICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvbW9ieS1idWlsZGtpdC9Db25m
aWcuaW4uaG9zdCAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvbmVyZGN0bC9Db25maWcuaW4gICAg
ICAgICAgICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvcnVuYy9Db25maWcuaW4gICAgICAgICAg
ICAgICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvcnVuYy9Db25maWcuaW4uaG9zdCAgICAgICAg
ICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvdGluaWZpZXIvQ29uZmlnLmluICAgICAgICAgICAg
ICAgICAgICB8ICAxICsKIHBhY2thZ2Uvd3RmdXRpbC9Db25maWcuaW4gICAgICAgICAgICAgICAg
ICAgICB8ICAxICsKIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfZ28ucHkgICAg
ICB8IDQxICsrKysrKysrKysrKysrCiA0NSBmaWxlcyBjaGFuZ2VkLCAyMTMgaW5zZXJ0aW9ucygr
KSwgNDUgZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9nby9nby1iaW4v
Q29uZmlnLmluLmhvc3QKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2dvL2dvLWJpbi9nby1i
aW4uaGFzaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZ28vZ28tYmluL2dvLWJpbi5tawog
cmVuYW1lIHBhY2thZ2UveyA9PiBnb30vZ28tYm9vdHN0cmFwLXN0YWdlMS9Db25maWcuaW4uaG9z
dCAoMTAwJSkKIHJlbmFtZSBwYWNrYWdlL3sgPT4gZ299L2dvLWJvb3RzdHJhcC1zdGFnZTEvZ28t
Ym9vdHN0cmFwLXN0YWdlMS5oYXNoICgxMDAlKQogcmVuYW1lIHBhY2thZ2UveyA9PiBnb30vZ28t
Ym9vdHN0cmFwLXN0YWdlMS9nby1ib290c3RyYXAtc3RhZ2UxLm1rICgxMDAlKQogcmVuYW1lIHBh
Y2thZ2UveyA9PiBnb30vZ28tYm9vdHN0cmFwLXN0YWdlMi9Db25maWcuaW4uaG9zdCAoMTAwJSkK
IHJlbmFtZSBwYWNrYWdlL3sgPT4gZ299L2dvLWJvb3RzdHJhcC1zdGFnZTIvZ28tYm9vdHN0cmFw
LXN0YWdlMi5oYXNoICgxMDAlKQogcmVuYW1lIHBhY2thZ2UveyA9PiBnb30vZ28tYm9vdHN0cmFw
LXN0YWdlMi9nby1ib290c3RyYXAtc3RhZ2UyLm1rICgxMDAlKQogcmVuYW1lIHBhY2thZ2UveyA9
PiBnb30vZ28tYm9vdHN0cmFwLXN0YWdlMy9Db25maWcuaW4uaG9zdCAoMTAwJSkKIHJlbmFtZSBw
YWNrYWdlL3sgPT4gZ299L2dvLWJvb3RzdHJhcC1zdGFnZTMvZ28tYm9vdHN0cmFwLXN0YWdlMy5o
YXNoICgxMDAlKQogcmVuYW1lIHBhY2thZ2UveyA9PiBnb30vZ28tYm9vdHN0cmFwLXN0YWdlMy9n
by1ib290c3RyYXAtc3RhZ2UzLm1rICgxMDAlKQogcmVuYW1lIHBhY2thZ2UvZ28veyA9PiBnby1z
cmN9LzAwMDEtYnVpbGQuZ28tZXhwbGljaXQtb3B0aW9uLWZvci1jcm9zc2NvbXBpbGF0aW9uLnBh
dGNoICgxMDAlKQogcmVuYW1lIHBhY2thZ2UvZ28veyA9PiBnby1zcmN9LzAwMDItY21kLWRpc3Qt
c2V0LWJ1aWxkdmNzLWZhbHNlLXdoZW4tYnVpbGRpbmctZ28tYm9vdHN0ci5wYXRjaCAoMTAwJSkK
IHJlbmFtZSBwYWNrYWdlL2dvL3tnby5oYXNoID0+IGdvLXNyYy9nby1zcmMuaGFzaH0gKDEwMCUp
CiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9nby9nby1zcmMvZ28tc3JjLm1rCiBjcmVhdGUg
bW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9nby5weQoKLS0K
Mi40NC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
