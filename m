Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72CFCE7C4C1
	for <buildroot@archiver.kernel.org>; Wed,  4 Oct 2023 14:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B93C60B1C;
	Wed,  4 Oct 2023 14:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B93C60B1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tpzm26vPuc75; Wed,  4 Oct 2023 14:23:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4170560B33;
	Wed,  4 Oct 2023 14:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4170560B33
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4D29A1BF47F
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 14:23:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 269D441893
 for <buildroot@lists.busybox.net>; Wed,  4 Oct 2023 14:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 269D441893
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Sqg9aGtHGC0b for <buildroot@lists.busybox.net>;
 Wed,  4 Oct 2023 14:23:22 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D23B4002B
 for <buildroot@buildroot.org>; Wed,  4 Oct 2023 14:23:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D23B4002B
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9b6559cbd74so418965566b.1
 for <buildroot@buildroot.org>; Wed, 04 Oct 2023 07:23:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696429399; x=1697034199;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A8JrrYrpLv2mi/XnPXvY3RLdEdPmdSrt52OMbsDcn2M=;
 b=qoAR64V+KtzR/64Oc0GKCZPBefLnlytI83hMGFFZSxj00DzstS7+EoAab0HI+GB0Ta
 1aC6/wWdmHNOhUIDeR5Ub+5bTTEFXfHpSNzJKhEaMZpEn4+OYrNPnkrTqbG0vdWxS+q3
 /gvnfvb/hs+R0t0VNBVFa1H//wiGw5uXUXXQl6Y9B+rIsV+Bqe+liQ219YtHnO+A0z4U
 4rdCHA37+T13kbQjmXvnRPqzefsKArwupb04L0m3TEOBtrhGYvnrMs0BvXYLn8sHcVPI
 eDgiWZHK5dczJHKRJKHYkCjeUILthC1m2t99WO9jmBfeuPCKT59cdxb0Pa0PnyeNe/f/
 6FsQ==
X-Gm-Message-State: AOJu0YzhU9SJDZppjDRVSjPd5ykYxc8OBZtoyHRhkGvsg6t15oSQIATL
 j8Pk3y85ekhFjNzvvXN8EXN1bvbZveNkLM0iJPx2lA==
X-Google-Smtp-Source: AGHT+IFwWN124xNnv69dMvxqkqYYM+6O3k2q7iLRckHzATxfUfbLvepmFrgtWlEbtzmRL9hrAOqEpQ==
X-Received: by 2002:a17:906:2254:b0:9b9:4509:d575 with SMTP id
 20-20020a170906225400b009b94509d575mr770474ejr.2.1696429399100; 
 Wed, 04 Oct 2023 07:23:19 -0700 (PDT)
Received: from localhost.localdomain ([79.132.253.132])
 by smtp.gmail.com with ESMTPSA id
 dv7-20020a170906b80700b009a5f7fb51dcsm2851805ejb.42.2023.10.04.07.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 07:23:18 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  4 Oct 2023 16:22:56 +0200
Message-ID: <20231004142303.203520-1-thomas.perale@essensium.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1696429399; x=1697034199; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A8JrrYrpLv2mi/XnPXvY3RLdEdPmdSrt52OMbsDcn2M=;
 b=M5lgnzKVbQsBJq8JJ05wOHGsTHjYUpGrOQ4kQ5ucIUYoGPAVjARtP0YNDn8NByad6O
 ZOsLYTu/aFfyksAL0S9QZrvEMuWzg2lEjzE+VoS9EPkNAM+2FoBmvrkhFoo5c5jb57H0
 5gBgtOgl6avcHCasC2piCJxUyp4q22COHc3jPVwqIPhP+YZqeLA+cOikqhBGxWnKRs9s
 53vHggHs+xL8SnGZRepYu8zqrZGc0ud1Vier6p8uweOUWaekqTpWeWss7IAubVa+2DwY
 91TPv06iAbHLcuIMxu2/hzVWBwickaYxNR0E/LI3p7jdsoRmPX165OfnyQRrrgWypNDC
 a/dg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=M5lgnzKV
Subject: [Buildroot] [PATCH 0/6] support for a pre-built Go compiler
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Geoff Levand <geoff@infradead.org>, Fabio Estevam <festevam@gmail.com>,
 Anisse Astier <anisse@astier.eu>, "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Christian Stewart <christian@aperture.us>,
 Romain Naour <romain.naour@gmail.com>, Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogVGhvbWFzIFBlcmFsZSA8dGhvbWFzLnBlcmFsZUBtaW5kLmJlPgoKSW1wcm92ZW1lbnQg
