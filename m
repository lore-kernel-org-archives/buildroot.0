Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9373ACAC5B0
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69C706165B;
	Thu, 25 Sep 2025 20:20:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xPWCCk932f1H; Thu, 25 Sep 2025 20:20:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 344CE616FB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 344CE616FB;
	Thu, 25 Sep 2025 20:20:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FD94177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF17941520
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id flId8WVkEKsA for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:19:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 280F341525
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 280F341525
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 03EAC86418; Thu, 25 Sep 2025 20:19:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:07:42 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5daa5bbb8650dee3def11bad02b28338460c32c7
X-Git-Newrev: 5a8838ef12d18217908dfa00e2ccc9b98356666d
X-Patchwork-Hint: ignore
Message-Id: <20250925201943.03EAC86418@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/postgresql:
 security bump to version 17.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a8838ef12d18217908dfa00e2ccc9b98356666d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes the following security issue:

CVE-2025-8713: PostgreSQL optimizer statistics can expose sampled data
within a view, partition, or child table

PostgreSQL optimizer statistics allow a user to read sampled data within
a view that the user cannot access. Separately, statistics allow a user
to read sampled data that a row security policy intended to hide.
PostgreSQL maintains statistics for tables by sampling data available in
columns; this data is consulted during the query planning process. Prior
to this release, a user could craft a leaky operator that bypassed view
access control lists (ACLs) and bypassed row security policies in
partitioning or table inheritance hierarchies. Reachable statistics data
notably included histograms and most- common-values lists. CVE-2017-7484
and CVE-2019-10130 intended to close this class of vulnerability, but
this gap remained. Versions before PostgreSQL 17.6, 16.10, 15.14, 14.19,
and 13.22 are affected.

CVE-2025-8714: PostgreSQL pg_dump lets superuser of origin server execute
arbitrary code in psql client

Untrusted data inclusion in pg_dump in PostgreSQL allows a malicious
superuser of the origin server to inject arbitrary code for restore-time
execution as the client operating system account running psql to restore
the dump, via psql meta-commands. pg_dumpall is also affected. pg_restore
is affected when used to generate a plain-format dump. This is similar to
MySQL CVE-2024-21096. Versions before PostgreSQL 17.6, 16.10, 15.14,
14.19, and 13.22 are affected.

CVE-2025-8715: PostgreSQL pg_dump newline in object name executes
arbitrary code in psql client and in restore target server

Improper neutralization of newlines in pg_dump in PostgreSQL allows a user
of the origin server to inject arbitrary code for restore-time execution
as the client operating system account running psql to restore the dump,
via psql meta-commands inside a purpose-crafted object name. The same
attacks can achieve SQL injection as a superuser of the restore target
server. pg_dumpall, pg_restore, and pg_upgrade are also affected.
Versions before PostgreSQL 17.6, 16.10, 15.14, 14.19, and 13.22 are affected.
Versions before 11.20 are unaffected. CVE-2012-0868 had fixed this class
of problem, but version 11.20 reintroduced it.

https://www.postgresql.org/about/news/postgresql-176-1610-1514-1419-1322-and-18-beta-3-released-3118/

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 4f0a9596e35dfdcdc82dce1a2e16a74974d3e4d9)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/postgresql/postgresql.hash | 6 +++---
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index f17d4ca3ce..3b5e773c65 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v17.5/postgresql-17.5.tar.bz2.sha256
-sha256  fcb7ab38e23b264d1902cb25e6adafb4525a6ebcbd015434aeef9eda80f528d8  postgresql-17.5.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v17.6/postgresql-17.6.tar.bz2.sha256
+sha256  e0630a3600aea27511715563259ec2111cd5f4353a4b040e0be827f94cd7a8b0  postgresql-17.6.tar.bz2
 # License file, Locally calculated
-sha256  e3822c4797fadcab31a3fc73f75c28ac20c73d72b565da91e9974cf9398ef4d2  COPYRIGHT
+sha256  5ed3ce5c9373dff7f98b1fae7a6c7ccd98df7d734d46d24c1bcebf1240be8307  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 671bd30347..31d0068328 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 17.5
+POSTGRESQL_VERSION = 17.6
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
