Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB9EAC79F99
	for <buildroot@archiver.kernel.org>; Sun,  6 Sep 2026 12:19:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C73880D9C;
	Sun,  6 Sep 2026 12:19:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xhU3hHLC3RmF; Sun,  6 Sep 2026 12:18:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0C96480E7B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788697139;
	b=rQfNxa5F6QVe3JX3Ne8EIr+Bw6gJU0jVYDs7/QxqNuO+56bs17zgqBFf5nGyhHouR0ex
	 iM/lM4AM02xdqUAspuxwUy+hGEMayTtwSUcOA9RuFzbr5Ts5qfJd7pXt8xupUwyKnTMva
	 FyQ1Iu6velve+hnKWS6dZhhSLE/4eSGitAUDZZEUcXSYkhHO7w5sOKOl2583IofHteIiY
	 dSFCVas0MuRg9YchBppu10909+jwoDyAdOOTl/LUXZqmscFihvcK3sYgpmr3p2YVgdnFr
	 K4vwk0mMBaGLTy0D4jp/qba3uXqFeK3L6AXcZ/MHCF3BPhlcvAO8YgLS8+fZHa1MO0Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788697139;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gzHps8KNmiT5dnuL+m2pm7D/LkphbAappzw7tX3I8nU=;
	b=lU4kaSZ/kLxSkCZbXSBa7Ok/w/ns4zw2dO53LJqxsBbPLc6HELr/xDVazXfAqAlK7dsS
	 KGR8VBnRi6tDst/M/q2heCYWUsgwpCCzhftklGxlLCeiyYvelI/8UvKH4tm1Xnmhk35h0
	 ZPIDCHkHzTjjR/4yFb3ZmnFxXZc3ICoZ2guCez942f89e188RmHZ4QBoMsdMIeHZ398L1
	 vyzWQ31S/Dr4XmZwaempu7aUFE/JwI7zRWEeYnT+NsUhu4MCF+VjgAbplQusjc9oO0r2f
	 rXQgH7HGZyfojJhDY+NGCROu6dpy6j+AteNHDwshCV6dDJhxhX/zBPWZguXRMI1lqSw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788697139;
	bh=gzHps8KNmiT5dnuL+m2pm7D/LkphbAappzw7tX3I8nU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SVRZ+JAqso7VwMgDAPtiH6iCnmiIE+4RN1bbGTZYg0MgG15x0gcAXanVX5V2yPwtH
	 PK3OryiSuv7W0QlyF2fXken97WPf1WzhLI6QidRAg7nEumGogEp/TnmiiyyAgA+X4O
	 d2w/4+HcAbgIbm02AC7CYh0slHOkBxdiVB15Y4FJ33ixU1kMH4yeom12rz7AAemHRL
	 vzg8UDcJNtKUv7xHxnVJRuf8OJjUQDtL/uUCV10dHQhaN1aMwvzqY+ALQDE4e5DT9n
	 b0y6Ds8Id1AMYJrKmJg1nHyYbEJeas8E86/PUo4jUdgktV7qYwbuOqHROH8Bf75hp4
	 ClGh9OsdP5e9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C96480E7B;
	Sun,  6 Sep 2026 12:18:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BF493AF
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DE1940621
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:18:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NZ9uY5_F_fJR for <buildroot@buildroot.org>;
 Sun,  6 Sep 2026 12:18:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org ED456405AE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788697128;
 b=VnSJWrCxGrwJ4gNTgPwyVjuheR6PsITEmFNcRfLtRvSLFsIBBaFD+NwATIqMD+F47U7w
 3Ws0VJSRA2q7oO3wRGpQJflvX4NG3q5+Nys+jSPo3puRN2ukU02pTYRyBDSoNBlOVyR6W
 EbDzpT6/2wg1TT5Q8d/fGbcd1d4yiQy1oFbIar8jxA9ebWEhcf3QTC4uqoC9r3EcxUYDI
 3gApWEVNK3qgcnc7SeKxWtD3U5WK8Td+hs/HTXzNou6Zuq0DXmI10GFtLEWOl3Uf9aq4F
 G6KawvPeKIizYQDx2zpMs1CcCVAEjbjzQuvpuiNsQEJ0edQncyOEbbUFdE/Q0QMXp7g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788697128;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Xq40jkUMYoDrBr9tA0HKvZ+wYEX85yiW9LZ+k6r+628=;
 b=ETzcTukuvpXQsx3/t8ldVs90iw2K9cX1qPaAEIPfbZeIQK4BJUarWHULttM/bng50iCQ
 J4lzMm4h27ROEadWqCcPiqjw+PbA+6tmKBPfGF6As+t8inn8opFQF8uf6TIRAEHIMy5M5
 vNoFq5OufKrAqZ6VTKCNBIhULVIdWCdyeUIcNNoQrHnoC8I3EMSFkfsLCznnaFOSujnac
 9Z3oAdDcxDn8KdspKu9uuSKlVtbbNkh6dPKhnQLyLlcdpi6DBfOWEOD5Y5IJe2rLJnb/E
 6GDMSdvDE+F9cZZk/vg8FRGTaRj7FUhvcJUHXYpE8r9A7e/hlYCc2G4wtmfKVoVC8rQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED456405AE
 for <buildroot@buildroot.org>; Sun,  6 Sep 2026 12:18:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 738AD95435; Sun,  6 Sep 2026 12:17:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Sep 2026 13:56:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6528b3e3f86d08b473fc5eaa85575d4aeb3e9bad
X-Git-Newrev: 7e2c62319303f14a5cd835a2b1f21083dc536878
X-Patchwork-Hint: ignore
Message-Id: <20260906121746.738AD95435@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: bump latest version to 7.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7e2c62319303f14a5cd835a2b1f21083dc536878
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For an overview of changes in 7.2, see:
https://kernelnewbies.org/Linux_7.2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: rename "7.1.13" symlink to "7.2.3"]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 linux/{7.1.13 => 7.2.3} | 0
 linux/Config.in         | 6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/7.1.13 b/linux/7.2.3
similarity index 100%
rename from linux/7.1.13
rename to linux/7.2.3
diff --git a/linux/Config.in b/linux/Config.in
index 401f2828cb..2cea1b402a 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -30,8 +30,8 @@ choice
 	prompt "Kernel version"
 
 config BR2_LINUX_KERNEL_LATEST_VERSION
-	bool "Latest version (7.1)"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_1 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest version (7.2)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_7_2 if BR2_KERNEL_HEADERS_AS_KERNEL
 	# mips always generates an ITB image
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
@@ -143,7 +143,7 @@ config BR2_LINUX_KERNEL_CUSTOM_REPO_GIT_SUBMODULES
 
 config BR2_LINUX_KERNEL_VERSION
 	string
-	default "7.1.13" if BR2_LINUX_KERNEL_LATEST_VERSION
+	default "7.2.3" if BR2_LINUX_KERNEL_LATEST_VERSION
 	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
