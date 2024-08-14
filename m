Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E598C3DA4A
	for <buildroot@archiver.kernel.org>; Wed, 14 Aug 2024 11:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4952C812E4;
	Wed, 14 Aug 2024 11:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ywm00jjUbuto; Wed, 14 Aug 2024 11:18:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A163812E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A163812E9;
	Wed, 14 Aug 2024 11:18:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D1ECB1BF616
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 11:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BF514605FC
 for <buildroot@lists.busybox.net>; Wed, 14 Aug 2024 11:18:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G0GcNew00piT for <buildroot@lists.busybox.net>;
 Wed, 14 Aug 2024 11:18:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=gael.portay@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EB07F605E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB07F605E6
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EB07F605E6
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 11:18:35 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-428101fa30aso48339955e9.3
 for <buildroot@buildroot.org>; Wed, 14 Aug 2024 04:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723634313; x=1724239113;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=38k0Kp6c9KTAe36SZuq44dOILOOC2ZhGcI4uBTI7BTM=;
 b=uiAm+/pu9hCv9EMTLq31YgL1lyAJiM3qcMi2rnmkjnVah7mdXtVxBoQA+CGdfx7MaG
 KmfUwpCqUN153XGgCc9HtJBjc+3dPps+iKQw2xDGnw+mIIc/3tKylZCecd4T+fRb4izE
 gtQWqVMYqJt2rk2FQK8MWFoz6uDXCY3EY3Dwbfh5/CGxE6t9kgFaCJ/9UXec0FsK07fM
 f5MeWMza2TeH58vtYQvTsSOY73RV/AcVYbDftG4rPWU1sU9yFpo5b2Lfwndz7/sykfyp
 UgmudAfnLtB8Ps+s8PWXXj78KtNOQM018Kr8uHjMSs+tTR7aYXEo0ad2H99tMPvQEUJL
 eZwg==
X-Gm-Message-State: AOJu0Yzs8BuipHm//BXmIrxR00BQIGsSUlj4eeBU0QN0Q3l6GwbZPMlt
 wQ5UVCIas8Euyr71lSQrYGPQjYCb8AJ+8z8rtSlRn9TVqIN0d8jC1+FYkRkCxUY=
X-Google-Smtp-Source: AGHT+IFMKGRR45TvTuB+JscKVJaSeYjSnfVtW29ePINkumJS6IDPAAGlQWbmDEhakfsjGTbFtKgUGQ==
X-Received: by 2002:a05:600c:4ecb:b0:426:60b8:d8ba with SMTP id
 5b1f17b1804b1-429dd260365mr17143175e9.28.1723634312702; 
 Wed, 14 Aug 2024 04:18:32 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:ce:f2f0:3a7c:76ff:fe01:6f05])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429ded4db0bsm16893435e9.32.2024.08.14.04.18.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Aug 2024 04:18:32 -0700 (PDT)
From: "=?UTF-8?q?Ga=C3=ABl=20PORTAY?=" <gael.portay@gmail.com>
X-Google-Original-From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>
To: buildroot@buildroot.org
Date: Wed, 14 Aug 2024 13:18:21 +0200
Message-ID: <20240814111821.399174-1-gael.portay@rtone.fr>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723634313; x=1724239113; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=38k0Kp6c9KTAe36SZuq44dOILOOC2ZhGcI4uBTI7BTM=;
 b=jgvGOlenYaKRNkyyo1JcMDHcv6f/K2j0jJeK4Ddmr01Ha2UCJFF0kglqPuEXVFNG0O
 hjSeJNpu3cr3AjngN3XdlojwK7WKa2E5I0J/HV6oyISzL+DZL+pEwTeO/TQqcjmZReLK
 y+rbSJAVmFziD2G29OUeUBIJ0WSnbIEYMI3FvZhh2jpnvaBhus3wjFC4EW8tdw5etGjS
 yzRSrJCDcljcmUPLPVkLudHkPZPErkwxadIvvlTpYBAlMvzMCJdPoR43HsmaIf3X7rhi
 l2DDOAf2kRDMO79m98kPtjADxcToPSUVRA0rPWpNS8X5BZDejXHFwgrLYNcw+2u/L8x0
 uJhw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=jgvGOlen
