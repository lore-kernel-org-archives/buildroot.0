Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF936E77188
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 17:13:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 591F360791;
	Tue, 31 Dec 2024 17:13:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AIN84s1ioh23; Tue, 31 Dec 2024 17:13:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E13260785
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E13260785;
	Tue, 31 Dec 2024 17:13:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5658FE0F
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 17:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C8664059B
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 17:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 35sCbQbwI2Xr for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 17:13:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 23AD64099C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23AD64099C
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 17:13:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0BE1C82DEB; Tue, 31 Dec 2024 17:13:10 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 31 Dec 2024 18:08:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3f7c104ca50a8cfa4403cc76b907672633eebca
X-Git-Newrev: f0422b41df9d5b638b59ffc9811f9bce135f3e35
X-Patchwork-Hint: ignore
Message-Id: <20241231171310.0BE1C82DEB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgresql: workaround
 documentation build failure
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

commit: https://git.buildroot.net/buildroot/commit/?id=f0422b41df9d5b638b59ffc9811f9bce135f3e35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the bump of Postgresql to version 17.2 in commit
cc77be28fc030f8583a4a7f9f724d0fc9543dba5, the build fails when
host-libxml2 and host-libxslt have been built prior to Postgresql, or
when xmllint and xsltproc are available on the host machine, with:

I/O error : Attempt to load network entity: http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd
../doc/src/sgml/postgres.sgml:22: warning: failed to load external entity "http://www.oasis-open.org/docbook/xml/4.5/docbookx.dtd"
]>
  ^
../doc/src/sgml/postgres.sgml:24: element book: validity error : No declaration for attribute id of element book
<book id="postgres">

As this happens when building the documentation, this commit proposes
to disable building the documentation. Unfortunately, passing
-Ddocs=disabled -Ddocs_pdf=disabled is not sufficient, as the
documentation building logic still does stuff when it detects xmllint
and xsltproc, so we "poison" the detection of those tools so that they
do not get used.

This issue has been reported upstream as of bug #18760:
https://www.postgresql.org/message-id/18760-82d1b83da31b898d%40postgresql.org

Fixes:

  http://autobuild.buildroot.net/results/b061e6a68c885e47a254e66dbc073e2b548b8cd3/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Julien: add link to bug report]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/postgresql/postgresql.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 5ad3cea9e7..f4b58f58ed 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -14,7 +14,15 @@ POSTGRESQL_SELINUX_MODULES = postgresql
 POSTGRESQL_INSTALL_STAGING = YES
 POSTGRESQL_CONFIG_SCRIPTS = pg_config
 POSTGRESQL_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
-POSTGRESQL_CONF_OPTS = -Drpath=false
+# We have to force invalid paths for xmllint and xsltproc, otherwise
+# if detected they get used, even with -Ddocs=disabled and
+# -Ddocs_pdf=disabled, and it causes build failures
+POSTGRESQL_CONF_OPTS = \
+	-Drpath=false \
+	-Ddocs=disabled \
+	-Ddocs_pdf=disabled \
+	-DXMLLINT=/nowhere \
+	-DXSLTPROC=/nowhere
 POSTGRESQL_DEPENDENCIES = \
 	$(TARGET_NLS_DEPENDENCIES) \
 	host-bison \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
