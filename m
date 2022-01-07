Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C86C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 22:11:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 249BD40010;
	Fri,  7 Jan 2022 22:11:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jSpSBecypRTo; Fri,  7 Jan 2022 22:11:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E101400AB;
	Fri,  7 Jan 2022 22:11:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 357C91BF30A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 245FE429BA
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 22:10:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 21AO9hruTPvh for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 22:10:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 69A2A4299F
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 22:10:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 87472814EC; Fri,  7 Jan 2022 22:04:47 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 7 Jan 2022 23:10:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 69255af2299cdde0a8d6276952a867a2cb58889a
X-Git-Newrev: 62c2da0e7a54e96a12190bcaa79e552b497e634b
X-Patchwork-Hint: ignore
Message-Id: <20220107220447.87472814EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netdata: add prometheus remote
 write backend support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=62c2da0e7a54e96a12190bcaa79e552b497e634b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

prometheus remote write backend depends on protobuf and snappy and is
enabled by default since the addition of the package in commit
1d2bb469078b5818aa2390b9868cd632200f17a2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netdata/Config.in  | 19 +++++++++++++++++++
 package/netdata/netdata.mk | 10 ++++++++++
 2 files changed, 29 insertions(+)

diff --git a/package/netdata/Config.in b/package/netdata/Config.in
index 88f88cb7ed..34d139125d 100644
--- a/package/netdata/Config.in
+++ b/package/netdata/Config.in
@@ -16,6 +16,25 @@ config BR2_PACKAGE_NETDATA
 
 	  https://github.com/netdata/netdata
 
+if BR2_PACKAGE_NETDATA
+
+config BR2_PACKAGE_NETDATA_PROMETHEUS
+	bool "prometheus remote write backend"
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+	depends on BR2_INSTALL_LIBSTDCPP # protobuf, snappy
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
+	select BR2_PACKAGE_PROTOBUF
+	select BR2_PACKAGE_SNAPPY
+	help
+	  Enable prometheus remote write backend
+
+comment "prometheus remote write backend needs a toolchain w/ C++, gcc >= 4.8"
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
+
+endif
+
 comment "netdata needs a toolchain w/ NPTL, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 	depends on BR2_USE_MMU
diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
index b20d5ea37b..6def59764a 100644
--- a/package/netdata/netdata.mk
+++ b/package/netdata/netdata.mk
@@ -61,6 +61,16 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 NETDATA_CONF_ENV += LIBS=-latomic
 endif
 
+ifeq ($(BR2_PACKAGE_NETDATA_PROMETHEUS),y)
+# Override the result of AC_PATH_PROG([CXX_BINARY], [${CXX}], [no])
+# which fails because CXX is set to the full CXX binary path
+NETDATA_CONF_ENV += ac_cv_path_CXX_BINARY=yes
+NETDATA_CONF_OPTS += --enable-backend-prometheus-remote-write
+NETDATA_DEPENDENCIES += protobuf snappy
+else
+NETDATA_CONF_OPTS += --disable-backend-prometheus-remote-write
+endif
+
 define NETDATA_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 755 package/netdata/S60netdata \
 		$(TARGET_DIR)/etc/init.d/S60netdata
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
