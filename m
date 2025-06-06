Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3D1C5B549
	for <buildroot@archiver.kernel.org>; Fri,  6 Jun 2025 08:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 047A860854;
	Fri,  6 Jun 2025 08:02:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4Et3nVIwPlql; Fri,  6 Jun 2025 08:02:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37E8760852
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37E8760852;
	Fri,  6 Jun 2025 08:02:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E3D68D3
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 08:02:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4C2D60852
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 08:02:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vDwX4SguBCAQ for <buildroot@buildroot.org>;
 Fri,  6 Jun 2025 08:02:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EE0E160830
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE0E160830
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE0E160830
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 08:02:52 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6077d0b9bbeso410907a12.3
 for <buildroot@buildroot.org>; Fri, 06 Jun 2025 01:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749196971; x=1749801771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ljhq3MxKFoVSJYEDoZVUzCw8ApHTXIg6WmnJ41I16Ac=;
 b=pZzBzHqfhKt1Spwji71oF1+jq9zh61wETgPDHe5jRVuxW1XehykPh5/avjTjWPw79J
 eywCnm+D8Fcdd2UftYlcqH7tmDOOQ9CDtGoe0p7iYZAv/zEaW0aLkj9B7d3RgnOOPqPt
 ZPZgTOvGTTOFwjeVUK16l4G27msS+3m+wSwfqcYTsH9YTFO9lL2WnMYC9+GVKLNOHvq3
 PycZbeC9DJujf1KdJocNWyDzOZv2VZa9RdzRm48t1k2ZS8ErKx+9Ykg4+1tt0T7E6DIa
 RbvIs1PegiYNG0pZB1qYsm/FYhJIWYs3yASS8aXQk/fRnLX4iAhsIUitDccH99hsASjo
 48rg==
X-Gm-Message-State: AOJu0YwcbSSyh3XzsEz+iQNJiMAMXyDN0LeioP1a23ZeWv8WdF6dljz3
 1B3IhEMohlG+ZK78UBPddv/FC+/HwWSIl2hECJifcA3rihpBJ2MCVH+42VQe
X-Gm-Gg: ASbGncvJTBJp+nFr9sV6ovHEjVuTqdd3iEW54VOgZqCrM95vMG/mv/KUklGhFsDVpj9
 6TlqY2Q46NBeiQ1tweVzUOFoYu9SXKgck7Mac7zHPTUhX/hfTLnE2KsG7yfI9fI8z7z35PsVISb
 Rp2UGTv5BQfysOq72EMCq5XsjpStZ9dgszXTmahT2542orJwAm81o3/Mn4NuhevOu7bYRWHWi7X
 fYxNOLdU+Iup2FCphB/aej7MpMuSY5AT0mF0Hb27/jSXOFZV8J9BUXRKk5O5Y9hggF0LSVMqemd
 MGj7OuAll1otlyw4G/xTjTDxC5AJWvn5Wrkyv/IUzmCwXJu/Ng9IXQP2hFc1WUvoLM3Gdq4iE/O
 j
X-Google-Smtp-Source: AGHT+IFrWg/njBZ/kr7Lh9qUYyzhn0mekO6FN6aUBXDcyfHL3OQqkGeLMKHlb0x4WE8SgdMdymYx+w==
X-Received: by 2002:a05:6402:30a3:b0:607:77ed:6a47 with SMTP id
 4fb4d7f45d1cf-60777ed6a4dmr1511500a12.7.1749196970625; 
 Fri, 06 Jun 2025 01:02:50 -0700 (PDT)
