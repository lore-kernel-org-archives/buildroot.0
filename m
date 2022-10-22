Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06535C433FE
	for <buildroot@archiver.kernel.org>; Sat, 22 Oct 2022 20:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93E3881D4F;
	Sat, 22 Oct 2022 20:59:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93E3881D4F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q0OCvv4lqqlK; Sat, 22 Oct 2022 20:59:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C719481D3A;
	Sat, 22 Oct 2022 20:59:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C719481D3A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3AE281BF275
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 20:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 157C24013B
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 20:59:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 157C24013B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YHFERR34dH8H for <buildroot@lists.busybox.net>;
 Sat, 22 Oct 2022 20:59:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A08D4011B
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1A08D4011B
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 20:59:39 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id w18so9946184wro.7
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 13:59:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D5vF7hqW/l7hz0he865qsVZVl6VbwlitcqCFXqo5UPw=;
 b=jkMwk5OMcpy/rIgx/jFaB998dAA4dtNAQS/KWDIFE3m3gMNeVIm969kSGs/2I6Ufbs
 yyPV+ROBYaOWNd4xoVftcfeyflUnUO0lhVFhHNr22EixVuA7OMIXL8/ZeOIPTY/eH6PO
 /BRLBx70uu+zV20FwlWsULUgjCZX4KODMeGYBDjxVZr8fhqIt2SeGnH6Fi/B13PpB3td
 n0ERQTUyGRaSXPI3s+odcGrEiqVWgANDuu5lrydtEdZQMGBmX3qB3IOB7F035YBrFu/F
 xmzjJgUojX4zWyjtNeILasLeVbGFTLmt8CHUKVsLdurK5vQJ+JfYSuSadwdkUTVa47uB
 Gtog==
X-Gm-Message-State: ACrzQf2EsfzKz6zM3np1lYXVjv+YwPI+i+q0k/CAAOCJr/DV+1Y11/d9
 lBVpJIS+xzMxMuTnVL5PlqpJv4IYEWo=
X-Google-Smtp-Source: AMsMyM74Z6FvFNoycUMpjfI+lsMQzkGjgaJSh/lfm6UCHacy64nqZ6rx77Rqvi87zOT55AAQFjR4hQ==
X-Received: by 2002:adf:ec90:0:b0:22e:6ef1:1849 with SMTP id
 z16-20020adfec90000000b0022e6ef11849mr16803279wrn.695.1666472377949; 
 Sat, 22 Oct 2022 13:59:37 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 h22-20020a05600c351600b003c7084d072csm3698362wmq.28.2022.10.22.13.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 13:59:37 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 22 Oct 2022 22:59:34 +0200
Message-Id: <20221022205934.156714-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D5vF7hqW/l7hz0he865qsVZVl6VbwlitcqCFXqo5UPw=;
 b=FRsg26SMIfi0HUJJimIExdXNjBeIeq3ku0JKnoQYOjTbjgyH+gqTZxDQ2nNQLbdsTM
 Hyeqr7RzfIDpB0TCceVvz+DAJ9xHeTngsP9fApkHNJACRYGQ/1xSmRztGMeSKG/KpMT6
 D2MLFICei+HXlvnELRrEqXo433/636oBmCutaAbEHOrnURfFZo19fNF1KuZtSXIP8efm
 Mk5mgmSu5LNVlGFcEnyiiwxPeQnvHXqEVvfOhIWSwWs4k/ccE8EANlXlQ5O627uYpRK1
 VDnFH561yDbEAMsuA/51afptgLn0eMxRDv5Ld/dx20qrx+yw6PMuCa0V0GwSevBJPo4f
 qhCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FRsg26SM
Subject: [Buildroot] [PATCH 1/1] package/tinyssh: bump to version 20220801
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
Cc: Vadim Kochan <vadim4j@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/janmojzis/tinyssh/releases/tag/20220101
https://github.com/janmojzis/tinyssh/releases/tag/20220222
https://github.com/janmojzis/tinyssh/releases/tag/20220305
https://github.com/janmojzis/tinyssh/releases/tag/20220311
https://github.com/janmojzis/tinyssh/releases/tag/20220801

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tinyssh/tinyssh.hash | 2 +-
 package/tinyssh/tinyssh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tinyssh/tinyssh.hash b/package/tinyssh/tinyssh.hash
index 30b5d13419..462ffb9002 100644
--- a/package/tinyssh/tinyssh.hash
+++ b/package/tinyssh/tinyssh.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  2a051437878998c7782d9d38ef13e5e7a76435ae6b9c3e9ec492c3a567bd6314  tinyssh-20210601.tar.gz
+sha256  234656fc8d369608eb5d0f3a26280e0e38e2e6b134cfc610b6e24bce176acd4f  tinyssh-20220801.tar.gz
 sha256  b5dc19477e29f4111e1c16cd89ec0782f5a07b1a30e3bdb7c155425b81b12c46  LICENCE
diff --git a/package/tinyssh/tinyssh.mk b/package/tinyssh/tinyssh.mk
index 05716bcfe1..1472f7ead1 100644
--- a/package/tinyssh/tinyssh.mk
+++ b/package/tinyssh/tinyssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TINYSSH_VERSION = 20210601
+TINYSSH_VERSION = 20220801
 TINYSSH_SITE = $(call github,janmojzis,tinyssh,$(TINYSSH_VERSION))
 TINYSSH_LICENSE = Public Domain, CC0-1.0
 TINYSSH_LICENSE_FILES = LICENCE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
