Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF731C05027
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 03:04:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6766A820CA;
	Thu,  9 Feb 2023 03:04:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6766A820CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x8E7M0U_qCr8; Thu,  9 Feb 2023 03:04:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AA573820B8;
	Thu,  9 Feb 2023 03:04:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AA573820B8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A14741BF4E5
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 03:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79CA0820B8
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 03:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79CA0820B8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X3-pLh_NhSV2 for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 03:04:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7F86C820AB
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7F86C820AB
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 03:04:48 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-16a291b16bfso995162fac.7
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 19:04:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j+mDgSqOetJ8op4ecWqRpB9pNOopJmtHcXvS0VXLJ20=;
 b=GS9gGQBVPX+cCUyykpytgIcgTtSIIhthQ0SyWbr25+okn0MBCgG/OYniec6drBE7vx
 pazQuKgC/h0xskB8x1IgvFogpmkmtIxiqL4oxq8NzKHuXkCiLtCez9gAOIE3mP+Amklj
 +zkYuvOE9KqT1pNsclJt38rYfxhIiUecyZnN9Qn9Igr+TBvsTrigj/ATj4qTX3hwufO+
 U/ywNskcUoQWmjtU278i5zxiK0+mxXtMSbQO5JlO0qFcx6JkG/VBvgMeU3UQ+b7NG+jn
 KJrdMxRrzOeZW/SVfGvFXzIQczcr2leGsnwHTdy9vtknOU+M8A4lx/YdLNSqpOzgAZF2
 d74A==
X-Gm-Message-State: AO0yUKXGpxonvWsJGqEE894jd0Edy8uFK09iTk2CJOZ3H3PXBGuLAoLt
 1HygfOtPFp+E9Blf10WCX8QFMkhVnjw=
X-Google-Smtp-Source: AK7set85EHb6xkyRZJxPUJAf0RwdeL5Dd4qgwr+esJOxRYLoH34QuCHWHU9TyiYNhC989T5tG9tlFA==
X-Received: by 2002:a05:6871:713:b0:163:aade:5e01 with SMTP id
 f19-20020a056871071300b00163aade5e01mr2216234oap.26.1675911882998; 
 Wed, 08 Feb 2023 19:04:42 -0800 (PST)
Received: from nowhere.attlocal.net ([2600:1700:65a0:14f0:dce0:30dc:b696:f26])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a056870a10500b0014fe4867dc7sm108383oae.56.2023.02.08.19.04.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 08 Feb 2023 19:04:30 -0800 (PST)
From: Charles Hardin <ckhardin@gmail.com>
X-Google-Original-From: Charles Hardin <charles.hardin@chargepoint.com>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 19:04:03 -0800
Message-Id: <20230209030405.33574-2-charles.hardin@chargepoint.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230209030405.33574-1-charles.hardin@chargepoint.com>
References: <20230209030405.33574-1-charles.hardin@chargepoint.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j+mDgSqOetJ8op4ecWqRpB9pNOopJmtHcXvS0VXLJ20=;
 b=A1i8uiMKIkixt4gJHqXlrY/od6zer3NFEe5GlMTcVcqTVDjhL+53B1eIEG5EwTgwYf
 pawgL/OO7WZUHZQZJxPMIhUiiIQ28YwRJ+CgTwjhH3OlHh8v9oDfXBTG9ILPfWsSEtNj
 OMU1BQqXwVsi7uy4WTsxVOMerqah9i+qYHbN1KknJanUXWzo+J3U4+hTz1AtSZNxHTpz
 6uDZ6d32mDhjh8+uwx80m6w21QqAWyAmPf5jEEQjH/SLR/ctCAV1H3jedw6rsUyyDcKf
 as9lNL/wFRD8TWsZtqADI7i63Bpji8/wIYkEtlCJFXrg5qu7/8tyPTpqXRPCRvL1oXjE
 Mgag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=A1i8uiMK
Subject: [Buildroot] [PATCH 1/2] linux: create a scmversion file based on
 the custom repo variables
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
Cc: Charles Hardin <ckhardin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Charles Hardin <ckhardin@gmail.com>

When using the custom repositories, the archive creation will
omit the source history to get reproducible hashes. This has
the side effect of making the setlocalversion scripts within the
builds to not create the tracking information as expected. So,
just generate a .scmversion so that kernels will be labelled
with where buildroot referenced them.

For example (line wrapped)

    #define UTS_RELEASE "5.4.70-repo-version-" \
                        "92c23d10d0031e0a13244a1a97e7530d3b53fc6e"

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 linux/linux.mk | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7645b5f507..0b27c8dee2 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -596,6 +596,20 @@ endif
 ifeq ($(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL)),)
 $(error No custom repo URL set. Check your BR2_LINUX_KERNEL_CUSTOM_REPO_URL setting)
 endif
+
+# Create a custom scm version file to reflect the source version since the
+# archive will omit source directories like .git to maintain reproducible
+# hashes for the archives
+LINUX_CUSTOM_REPO_SCMVERSION = \
+	"-repo-version-$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION))"
+define LINUX_CUSTOM_REPO_SCMVERSION_HOOK
+	(cd $(@D); \
+		if [ ! -f .scmversion ]; then \
+			echo $(LINUX_CUSTOM_REPO_SCMVERSION) > .scmversion; \
+		fi)
+endef
+
+LINUX_POST_EXTRACT_HOOKS += LINUX_CUSTOM_REPO_SCMVERSION_HOOK
 endif
 
 ifeq ($(BR_BUILDING),y)
-- 
2.37.1 (Apple Git-137.1)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
