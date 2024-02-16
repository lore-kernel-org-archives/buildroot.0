Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FDBC48BF3
	for <buildroot@archiver.kernel.org>; Fri, 16 Feb 2024 21:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B65341A04;
	Fri, 16 Feb 2024 21:15:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CK7Ul_0to64T; Fri, 16 Feb 2024 21:15:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54A464220C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54A464220C;
	Fri, 16 Feb 2024 21:15:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 076391BF287
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 21:15:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E55AF41CB0
 for <buildroot@lists.busybox.net>; Fri, 16 Feb 2024 21:15:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AFIo6Z-0BVf6 for <buildroot@lists.busybox.net>;
 Fri, 16 Feb 2024 21:15:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DC11F41CCF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC11F41CCF
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC11F41CCF
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 21:15:20 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41242d2f73cso7313945e9.0
 for <buildroot@buildroot.org>; Fri, 16 Feb 2024 13:15:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708118119; x=1708722919;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z5SOQq5qJjCQ1q0eI1q6JtYV7SsDEeivqVMANdjFHPA=;
 b=NVhJ6v/LI7/S0B2PyEf6+Ly5hXi5YsxYpud0dSW4gM5J+TyPTO/3FjegRkOHcBZGn4
 gbdZFrGGMu6CYYKNSDUZi9MkiVja9AAMESEAhhKDxk5Km6BpmnpkgVnNHP+axDtD3GNT
 XI9Ly77T5x+by9x/apJ3h/d7ExClzChgds4L5gARqbzsUDoywNlbWBXuEl1eNbpF5o92
 MftNNMMyIlV47rNZs4LI+fHDTlVl5CuSnijN1b3ZPht+fj58F/OJ02EB6nTiCmHd17yF
 5HrlDBak6DVSK1D8jA3HjLOocArHTqfGGpDRtICopP3Ur9DgMEXe17ZzENaGQKNwXGOM
 QehA==
X-Gm-Message-State: AOJu0YyVFrvxqAOdGVAzX/RQ662ONIP2PURJGqwz/ywVd+uFr1zvUpbM
 n6notG42jVU+jOOSbl8aNRKhOfOCm2hz1PRsK7kEH3rDxraE40QkdK3kmaJuXTF9CDotaike++3
 1xYE=
X-Google-Smtp-Source: AGHT+IE35xA+qaWuoQDg0FPZiYUmPYO5g7ALgYj1yE6llPCVte8UYug3ocG0YZaF2DXoI3id9e2wdA==
X-Received: by 2002:a5d:64a3:0:b0:33d:2226:a26b with SMTP id
 m3-20020a5d64a3000000b0033d2226a26bmr2122582wrp.24.1708118118863; 
 Fri, 16 Feb 2024 13:15:18 -0800 (PST)
Received: from junian.fritz.box (94.105.103.7.dyn.edpnet.net. [94.105.103.7])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a05600c444b00b00410d7e55e5asm3451234wmn.3.2024.02.16.13.15.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Feb 2024 13:15:18 -0800 (PST)
To: buildroot@buildroot.org
Date: Fri, 16 Feb 2024 22:13:40 +0100
Message-Id: <20240216211344.1807353-3-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240216211344.1807353-1-raphael.melotte@mind.be>
References: <20240216211344.1807353-1-raphael.melotte@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1708118119; x=1708722919; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z5SOQq5qJjCQ1q0eI1q6JtYV7SsDEeivqVMANdjFHPA=;
 b=Wh6PhLCVV3RFrQcvvM6pFWlx197/OkmPmagO0XcCMRRVzBCd9CKjqgUpFtUvG2myW0
 8bFyLHT7y8Ihm+LtF3674fU9n/CCcbyARKjaxx6av+clI7AHxKmY2nq1jUTTaay4VywL
 SeAamXjymy48L/qb1GYjXrrX8AbXGEbVLeWp6dDgixMcBgFh+rCiMbSRJOo/w4R4HXIF
 YXLNPhmNjtOcP/AT4XMbC3yY6i8bnOQDnywxsKRkCONlg3X0ktgrAtkbUJX9bgQaKUzk
 rRaMC8FH0UGcLO2cmTfBPRrlD7zs2pereLcqu5aaF4f+zdU+ZngqOKw37TV9kyxwWWhY
 K/Dg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Wh6PhLCV
