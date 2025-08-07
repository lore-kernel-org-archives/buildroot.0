Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87860C87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:25:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5B33D80EFE;
	Thu,  7 Aug 2025 18:25:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6YeYt2P4JLXl; Thu,  7 Aug 2025 18:25:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 174E080EE4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 174E080EE4;
	Thu,  7 Aug 2025 18:25:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 80AA94C6
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 71FD860642
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9eGuDyLehcrJ for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8B38E605F0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B38E605F0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B38E605F0
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:42 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-459e794b331so8583985e9.3
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591080; x=1755195880;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EFwNaf+0vESVYSsGZli66lbTCUGhrllf7bd7z/YNFIo=;
 b=djeOhbsEOoc1NjVGLNwoLQ7t+iMAoVlu3oOoZwiBKTUkB7XOcLvghZBIv/ugdcyTY9
 OtVgLdX/uPho6qs1iF0KXwlKHVpRNrrXdhsTTgrgUzsv3B0AoV7XpJ19mKv7YUSJXvH8
 twg1tATE9hSG1iCacV/h+9MCO6UCAnhuFona1tYkxE+As3XSho7ex/j+AZWJOHj9U3u0
 zxBRQeEkWzXP+V/1I8edWt9qYdk/AKB9CfuMKq5LcyuAPRbxDAYcNPdXZX3g3H393J/k
 s62Bwmz7VJBCgsxOOUiJ3b+kN6TVUAixyj+zbx8lx5TLVTY9I838HLrFxiSLpB8ppss7
 MTZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6Ly6ltzFw3pTXUW99mhpNC1IGIw8U73BYmsgNj8nNDuVPVOPvMFhaN8r4YWXGvxvrtZ4cg65vi4c=@buildroot.org
X-Gm-Message-State: AOJu0Yy0mXg/eXIaUni8gsyq12NI4yE0zdGDCcDDYaXKSxWeCqBfMCLG
 hTTZbzJx0rSU+kpoOLOFr6yqxmthW/I9ee33wSFLILVTpq3GO33B+ut0umu/PQbtihY=
X-Gm-Gg: ASbGncuP0F+XCZsWJzGORIYCb+k9UErKAlRHPdLMBEAiBi08PX8ltY/kMCZj5rbSrB8
 NZ8NFpX8u1W5GlifVl9e+vtvMhhKi35eOhD8iyOOTvZeQOSxJTr+Jc4ipn0Grd3fn3AexCEBUtZ
 dMCHDlqjYP/xTCqZ97OdS+RFfLS9fuPZr2/CQZm2t3gaVqCTm/U34OiwC4jNhJeoL6S+g/GxS8r
 HuYvkyc8Y2KD6/T4ZauogQ0gydC956zUW3Ele8wDHIlvwxu2xfUAyFKLB1ECzkPVmA1VQrWnw4/
 WjamWVKzFJXEHKn8u6jgYggui3nnprGpdREaK+c2zZUZfKVxo9W0wNFjUclzqmegrI02A9/guNc
 a/YWtDC51/aI6iA==
X-Google-Smtp-Source: AGHT+IFFlwDgXNrt9OPXulofSFfhuwihUU0uoC9YA19MwyPfiKD1ABRlh4iiX33lnaEMNP3B60GYDg==
X-Received: by 2002:a05:600c:1d01:b0:459:dba8:bb7b with SMTP id
 5b1f17b1804b1-459f4ecf85cmr126955e9.13.1754591080160; 
 Thu, 07 Aug 2025 11:24:40 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-458bb04c612sm226024745e9.0.2025.08.07.11.24.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:39 -0700 (PDT)
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:38 +0200
Message-ID: <20250807182439.725950-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725223613.1401870-1-ju.o@free.fr>
References: <20250725223613.1401870-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591080; x=1755195880; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EFwNaf+0vESVYSsGZli66lbTCUGhrllf7bd7z/YNFIo=;
 b=QkW+AHDSsSJ+2nG97C0kpkImZMKAPyaR8oVugs562n6lUexc6sABwHULt3g6PoXPg3
 dCRJpL7v1N7jKSMj3FeX6ud58lZhvrEzcYmvsbLbE7YiYPjs626S1lBJ88e3tG5AqzsB
 L7GDuW2kkxYqWXY+3XndAOucDr/VfL3kyaw6bHcJQ8WyGR94f37OeJuXOgPc7arFOBDg
 moVgpmPWbBxvkQxufyB34WRbi0p7b0a5aBHArvROz37UlmXzsXq6uv2WISRWobPo9RR1
 SVNIiu7coc+xiwnzH5ACZvWfYxVpWTcC0PdMHsrqrj8bCcwB0D5q+byCoj+zsYXxgJdn
 g9ZQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=QkW+AHDS
