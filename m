Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CCCC46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:10:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A6114014B;
	Tue,  2 Jan 2024 22:10:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4A6114014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PW0zBdSalQl7; Tue,  2 Jan 2024 22:10:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3EF76404C1;
	Tue,  2 Jan 2024 22:10:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EF76404C1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 140FB1BF276
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:10:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E03794014B
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:10:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E03794014B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AIvNpiA1UaqN for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:10:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC018400CB
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:10:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC018400CB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D77E683D3D; Tue,  2 Jan 2024 22:10:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 22:47:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2e349301b79ad3a1840083714ee396f4302b68a
X-Git-Newrev: 70935d6585bb211a0eba2effbd51d75c12258602
X-Patchwork-Hint: ignore
Message-Id: <20240102221027.D77E683D3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgresql: add ICU support
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=70935d6585bb211a0eba2effbd51d75c12258602
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

PostgreSQL has optional ICU support. So enable it if library are available.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
