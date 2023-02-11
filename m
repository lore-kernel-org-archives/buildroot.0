Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35CD4C61DA4
	for <buildroot@archiver.kernel.org>; Sat, 11 Feb 2023 10:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CED8C40AEE;
	Sat, 11 Feb 2023 10:53:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CED8C40AEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QWdV88Kpz1P8; Sat, 11 Feb 2023 10:53:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CA0741743;
	Sat, 11 Feb 2023 10:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CA0741743
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5CA2E1BF59A
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 10:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36FA7403CA
 for <buildroot@lists.busybox.net>; Sat, 11 Feb 2023 10:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36FA7403CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sNui6w2HADoL for <buildroot@lists.busybox.net>;
 Sat, 11 Feb 2023 10:52:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B44F4037E
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B44F4037E
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 10:52:48 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 az4-20020a05600c600400b003dff767a1f1so5804776wmb.2
 for <buildroot@buildroot.org>; Sat, 11 Feb 2023 02:52:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fCajYRnY/N2y2S8ssf360c2sw2eoQqKoaInHI6kPZU8=;
 b=D3AHzq5YoPwExCo5olLeDF2JzHqI0tJ8XapBAOB2D6NpILXInn+yEA3Jsk+AawQjcM
 SavuJsRB/hOL+dXAj3yseRyEz9qB+gWbwjFKIIuP8yUa605+sG+uG6m7V9wbqaD/JO45
 4T14eW2X5KGq9uE0kybd9MY08iO2TavtGQSZZKlJDzsEE0wzu6W5XbEG+gh5MNqPXUL5
 mUgCyoX5sJIVcMOaf/Waxu1v7dx4z5uxfQQbMJ65qs0Mdauo4thV7uDIpDf9GnKpEAbY
 VfL7TCvvxYKHNUrswsQAyOIdOERYlouetjR4WsWEnv4tZ8cHv5LOqVWsCil48lr4Qvic
 UYsw==
X-Gm-Message-State: AO0yUKUOm9fVzNTd+RdBo8y2GVRBgiWVo/vsHTCnWbKycng8thDkHsvz
 vAKL5JZMeL+/BZhTmSbZvOldTL/GMZY=
X-Google-Smtp-Source: AK7set9nWp/6p2gMLJ4NKePp8jbVX7MuOCSVd/wmKHGu1am7faGBaTScqcOK7lW86LuRyd+PQ8/G+g==
X-Received: by 2002:a05:600c:130f:b0:3dc:4313:fd1e with SMTP id
 j15-20020a05600c130f00b003dc4313fd1emr14449201wmf.34.1676112766463; 
 Sat, 11 Feb 2023 02:52:46 -0800 (PST)
Received: from localhost.localdomain (1-1-22-171.ftth.cust.kwaoo.net.
 [171.22.1.1]) by smtp.gmail.com with ESMTPSA id
 i20-20020a1c5414000000b003dc53217e07sm8084200wmb.16.2023.02.11.02.52.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 02:52:46 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 11 Feb 2023 11:52:44 +0100
Message-Id: <912929d06f13459e472f6badf7e9251792b272fe.1676112761.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1676112761.git.yann.morin.1998@free.fr>
References: <cover.1676112761.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fCajYRnY/N2y2S8ssf360c2sw2eoQqKoaInHI6kPZU8=;
 b=O19d+ha8nrvNxVm4wyrHEAs/yqcPuAQVLgnDtOtkyhq+Pvin61Hv7xoKm2pUT3saa3
 a52pCzMLrPDsInF48GEzJYAMCa2iT1hgtdj7E8zzirxb33t/mGREIlWsrLOVywFLCa8n
 8LG5i1xX/+G/DddEBKtI3cyURlIB3xyC1UdYju4tES9quLi2waIj7mrRzyrkua4IIf0S
 9IoWPsuX2cTHDTRO+6Yhjm/DHic+pXsp/6TwhRVuF7Ylgkf9CrRDdqfBW27L0hsqOO9P
 EPwQQ37RmvOsZQs+EeOwrIxX3btI0XiYnrZTZQhQoHBawGqV9gIOdxMh9jaVqSl2bV1+
 gppw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=O19d+ha8
Subject: [Buildroot] [PATCH 1/2] br2-external: make the list of external
 trees public
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently, the list of external trees is a private variable, but for
debugging or compliance, one may need to get that list.

Add a Kconfig option so that the list appears in the .config file, and
export the already existing .mk variable in the environment, so that
post-build or post-image scripts can use it.

Reported-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 support/scripts/br2-external | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/support/scripts/br2-external b/support/scripts/br2-external
index 2c33e6eacc..5815c6ded0 100755
--- a/support/scripts/br2-external
+++ b/support/scripts/br2-external
@@ -126,7 +126,7 @@ do_mk() {
         done
         printf '\n'
 
-        printf 'BR2_EXTERNAL_NAMES = \n'
+        printf 'export BR2_EXTERNAL_NAMES = \n'
         printf 'BR2_EXTERNAL_DIRS = \n'
         printf 'BR2_EXTERNAL_MKS = \n'
 
@@ -181,6 +181,14 @@ do_kconfig() {
 
     printf 'menu "External options"\n\n' >>"${outputdir}/.br2-external.in.menus"
 
+    {
+        printf 'config BR2_EXTERNAL_NAMES\n'
+        printf '\tstring\n'
+        # Use star-expansion: we really one a single arg.
+        printf '\tdefault "%s"\n' "${BR2_EXT_NAMES[*]}"
+        printf '\n'
+    } >>"${outputdir}/.br2-external.in.paths"
+
     for br2_name in "${BR2_EXT_NAMES[@]}"; do
         eval br2_desc="\"\${BR2_EXT_DESCS_${br2_name}}\""
         eval br2_ext="\"\${BR2_EXT_PATHS_${br2_name}}\""
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
