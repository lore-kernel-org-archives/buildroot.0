Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4829CC05027
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 13:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C2681405B0;
	Mon, 20 Feb 2023 13:26:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2681405B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id apVtNMMX_tXv; Mon, 20 Feb 2023 13:26:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1204640591;
	Mon, 20 Feb 2023 13:26:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1204640591
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C9761BF3A8
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 13:25:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2661D81D46
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 13:25:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2661D81D46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VxMdB_luxrfh for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 13:25:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2D5281C26
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B2D5281C26
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 13:25:56 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id p8so1335020wrt.12
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 05:25:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7R3wtu9gIRfoOvs9nxlPnX903Apq/Fj7hvLQ6+p7eeQ=;
 b=awugs9PVc/bgvQkEja41CwcjN7X4bCEZ0mEuKDmgwK5m7VTs6FQ7z/IlwRlP0bCe8O
 1DMuIC0cOkX2Klw9wf/YGWmgMt3k11ZfjRnoMofhFRlDnSY7/F529+Asd0Ras0OAoKju
 liGZR4GKl/blYVmfEID8iYUSRwG3WUF6RHU59vEShCWnnfUyPSRiumODTj2GkkN9Ucd/
 yvqVLgAOi2f6XxqoesM1vVCTBmXr5dyaMGHNEGzRC8hwCOxmitLXNm9RLcOwsrzomgNC
 cOwGP7Hm2l+JUKXQzqCMg0kMBCKAP5z6As+4usAD5WZ2LYPyPFvSGN6x0zMOKfnq8GY/
 t/IQ==
X-Gm-Message-State: AO0yUKX8w+XOdD2DtjH9of7L7Bs36b2RjKenHs0Tdw5bAsO04MdfDSZh
 SlItzdv9K253jJZF5IyDiCpN+j4aZyA=
X-Google-Smtp-Source: AK7set9ZDLaw5hEbcMSzy1kyBKm8Z3Ne9RGsGslPjCmQ4n6XM/f1EFrR11r8yaNp0CVEakoArfaOBA==
X-Received: by 2002:adf:f207:0:b0:2c5:51a7:efd4 with SMTP id
 p7-20020adff207000000b002c551a7efd4mr1267942wro.54.1676899554401; 
 Mon, 20 Feb 2023 05:25:54 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 f18-20020adffcd2000000b002c59e001631sm1196664wrs.77.2023.02.20.05.25.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 05:25:53 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 14:25:51 +0100
Message-Id: <20230220132552.1825946-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7R3wtu9gIRfoOvs9nxlPnX903Apq/Fj7hvLQ6+p7eeQ=;
 b=Oz6C+8CnkU7SfsM40QDan8rb9xTQ94h0RRjU8UFspp3fLgwG64lN+XXi0G0wI5Chof
 pGyJ5C5cEQGb4GTsq3CS3GuWPYFa5frnNhrnHDLkVWS0reSPXj5lFxepexrmQkO8NkNl
 FWqcCEthATd4ZvFNYApf7ZGfPkfBUxdi+c17x2ruD3cKO+LYvHOkFz0nscoQLvh1gILb
 TcwhrTSk9XxtsWCWeqIXHoz3CvCJoH2CMvXgtlxr+Q0JnSh4i83HiHxP1bOBIjedvwz8
 C48wCuXESz+w+aMXPnqyb9PQVKPUqVWgPbdEeXAZjIO6ks/QqrlXePnQwmk71nPidB40
 i62A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Oz6C+8Cn
Subject: [Buildroot] [PATCH 1/1] package/speechd: fix build with help2man
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with help2man raised since the addition
of the package in commit 9f4f8c5f8993c6d7c2ef730ac211ef84ac9ae26d:

LC_ALL=C help2man -n "speech synthesis daemon" --output=speech-dispatcher.1 ./speech-dispatcher
help2man: can't get `--help' info from ./speech-dispatcher
Try `--no-discard-stderr' if option outputs to stderr

Fixes:
 - http://autobuild.buildroot.org/results/cc1817efb4a5d54ffd2e7ac2f4fc773535f70972

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/speechd/speechd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/speechd/speechd.mk b/package/speechd/speechd.mk
index 46c0672f59..dee94a6752 100644
--- a/package/speechd/speechd.mk
+++ b/package/speechd/speechd.mk
@@ -12,6 +12,7 @@ SPEECHD_INSTALL_STAGING = YES
 # speechd source code is released without configure script
 SPEECHD_AUTORECONF = YES
 SPEECHD_DEPENDENCIES = host-pkgconf dotconf libglib2 libsndfile
+SPEECHD_CONF_ENV = ac_cv_prog_HELP2MAN=""
 SPEECHD_CONF_OPTS = --without-kali
 
 # fix missing config.rpath (needed for autoreconf) in the codebase
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
