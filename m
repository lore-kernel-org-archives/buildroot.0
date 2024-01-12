Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15215C4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 17:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF14B8460C;
	Fri, 12 Jan 2024 17:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF14B8460C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r5amSCIDT44u; Fri, 12 Jan 2024 17:37:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1929D84608;
	Fri, 12 Jan 2024 17:37:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1929D84608
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB0A41BF309
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 17:37:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1EA160BE1
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 17:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1EA160BE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mszLl4-RYYdr for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 17:37:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08AC760B3C
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 17:37:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08AC760B3C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E934585F32; Fri, 12 Jan 2024 17:37:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 18:14:50 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: afd0e6e51c87d7db23a48acf1f70bb7f899ff424
X-Git-Newrev: 9c152dd8d04ee6efa57923490e6008ea8defb027
X-Patchwork-Hint: ignore
Message-Id: <20240112173720.E934585F32@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/postgresql: add
 ICU support
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9c152dd8d04ee6efa57923490e6008ea8defb027
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

PostgreSQL has optional ICU support. So enable it if library are available.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 70935d6585bb211a0eba2effbd51d75c12258602)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/postgresql/postgresql.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 3108fe65e1..89ba80557d 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -87,6 +87,13 @@ else
 POSTGRESQL_CONF_OPTS += --without-ldap
 endif
 
+ifeq ($(BR2_PACKAGE_ICU),y)
+POSTGRESQL_DEPENDENCIES += icu
+POSTGRESQL_CONF_OPTS += --with-icu
+else
+POSTGRESQL_CONF_OPTS += --without-icu
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 POSTGRESQL_DEPENDENCIES += libxml2
 POSTGRESQL_CONF_OPTS += --with-libxml
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