Subject: [Buildroot] [PATCH 1/1] package/qt6tools: fix missing host-qt6base
 dependency
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@rtone.fr>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhpcyBhZGRzIHRoZSBob3N0IGRlcGVuZGVuY3kgaG9zdC1xdDZiYXNlIGFzIGhvc3QtcXQ2dG9v
bHMgcmVxdWlyZXMgdGhlClF0IGNtYWtlIG1vZHVsZXMgdG8gYmUgaW5zdGFsbGVkLgoKRml4ZXM6
CgoJJCBtYWtlIHF0NnRvb2xzCgkoLi4uKQoJQ01ha2UgRXJyb3IgYXQgQ01ha2VMaXN0cy50eHQ6
MjEgKGZpbmRfcGFja2FnZSk6CgkgIENvdWxkIG5vdCBmaW5kIGEgcGFja2FnZSBjb25maWd1cmF0
aW9uIGZpbGUgcHJvdmlkZWQgYnkgIlF0NiIgKHJlcXVlc3RlZAoJICB2ZXJzaW9uIDYuNy4yKSB3
aXRoIGFueSBvZiB0aGUgZm9sbG93aW5nIG5hbWVzOgoKCSAgICBRdDZDb25maWcuY21ha2UKCSAg
ICBxdDYtY29uZmlnLmNtYWtlCgoJICBBZGQgdGhlIGluc3RhbGxhdGlvbiBwcmVmaXggb2YgIlF0
NiIgdG8gQ01BS0VfUFJFRklYX1BBVEggb3Igc2V0ICJRdDZfRElSIgoJICB0byBhIGRpcmVjdG9y
eSBjb250YWluaW5nIG9uZSBvZiB0aGUgYWJvdmUgZmlsZXMuICBJZiAiUXQ2IiBwcm92aWRlcyBh
CgkgIHNlcGFyYXRlIGRldmVsb3BtZW50IHBhY2thZ2Ugb3IgU0RLLCBiZSBzdXJlIGl0IGhhcyBi
ZWVuIGluc3RhbGxlZC4KClNpZ25lZC1vZmYtYnk6IEdhw6tsIFBPUlRBWSA8Z2FlbC5wb3J0YXlA
cnRvbmUuZnI+Ci0tLQpEZWFyIE1haW50YWluZXJzLAoKSSBhbSB0cnlpbmcgdG8gY3JlYXRlIGFu
ZCBidWlsZCB0aGUgcGFja2FnZSBRdDZXZWJFbmdpbmUuCgpUaGF0IHBhY2thZ2UgcmFpc2VzIGEg
d2FybmluZyB0byBidWlsZCB0aGUgV2lkZ2V0czsgaXQgcmVxdWlyZXMKaG9zdC1xdDZ0b29scyB3
aXRoIFF0IERlc2lnbmVyOgoKCUNNYWtlIFdhcm5pbmcgYXQgc3JjL3dlYmVuZ2luZXdpZGdldHMv
Q01ha2VMaXN0cy50eHQ6NyAobWVzc2FnZSk6CgkgIFF0IHRvb2xzIERlc2lnbmVyIGlzIHJlcXVp
cmVkIHRvIGNvbXBpbGUgZGVzaWduZXIgcGx1Z2luCgpJIHRyaWVkIHRvIHJ1biAkIG1ha2UgcXQ2
dG9vbHMgYW5kIGl0IGZhaWxzIHdpdGggZXJyb3IgaW4gdGhlIGNvbW1pdAptZXNzYWdlIGFib3Zl
IGJlY2F1c2Ugb2YgbWlzc2luZyBob3N0IGRlcGVuZGVuY3kuCgpUaGlzIGNoYW5nZSBjb3VsZCBi
ZSBhZGRyZXNzZWQgbm93LgoKTm90ZTogSXQgcmVxdWlyZXMgKHF0NmJhc2UpIFhNTCB0byBidWls
ZCBRdCBEZXNpZ25lcjsgdGhpcyBzaG91bGQgYmUKYWRkcmVzc2VkIGxhdGVyIEkgZ3Vlc3MuCgpS
ZWdhcmRzLApHYcOrbAogcGFja2FnZS9xdDYvcXQ2dG9vbHMvcXQ2dG9vbHMubWsgfCAyICsrCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvcGFja2FnZS9xdDYv
cXQ2dG9vbHMvcXQ2dG9vbHMubWsgYi9wYWNrYWdlL3F0Ni9xdDZ0b29scy9xdDZ0b29scy5tawpp
bmRleCBkOTk2Zjc1YjM0Li4wOWM5ODZjZmM2IDEwMDY0NAotLS0gYS9wYWNrYWdlL3F0Ni9xdDZ0
b29scy9xdDZ0b29scy5taworKysgYi9wYWNrYWdlL3F0Ni9xdDZ0b29scy9xdDZ0b29scy5tawpA
QCAtNDEsNSArNDEsNyBAQCBpZmVxICgkKEJSMl9QQUNLQUdFX1FUNkRFQ0xBUkFUSVZFKSx5KQog
UVQ2VE9PTFNfREVQRU5ERU5DSUVTICs9IHF0NmRlY2xhcmF0aXZlCiBlbmRpZgogCitIT1NUX1FU
NlRPT0xTX0RFUEVOREVOQ0lFUyA9IGhvc3QtcXQ2YmFzZQorCiAkKGV2YWwgJChjbWFrZS1wYWNr
YWdlKSkKICQoZXZhbCAkKGhvc3QtY21ha2UtcGFja2FnZSkpCi0tIAoyLjQ2LjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
