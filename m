Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A70AC87FD2
	for <buildroot@archiver.kernel.org>; Fri,  8 Aug 2025 13:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 01E2060D98;
	Fri,  8 Aug 2025 13:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FO45Zf5EJjKT; Fri,  8 Aug 2025 13:31:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02B6860C20
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 02B6860C20;
	Fri,  8 Aug 2025 13:31:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BD90D9CF
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 13:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99E1F60D66
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 13:31:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VTLGLLAl4La6 for <buildroot@buildroot.org>;
 Fri,  8 Aug 2025 13:31:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=elmehdi.younes@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5D9EA60C20
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D9EA60C20
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D9EA60C20
 for <buildroot@buildroot.org>; Fri,  8 Aug 2025 13:31:27 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3b7862bd22bso1578677f8f.1
 for <buildroot@buildroot.org>; Fri, 08 Aug 2025 06:31:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754659885; x=1755264685;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=k0U4tT+h7iWMjGkRDBSpGhThj21qGSTPFwj1DGkkP+c=;
 b=sFJoUZV3L4W/nLt4Dqn0Ypl+VRThCJuDTEThLlJK+uuSpgUvGEBKlxkZSvAlQYugAV
 h2cQKEJg9RbStIN/qfq8m5DUeNxJLqAI9fxUbFNguGB1OS+vkQhC+0iBGoAC6zWPbngY
 P6D7toEqUQzqfIkJb1CS36PyFO2b4S6bRiG27pgZcb0uzQaDfZnsghiFp/4H5AIqshfH
 reBdczBFFWY8+iTVLAcVsOOOyFtB9X9/8Xp8zmNOkyu/6ylVTKh+H7BEbTWnXX+9AOYO
 60O8/3snrDXoaoCrf3f9g2ikhBOvo0/ZZMP7/6Gc4YJcUl0guDE+Y4wZbusG+MstN1r5
 9f7w==
X-Gm-Message-State: AOJu0YxxgqwD3zMoeapDdtSPnDYwLehJrpNrD7P3VYrpKzD0gH2twEDT
 pUftdo7IM2cm5P2LkD81bvt1VGk6siPmjVzlp4M33G4jcHmaK9djxSaZla0lHIByzdddP19JHIw
 zve8f
X-Gm-Gg: ASbGncuffdM91Tx9GgKi4rs6y1jwq34X/JzuKuDuqTraE/catHfuxdQNLjWkqmBkdzX
 HOQScgP6i46/N0HKBEn+8dijRSFZ807NaNKSl5WsOksL6LW0I8fznkVhGXt8O8HzJWLQgMG5AxU
 vIHw9uLwQ/pU1EXzaXzR2m+hwADE3TngRk1ivURPT/dTq3F2H5ktSqPPY4c4BYis3c4xxFBr7QN
 nv3G3CxZclpueR12WHHDNAbQyUodAjAhA/YHtOTPdHBmrXDMWlGzl7V9xvoXDeli+0RQlqfnR/s
 KvwNYF3OJPEUJ4GU1idw3UU/ZP7EKDyvrOC1L8RrseLhZQAQfKzq2TnoVtxiPYLDcMprVsWAxKw
 HkNpiD143mA0P7m4EItqePd1kWexefEtRTZWw/lLk2udTHmfIynJClVffRYKM9f/jyiYxiibH4w
 ohR4Tk6OUejifpdw5daBdzKt0cqcU=
X-Google-Smtp-Source: AGHT+IGvzb9ojkCZpco3xSdg90L4m2rNemgLO2wMzLs+je1jib6MGW4p9X9pdBK4QqTRLWLuoVmAoQ==
X-Received: by 2002:a5d:588a:0:b0:3b7:9d87:9808 with SMTP id
 ffacd0b85a97d-3b8f97e179bmr7332201f8f.15.1754659884911; 
 Fri, 08 Aug 2025 06:31:24 -0700 (PDT)
Received: from P-NAN-ABRICOT..
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5873c43sm149053965e9.22.2025.08.08.06.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 06:31:24 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 El Mehdi YOUNES <elmehdi.younes@smile.fr>
Date: Fri,  8 Aug 2025 15:31:07 +0200
Message-ID: <20250808133112.3212687-1-elmehdi.younes@smile.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1754659885; x=1755264685; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=k0U4tT+h7iWMjGkRDBSpGhThj21qGSTPFwj1DGkkP+c=;
 b=v8XgSgvHbtJnYFJqmKk0qcXi2xNYhhUf4aAPmtD6krJY74/8oXhN6KBmsgMP8W5Hae
 SxEbH8Za91b6EDkk0CKaNZM/PdLXGgjVxS00qmxPYjzZSuDYWxIx6D4osdR8XQDF/Sln
 OYryw0iGELAKeaw8VFpFfqR3pZa75i2EdPQwc=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=v8XgSgvH
