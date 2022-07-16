Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5160CCA479
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 13:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D461A42345;
	Sat, 16 Jul 2022 13:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D461A42345
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JQug5VYh3eoG; Sat, 16 Jul 2022 13:10:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B55424230F;
	Sat, 16 Jul 2022 13:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B55424230F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9E65C1BF390
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 13:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86E9284DA4
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 13:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86E9284DA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HjFEuNU95pYe for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 13:10:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C69E84DA3
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C69E84DA3
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 13:10:22 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id bk26so10248318wrb.11
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 06:10:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sf1ITeOXGZtcU/74yE75es4BI3xEDtDHC8D48Xe10qI=;
 b=COV+6DsEbWPEixY66/EuVhNN2M/5mp99UOkGjDwiRo6olgtAjYHmdYAF/WjMNqw/dP
 0inzzj+S/BnCFNkNZGwt6orU5AywzmVqt0W6xwx0en/5rBeZX7gXeG/+603evEL5S8Cd
 ZWUaX4xL+pM/pLsRNtNF4rGlLUjSVnT/LrpTwvapIi+zEyyFyQibzjujhi8DzuMx25cy
 NxPzQrL4+NP7Ecl2+BYuwbmJzkQSz97aE0oO2s7UAPSAWbp+ajWBGDZfnWa3RXR5DEmz
 JJruoF73jAK5+V+9Gxbo8JiDLrqq5KhKESQ9WwVcPZVfbFa0hvr9k26prLIwxqsJxNXQ
 BWKw==
X-Gm-Message-State: AJIora+kzQF7ll6wJI+Jh1Q3XgRT+DyrS9ieFMXSpaZWpYsgFYKN9dJg
 C/hkJzhpuD9NcTsruouZMJbVpwpUItI=
X-Google-Smtp-Source: AGRyM1s67UvsM4oPul0XKI0L4PiDc1Np8aHM97GvgHp5yLREUcKROff4KwAiruT+EhSshrTsARDseQ==
X-Received: by 2002:a05:6000:1092:b0:21d:6df8:d082 with SMTP id
 y18-20020a056000109200b0021d6df8d082mr16246519wrw.68.1657977019999; 
 Sat, 16 Jul 2022 06:10:19 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o3-20020adfeac3000000b0021d6ac977fasm6104539wrn.69.2022.07.16.06.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Jul 2022 06:10:19 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 16 Jul 2022 15:07:07 +0200
Message-Id: <20220716130707.390985-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sf1ITeOXGZtcU/74yE75es4BI3xEDtDHC8D48Xe10qI=;
 b=V7usP9W4lj8JtmVvn4ZCbCbqWNw6dxaZorriYbIB1YJTUP2X8FyMuPdbcHj+gPsGJJ
 r4jygZIZWzyCsDLx7pONwHFExC4MTuAmFF14LxgtTujbnjI8yrdbHoqT/2bi2ts14KfT
 G/JFqYjT//6QYjizGKjyDEBbVNpkXBUvaRmRSlR3jqKYdBnwIHHRPZPsbNKhRNCt3wyN
 ZV7WkMe8kkMjX8acugZ4FqNPllF4aQTqp7dwRRAotVsPS0HIcg0PqByr5aQQ31wgvflV
 eXm+o95ADEQk3Tl5PzO9P7n7/X2B5c3y5FNt53S7yApFyMjAuVtbT/0vqNRkbrhGWEVg
 zmzQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=V7usP9W4
Subject: [Buildroot] [PATCH 1/1] package/wpa_supplicant: fix
 ifupdown-scripts build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Matt Weber <matthew.weber@collins.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with ifupdown-scripts and
BR2_PER_PACKAGE_DIRECTORIES raised since commit
eed183e67e02a35e98fbf6baead9c9ee559b493e:

ln -sf ../if-up.d/wpasupplicant /nvmedata/autobuild/instance-11/output-1/per-package/wpa_supplicant/target/etc/network/if-down.d/wpasupplicant
ln: failed to create symbolic link '/nvmedata/autobuild/instance-11/output-1/per-package/wpa_supplicant/target/etc/network/if-down.d/wpasupplicant': No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/fb35c29a966e21a29df5923e6d27ca372a4b4909

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/wpa_supplicant/wpa_supplicant.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index afcd6502e3..e5e3938be1 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -260,7 +260,9 @@ ifeq ($(BR2_PACKAGE_IFUPDOWN_SCRIPTS),y)
 define WPA_SUPPLICANT_INSTALL_IFUP_SCRIPTS
 	$(INSTALL) -m 0755 -D package/wpa_supplicant/ifupdown.sh \
 		$(TARGET_DIR)/etc/network/if-up.d/wpasupplicant
-	ln -sf ../if-up.d/wpasupplicant $(TARGET_DIR)/etc/network/if-down.d/wpasupplicant
+	mkdir -p $(TARGET_DIR)/etc/network/if-down.d
+	ln -sf ../if-up.d/wpasupplicant \
+		$(TARGET_DIR)/etc/network/if-down.d/wpasupplicant
 endef
 endif
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
