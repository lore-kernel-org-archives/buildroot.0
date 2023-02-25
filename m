Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED11C6FA8E
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 16:01:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE53D81EA4;
	Sat, 25 Feb 2023 16:01:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE53D81EA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QZwTRC4WM8RM; Sat, 25 Feb 2023 16:01:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D9B981E37;
	Sat, 25 Feb 2023 16:01:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D9B981E37
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F9B31BF38B
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 16:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69F2A4170A
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 16:01:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69F2A4170A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tDy7D_0BZYuM for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 16:01:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35EB041707
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35EB041707
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 16:01:28 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id j2so2092478wrh.9
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 08:01:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yp5PbI14IdBPeGP6CoJEdzrqMJbH7NlYjmY/+J4C30o=;
 b=aYCEJU+3r8CFm/i3UhLgjNLzF2SY+5q/5eh29e9DSFBxzgsmabLYsDIODQtr4GfpiR
 QgXrLvmqxrSdS02B0KpRL0jS2JofyCZ0ufnH6GNREJuwIXocDRfTEQAsxfEH4r8uLofp
 eJVwurrcABuK+IPQBqr/LNCoQIH2nVm+SHHWtHqOXgUTAkHPlUWWEx1H8PBOdep3/2b7
 adOu2cJVul3bvo9eHr8QX344BojLvzOwGYc+bVrWQyUUQBJKUW2U7kgWQyzPpD0djD9j
 r+SPh6GeXzqOdzjiAjkIs/qXP3/All14QYaQqVeMJHBaoY29MtgHLutWKl8TpAr8UF8I
 axWA==
X-Gm-Message-State: AO0yUKVWPT2Vpygxjg+kEYlEbQLebct921nODeZEyM37Q64aeCiYlbdj
 wJ7Nv/RTc/BgHMioBWH0SMpBcJq+syo=
X-Google-Smtp-Source: AK7set+0TJ1cSLbB0bgXjifi9en+eXlHziOLYmxIeL3aGuhRL5ifxHFnPTvO7dppjLbBEPIlKn6NVQ==
X-Received: by 2002:adf:f50b:0:b0:2c5:4db8:3dde with SMTP id
 q11-20020adff50b000000b002c54db83ddemr16595964wro.70.1677340885790; 
 Sat, 25 Feb 2023 08:01:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 i5-20020a5d5585000000b002c569acab1esm2103823wrv.73.2023.02.25.08.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 08:01:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 17:01:23 +0100
Message-Id: <20230225160123.264914-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Yp5PbI14IdBPeGP6CoJEdzrqMJbH7NlYjmY/+J4C30o=;
 b=ozpKXBHWTdlI3E4OY9B/3Vcy4NbhcewiD5KQ1yQjv5HvY0u4yehVVfK/NCYZIcHtSN
 wXijyjpG5zDDac9BzSdbzGrbQ1MuQSU5sv+UnbYnZOF6OgS9Xzno6Tj/pksVHmjKP+jo
 u5dc00secayfvqvVsovWarHDkkPt4nAnZ/KDmkiWZUnqriYnXmgqGSOIEvPzmRbvXSlX
 u/aq+PxBdSXQLcq9RDUwIUioxjRr+5zdnEUv7CySyk8uyXzLx5qkn4mOSYnkhXP6fiBx
 +YETEqsBH0oUgUSVHqQ3zxg9Ggj+0OJmttLegdwciDqv8Lfs3L35DbE6oELfCepRnkb1
 ZNTg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=ozpKXBHW
Subject: [Buildroot] [PATCH 1/1] utils/genrandconfig: add lpc32xxcdl handling
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

Fix the following build failure raised since the addition of the package
in commit 20695936ad63f602662bc4c6124a26312c46ff52:

make[2]: *** /tmp/instance-0/output-1/build/lpc32xxcdl-2.11/csps/lpc32xx/bsps//source: No such file or directory.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/72c9a4080318b1b247ca3517c95c689dff1068d2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 utils/genrandconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 64b9be69db..a3d98119c7 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -487,6 +487,10 @@ def fixup_config(sysinfo, configfile):
        'BR2_TARGET_BAREBOX_BOARD_DEFCONFIG=""\n' in configlines:
         return False
 
+    if 'BR2_TARGET_LPC32XXCDL=y\n' in configlines and \
+       'BR2_TARGET_LPC32XXCDL_BOARDNAME=""\n' in configlines:
+        return False
+
     if 'BR2_TARGET_OPTEE_OS=y\n' in configlines and \
        'BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL=y\n' in configlines and \
        'BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION=""\n' in configlines:
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
