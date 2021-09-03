Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A134DC433EF
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 16:20:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 453D561051
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 16:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 453D561051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17EDE426C6;
	Fri,  3 Sep 2021 16:20:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sIXVwF1LphSF; Fri,  3 Sep 2021 16:20:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 630CA426BC;
	Fri,  3 Sep 2021 16:20:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 42C8D1BF327
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 16:20:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33676426B4
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 16:20:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ytTtL2TOnCTP for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 16:20:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B263B426B1
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 16:20:36 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id c17so6040411pgc.0
 for <buildroot@buildroot.org>; Fri, 03 Sep 2021 09:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cB8KLqH1jaPjXZLFz/11dp2/uz8+Az3UKvVLDS9nqto=;
 b=KnQ8rc2lQf0Vbnmf7K7udPvq13jyEpd31rXvyKQsmq6cebEMbGGnXAKf41pU0KcdDU
 Xtyf70R4Vj2hlOK+kpyYj/hWeF6h6DdjgrgOdQXCRB926WenZmPPLvShCNMfeIfAEvJa
 +FtXrQuVP4OTIR+dBt9pmjNPkk4RhXq6yQd4iLndLsUeun+OUnSY+DvVdguaVGBdciKo
 0sVztZqHiBhvWB++W43VZ+yckpCJzre3vnKC3DvYl+TTX5K3kX31onlqOwd+cerchjzN
 e2BNeSSeyX1p3yNDAzSaKwYutZ71v1WFHh68P917F/pw2lm+ksqIXRB0fN1MQ4FmxtpU
 5clg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cB8KLqH1jaPjXZLFz/11dp2/uz8+Az3UKvVLDS9nqto=;
 b=Pc5quDY6ylJcUelyoCD0IzV6BNmjuoQv6IiPKfxFcQogOf9lfulZcqXrup177/hYAg
 XD7KcjJQMNAc5UIyDiAGHLlKMziPasn28po9qBkhaQNJug8JinGRpoJ4hNjP8lFczTxu
 C2NPQIapEK9t3VGUERHksl7PRQAt27nPi+3Cu9JH3cBcNq3S0Uoc8Yq9W/TbKDiQtVlh
 cMziiP01974wY/pg5Jravy9wa3hgMsaR7qUgiLWfndsGEOA+pFWJ0uxGhpDD5/xB7e2J
 Ff42IFvnSPu8GJKrabO2vnihRMGD8k1ox4Js4yXtnrP41GiIDgtCX4VM28jdFIk9w/iU
 usIw==
X-Gm-Message-State: AOAM531Ymjq0l+P5PdtntLI+9jsYT220PFwcFRmj9k76HpRswoq1grZI
 wdrYnDk3w/qoLUwTJOSIopqj0GFUaHCVJw==
X-Google-Smtp-Source: ABdhPJxNcHDBE2XGgut+zXznJofOhHLwglWxUGj0enURpd6jZULJjNV7UiSwbOVeV3p7TDJkrvqsdw==
X-Received: by 2002:aa7:8b07:0:b029:2f7:d38e:ff1 with SMTP id
 f7-20020aa78b070000b02902f7d38e0ff1mr4153937pfd.72.1630686035976; 
 Fri, 03 Sep 2021 09:20:35 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id q7sm5586184pja.11.2021.09.03.09.20.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 09:20:35 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  3 Sep 2021 09:20:21 -0700
Message-Id: <20210903162027.1935040-2-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210903162027.1935040-1-aduskett@gmail.com>
References: <20210903162027.1935040-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/master 1/7] g-ir-scanner-qemuwrapper.in: Fix
 latent bug in
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
Cc: Romain Naour <romain.naour@gmail.com>, Anisse Astier <anisse@astier.eu>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

If GIR_EXTRA_LIBS_PATH is empty, the LD_LIBRARY_PATH variable is
":.libs:$(dirname $0)/../lib:$(dirname $0)/../../lib".

As discussed with Yann Morin, add a new variable, "GOI_LIBRARY_PATH" and
prepend ${GIR_EXTRA_LIBS_PATH:+${GIR_EXTRA_LIBS_PATH}:} to the path to fix the
above bug.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/gobject-introspection/g-ir-scanner-qemuwrapper.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/gobject-introspection/g-ir-scanner-qemuwrapper.in b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
index cad7ef875e..ec066062e2 100644
--- a/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
+++ b/package/gobject-introspection/g-ir-scanner-qemuwrapper.in
@@ -4,10 +4,11 @@
 # is older than the target kernel.
 # Use a modules directory which does not exist so we don't load random things
 # which may then get deleted (or their dependencies) and potentially segfault
+GOI_LIBRARY_PATH="${GIR_EXTRA_LIBS_PATH:+${GIR_EXTRA_LIBS_PATH}:}.libs:$(dirname "$0")/../lib:$(dirname "$0")/../../lib"
 GIO_MODULE_DIR=$(dirname $0)/../lib/gio/modules-dummy \
 @QEMU_USER@ -r @TOOLCHAIN_HEADERS_VERSION@ \
 -L $(dirname $0)/../../ \
--E LD_LIBRARY_PATH=${GIR_EXTRA_LIBS_PATH}:.libs:$(dirname $0)/../lib:$(dirname $0)/../../lib \
+-E LD_LIBRARY_PATH="${GOI_LIBRARY_PATH}" \
 "$@"
 
 if [[ $? -ne 0 ]]; then
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
