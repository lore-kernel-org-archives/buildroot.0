Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20216CA5FFC
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 11:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 932EB40363;
	Tue,  6 Oct 2026 11:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4GREMNd5d4vC; Tue,  6 Oct 2026 11:07:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 9184740556
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791284872;
	b=YvP+L2gKl3GX/lko9TzUNc64+TKPhmqIDjwIM4cDNv8WNUBTv/p6WRODN4hEPsn7R+Fi
	 OQXvQrz2Gr/XjAkE2GTZtnwQULvDSoLw463eVnJcqvO1e78mT13G8Q3AKcJl34oC/Ui/m
	 KYrwiKURNJPdj5LwuutbqKBpFM9Q8iL6Vt4iKQSXE5GNSIf/Q0L9ecHDvFerclRTZjhUl
	 q8D3PpfH+jXkoTMIAqecV9mKgrFcG16fz4jBw6EkrC2z/Pgn/jQeWPoNBBYZLRaDmNHTO
	 7J1M/E0M83iWiR6hkn/x5Ge1TtQu3qwuf2qOU5yhWcfIyARFLhCrOkoPoDoMan5bQTA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791284872;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Google-Original-From:To:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/1ewPKlw/8blXyYXBDBIHSk+B9aE2aX7RByC4o8OzPY=;
	b=ctm8egofmdF1uYjUN8/81WKoWuWAvGS1C+LSus5yo2iEUbWmJZixRp7XnVeoFj2AWZAN
	 IV5dgQU4/ePEbKKwP63cJvpULXW0vJSsXkwaJ3X4xusAe1R3w3GhcypGH37iSJeI3XcSe
	 ahJE1vhOykIhKcdn0SYw4B0xDS5umtItun4VurLGpoG1JaeKbnHPH+7BSonfyw71Elwat
	 P8QZxgoLZmQa23Nf/poyaFGHmURRBsuzu1Hr3QJAFelANZxsUzgQS+ELvrcewdRKLmEFi
	 oS5yv5o4HpXCKH6wXX8LxCDLdwqhyOc2Xd71tAP279Wa+gV1M8MjuQEhok4/CPS76Aw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791284872;
	bh=/1ewPKlw/8blXyYXBDBIHSk+B9aE2aX7RByC4o8OzPY=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Nc30q51g9cDtDOJovH8dmOv1iUkVjAYU9G83tDJvKIadzeqTbR0kuasFNFVE6DPXQ
	 QoqJk27jLq0CDJBRUM6DCBX7cwZcmOeiKKBnIaUxOm9/UuEj1pNgbHeDLa99/fprvv
	 df3snmf0KwUPoIcFJ9TC1v8koKUpjtKODzztFtkIL9RPzW/bELDwJ7kfUm5YqNDloX
	 nULm/LaixH0Qv3nJ1zdXOqbY6KzAbXklvTh7tAr2fSc1KNjpbjfBh6/VuJbVLznXWS
	 ebZgvrLfqdGwLzW6WyE8VizmCfh1wHcAqkS4HN+sEKwSGNhDxpvjQYLBQdHYpsTdsn
	 acvcOF+SIL4tQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9184740556;
	Tue,  6 Oct 2026 11:07:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6BAF7341
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 11:07:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51AB86072F
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 11:07:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VED2od3IXy-S for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 11:07:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 104D660781
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791284839;
 b=XrmPaGMkPd4M4zQ+IDujMkY492iaheR5IQlYSFgKLJXs0jQWEHtmjGh6ehymBTeWlp62
 p7CAzlXSIz1Jc+e5mOr4vjcwJAiLha5CAcUJnTH4Nt7jWjca2LOaR8djOwBO8St98kOj7
 n/PTCnlZ9rCyNzrwQU2ei+TF7skF9hGDxI5l4XJitiVjg7k2tntYKcNZ1CvLuZn5U1FLV
 sH42dtTYBV+WBJdsR9VspvB4cfwvg3y/9F+vx+baPAcmeBtaTJqm7KGn+D9JUTxE+aM3u
 cOO0Pcjp/p7wBLRWod20B54RAC+o3Tzm7zQmJq7Lk5b/R+qCajyyArGlaTLY5vNPQtQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791284839;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
 X-Google-Original-From:To:Cc:Subject:Date:Message-Id:X-Mailer:
 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
 bh=sDWypYro/1Fob4soiiumKwUU4Tqd6MEokiFiqbz1jGs=;
 b=SV0PZVuTHeF4IW5WcvZlvQrYB28uqffznh2aqRObNNP5NkuqyF1sch0ipqJsZVajsVft
 7VbmFwD/J03SxhqXvpNzHKbitogX/L5yfJAkKZyNFWmWpOz8ndde3HvpQRwOam8iiConm
 Xtu8/e4zWqKW64nGMwWsM4F0pdsFzw3lkogjZW3g8ogKAn6hhffHf1n+AalX+hlfm5iMF
 k0+FMkq/MZkHbVmCLTdvua1MzC4F7jM0xdH5Gqww1hgsoSms0XtnDWAXMZuZ9xhtjhtzV
 lrhBDT2V3eGoWUjcenVGQA2gjuSYS5EieWssHgu9RGy+Aax/Ynq6GHyObiYvKtMHopg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=googlemail.com; 
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b="aKep/Oky"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::62e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 104D660781
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 11:07:18 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-c2e2007dd8bso69663666b.2
 for <buildroot@buildroot.org>; Tue, 06 Oct 2026 04:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791284837; x=1791889637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=sDWypYro/1Fob4soiiumKwUU4Tqd6MEokiFiqbz1jGs=;
 b=JYWW4xhRv8lhTcRsv/XhcZoEqKQB/WOxePhdgWOXR4drbwaYp+jdnADfXoGdKjO6uM
 Zizu6SmmjcsgnRmphKINMTV+xLzGYk/RF/4XnbhexlxnKqgjtlsx2RVUkH3zbde8CdbH
 mnJSIMc0TGs2vU6d/ooWvFWYu1fkQdKH6HYP4dhwEHrgpmvlwIjpsJvPd9LCAr1XGGNx
 4k3nP2rKi8IbLu+4+k9h8Gx9OnHd7jhSoU7JxhcO7kCXs84rvWv//ayxMlUHrpfeyBmG
 Yv20SkQjE/Yf5HISCC7PvWt7e0xcFuLIRt0UX+slwiUDIfUa6t/YcxqS93Oi4m1T2nYU
 JRaQ==