Received: from devhost1.play.pl ([2a02:a319:a1e0:eb00:92eb:221f:6fb6:f3ab])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-607783de35bsm680023a12.67.2025.06.06.01.02.49
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 01:02:49 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Jun 2025 10:02:47 +0200
Message-ID: <20250606080248.129891-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250527171400.78560-1-shirokovalexs@gmail.com>
References: <20250527171400.78560-1-shirokovalexs@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749196971; x=1749801771; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ljhq3MxKFoVSJYEDoZVUzCw8ApHTXIg6WmnJ41I16Ac=;
 b=Iye10cRRVGmamfjGsgx98CnoWA/gJ4ec+WkZXYwWdbAroa4YqTSqQGoYs8YpDQQo2c
 SIqseQk0n6/uUlFFaSg5JDMaESGYR19i/E/xrd7JuFHP9Devp9sYXU5QqUNWybpCR0hx
 vGkxgg18fo3mhI10qRW1NA2k23WSa5OI3WOKMuNXsugme++cu4SoXpnCRyMjDrZKAyUb
 SIjAlC9dS6dTeSAPlCwmmbE8oO/z5QXlmBbasMNso+f8O1V69IvKBVhT4KJSXKDjPXAm
 gNzHg+xXEYKOA3sdC/R68hhYn2TTwH/cKJDfFZqmHMGnfbBCgXBNzxLuSZOsp+TdTrje
 2RoQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Iye10cRR
Subject: [Buildroot] [next,v5,1/3] package/uutils-coreutils: new package
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

VGhlIGNoYW5nZXMgd2VyZSB2YWxpZGF0ZWQgb24gUUVNVSwgUmFzcGJlcnJ5IFBpIDMgQiwgYW5k
IE9yYW5nZSBQaSBaZXJvIDJXCnBsYXRmb3Jtcywgd2l0aCBib3RoIG11bHRpY2FsbCBhbmQgbm9u
LW11bHRpY2FsbCBjb25maWd1cmF0aW9ucy4gSW4gZ2VuZXJhbCwgdGhlCmJpbmFyaWVzIGZ1bmN0
aW9uZWQgY29ycmVjdGx5IGFjcm9zcyBhbGwgdGFyZ2V0cy4KCk5vbi1tdWx0aWNhbGwgaW1hZ2Vz
IHJlc3VsdGVkIGluIGxhcmdlciBmaWxlIHNpemVzLiBGb3IgZXhhbXBsZSwgdGhlIFFFTVUKbXVs
dGljYWxsIGltYWdlIHdhcyBhcHByb3hpbWF0ZWx5IDE04oCvTUIsIHdoaWxlIGl0cyBub24tbXVs
dGljYWxsIGNvdW50ZXJwYXJ0CnJlYWNoZWQgNDPigK9NQi4KCk9uIG9uZSBoYW5kLCB0aGUgbGFy
Z2VyIGltYWdlIHNpemVzIHdlcmUgZXhwZWN0ZWQg4oCUIG1hbnkgc3RhbmRhbG9uZSBiaW5hcmll
cwpuYXR1cmFsbHkgY29uc3VtZSBtb3JlIHNwYWNlLiBPbiB0aGUgb3RoZXIgaGFuZCwgdGhlIGV4
dGVudCBvZiB0aGUgaW5jcmVhc2Ugd2FzCihhdCBsZWFzdCBmb3IgbWUpIGEgYml0IHVuZXhwZWN0
ZWQuCgpUbyBidWlsZCB1dXRpbHMvY29yZXV0aWxzLXNwZWNpZmljIGNoYW5nZXMgYW5kIHNoYXJl
IHRlc3QgaW1hZ2VzIFsxXSwgSSBjcmVhdGVkCmEgR2l0TGFiIHJlcG9zaXRvcnkgWzJdLiBGZWVs
IGZyZWUgdG8gY2hlY2sgdGhlIHJlcG9zaXRvcnkgZm9yIG1vcmUgaW5mb3JtYXRpb24KYW5kIGlt
YWdlcy4KClRoYW5rIHlvdQoKTGlua3M6ClsxXSAtIGh0dHBzOi8vZ2l0bGFiLmNvbS9hbGV4cy1z
aC91dXRpbHMtY29yZXV0aWxzLXRlc3Rlci8tL3JlbGVhc2VzClsyXSAtIGh0dHBzOi8vZ2l0bGFi
LmNvbS9hbGV4cy1zaC91dXRpbHMtY29yZXV0aWxzLXRlc3RlcgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2J1aWxkcm9vdAo=
