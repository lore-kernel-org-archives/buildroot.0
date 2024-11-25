Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CA6D3B7C2
	for <buildroot@archiver.kernel.org>; Mon, 25 Nov 2024 00:02:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01CAE4034C;
	Mon, 25 Nov 2024 00:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Va9DxKU_opKt; Mon, 25 Nov 2024 00:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D38D6403AF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D38D6403AF;
	Mon, 25 Nov 2024 00:02:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 330BC4961
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 00:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 149F284794
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 00:02:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXap8WniYFMB for <buildroot@buildroot.org>;
 Mon, 25 Nov 2024 00:02:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=abelino.romo@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5C66384795
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C66384795
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5C66384795
 for <buildroot@buildroot.org>; Mon, 25 Nov 2024 00:02:23 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-21290973bcbso37301555ad.3
 for <buildroot@buildroot.org>; Sun, 24 Nov 2024 16:02:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732492942; x=1733097742;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7mBx84194G6kbrWLe6/4FtWGyRUN+syaUwnA8WjR5ZE=;
 b=HyMt2i9w3ik/7ANTVt8j+SlnvuPiW0KCNuWW8V93xOVj8NDCEwLG+LNwUw/tGu5h4f
 HSKl5iJbRQcmtwBWzlMl8ZsROcx88DWiZJrRK458gAvK2DoNTyr4FAzPWcKVGoOGpQLo
 VqETfNFS1AoXfypOJkIjWLYx/32Ur1OUiFdI3BxReHSMHJ4nMRrO0+XebfDegKaFuPsV
 j3XbwrA8t7VqzRSHzCak9sBiawdfYFzoXrnJgXC74DuOcECw0/sUev9lXQOU4oLmKVmR
 CxlH+DfngJ0iqYYXWR5Ar7wfn2nXOMqGnxXV43+wzYLEDocZMtNTv++bydJEmsVA832f
 gHcA==
X-Gm-Message-State: AOJu0YzpXrsnxM/7wpH7I5aMziKe8+3hN846MAsLcl8dWx3JLrCutrjy
 UyjbPmgkXvqI0pBwV4Dv8mUT8wTbGBSQU+YaC+qzPgaMoehR7D/fPoOURA==
X-Gm-Gg: ASbGncv//FhdBn6ItxSXX+olKFahCRJyEqxbNbq4X09ZowAG8GNwTxKspQkInwqiFlx
 78hPLtMed6CnX6jo/IN4PnllvGdmCz8GGiKZ8u8B4YtQhMasjmIUUByfvwpb59dy1xMp0rucWfl
 prAGTvNAq/xrcqRtOhcW2Yu0XSJZ/3REM1XB6YpVt2+Lk1OYgaiGRmZC0FaHFPxhiK2JiT6MDxD
 LYX7V8icB3GhhX3O1WWa+AcXsaKZfMTuAl8zg5Y/Jrdrcl1bhoj9USrC4/LzVIZDZ+htRUrwkrb
 EWcmBa4idU++fnzuUU+3q8g4DTPNun4=
X-Google-Smtp-Source: AGHT+IGgUXW4Wfm8Ul9nVmyK1qj6LQ59nelXq61Fn9pmSrXk00b0ujMwV1uhAC528FfLf3wxOZKQDA==
X-Received: by 2002:a17:902:da84:b0:212:548d:a5de with SMTP id
 d9443c01a7336-2129f57ea5bmr162095735ad.34.1732492942281; 
 Sun, 24 Nov 2024 16:02:22 -0800 (PST)
