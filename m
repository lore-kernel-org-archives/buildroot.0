Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FE47C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B72A98142A;
	Sun,  7 May 2023 21:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B72A98142A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vj0OSvocN4tn; Sun,  7 May 2023 21:48:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E13A281420;
	Sun,  7 May 2023 21:48:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E13A281420
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E7681BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:47:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66A0F80ED1
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66A0F80ED1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Q9reII3M5QC for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:47:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DB4E80EA3
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DB4E80EA3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 88FA4860D6; Sun,  7 May 2023 21:47:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 May 2023 23:44:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 233be1c216a8f7f923245791c6d9a897e10e5c63
X-Git-Newrev: 38c4621df340ea7a76033f5955be1b277554920f
X-Patchwork-Hint: ignore
Message-Id: <20230507214721.88FA4860D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpm: add python support
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

commit: https://git.buildroot.net/buildroot/commit/?id=38c4621df340ea7a76033f5955be1b277554920f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When Python 3 support is detected, enable Python 3-related support.

Signed-off-by: James Knight <james.d.knight@live.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rpm/rpm.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 2b289fcc9f..2964c6a512 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -27,7 +27,6 @@ RPM_SELINUX_MODULES = rpm
 # --enable-openmp is provided and OpenMP is < 4.5:
 # https://github.com/rpm-software-management/rpm/pull/1433
 RPM_CONF_OPTS = \
-	--disable-python \
 	--disable-rpath \
 	--with-gnu-ld \
 	--without-fapolicyd \
@@ -83,6 +82,13 @@ else
 RPM_CONF_OPTS += --without-selinux
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+RPM_DEPENDENCIES += python3
+RPM_CONF_OPTS += --enable-python
+else
+RPM_CONF_OPTS += --disable-python
+endif
+
 ifeq ($(BR2_PACKAGE_SQLITE),y)
 RPM_DEPENDENCIES += sqlite
 RPM_CONF_OPTS += --enable-sqlite
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
