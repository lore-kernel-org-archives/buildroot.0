Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952BDCA0FF0
	for <buildroot@archiver.kernel.org>; Fri, 29 Aug 2025 15:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6962684368;
	Fri, 29 Aug 2025 15:48:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YLLZpPMDh2hj; Fri, 29 Aug 2025 15:48:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8098B84377
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8098B84377;
	Fri, 29 Aug 2025 15:48:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A79C6C
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F071E41836
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:48:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7EPSY3S5g6aJ for <buildroot@buildroot.org>;
 Fri, 29 Aug 2025 15:48:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BF7041861
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BF7041861
 for <buildroot@buildroot.org>; Fri, 29 Aug 2025 15:48:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A79C87DD5; Fri, 29 Aug 2025 15:48:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 29 Aug 2025 17:48:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c719a73a21ba5b35901e422f899afe5c19bf76fc
X-Git-Newrev: c7721b0174d9e978e58bdffba26ff2151b47af9c
X-Patchwork-Hint: ignore
Message-Id: <20250829154852.2A79C87DD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/unbound: mark CVE-2025-5994 as not
 applicable
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

commit: https://git.buildroot.net/buildroot/commit/?id=c7721b0174d9e978e58bdffba26ff2151b47af9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Unbound is vulnerable to CVE-2025-5994: "Cache poisoning via the ECS-enabled
Rebirthday Attack" if built with --enable-subnet, which is not the case in
Buildroot, so mark it as not applicable.

https://nlnetlabs.nl/downloads/unbound/CVE-2025-5994.txt

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/unbound/unbound.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/unbound/unbound.mk b/package/unbound/unbound.mk
index 03a5e8e150..e9a32e6129 100644
--- a/package/unbound/unbound.mk
+++ b/package/unbound/unbound.mk
@@ -23,6 +23,9 @@ UNBOUND_CONF_OPTS = \
 	--with-libexpat=$(STAGING_DIR)/usr \
 	--with-ssl=$(STAGING_DIR)/usr
 
+# Only vulnerable if built with --enable-subnet
+UNBOUND_IGNORE_CVES += CVE-2025-5994
+
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS_NPTL),y)
 UNBOUND_CONF_OPTS += --with-pthreads
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
