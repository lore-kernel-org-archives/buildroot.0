Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CA4C98321
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 11:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3414F60C1F;
	Fri, 25 Sep 2026 11:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oWKyHAvtY6GJ; Fri, 25 Sep 2026 11:53:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5118A60BE4
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790337190;
	b=jM5kR1+iOxOa1Q9ewGP/5eSw9S6Iu8tOr8xJAydT3nEV3oChaUTRf7tu4gMB5aXxw/vL
	 QTd90nNnNAIh+ZH8cjz1EIFFYWApYNNi20tO+v2mObxvsl9uNdWFd+mO2y1A9ujBSYZQr
	 Pz/vcNigS+EGLYD/R6/RNxgQdcAP8F0dvlZ/2BkGUkw/dtA2BIjEamrMenrP1BBmkKfW5
	 T5kExUk9dd3DQmgPuMYMfgP/kE1fdCcMVuUu7D0fgVbejFLBhKEN/el8GSB4eUdFON0zT
	 m1bYQHFU8Otrt3fgM/bSTincQVeN0edtp/uGXeZBJdquAr9/78PXDxxzId/KW+tsuPw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790337190;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=y2LJxASi+1uQb3+ZPZrGRShZQO0xeyVmWml59VDwgwk=;
	b=enmpZHQqhi5h/0m6A55v/nyIkkHjEl8aJCDEwuXKTEViCsdyaF0FH1QLF0ZHyWiD0sr3
	 MEwLljSUZblkqrvjJoHtBqtfTLJ/dgXenVgY2edMMvsZ5DF7z1FJsbPC7CkSA68jnwUtW
	 FplQu/AVsk8mNXjDjja8a2YWezACsfacktAYBXMYJYZ3sbAKBHgOBepxN0wv62477+iX9
	 dUkr/RW08HDQH09uS9mx6AvOYU2s4Ibr77k70yYuAzCAsYBo/APEgk7zHnYhyJCfmVq1f
	 M/yxJ24KwVH4jJeDfpZW4Cc/9owpGrKXKiU7u9zObN41iaiEr34v9kzus2YWxRjaz/Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790337190;
	bh=y2LJxASi+1uQb3+ZPZrGRShZQO0xeyVmWml59VDwgwk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I/bmSu0fsqsJwqI6ZrPZUZn3t6HIG0PDidoMxdF+qYJBhUcn1+cxorWEGhViKPdkZ
	 yiq0maqgwnJ+m4udDkmDTjQrt1397U57tZqpntG06WEdtd26sCNUfyEK+h1cGu/Rus
	 DVei92PUpULcGpyUHmxnxI6LL7ayJcyJBSdchZtcwNitLywkUOV6LAw2WxZrW2o+vm
	 3M+nWVMSLAHGrDrisbhzUCDXxyA77//Et+7sF0ZUyXc+W3Kg0PqZca6qWQok7sWs9x
	 W2ADwvT5FyfSeCmaxhfkRdoupTmq8n3CIlgbTMvhHfgZVFZa6ds416fPtN4a5B9oR9
	 SKxjU+Q9PzbLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5118A60BE4;
	Fri, 25 Sep 2026 11:53:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A1AF22F5
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 11:53:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F2EE60BE4
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 11:53:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WMT9GUcpaa3x for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 11:53:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A77DB60BC3
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790337187;
 b=iC2A6HXgrQaIS2rAMMQ8M6pVCGiqsp69qWePEu+VJIntYxeZzsr+yO7VZCDMxoL+3N9t
 IF9LSX4lNV2xuCneLFqvAT+BzDv4Z42BW23D9cTnKVJ4EDRIXH24nL4yDZhutAgyGhaiC
 AxIMZ8lmVEfILxHRZw2Tx38kWcsqsrXOpBliwp0fw8fzLWtKEIqnYs0FVl4ML05hG8kN2
 wFBldkAq/SsuivhPxm5jhfVWVS9p5WCgdvrmRIGcRXNDHvNUVMiiZNLC12VGwLOu4+6kC
 VQ9khY1hE45xcU79wuJ7zVVU3412nOfOTpvviordmkx5QPVZ2j2EmP+WSroKY609b5Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790337187;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=pCjL9XdX+kSwZ02HHfibwTKvGk8mvcxoOlWh/GpKdck=;
 b=glfe68e1ktfqxxuMH00T7h5IlnrZHZHStn0iZWdhYbDBFkHhdkfJ4+toCo+mOSyzWhgE
 Kan/inoLwayv35A3iVuTuxn3eKkHV1dTO1m6eV8GsuhHrvt03weOH95hygjyn7QS7R8TH
 5L4wd6HW8Mt0eptqyUGx7rdyWubfJlHPrm97TQg8COERDpsRpiSeaZ6+5IIeHnpQfgoqn
 6e/oM3EtnjOnTvXyZ1k815y9Gb1JWYUtKXPxxKifHxLzkfsqWkIo8aIfapsxx8tRHgmjq
 RUD33ZbHymXhF2/3VhSPncQjdrYRcZBsBgwOb28T4zV7ryeZM+c4/nvLmJ5ARGTpVrg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A77DB60BC3
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 11:53:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C50CA98379; Fri, 25 Sep 2026 11:51:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 25 Sep 2026 13:51:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e7bbe36be89f5917329fb33051d8f702ebffb402
X-Git-Newrev: 0bf8b2ecee6b1b41746e8863b57c2c5ba3a623b1
X-Patchwork-Hint: ignore
Message-Id: <20260925115156.C50CA98379@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xen: add x86_64 target
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0bf8b2ecee6b1b41746e8863b57c2c5ba3a623b1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add support for building xen for x86_64 targets. In this initial version,
do not build extra bootloaders which would require additional download
infrastructure.

