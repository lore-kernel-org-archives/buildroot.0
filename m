Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566F0F8809B
	for <buildroot@archiver.kernel.org>; Thu, 16 Apr 2026 07:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A1BE80609;
	Thu, 16 Apr 2026 07:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vy9qFWqYlBWL; Thu, 16 Apr 2026 07:35:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F18F8059A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776324907;
	bh=kekwo7BG1P1TEaobquERWNrOr1yGBxz7MCnAece3CY4=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Hvh/u2xsZFPO74E6JzxiQqex7kc2HsPJE8DuZpkhxKct4PMuUT3PhEjl6jqqVbeUs
	 Yvh57x4xGsFm+kSwBjiE149J1F0p2s9vQmcTGcfOBNJT86uVVmd6BNYBHbCHXKJlo2
	 ClmbBUDImPQoRzh05IHkVh7pBBIUAszkajbU+m6DODV/UMmf32+xI3ZGFZ78bToGOW
	 Utz90/riqT7DZwgxDEJvsLm7LMG1o/mQ/Drp+RsLSpoeP12KjF2mAYHKcPYPwZJITG
	 0ixWv+uAEcKoBxhRXjthwI1m2xdCxfh9z+x+kXCWTwZ0/6HQ0F/c8p75z/B2M04oK3
	 XNhCS3D8olEDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F18F8059A;
	Thu, 16 Apr 2026 07:35:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BC3A2CF
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 07:35:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71BA540106
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 07:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lu0y4_fAtLDF for <buildroot@buildroot.org>;
 Thu, 16 Apr 2026 07:35:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 592EB400EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 592EB400EA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 592EB400EA
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 07:35:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf3d.dip0.t-ipconnect.de [79.214.207.61])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7CF09A4C0BEA;
 Thu, 16 Apr 2026 09:35:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56150)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wDHFf-000000007KC-0AzP;
 Thu, 16 Apr 2026 07:35:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 16 Apr 2026 09:35:02 +0200
Message-ID: <20260416073503.3605369-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776324903;
 bh=dcdYHoRBXYHPOdpM0kjCiMzydLKQh0oPIzh56vNZ+2A=;
 h=From:To:Cc:Subject:Date:From;
 b=TWbNOdz1E998x4griVSTjGZRgt+vvV6+3AbWTIt42wdb372630RHle+ber/jJrMC7
 vxpkELCzx1joMJfkFFg/UP8e1G8O11J5XxD9Jd0KHCaMuWHWHFcljdygZxMJtKEDr3
 0xql7ZrXUHfAkkhJDGsZ23AlKvBMFd6DtotkEvMxcKztVHitCRuMi/L/YnifrhO5G9
 FBYz53p60Zqpb9j9ZzntMYq9KscuBsEeM5LhRlaNwW5jyAKxuQUH1aVTGN3hjsTylk
 Ix9hkW7jkUD/dajtPLwPEEVNRNx34xPFwQ99cYvM/FF+c6bcc1iofjRwqEVjssx+Az
 3Ve7q/1Ok6dVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=TWbNOdz1
Subject: [Buildroot] [PATCH 1/1] package/libcap-ng: bump version to 0.9.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/stevegrubb/libcap-ng/blob/v0.9.3/ChangeLog

The source tarball is not distributed on the project site anymore so we
switch to the github helper and need to enable autoreconf.

Added _POST_EXTRACT_HOOKS to fix autoreconf error.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libcap-ng/libcap-ng.hash |  2 +-
 package/libcap-ng/libcap-ng.mk   | 11 +++++++++--
 2 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/libcap-ng/libcap-ng.hash b/package/libcap-ng/libcap-ng.hash
index 022dd1f895..d79ef54d07 100644
--- a/package/libcap-ng/libcap-ng.hash
+++ b/package/libcap-ng/libcap-ng.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  3ba5294d1cbdfa98afaacfbc00b6af9ed2b83e8a21817185dfd844cc8c7ac6ff  libcap-ng-0.8.5.tar.gz
+sha256  fe11ebbb55904763b3532f19069f13ec319042634620180a03bd4653d301563e  libcap-ng-0.9.3.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/libcap-ng/libcap-ng.mk b/package/libcap-ng/libcap-ng.mk
index e544e27696..6bb6b80fc5 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -4,12 +4,19 @@
 #
 ################################################################################
 
-LIBCAP_NG_VERSION = 0.8.5
-LIBCAP_NG_SITE = https://people.redhat.com/sgrubb/libcap-ng
+LIBCAP_NG_VERSION = 0.9.3
+LIBCAP_NG_SITE = $(call github,stevegrubb,libcap-ng,v$(LIBCAP_NG_VERSION))
 LIBCAP_NG_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
 LIBCAP_NG_LICENSE_FILES = COPYING COPYING.LIB
 LIBCAP_NG_CPE_ID_VALID = YES
 LIBCAP_NG_INSTALL_STAGING = YES
+# github tarball does not include configure
+LIBCAP_NG_AUTORECONF = YES
+
+define LIBCAP_NG_CREATE_MISSING_FILES
+	touch $(@D)/NEWS
+endef
+LIBCAP_NG_POST_EXTRACT_HOOKS += LIBCAP_NG_CREATE_MISSING_FILES
 
 LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
 LIBCAP_NG_CONF_OPTS = --without-python3
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
