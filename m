Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060CDC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 22:02:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F52B82A72;
	Sun, 14 Aug 2022 22:02:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F52B82A72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sIWdD7hY_SUs; Sun, 14 Aug 2022 22:02:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD9C282A29;
	Sun, 14 Aug 2022 22:02:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD9C282A29
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9F191BF282
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 22:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9ACDF82A29
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 22:02:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9ACDF82A29
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RzuxnQMwVXnZ for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 22:02:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BEF182A28
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3BEF182A28
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 22:02:48 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id bs25so7176108wrb.2
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 15:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=6g95JKoYgUgdz797HRgrqEacMeTnu3V+kORvN1BImRQ=;
 b=mMnc37o5GRqtrbVL1lOrYnGm75S/D74cRXtBE4Sg/Ry1YO/xMogAJMwP6eeTD5G7EQ
 cB01jrIs6/NSE1D8WigunTZESdGpBFzcEPTl3brhCE3cgcpzNyD8cK00lXs/3eMI4F8N
 WXNYS2C03WgL1yD0WaKF09RViwxG9VmDD6gKUB8Mi/5muW1W5o5LVSno+Ha8E6Vt3zZv
 Z9pL3cKisbAJVzDrUHiyc8Y6HWv1o1UpKl3OYUGgypqX+6nV0tNfUL6kLjyLSjPuQCtg
 SHHDUwGVO0UzXsNX+mqjexnP0puadiGski+8gtwH6V1EFllR8CFXavCnvthEVWYMIBbh
 r3mg==
X-Gm-Message-State: ACgBeo0hU9sePpBc1F/iBN8QeqO6o7EXNylSGICyOQcE5YiRZnlBPSLK
 t36d9BUYVNINWooNt5cklH4+0Y0wybo=
X-Google-Smtp-Source: AA6agR6jbM3RsPXq0bwwb3b3Z1CgRX4ArfB2Gwzq2j4Luf4KDrKndwQo2sw8yjGZkoi+IsIueNgQ5w==
X-Received: by 2002:adf:eb50:0:b0:21e:3d13:3a91 with SMTP id
 u16-20020adfeb50000000b0021e3d133a91mr6825433wrn.484.1660514564886; 
 Sun, 14 Aug 2022 15:02:44 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b00a9b2226c9e455ada.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:a9b2:226c:9e45:5ada])
 by smtp.gmail.com with ESMTPSA id
 m18-20020adfe0d2000000b0021ea1bcc300sm5404090wri.56.2022.08.14.15.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Aug 2022 15:02:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 00:02:41 +0200
Message-Id: <20220814220241.203440-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=6g95JKoYgUgdz797HRgrqEacMeTnu3V+kORvN1BImRQ=;
 b=FMC/1HSoAtkMR/HWzKN9Ct/12qBowP69uwlW3+P1nOenIAtWWZDdxI6tZwnfie2MJL
 jigYwcBxzyeFxDKJsQd3m1jpe3woop3lK09Sm+/SVfaA8+ur+ri2IP9Nu2mVEPWY5ve1
 fL4flp5P45UnLOeKNOd+7viY/H057dPXd+Q5kkgLJ4ZuQELRKaSa0NJ04H7k4vgDejuh
 ZasFRzXVfw7RTkM+k3YsPe5vxNr2v+EFCwv5xLneFpbHzl9YumSCyFl1EF1Vb6C29Lt/
 CTtWFUgvZFS2id7XLpk2xYyRY+AYSH9CU84gwyPUWy7hnxO1CR+a+pPep4atJobzANAN
 ugGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FMC/1HSo
Subject: [Buildroot] [PATCH 1/1] package/freeradius-server: fix libkrb5 build
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
Cc: David GOUARIN <dgouarin@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following libkrb5 build failure raised since the addition of the
package in commit 736c4c1655d93652a9a7e79235bbe726b3d46176:

configure: error: in `/home/giuliobenetti/autobuild/run/instance-2/output-1/build/freeradius-server-3.2.0/src/modules/rlm_krb5':
configure: error: cannot run test program while cross compiling

Fixes:
 - http://autobuild.buildroot.org/results/3968d611458060480d341bd60f7c50209a0ace15

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freeradius-server/freeradius-server.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 2f4c118da5..5b74a3b01a 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -15,6 +15,12 @@ FREERADIUS_SERVER_CPE_ID_PRODUCT = freeradius
 FREERADIUS_SERVER_DEPENDENCIES = libtalloc
 FREERADIUS_SERVER_AUTORECONF = YES
 
+# We're patching src/modules/rlm_krb5/configure.ac
+define FREERADIUS_SERVER_RUN_KRB5_AUTOCONF
+	cd $(@D)/src/modules/rlm_krb5; $(AUTOCONF) -I$(@D)
+endef
+FREERADIUS_SERVER_PRE_CONFIGURE_HOOKS += FREERADIUS_SERVER_RUN_KRB5_AUTOCONF
+
 # some compiler checks are not supported while cross compiling.
 # instead of removing those checks, we cache the answers
 FREERADIUS_SERVER_CONF_OPTS += \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