X-Gm-Message-State: AFuF++l1bNYP9ha8Uf9k6JJaCLvt5QKus2LFtttVnWAiz96lWxPe63oT
 X0fb4wxUul9OOKNK0lUga4WVUNCE4m7jNhUcrY6KwICjZbTNMWFJgZb9/Nh2bw==
X-Gm-Gg: AYBFou1XCoYTUAsA/awkKf3V7x5+jWdRV//W964S6I1midQjRj2mmlfZg5PWR5JrgOe
 P2x13eDVP+EOwvOQjoF9fuX57HzGOMIQKu8+ZDyvgylKnvlKrcXZoYojLDdG3wCkWqbNDV33xqI
 8rbc+fcZl/1Z9WlmwfTO9KMxaAs2Nhpr1B/u3WfPwiVI9oyydCwcpeDajMb0YtyAS+EqaCSfMHk
 zwaiB/YrhdEZRuzUyacUClF9w7Eou6erpPEREYJ5ZCYwCIjGKRCZpqgPXb9Rrti6e0N9fvfP2ro
 BmE/rzrx/qdm23529y+/DFkr19xJU5AZ7JTn/vkPBEAbyyDZEWre+GsXHjyEetlTrx5abK+hVjS
 RpZ0SO8EOB/RhEKmFyFpM1VjWQRbRf8Z4GeHN1kvKjpCyuieHO0HLvnk9jj0gFo0q2gJ1rDPVBH
 ZqbUGSnTh0mXzRmcCrBrJdjdJPunjeGQhv0QP3ZCwgXXSggbQ0eb91IELwg2kuNzIMGDHzHBRd2
 ODZZA3nSFuDru+NliRJ94r77mBoOjDKOXzddW7M1pXuPds=
