Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02780C87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 13:22:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C37DF8461E;
	Wed,  6 Aug 2025 13:22:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GZGM1i3IudlN; Wed,  6 Aug 2025 13:22:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E188C845F5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E188C845F5;
	Wed,  6 Aug 2025 13:22:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 37B42233
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 13:22:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E0A7402B1
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 13:22:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 46oXPIpBo6bp for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 13:22:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68BF04024E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68BF04024E
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 13:22:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5509286F33; Wed,  6 Aug 2025 13:22:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 6 Aug 2025 15:18:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1375aabf74c2f96a6621e35fff171e5a47a7425e
X-Git-Newrev: 2982fac48ede2c14e86df670fc4e44399d0a3f69
X-Patchwork-Hint: ignore
Message-Id: <20250806132257.5509286F33@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xinetd: fix build with musl
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

commit: https://git.buildroot.net/buildroot/commit/?id=2982fac48ede2c14e86df670fc4e44399d0a3f69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The ecvt(), fcvt(), and gcvt() functions from stdlib.h, used by the SIO
library packaged with the xinetd sources, are masked by _GNU_SOURCE in
musl libc.

Signed-off-by: Aaron Sierra <aaron@bubbl-tek.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xinetd/xinetd.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
index f58c26f02a..f63a8a2251 100644
--- a/package/xinetd/xinetd.mk
+++ b/package/xinetd/xinetd.mk
@@ -29,6 +29,11 @@ else ifeq ($(BR2_TOOLCHAIN_HAS_NATIVE_RPC),)
 XINETD_CFLAGS += -DNO_RPC
 endif
 
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+# Make ecvt(), fcvt(), and gcvt() available for SIO library
+XINETD_CFLAGS += -D_GNU_SOURCE
+endif
+
 XINETD_CONF_ENV += \
 	CFLAGS="$(XINETD_CFLAGS)" \
 	LIBS="$(XINETD_LIBS)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
