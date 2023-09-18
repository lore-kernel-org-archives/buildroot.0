Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB93CD37B0
	for <buildroot@archiver.kernel.org>; Mon, 18 Sep 2023 20:44:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCA4B41599;
	Mon, 18 Sep 2023 20:44:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCA4B41599
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x6cnykFBsJsX; Mon, 18 Sep 2023 20:44:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3454241595;
	Mon, 18 Sep 2023 20:44:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3454241595
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BAA731BF39C
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 20:44:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 948CA41595
 for <buildroot@lists.busybox.net>; Mon, 18 Sep 2023 20:44:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 948CA41595
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KAGQ-Dh-xSTi for <buildroot@lists.busybox.net>;
 Mon, 18 Sep 2023 20:44:16 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 832E7400BF
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 20:44:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 832E7400BF
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-403004a96eeso52892095e9.3
 for <buildroot@buildroot.org>; Mon, 18 Sep 2023 13:44:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695069854; x=1695674654;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=njyJVG4Xgv/TElgpVushdYfLRZcyHWUezSH9jCr+LeM=;
 b=ClzFV+WU/G2J6Fw7xsXTIxZBriYUKuo+2OUxHNQctYHAgksFWxaFGm5a2LYmkHN6c1
 5+VZ9ebNnM95cFzWpqiI+rMkqz2zC6rSzW/8UeYj57KbbjakPjX8AoZ4+6WcfAmIeiOp
 ANbPixEyVRCtIPK+CYwPJJDOtcHrrrQNwjKE8iq47ctQh5JkwozvAOMABxvod+DGz0yr
 cN4USyUk7G6xQq9UzIgnf7k14KI1BabcQpP/uUEwXWhO/DZ4VSngdau8xa1fco/5B1uv
 hD77E9tjdGKwHfPXv1ZP3JlATeqNd+7RKcD6jOYUlE09s53j7LyEpGv1EWWWMVgwlYUV
 /ENQ==
X-Gm-Message-State: AOJu0Yxb6DBOThBTyChNyqy20I6wh3hWELXW0UlIJ0kIvajAzSCeX/xw
 1oS9q0NZWHb2WSNPhsxkM058GGteXJ0=
X-Google-Smtp-Source: AGHT+IFEXEPERpVbWm1myjhWjFWI7MMHy6Meafqdneq8UJ7qcWIGUo6ZQ6x1ur3WVVrscwkM1vU2vw==
X-Received: by 2002:a05:600c:2103:b0:404:7659:ba39 with SMTP id
 u3-20020a05600c210300b004047659ba39mr8857786wml.16.1695069853901; 
 Mon, 18 Sep 2023 13:44:13 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m10-20020a7bcb8a000000b003fed7fa6c00sm16379519wmi.7.2023.09.18.13.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:44:13 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Sep 2023 22:44:05 +0200
Message-Id: <20230918204405.2654720-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695069854; x=1695674654; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=njyJVG4Xgv/TElgpVushdYfLRZcyHWUezSH9jCr+LeM=;
 b=SwenZ5o9guKIrJx0eEiCtPKt0AVXYJqWKiZUqyFq3tjJSEmgjzXZ/Eq5NNve3kpoIK
 GPf01xirM6cU6Ehl5eWCYv1hIhhBpFjXAXvivYCCdFtdjyAhcDv3Q7RTbLZ1H3l9gqyc
 6Z+Xcq75Gvekmp7HqGIxzLeNpM4lzKr4TDgR8r6N235VRFMxNPIgrusROP5c5s2SW/mI
 1qYim+U4IUk7zvNQ0wi8+Iq2gLWnGVx55htl9YO1RiCEdlfGS01MgI/3UcQVLpHGzr2l
 Zh5wq46cSAYBImZPmzsr2aBrZJ6qFAYEic8KLNQvnqc0jl6aDBNnjRJJl2HxEaRZ2zXi
 UdGA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SwenZ5o9
Subject: [Buildroot] [PATCH 1/1] package/openvpn: needs headers >= 4.16
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

NLMSGERR_ATTR_MAX has been added in kernel 4.16 with
https://github.com/torvalds/linux/commit/dc2b9f19e3bdaa87a7c3d123b8bba8a42d96d942
resulting in the following build failure since bump to version 2.6.4 in
commit a46ac2346558d05afe405dda3730169df4b677d2 and
https://github.com/OpenVPN/openvpn/commit/e34437c26b764851555e4acbe2ccca6bec235c7e:

dco_linux.c: In function 'ovpn_nl_cb_error':
dco_linux.c:303:27: error: 'NLMSGERR_ATTR_MAX' undeclared (first use in this function); did you mean '__CTRL_ATTR_MAX'?
     struct nlattr *tb_msg[NLMSGERR_ATTR_MAX + 1];
                           ^~~~~~~~~~~~~~~~~
                           __CTRL_ATTR_MAX

Fixes:
 - http://autobuild.buildroot.org/results/69b9737913ac0b5cd2c117d526602874da3ee487

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openvpn/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/openvpn/Config.in b/package/openvpn/Config.in
index 5aa2386d36..16fc93efae 100644
--- a/package/openvpn/Config.in
+++ b/package/openvpn/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_OPENVPN
 	bool "openvpn"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
 	select BR2_PACKAGE_LIBCAP_NG
 	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_MBEDTLS
 	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
@@ -38,3 +39,7 @@ config BR2_PACKAGE_OPENVPN_SMALL
 	  It saves around 100 KiB in binary file size.
 
 endif
+
+comment "openvpn needs headers >= 4.16"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
