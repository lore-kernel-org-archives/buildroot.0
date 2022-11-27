Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA3C6C4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 13:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 555E681098;
	Sun, 27 Nov 2022 13:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 555E681098
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DOqSp1wGyTW0; Sun, 27 Nov 2022 13:12:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91E1281461;
	Sun, 27 Nov 2022 13:12:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91E1281461
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E7DB1BF42C
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8620B81424
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8620B81424
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 21pnsqzleESP for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 13:08:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D4ED80E46
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4D4ED80E46
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 13:08:54 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 a7-20020a056830008700b0066c82848060so5375397oto.4
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 05:08:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gc6gD9sf93LsenKv8QngDKX5hyeT7PEgGHrjoHhVZLQ=;
 b=Ta54CpBWnk+FDzdi7rcRydP4kfiD/FeqorXDsHcBwSoTF550BO7ImO76xYLSu8IViz
 JZd/JRLX4ADcw9xsP2rjYbKQ+lZuU1H0UtEGt7v16fX7cUMQVF4TEk3WQxrEA+VW1HPy
 k93nVdUfgGaK9ALITzmXHDya7HbwpgzoZv9Szw0exH9cgkZTqm89ydNeFlR72Lmz2R2z
 sr1ldDPd55RtyAaPvIJyzyQXRqYp4CAevz1Bo1l9geuz0CT0WmwDh783hEbTHbgr7Lb/
 9Eqsq2P1Z0TCh5vyu4BlRrlP41Dsf3OoBbpLaHTyJ0BNFX0RdlBImXmGXXIrmCPpL3rI
 /xNg==
X-Gm-Message-State: ANoB5pl3SqnWpUnAbil//hZJMLIfFBZDs7VBP4ccdRX1epaxwBTjEI4+
 jeDZQg+xWvmIzYDMjlsxvsvrb9YEe9o=
X-Google-Smtp-Source: AA0mqf5a5D9rukONuatlryh74Yxnx26Vrp99GDrbcrUzj0rB6EkkYt27ETQhhqbSaia5Y3Z9JWAz5A==
X-Received: by 2002:a9d:4809:0:b0:66d:11ed:3d1a with SMTP id
 c9-20020a9d4809000000b0066d11ed3d1amr13405163otf.379.1669554533425; 
 Sun, 27 Nov 2022 05:08:53 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6519000000b0066a9ba5094fsm3655102otl.1.2022.11.27.05.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 05:08:52 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 10:07:33 -0300
Message-Id: <20221127130739.1862398-20-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gc6gD9sf93LsenKv8QngDKX5hyeT7PEgGHrjoHhVZLQ=;
 b=SMU5+sKytOQQEFjX/LSncEtrWX/4fm5HZb0rKOorBkpwfbUKH23r3oJg42RnQn4N/j
 JMJ299lB5dF2GNGVEF1Dyf+zrqzCe50CZIkpgKx8XPYH134Hxk1C4ADPhhnsR18x7Bt2
 hcnCEiewaWAtQIrH/X6bSrLw2+vIiX4d70FYvpEEHA3tYqXQwZF1OS/8Oucj/zE9uPx+
 izi7iJVNRinzZ5UHKX0Ze+P87CR4jpcuZdoBMIT7qG477G/dCY2xEsKL+Vd23H9gYNov
 ZP0pO6chVzRtGhBPAq481lus+pE8/JuOKmPXPteUj77asVyysE5hfTgpemoi9lZKevNb
 lQkg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SMU5+sKy
Subject: [Buildroot] [next 19/25] package/gcc: properly handle legacy for
 renamed ARC option
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit "50332a530b gcc: rename option for ARC gcc" tried to add legacy
handling but the new symbol is part of a choice, and Kconfig does not
enforce the select of a option from a choice.

Update the legacy entry for 2016.11, following the example described in
the beginning of the file.

Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Romain Naour <romain.naour@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
test config 1:
BR2_GCC_VERSION_4_8_ARC=y
BR2_arcle=y
NOTE that in order to test this other line must be commented out:
default BR2_GCC_VERSION_ARC if BR2_GCC_VERSION_ARC
---
 Config.in.legacy           | 3 ++-
 package/gcc/Config.in.host | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index e489458270..8861b0d704 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -3970,10 +3970,11 @@ config BR2_LINUX_KERNEL_TOOL_SELFTESTS
 config BR2_GCC_VERSION_4_8_ARC
 	bool "gcc arc option renamed"
 	select BR2_LEGACY
-	select BR2_GCC_VERSION_ARC
 	help
 	  The option that selects the gcc version for the ARC
 	  architecture has been renamed to BR2_GCC_VERSION_ARC.
+# Note: BR2_GCC_VERSION_4_8_ARC is still referenced from
+# package/gcc/Config.in.host
 
 config BR2_KERNEL_HEADERS_4_0
 	bool "kernel headers version 4.0.x are no longer supported"
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index d7fedc9591..cd1b9fa46d 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -2,6 +2,7 @@ comment "GCC Options"
 
 choice
 	prompt "GCC compiler Version"
+	default BR2_GCC_VERSION_ARC if BR2_GCC_VERSION_4_8_ARC # legacy
 	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_POWERPC_SPE if BR2_powerpc_SPE
 	default BR2_GCC_VERSION_11_X
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