X-Received: by 2002:a17:907:3e07:b0:c2d:dbfd:4314 with SMTP id
 a640c23a62f3a-c316a0bf9a7mr124622766b.46.1791284836415; 
 Tue, 06 Oct 2026 04:07:16 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c3156ec7b8asm189536066b.25.2026.10.06.04.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Oct 2026 04:07:15 -0700 (PDT)
X-Google-Original-From: Yegor Yefremov <yegorslists@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  6 Oct 2026 13:07:13 +0200
Message-Id: <20261006110714.3242851-2-yegorslists@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006110714.3242851-1-yegorslists@gmail.com>
References: <20261006110714.3242851-1-yegorslists@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/libaec: new package
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 "Ernesto L . Williams Jr" <realcontrols@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

libaec provides fast lossless compression of 1 up to 32 bit wide
signed or unsigned integers. It implements the Golomb-Rice compression
method under the BSD license and includes libsz, a drop-in replacement
for the SZIP library with the same API (szlib.h) and soname
(libsz.so.2).

https://github.com/Deutsches-Klimarechenzentrum/libaec

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Assisted-by: Claude:claude-opus-5-5
---
 DEVELOPERS                 |  1 +
 package/Config.in          |  1 +
 package/libaec/Config.in   | 10 ++++++++++
 package/libaec/libaec.hash |  3 +++
 package/libaec/libaec.mk   | 19 +++++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/libaec/Config.in
 create mode 100644 package/libaec/libaec.hash
 create mode 100644 package/libaec/libaec.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 32ac338dc8..bde955ec6a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3567,6 +3567,7 @@ F:	package/feh/
 F:	package/hostapd/
 F:	package/imlib2/
 F:	package/kmod/
+F:	package/libaec/
 F:	package/libftdi1/
 F:	package/libical/
 F:	package/libmbim/
diff --git a/package/Config.in b/package/Config.in
index a82e369aff..0585bacccf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1617,6 +1617,7 @@ menu "Audio/Sound"
 endmenu
 
 menu "Compression and decompression"
+	source "package/libaec/Config.in"
 	source "package/libarchive/Config.in"
 	source "package/libdeflate/Config.in"
 	source "package/libjcat/Config.in"
diff --git a/package/libaec/Config.in b/package/libaec/Config.in
new file mode 100644
index 0000000000..86fd770f2a
--- /dev/null
+++ b/package/libaec/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBAEC
+	bool "libaec"
+	select BR2_HOST_CMAKE_AT_LEAST_3_26
+	help
+	  libaec provides fast lossless compression of 1 up to 32 bit
+	  wide signed or unsigned integers (samples). It implements
+	  Golomb-Rice compression method under the BSD license and
+	  includes a free drop-in replacement for the SZIP library.
+
+	  https://github.com/Deutsches-Klimarechenzentrum/libaec
diff --git a/package/libaec/libaec.hash b/package/libaec/libaec.hash
new file mode 100644
index 0000000000..cf4984447f
--- /dev/null
+++ b/package/libaec/libaec.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  cc7b93be9002e25a88b45d6b8d5f6120756cb5e1000613f91d803ce0beba24d9  libaec-1.1.7.tar.gz
+sha256  9fdabba96fbc46af0ca018f86329f1e06e873b25801732001128d5afca265e36  LICENSE.txt
diff --git a/package/libaec/libaec.mk b/package/libaec/libaec.mk
new file mode 100644
index 0000000000..d631230be6
--- /dev/null
+++ b/package/libaec/libaec.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# libaec
+#
+################################################################################
+
+LIBAEC_VERSION = 1.1.7
+LIBAEC_SITE = https://github.com/Deutsches-Klimarechenzentrum/libaec/releases/download/v$(LIBAEC_VERSION)
+LIBAEC_LICENSE = BSD-2-Clause
+LIBAEC_LICENSE_FILES = LICENSE.txt
+LIBAEC_INSTALL_STAGING = YES
+
+ifeq ($(BR2_SHARED_LIBS),y)
+LIBAEC_CONF_OPTS += -DBUILD_STATIC_LIBS=OFF
+else
+LIBAEC_CONF_OPTS += -DBUILD_STATIC_LIBS=ON
+endif
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
