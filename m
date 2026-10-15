Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D597CC6B38
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 21:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 177DA60AFB;
	Thu, 15 Oct 2026 21:52:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jP7_pau5vjvH; Thu, 15 Oct 2026 21:52:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 24AE360ACF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792101159;
	b=K6+BkwR+TQFx/wnYgTjl/oPFw0nv98mlGXQeHxFtYKhAlCEyX31mM3juc6bQn5fIG7Kw
	 1NLj0RnzEMS3XrrvV0INqYuGnO+cgSSd1Zvv3IXCa2mgDRgvUq2uj6kGWcrXV1Y3fwt+M
	 viIsPAQW/XDEv+6xwXgm+VqXoZbUS5eOVOTgPgJnBwH4Y4Hos/cR4WyeSd2dgQcThfTv8
	 bBsudgKhq4Kmay1zXi9mtjXpyFZanF1fLsdkZO5eo/lejPxv4nnG/jb3e/Ii/alQxMBXo
	 zcBKhZsbnCK9ytsqw2y6tNTjmjfM0BTmV3zy1eU0rzaruYI4zohhRK6ZNpebP/HOCUA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792101159;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=T+Ae2coAK2DH1X7f6AuICXey11NZOcSqwWgVkfcTZmU=;
	b=QGe2ELR2+BVEoy7X7emVws6lK63goq17Om4tEx+tYOmtEkqlXpSP2drjfLNNUINfVm+z
	 AwpHuY4586gF+2kTzh4r9AdmYk6uhbJD6LTtIVZJ5caw2m+3OeO1YwvDT/0UJgxWuUWyv
	 zdZm3DyGt8UYKMkMzFnRipaLpIjYRTCaDEH9dG/tmHuBjXBp9xvcOiVAIG7Luwp39lNft
	 LrKyeQp2qjB/WHj/1TP9WOnDG9R1hTYrz+SxibdHocxczB/yurqI331bUxzWcUT7EkmCZ
	 b7uEpYs7LqFc/x5rQ0hyAtGCrWrPAYgfTquJLCNm2o2vMIQpLby79woXA27p2rUe7Fg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=B7aMIgHt;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792101159;
	bh=T+Ae2coAK2DH1X7f6AuICXey11NZOcSqwWgVkfcTZmU=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=XXy1QXvNkGZ2UJldBWLpZiecbZNnrqUfxp67NlA/B5ekeWGI9bWtC6dPm3a+JPFgu
	 t3IG7v0WJcTNxxYYI0k5QenYbA8jgVAjGDWMEiodopkS/jKfHfAvFz0H5wWvyfyNJm
	 Pj4PFI8wgr+PJJfFmmDu8tJ/654/dGxerLADIHXfiaNRvP3jRuCg0vxe3X4k/rLgHJ
	 r021DoT8bDzYsKaMwn1ePP0zGyBIeZ/3lO4MmlOliYX/j/IUWXAMFXPkGPzzP+gwou
	 TMSu3WpAIKdtG8upa8bioz4uU79Py2Y4NWarb5oZk/Y40C6KkeMGEkDeG+Nj90JUy9
	 VAyzjFqh70hgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24AE360ACF;
	Thu, 15 Oct 2026 21:52:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B727B332
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A689160AEA
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ywHSTyHlpSpD for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 21:52:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9F28860AF5
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::236"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792101155;
 b=ebp6GnnSSSWXXkxlB0DPm4OnhdQAUC/Ozzi8/S159dOAFgdeFgVtRhDWCLJYToYPdSSZ
 8rf/u64fRPAu7dA6U6i6HsfeCkop51uLXli/4k/kv+R+bpgQNKJ8duJ/jccF3W6DzrTDV
 P4Z959ZamFCBo04CWJUFKLDvDU1hczExjRa3ajpBOf5pVegZk01LQyM32xxecj5GvYdHf
 bfEqz5XBCG3Layh6w6+NdZuwrfcXSA0GUqPr6gas1YUXo8gkRbiz3SzhyorhoggT9n7qu
 zyvLlt/5BauerIkq1j2i0y1DLHrF8P1KDffpP9FHPPpQoekWVDFAMd0BHuP9XQGV7jA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792101155;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=HC08c1k2OlSNETid+548WHs3fDBNRpyD8MjQi5Wl6Dc=;
 b=bd3ROjahsAsfIGl0c2AAvpQY+vHbMAFBg99tyr0JoV0FIqi64COlay61fwA0/HIq4iIJ
 jBS1zRMDASy9YSBDZIRX5zIsBa9/lsEWIQg/Bl3gOlNMTbhHPcrvBpDHzUkFu0QZq3IfE
 7B6gE/8ddHvLjT+U08TQ1FttSDvYSFsF9JbA1tPTaYrEs+hF+USX3uPQgfGGuIzt0mCfW
 +uKaIxPpmYHA+JyI5Y5tvvADgWdXLX/n7wjpAZvLUGY4cfDxLsMG8r7x3dCDIh2ehHVLY
 6Y9xdF3jHOJwksUZiALJ6SfFUCrdZh1PNs+tzWwAPzn4DAdxZ8+MdZSEfveJlOFiYGg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=B7aMIgHt; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::236"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::236; helo=mail-oi1-x236.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=B7aMIgHt
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F28860AF5
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 21:52:35 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id
 5614622812f47-4af7283bf83so2411146b6e.3
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 14:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792101154; x=1792705954; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=HC08c1k2OlSNETid+548WHs3fDBNRpyD8MjQi5Wl6Dc=;
 b=B7aMIgHtAze4QtWWmNJh1yIvwzfgOg4iOFy5qHnhykR7kS+hB2vShuyDDNdQaRAFRk
 sNBKxqEp7xdZBrhBL8yevU64VvR/9pUYiPo5La0lfzfwK0EjV1voPkX4cJOycWmaCZIf
 rc2F1Cdlbncu3M3PGk9vtYk7m6nK4FqxgW4++hzbTn6+hdBVvco4g8m3lCu2wESGp6Nv
 7nF8QHIsfEzkU2CWHASs1WcG9ky0ZlXxoJL0sFi3L+G6/dcYeMADZubsJ9TnY6YQfy16
 v7BQrw3WD8ucmXbZt1tI5wJKqkSeTwnAuWWqMIbSOlHA+Vwa977Zsk6ldazuDKd9ytA+
 3ydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792101154; x=1792705954;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=HC08c1k2OlSNETid+548WHs3fDBNRpyD8MjQi5Wl6Dc=;
 b=hxMSJ9Huu/siBlPeJBd2vgCjNQLNCfdqv1k25jwobhFLHJOMdBFJ6O9bvPoJimmCfk
 AxoD9ufXkfQeNlJXjAGkiDBtJ753rxXON8zrI91nleXKSYGlE8FNA4IoPNpHi7QUncVB
 Q6PIR3KT3uGPrCpikJvHVvPyfvJvdZFe8eT7MGu22BRqctRsSbPCKdDUro8IwcWGNz0v
 sUS5FzOnfhXQfK+zIgcQsmEyZDMXKJQ0lSaP/isQCFARkd6lGb1Ki/s8wAkkOi5uMBfx
 3/OmcJaAiweC+s2erM3xJ5EZQo3mPQY3KFsA7Uyab0ZhqvE+YXakD8hFz4CyesPnud42
 Vkqw==
