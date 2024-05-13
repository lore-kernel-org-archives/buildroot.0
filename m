Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6A16C25B75
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 11:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 517744026D;
	Mon, 13 May 2024 11:39:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N94CrepxBYkf; Mon, 13 May 2024 11:39:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1AADB4028E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AADB4028E;
	Mon, 13 May 2024 11:39:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5B6561BF479
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 11:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55D1960656
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 11:39:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yn5rVymJ0okK for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 11:39:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1032; helo=mail-pj1-x1032.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 40E4D60622
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40E4D60622
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40E4D60622
 for <buildroot@buildroot.org>; Mon, 13 May 2024 11:39:50 +0000 (UTC)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2b6215bcd03so1128798a91.1
 for <buildroot@buildroot.org>; Mon, 13 May 2024 04:39:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715600389; x=1716205189;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VFXkyKp4mT1FHfYnRmDbdsMmUhxEZ1t2zBLRlWCfHOI=;
 b=FWyXf9cOXZwgXfXuANDuu3kIcC9w+bV6RexptyMgrY9CGYApkn4VetyFr4UCiv+6sm
 U+7Hu6+OCe34iqtZbcD4lzzbPG+P3VUs295EdYYZNRGNgJ1zyqgzLb/jsNspsLNA60+l
 FeiS+m7UqqyYZvC+rrLMZc4OjAXvve2DAwTdCAXas/fqIL7Tk4YsRThZJ9TLBDPf0qTi
 nCRw7lGV4JeHsTdBGQZjoiQoZJ6THZKj3LtYrEWkxGi1fmxE4ctt8CjSQoigmYv/lWxp
 uR4D1p51uZMnBBy/+y8+betOdVTjwOyjCvJJeQ7Jytj3oNyaQzgG73sfysvimQX5km/C
 VRlQ==
X-Gm-Message-State: AOJu0YxZSok6auJKyfkHK1+yNZLML37oEBNLYMNfiURFTR8yBfdYzUA6
 KuZLD3MQ6UbnlC0KfSnPdl3NQ+3S0zib7pQeLBLRp9H7BJOKIHooPH6YEfx7bxG+uDEi3Ivxj9A
 D/JwZSa2HO8mdgqQVULI1r/EBnoX1l4a+
X-Google-Smtp-Source: AGHT+IGxW0tyF2vRTWEHtbqiWL9TydRaZIN4p5V45j/OaUPF+35IKFNNmBUIglHfzGgUBZM99L85+JE9/sRvtdJqNmY=
X-Received: by 2002:a17:90a:5285:b0:2a5:3f1f:a1d1 with SMTP id
 98e67ed59e1d1-2b6cb7d0ebbmr9076200a91.0.1715600389535; Mon, 13 May 2024
 04:39:49 -0700 (PDT)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 13 May 2024 08:39:38 -0300
Message-ID: <CAOMZO5BFKyfF8WpZC9W=1uH0C4mNzZfHTADJTtDc4epxdnLDCg@mail.gmail.com>
To: =?UTF-8?Q?S=C3=A9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>, 
 Julien Olivain <ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715600389; x=1716205189; darn=buildroot.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VFXkyKp4mT1FHfYnRmDbdsMmUhxEZ1t2zBLRlWCfHOI=;
 b=bzYpQPH+ZLxoiRi51Jhu60zUOZzngaZw7OECk8sfMiY/JhH+zBHk14ighHcoan0t3Z
 395qblxQRRZsH4oLbgqfAPW9rx4T/GZA48rGVNO05uSzxQllfiMXU3IJt29Xdgo5oKlK
 dEAc3D7wIoEkOt8FRUK/LP6MRY1hlVxpLoYVG0fIo1gtsZNo0ADj4gFsutodKa5d9fuH
 K7/9jG3HyX46dtTly00+PzK0vl6HEexk3f/cROqfXlGma/aJDucDyQ8XzD9ynddH8jSc
 Cdt7Yu8byuTlpnm30ChdboRxX7Lluo8LHqT7goAJfgOiy6gboAs/h87jS1vc+siw02U3
 kimA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bzYpQPH+
