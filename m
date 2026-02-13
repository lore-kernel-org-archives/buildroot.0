Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B76EDF156
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 12:02:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 516BA843BC;
	Fri, 13 Feb 2026 12:02:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jx3wLB1f0A8D; Fri, 13 Feb 2026 12:02:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28E68840AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770984165;
	bh=R5voTYM1SZHpnr1JQmv5WMLgWtprnlT4DXrFPzb7v68=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=cnmooCiJ539jg/6qJk/bO0spvHqqFIYdk5o0j3wHkAy8xweBz33/4B+EWw4q7NFrZ
	 svzEykzTH3+XnEvZY8pr7AuETZAeG+KPHw0tQbRXQKkEk7lZ7Wwq5aHZJsFBAO7qXk
	 trkFxUHKbvHG/LU446DH9MwJ4CEz0Vo8BCCAkXaUdJWIcOqRrAcGDM3CVDaNUdtytR
	 1bO8iSN3cliNy3VfpQfo0S5xKGcGrBzVD6Q3xZYQssP9fvp/XFFrWUN6/S+z/uWxtu
	 tQSy9iK8gwVftkKAKISoCMByViELo4iKn3k9DQsqg1bKd2px3wOo73ivyQCK0UM/z+
	 NYaX3z0kJJz7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28E68840AC;
	Fri, 13 Feb 2026 12:02:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F006EC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 12:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C4EC402E2
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 12:02:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EVfeZNkOHbUS for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 12:02:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D8A5840215
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8A5840215
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8A5840215
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 12:02:40 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 040B731E0AC5; Fri, 13 Feb 2026 13:02:37 +0100 (CET)
Date: Fri, 13 Feb 2026 13:02:37 +0100
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <aY8S3RgTJeBfPtTw@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.63+deb13-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1770984158; bh=DBXUgIy09pm1lXNxy+kXbD+L/6qweJfVfJn7WeulIHI=;
 h=Date:From:To:Subject:From;
 b=vwwaLKoxrLMhAaJNK1fKOiNEFlJF114z31cmp3PVLx99hAxYeZfKnkJjHdsn0G5N+
 ukO6G5fmfiN4Hw8WZV3AFYlCGqvM2+vORITfKVPJJcED30WLP6xZFHngxC1uEkJhpV
 qpCPU2fTtNg49655Ucx9hwoRa6UtcF2drsp2G7AyNvJwPlOKcWVwjZaLQD0+JTdggw
 IFG+BSmLFqW5kc3Qzq+Bta7GPsrwOC7X+OGl0xvG8/9x0BkbTuvSVWIBcLLv2o31gY
 +bqi60cWWj6iPD3LUSTYmk6Hp4CKJSf89aF88Aj7Hri5gDdpxY1DdZQnGTA1LHwy/P
 K09LBdbsu0oPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
Subject: [Buildroot] [PATCH] package/gvfs: enable optional udisks support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Optional udisks support is useful for mounting USB sticks via
pcmanfm. 

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/gvfs/gvfs.mk | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/package/gvfs/gvfs.mk b/package/gvfs/gvfs.mk
index 6eff3bd859..c92e91c8fb 100644
--- a/package/gvfs/gvfs.mk
+++ b/package/gvfs/gvfs.mk
@@ -30,8 +30,7 @@ GVFS_CONF_OPTS = \
 	-Dgoogle=false \
 	-Donedrive=false \
 	-Dmtp=false \
-	-Dsftp=false \
-	-Dudisks2=false
+	-Dsftp=false
 
 ifeq ($(BR2_PACKAGE_AVAHI),y)
 GVFS_DEPENDENCIES += avahi
@@ -157,4 +156,11 @@ GVFS_CONF_OPTS += \
 	-Dtmpfilesdir=no
 endif
 
+ifeq ($(BR2_PACKAGE_UDISKS),y)
+GVFS_DEPENDENCIES += udisks
+GVFS_CONF_OPTS += -Dudisks2=true
+else
+GVFS_CONF_OPTS += -Dudisks2=false
+endif
+
 $(eval $(meson-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