Subject: Re: [Buildroot] [PATCH 1/1] support/testing: test_xen: rename
 TestXen to TestXenAarch64
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SW4gcmVwbHkgb2Y6Cj4gQ29tbWl0IFsxXSBpbnRyb2R1Y2VkIGFuIEFybXY3IHRlc3QgY2FzZSBm
b3IgWGVuIG5hbWVkIFRlc3RYZW5Bcm12NywKPiBuZXh0IHRvIHRoZSBvcmlnaW5hbCBBYXJjaDY0
IHRlc3QgY2FzZSB3aGljaCB3YXMgc2ltcGx5IG5hbWVkIFRlc3RYZW4uCj4gCj4gVGhlIHRlc3Qg
bGlzdCBzaG93cywgZm9yIGV4YW1wbGUgd2l0aCB0aGUgY29tbWFuZAo+ICJzdXBwb3J0L3Rlc3Rp
bmcvcnVuLXRlc3RzIC1sIjoKPiAKPiAgICAgdGVzdHMucGFja2FnZS50ZXN0X3hlbi5UZXN0WGVu
Cj4gICAgIHRlc3RzLnBhY2thZ2UudGVzdF94ZW4uVGVzdFhlbkFybXY3Cj4gCj4gSW4gb3JkZXIg
dG8gbWFrZSB0aGlzIHRlc3QgbGlzdCBhIGJpdCBtb3JlIGV4cGxpY2l0LCB0aGlzIGNvbW1pdAo+
IHJlbmFtZXMgdGhlIFRlc3RYZW4gdG8gVGVzdFhlbkFhcmNoNjQuIFdpdGggdGhhdCBjaGFuZ2Us
IHRoZSBsaXN0Cj4gYmVjb21lczoKPiAKPiAgICAgdGVzdHMucGFja2FnZS50ZXN0X3hlbi5UZXN0
WGVuQWFyY2g2NAo+ICAgICB0ZXN0cy5wYWNrYWdlLnRlc3RfeGVuLlRlc3RYZW5Bcm12Nwo+IAo+
IFsxXSBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21taXQv
NTM0NjgyNGE4MzQ4OGY4NDAwMDhlYjI0Zjg0ODY2NDM1YWMzMmExMgo+IAo+IENjOiBWaW5jZW50
IFN0ZWhsw6kgPHZpbmNlbnQuc3RlaGxlQGFybS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSnVsaWVu
IE9saXZhaW4gPGp1Lm9AZnJlZS5mcj4KCkFwcGxpZWQgdG8gMjAyNS4wMi54ICYgMjAyNS4wNS54
LiBUaGFua3MKCj4gLS0tCj4gIHN1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfeGVu
LnB5IHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVzdF94
ZW4ucHkgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3hlbi5weQo+IGluZGV4
IDQyNzhiOTU2M2UuLjg4MTMyN2I5YjkgMTAwNjQ0Cj4gLS0tIGEvc3VwcG9ydC90ZXN0aW5nL3Rl
c3RzL3BhY2thZ2UvdGVzdF94ZW4ucHkKPiArKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFj
a2FnZS90ZXN0X3hlbi5weQo+IEBAIC04OSw3ICs4OSw3IEBAIGNsYXNzIFRlc3RYZW5CYXNlKGlu
ZnJhLmJhc2V0ZXN0LkJSVGVzdCk6Cj4gICAgICAgICAgc2VsZi5hc3NlcnROdW1WTSgyKQo+ICAK
PiAgCj4gLWNsYXNzIFRlc3RYZW4oVGVzdFhlbkJhc2UpOgo+ICtjbGFzcyBUZXN0WGVuQWFyY2g2
NChUZXN0WGVuQmFzZSk6Cj4gICAgICAjIFRlc3QgWGVuIG9uIDY0YiBBcm0uCj4gICAgICAjIEJv
b3QgZmxvdzogUWVtdSBEZXZpY2V0cmVlIC0+IFUtQm9vdCAtPiBYZW4gVUVGSSAtPiBMaW51eAo+
ICAgICAgIyBXZSBuZWVkIHRvIGJvb3QgWGVuIGluIFVFRkkgdG8gcmVhZCB4ZW4uY2ZnLgo+IC0t
IAo+IDIuNTAuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3Jn
Cj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