Subject: [Buildroot] [PATCH 2/5] support/testing: add new test for
 python-pymupdf
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Cc: james.hilliard1@gmail.com,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VG8gZ2l2ZSB1cyBhIGNoYW5jZSB0byBjYXRjaCBydW50aW1lIGlzc3VlcyAoc3VjaCBhcyBtaXNz
aW5nCmRlcGVuZGVuY2llcykgbW9yZSBlYXNpbHksIGFkZCBhIHRlc3QgdGhhdCB3cml0ZXMgYSBz
YW1wbGUgUERGIGZpbGUsCnJlYWQgaXQgYmFjayBhbmQgdmVyaWZ5IHRoZSB0ZXh0IHRoYXQgd2Fz
IHJlYWQuCgpMaWtlIHNpbWlsYXIgcGFja2FnZXMgdGhhdCBsZWFkIHRvIGEgYmlnCnJvb3RmcyAo
ZS5nLiBweXRob24tYm90b2NvcmUpLCB0aGlzIHRlc3QgcmVxdWlyZXMgYSBzZXBhcmF0ZSBleHQy
CnJvb3RmcyB0byBhdm9pZCBmaWxsaW5nIHRoZSBkZWZhdWx0IGFtb3VudCBvZiBSQU0gYXZhaWxh
YmxlCmVudGlyZWx5ICh3aGljaCB3b3VsZCBjYXVzZSBtaXNzaW5nIGZpbGVzIGZyb20gdGhlIHJv
b3QgZmlsZXN5c3RlbSBhbmQKaW4gdHVybiwgdGVzdCBmYWlsdXJlcykuCgpTaWduZWQtb2ZmLWJ5
OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+Ci0tLQogREVWRUxP
UEVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKysKIC4uLi90ZXN0
cy9wYWNrYWdlL3NhbXBsZV9weXRob25fcHltdXBkZi5weSAgICB8IDE3ICsrKysrKysrKysrKwog
Li4uL3Rlc3RzL3BhY2thZ2UvdGVzdF9weXRob25fcHltdXBkZi5weSAgICAgIHwgMjYgKysrKysr
KysrKysrKysrKysrKwogMyBmaWxlcyBjaGFuZ2VkLCA0NSBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9w
eW11cGRmLnB5CiBjcmVhdGUgbW9kZSAxMDA2NDQgc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2th
Z2UvdGVzdF9weXRob25fcHltdXBkZi5weQoKZGlmZiAtLWdpdCBhL0RFVkVMT1BFUlMgYi9ERVZF
TE9QRVJTCmluZGV4IDFjNmM4NGIwNWIuLjA4NWYyZmEyMzQgMTAwNjQ0Ci0tLSBhL0RFVkVMT1BF
UlMKKysrIGIvREVWRUxPUEVSUwpAQCAtMjU5OSw5ICsyNTk5LDExIEBAIEY6CXBhY2thZ2UvcHl0
aG9uLXB5bXVwZGYvCiBGOglwYWNrYWdlL3B5dGhvbi1yc2EvCiBGOglwYWNrYWdlL3B5dGhvbi1z
M3RyYW5zZmVyLwogRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhv
bl9qbWVzcGF0aC5weQorRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5
dGhvbl9weW11cGRmLnB5CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS9zYW1wbGVf
cHl0aG9uX3JzYS5weQogRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5
dGhvbl9zM3RyYW5zZmVyLnB5CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0
X3B5dGhvbl9qbWVzcGF0aC5weQorRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVz
dF9weXRob25fcHltdXBkZi5weQogRjoJc3VwcG9ydC90ZXN0aW5nL3Rlc3RzL3BhY2thZ2UvdGVz
dF9weXRob25fcnNhLnB5CiBGOglzdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5
dGhvbl9zM3RyYW5zZmVyLnB5CiAKZGlmZiAtLWdpdCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3NhbXBsZV9weXRob25fcHltdXBkZi5weSBiL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9w
YWNrYWdlL3NhbXBsZV9weXRob25fcHltdXBkZi5weQpuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRl
eCAwMDAwMDAwMDAwLi41NzRiZDI3OTY1Ci0tLSAvZGV2L251bGwKKysrIGIvc3VwcG9ydC90ZXN0
aW5nL3Rlc3RzL3BhY2thZ2Uvc2FtcGxlX3B5dGhvbl9weW11cGRmLnB5CkBAIC0wLDAgKzEsMTcg
QEAKK2ltcG9ydCBmaXR6CisKKyMgV3JpdGUgYSB0ZXN0IFBERiBmaWxlCitvdXRmaWxlID0gInB5
dGhvbi1weW11cGRmLnBkZiIKK3NhbXBsZV90ZXh0ID0gIlRoaXMgaXMgYSB0ZXN0IHBhZ2UgZm9y
IHB5dGhvbi1weW11cGRmLiIKK2RvYyA9IGZpdHoub3BlbigpCitwYWdlID0gZG9jLm5ld19wYWdl
KCkKK3AgPSBmaXR6LlBvaW50KDUwLCA3MikKK3BhZ2UuaW5zZXJ0X3RleHQocCwgc2FtcGxlX3Rl
eHQpCitkb2Muc2F2ZShvdXRmaWxlKQorCisjIFJlYWQgYmFjayB0aGUgZmlsZQord2l0aCBmaXR6
Lm9wZW4ob3V0ZmlsZSkgYXMgZDogICMgb3BlbiBkb2N1bWVudAorICAgIHJlYWRfdGV4dCA9IGNo
cigxMikuam9pbihbcGFnZS5nZXRfdGV4dCgpIGZvciBwYWdlIGluIGRdKQorCitwcmludChyZWFk
X3RleHQpCithc3NlcnQocmVhZF90ZXh0ID09IHNhbXBsZV90ZXh0ICsgIlxuIikKZGlmZiAtLWdp
dCBhL3N1cHBvcnQvdGVzdGluZy90ZXN0cy9wYWNrYWdlL3Rlc3RfcHl0aG9uX3B5bXVwZGYucHkg
Yi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9weW11cGRmLnB5Cm5l
dyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAuLjVlOWQ1YTY5MTIKLS0tIC9kZXYv
bnVsbAorKysgYi9zdXBwb3J0L3Rlc3RpbmcvdGVzdHMvcGFja2FnZS90ZXN0X3B5dGhvbl9weW11
cGRmLnB5CkBAIC0wLDAgKzEsMjYgQEAKK2ltcG9ydCBvcworZnJvbSB0ZXN0cy5wYWNrYWdlLnRl
c3RfcHl0aG9uIGltcG9ydCBUZXN0UHl0aG9uUGFja2FnZUJhc2UKKworCitjbGFzcyBUZXN0UHl0
aG9uUHkzUHlNdVBERihUZXN0UHl0aG9uUGFja2FnZUJhc2UpOgorICAgIF9fdGVzdF9fID0gVHJ1
ZQorICAgIGNvbmZpZyA9IFRlc3RQeXRob25QYWNrYWdlQmFzZS5jb25maWcgKyBcCisgICAgICAg
ICIiIgorICAgICAgICBCUjJfUEFDS0FHRV9QWVRIT04zPXkKKyAgICAgICAgQlIyX1BBQ0tBR0Vf
UFlUSE9OX1BZTVVQREY9eQorICAgICAgICBCUjJfUEFDS0FHRV9YT1JHNz15CisgICAgICAgIEJS
Ml9VU0VfV0NIQVI9eQorICAgICAgICBCUjJfSU5TVEFMTF9MSUJTVERDUFA9eQorICAgICAgICBC
UjJfVEFSR0VUX1JPT1RGU19FWFQyPXkKKyAgICAgICAgQlIyX1RBUkdFVF9ST09URlNfRVhUMl9T
SVpFPSIyNTBNIgorICAgICAgICAiIiIKKyAgICBzYW1wbGVfc2NyaXB0cyA9IFsidGVzdHMvcGFj
a2FnZS9zYW1wbGVfcHl0aG9uX3B5bXVwZGYucHkiXQorICAgIHRpbWVvdXQgPSAzMAorCisgICAg
ZGVmIGxvZ2luKHNlbGYpOgorICAgICAgICBleHQyX2ZpbGUgPSBvcy5wYXRoLmpvaW4oc2VsZi5i
dWlsZGRpciwgImltYWdlcyIsICJyb290ZnMuZXh0MiIpCisgICAgICAgIHNlbGYuZW11bGF0b3Iu
Ym9vdChhcmNoPSJhcm12NSIsCisgICAgICAgICAgICAgICAgICAgICAgICAgICBrZXJuZWw9ImJ1
aWx0aW4iLAorICAgICAgICAgICAgICAgICAgICAgICAgICAgb3B0aW9ucz1bIi1kcml2ZSIsICJm
aWxlPSVzLGlmPXNjc2ksZm9ybWF0PXJhdyIgJSBleHQyX2ZpbGVdLAorICAgICAgICAgICAgICAg
ICAgICAgICAgICAga2VybmVsX2NtZGxpbmU9WyJyb290d2FpdCIsICJyb290PS9kZXYvc2RhIl0p
CisgICAgICAgIHNlbGYuZW11bGF0b3IubG9naW4oKQotLSAKMi4zNy4zCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0
CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWls
bWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
