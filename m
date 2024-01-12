Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF293C4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 17:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CBA28467F;
	Fri, 12 Jan 2024 17:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CBA28467F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OC5tcoAboS08; Fri, 12 Jan 2024 17:46:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A071C84527;
	Fri, 12 Jan 2024 17:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A071C84527
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CACF81BF309
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 17:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 953354029F
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 17:44:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 953354029F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D1GfZHZiNA56 for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 17:44:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53ABB400D0
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 17:44:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53ABB400D0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4028285FA6; Fri, 12 Jan 2024 17:44:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Jan 2024 18:15:33 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: d2b043bfd9a703b2ab933cd7796a65e5c6a4d024
X-Git-Newrev: 3264bdb37cb4a90568ea4de94e0da88c43bb17c6
X-Patchwork-Hint: ignore
Message-Id: <20240112174407.4028285FA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/postgresql: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=3264bdb37cb4a90568ea4de94e0da88c43bb17c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