Subject: [Buildroot] [RFC PATCH 0/5] Add Rust for Linux support
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
From: El Mehdi YOUNES via buildroot <buildroot@buildroot.org>
Reply-To: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBzZXJpZXMgaXMgYSBiZXN0LWVmZm9ydCB0byBzaGFyZSBvdXIgd29yayBhbmQgaWRlYXMg
b24gZW5hYmxpbmcKUnVzdC1mb3ItTGludXggZnJvbSBCdWlsZHJvb3QsIGFuZCB0byByZXF1ZXN0
IGhlbHAgYW5kIGZ1cnRoZXIgaWRlYXMgZnJvbQp0aGUgY29tbXVuaXR5LgoKLSBiaW5kZ2VuIOKG
kiBjbGFuZy9saWJjbGFuZwogIEZyb20gcHJpb3IgYmluZGdlbiB1c2UgaW4gTWVzYSBhbmQgUnVz
dC1mb3ItTGludXggZ3VpZGFuY2UsIGJpbmRnZW4gbmVlZHMKICBsaWJjbGFuZyBhdmFpbGFibGUg
YXQgYnVpbGQgdGltZS4gV2UgdGhlcmVmb3JlIGFkZCBhIGhvc3QtY2xhbmcgZGVwZW5kZW5jeQog
IGZvciBob3N0IGJpbmRnZW4gYW5kIGNvbnNpZGVyIGl0IG1hbmRhdG9yeSBpbiB0aGlzIGNvbnRl
eHQuCgotIHJ1c3Qgc3RkIHNvdXJjZXMgZm9yIHRoZSBrZXJuZWwKICBSdXN0LWZvci1MaW51eCBu
ZWVkcyB0aGUgc3RkIHNvdXJjZXMgKGUuZy4gY29yZS9saWIucnMpLiBXZSBkb3dubG9hZAogIHJ1
c3RjLTx2ZXI+LXNyYy50YXIueHogYW5kIGluc3RhbGwgb25seSB0aGUgbGlicmFyeS8gc3VidHJl
ZSB0bzoKICAgICQoSE9TVF9ESVIpL2xpYi9ydXN0bGliL3NyYy9ydXN0LwogIEV4dHJhIGRvd25s
b2FkcyBhcmUgc3BsaXQgKHN0ZCB2cyBzb3VyY2VzKSB0byBhdm9pZCBjb25mbGljdHMuIEEgcG9z
c2libGUKICBpbXByb3ZlbWVudCBpcyB0byBpbnN0YWxsIHNvdXJjZXMgb25seSB3aGVuIHRoZSBr
ZXJuZWwgUnVzdCBvcHRpb24gaXMKICBlbmFibGVkOyB0aGlzIGlzIG5vdCBkb25lIHlldCBidXQg
aXMgZmVhc2libGUuCgotIHJ1c3RmbXQgKGNsaXBweSBvcHRpb25hbCkKICBUaGUga2VybmVsIHJl
cXVpcmVzIHJ1c3RmbXQ7IHdlIGluc3RhbGwgaXQgKGNvbXBvbmVudCBuYW1lIGlzCiAgcnVzdGZt
dC1wcmV2aWV3KS4gQ2xpcHB5IGlzIG9wdGlvbmFsIGZvciBkZXZlbG9wZXJzIGFuZCBpcyBub3Qg
aW5jbHVkZWQKICBpbiB0aGlzIHJvdW5kLgoKLSBLZXJuZWwgS2NvbmZpZyBjaGVjayB2cyBidWls
ZCBvcmRlcgogIEVuYWJsaW5nIFJ1c3QgaW4gdGhlIGtlcm5lbCBkZXBlbmRzIG9uIGhvc3QgdG9v
bHMgYmVpbmcgcHJlc2VudCBkdWUgdG8KICB0aGUgZWFybHkgYXZhaWxhYmlsaXR5IGNoZWNrOgog
ICAgaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xpbnV4L2Jsb2IvbWFzdGVyL3NjcmlwdHMv
cnVzdF9pc19hdmFpbGFibGUuc2gKICAgIGh0dHBzOi8vZ2l0aHViLmNvbS90b3J2YWxkcy9saW51
eC9ibG9iL21hc3Rlci9pbml0L0tjb25maWcjTDcwCiAgVG8gY29wZSB3aXRoIHRoaXMsIHdlIGFk
ZCBhIEJ1aWxkcm9vdCBtZW51IG9wdGlvbiB0byB3aXJlIFJ1c3QgdG9vbHMgYW5kCiAgcGF0aHMu
IEluIHByYWN0aWNlLCBpdCBpcyBhIHR3by1zdGVwIGZsb3c6IGJ1aWxkIG9uY2UgKHRvb2xzIGJl
Y29tZQogIGF2YWlsYWJsZSksIHRoZW4gZW5hYmxlIFJ1c3QgZHJpdmVycy9zYW1wbGVzIHZpYSBs
aW51eC1tZW51Y29uZmlnLgoKLSBIT1NUQ0MgaGFuZGxpbmcgKHJ1c3RjIC1DbGlua2VyKQogIEEg
Y2hhbmdlIGlzIG5lZWRlZCBpbiBob3cgSE9TVENDIGlzIHBhc3NlZCB0byB0aGUga2VybmVsIGJ1
aWxkOyB0aGUKICBjdXJyZW50IGVtYmVkZGluZyBvZiBmbGFncyBpbnRvIEhPU1RDQyBkb2VzIG5v
dCB3b3JrIHdpdGggcnVzdGPigJlzCiAgLUNsaW5rZXIuIFRoZSA0dGggcGF0Y2ggYWRkcmVzc2Vz
IHRoaXMgYnkgc3BsaXR0aW5nIHRoZSBjb21waWxlciBmcm9tCiAgaXRzIGZsYWdzIGFuZCB1c2lu
ZyBLYnVpbGTigJlzIGhvc3Qtc2lkZSB2YXJpYWJsZXMgKGF2YWlsYWJsZSBzaW5jZQogIHY0LjE5
KS4gR3VpZGFuY2UgaXMgd2VsY29tZSBvbiBnYXRpbmcgZm9yIG9sZGVyIGtlcm5lbHMgKDwgNC4x
OSk6IHRpZQogIGl0IHRvIEJSMl9MSU5VWF9LRVJORUxfUlVTVF9TVVBQT1JULCByZXF1aXJlIGhl
YWRlcnMgPj0gNC4xOSwgb3IgYW55CiAgYWx0ZXJuYXRpdmUgdGhlIG1haW50YWluZXJzIHJlY29t
bWVuZC4KClRoaXMgc2VyaWVzIGRvZXMgbm90IGNsYWltIHRoYXQgUnVzdC1mb3ItTGludXggc2hv
dWxkIGJlIGEgcHJpb3JpdHkgcmlnaHQKbm93OyB1cHN0cmVhbSBpcyBzdGlsbCBldm9sdmluZyBh
bmQga2VybmVsLXNpZGUgc3VwcG9ydCBpcyB5b3VuZy4gSG93ZXZlciwKd2UgZXhwZWN0IHRoYXQg
ZW5hYmxpbmcgUnVzdCB3aWxsIGV2ZW50dWFsbHkgYmVjb21lIG5lY2Vzc2FyeSBpbiBCdWlsZHJv
b3QuCkl0IGlzIGJldHRlciB0byBwcmVwYXJlIHRoZSBpbnRlZ3JhdGlvbiBhbmQgYWdyZWUgb24g
Z2F0aW5nIG5vdywgc28gd2UgYXJlCnJlYWR5IHdoZW4gdGhlIGVjb3N5c3RlbSBzdGFiaWxpemVz
LgoKQmVzdCByZWdhcmRzLApFbCBNZWhkaSBZT1VORVMKCkVsIE1laGRpIFlPVU5FUyAoNSk6CiAg
cGFja2FnZS9ydXN0LWJpbmRnZW46IGFkZCBob3N0LWNsYW5nIGRlcGVuZGVuY3kKICBwYWNrYWdl
L3J1c3QtYmluOiBhZGQgUnVzdCBzb3VyY2VzCiAgcGFja2FnZS9ydXN0LWJpbjogaW5zdGFsbCBy
dXN0Zm10CiAgbGludXg6IHNwbGl0IEhPU1RDQyBmcm9tIGZsYWdzCiAgbGludXg6IEFkZCBSdXN0
IHN1cHBvcnQKCiBsaW51eC9Db25maWcuaW4gICAgICAgICAgICAgICAgICAgICAgfCAgNiArKysr
KysKIGxpbnV4L2xpbnV4Lm1rICAgICAgICAgICAgICAgICAgICAgICB8IDE2ICsrKysrKysrKysr
KysrKy0KIHBhY2thZ2UvcnVzdC1iaW4vcnVzdC1iaW4uaGFzaCAgICAgICB8ICAyICsrCiBwYWNr
YWdlL3J1c3QtYmluL3J1c3QtYmluLm1rICAgICAgICAgfCAyMCArKysrKysrKysrKysrKysrKy0t
LQogcGFja2FnZS9ydXN0LWJpbmRnZW4vcnVzdC1iaW5kZ2VuLm1rIHwgIDIgKysKIHV0aWxzL3Vw
ZGF0ZS1ydXN0ICAgICAgICAgICAgICAgICAgICB8ICA5ICsrKysrKysrKwogNiBmaWxlcyBjaGFu
Z2VkLCA1MSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKLS0gCjIuNDMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
