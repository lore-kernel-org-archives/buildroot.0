Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6956C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 21:35:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2533183FF8;
	Wed, 20 Jul 2022 21:35:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2533183FF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rKKRe45OShzO; Wed, 20 Jul 2022 21:35:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4623F83F71;
	Wed, 20 Jul 2022 21:35:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4623F83F71
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0FD381C1135
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE2AB40166
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 21:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DE2AB40166
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wCohvWu-UCrl for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 21:35:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3637E4015A
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 21:35:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3637E4015A
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5B92A840F1; Wed, 20 Jul 2022 21:22:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 20 Jul 2022 23:25:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3acd6452fbbe8c70ddb4dcfc299505b1bfefabac
X-Git-Newrev: 25eea4424f12f7cb1f7da04f802478f503b0ae19
X-Patchwork-Hint: ignore
Message-Id: <20220720212204.5B92A840F1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bind: add libmaxminddb optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=25eea4424f12f7cb1f7da04f802478f503b0ae19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add libmaxminddb optional dependency (which is enabled by default), two
options must be used to enable/disable this dependency:
 [pairwise: --enable-geoip --with-maxminddb=auto, --enable-geoip --with-maxminddb=yes, --disable-geoip]

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bind/bind.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index c84abe91a0..1646fc6237 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -61,6 +61,13 @@ else
 BIND_CONF_OPTS += --with-gssapi=no
 endif
 
+ifeq ($(BR2_PACKAGE_LIBMAXMINDDB),y)
+BIND_CONF_OPTS += --enable-geoip --with-maxminddb
+BIND_DEPENDENCIES += libmaxminddb
+else
+BIND_CONF_OPTS += --disable-geoip
+endif
+
 ifeq ($(BR2_PACKAGE_LIBXML2),y)
 BIND_CONF_OPTS += --with-libxml2
 BIND_DEPENDENCIES += libxml2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
