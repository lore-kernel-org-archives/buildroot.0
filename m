Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4A36C433F5
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 18:14:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5DBC661101
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 18:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5DBC661101
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A6B08196E;
	Sat,  6 Nov 2021 18:14:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TGXelrLDA7Yf; Sat,  6 Nov 2021 18:14:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9587681947;
	Sat,  6 Nov 2021 18:14:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 577211BF350
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 18:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46EA14020F
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 18:14:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5uPDCDQldmoc for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 18:14:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8BDCE401F2
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 18:14:29 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id s13so19068428wrb.3
 for <buildroot@buildroot.org>; Sat, 06 Nov 2021 11:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OZX6JY04St0suIsrHizkLKcQ9xmIsMUPAkrrCfu1yOA=;
 b=T67YYZQlq6MKcn3ByYc+mobHdBJ9dmx1WllLEaY0hKajipSx61Fj7REDkP36wViJgT
 QsVjiCDQxDsCyyloDq2isSrj6kb6l06MEzRJ3sgumH5vVkisJfBycpR9PZyKLKMWVaR7
 +D7rqcNISivQ6h+70ZkWhSFQrANSyAlc0u1nmIcBJ4EzMSy4BwSJUfdX3wQs3xWxuwVn
 QCnisN/A2wAA/ffugmCbU9mWdCQOI1CV4A2v8WoxiwfSFV5JlXcJfLtHnKlVNG7A3Kpq
 mZdfQpZod7CXtR8G6DJXRLu6lPStJD27nYwnEny0yztVgDZP/3z5bpztO4kMJ0ZLXC3s
 REqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OZX6JY04St0suIsrHizkLKcQ9xmIsMUPAkrrCfu1yOA=;
 b=1CKanZVm3jY5Hd4ktDD8DemerWWUNdU/iObl1PcE9HYoCsf62rXwE+SU0Xtt6qo/pP
 fDqQqQTp9NebJpUNSFvk0GeeugZXIMxU/wyOTOfM/5b3dMYa7b+4dyVxSCRIirOKYCLu
 erFt6/2VmVd3znrAmb3imyW9h3oloT/bpXBB1JBJp6+CyCTKf9aayggx0WyrgL5DqyOw
 a1lWklQF/+IGYRSJGrD2wv8nB4RMrJijk8P3C6QWLkH5fYE87wF3qP2aUSALZKC8FEhU
 FmAwboKzMqv8Xc9VKs6HIrOxPHT/a7QF60oo8f+O+OTU9hZXwQUANb+kDdsN/tyd1jDa
 2Ueg==
X-Gm-Message-State: AOAM531CjBRWjP2UMLNhnjOrljSSg6pZyRwfoPAMm1Kq/a5+kkInB9y3
 e1k6DxoUseQMsLnLvzFxHIy7kG+4inE=
X-Google-Smtp-Source: ABdhPJxWB15qO7jqI27ccfNihPvfX2v3Z+Uhx8oiRP1lwjd8PuLx0TuR3HCYrtogcAVoV/zo8RsXWg==
X-Received: by 2002:adf:f787:: with SMTP id q7mr64977116wrp.1.1636222467260;
 Sat, 06 Nov 2021 11:14:27 -0700 (PDT)
Received: from Clement-Blade14.home
 (2a01cb0003ba9b00ba9c69ad80a62dfa.ipv6.abo.wanadoo.fr.
 [2a01:cb00:3ba:9b00:ba9c:69ad:80a6:2dfa])
 by smtp.gmail.com with ESMTPSA id u15sm7423986wmq.13.2021.11.06.11.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Nov 2021 11:14:26 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Nov 2021 19:14:23 +0100
Message-Id: <20211106181424.299041-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] configs/beelink_gs1: increase rootfs size
 to 120M
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
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Rm9yIHRoZSBtb21lbnQgQmVlbGluayBHUzEgdXNlIGEgZGVmYXVsdCByb290ZnMgc2l6ZSBvZiA2
ME0Kd2hpY2ggbWFrZSBzb21ldGltZXMgdGhlIGJ1aWxkIGZhaWxlZCBkdWUgdG8gbWlzc2luZyBz
cGFjZS4KCkluY3JlYXNlIHRoZSByb290ZnMgc2l6ZSB0byAxMjBNLgoKU2lnbmVkLW9mZi1ieTog
Q2zDqW1lbnQgUMOpcm9uIDxwZXJvbi5jbGVtQGdtYWlsLmNvbT4KLS0tCiBjb25maWdzL2JlZWxp
bmtfZ3MxX2RlZmNvbmZpZyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpk
aWZmIC0tZ2l0IGEvY29uZmlncy9iZWVsaW5rX2dzMV9kZWZjb25maWcgYi9jb25maWdzL2JlZWxp
bmtfZ3MxX2RlZmNvbmZpZwppbmRleCBlODhmM2UzYjY5Li4xODcyYWFiZGYwIDEwMDY0NAotLS0g
YS9jb25maWdzL2JlZWxpbmtfZ3MxX2RlZmNvbmZpZworKysgYi9jb25maWdzL2JlZWxpbmtfZ3Mx
X2RlZmNvbmZpZwpAQCAtMjQsNiArMjQsNyBAQCBCUjJfUEFDS0FHRV9BVVRPU1NIPXkKIEJSMl9Q
QUNLQUdFX0RST1BCRUFSPXkKIEJSMl9UQVJHRVRfUk9PVEZTX0VYVDI9eQogQlIyX1RBUkdFVF9S
T09URlNfRVhUMl80PXkKK0JSMl9UQVJHRVRfUk9PVEZTX0VYVDJfU0laRT0iMTIwTSIKIAogIyBG
aXJtd2FyZQogQlIyX1RBUkdFVF9BUk1fVFJVU1RFRF9GSVJNV0FSRT15Ci0tIAoyLjMyLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBt
YWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJv
b3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
