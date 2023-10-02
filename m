Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73CA0E7849A
	for <buildroot@archiver.kernel.org>; Mon,  2 Oct 2023 12:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E78CF41E19;
	Mon,  2 Oct 2023 12:48:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E78CF41E19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0cfu-uRA0z4g; Mon,  2 Oct 2023 12:48:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 968B941E37;
	Mon,  2 Oct 2023 12:48:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 968B941E37
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C133E1BF589
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 12:48:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9774D61014
 for <buildroot@lists.busybox.net>; Mon,  2 Oct 2023 12:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9774D61014
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UQmPjy30OcPX for <buildroot@lists.busybox.net>;
 Mon,  2 Oct 2023 12:48:11 +0000 (UTC)
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 85CD660AB7
 for <buildroot@buildroot.org>; Mon,  2 Oct 2023 12:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85CD660AB7
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-5347e657a11so11540061a12.2
 for <buildroot@buildroot.org>; Mon, 02 Oct 2023 05:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696250888; x=1696855688;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mVswFznrLudlE7Y9qKU4eGdwYYUYSyi+9DP2RVCQ9C0=;
 b=fYXC0DuWDoO3PPoKxJhDbRxlUr+pldvBnHysF0fPhUqbaPgQlWV2z1Xf1zqoKHqsG3
 cb0xNNi+AvZXzy5wAAN56YZANkGi/ZUNq1KhsdOwlCp9gxxIa1K7ettfYn8l9OBUZs0m
 9UDwwQx3gqz8a/QSu1Qnull31o5LUdmoLoRDuWkpgAUxoO0xr1WOZjg+/LR4A6Y4ozhE
 o6PdisTUwPA2IBdSCyKjhNM8fsXWa09ORbCNWECYr4G+uPG3OqCb4CMpjQ1T+o4XNuq1
 yCOf3V0SVFuFQOA8YvG7zmCORM3dEOmDif0xMMW9JjSJIK4O22B4Ix482K6Miecn12lg
 eDNg==
X-Gm-Message-State: AOJu0Ywr8kN3K/IkSutYEingv3OhF9+TZzMxyQWejzJmpjb28WwwV9NB
 58dpP9PRCAUiYo9klJxvB8bXYhbzJzplzyx9H/cYb77r
X-Google-Smtp-Source: AGHT+IFV73P1yV20NNUiZW/zRdn4AZDQiyS6QFyDds3Xb/eeOioYir6k9wHbktKWrxF00fv4yWS3CA==
X-Received: by 2002:a17:907:7851:b0:9ae:594d:d3fc with SMTP id
 lb17-20020a170907785100b009ae594dd3fcmr8478035ejc.17.1696250888174; 
 Mon, 02 Oct 2023 05:48:08 -0700 (PDT)
Received: from localhost.localdomain ([79.132.253.132])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a17090635c300b0098951bb4dc3sm16688189ejb.184.2023.10.02.05.48.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 05:48:07 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon,  2 Oct 2023 14:47:22 +0200
Message-ID: <20231002124736.179251-1-thomas.perale@essensium.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1696250888; x=1696855688; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mVswFznrLudlE7Y9qKU4eGdwYYUYSyi+9DP2RVCQ9C0=;
 b=OFcDbMXTzMd/F4x4D/wK/o+XA1yjSNf/peSKXrwWDNwxMMRh+QgMpGie6oT/CIjXlH
 /BeBCgrO7x0/uU0NdICtGfqUAsg1wRHBrsII9SN2+k1R6IRVPgO4qCIVjAm7E4FFhQLN
 IpiOLJX/J2g+PtJPaP8a7mrSbxfROlNGdZcXlefiT934KEGANEDCWv4ByhmirE+4GrEZ
 +3Qr2DxJQP2QyQCpaQ/NChcJzxFKqX7JWlBzxECCnFdpX1OkhBW57K+ps+3MSe8oTbmh
 +Z6SblQWPpplHDsGsdMS/8ZoW7yIOE8YpWllKZZ3z0qLy4sUNaZfGQBQb6fkkxULnY2A
 9olw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=OFcDbMXT
