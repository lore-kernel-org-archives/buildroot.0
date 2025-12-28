Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAADD3B7E5
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 18:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA6AF4062D;
	Sun, 28 Dec 2025 18:56:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ika4WeeaumPj; Sun, 28 Dec 2025 18:56:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B51084062F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766948213;
	bh=q0tm3ipErEiL+q6vkUji4GQAB7YrYn+4kmMPB6QJOww=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YMAiMS3XcaSd4LlfBF6nePKkNmMyZBrepIInLpwwGzioJ3URg7DJNTzR6Yk4FFar1
	 2h6kBzrW27RG5r/NBGlu4RNt48e4spb9MostdAOmGgrCYdhEAC8tnOMlctKaf9kwMc
	 mFQRGOo3dbT8mpK5D55oT8Fib5j7dd5PV0PtkcIVBJBQdSB2xpEB4J2hVVam3tXOVd
	 y5dN5WEqpvU3qPgTultwGgtJQ97W+H0b4IEfThSVchTiMF5KFoyPLUkm+woV1p7grB
	 /7WSK2UZcVdOWf1SU8i11qmzw0ibdoCwQEdDZPpiHa4wdgbb0XzO6Wtu4RZTAh62DL
	 eZjmSIMkg/llQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B51084062F;
	Sun, 28 Dec 2025 18:56:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F3EBB9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 814A280C1D
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PnvnVPUyw4rp for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 18:56:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7FED280BF7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FED280BF7
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FED280BF7
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 18:56:45 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so89467215e9.2
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 10:56:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766948203; x=1767553003;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+eIJTqbWfyAqt5tkrKi5moSfxc1SyhGhHjU+B0u9xw0=;
 b=qS+eeDxG8O/9qvm8PaZeupsFLCd6dfrLRl8RdzWcQGFviHBy55GxvanxjW+o+4Zomj
 pMNaQC6S85/5POR74mkYBycWd7Q0Xs86LZbIqosbsLazxUBNMpRx9hpDGSvANfrh3AoI
 aWIxjjIFUaRn3UgxU4hiWlVidMgwDBvUmcayD9u4Oia5lYnQtwrm4OWLfomh/fRcypQk
 rsC2ski1LGZv8AmmZofuQG0gGNbWlwzrAsWAHxLLBv3AKF6W/Vw94SkxWtmXaDseXeB2
 oQzgpFTIA3rnAvv5L2wFKTnvkCALBtxf8iukdgOoP9HGQdbBSg7byXl3V9WlkhO7GZPs
 j3QQ==
X-Gm-Message-State: AOJu0YwiBpo1XMkYamQzCvPpTCbln//oL8IfkgGgF+RyCgqYG/jkSYer
 W/n8Tt5gF7sIqgZN0Z0AzL45Iiacs3QIzhoTuZFEyBmOO+F9UlSBzOpNFo5dNqu6Agc64ASz7Yy
 fiw29010=
X-Gm-Gg: AY/fxX5CuQKDo6y/4tMTgEdTYki9xlII/xNR3vmadas2HFa5g3yfu0aFQ+8glbmHdqQ
 UnRsYVqZkhpzKwOca+YK7TNWFsmRfxVfuXBniOiYRolVh5OkAbNB7xE+D7w7OpoSHJ1pVX2SzCg
 /+JH+92+X82TdUrcvRVLS/U95JrHpzs1Bb2WuC34vW6mm6J//FefBSaeOAhFlu/g2i5As4wDbgt
 LPoS8GBK6eyd0oZQ7oksl0nmX2FRuZAftrPEYPSfJBe4ot45HoDrk63lyUhidAK0GzWMLJruQzZ
 aw2v9T5uCNwp7QPsMsToc7pLafB27bWsLs4vwXWydow1KbA31n7UchB34aU17dGtzJo99HUHmS9
 B9tekciJbgANRz7ZTSt9bTkt7UjcMdIS1oWdzfpFxS3xoa8wEN/sdAAfffc/YTCbuR5HQLpCu3G
 SPeX6y6xJKWuYjSPkGL/VMcKiPu2PJc3ZQdfkr666HgtJup2o7XeiVlNbUokIB0VHV7Y3BsuiWj
 tD/UgrZHaA=
X-Google-Smtp-Source: AGHT+IGFtkbgCc0kcpYxjRBvKdc7awVD8wW2aRCFHdvDfV+oL3O8CEHsHnEbXYxeChtTsMnRrnSZuQ==
X-Received: by 2002:a05:6000:2888:b0:430:ff81:296c with SMTP id
 ffacd0b85a97d-4324e506153mr25911654f8f.34.1766948203354; 
 Sun, 28 Dec 2025 10:56:43 -0800 (PST)
Received: from mindpad (2a01cb0c0115730072a6ccfffe7dafc3.ipv6.abo.wanadoo.fr.
 [2a01:cb0c:115:7300:72a6:ccff:fe7d:afc3])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43277b82a58sm24426954f8f.6.2025.12.28.10.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 10:56:42 -0800 (PST)
