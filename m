Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5E3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 21:17:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1373261056
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 21:17:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1373261056
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C707F60750;
	Sat, 11 Sep 2021 21:17:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4hBo92I2jSx6; Sat, 11 Sep 2021 21:17:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 377D060618;
	Sat, 11 Sep 2021 21:17:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 939091BF2C0
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 21:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 724E740505
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 21:17:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tnZJ-HU79buU for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 21:17:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F64040504
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 21:17:44 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id m9so8135957wrb.1
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0zdk2fHKMyUhtseYHOE9HrYK4RdE2x3HubVzQhoYq/E=;
 b=efPTGb7odOYO22IDz/QAzydR4y72rE9CW0+HFhhk/wqjphogEFO+c8CStSq7/pzG/n
 5uBL9vem3mYqYbYiq0eyojaNo7jZwLAu/aUTF7EJmPAybQjEfzmad6ZyeXNqh304N4FA
 Np5myisJxagak5UPzhBUV3XxYMA6VgLe8CbMEdNDYYYPbnXEc+XXSBEn5VSwrDQcOM5s
 8/038qPEdBTutH7i73+7bmOYTHcCwOp00Il52fWbjDrdbljD5oUqE83reVJzclhW9mp0
 M0Ql8h7LO/rVvDJh2dIaXtL8XqlPw+1qD1aEUnB3SVTXsz/5dqFZzvqwVxvvldcKGJ68
 j3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0zdk2fHKMyUhtseYHOE9HrYK4RdE2x3HubVzQhoYq/E=;
 b=yPuZssezvyTR3GssgQIKwa2oJse04aIHSSV9/E0BKO+XpTU2GafDSiyxQLipwkD9wj
 TUwJ+MH+qWexyR/ZKkLsFGo6OuhhmI/bhgzKedBXzOCzMLdPtNZAAOMXkztMInTvNrIG
 xrWzSW918rt2gt5Sr1Jg2HtGoaU1MYdeIQUUXGm3EWZPewi0N3nalLeuwmbA0Au9N2Rh
 qdXhWXj43DHfiDz2V7qn1UhrJdVIvGEy4XcuZgep/oWWzXZ4U4xVw5PUAQIid3yk+siS
 i3+nzmACUrMrORebGdGgoAtKtqJHgMsjPoqZ2QwpqZ200dD5pwbUxCZW5nnjwp97D8EA
 ivqw==
X-Gm-Message-State: AOAM5305w95sZ58tQ44Qcly7uAhviJ+NZvozIJY+tk8IxoNFuIWOTR12
 GzwLwcziMYTu6kZ3mDDxD6+O0GaKu1g=
X-Google-Smtp-Source: ABdhPJwT4B/kiJOzI1IYllHEUfU+hCbO/fryXo7rjgITC+8rscP2gyBwqYWMUNpmfaD+nuK21mS56A==
X-Received: by 2002:a05:6000:181:: with SMTP id
 p1mr4806624wrx.247.1631395062597; 
 Sat, 11 Sep 2021 14:17:42 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id t11sm2771402wmi.23.2021.09.11.14.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 14:17:42 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 23:17:24 +0200
Message-Id: <20210911211724.731848-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/rpm: fix recursive dependency
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 James Knight <james.knight@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fix the following recursive dependency added with commit
429e247b869027f6ecd4efa0f31bccd2765e3875:

package/openssl/Config.in:4:error: recursive dependency detected!
package/openssl/Config.in:4:	symbol BR2_PACKAGE_OPENSSL is selected by BR2_PACKAGE_LIBGCRYPT
package/libgcrypt/Config.in:1:	symbol BR2_PACKAGE_LIBGCRYPT is selected by BR2_PACKAGE_OPENSSL

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/rpm/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index 2af04b41b4..adaf7c96ec 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_RPM
 	depends on BR2_PACKAGE_LUA_5_3
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL if !BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_FILE
 	select BR2_PACKAGE_POPT
 	select BR2_PACKAGE_ZLIB
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
