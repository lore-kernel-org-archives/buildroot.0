Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B34DC87FCE
	for <buildroot@archiver.kernel.org>; Fri, 25 Jul 2025 12:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D964F83CEA;
	Fri, 25 Jul 2025 12:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oZ2bwysu8oKU; Fri, 25 Jul 2025 12:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB8C483CE4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB8C483CE4;
	Fri, 25 Jul 2025 12:07:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 544DD909
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 12:07:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3998741B5B
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 12:07:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZDXYTlCC1Du2 for <buildroot@buildroot.org>;
 Fri, 25 Jul 2025 12:07:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3C5AF41B50
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C5AF41B50
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3C5AF41B50
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 12:07:50 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6077dea37easo3770154a12.3
 for <buildroot@buildroot.org>; Fri, 25 Jul 2025 05:07:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753445268; x=1754050068;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LQK6BkcV4p3Y5snyuvbFPJwywzaiXj8La067+130tFI=;
 b=rPtC/w6WKVgdNYLgYsbdORLeX/3aF3/PPkweHcNTokfkw27EYbnG5OgQ8obMJPWNWG
 +CBcOKEkt/vGxzpVh42x6DnCgAadXO5N1QPwnO9G5TdQXAUAk6Uc3mXxfbWcECtzSYRq
 3jnDiRdxDXoY00jtOhXFy/PqJgXiVgwzlhdp+0mhKunaWpgjt+LyQyEF7pZFmBoElxVc
 NZFa3H8UGnWFOWKI+TRN47vDksberyTZxYEHSomS3X1pN3b0Mk7COP3YVMPY1GCcg9tv
 Mt8eOp00RQl8j6WmHwuV0+jHscLzoLOZua04ewWnHCfzXcDaQj0U3tYVvP3mWScsiS4O
 jrdQ==
X-Gm-Message-State: AOJu0YztNBq9ycL7mH7K7809/c3zObNcnFvsgwTyYVHm6qHokZmx1xkz
 ciTLE/FSRfhBuKo4BS1rkR99gCGaWbhLwbVfOpe1pawul8M3x9aK/4dnVVVzZg==
X-Gm-Gg: ASbGnctc7j7FcC3mFRq1G1wdNg0gaPNOiRzhGXi96gvco57BpND5JQxOABgieX92iyf
 Ut4fOYP+kF1RX6ST0I+L500IkdMY2VblXOU7DEsc2RE24SMMiB4XLm1n3WZBr5alaoodm+ObnK8
 Vv+ZwYs4AdWeVcZ5JVmvzIo4U3Uls6dP1+33xDFExMKcdykwoOpNfC2PiNrDJDlhcY21PtsuFcY
 MfskwaWHQy4nZDJcGWYtgvULhA4j5nITywmstveTjQycLiZi8dHC66Ymnm6M2ly5T6tswGVc7gH
 hjaKQcn4PzHEG7+p6xO/N6VMzxOauPH5eFZt8IdvKPZdFn9DQVRVeujFno5hATQUS5+cfv1u3Pt
 +KxPDYWwQXGcDfOtpNEoRMUSq5jAMHcd3HFB0F1UWpj95pXyBR7O3kcWTdwMiQ+2V5Jky3mfrbB
 KdBIaRYFWs
X-Google-Smtp-Source: AGHT+IF4ge2Ve4OSZ6bIBlE1G5t8HBKYXQhx1RaOfOjIVxw/1X7ljDLy0ND8pSOgHospM/dwjv9O6w==
X-Received: by 2002:a17:907:5ce:b0:ae6:f8bc:3f82 with SMTP id
 a640c23a62f3a-af61e92139dmr201781466b.52.1753445267449; 
 Fri, 25 Jul 2025 05:07:47 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af47cc6e6e3sm261514366b.53.2025.07.25.05.07.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jul 2025 05:07:46 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 25 Jul 2025 14:07:43 +0200