Subject: [Buildroot] [PATCH 0/6] support for a pre-compiled Go compiler
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
aWwuY29tLyNiKS4KCkl0IGludHJvZHVjZXMgYSBuZXcgZGlyZWN0b3J5IHN0cnVjdHVyZSBmb3Ig
aG9zdCBjb21waWxlcnMgd2l0aCBkaWZmZXJlbnQKcHJvdmlkZXJzOgoKICAgIHBhY2thZ2UvCiAg
ICDilJzilIAgZ28vICAgICAgICAgICAgICAgICAgICAgPC0tIFZpcnR1YWwgcGFja2FnZQogICAg
4pSCICDilJzilIAgZ28tc3JjLyAgICAgICAgICAgICAgPC0tIEJ1aWxkIGZyb20gc291cmNlIG9w
dGlvbgogICAg4pSCICDilJzilIAgZ28tYmluLyAgICAgICAgICAgICAgPC0tIERvd25sb2FkIHBy
ZS1idWlsZCBvcHRpb24KICAgIOKUgiAg4pSc4pSAIGdvLWJvb3RzdHJhcC1zdGFnZTEvIDwtLSBE
ZXBlbmRlbmN5IGZvciBnby1ib290c3RyYXAtc3RhZ2UyCiAgICDilIIgIOKUnOKUgCBnby1ib290
c3RyYXAtc3RhZ2UyLyA8LS0gRGVwZW5kZW5jeSBmb3IgZ28tc3JjCiAgICDilIIgIOKUnOKUgCBn
by5tayAgICAgICAgICAgICAgICA8LS0gQ29tbW9uIHZhcmlhYmxlcwogICAg4pSCICDilJzilIAg
Q29uZmlnLmluICAgICAgICAgICAgPC0tIENvbW1vbiB2YXJpYWJsZXMvdmlydHVhbCBwYWNrYWdl
IGRlZmluaXRpb24KClRoZSBzdWJkaXJlY3Rvcnkgc3RydWN0dXJlIGlzIHVzZWQgdG8gcHV0IHRo
ZSBgR09fVkVSU0lPTmAgdmFyaWFibGUgaW4KY29tbW9uIGJldHdlZW4gdGhlIGRpZmZlcmVudCBw
cm92aWRlci4KClRoaXMgc3ViZGlyZWN0b3J5IHByb3Bvc2FsIHNob3VsZCBiZSBleHRlbmRlZCB0
byB0aGUgUnVzdCBjb21waWxlciBjYXNlIGFuZApOb2RlSlMgcHJvcG9zYWwgVGhvbWFzIFBldGF6
em9uaSBkaWQgKGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJvb3Qv
bGlzdC8/c2VyaWVzPTMxOTk2NykKdG8gdW5pZnkgdGhlIG5hbWluZyBvZiBmb3IgdGhlIGRpZmZl
cmVudCBjb21waWxlcnMgb3B0aW9ucy4KClRob21hcyBQZXJhbGUgKDYpOgogIERFVkVMT1BFUlM6
IGFkZCBUaG9tYXMgUGVyYWxlIGZvciAnZ28nCiAgcGFja2FnZS9nbzogbmV3IHN1YmRpcmVjdG9y
eSBmb3IgZ28gdmFyaWFudHMKICBwYWNrYWdlL2dvOiBtYWtlIGhvc3QgcGFja2FnZSBhIHZpcnR1
YWwgcGFja2FnZQogIHBhY2thZ2UvcGtnLWdvbGFuZzogc2VsZWN0IGdvIGNvbXBpbGVyCiAgcGFj
a2FnZS9nby9nby1iaW46IG5ldyBnbyBwcm92aWRlcgogIHN1cHBvcnQvdGVzdGluZzogYWRkIHRl
c3RzIGZvciBHbyBwcm92aWRlcnMKCiAuY2hlY2twYWNrYWdlaWdub3JlICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMiArLQogREVWRUxPUEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDUgKy0KIHBhY2thZ2UvQ29uZmlnLmluLmhvc3QgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAyIC0KIHBhY2thZ2UvYmFsZW5hLWVuZ2luZS9Db25maWcuaW4gICAgICAgICAg
ICAgICB8ICAxICsKIHBhY2thZ2UvY25pLXBsdWdpbnMvQ29uZmlnLmluICAgICAgICAgICAgICAg
ICB8ICAxICsKIHBhY2thZ2UvY29udGFpbmVyZC9Db25maWcuaW4gICAgICAgICAgICAgICAgICB8
ICAxICsKIHBhY2thZ2UvY3J1Y2libGUvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICB8ICAx
ICsKIHBhY2thZ2UvZGVsdmUvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICB8ICAxICsK
IHBhY2thZ2UvZGVsdmUvQ29uZmlnLmluLmhvc3QgICAgICAgICAgICAgICAgICB8ICAxICsKIHBh
Y2thZ2UvZG9ja2VyLWNsaS9Db25maWcuaW4gICAgICAgICAgICAgICAgICB8ICAxICsKIHBhY2th
Z2UvZG9ja2VyLWNvbXBvc2UvQ29uZmlnLmluICAgICAgICAgICAgICB8ICAxICsKIHBhY2thZ2Uv
ZG9ja2VyLWVuZ2luZS9Db25maWcuaW4gICAgICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvZW1i
aWdnZW4tZGlzay9Db25maWcuaW4gICAgICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvZmxhbm5l
bC9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvZ2l0bGFiLXJ1
bm5lci9Db25maWcuaW4gICAgICAgICAgICAgICB8ICAxICsKIHBhY2thZ2UvZ28vQ29uZmlnLmlu
Lmhvc3QgICAgICAgICAgICAgICAgICAgICB8IDQ0ICsrKysrKysrKysrKysrKwogcGFja2FnZS9n
by9nby1iaW4vQ29uZmlnLmluLmhvc3QgICAgICAgICAgICAgIHwgMTQgKysrKysKIHBhY2thZ2Uv
Z28vZ28tYmluL2dvLWJpbi5oYXNoICAgICAgICAgICAgICAgICB8ICA4ICsrKwogcGFja2FnZS9n
by9nby1iaW4vZ28tYmluLm1rICAgICAgICAgICAgICAgICAgIHwgMTkgKysrKysrKwogLi4uL2dv
LWJvb3RzdHJhcC1zdGFnZTEvQ29uZmlnLmluLmhvc3QgICAgICAgIHwgIDAKIC4uLi9nby1ib290
c3RyYXAtc3RhZ2UxLmhhc2ggICAgICAgICAgICAgICAgICB8ICAwCiAuLi4vZ28tYm9vdHN0cmFw
LXN0YWdlMS5tayAgICAgICAgICAgICAgICAgICAgfCAgMAogLi4uL2dvLWJvb3RzdHJhcC1zdGFn
ZTIvQ29uZmlnLmluLmhvc3QgICAgICAgIHwgIDAKIC4uLi9nby1ib290c3RyYXAtc3RhZ2UyLmhh
c2ggICAgICAgICAgICAgICAgICB8ICAwCiAuLi4vZ28tYm9vdHN0cmFwLXN0YWdlMi5tayAgICAg
ICAgICAgICAgICAgICAgfCAgMAogLi4uZXhwbGljaXQtb3B0aW9uLWZvci1jcm9zc2NvbXBpbGF0
aW9uLnBhdGNoIHwgIDAKIC4uLmxkdmNzLWZhbHNlLXdoZW4tYnVpbGRpbmctZ28tYm9vdHN0ci5w
YXRjaCB8ICAwCiBwYWNrYWdlL2dvL3tnby5oYXNoID0+IGdvLXNyYy9nby1zcmMuaGFzaH0gICAg
fCAgMAogcGFja2FnZS9nby9nby1zcmMvZ28tc3JjLm1rICAgICAgICAgICAgICAgICAgIHwgNTQg
KysrKysrKysrKysrKysrKysrKwogcGFja2FnZS9nby9nby5tayAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgNDIgKystLS0tLS0tLS0tLS0tCiBwYWNrYWdlL2dvY3J5cHRmcy9Db25maWcu
aW4gICAgICAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL21lbmRlci1hcnRpZmFjdC9Db25m
aWcuaW4uaG9zdCAgICAgICAgfCAgMSArCiBwYWNrYWdlL21lbmRlci1jb25uZWN0L0NvbmZpZy5p
biAgICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL21lbmRlci9Db25maWcuaW4gICAgICAgICAg
ICAgICAgICAgICAgfCAgMSArCiBwYWNrYWdlL21vYnktYnVpbGRraXQvQ29uZmlnLmluICAgICAg
ICAgICAgICAgfCAgMSArCiBwYWNrYWdlL21vYnktYnVpbGRraXQvQ29uZmlnLmluLmhvc3QgICAg
ICAgICAgfCAgMSArCiBwYWNrYWdlL25lcmRjdGwvQ29uZmlnLmluICAgICAgICAgICAgICAgICAg
ICAgfCAgMSArCiBwYWNrYWdlL3J1bmMvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgICAg
fCAgMSArCiBwYWNrYWdlL3J1bmMvQ29uZmlnLmluLmhvc3QgICAgICAgICAgICAgICAgICAgfCAg
MSArCiBwYWNrYWdlL3RpbmlmaWVyL0NvbmZpZy5pbiAgICAgICAgICAgICAgICAgICAgfCAgMSAr
CiBwYWNrYWdlL3d0ZnV0aWwvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICAgfCAgMSArCiBz
dXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X2dvLnB5ICAgICAgfCA0MSArKysrKysr
KysrKysrKwogNDIgZmlsZXMgY2hhbmdlZCwgMjExIGluc2VydGlvbnMoKyksIDQzIGRlbGV0aW9u
cygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZ28vZ28tYmluL0NvbmZpZy5pbi5ob3N0
CiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9nby9nby1iaW4vZ28tYmluLmhhc2gKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2dvL2dvLWJpbi9nby1iaW4ubWsKIHJlbmFtZSBwYWNrYWdl
L3sgPT4gZ299L2dvLWJvb3RzdHJhcC1zdGFnZTEvQ29uZmlnLmluLmhvc3QgKDEwMCUpCiByZW5h
bWUgcGFja2FnZS97ID0+IGdvfS9nby1ib290c3RyYXAtc3RhZ2UxL2dvLWJvb3RzdHJhcC1zdGFn
ZTEuaGFzaCAoMTAwJSkKIHJlbmFtZSBwYWNrYWdlL3sgPT4gZ299L2dvLWJvb3RzdHJhcC1zdGFn
ZTEvZ28tYm9vdHN0cmFwLXN0YWdlMS5tayAoMTAwJSkKIHJlbmFtZSBwYWNrYWdlL3sgPT4gZ299
L2dvLWJvb3RzdHJhcC1zdGFnZTIvQ29uZmlnLmluLmhvc3QgKDEwMCUpCiByZW5hbWUgcGFja2Fn
ZS97ID0+IGdvfS9nby1ib290c3RyYXAtc3RhZ2UyL2dvLWJvb3RzdHJhcC1zdGFnZTIuaGFzaCAo
MTAwJSkKIHJlbmFtZSBwYWNrYWdlL3sgPT4gZ299L2dvLWJvb3RzdHJhcC1zdGFnZTIvZ28tYm9v
dHN0cmFwLXN0YWdlMi5tayAoMTAwJSkKIHJlbmFtZSBwYWNrYWdlL2dvL3sgPT4gZ28tc3JjfS8w
MDAxLWJ1aWxkLmdvLWV4cGxpY2l0LW9wdGlvbi1mb3ItY3Jvc3Njb21waWxhdGlvbi5wYXRjaCAo
MTAwJSkKIHJlbmFtZSBwYWNrYWdlL2dvL3sgPT4gZ28tc3JjfS8wMDAyLWNtZC1kaXN0LXNldC1i
dWlsZHZjcy1mYWxzZS13aGVuLWJ1aWxkaW5nLWdvLWJvb3RzdHIucGF0Y2ggKDEwMCUpCiByZW5h
bWUgcGFja2FnZS9nby97Z28uaGFzaCA9PiBnby1zcmMvZ28tc3JjLmhhc2h9ICgxMDAlKQogY3Jl
YXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvZ28vZ28tc3JjL2dvLXNyYy5tawogY3JlYXRlIG1vZGUg
MTAwNjQ0IHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfZ28ucHkKCi0tIAoyLjQy
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
