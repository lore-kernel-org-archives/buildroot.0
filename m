Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C77C54E67
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 14:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9132B810CC;
	Sun, 17 Mar 2024 14:05:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q04YQ03WiqOC; Sun, 17 Mar 2024 14:05:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95FBE811E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 95FBE811E4;
	Sun, 17 Mar 2024 14:05:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C1F61BF303
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 14:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 88083405B7
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 14:05:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9z8hj5PwoT8U for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 14:05:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C7943405B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7943405B6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C7943405B6
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 14:05:10 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-33e570ef661so1523957f8f.1
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 07:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710684308; x=1711289108;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Ya/4kkYyGRSMM3+BxeRpPpm6/8wJUp08TO5gVP4Y3Cs=;
 b=d3MWnUhelOue45kA13TSOYicYe/uDfNl3VxaQuEOlcyJyKpPEGbuZqGRpVFoFihQ2L
 HB38ylfeDeazkYTGcnU2aQau/e2oDB9n8tpkeeZWDFc8OnJ5F+HEgKy2hkDhZYIlhFjJ
 rY4PSkw9XgnSPGhEr8c5gLbYfYGWfKIzE6t/gyNKiyMfUfwRV1DVzxEA+wwuU2MS/BXR
 4ovuX1NY6GfXt2QRd3m1mhiwqAbp+Ira2Uscm36MaqjFAiPkRtU3N9jBXIFw/Bl03/J8
 /F3uRoi5CO8iOXj8W5UxovgubbZj9upCRqzHxodkBt5BE6kKFZ4NIY3WPBnR1rwda0RC
 uzgw==
X-Gm-Message-State: AOJu0Yw/1rdHu2Js6/iIuRpMMiDKTZ3J9XOa1jRy3kW4Crn/9QbRI+pd
 YETG/65jddsZCIzD0kgKixS6JhoBZUw8IWEKzEO3jGYKT56lpV+P5GD/bhw+
X-Google-Smtp-Source: AGHT+IH/LKY/ek31vXcNLVHYsEYLVLfhQS7mX+ffSrHh0/1OVqgBoYRt/lSbKk23/LvdB6rBl+eLDA==
X-Received: by 2002:a5d:44c5:0:b0:33e:786c:3354 with SMTP id
 z5-20020a5d44c5000000b0033e786c3354mr7190505wrr.14.1710684307968; 
 Sun, 17 Mar 2024 07:05:07 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ck7-20020a5d5e87000000b0033b48190e5esm2258762wrb.67.2024.03.17.07.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 07:05:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Mar 2024 15:05:05 +0100
Message-ID: <20240317140505.803596-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710684308; x=1711289108; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ya/4kkYyGRSMM3+BxeRpPpm6/8wJUp08TO5gVP4Y3Cs=;
 b=UOEgRS74KpnSPAvIg1VLzp1CQp79n+Nle1Na1c2yOSwpk/0uu1v6utglElWxw3iwvt
 76e1LNhz0zujIeCzKftOYtYTg9UQ+pdUJmXe7Fp+PoAUYCTT+7s1vokDm4rwzO6RK6Je
 WqRjA/2oRq5aRRTJ03FLtUotIPXcPXun/omG/y6CCey95PIoxMopd3US9L7DYnVdvoq4
 DuAf7hbJcHCANAds5MUhCCEVmgGyIuUtMVAjE8g5JEstkgp74aodN5wVvgiQbGeWBJ9i
 C0MtIIlF/yXh7X+/Edv9i5E1OCS/N3gwjTzA6Cismny4/+qgWALR9TjLABgfsS1UrayC
 qNcw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UOEgRS74
Subject: [Buildroot] [PATCH 1/1] package/mariadb: requires DES in openssl
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Enable DES in openssl to avoid the following build failure raised since
commit a83d41867c8d69a77d5cd0a665aa216af5340359:

In file included from /home/buildroot/autobuild/run/instance-2/output-1/build/mariadb-10.11.6/libmysqld/../sql/mysqld.cc:50,
                 from /home/buildroot/autobuild/run/instance-2/output-1/build/mariadb-10.11.6/libmysqld/lib_sql.cc:34:
/home/buildroot/autobuild/run/instance-2/output-1/build/mariadb-10.11.6/libmysqld/../sql/des_key_file.h:26:3: error: 'DES_cblock' does not name a type
   26 |   DES_cblock key1, key2, key3;
      |   ^~~~~~~~~~
/home/buildroot/autobuild/run/instance-2/output-1/build/mariadb-10.11.6/libmysqld/../sql/des_key_file.h:31:3: error: 'DES_key_schedule' does not name a type; did you mean 'st_des_keyschedule'?
   31 |   DES_key_schedule ks1, ks2, ks3;
      |   ^~~~~~~~~~~~~~~~
      |   st_des_keyschedule

Fixes: a83d41867c8d69a77d5cd0a665aa216af5340359
 - http://autobuild.buildroot.org/results/bd067de9c2699dc9628c00b929a01890b14d53c1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mariadb/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mariadb/Config.in b/package/mariadb/Config.in
index d88dda3cda..acedd1da9d 100644
--- a/package/mariadb/Config.in
+++ b/package/mariadb/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_MARIADB
 	select BR2_PACKAGE_FMT
 	select BR2_PACKAGE_NCURSES
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_PCRE2
 	help
 	  MariaDB is one of the most popular database servers in the
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
