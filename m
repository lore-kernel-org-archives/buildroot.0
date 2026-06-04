Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30FACD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A9B1F60AD2;
	Fri,  5 Jun 2026 12:38:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KLIl2JA8qIZT; Fri,  5 Jun 2026 12:38:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1E6860ADB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663086;
	bh=pegJvcQZCrpKCOTIfSviPDpBW7SvZLe/jfYdqrrK7nQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qtJHlX3CyQwAIdKHwtcqHxKE3axxN28+BS+WMg8VYFzvmiDIVd29P3eJ24MBnoETr
	 h1EMKvCAn2hLkfGygHpsHCo7P7KBX2Pv/wBAwqttqCTLlj9zReYysXnCpjcXiItw5s
	 KyXOJAh+n8Kx4zo+tPEB2KnQKHxPxaZXkVq5SRk165thLvmhN4FBR7o1w1TUNeFw/u
	 yD56j6U8lboHqdZWMQp7+zbDRpTH01uDSYN4yBKwntNi5QhYHGRgBlFUuQPsFmR+XG
	 HN6cyQtXwuc0U48lJpbzv9mhEy33g/Q/rgS4Zi8czxouFJdOWTLuWcYzHAV49D4Qjx
	 1JD11QUj+K7Wg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1E6860ADB;
	Fri,  5 Jun 2026 12:38:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 060963B7
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03C3281E5C
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GM0XIuqMnTQ0 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16B7E81E82
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16B7E81E82
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 40ABB87B40; Fri,  5 Jun 2026 12:37:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:49:05 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 22e9bafec60691cee3f041362fc19e21d0a496fc
X-Git-Newrev: afe1b9c0acae6a33c26b6d0ca897ab7dbd9e6630
X-Patchwork-Hint: ignore
Message-Id: <20260605123712.40ABB87B40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libdrm: link with
 libatomic if needed
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/afe1b9c0acae6a33c26b6d0ca897ab7dbd9e6630
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes:
https://autobuild.buildroot.net/results/ea0/ea085cdea8458768c5f0ddb16f618a572406e65a/

The oldest build error dates back to May 2024
https://autobuild.buildroot.net/results/8ff/8ff4e16bb79294c5e289989855b5875851342909/
so a backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit 6fec4282a07842eadb43dd8ce41bcef08bc3c433)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libdrm/libdrm.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 9d463ca01e..65f04ace26 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -19,6 +19,8 @@ LIBDRM_CONF_OPTS = \
 	-Dcairo-tests=disabled \
 	-Dman-pages=disabled
 
+LIBDRM_LDFLAGS = $(TARGET_LDFLAGS)
+
 ifeq ($(BR2_PACKAGE_LIBATOMIC_OPS),y)
 LIBDRM_DEPENDENCIES += libatomic_ops
 ifeq ($(BR2_sparc_v8)$(BR2_sparc_leon3),y)
@@ -26,6 +28,11 @@ LIBDRM_CFLAGS = $(TARGET_CFLAGS) -DAO_NO_SPARC_V9
 endif
 endif
 
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBDRM_LDFLAGS += -latomic
+endif
+
 ifeq ($(BR2_PACKAGE_LIBDRM_INTEL),y)
 LIBDRM_CONF_OPTS += -Dintel=enabled
 LIBDRM_DEPENDENCIES += libpciaccess
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
