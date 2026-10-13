Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EF0CC6B0E
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 16:43:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A5E980C3B;
	Tue, 13 Oct 2026 16:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WIulGBg_dkuy; Tue, 13 Oct 2026 16:43:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4B3EA80EC1
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791909836;
	b=TAQmytHht5uFIhsrJc482syoM5eW5mUCGZ4ZaPyu1bn1ilevezvQoIgW9JTo3GgdcgFy
	 giczeIgvw1El2HmRAd3H6zAdBVr90km2hMedXxE8LGw1G5iTCdJVPkWh0W2xuBtcxO6gG
	 vLsa+XZktKyTl3BNHfF6/MmgS2AOsW6856iK/0xxKbe7ugSkYWBTvV1D+jIC9qfOZmOSo
	 mxJZTGBZeMUbvRmcE2xJLHfPWie76aa3XEETFYsrGbnBnnl5/0QCBVf+k71LQGmB6cojT
	 79vZqIhTNfRbgxXelIc7JkqC0VV9GfMzh+MNK0IMkSGIoDFWOO6sjqy1TlwLKGbdb3A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791909836;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=7NuVI39D1SmlCOKIrfJ39c+z+I6mHmByVdabFso7wwc=;
	b=BZlCVZ7xOOXy3aqY3UYIgWDCHY/1wL0AVQQxGUWhIvBhkkqq6PPOvXjztBzNHMladjQz
	 SPQnQg1+E6fDE9cpxPCb1R/A9juiWlhrtoY9DlX4KMZ0dLCGVQCRYcvnzWxZ3gZOWQIu3
	 W+zn4pQwPpx8aEUh1zW4qBy3MvhOIJfGzh6BEWJZiQqs1bEYNrLatAu2P1umBCEaKRWx+
	 Igx8aXUj9iHn5ctNJLBCmMfPLfMFTCDgAhkA64KHAhEykxxboxfAtfcjMsHZ3W3U2gkAD
	 rtYL+kGRGXbMtlUbWHDJHJZ4hvgezetIJUwrcIUBMRcEcAe+PEHwGXf6V/jTpR+lZ+g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791909836;
	bh=7NuVI39D1SmlCOKIrfJ39c+z+I6mHmByVdabFso7wwc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=bCBdcNpDitGwqFRGz7LERwMOPPweIQECkKfoAIsl61fKzvOwNQ8aXECKbLbgSvqib
	 bkoCNlGeUTYiMNee8wzaJddoL2+JNzuYrwQj6Wetrmcj1YN7egfzRBhpFPuE88+i/G
	 D9EhtgBriosQgiwPsmREwunHs2MPeLVjedO681uVQsoESdbOlJ44/+c/simebSBtOi
	 JBkebSc+I9YNrlA8J5r4dWk1bdRzwjTcXg9rTbqbkeRzErNwTFJWkhXx4nlq0YKE2D
	 VXZtLsFuSeG3/kRM4Ka2S6XcrqA/Y7xU9RBFxrRtpHHn6GjF/NRO4+B0pxHXg6zGg8
	 JC/Q3tBcuHrMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B3EA80EC1;
	Tue, 13 Oct 2026 16:43:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 64BD61399
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 565FB404F6
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zy_tgQW3jDLE for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 16:43:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 783E84037D
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2001:4860:4864:20::30"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791909829;
 b=Ns4Ir8sqNXNhT66CnQhpKPyH7GPS2ph4IFVHX/U0VDYXcoAQARwlCga4dZ8RRfIhHOrN
 iF83ecAwRjhFcDhUXuJU0XDoMH3zfvgl3iSZSlP2S6x/le7kMrwv82jUuYXw8czVn9NnM
 kLBWQo8oTI/bQOuH2kROIuaQ6maJQfM+cxQi9ZeOLQCtVyhwyNADdAtux5bZCh3GDRaVL
 5Db5wxposbOI4rTjq1ProcxitmfxW/dZsoGlKkMtGOgbFIldFw7IHfCKyPXJ6rOyegfiK
 sorXjg4aNqrwTmEOqBPMSPG0u0jQ3lukWqfdLVDv4rFjGfi9QPhEuVDJhP9L+SEq/4A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791909829;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=N2AIFFy4tLEYhYEnENgQ3/nqyEO1y9dPZUg81gbA5Qo=;
 b=PsyXymOSwJVz56iqHQlkJNMGQO/tHWez5iOOqIBcGF1QAJ8BVitmySzfI+ycn9KmO389
 7dU9C/J1io4eeIu3swPuo1eWwTFLroIkvXN/v73xYHDlo1PMkmLnoibNM5+h+KCFyDQ3E
 dPO8G8tnYVU0r/jTeWaOuqYUyrRl/4fItH9Iodn+gmo/kNRuFckhXsSy2dxGn8rUt1Oy9
 J+y2SsUQvTvr3kLO8YellEDLNmW7687y+uGoSwovWm3IkNs2HDMqxbQO1C7dQIuc0XxhD
 3ujYi3JM4m7XXQxMnuBb0jCY5aq9gHluyPOjUoAkwyir3KFUcz/xT1Ieu6NSSZLMIMw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=a8cNhgbl; 
 arc=none smtp.remote-ip="2001:4860:4864:20::30"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::30; helo=mail-oa1-x30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=a8cNhgbl
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 783E84037D
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 16:43:49 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-4a6bb779d13so792133fac.1
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 09:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791909828; x=1792514628; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=N2AIFFy4tLEYhYEnENgQ3/nqyEO1y9dPZUg81gbA5Qo=;
 b=a8cNhgblRugFcZeofyk3Lty4050Gi9um6fbTAT9W1UiiBe2/IizaieKzZciHZtc+/9
 VgkkJv/1JdCN4FAmwOhapkMbi/IkuTMGp/to5aN9EXlY9m/sK8durbk3VjVYB4UZqazD
 uSYHwNvDETYQtjDNKFIORc/8cLWwu6O+rYPmhIv/TKouFWCMfV2lQykPoDfuEGeUKY84
 1hQVEXMZwJAz0guMdA/3XIym3rQ8w5gItY+dvcqY6FrQZ6jNHeX+rbY/zFXiqrwvJIXc
 Xfmus631Kr81L339edSeOId/Q1e9M/iAJDz+bLAvWqc403iJDgaqUoxa1tLIiRrnfj2H
 jiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791909828; x=1792514628;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=N2AIFFy4tLEYhYEnENgQ3/nqyEO1y9dPZUg81gbA5Qo=;
 b=JqrAmTtP4jYPhrnxh/wPkweezcx2/RID/w9w0yA4RHJgTq0OLFMmWizRPNR/n3cU+v
 y9HImPlrWbV1tIXpxoATr9/FBdT3wkUz79BkSOIuNUItBGBoTQDiQBuHPfOa7EOLr4dK
 XHyYM3idsx3WfWJNZIhjX9rvRpruukV4BkJV22o5O4eaUpge6B+1BZbglBAJQXFIdTU0
 7emc+RQAbK7YOW9Neb5HSsgO0K3o6vaVH8smjWo3yAq0ITqDuprsQEyCDr3x6fxiXJIl
 N/PnY11ZJ4EFI6oUwXi3+/kzb4MthU15VDhIbiQwFlT2f77TVdgVuDF/VyuBCjri8WI6
 mKVQ==
