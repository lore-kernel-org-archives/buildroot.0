Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 421D9F8E4BC
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 07:59:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0092F40D41;
	Fri, 17 Apr 2026 07:59:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m8GEgP9WOg48; Fri, 17 Apr 2026 07:59:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 506FD40D37
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776412781;
	bh=DEan35v5ndRTB+Z3mzkZ6+2eaw0YnLVldptIQk6EEg8=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PZClgT4/SvFdDe/sVH0tExVGaWDKM2vB90F/UaWIs/iOrKZrUggYq4kTlTy7Z8YrY
	 2f/V3a01rxcaqzYlx9rSRI2+qBVPkkIfeoT+xLxbYMnyBKtNLUxosYaLJFZNfZiy+P
	 93juCvAscW3zhBHaEEircg+6e8bP8IeUSMRX7D2J/DC9c0aNSlVToGmyR0kS8eJQBD
	 oFUySH9STVUmDhAWgyC6Ko02vMyHBgTTzxxgYRiqTfZftEhgd7esjckWnxmDlLQp82
	 8bsOOfRudNfRSt0sUfnOLWG2QreKICCDCzX3a8RZ0w8MehWYKwHWho0TerYK4Zx7Th
	 XU7n4/wF3MUkA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 506FD40D37;
	Fri, 17 Apr 2026 07:59:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 15DD9270
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 07:59:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 031D5400B9
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 07:59:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z8RxOvipKEiF for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 07:59:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C37D640565
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C37D640565
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C37D640565
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 07:59:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bf30.dip0.t-ipconnect.de [84.161.191.48])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A3A49A4C16B3;
 Fri, 17 Apr 2026 09:59:36 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57192)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wDe6y-000000007Jg-0PdY;
 Fri, 17 Apr 2026 07:59:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 17 Apr 2026 09:59:36 +0200
Message-ID: <20260417075936.3539214-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776412776;
 bh=7TGz5MXJZ0ozUKj4OVHF8SXAbKmiiXcDVj8rzlIvSQA=;
 h=From:To:Cc:Subject:Date:From;
 b=WTMwCIjsvEL/H8LQkcZkdV10sfNq1hh4GqG53hm3JVGOMD6/r96Al/zKV7djlhn6C
 pgzLL7By5E1lm18wS7pmlF02oSEpOkA7QY341xTw4rWkS0J9zYxwepBTf66jCpu5Sc
 r6sTmG2DJlm5fiCfB9MPPU1zZgw1za09JqIaKzQZ53a9I8VV+cspsTx5UbA4UqYtlt
 4Tb/akrZlZ686OM3y1jlEJq6Ci0ilEEyPjY9jxkod0c2ZFvEuR+f357kr/nZVOVS0I
 dIcjmh5kK42yH9cpIjgvy7p9eWXN9q7d2XwpR04eTnVNB4q3myrDw5T3i8d0XFvGih
 gdfGOnEkqPy0g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=WTMwCIjs
Subject: [Buildroot] [PATCH v2 1/1] package/libcap-ng: bump version to 0.9.3
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

Added _POST_EXTRACT_HOOKS and dependency to host-pkgconf to fix
autoreconf errors.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: fixed autoreconf (Julien)

 package/libcap-ng/libcap-ng.hash |  2 +-
 package/libcap-ng/libcap-ng.mk   | 16 ++++++++++++++--
 2 files changed, 15 insertions(+), 3 deletions(-)

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
index e544e27696..31e0ff8d64 100644
--- a/package/libcap-ng/libcap-ng.mk
+++ b/package/libcap-ng/libcap-ng.mk
@@ -4,13 +4,25 @@
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
+# needed for autoreconf
+LIBCAP_NG_DEPENDENCIES = host-pkgconf
+HOST_LIBCAP_NG_DEPENDENCIES = host-pkgconf
+
+define LIBCAP_NG_CREATE_MISSING_FILES
+	touch $(@D)/NEWS
+endef
+LIBCAP_NG_POST_EXTRACT_HOOKS += LIBCAP_NG_CREATE_MISSING_FILES
+HOST_LIBCAP_NG_POST_EXTRACT_HOOKS += LIBCAP_NG_CREATE_MISSING_FILES
+
 LIBCAP_NG_CONF_ENV = ac_cv_prog_swig_found=no
 LIBCAP_NG_CONF_OPTS = --without-python3
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
