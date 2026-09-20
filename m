Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F27C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 17:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 837FB40EBE;
	Sun, 20 Sep 2026 17:13:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bXeSrOrc32BQ; Sun, 20 Sep 2026 17:13:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9A9E840E54
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789924416;
	b=UEsWb0+e6wwRtlXacHh+1bZrgq37giaNr4vqhenrreWMBLI4CG9reOZbJdPmPARTS5ve
	 GpVmLEsERAnIxz2s+gNXpB/EPWw6L0mf50VyXBVzliYAtGYH/wyD1I+oFM16qpIH/O7IN
	 F1nGGbNdx55hVrQVMXO4d1fbRbk8cWjQvIK/o4/xSpigim+CE7o7+8rKHP3K1WC8W6c1c
	 EOSwMvtL6BRwTDVva5Tr2z5esTHPtdD1K4Reze1HJk/DszvP4SEBd3HZNSGblB/KTX/IV
	 53pSA0N75wL6ssatVT83jg99Fagl+GOdj5Oi5qUVc4fsMe8aL37Tdv2jbs33sPU8CMA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789924416;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7HJQcqabToS50lIpqdaHWmxm3w2SRGOYz/TVG5/Tzus=;
	b=e96tiZkSua1i5XDkwlMtMIbFntZHoXqmu6LBiVPDLWP8kyzMWWwA0p7vzsx8pYFnIbVh
	 +zJXjefnHDknbLQxKgFgoF0TW63ofM+LGPFkxO8zeI0UzSp1yGzLsccCc+4Krfq48riDj
	 Ea2j/lsJdoX7wDJIScrbO08rpfTYKgzQ2uHqptnvWlTmzdXen3YS60irM/jFQ6V7gfU3t
	 RndMWD6TwSf787Gjz1rm2n3HrCN+6vGOug69/kNmYDUxdrCuymu0X7j0wrkEx5J7fkuRZ
	 fAPdwxeCNFKzyZy5MkHhVbGpczNn6rGP1FbZAZOpD5ZyRlIfJGkb1kbqodhhHey31Cw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789924416;
	bh=7HJQcqabToS50lIpqdaHWmxm3w2SRGOYz/TVG5/Tzus=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=e56KS+g9ymGKDL465fpLABdsR5n/xHyVYuzmSRcUOGpuNwWsoH0kEIpbUnIh9Y1Fy
	 NNkUHYV1uAbs9bZifw0M4dvJc4TEzI+PPWwGFCsRCUcUfMePOq5E8nHRyOsYCxmbgS
	 reE49/vmFIhWehN26NmSN5ORAK5wD8LyjVfnLxySd/g4Ycv5pC/A714hb9Db3lpAFi
	 oKeMsGr1Sr1l+e/RztIWGJoBxBW50MWxBwzQ7Uls6OYZV2dhgcbO4k2QoS14bnKO22
	 FnWQJhRSkNPc4P0g0gDVgmuEYXukCekzovzzpaC1kce9GWaUpPzLBDp5IWqEOqAXt8
	 6Ajc0+n7bHI4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A9E840E54;
	Sun, 20 Sep 2026 17:13:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D58AAB88
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAABD80D7A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:13:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KaLXy97H5Uwr for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 17:13:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C9A6780D29
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789924414;
 b=SeEu7UwM6YD0Vmfz1+5wot/3/3iGWdeWiMsKg8CvkNtr33FJjaxEX0BUM7FcD8x2RjFE
 eEEiWCKluu3mmPsSULb3D8bGYKnEQF7uaHL207DqT8cDPSFp0su0SA7NaFs0DN4oRQe3S
 4X2+BHxwmYh0D6zlKhjtywf3JjXkeYhBVWf0M+0BYrR0Jwg1dOVALSLkMC7ufHSl7w35v
 xWTJlP7sXYw89Mlsb5AtyvJxus9uEDo/nIG43QikqGcZB74sD3qJW8mr2q/rd/UTdR57G
 xTiJX1PB1s4UMixf7QCA+SDCYk+KHJpNZzpIuxx/il+1pyXH/ffTu7qphVbbRtqlWtg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789924414;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=UTTrzdFT64qWE94loi2rLwOT8Cr/BOq6ifW37i0ttzk=;
 b=dqwr7NPstOmJuz8HlShTpxmRE7D0G5E2DoMK1my4zxGQ+f1B2Z0E7F0ASi62gHo/vdyV
 m0xTbhzssB65RIhT0HvRkJoibwi+2nHJTJZYfvmNNmYFYuB8Yv2ju4D8P1gQC1iaKDvVy
 0FmsgAeoef/kRLjRU0jaU7fWVe7ndrw87w0kvBNK1XzIYkYz0noNiScbg3HxaUBEu+On+
 kWCf8eAFJKdehCs08M8kqnU80JKbyUO1oEZ+BxB5SZ/E6Grdg11bPY9B18MAtQfIyuOGH
 5dI6uJY+unGg1Yicbkku3/HK+wwcMwVqsd0AXLC/9X/A0t/J3Lb9Wr1UwogCfMJBINw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pY8O0uN+; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=pY8O0uN+
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9A6780D29
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 17:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789924150;
 bh=UTTrzdFT64qWE94loi2rLwOT8Cr/BOq6ifW37i0ttzk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pY8O0uN+xpfhjDcmCblW3prDf+awPfRtbcS5uVHCRtPO7tLx7sI1iMULO7C7jZVyx
 glbFRZq+2QH/Ml368D/cxQOAeE/gzl90vcU1+NNUchmSxAsUDykP8psJUSypN8bX5C
 RhsIpcamZwlVrMzNSUAtQgj0d2X0Sb7Pl26yFU2isTJz0qjCWr2RW8oGbxeR5lndXy
 1R80Ov4QHC9ctYNItP2eowSOfArL5EvukCF9YsQNOWVBCd4IZqQimVlgtrX6NMhSoN
 pT/htdMKL5XoH6H2IWaNpFiaJS2569rI8/BkoolZC0AKfmf7Bd2M7o4khdAfWIffds
 /jVw5JlgxsSLw==