c3VnZ2VzdGVkIG9uIHRoZSBidWlsZHJvb3QgVE9ETyBsaXN0IChodHRwczovL3d3dy5lbGludXgu
b3JnL0J1aWxkcm9vdCNUb2RvX2xpc3QpLgpUaGlzIHBhdGNoIGFkZHMgc3VwcG9ydCBmb3IgYSBw
cmUtYnVpbHQgdmVyc2lvbiBvZiB0aGUgR28gY29tcGlsZXIgdGhhdApkb2Vzbid0IHJlcXVpcmVz
IHVzZXJzIHRvIGdvIHRocm91Z2ggdGhlIGRpZmZlcmVudCBjb21waWxhdGlvbiBzdGFnZXMgb2YK
dGhlIEdvIGNvbXBpbGVyIGFuZCBzcGVlZHMgdXAgdGhlIG92ZXJhbGwgYnVpbGQgdGltZS4KVGhp
cyBpcyBhIG5ldyB2ZXJzaW9uIG9mIGEgcGF0Y2ggSSBwcm9wb3NlZCBmb3IgdGhlIHNhbWUgZmVh
dHVyZSBsYXN0CnllYXIgKHNlZSBodHRwczovL2xvcmUua2VybmVsLm9yZy9idWlsZHJvb3QvQ0Er
aDhSMnBOUnJCc0NoS1MzUEhRdFQwX3JzVkYzV2kzTHdNVEQ5aktGb0tmMW90Mi1BQG1haWwuZ21h
aWwuY29tLyNiKQphbmQgd2l0aCBhIGZpeCBvZiB0aGUgdHlwbyBJIG1hZGUgb24gdGhlIFtQQVRD
SCA2LzZdLgoKSXQgaW50cm9kdWNlcyBhIG5ldyBkaXJlY3Rvcnkgc3RydWN0dXJlIGZvciBob3N0
IGNvbXBpbGVycyB3aXRoIGRpZmZlcmVudApwcm92aWRlcnM6CgogICAgcGFja2FnZS8KICAgIOKU
nOKUgCBnby8gICAgICAgICAgICAgICAgICAgICA8LS0gVmlydHVhbCBwYWNrYWdlCiAgICDilIIg
IOKUnOKUgCBnby1zcmMvICAgICAgICAgICAgICA8LS0gQnVpbGQgZnJvbSBzb3VyY2Ugb3B0aW9u
CiAgICDilIIgIOKUnOKUgCBnby1iaW4vICAgICAgICAgICAgICA8LS0gRG93bmxvYWQgcHJlLWJ1
aWx0IG9wdGlvbgogICAg4pSCICDilJzilIAgZ28tYm9vdHN0cmFwLXN0YWdlMS8gPC0tIERlcGVu
ZGVuY3kgZm9yIGdvLWJvb3RzdHJhcC1zdGFnZTIKICAgIOKUgiAg4pSc4pSAIGdvLWJvb3RzdHJh
cC1zdGFnZTIvIDwtLSBEZXBlbmRlbmN5IGZvciBnby1zcmMKICAgIOKUgiAg4pSc4pSAIGdvLm1r
ICAgICAgICAgICAgICAgIDwtLSBDb21tb24gdmFyaWFibGVzCiAgICDilIIgIOKUnOKUgCBDb25m
aWcuaW4gICAgICAgICAgICA8LS0gQ29tbW9uIHZhcmlhYmxlcy92aXJ0dWFsIHBhY2thZ2UgZGVm
aW5pdGlvbgoKVGhlIHN1YmRpcmVjdG9yeSBzdHJ1Y3R1cmUgaXMgdXNlZCB0byBwdXQgdGhlIGBH
T19WRVJTSU9OYCB2YXJpYWJsZSBpbgpjb21tb24gYmV0d2VlbiB0aGUgZGlmZmVyZW50IHByb3Zp
ZGVyLgoKVGhpcyBzdWJkaXJlY3RvcnkgcHJvcG9zYWwgc2hvdWxkIGJlIGV4dGVuZGVkIHRvIHRo
ZSBSdXN0IGNvbXBpbGVyIGNhc2UgYW5kCk5vZGVKUyBwcm9wb3NhbCBUaG9tYXMgUGV0YXp6b25p
IGRpZCAoaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9saXN0
Lz9zZXJpZXM9MzE5OTY3KQp0byB1bmlmeSB0aGUgbmFtaW5nIG9mIGZvciB0aGUgZGlmZmVyZW50
IGNvbXBpbGVycyBvcHRpb25zLgoKVGhvbWFzIFBlcmFsZSAoNik6CiAgREVWRUxPUEVSUzogYWRk
IFRob21hcyBQZXJhbGUgZm9yICdnbycKICBwYWNrYWdlL2dvOiBuZXcgc3ViZGlyZWN0b3J5IGZv
ciBnbyB2YXJpYW50cwogIHBhY2thZ2UvZ286IG1ha2UgaG9zdCBwYWNrYWdlIGEgdmlydHVhbCBw
YWNrYWdlCiAgcGFja2FnZS9wa2ctZ29sYW5nOiBzZWxlY3QgZ28gY29tcGlsZXIKICBwYWNrYWdl
L2dvL2dvLWJpbjogbmV3IGdvIHByb3ZpZGVyCiAgc3VwcG9ydC90ZXN0aW5nOiBhZGQgdGVzdHMg
Zm9yIEdvIHByb3ZpZGVycwoKIC5jaGVja3BhY2thZ2VpZ25vcmUgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAyICstCiBERVZFTE9QRVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgNSArLQogcGFja2FnZS9Db25maWcuaW4uaG9zdCAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDIgLQogcGFja2FnZS9iYWxlbmEtZW5naW5lL0NvbmZpZy5pbiAgICAgICAgICAgICAg
IHwgIDEgKwogcGFja2FnZS9jbmktcGx1Z2lucy9Db25maWcuaW4gICAgICAgICAgICAgICAgIHwg
IDEgKwogcGFja2FnZS9jb250YWluZXJkL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgIHwgIDEg
KwogcGFja2FnZS9jcnVjaWJsZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgIHwgIDEgKwog
cGFja2FnZS9kZWx2ZS9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFj
a2FnZS9kZWx2ZS9Db25maWcuaW4uaG9zdCAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2Fn
ZS9kb2NrZXItY2xpL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9k
b2NrZXItY29tcG9zZS9Db25maWcuaW4gICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9kb2Nr
ZXItZW5naW5lL0NvbmZpZy5pbiAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9lbWJpZ2dl
bi1kaXNrL0NvbmZpZy5pbiAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9mbGFubmVsL0Nv
bmZpZy5pbiAgICAgICAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9naXRsYWItcnVubmVy
L0NvbmZpZy5pbiAgICAgICAgICAgICAgIHwgIDEgKwogcGFja2FnZS9nby9Db25maWcuaW4uaG9z
dCAgICAgICAgICAgICAgICAgICAgIHwgNDQgKysrKysrKysrKysrKysrCiBwYWNrYWdlL2dvL2dv
LWJpbi9Db25maWcuaW4uaG9zdCAgICAgICAgICAgICAgfCAxNCArKysrKwogcGFja2FnZS9nby9n
by1iaW4vZ28tYmluLmhhc2ggICAgICAgICAgICAgICAgIHwgIDggKysrCiBwYWNrYWdlL2dvL2dv
LWJpbi9nby1iaW4ubWsgICAgICAgICAgICAgICAgICAgfCAxOSArKysrKysrCiAuLi4vZ28tYm9v
dHN0cmFwLXN0YWdlMS9Db25maWcuaW4uaG9zdCAgICAgICAgfCAgMAogLi4uL2dvLWJvb3RzdHJh
cC1zdGFnZTEuaGFzaCAgICAgICAgICAgICAgICAgIHwgIDAKIC4uLi9nby1ib290c3RyYXAtc3Rh
Z2UxLm1rICAgICAgICAgICAgICAgICAgICB8ICAwCiAuLi4vZ28tYm9vdHN0cmFwLXN0YWdlMi9D
b25maWcuaW4uaG9zdCAgICAgICAgfCAgMAogLi4uL2dvLWJvb3RzdHJhcC1zdGFnZTIuaGFzaCAg
ICAgICAgICAgICAgICAgIHwgIDAKIC4uLi9nby1ib290c3RyYXAtc3RhZ2UyLm1rICAgICAgICAg
ICAgICAgICAgICB8ICAwCiAuLi5leHBsaWNpdC1vcHRpb24tZm9yLWNyb3NzY29tcGlsYXRpb24u
cGF0Y2ggfCAgMAogLi4ubGR2Y3MtZmFsc2Utd2hlbi1idWlsZGluZy1nby1ib290c3RyLnBhdGNo
IHwgIDAKIHBhY2thZ2UvZ28ve2dvLmhhc2ggPT4gZ28tc3JjL2dvLXNyYy5oYXNofSAgICB8ICAw
CiBwYWNrYWdlL2dvL2dvLXNyYy9nby1zcmMubWsgICAgICAgICAgICAgICAgICAgfCA1NCArKysr
KysrKysrKysrKysrKysrCiBwYWNrYWdlL2dvL2dvLm1rICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCA0MiArKy0tLS0tLS0tLS0tLS0KIHBhY2thZ2UvZ29jcnlwdGZzL0NvbmZpZy5pbiAg
ICAgICAgICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvbWVuZGVyLWFydGlmYWN0L0NvbmZpZy5p
bi5ob3N0ICAgICAgICB8ICAxICsKIHBhY2thZ2UvbWVuZGVyLWNvbm5lY3QvQ29uZmlnLmluICAg
ICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvbWVuZGVyL0NvbmZpZy5pbiAgICAgICAgICAgICAg
ICAgICAgICB8ICAxICsKIHBhY2thZ2UvbW9ieS1idWlsZGtpdC9Db25maWcuaW4gICAgICAgICAg
ICAgICB8ICAxICsKIHBhY2thZ2UvbW9ieS1idWlsZGtpdC9Db25maWcuaW4uaG9zdCAgICAgICAg
ICB8ICAxICsKIHBhY2thZ2UvbmVyZGN0bC9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICB8
ICAxICsKIHBhY2thZ2UvcnVuYy9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgICB8ICAx
ICsKIHBhY2thZ2UvcnVuYy9Db25maWcuaW4uaG9zdCAgICAgICAgICAgICAgICAgICB8ICAxICsK
IHBhY2thZ2UvdGluaWZpZXIvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHBh
Y2thZ2Uvd3RmdXRpbC9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHN1cHBv
cnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfZ28ucHkgICAgICB8IDQxICsrKysrKysrKysr
KysrCiA0MiBmaWxlcyBjaGFuZ2VkLCAyMTEgaW5zZXJ0aW9ucygrKSwgNDMgZGVsZXRpb25zKC0p
CiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9nby9nby1iaW4vQ29uZmlnLmluLmhvc3QKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2dvL2dvLWJpbi9nby1iaW4uaGFzaAogY3JlYXRlIG1v
ZGUgMTAwNjQ0IHBhY2thZ2UvZ28vZ28tYmluL2dvLWJpbi5tawogcmVuYW1lIHBhY2thZ2UveyA9
PiBnb30vZ28tYm9vdHN0cmFwLXN0YWdlMS9Db25maWcuaW4uaG9zdCAoMTAwJSkKIHJlbmFtZSBw
YWNrYWdlL3sgPT4gZ299L2dvLWJvb3RzdHJhcC1zdGFnZTEvZ28tYm9vdHN0cmFwLXN0YWdlMS5o
YXNoICgxMDAlKQogcmVuYW1lIHBhY2thZ2UveyA9PiBnb30vZ28tYm9vdHN0cmFwLXN0YWdlMS9n
by1ib290c3RyYXAtc3RhZ2UxLm1rICgxMDAlKQogcmVuYW1lIHBhY2thZ2UveyA9PiBnb30vZ28t
Ym9vdHN0cmFwLXN0YWdlMi9Db25maWcuaW4uaG9zdCAoMTAwJSkKIHJlbmFtZSBwYWNrYWdlL3sg
PT4gZ299L2dvLWJvb3RzdHJhcC1zdGFnZTIvZ28tYm9vdHN0cmFwLXN0YWdlMi5oYXNoICgxMDAl
KQogcmVuYW1lIHBhY2thZ2UveyA9PiBnb30vZ28tYm9vdHN0cmFwLXN0YWdlMi9nby1ib290c3Ry
YXAtc3RhZ2UyLm1rICgxMDAlKQogcmVuYW1lIHBhY2thZ2UvZ28veyA9PiBnby1zcmN9LzAwMDEt
YnVpbGQuZ28tZXhwbGljaXQtb3B0aW9uLWZvci1jcm9zc2NvbXBpbGF0aW9uLnBhdGNoICgxMDAl
KQogcmVuYW1lIHBhY2thZ2UvZ28veyA9PiBnby1zcmN9LzAwMDItY21kLWRpc3Qtc2V0LWJ1aWxk
dmNzLWZhbHNlLXdoZW4tYnVpbGRpbmctZ28tYm9vdHN0ci5wYXRjaCAoMTAwJSkKIHJlbmFtZSBw
YWNrYWdlL2dvL3tnby5oYXNoID0+IGdvLXNyYy9nby1zcmMuaGFzaH0gKDEwMCUpCiBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS9nby9nby1zcmMvZ28tc3JjLm1rCiBjcmVhdGUgbW9kZSAxMDA2
NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF9nby5weQoKLS0gCjIuNDIuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