Message-Id: <20250725120743.3705187-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1753445268; x=1754050068; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LQK6BkcV4p3Y5snyuvbFPJwywzaiXj8La067+130tFI=;
 b=YuxhxyLzp5gHaczLOa0QRMxy0Hxsz3+UJOs/6dAe9ly0UCOSvpM7rNh9jDUeZbzEmz
 keOr3MX3nPFbb/XRv5Ars82NYtMxS2aUh/AF1lLZV2At57TzabbSOovm2qUWe33WVHyw
 Iyfu/LZQeCnr4/RLiQG/7SnfChTwkY6HoP5nDJ3rVxJaxAS1BW0hlOOn1tZpzQTDnOXh
 +u86KDRavL5GXESFx8n4/Ju/ZQKuKkqiFws03tt9K0fB8YOoECo4ayhd945cmnr46mbe
 tokZlxu/nwomP7mMC28mtvKE/Gjh+HBH/6CyzZ2WgTEVxTnjD37IXUUIqgppKYDuz5Px
 7pHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YuxhxyLz
Subject: [Buildroot] [PATCH v2] package/libxmlrpc: fix boolean definitions
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: "Alvaro G . M" <alvaro.gamez@hazent.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogWWVnb3IgWWVmcmVtb3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPgoKRG9uJ3Qg
ZGVmaW5lIGJvb2xlYW4gbWFjcm9zIGZvciBDMjMgc3RhbmRhcmQgYXMgdGhleSBhcmUgaW1wbGVt
ZW50ZWQKYXMga2V5d29yZHMuCgpGaXhlcyB0aGUgZm9sbG93aW5nIGVycm9yOgoKbWFrZVsyXTog
RW50ZXJpbmcgZGlyZWN0b3J5CicvaG9tZS91c2VyL0RvY3VtZW50cy92ZXJzaW9uZWQvb3NzL3ht
bHJwYy1jL2xpYi91dGlsJwpnY2MgLWMgLUROREVCVUcgLXB0aHJlYWQgLVdhbGwgLVcgLVduby11
bmluaXRpYWxpemVkIC1XdW5kZWYKLVduby11bmtub3duLXByYWdtYXMgLVdtaXNzaW5nLWRlY2xh
cmF0aW9ucyAtV3N0cmljdC1wcm90b3R5cGVzCi1XbWlzc2luZy1wcm90b3R5cGVzIC1XaW1wbGlj
aXQgLWZuby1jb21tb24gLWcgLU8zCi1Jc3JjZGlyL2xpYi91dGlsL2luY2x1ZGUKLUkvaG9tZS91
c2VyL0RvY3VtZW50cy92ZXJzaW9uZWQvb3NzL3htbHJwYy1jICAgY2FzcHJpbnRmLmMKSW4gZmls
ZSBpbmNsdWRlZCBmcm9tIGNhc3ByaW50Zi5jOjk6CnNyY2Rpci9saWIvdXRpbC9pbmNsdWRlL2Jv
b2wuaDoxMzo1OiBlcnJvcjogY2Fubm90IHVzZSBrZXl3b3JkIOKAmGZhbHNl4oCZCmFzIGVudW1l
cmF0aW9uIGNvbnN0YW50CiAgIDEzIHwgICAgIGZhbHNlID0gMCwKICAgICAgfCAgICAgXn5+fn4K
c3JjZGlyL2xpYi91dGlsL2luY2x1ZGUvYm9vbC5oOjEzOjU6IG5vdGU6IOKAmGZhbHNl4oCZIGlz
IGEga2V5d29yZCB3aXRoCuKAmC1zdGQ9YzIz4oCZIG9ud2FyZHMKc3JjZGlyL2xpYi91dGlsL2lu
Y2x1ZGUvYm9vbC5oOjE1OjM6IGVycm9yOiBleHBlY3RlZCDigJg74oCZLCBpZGVudGlmaWVyCm9y
IOKAmCjigJkgYmVmb3JlIOKAmGJvb2zigJkKICAgMTUgfCB9IGJvb2w7CiAgICAgIHwgICBefn5+
CnNyY2Rpci9saWIvdXRpbC9pbmNsdWRlL2Jvb2wuaDoxNTozOiB3YXJuaW5nOiB1c2VsZXNzIHR5
cGUgbmFtZSBpbgplbXB0eSBkZWNsYXJhdGlvbgoKVXBzdHJlYW06IGh0dHBzOi8vc291cmNlZm9y
Z2UubmV0L3AveG1scnBjLWMvY29kZS8zMzE4LwoKU2lnbmVkLW9mZi1ieTogWWVnb3IgWWVmcmVt
b3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPgotLS0KQ2hhbmdlcyB2MSAtPiB2MjoKICAt
IGFkZCB1cHN0cmVhbSBjb21taXQgVVJMCgogLi4uLzAwMDEtRml4LWJvb2xlYW4tZGVmaW5pdGlv
bnMucGF0Y2ggICAgICAgIHwgMjUgKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQs
IDI1IGluc2VydGlvbnMoKykKIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2xpYnhtbHJwYy8w
MDAxLUZpeC1ib29sZWFuLWRlZmluaXRpb25zLnBhdGNoCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9s
aWJ4bWxycGMvMDAwMS1GaXgtYm9vbGVhbi1kZWZpbml0aW9ucy5wYXRjaCBiL3BhY2thZ2UvbGli
eG1scnBjLzAwMDEtRml4LWJvb2xlYW4tZGVmaW5pdGlvbnMucGF0Y2gKbmV3IGZpbGUgbW9kZSAx
MDA2NDQKaW5kZXggMDAwMDAwMDAwMC4uMGZkZmRmN2YwMwotLS0gL2Rldi9udWxsCisrKyBiL3Bh
Y2thZ2UvbGlieG1scnBjLzAwMDEtRml4LWJvb2xlYW4tZGVmaW5pdGlvbnMucGF0Y2gKQEAgLTAs
MCArMSwyNSBAQAorSW5kZXg6IGxpYi91dGlsL2luY2x1ZGUvYm9vbC5oCis9PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CitE
b24ndCBkZWZpbmUgYm9vbGVhbiBtYWNyb3MgZm9yIEMyMyBzdGFuZGFyZCBhcyB0aGV5IGFyZSBp
bXBsZW1lbnRlZAorYXMga2V5d29yZHMuCisKK1Vwc3RyZWFtOiBodHRwczovL3NvdXJjZWZvcmdl
Lm5ldC9wL3htbHJwYy1jL2NvZGUvMzMxOC8KKworU2lnbmVkLW9mZi1ieTogWWVnb3IgWWVmcmVt
b3YgPHllZ29yc2xpc3RzQGdvb2dsZW1haWwuY29tPgorCitkaWZmIC0tZ2l0IGEvbGliL3V0aWwv
aW5jbHVkZS9ib29sLmggYi9saWIvdXRpbC9pbmNsdWRlL2Jvb2wuaAorLS0tIGEvbGliL3V0aWwv
aW5jbHVkZS9ib29sLmgJKHJldmlzaW9uIDMzMTYpCisrKysgYi9saWIvdXRpbC9pbmNsdWRlL2Jv
b2wuaAkod29ya2luZyBjb3B5KQorQEAgLTUsNyArNSwxMSBAQAorICAgIGNvbGxpc2lvbi4KKyAq
LworIAorLSNpZm5kZWYgX19jcGx1c3BsdXMKKysjaWZkZWYgX19jcGx1c3BsdXMKKysvKiBib29s
IGhhcyBhbHdheXMgYmVlbiBwYXJ0IG9mIHRoZSBDKysgbGFuZ3VhZ2UgKi8KKysjZWxpZiBfX1NU
RENfVkVSU0lPTl9fID49IDIwMjMxMUwKKysvKiBib29sIGlzIHBhcnQgb2YgdGhlIEMyMyBzdGFu
ZGFyZCAqLworKyNlbHNlCisgLyogQXQgbGVhc3QgdGhlIEdOVSBjb21waWxlciBkZWZpbmVzIF9f
Ym9vbF90cnVlX2ZhbHNlX2FyZV9kZWZpbmVkICovCisgI2lmbmRlZiBfX2Jvb2xfdHJ1ZV9mYWxz
ZV9hcmVfZGVmaW5lZAorICNkZWZpbmUgX19ib29sX3RydWVfZmFsc2VfYXJlX2RlZmluZWQKLS0g
CjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
