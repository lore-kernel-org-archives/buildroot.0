Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07D4C00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 15:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49FCA42162;
	Fri, 29 Jul 2022 15:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49FCA42162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xj81ftN_nQ4J; Fri, 29 Jul 2022 15:46:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29F5141BE3;
	Fri, 29 Jul 2022 15:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29F5141BE3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F3CEB1BF33F
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 15:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD7A341C03
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 15:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD7A341C03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KzdHaZDebU76 for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 15:46:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9671141BE1
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9671141BE1
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 15:46:42 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id m13so2524570wrq.6
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 08:46:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lfQMgzwasXGe8fI3rl6hwGZJZ/i7ZVvf4HJhjnKXDG8=;
 b=J3ZSIRIPg4F47qzKe/CI3kpPU2LUeIVr3bfZGbUVsOhfpclUbIu+pLSETf1cj3iZ6/
 GyUwcYcr8VgeV4v9o2OyOmar5uo5vIGlCWOPD83uV3d4Xdc6ht1SnnBJQuLaywGNFYhZ
 4DSE1TbZ7porM+Dio8JSmUZqn1t/HyTVuJ8qwUERnYBWT1Hyc6s4428LfrSYr1qTe777
 0EPL5c8WqPjOgf08hHauyaqcw+gvpbFq8gPa8+b05vOW11kzVBmOCo0A8wn6dFT3twk3
 dxuaPZAxrZsLS7aPV/8ccmLebq2ZRuTqfE7FO1tUXc4XdE22u+Uz6MiCmE6qWOK8R/GK
 7iqg==
X-Gm-Message-State: ACgBeo1aOSTpPCd82452dBqogHff+r/CLx36W1b7daFVGY64eygNKkve
 BF8Etv18ZW26m5ulr1sgzQ+hjMt1kVc=
X-Google-Smtp-Source: AA6agR6bcTQLQn+tfcJPaONN3AhA/6bAwnxGdre4HeY8A5z9OG7wn2GIFCg3mchAjXeug3iW7HBA7w==
X-Received: by 2002:adf:f1d0:0:b0:21e:c8e1:e82f with SMTP id
 z16-20020adff1d0000000b0021ec8e1e82fmr2805126wro.635.1659109600411; 
 Fri, 29 Jul 2022 08:46:40 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 k13-20020adfe8cd000000b0021e3e73dec6sm4871614wrn.72.2022.07.29.08.46.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 08:46:39 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 29 Jul 2022 17:46:37 +0200
Message-Id: <20220729154637.11397-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lfQMgzwasXGe8fI3rl6hwGZJZ/i7ZVvf4HJhjnKXDG8=;
 b=lP3rJu0L8webjF3MjKPR6rqBEp+M1Puslm6/WtSGdK28ihDNy3qt2Xx9O/CFM0e3dV
 5bte88o0t8STq77cTmr+hjGPZm6jHcl/5A9sunvqVAK2EiYOAGjLLV7dQP7jWjADb17S
 /K80MtJElrm2pdfDeS1oPq0xdr5a/TZgAcWsUiUBgRlMY/kyFRhiq4NklrlknjTrR6d2
 j9ao/ngxpVNG8tsTQRnjKJ0fYa9JDM96r9EoeaJrws90Btb+1Obh5dj7OtCQUJrt4VAR
 4Yt22ixl2lIU4xT/eHFZEJ1i5IP6ixuMXWXKpvtXmdTCc+/R5tKKdCJCS13YUTQ+K+wx
 PiHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=lP3rJu0L
Subject: [Buildroot] [PATCH v2, 1/1] package/pkg-autotools: fix runtime path
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 505b5a6cdd337c2fd5965aa875a1a53419d62ed1 wrongly stated that "a
configure script bundled with a package may be generated with an older
version of Autotools, that may not yet support the --runstatedir option.
This will give an "Unsupported arguments" warning and the option will be
ignored.". Indeed, this will raise the following build failure with
attr, libtirpc, readline, etc.:

configure: error: unrecognized option: `--runstatedir=/run'

So to support configure scripts using older version, the variable is set
directly instead of using the --runstatedir argument.

Fixes:
 - http://autobuild.buildroot.org/results/c853f14773d875be30e32ae24daf80e181fef34e
 - http://autobuild.buildroot.org/results/045211cd66cf78c3d89d2d8ac41ec4edf0b0ee58
 - http://autobuild.buildroot.org/results/8c5160eef99de2f1f72f33d5e5ea94d417855b2c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Remove revert sentence

 package/pkg-autotools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 548f69cbb8..b6224b349d 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -187,7 +187,7 @@ define $(2)_CONFIGURE_CMDS
 		--exec-prefix=/usr \
 		--sysconfdir=/etc \
 		--localstatedir=/var \
-		--runstatedir=/run \
+		runstatedir=/run \
 		--program-prefix="" \
 		--disable-gtk-doc \
 		--disable-gtk-doc-html \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