Assisted-by: Claude:opus-5.5
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/xen/Config.in |  2 +-
 package/xen/xen.mk    | 17 +++++++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/xen/Config.in b/package/xen/Config.in
index 47f9dfa6e4..89543ac9ba 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_XEN
 	bool "xen"
 	# needs "dmb" on ARM, so ARM >= v7
-	depends on BR2_ARM_CPU_ARMV7A || BR2_aarch64
+	depends on BR2_ARM_CPU_ARMV7A || BR2_aarch64 || BR2_x86_64
 	select BR2_PACKAGE_XEN_HYPERVISOR if !BR2_PACKAGE_XEN_TOOLS
 	help
 	  This package builds the Xen hypervisor and toolstack.
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index bddfdbba38..729d213c02 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -24,6 +24,8 @@ ifeq ($(ARCH),aarch64)
 XEN_ARCH = arm64
 else ifeq ($(ARCH),arm)
 XEN_ARCH = arm32
+else ifeq ($(ARCH),x86_64)
+XEN_ARCH = x86_64
 endif
 
 XEN_CONF_OPTS = \
@@ -32,6 +34,21 @@ XEN_CONF_OPTS = \
 	--with-initddir=/etc/init.d \
 	--disable-werror
 
+ifeq ($(BR2_x86_64),y)
+# SeaBIOS, OVMF and iPXE would be git-cloned at build time, and ROMBIOS
+# needs the bcc/as86/ld86 toolchain, so only build hvmloader. The PV shim
+# is a second, differently configured build of the hypervisor.
+XEN_CONF_OPTS += \
+	--disable-seabios \
+	--disable-ovmf \
+	--disable-ipxe \
+	--disable-rombios \
+	--disable-pvshim
+
+# hvmloader is 32-bit x86 firmware, loaded into HVM guests
+XEN_BIN_ARCH_EXCLUDE = /usr/lib/xen/boot
+endif
+
 # Xen 4.20+ would normally fetch qemu-xen via git at build time; we
 # pre-provide it via the qemu-xen package instead.
 XEN_CONF_ENV = PYTHON=$(HOST_DIR)/bin/python3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
