Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA3ACE8B367
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 21:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05BF2608A3;
	Tue,  3 Feb 2026 21:32:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oy9MoI5oecBo; Tue,  3 Feb 2026 21:32:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB0DF608D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770154371;
	bh=CylNFlnx4eT8IIrzx6cK8G7YyyaDn0rDkDUGMD7Nds4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sGXdoGhyhMWKSdXX1BdQBkuFdVXEaa5Ei10irD9Bc6T/rdRDJMfuNTENewjIA+US+
	 2uprL3YEJn3jxZRZb+Z7CG36lJCW2r90vauILAYrbCNttbURg2Z+eStYiENijvoqqh
	 KgMpY/PDYPES9nw3xA3BcIC2hcVV0421hsxwAj77mcztaK/J/7XGyiGmDsD04Ce/Ok
	 uT5asOooqWDkIwYIxc4Tu29TIUyaJ8FPcJ3wwUr1MkZ38VDi73UlB/c7dIIZ8jyqt5
	 EwiVXYyGZ9z1vwg4CGYphLCnT90kzOMNf0b5VaolLydaXNKK+DQW++DYx4DdRIv/jh
	 Z5LDlTUP/3hSA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB0DF608D4;
	Tue,  3 Feb 2026 21:32:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EC20BF4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:32:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D6B2540471
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:32:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fe_88R_vwt2M for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 21:32:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D58604030E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D58604030E
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 21:32:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7CD88673C; Tue,  3 Feb 2026 21:32:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 22:12:51 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6d5f9b835a5beab2179e824fc28f68990a282c6b
X-Git-Newrev: 73a16fe1d3947e6970e20b6edc2c7ccabc3c9ec1
X-Patchwork-Hint: ignore
Message-Id: <20260203213244.A7CD88673C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dpdk: make drivers selectable
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=73a16fe1d3947e6970e20b6edc2c7ccabc3c9ec1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add BR2_PACKAGE_DPDK_DRIVERS_LIST to control which DPDK applications are
built:
  - empty : use DPDK defaults
  - none  : disable all drivers (-Ddisable_drivers='*/*')
  - list  : pass to -Denable_drivers= (comma-separated)

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
[Julien: slightly change the drivers Config.in help text:
 - rename net/ixgbe to net/intel/ixgbe
 - change find -maxdepth value to 3
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dpdk/Config.in | 21 +++++++++++++++++++++
 package/dpdk/dpdk.mk   |  9 +++++++++
 2 files changed, 30 insertions(+)

diff --git a/package/dpdk/Config.in b/package/dpdk/Config.in
index 7d4a002002..36876e349d 100644
--- a/package/dpdk/Config.in
+++ b/package/dpdk/Config.in
@@ -43,6 +43,27 @@ config BR2_PACKAGE_DPDK_EXAMPLES
 config BR2_PACKAGE_DPDK_TESTS
 	bool "Install tests"
 
+config BR2_PACKAGE_DPDK_DRIVERS_LIST
+	string "List of enabled drivers"
+	help
+	  Controls which DPDK drivers are built.
+
+	  Values:
+	   (empty): use DPDK defaults
+	   none   : build no drivers
+	   list   : e.g. "net/virtio,net/intel/ixgbe"
+
+	  To list possible drivers found in the DPDK source tree:
+	    find drivers -mindepth 2 -maxdepth 3 -type d \
+	    ! -printf '%P\n' | sort
+
+	  Note: providing manually a list of dpdk drivers to enable
+	  does not automatically enable its dependencies (internal or
+	  external). It is the user responsiblity to add internal dpdk
+	  dependencies in this list, and/or select the relevant
+	  Buildroot packages for external dependencies. DPDK
+	  configuration will fail in case of missing dependencies.
+
 endif
 
 comment "dpdk needs a glibc toolchain w/ threads, gcc >= 4.9, headers >= 4.19"
diff --git a/package/dpdk/dpdk.mk b/package/dpdk/dpdk.mk
index 4843ba2667..829b0cc640 100644
--- a/package/dpdk/dpdk.mk
+++ b/package/dpdk/dpdk.mk
@@ -47,6 +47,15 @@ else
 DPDK_CONF_OPTS += -Dexamples=
 endif
 
+DPDK_DRIVERS := $(call qstrip,$(BR2_PACKAGE_DPDK_DRIVERS_LIST))
+ifneq ($(DPDK_DRIVERS),)
+  ifeq ($(DPDK_DRIVERS),none)
+    DPDK_CONF_OPTS += -Ddisable_drivers='*/*'
+  else
+    DPDK_CONF_OPTS += -Denable_drivers='$(DPDK_DRIVERS)'
+  endif
+endif
+
 ifeq ($(BR2_PACKAGE_DPDK_TESTS),y)
 DPDK_CONF_OPTS += -Dtests=true
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