Received: from localhost.localdomain (47-144-216-38.lsan.ca.frontiernet.net.
 [47.144.216.38]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2129dba2eb4sm52072915ad.75.2024.11.24.16.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Nov 2024 16:02:21 -0800 (PST)
From: abelino <abelino.romo@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 abelino <abelino.romo@gmail.com>
Date: Sun, 24 Nov 2024 16:02:16 -0800
Message-ID: <20241125000233.2772592-1-abelino.romo@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1732492942; x=1733097742; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7mBx84194G6kbrWLe6/4FtWGyRUN+syaUwnA8WjR5ZE=;
 b=D9Ehlp7ktujG3gASzMzRkDMvk3Uw9IQVGtEn+TVLNWmowfLlBOSMzpqE8o26OgdlDA
 2t7kYhVyp8KhtkQhNk1IQF5xPZg8FLWwemv6Py74+VYwcFabF0vWgm6rVx1EMHO5G7fC
 XW0YADfZbJwHU/j6yrtXfZ+lgLe+h45TcQM2qJ1K3covatzHPyJyvrysYZe+tTiA/4J8
 POAXUaKWYBJfXDp7I/AdJUu3FfYMDQ5CEbLmmFh2Sgqoph97FNcdW3pZDPYLHnBXx+tL
 r7N8HPhbKjtEe1MTFRCWpowRXxTBzogpFijyMZ1nqeiUxLlIgx1PzNX4NFJCxY1nAPHe
 unqA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=D9Ehlp7k
Subject: [Buildroot] [PATCH 0/2] Add support for tpm2-tss v4.1.3 and
 tpm2-tss-engine v1.2.0
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

VGhpcyBwYXRjaCBzZXJpZXMgaW50cm9kdWNlcyB1cGRhdGVzIGFuZCBhZGRpdGlvbnMgZm9yIHRo
ZSBUUE0yIHNvZnR3YXJlIHN0YWNrLApzcGVjaWZpY2FsbHkgdGFyZ2V0aW5nIHRoZSBgdHBtMi10
c3NgIGFuZCBgdHBtMi10c3MtZW5naW5lYCBwYWNrYWdlcy4gVGhlc2UKdXBkYXRlcyBoYXZlIGJl
ZW4gdGVzdGVkIGFuZCBhcmUgaW4gdXNlIG9uIGEgcHJvamVjdCBmZWF0dXJpbmcgYW4KSW5maW5l
b24gU0xCOTY3MyBUUE0gbW9kdWxlLgoKVGhlIGZpcnN0IHBhdGNoIHVwZGF0ZXMgYHRwbTItdHNz
YCB0byB2ZXJzaW9uIDQuMS4zLCB3aGljaCByZXNvbHZlcyBhbiBpc3N1ZQplbmNvdW50ZXJlZCB3
aGlsZSByZWFkaW5nIE5WIGluZGljZXMgd2l0aCBlYXJsaWVyIHZlcnNpb25zIChpLmUuLCB2My4y
LjIpLgpBZGRpdGlvbmFsbHksIHRoZSB1cGRhdGUgaW5jb3Jwb3JhdGVzIG51bWVyb3VzIGZpeGVz
IGFuZCBlbmhhbmNlbWVudHMKaW50cm9kdWNlZCBpbiBpbnRlcm1lZGlhcnkgcmVsZWFzZXMsIGlu
Y2x1ZGluZyBhIHBhdGNoIGZvciBDVkUtMjAyNC0yOTA0MC4KClRoZSBzZWNvbmQgcGF0Y2ggYWRk
cyBzdXBwb3J0IGZvciB0aGUgYHRwbTItdHNzLWVuZ2luZWAgcGFja2FnZSBhdAp2ZXJzaW9uIDEu
Mi4wLiBUaGlzIHBhY2thZ2UgcHJvdmlkZXMgYW4gT3BlblNTTCBFbmdpbmUgaW1wbGVtZW50YXRp
b24gZm9yIFRQTTIKZGV2aWNlcywgZW5zdXJpbmcgY29tcGF0aWJpbGl0eSB3aXRoIGVjb3N5c3Rl
bXPigJRzdWNoIGFzIEVybGFuZ+KAlHRoYXQgcmVseSBvbgpPcGVuU1NMIEVuZ2luZXMgZHVlIHRv
IGluY29tcGxldGUgc3VwcG9ydCBmb3IgT3BlblNTTCBQcm92aWRlcnMuCgphYmVsaW5vICgyKToK
ICBwYWNrYWdlL3RwbTItdHNzOiBidW1wIHZlcnNpb24gdG8gNC4xLjMKICBwYWNrYWdlL3RwbTIt
dHNzLWVuZ2luZTogYWRkIHZlcnNpb24gMS4yLjAKCiAuY2hlY2twYWNrYWdlaWdub3JlICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMSAtCiBwYWNrYWdlL0NvbmZpZy5pbiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgfCAgMSArCiAuLi4tZGlzYWJsaW5nLW9mLWRpZ2VzdC1zaWduLW9w
ZXJhdGlvbnMucGF0Y2ggfCA0NiArKysrKysrKysrKysrKysrKysrCiBwYWNrYWdlL3RwbTItdHNz
LWVuZ2luZS9Db25maWcuaW4gICAgICAgICAgICAgfCAxMiArKysrKwogcGFja2FnZS90cG0yLXRz
cy1lbmdpbmUvdHBtMi10c3MtZW5naW5lLmhhc2ggIHwgIDMgKysKIHBhY2thZ2UvdHBtMi10c3Mt
ZW5naW5lL3RwbTItdHNzLWVuZ2luZS5tayAgICB8IDE5ICsrKysrKysrCiAuLi4wMS1UZW1wb3Jh
cnktZml4LWZvci1idWlsZC13aXRob3V0LUMucGF0Y2ggfCA0NCAtLS0tLS0tLS0tLS0tLS0tLS0K
IHBhY2thZ2UvdHBtMi10c3MvQ29uZmlnLmluICAgICAgICAgICAgICAgICAgICB8ICAyICsKIHBh
Y2thZ2UvdHBtMi10c3MvdHBtMi10c3MuaGFzaCAgICAgICAgICAgICAgICB8ICAyICstCiBwYWNr
YWdlL3RwbTItdHNzL3RwbTItdHNzLm1rICAgICAgICAgICAgICAgICAgfCAgOSArKy0tCiAxMCBm
aWxlcyBjaGFuZ2VkLCA4NyBpbnNlcnRpb25zKCspLCA1MiBkZWxldGlvbnMoLSkKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBwYWNrYWdlL3RwbTItdHNzLWVuZ2luZS8wMDAxLUFsbG93LWRpc2FibGluZy1v
Zi1kaWdlc3Qtc2lnbi1vcGVyYXRpb25zLnBhdGNoCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2Fn
ZS90cG0yLXRzcy1lbmdpbmUvQ29uZmlnLmluCiBjcmVhdGUgbW9kZSAxMDA2NDQgcGFja2FnZS90
cG0yLXRzcy1lbmdpbmUvdHBtMi10c3MtZW5naW5lLmhhc2gKIGNyZWF0ZSBtb2RlIDEwMDY0NCBw
YWNrYWdlL3RwbTItdHNzLWVuZ2luZS90cG0yLXRzcy1lbmdpbmUubWsKIGRlbGV0ZSBtb2RlIDEw
MDY0NCBwYWNrYWdlL3RwbTItdHNzLzAwMDEtVGVtcG9yYXJ5LWZpeC1mb3ItYnVpbGQtd2l0aG91
dC1DLnBhdGNoCgotLQoyLjQ3LjAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