X-Gm-Message-State: AFq9FYIBgx9jEO+es6itw2Yvw/bP5a7s6e9j1WgXDQQonh3rZSmINQ9e
 V8rD1kKZxr3Deuknv/OjxCqs7ngFkczOOxQDcPXKQpPcnT4yYE5JBN3e76TxKg==
X-Gm-Gg: AYBFou2DWh5oHcMsiNi0AvRcASFO9rDpwXxnKCBS72RPQuyGJYmmWkHIg+FzGz9L4KF
 JKueCpXoVp3ysZeO/iTWdxapZCpW2OXw2P7HHOmWta9vd4BAy1g9XjxHqvCP+qRcLfqA/wT1g0W
 zXR8Qz7JD2GYEeSuMa86J0bwFSArwBr4NbvMeCdb7YwpfwHXDqbWg3L0GbZ9P6VSxITe2XPG8FT
 +w6bU744qNNQNRALFPnykjjVHSrIzo3n1mrz5EiK1wTdiKz05j8Kn0ntqgy41pwBdrXPWkDH9cB
 EuAL2ueDz8K0twF80ZbAYnKM6X6KOXFDBgH0ecsVMJUIW4grxhSA6ksPMJ7f1qAolQb8DRQZNOU
 2eNiZRF5zEdXAQsjrE0hJ+QMjjuFdeRDhQrY5mZVPvVtT8sGx4tLnoEyuezFYiyJJbT4f5HKhhq
 PEI90hHRjbMkoizbONUeq7vGVTy8xrPJ3Y1uw7JuHPqy7ZcAiEKXW0LMHfxc5xPO/LGT8LM4QLA
 ALOxRFM1tWGawvu21oKaXlW6593SAC3gPiY/xD2gsAkIOkwrK+hIsuYAUtAuX2QqMMeZJLhg+q5
 aIIPhZWuYa0raAiJPdxMT8aZumfPr90FCBFA6NY1r9HWEFGmC3xFMQnSSzynT2NN5o8SMgZoUan
 fxDGKw/tf6eT3D2C8jf0DP/glWzc1g9AluGEFUQmeXyE=
X-Received: by 2002:a05:6871:889:b0:490:ee5:c1a with SMTP id
 586e51a60fabf-4a2a86a6961mr11707579fac.8.1791909828352; 
 Tue, 13 Oct 2026 09:43:48 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4a6df881fbfsm200254fac.2.2026.10.13.09.43.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Oct 2026 09:43:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 13 Oct 2026 10:42:19 -0600
Message-ID: <20261013164254.1476592-33-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-sqlalchemy: bump to version 2.1.4
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
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 4 ++--
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index b9f597861d..aec7295d88 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5  2b235deb7bfe0a97a716c99c66ba3964  sqlalchemy-2.1.3.tar.gz
-sha256  ade5281df06038c6394f532590d592d3381ee5d11b9e0006a2570aef41145118  sqlalchemy-2.1.3.tar.gz
+md5  9f267c2c350584b2b9a52d17611a4d25  sqlalchemy-2.1.4.tar.gz
+sha256  7bd7ad604487daa7eab8716471c29a7185f17b5287ce73bb7bc79fea050d8cfd  sqlalchemy-2.1.4.tar.gz
 # Locally computed sha256 checksums
 sha256  e862bb5b904fb5513c3e14288d7a25a12eb0ecc7847a0a965d310e9a955e7cb9  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index e38f49a4b4..2920680517 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 2.1.3
+PYTHON_SQLALCHEMY_VERSION = 2.1.4
 PYTHON_SQLALCHEMY_SOURCE = sqlalchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/02/4b/81d972a46c9f1d978af1795e2abc988855c711453552cb45d75f6e4abbf5
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/1f/44/311bac6b6ef81e4dfd0287d04900108b1f5c00c9761dd3c0a2b7b9d0f86b
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
