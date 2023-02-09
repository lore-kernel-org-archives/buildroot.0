Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31B9C05027
	for <buildroot@archiver.kernel.org>; Thu,  9 Feb 2023 01:53:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F12704051D;
	Thu,  9 Feb 2023 01:53:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F12704051D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ecjqkk_erRwq; Thu,  9 Feb 2023 01:53:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34D7E40393;
	Thu,  9 Feb 2023 01:53:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34D7E40393
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CEB6B1BF963
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 01:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5AC18127D
 for <buildroot@lists.busybox.net>; Thu,  9 Feb 2023 01:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B5AC18127D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MxpptbqB2mwZ for <buildroot@lists.busybox.net>;
 Thu,  9 Feb 2023 01:53:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D286181242
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D286181242
 for <buildroot@buildroot.org>; Thu,  9 Feb 2023 01:53:38 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id c15so475438oic.8
 for <buildroot@buildroot.org>; Wed, 08 Feb 2023 17:53:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ci8hfX2AyisEF+wOmPmcZ/gFDTTtuSVj9metqb1uE48=;
 b=HrgplA4MdepU4mk/BPY4Oc1Lv6Fg5yx/i2uzNUUMLd1iiBd0lQavcxcg2h6gKoRCCc
 ckHT10UdH/v4yAHh0Spmji8b4uzqneHd9Mg3X1nfnGi6vTtp4FKLs5CUw3qkFm4/zc6h
 TUazbGUX5hcNaLmVmQJw3+HRa2Ba0VNXI7xBVVvtXkHduBwTP5gHskD7r6z3p/rF2c0I
 nxwjPyw4K/qvA7tFvGEXXmibt90Ms4oPbDoyGB7xmM4nlCfFCK5hT1MtjVCHzQlOq7gW
 l/47XhGZe7LKpRjVi9ym/D4rHg7AUG2RZveq+wn1PdskfvQoUvcqm/ql2MxFVxdwFdkd
 8hdw==
X-Gm-Message-State: AO0yUKUj0TL4GG3Lhau3eEN/ch7xULNpyoyevMyzaWbq4XhOK1UWYo96
 INvhlQnphA9oL6eTL/p0dbtC5K+keAc=
X-Google-Smtp-Source: AK7set/Jzpfx8Q90Idvl41alCx9SLFI6rtpyU6P19FVIK+X//i1tp62ZM5p+STSGWDDBxGpW/xExHg==
X-Received: by 2002:aca:210f:0:b0:364:5bef:87a5 with SMTP id
 15-20020aca210f000000b003645bef87a5mr4932476oiz.26.1675907617382; 
 Wed, 08 Feb 2023 17:53:37 -0800 (PST)
Received: from nowhere.attlocal.net ([2600:1700:65a0:14f0:dce0:30dc:b696:f26])
 by smtp.gmail.com with ESMTPSA id
 d25-20020a9d5e19000000b00684e55f4541sm426oti.70.2023.02.08.17.53.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 08 Feb 2023 17:53:36 -0800 (PST)
From: Charles Hardin <ckhardin@gmail.com>
X-Google-Original-From: Charles Hardin <charles.hardin@chargepoint.com>
To: buildroot@buildroot.org
Date: Wed,  8 Feb 2023 17:53:19 -0800
Message-Id: <20230209015319.28176-2-charles.hardin@chargepoint.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20230209015319.28176-1-charles.hardin@chargepoint.com>
References: <20230209015319.28176-1-charles.hardin@chargepoint.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ci8hfX2AyisEF+wOmPmcZ/gFDTTtuSVj9metqb1uE48=;
 b=VXDsyFq2y5ya03m8dje/Hfh7lUOmAGgwTFLMHlF1Mz8vuIqJNaCgOLAJlqh5iRDMXY
 A5iVRjGoHZsYfw8clT8ApscrzFIG99i95vNr75Gdxo4AZkRvS9jN8FeziLiF+Vn/6BUl
 f7DXik6QTJNBXl8FrWhblpHljmYncDPn+gYQHnpu3DBRNKDj0cwy86iOxcnfrx/TPHrn
 uJBU0lty05n1ciB7BwTPuTuLG0UQ7JA+rcszrX0I0UJYgHxKD5siBTfBmDS6IRABH1Vh
 zmlEQiJiGsX+m+MMmubQO1vggNzc9RqCEHBOKMNANjdk2l/1aPSnWQi5Y3tNoNdH2Yu6
 c22A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VXDsyFq2
Subject: [Buildroot] [PATCH 2/2] linux: add a setlocalversion rsync hook
 when overriding srcdir
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
Cc: Charles Hardin <ckhardin@gmail.com>,
 Charles Hardin <charles.hardin@chargepoint.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Charles Hardin <ckhardin@gmail.com>

During development the override srcdir is often used with a local
git repo and branch. To help track the builds used in those flows
it is useful to have the scm version available as part of the info.
With this hook, the auto generated version include will include the
example.

    #define UTS_RELEASE "5.4.70-00031-g92c23d10d003"

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
Signed-off-by: Charles Hardin <charles.hardin@chargepoint.com>
---
 linux/linux.mk | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index 7645b5f507..e88856d71e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -46,6 +46,18 @@ LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v$(firstword $(subst ., ,$(LINUX_
 endif
 endif
 
+ifneq ($(LINUX_OVERRIDE_SRCDIR),)
+define LINUX_OVERRIDE_SRCDIR_SETLOCALVERSION
+	(cd $(@D); \
+		if [ -x ./scripts/setlocalversion ]; then \
+			./scripts/setlocalversion --save-scmversion \
+				$(abspath $(LINUX_OVERRIDE_SRCDIR)) ||:; \
+		fi)
+endef
+
+LINUX_POST_RSYNC_HOOKS += LINUX_OVERRIDE_SRCDIR_SETLOCALVERSION
+endif
+
 ifeq ($(BR2_LINUX_KERNEL)$(BR2_LINUX_KERNEL_LATEST_VERSION),y)
 BR_NO_CHECK_HASH_FOR += $(LINUX_SOURCE)
 endif
-- 
2.37.1 (Apple Git-137.1)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
