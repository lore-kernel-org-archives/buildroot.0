Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49714CA5FA1
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 16:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6E29606CE;
	Mon, 28 Sep 2026 16:22:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P4F00xL8Qmky; Mon, 28 Sep 2026 16:22:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 0BE17605A7
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790612537;
	b=lz/sgUagV+Ldca4s+bEFl/Xr+oXqInn5h21l9cqeG9yQDPL404v/K/poVygfO5xCF6E1
	 JxOgbiNItGC1a1GvEc04SHEaGDN+zEyYU8UpexqPVQUJSNDxH4nQ3Fa4Xet57ABkdiu2D
	 D68tN9mxumwFlOsJlUy7x0NECHz8fOhdCnnoZ70H8w/7DA6vn7n8a4jhpaF0M9cYup6g0
	 WGqyUwEbmvbt56C3Nm/ezegxuoYwTnJdmLmISAkbQWiJbZCC6dd6F5NAs2ArIcmfww9ud
	 SP1lExfvKhhD5cQ5nu0UnOCj4Q1D8tDsNvBG1oiHXbchTwGpjwMXvOEsyh6mp/jrJNw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790612537;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=eApUY0nkRjOaPV4ol25Veua4DAp4VqbjNcw2mZYejJQ=;
	b=e2ZAFIX8e5cn0Lt6kPNk7FMpOW1OLG4XAKdkmXQF3iFs/6IWdMD+9bZq3jgZLCpwcOSl
	 cVY2/e4is6ivAM6T6SAwLsH2Oh7PC0yRsabmo+LKCNLFPhK915p8sNuM4AoqxAhbVHiJO
	 90aY50HPxyhqnOJmhF1vZ/5viTUAXgpBbkmgdRHPVD2grr/YtihUrhYzYqnaoeqFhn0lF
	 AWREx5M2HX3KZ6BGccbjX2Kp2SQkyf3Ba/ceLSZdyMUMzmCNF6gRuxXTfF4qwu+mrBXcz
	 P5ohz9E/0UjrvXkI23YeLKbi1/6ivv014s43TMJR1xG1WXYb5gkjac3cq7yjTB5DLlQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790612537;
	bh=eApUY0nkRjOaPV4ol25Veua4DAp4VqbjNcw2mZYejJQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ASEUPrwEOSbNdvbxnR4b89S8ExWZT0Tqn5kf8f/JU+ZRyOyuBbmZSdsk8T4+4aE15
	 r7q38JWbr5Sg7ObL8eSg61fvTCeXi7IcOI7B8rpaxFm5Nf85Gd888JaVkUnhfPZSbx
	 j+8dPeyTOF+qgVPDrD1wRJAJECB7wj+nBg4JMBBpk8kujeTiUisnxN2SYFIA4/ZKnc
	 jwEa95onwD6jKCXM3kBpz8N242Vqb5Ks+wHnnwGfttfRU5lOyzjprqM/HY5nz8ctuc
	 CwkB8J1fuK4KJhAPGlX+9N/QCoIp1OQ6rZP8TbGbrP7VzRMHvuoR9fvaT13Lz4lY3K
	 4O7zcKeBPe3sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BE17605A7;
	Mon, 28 Sep 2026 16:22:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E25473D8
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 16:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFA898085F
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 16:22:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0aa_Z50o1opO for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 16:22:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 99ADF805E1
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790612535;
 b=TU3kFSthNr+Rpjk0FESvmsUI5/eHlBCNvLSs32LavZkrov6F2L80bURj4xQdlWl6YxUz
 jj7FozmhKCynR3FOpfaIhNBYikfcy5MMpxK4Qu+9gmbwTVn+MGYctjbygHYI8k6U4lyhn
 GqzFVpYUcTH+YO56rzMp3VnZddHsQtw9RWreIiNFCy9q9Y1nEl4wXNbD1bveddhOgh0FL
 zamjQQfD+mwat32NhONJ54WfMhGikRtwVMvQE94IAfvPJTHVBDQBwxUcmvPNkY56QLiX+
 bWjDafS9hUCWi9Q3fhoCOraGiZEiA9BWl54c6KkyBqI1Fpu9bPtOq0V4xXu9rDXhh7Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790612535;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=z1cuOp9IV/z0sQ+vVApm6CLI+TJev5jOcQaQJe+FSCc=;
 b=aToqkS1TfL/wG20fqmBlNgVLNi6ZkBevXmeMlD0ZS7itpff5qw9MHq1nDkNkhfjqXpX9
 GZIbYGO9cM9QCtGQZ3jFuXWnI2oy7l+xjUnjhEHmVsAphZa9H9/t+okqE/d/SouS9hR8x
 1Xl8oQeg62yBv329ELvnGfO0C02JwIfAmwkPgtAN8HO5BrI9CvOKy4QiHpWByQPEo3e83
 nCSL3Js3NmhBDClr4BB7gygbL4TayfWNf1CoPDr9ZYdx+O2mAOZw6h2YWWubK9OraR0tY
 6GHDg5bGLJh3/mXQO0L0FIBdqsgaxs5BuY2tmPxygUdiOr5sAWnAcFsUAVXddKMpvCg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=amarulasolutions.com; 
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=c5frCHNc; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=c5frCHNc
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 99ADF805E1
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 16:22:13 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b912d3920so24153725e9.1
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 09:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1790612531; x=1791217331;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=z1cuOp9IV/z0sQ+vVApm6CLI+TJev5jOcQaQJe+FSCc=;
 b=c5frCHNcS5Xg+t+U4GBR1Z7m2wvA4WiY/nhEcF18OjxyMYHHd4El0HR6iAWJEiL7bK
 uSQx5GfO9yF9jH/3UZGtnZ5daeewU83jEep9QKnCfGvT3PeTh0sqShHj5Q6EKJjnRLEd
 nsDNT+040TaJt5jheUpXm4qp2wY8lzYAiPyuI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790612531; x=1791217331;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=z1cuOp9IV/z0sQ+vVApm6CLI+TJev5jOcQaQJe+FSCc=;
 b=DnPEFosFaC6/4VvdSmRu+zQDGK2AQiRpaq2LE0BLI3vvNgL58dFaqHq3V9n22PitJM
 zvJv0SK5WikhscFyfzOIpqcPSC4TP8kJ8cK1CwcyV5/2nGAGqiiyY5VQKqKULanxZ5rj
 0bJV/2qoQQ9vaOrJUbzKK33U1+lc+CmyRoriPaUINPaP//ko/hCUO3cWfLxrd3r9ASqF
 +/fLw0BTuJLTo0eAu4I4Ls0vW8JiptvsPHKfKpP6iR9rVszRL57aDKlqs8coHG6KUz5f
 A1dVpUlywP8fuuIaYkC56E85qF2E+f5xjrdpmm8xBf90OLTqM1FffoJjx1Y9j+fs0g5+
 7bsg==
