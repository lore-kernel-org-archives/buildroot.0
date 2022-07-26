Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6ED6C433EF
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 07:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F71B410BA;
	Tue, 26 Jul 2022 07:03:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F71B410BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tiMBxlUvVqbg; Tue, 26 Jul 2022 07:03:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52DB7409E6;
	Tue, 26 Jul 2022 07:03:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52DB7409E6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB0F01BF287
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 07:03:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B3186408CD
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 07:03:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B3186408CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CuH3LdWF5bxy for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 07:03:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9D58401D5
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B9D58401D5
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 07:03:26 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id b26so18863580wrc.2
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 00:03:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dwej5TpTlWcmRTHXxPXMwsGg5ZKQNgjVObov5dFPHYg=;
 b=DQnBFQVJhVSmAL688//5on8zVerKdE9f1PtB2tHQF0JcDBsMUALvqmscfu38359Prw
 xmgxpUpo9mouxxrV0FdxPnrT+6UTr9j+b7b3n4jGE1k3ax0WqB9/LNJRlLAzU7Jf0ctI
 yNg3v3Cdjnn4sBVDe1B5nvOyjX/ZvyQO8zOWyrSRmuTMi/pMzKgIuAJ12ZpOEVsg0Kai
 YG3BYYtrl22mC8uhnvz69F9OY5hTSrWlEtNNFiXcIVRBaDLuedC8hx4NKQi7Bl8UeP+r
 iuETSrqRT3DxJz0pNI7iGDVsowaedapHJV0zNEmKH3pZtrdV9QHR491ldVR+utWGBxFp
 z5/w==
X-Gm-Message-State: AJIora/9+MAyvjYUud+mqAzeYU4dd5t5WtiHlpBF7nQilQmx+fAbARdF
 aHsliFJec+Ai54xpuO+QQ71DhhEcMHo=
X-Google-Smtp-Source: AGRyM1uDzZgidWXPLt4shRkyPFnW6xVxRZIJy46F32M1diOjB/nBADmxi4x1hRWG6fSaYgww2m4o4A==
X-Received: by 2002:adf:fe81:0:b0:21b:88ea:6981 with SMTP id
 l1-20020adffe81000000b0021b88ea6981mr10261323wrr.616.1658819004325; 
 Tue, 26 Jul 2022 00:03:24 -0700 (PDT)
Received: from kali.home (2a01cb09d053e3d59a58c457f47a946a.ipv6.abo.wanadoo.fr.
 [2a01:cb09:d053:e3d5:9a58:c457:f47a:946a])
 by smtp.gmail.com with ESMTPSA id
 y2-20020a5d6142000000b0021d70a871cbsm13673789wrt.32.2022.07.26.00.03.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 00:03:23 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 09:03:21 +0200
Message-Id: <20220726070321.1192683-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Dwej5TpTlWcmRTHXxPXMwsGg5ZKQNgjVObov5dFPHYg=;
 b=Q25J0sXi8LaiAF/Ixr52SBQEI917yoHnM03+q32/X9WhWhLz1jb7/1cXZgX9uA5RaK
 5Cc+gCTvaGZSl2dgdzDCXKbUxQINHce4hIhUYBuZElJbhhmFm5YURL2TqNgOzFwl+FLX
 xP1RscjhW+kAADjLHDJXyHjyyBK1B5UsU/UP6Qb9t8OyqZCO2VEO/BRQX5oGZRfGfC/y
 0g7/ILjI5qFymJL2+afZoQKPgFzP3IRI2F/jF9yhKvtFEUv8s7l2C+W8KcP3lD7/ifin
 bNQehTqYMXjoQBD0zMMgo5bE+ljZJ0N0IoPIfFxTgmVWk4GHq5/8GsS5N5oho4WAv9bM
 l0vg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Q25J0sXi
Subject: [Buildroot] [PATCH 1/1] package/zeek: add ZEEK_CPE_ID_VENDOR
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

cpe:2.3:a:zeek:zeek is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Azeek%3Azeek

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zeek/zeek.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zeek/zeek.mk b/package/zeek/zeek.mk
index 6c8fa06875..584bfb0778 100644
--- a/package/zeek/zeek.mk
+++ b/package/zeek/zeek.mk
@@ -17,6 +17,7 @@ ZEEK_LICENSE = \
 	Apache-2.0 (highwayhash, folly), \
 	MPL-2.0 (mozilla-ca-list.zeek)
 ZEEK_LICENSE_FILES = COPYING COPYING.3rdparty
+ZEEK_CPE_ID_VENDOR = zeek
 ZEEK_SUPPORTS_IN_SOURCE_BUILD = NO
 ZEEK_DEPENDENCIES = \
 	host-bison \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
