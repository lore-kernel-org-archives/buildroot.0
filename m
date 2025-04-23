Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21BAEC369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 19:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3A89412A9;
	Wed, 23 Apr 2025 19:11:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2V6oSzUfpBSF; Wed, 23 Apr 2025 19:11:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E6249412B2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6249412B2;
	Wed, 23 Apr 2025 19:11:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 29BE71BC
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:11:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C2CA40AE8
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:11:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUe1vXFiG3en for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 19:11:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8B9E403F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8B9E403F1
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 19:11:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A56BF861F0; Wed, 23 Apr 2025 19:11:23 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 23 Apr 2025 21:08:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cd6141ab150e504283791730fad35cb31123d002
X-Git-Newrev: 70ca62fb499903a17ce0b109909693b9b31054ad
X-Patchwork-Hint: ignore
Message-Id: <20250423191123.A56BF861F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcoap: fix build for toolchains
 w/o threads
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=70ca62fb499903a17ce0b109909693b9b31054ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The version bump in [1] introduced the upstream commit [2] which made
builds using toolchain without thread support fail to build libcoap.

This patch adds an option check in the libcoap.mk file to verify
the toolchain has thread support and passes the correct configuration
options introduced in [2] as well.

The build can be tested with the following config.

```
BR2_armeb=y
BR2_cortex_a76_a55=y
BR2_ARM_EABI=y
BR2_ARM_SOFT_FLOAT=y
BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_PTHREADS_NONE=y
BR2_PACKAGE_LIBCOAP=y
```

Fixes:
https://autobuild.buildroot.org/results/9c0/9c0b675a64fb2576bc34457043f118cffe5fe555//

[1] 4df4d1d312 package/libcoap: bump version to 4.3.5
[2] https://github.com/obgm/libcoap/commit/c69c5d5af0a30859e90756f535e2ca21cdeda0b2

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libcoap/libcoap.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index c5e5f85c62..d7c2a78944 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -31,4 +31,10 @@ else
 LIBCOAP_CONF_OPTS += --disable-dtls
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
+LIBCOAP_CONF_OPTS += --enable-thread-safe
+else
+LIBCOAP_CONF_OPTS += --disable-thread-safe
+endif
+
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