Subject: [Buildroot] imx93-evk: Fails to boot from the SD card
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgU8OpYmFzdGllbiBhbmQgSnVsaWVuLAoKSSBidWlsdCBhbiBpbWFnZSBmb3IgZnJlZXNjYWxl
X2lteDkzZXZrX2RlZmNvbmZpZyB1c2luZyB0aGUgdG9wIG9mCnRyZWUgQnVpbGRyb290LCBmbGFz
aGVkIHRoZSBzZGNhcmQuaW1nIGludG8gYW4gU0QgY2FyZCBhbiBwdXQgdGhlIGJvb3QKc3dpdGNo
IHRvIFNEIGNhcmQgYm9vdCBtb2RlLCBidXQgdGhlIGltYWdlIGZhaWxzIHRvIGJvb3Q6CgpVLUJv
b3QgU1BMIDIwMjMuMDQgKEFwciAyOCAyMDI0IC0gMTA6NTk6MzUgLTAzMDApClNPQzogMHhhMTAw
OTMwMApMQzogMHgyMDQwMDEwClBNSUM6IE92ZXIgRHJpdmUgVm9sdGFnZSBNb2RlCkREUjogMzcz
M01UUwpNMzMgcHJlcGFyZSBvawpOb3JtYWwgQm9vdApUcnlpbmcgdG8gYm9vdCBmcm9tIEJPT1RS
T00KQm9vdCBTdGFnZTogUHJpbWFyeSBib290CmltYWdlIG9mZnNldCAweDgwMDAsIHBhZ2VzaXpl
IDB4MjAwLCBpdnQgb2Zmc2V0IDB4MApMb2FkIGltYWdlIGZyb20gMHg1NjgwMCBieSBST01fQVBJ
Ck5PVElDRTogIEJMMzE6IHYyLjgocmVsZWFzZSk6Y3VzdG9tCk5PVElDRTogIEJMMzE6IEJ1aWx0
IDogMTA6NTU6MjcsIEFwciAyOCAyMDI0CgoKVS1Cb290IDIwMjMuMDQgKEFwciAyOCAyMDI0IC0g
MTA6NTk6MzUgLTAzMDApCgpDUFU6ICAgaS5NWDkzKDUyKSByZXYxLjEgMTcwMCBNSHogKHJ1bm5p
bmcgYXQgMTY5MiBNSHopCkNQVTogICBJbmR1c3RyaWFsIHRlbXBlcmF0dXJlIGdyYWRlICgtNDBD
IHRvIDEwNUMpIGF0IDQzQwpSZXNldCBjYXVzZTogUE9SICgweDEpCk1vZGVsOiBOWFAgaS5NWDkz
IDExWDExIEVWSyBib2FyZApEUkFNOiAgMiBHaUIKb3B0ZWUgb3B0ZWU6IE9QLVRFRSBhcGkgdWlk
IG1pc21hdGNoClRDUEM6ICBWZW5kb3IgSUQgWzB4MWZjOV0sIFByb2R1Y3QgSUQgWzB4NTExMF0s
IEFkZHIgW0kyQzIgMHg1Ml0KU05LLlBvd2VyMy4wIG9uIENDMQpQRE8gMDogdHlwZSAwLCA1MDAw
IG1WLCAzMDAwIG1BIFtFXQpQRE8gMTogdHlwZSAwLCA5MDAwIG1WLCAzMDAwIG1BIFtdClBETyAy
OiB0eXBlIDAsIDE1MDAwIG1WLCAzMDAwIG1BIFtdClBETyAzOiB0eXBlIDAsIDIwMDAwIG1WLCAy
MjUwIG1BIFtdClJlcXVlc3RpbmcgUERPIDM6IDIwMDAwIG1WLCA3NTAgbUEKU291cmNlIGFjY2Vw
dCByZXF1ZXN0ClBEIHNvdXJjZSByZWFkeSEKdGNwY19wZF9yZWNlaXZlX21lc3NhZ2U6IFBvbGxp
bmcgQUxFUlQgcmVnaXN0ZXIsIFRDUENfQUxFUlRfUlhfU1RBVFVTCmJpdCBmYWlsZWQsIHJldCA9
IC02MgpUQ1BDOiAgVmVuZG9yIElEIFsweDFmYzldLCBQcm9kdWN0IElEIFsweDUxMTBdLCBBZGRy
IFtJMkMyIDB4NTFdClRDUEM6ICBWZW5kb3IgSUQgWzB4MWZjOV0sIFByb2R1Y3QgSUQgWzB4NTEx
MF0sIEFkZHIgW0kyQzIgMHg1MF0KQ29yZTogIDIyOSBkZXZpY2VzLCAzNiB1Y2xhc3NlcywgZGV2
aWNldHJlZTogc2VwYXJhdGUKTU1DOiAgIEZTTF9TREhDOiAwLCBGU0xfU0RIQzogMQpMb2FkaW5n
IEVudmlyb25tZW50IGZyb20gTU1DLi4uICoqKiBXYXJuaW5nIC0gTm8gYmxvY2sgZGV2aWNlLCB1
c2luZwpkZWZhdWx0IGVudmlyb25tZW50CgpbKl0tVmlkZW8gTGluayAwYWR2NzUzNV9taXBpMmhk
bWkgaGRtaUAzZDogQ2FuJ3QgZmluZCBjZWMgZGV2aWNlIGlkPTB4M2MKZmFpbCB0byBwcm9iZSBw
YW5lbCBkZXZpY2UgaGRtaUAzZApmYWlsIHRvIGdldCBkaXNwbGF5IHRpbWluZ3MKcHJvYmUgdmlk
ZW8gZGV2aWNlIGZhaWxlZCwgcmV0IC0xOQoKWzBdIGxjZC1jb250cm9sbGVyQDRhZTMwMDAwLCB2
aWRlbwpbMV0gZHNpQDRhZTEwMDAwLCB2aWRlb19icmlkZ2UKWzJdIGhkbWlAM2QsIHBhbmVsCmFk
djc1MzVfbWlwaTJoZG1pIGhkbWlAM2Q6IENhbid0IGZpbmQgY2VjIGRldmljZSBpZD0weDNjCmZh
aWwgdG8gcHJvYmUgcGFuZWwgZGV2aWNlIGhkbWlAM2QKZmFpbCB0byBnZXQgZGlzcGxheSB0aW1p
bmdzCnByb2JlIHZpZGVvIGRldmljZSBmYWlsZWQsIHJldCAtMTkKSW46ICAgIHNlcmlhbApPdXQ6
ICAgc2VyaWFsCkVycjogICBzZXJpYWwKCkJ1aWxkSW5mbzoKICAtIEVMRSBmaXJtd2FyZSB2ZXJz
aW9uIDAuMS4wLTQ0ODgwOTA0CgpVSUQ6IDB4NjI4MGE4NjAgMHg1ODQ2NTUyMCAweDk4ODM3OTlm
IDB4MzExMDEyZmIKZmxhc2ggdGFyZ2V0IGlzIE1NQzoxCk1NQyBjYXJkIGluaXQgZmFpbGVkIQoq
KiBCbG9jayBkZXZpY2UgTU1DIDEgbm90IHN1cHBvcnRlZAoKVGhlIFNEIGNhcmQgaXMgbm90IHJl
Y29nbml6ZWQuCgpXb3VsZCB5b3UgaGFwcGVuIHRvIGhhdmUgYW55IHN1Z2dlc3Rpb25zPwoKVGhh
bmtzLAoKRmFiaW8gRXN0ZXZhbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