X-Gm-Message-State: AFq9FYLoDaj1E7VnIsxdvCPakWXowHDQyjzlBg6RhvfKH47ID0VSlmR6
 1xJbT4Lhw97/HPbE8b4B/Z0YDW5AtCt/VaxGN4rt57Dp9rxnbUzd4Ih9+METig==
X-Gm-Gg: AYBFou0H9vcpBjJ3wFQ4Sfg9VWlV8kpVD9mLnSdM08dOZSQDCOm8diRLSF9f+N00l2K
 2zQS3fvJc/nLVHyZK4BtcJfPX9G7I38htIsaiNuVdH6zAOjTiPvJiuGkGDpBbdwrzVniy/xlccU
 iIk2hR24DQK3ki6MIyZH8moQAvMHNM2xtCVR+ckDo++K2ZXJmuhdPNIXl2mv5WepVsNhQWeFUuh
 ZNqGa4Sj4/O9T8JPmnLsZb9AZfwld9O73zhq+/IorVNkkv8y68XSVT1lJgvKmB0lt4MRi+0S13l
 KmLRZ3R2qqxjC8Ystq16b41nytrvpW87dQsUjXn/7DmHadbQC9hTRzn7guzzrWef37Mw7IXFWR+
 CObIOEsPmOYXsk47CbOAYS7WkCdnmKRnOB+9ky8UFfmKZOHG5jaKQdX6qlxzSniJLbK5wqQqqKa
 GLBPMM9XY1tcIsA9C9cVK3HzHgRPmRCQbNnSuv7Kq0F5x7NMCBbjUaxmdyrrSaNZnBURoR6lJc2
 B0reKk38BQyeVlol/Jfk5/acPJLSpmDMiJMw111JY24PWyGatpgMsZKy9PdU22MOKT+XGrxszcR
 awgNm7XJDA6BaN3qwuj2SavucmxGBjMEmiVyDwR9OG8cEUAi6jP3SgnPS0T8IqW3p9RrDpTHPg2
 h2pJMM6nbnSbj0iaiT0FbGJIHRWkyA2fIsPcP6NAY0hw=
