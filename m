Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B22CA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 19:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C919280753;
	Thu, 14 Aug 2025 19:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a61ypndIeaQB; Thu, 14 Aug 2025 19:56:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EAC9B8073B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAC9B8073B;
	Thu, 14 Aug 2025 19:56:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E8C091BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1464404AF
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 78mvP_X5QGKd for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 19:56:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 288EE40473
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 288EE40473
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 19:56:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 24E6E875ED; Thu, 14 Aug 2025 19:56:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:25:53 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b0d06c13fec64f24e2a0ddaaa24ce3f575b8239e
X-Git-Newrev: 8bd2be012e6cb669940a09f1bd539e1a8cb929b8
X-Patchwork-Hint: ignore
Message-Id: <20250814195611.24E6E875ED@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/xinetd: fix build
 with musl
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8bd2be012e6cb669940a09f1bd539e1a8cb929b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

The ecvt(), fcvt(), and gcvt() functions from stdlib.h, used by the SIO
library packaged with the xinetd sources, are masked by _GNU_SOURCE in
musl libc.

Signed-off-by: Aaron Sierra <aaron@bubbl-tek.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2982fac48ede2c14e86df670fc4e44399d0a3f69)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