X-Gm-Message-State: AFuF++n8NKYE5oNO3K+sQzLChMncfc/LRvdkeOGIFEsQh8ApMOpOOglA
 JvtgYo6U2D0Y+5OKPp96C2Ah9AVRQM48PfUZzkuQKmK5f0J+I/9i82LEMV3RetfQiwJrymm7SFY
 UDuEldFc=
X-Gm-Gg: AYBFou16AsUGvG05Gi7ejjaaUZP6wC/dF8mJ9ISJEVd+JOvuZLmgJGwNUz7mB5HqgEm
 4k1lrrODseFEUKtZnm1iDsW9MxNBQyVa1U5OCsl3S2N/qyRvLoO/DNX8K6V1zPE4bOFoQetN0y5
 Ab34JFY9S6SSKYI4nLXkDcuBE5G6dhQyfWLCBboa/WefGcFaepp7Xbb2o9ZJO5ZS0McLgV2SkAj
 xLErjrCCkiICYxp8nqL1SMJrqfT0ifv4pAsnQ39l8ZqoJHnjLaJ94rptdsNQ7jYJzafeUTucVq/
 S9N3XGVVmy7DEkCqgmKlHwrOFHgzCO1yMeEYOEQjn8dVpDBktMQ4zIerq0CS6AOZbJ0SVjb3Hit
 Cke9QT3EhuAvDwu16qrrLOCxjxUZgJ1RssvMkHDg2pgdIeU/LF3n2VG0BQNiztkbMoUnkA+M85Y
 DdH8+U6FJ6jdxiC43AlJXlnLgrUIJL5Q+qlFlPPLypzkcrOHE+Gv3wN4SbPK6Vl8Ee6Tuxl8RAT
 vL4Up/1CHL2Pp+xh6msa46KZmxNVL+N6a9bOvuFfjp98hxZhcj0/6GoYTvAIsa1msGkp1GH4kmy
 WdYdgoWPYs0gMDXWsGPHVT/LoLcwCMWZ/n5yrQk+AeFXnEuLopOzGNOhHCb58W0iqxtpNaahKJ1
 ARSL0Nw==
X-Received: by 2002:a05:600c:4583:b0:49f:d087:6526 with SMTP id
 5b1f17b1804b1-49fe670d05bmr260396695e9.34.1790612531335; 
 Mon, 28 Sep 2026 09:22:11 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a00d0f66cfsm2192775e9.14.2026.09.28.09.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2026 09:22:08 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Mon, 28 Sep 2026 18:22:03 +0200
Message-ID: <20260928162203.3465543-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/less: bump to version 710
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see:
https://www.greenwoodsoftware.com/less/news.710.html

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/less/less.hash | 4 ++--
 package/less/less.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/less/less.hash b/package/less/less.hash
index 8d29dbc87db6..eaa29514ddf3 100644
--- a/package/less/less.hash
+++ b/package/less/less.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
 # using DSA key AE27252BD6846E7D6EAE1DD6F153A7C833235259
-# https://www.greenwoodsoftware.com/less/less-704.sig
-sha256  20a0b0a2bb2525fa53c7eee9beb854b4c9cf172eabb209af7020743547bfe9fb  less-704.tar.gz
+# https://www.greenwoodsoftware.com/less/less-710.sig
+sha256  d1008fb78dcae1323ddab664bcb352a61f022b1b131bd8018548e021d975ec7a  less-710.tar.gz
 # Locally calculated
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/less/less.mk b/package/less/less.mk
index d8ffadb8d204..a43d7a2fa0ce 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LESS_VERSION = 704
+LESS_VERSION = 710
 LESS_SITE = http://www.greenwoodsoftware.com/less
 LESS_LICENSE = GPL-3.0+
 LESS_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
