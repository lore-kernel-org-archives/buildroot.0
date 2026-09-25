Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B642C98306
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 06:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4828140850;
	Fri, 25 Sep 2026 06:43:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rbtpUJ0V0xMc; Fri, 25 Sep 2026 06:43:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 2A0844084D
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790318597;
	b=po4Mrw202QOmm28+2ybnAbIZz3QpOE6Do1R6uQLgHsw4iUlkU0t3AV1+GdoTTqFai0I/
	 jZagcw/hjPrO6y+EbVO7dgA1zLIfPrLEEEfQc0W0Zz6i39pq79gfVfM+ZSaWfWBIUV/v8
	 vJSVCOU5KF13gRL9e9bFBtwoc1FjL++1sAGQGrgFOfwM4e27gAVrZntvFx+A95Ph88BNi
	 ZDUhsCv6Z9i1KhogbkhYzs5jCbaJlBaBtn4Opfm+OhzMhOHReGO65bvZaImxwDHE9PBL/
	 +ofKaxe00bxS/0IHfkszpAfm6jbmf/MhmvAltdYsUc1QwdHnlTTs3mBQ87x/wPSCNpw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790318597;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=tfIo8taYXnctv8U+kholKV7Q+C/JyhtU4Db+jQSb79M=;
	b=Y8TRFlSIWwJorhArOTFVfdhhf0J5eIXJtWynk6jo4r3xwuZuGUtyXLcFFraf//XfJi5R
	 ZMtw/u8ul9VdGaem2cgQDNrag9a2pM0IYDgGIti6zKoZvJv20zoQfJHWqsq5Mho1lGhRI
	 5RDWkPKPU8TvP9BMhFchyRGNUXZ2d30H39qEfcyx33ifMVAo0+cbBJxHi6IZN6nWFMzy5
	 H49LAWSAPHlLzANaQVtpfpLNt5lWIrZvWOQ5/hpGDqUBMCFUIF+Pvm8W67D8vy9QNBNQc
	 JaFhW1nplcFjkeHOBt75fWyPnY8rPPWZGyyujpy/NRcCo9PKEhulf9fom3l2mxzi1ug==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790318597;
	bh=tfIo8taYXnctv8U+kholKV7Q+C/JyhtU4Db+jQSb79M=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AYsPE95klqCBnwsADOauRNCuBPqTrkgOBi3GZI+O2IRfNfSfY8j6LtgC2K3DnPbPX
	 866ui24FlxupWw753D3ODd6XveMHjhRe2nn7BXsuFhYbEWU6vIV2hLFSAhK/CAL+bp
	 PNN9kwBAU7D7yTxw0OL0CVwauyZXtdlh4aUElefI2EHMC0Yc/FC9xLqxCRWvJihZp9
	 ZQKOfJFKmgJN2l7kNyjflYGpa2rzojnhTSMHFNh4p0kl3Htfq0MWUta09Cu/8EympK
	 iYtBY1khm93gQO/HKQ5PpHsXA9t9GGItuMPN/ErZZ4iIN2XqBn0+BdK3SkQksZfLYt
	 IheqPc4FH56bQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A0844084D;
	Fri, 25 Sep 2026 06:43:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6050D35A
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 06:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46B89401E3
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 06:43:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NwnoBkWR0RMg for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 06:43:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 539C440079
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790318593;
 b=PIqxhz8JWKn7U0ejrxAvgxcGFkY8hPNTqxXWKUUnzkXYoNxAPuyXnEsAGDTMjNU43GhU
 +ickGn0FvtSUV+Ayx8awSKd2IisZkUK1Xrr2V/Ou8bfHdTMV5SrlXVnbMtUSNDiz2LEkw
 XBX82hYvUkiDpCiHSy1KeR4gmM5hyansv2ptkZMgADcBKm7326XSpqiIR48Euakxje12z
 CFuAngWuOxX+KjyTBRZm0as4wWqHHXyLTl/TxIvPhkt/zvrUS7Aq9QzEetwbtVGHSaeFF
 cCAjowP04pNzNt+Zt1Jgbn6Jn8Yk6wKTA3v76SwdeCOHMNjrUsOExUP4cI/V01vWT/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790318593;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=Jp+ZPtL10f0BmZfyFXm00nuL/Dv9t1vkiyoYVe7vzmo=;
 b=Hm5ytogn0m8B71Gb83FAxk0+LytwOVKDMXbD8yvQEFrk9xS6X0cqN+X2RsbLZ7h7fVr2
 /36L/9tFia4jXaqyt9wLHRa0tccb92PhzvMPQikOCWDviVEJwEbUM3MORHCglZGVfD8qU
 41EkQc5LXZmAH+kvNSWVrnW8eDs1OHrWY7A5rFdQOG5/bXNwENfL9g3YyIAX9GTghknMJ
 zjAzZwvhtPvuU/AD8lZbyCUN1C8a8+AGZu5S401MzQnjBKET+bs0pPnzsGBty3A7zzZrW
 CmcYhKiZ4gkLnXCM4Z8+tEup4QnqWO+RUniVfav0xrTZbf22dVbs8Wozq/xQWhoGWVg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=amarulasolutions.com; 
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=m9trLUcR; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=m9trLUcR
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 539C440079
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 06:43:12 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49e7d2bb404so1680895e9.1
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 23:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1790318591; x=1790923391;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Jp+ZPtL10f0BmZfyFXm00nuL/Dv9t1vkiyoYVe7vzmo=;
 b=m9trLUcR7Cl6yU8qtNc71BrI/2M3ihxon7F1TfdLgfYOovGfykwTqEpIVtTC7d3dgJ
 zdY/9orOwUvOFdsFZgjX5O6++QoHqwNbYIQ5WYlx+x88eTXMvhdiqrOlr9L1CdMJFMKO
 c8YPbVAPzixe8NlzkrYejBNO0r9VzXF5aCgO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790318591; x=1790923391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Jp+ZPtL10f0BmZfyFXm00nuL/Dv9t1vkiyoYVe7vzmo=;
 b=DZxvGDglhJIdne1Su0LLMWHJ2Dx8IVhESeY9mJR6ImnEGQ9m+o4ebHlYmRRgPa88it
 KaXvnTawwONCkBFXuCL+G80Iu5cD2UFLFCn7t+UrbpU9qcqXJECftH7PGqQYb1hR1IZ8
 n7eOniiLxobRI0pJ9NYX1YRAx0Gc4pBwJLSmG/ittOxbARxT9uRyDHuMLjyG1vYma5cd
 7wB1MNnAQ1SWSxZpA/qU2kGz/CfiQcqxTycgwTbZsxjPmvf7uoGu+GS3oZGYMUayDB1y
 d23d+fJGkveiKUrQ5XzQzWzlbL+YnzJu7mP2nSqamCeGX3Xrll4TH6i3u1ROFVHxL6Wr
 bDXg==