X-KAS-Sym: v3:f51bdf72230551df:lHdkWXAlOH3mFYa7MPhN/Q5mZRaSllnUONUXNce4VNqCbu40d29sJoTMWL/UgPpKmiu+oFAK+SGKiz0pvNPHzzdK8865J0NZZhjD1YGG6aDHJWSqGt9pmYaVeClFza2NY+i+npE0hJgg/gHxSjO6xcwlUb6QQuNPO0hdPziIw4dhYYf4DJSWrRRzANCMomoD/RZTgi346Zz0eW33G9Vcp3B7DR+EaybhZMrqLCjEqGCkGFXPOjSjpT0/ayWciGjXWUz3QuiXUZXlIr+lNW1V5S5HyBJCR/w6EnvHAsYJhPTQhQAx4gJVctdz4XTCaIimRq6ACwja3Rp9OR6uCM1UuQ==:D8VHaBcCQZWpBfNlLN/FAgmWElSfqmQyQG99Nq/FJXBR7oZNYOjTAVbySugMTICXhA3SXAyE+GasSAHQ8dCTxx1yx/FGfHXk70p4lZ+P+fcaHA9MdKHD9YWxwUEf0er6P1MZ1wo5YI1UFGdn/B+LqdOPtOr5GaS/6LjcTMhGeQh0G6Jfpxx9nKdgNRF3QTWSWeRsEdrhPLrpM6WI96ZYUDbVrsesOO4+SDJl4W526ClyEaq9JT54gnZ0YEmyN0H7CVBpBIlmhThkZDPiaciep4VKapHQG0Aef+hdVtkac5lHB/Zdpz8exk/xqT9IWyMvnKdKzMalNkpbec65k+BEI+Ou08Vc/Z0kzygsgI19Ut+rO5do8Xad8pOLL82mpCDDWqG5FTji2zzo2F9sFNBy9OGzwyomBMJ7owt87bcCJtua1UiPFJpi2ifQkBASctn22DyeUA6/G5LfQ8nHl2QGVsnz7C7VYRLKe1Igs0YSyeiNkQti4E4fjNF4jRNCMHqXcJy1uQPKROC4YLxRp9RiTRfPHQfbLYxXQaYhk5dv7xs25KnwfNQ/lbmpT2I1s79FuAJ8xlZKpujtQxX0g1/strkFZoSwZb+2i2/Ibr3yOgTkuI
 2obXFMQ8QQvPtgOlxf007/FN9Xoz8TZ9k+j1ryfTwA0ut9jPYJHiNvpytiq9UJOIbG7KTcTrc=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5C64BA4C47EC;
 Sun, 20 Sep 2026 19:09:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57728)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8L1Y-000000000o7-0uVa;
 Sun, 20 Sep 2026 17:08:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 19:07:21 +0200
Message-ID: <20260920170815.240247-15-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920170815.240247-1-bernd@kuhls.net>
References: <20260920170815.240247-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v5 14/67] package/poco: bump version to 1.15.3
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/pocoproject/poco/blob/poco-1.15.3-release/CHANGELOG

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/poco/poco.hash | 2 +-
 package/poco/poco.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/poco/poco.hash b/package/poco/poco.hash
index 6979a9a1e4..4c132f9742 100644
--- a/package/poco/poco.hash
+++ b/package/poco/poco.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  47394ea7ddb7b0a40e1a5be896f8f5dc77cfdc4f561d2e7131ecf582df5a0c3a  poco-1.14.2.tar.gz
+sha256  4f112fea59e0c65f0fffe30a4957f8d66cf41528c21dd9903e6d7550022c794e  poco-1.15.3.tar.gz
 sha256  c4b1e1e5f36d8331737231fefcc30f5714326aec7c387ad59a8115eb0ba7d6b5  LICENSE
diff --git a/package/poco/poco.mk b/package/poco/poco.mk
index 63279d530e..7e2a9014bd 100644
--- a/package/poco/poco.mk
+++ b/package/poco/poco.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POCO_VERSION = 1.14.2
+POCO_VERSION = 1.15.3
 POCO_SITE = $(call github,pocoproject,poco,poco-$(POCO_VERSION)-release)
 POCO_LICENSE = BSL-1.0
 POCO_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
