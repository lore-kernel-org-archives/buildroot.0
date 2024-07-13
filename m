Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2801C3DA42
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 09:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 79E3D6069A;
	Sat, 13 Jul 2024 09:37:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dpMsCMXDddZP; Sat, 13 Jul 2024 09:37:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5608F606C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5608F606C0;
	Sat, 13 Jul 2024 09:37:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DBFAC1BF4D6
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D60A140204
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 09:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PaLjxH7g1ll9 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 09:37:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=antoine.coutant@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6062D40190
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6062D40190
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6062D40190
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 09:37:26 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-367963ea053so2205260f8f.2
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 02:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720863445; x=1721468245;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6JKsgDDZ7E7BiZ8Ml0YugfWctdc85gHVH9HGSMfhyGg=;
 b=ZNZmQKTpCsi3tWlf4HgdaB83QKKDvMkG6MivV3M5TkLLltkUhpK6pLoI6BGJ5TI/yr
 P2IK4ucfgEYrMko+7Jy0e2G9laXo/YxYfNLJDuBqdBwsqiYvUjYi/cB0vM7OwGSEsuyG
 hHM+5AFqDmEM33nvEW1kckiF/FuWADzrGD4SVoXT8N8hywMgZd2ulY12uy8r0CYxXYok
 Furqc+JhLnc2mEhThb6B3xv4pTROcn1/yDTg4cCOZk/FjaoPt77fgzE19JtOaQPstgMK
 4TfnVJzLbNlAz/YNHN8fa5R3XVJYny7kcPVQbeGEtzxB9oOjB6arcpmSV0DpRNIRnX8j
 aqWA==
X-Gm-Message-State: AOJu0YyfujCLD4BB1uq6rQXTFnaQEXCfWd2/4eAeut/lTv36XaMIKLRa
 tU9q2hbif0+P1bwAF1ChBwQgx6HRM2oon2NYLjt03MbbC708roBoWZR4RxRW0gRQrTWIOgafUwW
 p
X-Google-Smtp-Source: AGHT+IEDMG/zGbc7A3scHvBC1SJlsISfxk5iyymU/9zMN5AtUQHV9sYNhCzjJKJGeh56O/I/hbGQiw==
X-Received: by 2002:a05:600c:4ca3:b0:426:615f:f715 with SMTP id
 5b1f17b1804b1-426707dbd32mr113411505e9.23.1720863444922; 
 Sat, 13 Jul 2024 02:37:24 -0700 (PDT)
Received: from antco-7390.home
 (2a01cb08994fdf00389d87faa24d1c32.ipv6.abo.wanadoo.fr.
 [2a01:cb08:994f:df00:389d:87fa:a24d:1c32])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f25abf0sm49065935e9.14.2024.07.13.02.37.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 02:37:24 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 11:36:53 +0200
Message-Id: <20240713093700.13981-1-antoine.coutant@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720863445; x=1721468245; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6JKsgDDZ7E7BiZ8Ml0YugfWctdc85gHVH9HGSMfhyGg=;
 b=HFSAugv4ZHCHWV1R/8bgpXb2YQYNR9SihNApHSjlTvpBeedV5m+PVH0OcXTq/xDIXe
 NxOLLV1ForT+3Vl4ur58QB2eKpzNT5OodNXnQjZGg0Gni/DYjJjJbHl2XytHUzClzu84
 hFiuv+koSdVo9jojW9wHwQ1X5C/IQdip51xhw=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=HFSAugv4