X-Gm-Message-State: AFuF++k/eO4liSaEvGHWcES4olhcPPbSw5MUsXCxqwuWiGtmQc47bgaS
 mDTqTUsLJI2l9+jc+BuB06mXk6qyR0uVkZVCNdrn03Bxdz/7P1TeMlWAhhkYlVy3iwsEOu2SnLX
 jF7xiKIA=
X-Gm-Gg: AYBFou0OZ1FHmfbA8mjNY0hVUt7ek2VF1k+npFAsd2XOxeUhlHPdGQw5CAzWimrBHyy
 2/194u/irbDs+HLrMFUQnZfe11RYLklpY99dJgDeRIJUacNAYZhoj8V1ecqAkLKItoUD7Fue2m7
 XBfCZs/8YEdK8aduziPXxk7YTtSPVylCKSZF+K68xBmdiAzk2f8M0Xr0LF7qTEgvDYZFl1CqhvB
 AESHDnJOzTKGQQwJbhmqI0wUtCRuBh7EaIieOVw3qFcVtEihvYXERMYlpbsEGikqee5ZvxfDt8p
 5MZXN89OXXZlTcrAfgJ0yEtSDncz8ebJpx6OH+zGwy845XM3uZYqDGd+kI2lKq5bu82Uf7hrVba
 Rdnwu7QP6ZbbTgcRFGqZm+fSCjf2W7STCTchyZXNMlmNBiwZkr+wYpOYauQdAtLh7pylvsRS3VB
 G3SgEKo33TkXrLp8dVAmnQVqPNNuTq7GPAZvrZjR0lhgzhfD2ByY29MCr6Wp2WPwAenhr83bdgq
 OsDeagQ4eeZnZgTA5ihlYLZYenTWULnS+Osihy5lSyJzBMJfuTm+jeAStNTxvrBf0FdJEcZI4MN
 3mdVenMy+aMluBoTr9L/JgXFObASAKJdF25G4YIGhlOOKdkxPWSyvNnCW1t7LYwS0x+IX3E=
X-Received: by 2002:a05:600c:1d04:b0:49e:63cc:6324 with SMTP id
 5b1f17b1804b1-49fe66d0606mr79707745e9.6.1790318590987; 
 Thu, 24 Sep 2026 23:43:10 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5df44f9sm115584445e9.11.2026.09.24.23.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2026 23:43:10 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 25 Sep 2026 08:42:53 +0200
Message-ID: <20260925064257.1162394-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925064257.1162394-1-dario.binacchi@amarulasolutions.com>
References: <20260925064257.1162394-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 2/6] package/qt6: add QT6_QT_CONF_FIXUP hook
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com,
 Richard GENOUD <richard.genoud@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With per-package directories, qt.conf is generated at qt6base install
time and holds the paths of the qt6base per-package host directory.
Add a hook to regenerate it with the paths of the package being built,
as QT5_QT_CONF_FIXUP does for Qt5. The qmake infrastructure will use it.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

Added in v5 (it was part of patch 1 up to v3)

 package/qt6/qt6.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/qt6/qt6.mk b/package/qt6/qt6.mk
index 13482c33cc4a..f039ccef30c9 100644
--- a/package/qt6/qt6.mk
+++ b/package/qt6/qt6.mk
@@ -22,5 +22,11 @@ define QT6_INSTALL_QT_CONF
 		$(QT6BASE_PKGDIR)/qt.conf.in > $(HOST_DIR)/bin/qt.conf
 endef
 
+ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
+define QT6_QT_CONF_FIXUP
+	$(QT6_INSTALL_QT_CONF)
+endef
+endif
+
 # Variable for other Qt applications to use
 QT6_QMAKE = $(HOST_DIR)/bin/qmake -spec devices/linux-buildroot-g++
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
