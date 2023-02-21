Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060E5C61DA3
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 17:23:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90FF3612E0;
	Tue, 21 Feb 2023 17:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 90FF3612E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5rrOkDC079tH; Tue, 21 Feb 2023 17:22:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C518861230;
	Tue, 21 Feb 2023 17:22:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C518861230
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D2311BF42C
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 17:22:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A93A40C33
 for <buildroot@lists.busybox.net>; Tue, 21 Feb 2023 17:22:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A93A40C33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XXt1X7EjUaMG for <buildroot@lists.busybox.net>;
 Tue, 21 Feb 2023 17:22:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D044400D9
Received: from mail.xes-mad.com (mail.xes-mad.com [162.248.234.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D044400D9
 for <buildroot@buildroot.org>; Tue, 21 Feb 2023 17:22:19 +0000 (UTC)
Received: from vfazio2.xes-mad.com (vfazio2.xes-mad.com [10.52.16.113])
 by mail.xes-mad.com (Postfix) with ESMTP id 38A522024E;
 Tue, 21 Feb 2023 11:22:18 -0600 (CST)
From: Vincent Fazio <vfazio@xes-inc.com>
To: buildroot@buildroot.org
Date: Tue, 21 Feb 2023 11:21:53 -0600
Message-Id: <20230221172205.2450111-3-vfazio@xes-inc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230221172205.2450111-1-vfazio@xes-inc.com>
References: <20230221172205.2450111-1-vfazio@xes-inc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=xes-inc.com; s=mail; 
 t=1677000138; bh=MxvUNsDDlTjpUI9B7jAXAA/WICe4wF1sp0U1h7+YELw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=v55CP2DSgSjQy5UX3HOFnPO7rGFvht5OGK6BhSdDTcJ2EkyxWIbnuMQhF0gK2a4cI
 HW7sJ5WM/0sPOzkaDlZuvn1vp01cLdc7JMzanOO06extyXMshqaZMOQ8sHMhFGwRH5
 gSQF5q68pPhSXJ0c4Om0UsBCTXzMSk+0Xi4sVbpA=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=xes-inc.com header.i=@xes-inc.com
 header.a=rsa-sha256 header.s=mail header.b=v55CP2DS
Subject: [Buildroot] [PATCH 03/15] package/pkg-autotools: set AUTOPOINT via
 AUTOCONF_ENV
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Vincent Fazio <vfazio@gmail.com>, Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Vincent Fazio <vfazio@gmail.com>

Previously, AUTOPOINT was hardcoded to /bin/true in autoconf.mk.

Moving the definition of this variable into AUTOCONF_ENV as part of the
autotools infrastructure will allow us to conditionally set the variable
based on package flags to support migrating away from FOO_GETTEXTIZE.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 package/autoconf/autoconf.mk | 2 +-
 package/pkg-autotools.mk     | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/autoconf/autoconf.mk b/package/autoconf/autoconf.mk
index 7e0850422b..3cac20cc34 100644
--- a/package/autoconf/autoconf.mk
+++ b/package/autoconf/autoconf.mk
@@ -23,4 +23,4 @@ $(eval $(host-autotools-package))
 # variables used by other packages
 AUTOCONF = $(HOST_DIR)/bin/autoconf -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
 AUTOHEADER = $(HOST_DIR)/bin/autoheader -I "$(ACLOCAL_DIR)" -I "$(ACLOCAL_HOST_DIR)"
-AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" AUTOPOINT=/bin/true GTKDOCIZE=/bin/true $(HOST_DIR)/bin/autoreconf -f -i
+AUTORECONF = $(HOST_CONFIGURE_OPTS) ACLOCAL="$(ACLOCAL)" AUTOCONF="$(AUTOCONF)" AUTOHEADER="$(AUTOHEADER)" AUTOMAKE="$(AUTOMAKE)" GTKDOCIZE=/bin/true $(HOST_DIR)/bin/autoreconf -f -i
diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 55d95d204e..418cd10945 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -241,6 +241,7 @@ ifeq ($$($(2)_GETTEXTIZE),YES)
 $(2)_PRE_CONFIGURE_HOOKS += GETTEXTIZE_HOOK
 $(2)_DEPENDENCIES += host-gettext
 endif
+$(2)_AUTORECONF_ENV += AUTOPOINT=/bin/true
 $(2)_PRE_CONFIGURE_HOOKS += AUTORECONF_HOOK
 # default values are not evaluated yet, so don't rely on this defaulting to YES
 ifneq ($$($(2)_LIBTOOL_PATCH),NO)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