Subject: [Buildroot] [PATCH 0/7] Adding RustiCL
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
From: Antoine Coutant via buildroot <buildroot@buildroot.org>
Reply-To: Antoine Coutant <antoine.coutant@smile.fr>
Cc: Antoine Coutant <antoine.coutant@smile.fr>, romain.naour@smile.fr
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxsLAoKVGhpcyBzZXJpZXMgZm9sbG93cyB0aGUgbGFzdCBzZXJpZXMgSSBzZW50IGF0IHRoZSBl
bmQgb2YgbXkgaW50ZXJuc2hpcApbMV0uCgpJ4oCZbSBzb3JyeSBmb3IgdGhlIGxvbmcgdGltZSBi
ZXR3ZWVuIHRob3NlIHR3byBzZXJpZXMsIGJ1dCBJIGRvIG5vdCBoYXZlCnRpbWUgdG8gc3BlbmQg
b24gaXQgc2luY2UgdGhlIGVuZCBvZiBteSBpbnRlcm5zaGlwLiAKCkNvbXBhcmVkIHRvIHRoZSBw
cmV2aW91cyBvbmUsIHRoaXMgc2VyaWVzIGZpeGVzIHByb2JsZW1zIHJhaXNlZCBieQpyZWNlaXZl
cnMuIFRoYW5rcyBmb3IgeW91ciByZXZpZXchCkkgYWxzbyBtYWRlIHRoZSBPcGVuQ0wtaGVhZGVy
cyBwYWNrYWdlIHRoZSBkZWZhdWx0IHByb3ZpZGVyIG9mIE9wZW5DTApoZXJkZXJzIGJlY2F1c2Ug
YWxsIE9wZW5DTCBoZWFkZXJzIGFyZSBzb3VyY2VkIGZyb20gdGhlIHNhbWUgcmVwbywgYW5kCmJl
Y2F1c2UgdGhleSBzaG91bGQgYmUgYmFja3dhcmQgY29tcGF0aWJsZSAobWVzYSBPcGVuQ0wgaGVh
ZGVycyBhcmUKb2xkKS4KRmluYWxseSwgSSBtYWRlIE9wZW5DTCBDbG92ZXIgb25seSBhdmFpbGFi
bGUgaW4gSUNEIG1vZGUgdG8gc3RheQpjb25zaXN0ZW50IGJldHdlZW4gT3BlbkNMIGltcGxlbWVu
dGF0aW9ucy4KCkNvbnRyYXJ5IHRvIHRoZSBwcmV2aW91cyBzZXJpZXMsIHRoaXMgb25lIGhhdmUg
bm90IGJlZW4gdGVzdGVkIG9uIHRoZQprYWRoYXMgdmltMyBib2FyZCAoSSBkb27igJl0IGhhdmUg
YWNjZXNzIHRvIGl0IHNpbmNlIHRoZSBlbmQgb2YgbXkKaW50ZXJuc2hpcCkuIEkgdGVzdGVkIHRo
ZSBidWlsZCBvbmNlIHdpdGggcWVtdV94ODZfNjRfZGVmY29uZmlnIGFuZCB0aGUKYnVpbGQgd2Fz
IHN1Y2Nlc3NmdWwuIEJ1dCwgYW4gb3RoZXIgYnVpbGQgd2l0aCB0aGUga2hhZGFzX3ZpbTNfZGVm
Y29uZmlnCmZhaWxlZDogCgouL2J1aWxkcm9vdC90ZXN0L2toYWRhc192aW0zX2RlZmNvbmZpZ19y
dXN0aWNsXzUvaG9zdC9hYXJjaDY0LWJ1aWxkcm9vdC1saW51eC1nbnUvc3lzcm9vdC91c3IvaW5j
bHVkZS9mZWF0dXJlcy5oOjQxNDo0OiB3YXJuaW5nOiBfRk9SVElGWV9TT1VSQ0UgcmVxdWlyZXMg
Y29tcGlsaW5nIHdpdGggb3B0aW1pemF0aW9uICgtTykgWy1XI3dhcm5pbmdzXQouL2J1aWxkcm9v
dC90ZXN0L2toYWRhc192aW0zX2RlZmNvbmZpZ19ydXN0aWNsXzUvaG9zdC9hYXJjaDY0LWJ1aWxk
cm9vdC1saW51eC1nbnUvc3lzcm9vdC91c3IvaW5jbHVkZS9iaXRzL21hdGgtdmVjdG9yLmg6MzQ6
MjU6IGVycm9yOiAnX19uZW9uX3ZlY3Rvcl90eXBlX18nIGF0dHJpYnV0ZSBpcyBub3Qgc3VwcG9y
dGVkIG9uIHRhcmdldHMgbWlzc2luZyAnbmVvbicgb3IgJ212ZSc7IHNwZWNpZnkgYW4gYXBwcm9w
cmlhdGUgLW1hcmNoPSBvciAtbWNwdT0KLi9idWlsZHJvb3QvdGVzdC9raGFkYXNfdmltM19kZWZj
b25maWdfcnVzdGljbF81L2hvc3QvYWFyY2g2NC1idWlsZHJvb3QtbGludXgtZ251L3N5c3Jvb3Qv
dXNyL2luY2x1ZGUvYml0cy9tYXRoLXZlY3Rvci5oOjM1OjI1OiBlcnJvcjogJ19fbmVvbl92ZWN0
b3JfdHlwZV9fJyBhdHRyaWJ1dGUgaXMgbm90IHN1cHBvcnRlZCBvbiB0YXJnZXRzIG1pc3Npbmcg
J25lb24nIG9yICdtdmUnOyBzcGVjaWZ5IGFuIGFwcHJvcHJpYXRlIC1tYXJjaD0gb3IgLW1jcHU9
Ci4vYnVpbGRyb290L3Rlc3Qva2hhZGFzX3ZpbTNfZGVmY29uZmlnX3J1c3RpY2xfNS9ob3N0L2Fh
cmNoNjQtYnVpbGRyb290LWxpbnV4LWdudS9zeXNyb290L3Vzci9pbmNsdWRlL2JpdHMvbWF0aC12
ZWN0b3IuaDo0MDo5OiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUgJ19fU1ZGbG9hdDMyX3QnCi4v
YnVpbGRyb290L3Rlc3Qva2hhZGFzX3ZpbTNfZGVmY29uZmlnX3J1c3RpY2xfNS9ob3N0L2FhcmNo
NjQtYnVpbGRyb290LWxpbnV4LWdudS9zeXNyb290L3Vzci9pbmNsdWRlL2JpdHMvbWF0aC12ZWN0
b3IuaDo0MTo5OiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUgJ19fU1ZGbG9hdDY0X3QnCi4vYnVp
bGRyb290L3Rlc3Qva2hhZGFzX3ZpbTNfZGVmY29uZmlnX3J1c3RpY2xfNS9ob3N0L2FhcmNoNjQt
YnVpbGRyb290LWxpbnV4LWdudS9zeXNyb290L3Vzci9pbmNsdWRlL2JpdHMvbWF0aC12ZWN0b3Iu
aDo0Mjo5OiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUgJ19fU1ZCb29sX3QnCmNsYW5nIGRpYWc6
IC4vYnVpbGRyb290L3Rlc3Qva2hhZGFzX3ZpbTNfZGVmY29uZmlnX3J1c3RpY2xfNS9ob3N0L2Fh
cmNoNjQtYnVpbGRyb290LWxpbnV4LWdudS9zeXNyb290L3Vzci9pbmNsdWRlL2ZlYXR1cmVzLmg6
NDE0OjQ6IHdhcm5pbmc6IF9GT1JUSUZZX1NPVVJDRSByZXF1aXJlcyBjb21waWxpbmcgd2l0aCBv
cHRpbWl6YXRpb24gKC1PKSBbLVcjd2FybmluZ3NdCnBhbmlja2VkIGF0IGJpbmRnZW4tY2xpL21h
aW4ucnM6NTI6MzY6CgpJ4oCZbSBzZW5kaW5nIHRoaXMgcGF0Y2ggc2VyaWVzIHRvIHNhdmUgdGhl
IHdvcmsgZG9uZSwgYXMgSSBkb27igJl0IGtub3cgaWYKSSB3aWxsIGhhdmUgdGltZSB0byB3b3Jr
IG9uIGl0LiAKCihJIHdpc2ggYSBnb29kIGJ1aWxkcm9vdCBzdW1tZXIgY2FtcCB0byBldmVyeW9u
ZSB3aG8gcGFydGljaXBhdGVzICEpCgpSZWdhcmRzLApBbnRvaW5lIENvdXRhbnQKClsxXTogaHR0
cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9saXN0Lz9zZXJpZXM9
MzkzMjk4JnN0YXRlPSUyQSZhcmNoaXZlPWJvdGgKCgoKQW50b2luZSBDb3V0YW50ICgzKToKICBw
YWNrYWdlL29wZW5jbC1pY2QtbG9hZGVyOiBuZXcgcGFja2FnZQogIHBhY2thZ2UvbGx2bS1wcm9q
ZWN0OiBhZGQgb3BlbmNsLWMtYmFzZS5oIG9uIHRhcmdldAogIHBhY2thZ2UvbWVzYTNkOiByZW1v
dmUgdGhlIGRlcGVuZGVuY3kgb24gQ2xvdmVyIGFuZCBidWlsZCBpdCBpbiBJQ0QKICAgIG1vZGUK
ClJvbWFpbiBOYW91ciAoMyk6CiAgcGFja2FnZS9wa2ctbWVzb24ubWs6IGFkZCBydXN0IGNyb3Nz
LWNvbXBpbGVyIHN1cHBvcnQKICBwYWNrYWdlL3NwaXJ2LWxsdm0tdHJhbnNsYXRvcjogYWRkIHRh
cmdldCB2YXJpYW50IHRvIHByb3ZpZGUKICAgIExMVk1TUElSVkxpYgogIHBhY2thZ2UvbWVzYTNk
OiBhZGQgUnVzdGlDTCBzdXBwb3J0CgpTZWJhc3RpYW4gV2V5ZXIgKDEpOgogIHBhY2thZ2Uvb3Bl
bmNsLWhlYWRlcnM6IG5ldyBwYWNrYWdlCgogcGFja2FnZS9Db25maWcuaW4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDMgKwogcGFja2FnZS9sbHZtLXByb2plY3QvY2xhbmcvY2xhbmcu
bWsgICAgICAgICAgIHwgIDkgKysrCiBwYWNrYWdlL21lc2EzZC1oZWFkZXJzL21lc2EzZC1oZWFk
ZXJzLm1rICAgICAgfCAgMiArLQogLi4uZW1vdmUtdGhlLWluc3RhbGxhdGlvbi1vZi1DTC1oZWFk
ZXJzLnBhdGNoIHwgNzEgKysrKysrKysrKysrKysrKysrKwogcGFja2FnZS9tZXNhM2QvQ29uZmln
LmluICAgICAgICAgICAgICAgICAgICAgIHwgNTAgKysrKysrKysrKystLQogcGFja2FnZS9tZXNh
M2QvbWVzYTNkLm1rICAgICAgICAgICAgICAgICAgICAgIHwgMTcgKysrLS0KIHBhY2thZ2Uvb3Bl
bmNsLWhlYWRlcnMvQ29uZmlnLmluICAgICAgICAgICAgICB8ICA3ICsrCiBwYWNrYWdlL29wZW5j
bC1oZWFkZXJzL29wZW5jbC1oZWFkZXJzLmhhc2ggICAgfCAgMyArCiBwYWNrYWdlL29wZW5jbC1o
ZWFkZXJzL29wZW5jbC1oZWFkZXJzLm1rICAgICAgfCAyMyArKysrKysKIHBhY2thZ2Uvb3BlbmNs
LWljZC1sb2FkZXIvQ29uZmlnLmluICAgICAgICAgICB8IDEyICsrKysKIC4uLi9vcGVuY2wtaWNk
LWxvYWRlci9vcGVuY2wtaWNkLWxvYWRlci5oYXNoICB8ICAzICsKIC4uLi9vcGVuY2wtaWNkLWxv
YWRlci9vcGVuY2wtaWNkLWxvYWRlci5tayAgICB8IDIwICsrKysrKwogcGFja2FnZS9wa2ctbWVz
b24ubWsgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMTMgKysrKwogcGFja2FnZS9zcGlydi1s
bHZtLXRyYW5zbGF0b3IvQ29uZmlnLmluICAgICAgIHwgMjIgKysrKysrCiAuLi4vc3BpcnYtbGx2
bS10cmFuc2xhdG9yLm1rICAgICAgICAgICAgICAgICAgfCAxMCArKysKIHN1cHBvcnQvbWlzYy9j
cm9zcy1jb21waWxhdGlvbi5jb25mLmluICAgICAgICB8ICAyICsKIDE2IGZpbGVzIGNoYW5nZWQs
IDI1NyBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL21lc2EzZC8wMDA4LWluY2x1ZGUtcmVtb3ZlLXRoZS1pbnN0YWxsYXRpb24tb2YtQ0wt
aGVhZGVycy5wYXRjaAogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvb3BlbmNsLWhlYWRlcnMv
Q29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9vcGVuY2wtaGVhZGVycy9vcGVu
Y2wtaGVhZGVycy5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9vcGVuY2wtaGVhZGVy
cy9vcGVuY2wtaGVhZGVycy5tawogY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2Uvb3BlbmNsLWlj
ZC1sb2FkZXIvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS9vcGVuY2wtaWNk
LWxvYWRlci9vcGVuY2wtaWNkLWxvYWRlci5oYXNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2Fn
ZS9vcGVuY2wtaWNkLWxvYWRlci9vcGVuY2wtaWNkLWxvYWRlci5tawogY3JlYXRlIG1vZGUgMTAw
NjQ0IHBhY2thZ2Uvc3BpcnYtbGx2bS10cmFuc2xhdG9yL0NvbmZpZy5pbgoKLS0gCjIuMzQuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290
IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