To: buildroot@buildroot.org
Cc: Aleksandr Makarov <aleksandr.o.makarov@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Grzegorz Blach <grzegorz@blach.pl>, Karoly Kasza <kaszak@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Dec 2025 19:56:32 +0100
Message-ID: <20251228185637.58072-7-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251228185637.58072-1-thomas.perale@mind.be>
References: <20251228185637.58072-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1766948203; x=1767553003; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+eIJTqbWfyAqt5tkrKi5moSfxc1SyhGhHjU+B0u9xw0=;
 b=YYRXVSPLorTCyK4qRfwnEptkkbNfmiEPhdGgznVHmT+Zr7R0IY+zrXT+ARq8HwPIov
 k7f7cCRRlCPUK5KetrTIXQv8yrA0jQmAeaF5K3NNYhIoKTIFMreXN4/Z5hQRU4oOdjVQ
 9uPMhXY3/rD/ht1NcodeBx7midOWwFkBlGw7aEO0x6oh/S7hTtbgyhvDnJqdigZoa5ut
 qEUdmqNQz4mnARp8hb/1S7AgL79IZirMdgXed5RDylKte3XFXk7ydsEpj07t1YUfBEgc
 pcSM+DfpRpr40q3nSv/PttJssy2n9tdfB7Ft3kHPsUby3/+vt57XBzQP2GUrOk5m7jVx
 hVJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YYRXVSPL
Subject: [Buildroot] [PATCH 07/10] package/jbig2dec: add CVE trailer in patch
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

U2luY2UgQnVpbGRyb290IGNvbW1pdCBbMV0gdGhlIHBhdGNoZXMgdGhhdCBmaXhlcyBhIHNlY3Vy
aXR5CnZ1bG5lcmFiaWxpdHkgbmVlZHMgdG8gcmVmZXJlbmNlIHRoZSBmaXhlZCB2dWxuZXJhYmls
aXR5LgoKVGhpcyBwYXRjaCBhZGRzIHRoZSByZWxldmFudCBpbmZvcm1hdGlvbiB0byB0aGUgcGF0
Y2ggaGVhZGVyLgoKWzFdIDExNjdkMGZmM2QgZG9jcy9tYW51YWw6IG1lbnRpb24gQ1ZFIHRyYWls
ZXIKClNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXJhbGUgPHRob21hcy5wZXJhbGVAbWluZC5iZT4K
LS0tCiAuLi4wMS1CdWctNzA1MDQxLWpiaWcyZGVjLUF2b2lkLXVuaW5pdGlhbGl6ZWQtYWxsb2Nh
dG9yLWluLnBhdGNoIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYg
LS1naXQgYS9wYWNrYWdlL2piaWcyZGVjLzAwMDEtQnVnLTcwNTA0MS1qYmlnMmRlYy1Bdm9pZC11
bmluaXRpYWxpemVkLWFsbG9jYXRvci1pbi5wYXRjaCBiL3BhY2thZ2UvamJpZzJkZWMvMDAwMS1C
dWctNzA1MDQxLWpiaWcyZGVjLUF2b2lkLXVuaW5pdGlhbGl6ZWQtYWxsb2NhdG9yLWluLnBhdGNo
CmluZGV4IDgzMzFkNWYyYTQuLmRkOTZjNDVlYmQgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvamJpZzJk
ZWMvMDAwMS1CdWctNzA1MDQxLWpiaWcyZGVjLUF2b2lkLXVuaW5pdGlhbGl6ZWQtYWxsb2NhdG9y
LWluLnBhdGNoCisrKyBiL3BhY2thZ2UvamJpZzJkZWMvMDAwMS1CdWctNzA1MDQxLWpiaWcyZGVj
LUF2b2lkLXVuaW5pdGlhbGl6ZWQtYWxsb2NhdG9yLWluLnBhdGNoCkBAIC00LDYgKzQsNyBAQCBE
YXRlOiBTdW4sIDUgTm92IDIwMjMgMTI6MjE6NTIgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gQnVn
IDcwNTA0MTogamJpZzJkZWM6IEF2b2lkIHVuaW5pdGlhbGl6ZWQgYWxsb2NhdG9yIGluCiAgY29t
bWFuZC1saW5lIHRvb2wuCiAKK0NWRTogQ1ZFLTIwMjMtNDYzNjEKIFVwc3RyZWFtOiBodHRwczov
L2dpdGh1Yi5jb20vQXJ0aWZleFNvZnR3YXJlL2piaWcyZGVjL2NvbW1pdC9lZTUzYTdlNGJjNzgx
OWQzMmU4YzBiMjA1Nzg4NWJjYzk3NTg2YmYzCiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6ls
b3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+CiAtLS0KLS0gCjIuNTIuMAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