X-Received: by 2002:a05:6808:1310:b0:4f5:7723:4c9c with SMTP id
 5614622812f47-50c51bc454dmr15854488b6e.30.1792101154272; 
 Thu, 15 Oct 2026 14:52:34 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 5614622812f47-53874e0e65bsm145114b6e.0.2026.10.15.14.52.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 14:52:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Oct 2026 15:51:49 -0600
Message-ID: <20261015215210.3426895-13-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-serialx: bump to version 1.14.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-serialx/python-serialx.hash | 4 ++--
 package/python-serialx/python-serialx.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-serialx/python-serialx.hash b/package/python-serialx/python-serialx.hash
index 603e515ead..ae0d9d8d02 100644
--- a/package/python-serialx/python-serialx.hash
+++ b/package/python-serialx/python-serialx.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/serialx/json
-md5  f4daa494184f90a7cc3381fe498c7f88  serialx-1.13.0.tar.gz
-sha256  0f9ecfb157ff04beb280cd01fce6cca36a5092af861dbb31072e636bd3b8f547  serialx-1.13.0.tar.gz
+md5  2e3b6725772273c234aa24ee08b384ca  serialx-1.14.0.tar.gz
+sha256  508fbc83290b2c368cc3cc034bc2a30fa083d1bdcfae6755a1175f6ec14c8af1  serialx-1.14.0.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-serialx/python-serialx.mk b/package/python-serialx/python-serialx.mk
index 0dc1f46ec4..67de7a698f 100644
--- a/package/python-serialx/python-serialx.mk
+++ b/package/python-serialx/python-serialx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SERIALX_VERSION = 1.13.0
+PYTHON_SERIALX_VERSION = 1.14.0
 PYTHON_SERIALX_SOURCE = serialx-$(PYTHON_SERIALX_VERSION).tar.gz
-PYTHON_SERIALX_SITE = https://files.pythonhosted.org/packages/07/a8/aec21f8a6d23be84a9dd9eb9259f3f2feec2b5169eefb2fd647d3a14d5e0
+PYTHON_SERIALX_SITE = https://files.pythonhosted.org/packages/19/46/a23c683d997c5d46f34e777abb7f4b0e41e189b115a9f6995812e404595c
 PYTHON_SERIALX_SETUP_TYPE = setuptools
 PYTHON_SERIALX_LICENSE = Apache-2.0
 PYTHON_SERIALX_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
