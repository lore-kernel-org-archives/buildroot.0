Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D093AC2BA15
	for <buildroot@archiver.kernel.org>; Mon, 17 Jun 2024 12:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EC2481EE0;
	Mon, 17 Jun 2024 12:01:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qEJ5_BzICu-D; Mon, 17 Jun 2024 12:01:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11D1F81EA5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11D1F81EA5;
	Mon, 17 Jun 2024 12:01:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A3D481BF2A3
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 12:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 909E7405EB
 for <buildroot@lists.busybox.net>; Mon, 17 Jun 2024 12:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FlNE6W3eDtae for <buildroot@lists.busybox.net>;
 Mon, 17 Jun 2024 12:00:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.71.1.220;
 helo=relay-b03.edpnet.be; envelope-from=dev.kurt@vandijck-laurijssen.be;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8B4A540556
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8B4A540556
Received: from relay-b03.edpnet.be (relay-b03.edpnet.be [212.71.1.220])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8B4A540556
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 12:00:59 +0000 (UTC)
X-ASG-Debug-ID: 1718625652-24639c5cad86a880001-rUBnyj
Received: from srv21.vandijck-laurijssen.be (77.109.96.193.adsl.dyn.edpnet.net
 [77.109.96.193]) by relay-b03.edpnet.be with ESMTP id 8mYe8C18CN7ABJKh for
 <buildroot@buildroot.org>; Mon, 17 Jun 2024 14:00:52 +0200 (CEST)
X-Barracuda-Envelope-From: dev.kurt@vandijck-laurijssen.be
X-Barracuda-Effective-Source-IP: 77.109.96.193.adsl.dyn.edpnet.net[77.109.96.193]
X-Barracuda-Apparent-Source-IP: 77.109.96.193
Received: from x1 (74.250-240-81.adsl-static.isp.belgacom.be [81.240.250.74])
 by srv21.vandijck-laurijssen.be (Postfix) with ESMTPSA id 62F345A9D0E
 for <buildroot@buildroot.org>; Mon, 17 Jun 2024 14:00:52 +0200 (CEST)
Date: Mon, 17 Jun 2024 14:00:50 +0200
To: buildroot@buildroot.org
Message-ID: <ZnAlcjgzFAilB92v@x1>
X-ASG-Orig-Subj: [Buildroot] [PATCH RESEND] bcusdk: fix build
References: <20240612093118.22195-1-dev.kurt@vandijck-laurijssen.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240612093118.22195-1-dev.kurt@vandijck-laurijssen.be>
X-Barracuda-Connect: 77.109.96.193.adsl.dyn.edpnet.net[77.109.96.193]
X-Barracuda-Start-Time: 1718625652
X-Barracuda-URL: https://212.71.1.220:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at edpnet.be
X-Barracuda-Scan-Msg-Size: 1557
X-Barracuda-BRTS-Status: 1
X-Barracuda-Spam-Score: 0.00
X-Barracuda-Spam-Status: No, SCORE=0.00 using global scores of TAG_LEVEL=1000.0
 QUARANTINE_LEVEL=1000.0 KILL_LEVEL=7.0 tests=
X-Barracuda-Spam-Report: Code version 3.2, rules version 3.2.3.126369
 Rule breakdown below
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=vandijck-laurijssen.be; s=default; t=1718625652;
 bh=HMJtQDJ8WiIEcBsnwH/zJwixMv9zp6KcEjky7UP1dZ8=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=JOKDqK18fpBD8DvzrUAkgpAlsWzQVcGLg+ooMJwzjozIoAl7+6Q6P+S4MgY/35eDI
 Sws6dX7UhfKF5WirKS5veT6FlvshArQDs6sj5oyujT1iCALYC1NPIjZItB2mgtZzUy
 WzhQSpxpOFkPY7kif3D4KMOe6DGBjjFhBWR3mk4uA02/9/ouftZHe4TkEWpdPgXY0l
 58TEdbbOQkEtCs3t+brBOBxKoxeAPZHii3YbAPXDusgGWF55oahIFHvBOFfpHMB7hh
 PIRpbD0UxoWF8ztbu9QXXr3kGIKLpnUi5xw6ENxaWgNAJIt159mFWcafppw/weupb1
 KrwHgahGLfZQg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=vandijck-laurijssen.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=vandijck-laurijssen.be header.i=@vandijck-laurijssen.be
 header.a=rsa-sha256 header.s=default header.b=JOKDqK18
Subject: [Buildroot] [PATCH RESEND] bcusdk: fix build
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
From: Kurt Van Dijck via buildroot <buildroot@buildroot.org>
Reply-To: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

bcusdk is configured without libxml.
This commit removes the autotools libxml dependency.

Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
---
 package/bcusdk/0003-remove-xml-autoconf.patch | 11 +++++++++++
 package/bcusdk/bcusdk.mk                      |  2 ++
 2 files changed, 13 insertions(+)
 create mode 100644 package/bcusdk/0003-remove-xml-autoconf.patch

diff --git a/package/bcusdk/0003-remove-xml-autoconf.patch b/package/bcusdk/0003-remove-xml-autoconf.patch
new file mode 100644
index 0000000000..33ce45fe12
--- /dev/null
+++ b/package/bcusdk/0003-remove-xml-autoconf.patch
@@ -0,0 +1,11 @@
+--- a/configure.in	2024-06-12 11:20:16.800828493 +0200
++++ b/configure.in	2024-06-12 11:18:19.275693151 +0200
+@@ -81,7 +81,7 @@
+ 
+ if test x$onlyeibd = xfalse ; then
+ 
+-AM_PATH_XML2(2.6.16,,[AC_MSG_ERROR([limxml2 not found])])
++#AM_PATH_XML2(2.6.16,,[AC_MSG_ERROR([limxml2 not found])])
+ AC_PATH_PROG(TAS,[m68hc05-as],,[$PATH:$bindir:$prefix/bin])
+ AC_PATH_PROG(TLD,[m68hc05-ld],,[$PATH:$bindir:$prefix/bin])
+ AC_PATH_PROG(TAR,[m68hc05-ar],,[$PATH:$bindir:$prefix/bin])
diff --git a/package/bcusdk/bcusdk.mk b/package/bcusdk/bcusdk.mk
index f14b23c7cc..c572df725d 100644
--- a/package/bcusdk/bcusdk.mk
+++ b/package/bcusdk/bcusdk.mk
@@ -23,6 +23,8 @@ BCUSDK_CONF_OPTS = \
 
 BCUSDK_DEPENDENCIES = libpthsem
 
+BCUSDK_AUTORECONF=YES
+
 ifeq ($(BR2_PACKAGE_ARGP_STANDALONE),y)
 BCUSDK_DEPENDENCIES += argp-standalone $(TARGET_NLS_DEPENDENCIES)
 BCUSDK_CONF_ENV += LIBS=$(TARGET_NLS_LIBS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
