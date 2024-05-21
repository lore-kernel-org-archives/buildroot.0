Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D67BC25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 10:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1ACD981E28;
	Tue, 21 May 2024 10:32:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6FBabvBz3PF; Tue, 21 May 2024 10:32:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F07C18200B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F07C18200B;
	Tue, 21 May 2024 10:32:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C33F71C511B
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 10:32:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEA27404CE
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 10:32:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Px63faz1S_Bg for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 10:32:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 624E4401EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 624E4401EB
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 624E4401EB
 for <buildroot@buildroot.org>; Tue, 21 May 2024 10:32:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 25D5762121;
 Tue, 21 May 2024 10:32:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73831C2BD11;
 Tue, 21 May 2024 10:32:14 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Tue, 21 May 2024 13:31:54 +0300
Message-ID: <20240521103154.32660-4-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521103154.32660-1-jarkko@kernel.org>
References: <20240521103154.32660-1-jarkko@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1716287534;
 bh=MsQWMWG3R8eNdBDxqEwLdVQmoDGIMsjK3w9gSKZhj5c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rUxoljJnJRobIU3qaQDz+CsJwRLFjwfGYZ2DSqQdQmwsJSRB1z+G6tV8dAbHZxeWg
 DW3g1zY3+U9Tsn8nypDAMNisS9u27AUcLAb5BVYoxuxIwRi6mj1PIHwg871F+JzxjR
 jXRihg4qHtg+e6xGxqqOQt+z9D8RpCkIgpTt/Jg9VeGZXUmCREOkG3OE1IYFQDVm5b
 mFAb9iSl3Xr8bn18GiO3MYyIJqm5aF2SmSp+00Gge+gsfL21SGfqfjGxvUDZrmtqBZ
 +IxcM3bvVAqVGp2Vm+uhg3KLcjUkFnl0r9B7SRgKBdcT8FQM8vcg6jXlERQpjup3gw
 NFoC5b0zUOpVw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=rUxoljJn
Subject: [Buildroot] [PATCH v4 3/3] package/swtpm: add host package
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
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The SWTPM package provides TPM emulators with different front-end
interfaces to libtpms. TPM emulators provide socket interfaces (TCP/IP and
Unix) and the Linux CUSE interface for the creation of multiple native
/dev/vtpm* devices.

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
v3:
- Remove libtool from Config.host.in.
v2:
- Remove libraries from Config.host.in.
- Put deps line-by-line.
---
 DEVELOPERS                   |  1 +
 package/Config.in.host       |  1 +
 package/swtpm/Config.in.host | 11 +++++++++++
 package/swtpm/swtpm.hash     |  2 ++
 package/swtpm/swtpm.mk       | 24 ++++++++++++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/swtpm/Config.in.host
 create mode 100644 package/swtpm/swtpm.hash
 create mode 100644 package/swtpm/swtpm.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index db0dc702a8..732002f85b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1521,6 +1521,7 @@ F:	package/libvirt/
 N:	Jarkko Sakkinen <jarkko@kernel.org>
 F:	package/libtpms/
 F:	package/quota/
+F:	package/swtpm/

 N:	Jason Pruitt <jrspruitt@gmail.com>
 F:	package/librtlsdr/
diff --git a/package/Config.in.host b/package/Config.in.host
index 986b2854d0..0cf9dc3897 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -110,6 +110,7 @@ menu "Host utilities"
 	source "package/starfive-spltool/Config.in.host"
 	source "package/sunxi-tools/Config.in.host"
 	source "package/swig/Config.in.host"
+	source "package/swtpm/Config.in.host"
 	source "package/swugenerator/Config.in.host"
 	source "package/systemd/Config.in.host"
 	source "package/tegrarcm/Config.in.host"
diff --git a/package/swtpm/Config.in.host b/package/swtpm/Config.in.host
new file mode 100644
index 0000000000..0dd984ff8d
--- /dev/null
+++ b/package/swtpm/Config.in.host
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_HOST_SWTPM
+	bool "host swtpm"
+	help
+	  Compiles SWTPM software TPM emulator for the host.
+
+	  The SWTPM package provides TPM emulators with different
+	  front-end interfaces to libtpms. TPM emulators provide socket
+	  interfaces (TCP/IP and Unix) and the Linux CUSE interface for
+	  the creation of multiple native /dev/vtpm* devices.
+
+	  https://github.com/stefanberger/swtpm/wiki
diff --git a/package/swtpm/swtpm.hash b/package/swtpm/swtpm.hash
new file mode 100644
index 0000000000..934d3b6ee0
--- /dev/null
+++ b/package/swtpm/swtpm.hash
@@ -0,0 +1,2 @@
+sha256  b281b4e8c39f68e1928675f788abc70072e4081152e129144359a8c5c304c06b  swtpm-0.8.2.tar.gz
+sha256  19d27d6e96d07022e5e688f75c974f1ceb9aae9e90e0fccae68666d02099cc4b  LICENSE
diff --git a/package/swtpm/swtpm.mk b/package/swtpm/swtpm.mk
new file mode 100644
index 0000000000..f1e42a8bef
--- /dev/null
+++ b/package/swtpm/swtpm.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# swtpm
+#
+################################################################################
+
+SWTPM_VERSION = 0.8.2
+SWTPM_SITE = $(call github,stefanberger,swtpm,v$(SWTPM_VERSION))
+SWTPM_LICENSE = BSD-4-Clause
+SWTPM_LICENSE_FILES = LICENSE
+# Straight from the git repository:
+SWTPM_AUTORECONF = YES
+
+HOST_SWTPM_DEPENDENCIES = \
+	host-json-glib \
+	host-libopenssl \
+	host-libtasn1 \
+	host-libtool \
+	host-libtpms \
+	host-pkgconf
+
+HOST_SWTPM_CONF_OPTS = --with-openssl --without-seccomp
+
+$(eval $(host-autotools-package))
--
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
