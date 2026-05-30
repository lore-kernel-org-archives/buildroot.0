Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E8FCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 08:40:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3ADC540909;
	Sat, 30 May 2026 08:40:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KhTVA0y5Yc_0; Sat, 30 May 2026 08:40:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63028412FF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780130443;
	bh=s9km25nkXgQTfIic7mpZtHsz+WNC+W1OK94UKenqs4M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XLbViKDrRoV9hD07ZDFBY1AXn/8USkVouvzS1KWIZNPfY3DBWMxs59MfmV4Gcs0Nm
	 IsdnNoAKqpAhIl7igW5SbT/UW3y+5Q0P/5pIHhFXQD3mx65tfRATwLOeZSPEvcyqc2
	 b/mGMlYeZ4zmyfZ5oSogmswP+a3TChvobTJ7Na3kcUo+6U3ooWw/20yMdV6jXzHSY1
	 FuUJ1lU4ERqiO7MkEE5SwjVW8tNNPMeSaIc/19x2bTSJETIdyByv8VXIDo0g7xPGoc
	 JmnkGWjoavkwfx1kC6KQZjJuaE9sAv3Y8OuAFGvp4tLnJxDJ3zVQAmac80ZzzXB3rH
	 GMNh+jgBZhWyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63028412FF;
	Sat, 30 May 2026 08:40:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E35AFF4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:40:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2454412FF
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:40:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JwsO9fPSYoMs for <buildroot@buildroot.org>;
 Sat, 30 May 2026 08:40:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBDCB40909
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBDCB40909
 for <buildroot@buildroot.org>; Sat, 30 May 2026 08:40:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F394B86A1A; Sat, 30 May 2026 08:40:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 10:37:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 196070ae5e0242293af0b208b0fe41ad49de6888
X-Git-Newrev: 6fec4282a07842eadb43dd8ce41bcef08bc3c433
X-Patchwork-Hint: ignore
Message-Id: <20260530084027.F394B86A1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdrm: link with libatomic if
 needed
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6fec4282a07842eadb43dd8ce41bcef08bc3c433
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes:
https://autobuild.buildroot.net/results/ea0/ea085cdea8458768c5f0ddb16f618a572406e65a/

The oldest build error dates back to May 2024
https://autobuild.buildroot.net/results/8ff/8ff4e16bb79294c5e289989855b5875851342909/
so a backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/libdrm/libdrm.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 240c09b8b1..cafff8781e 100644
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
