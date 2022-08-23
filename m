Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBE7C32772
	for <buildroot@archiver.kernel.org>; Tue, 23 Aug 2022 21:32:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD39A409DD;
	Tue, 23 Aug 2022 21:32:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD39A409DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6LlPCaS8tJno; Tue, 23 Aug 2022 21:32:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0AA1D404D3;
	Tue, 23 Aug 2022 21:32:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AA1D404D3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 07E571BF3D7
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 21:32:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D70F781498
 for <buildroot@lists.busybox.net>; Tue, 23 Aug 2022 21:32:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D70F781498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zz0wreUTMMl0 for <buildroot@lists.busybox.net>;
 Tue, 23 Aug 2022 21:32:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF5BA8138B
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BF5BA8138B
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 21:32:09 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id n4so18458956wrp.10
 for <buildroot@buildroot.org>; Tue, 23 Aug 2022 14:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=lYNJe7evWHUiG/RKzb26UpvnbuJtzIRg0jNbcTM50ak=;
 b=wVZiilBOpy73UgoirBtIXyGcYp52a1oCBykZ0YW5cZJVry6jD3YllTYm/1P5OD2ay8
 fORiSArBBMdTrNPSaVt0iokLF2I/YAeJG5BbWZ6n4tBhaxeEkiiP2lSsdPBxEhzi/+u5
 cXy9WucyXVcxa9ULAOlW0rgf2cqudZogiBfTvH74SGCGftT4TRTWUsVJBFGxPyPc/ru2
 zC5UWMLZSnRG/10knCoJa4pM/GW71rLqNr+CGS6YtbDs7ZwxneN9Ug7ZwHvHfTtnzgAt
 A4jAZFV1R4u8ff7aWESzfAsN6Ua3YfBBehQGrnHXTaz4M4z4Uy0q5WVo4U1VP9RQPqvB
 LUyA==
X-Gm-Message-State: ACgBeo0Qv81fB3lt+HJtuFJLXzywZRQHx1/gZBzN82J43RJTghneaOBo
 sR1CtiGj4wADMYkxQd7+ehhnbxci8zI=
X-Google-Smtp-Source: AA6agR44lJldxt0MOONXHCkwfCVWux5vD5LZ3eb2SQ4Rby0g6RbIZU9GLWauXcLoOPAClkV0u/Dc4Q==
X-Received: by 2002:a05:6000:12c3:b0:225:3063:82a6 with SMTP id
 l3-20020a05600012c300b00225306382a6mr13389415wrx.541.1661290327662; 
 Tue, 23 Aug 2022 14:32:07 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 x2-20020adfffc2000000b0021e5bec14basm14917769wrs.5.2022.08.23.14.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Aug 2022 14:32:07 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Aug 2022 23:32:06 +0200
Message-Id: <20220823213206.10149-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=lYNJe7evWHUiG/RKzb26UpvnbuJtzIRg0jNbcTM50ak=;
 b=fbwUDDv9u9Prtk8VThm2C0OUt5OViBtHPKO9A+JUiCbIfSIBf5QiMW2mTuvqcXxWca
 mXbTJsQPn4oJlJW5TnL4BrybQbjSY5AHxfXa3FtznTwyOHptvpfRrhfoo9EZ8jvFPQjT
 HnUf3qY6+A+AZooc4QfmjvAd0EuNrMAfoeCS7Y5ng0I8/PMyth6zNeaODsocjmmV4FsU
 01ziiYEGTiHLL+T+pZEIZjNs8N3XH1HUIFE0SIZVpkuwJ2w9nvINLrFaEUnM83MnZZF9
 0c5gDADEtikknkalKQf3kdPBAY0TPUiyjZcQshbRZut5WyM6qVcb4fUvShw3XdvdvTfS
 suiQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fbwUDDv9
Subject: [Buildroot] [PATCH 1/1] package/freeradius-server: set krb5-config
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

checking for krb5-config... /bin/krb5-config
checking krb5-config CFLAGS... Failed to find installation architecture
""
checking krb5-config LDFLAGS... Failed to find installation architecture

checking krb5-config reported version... Failed to find installation architecture
 ()
checking krb5-config reported vendor... Failed to find installation architecture

checking canonical API type... HEIMDAL

[...]

In file included from src/modules/rlm_krb5/rlm_krb5.c:32:
src/modules/rlm_krb5/krb5.h:41:9: error: unknown type name 'krb5_verify_opt'
   41 |         krb5_verify_opt options;
      |         ^~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/f173d1600c278d910f4cbeae86dcad1ee0f911f9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freeradius-server/freeradius-server.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 5b74a3b01a..f77413a170 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -86,7 +86,9 @@ FREERADIUS_SERVER_CONF_OPTS += --without-libcap
 endif
 
 ifeq ($(BR2_PACKAGE_LIBKRB5),y)
-FREERADIUS_SERVER_CONF_OPTS += --with-rlm_krb5
+FREERADIUS_SERVER_CONF_OPTS += \
+	ac_cv_path_krb5-config=$(STAGING_DIR)/usr/bin/krb5-config \
+	--with-rlm_krb5
 FREERADIUS_SERVER_DEPENDENCIES += libkrb5
 else
 FREERADIUS_SERVER_CONF_OPTS += --without-rlm_krb5
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
