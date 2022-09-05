Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B876DECAAD5
	for <buildroot@archiver.kernel.org>; Mon,  5 Sep 2022 21:22:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C50E54099A;
	Mon,  5 Sep 2022 21:22:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C50E54099A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IDeS_gd-DMhf; Mon,  5 Sep 2022 21:22:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E08D84090F;
	Mon,  5 Sep 2022 21:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E08D84090F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C37A41BF3DC
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 21:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9DF244090F
 for <buildroot@lists.busybox.net>; Mon,  5 Sep 2022 21:22:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9DF244090F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zxnjPlfZ6dfV for <buildroot@lists.busybox.net>;
 Mon,  5 Sep 2022 21:22:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A72CD40906
 for <buildroot@buildroot.org>; Mon,  5 Sep 2022 21:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A72CD40906
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id C3FC188270; Mon,  5 Sep 2022 21:07:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 5 Sep 2022 23:22:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 286928d9b52ffb9a1f1884a209252f1c5bb0aa1f
X-Git-Newrev: 713fad52ad1358299d19f7530cb26fabe66236fe
X-Patchwork-Hint: ignore
Message-Id: <20220905210724.C3FC188270@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sconeserver: fix build with gcc 4.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=713fad52ad1358299d19f7530cb26fabe66236fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 4.8 raised since commit
8b42bbf30a914b0fd40a4518e61ac7bc511a7deb:

/home/buildroot/autobuild/run/instance-1/output-1/build/sconeserver-8d1935919a2013358993a8e9dfa992cbde56e503/http/AuthRealmDB.cpp: In member function 'virtual std::string http::AuthRealmDB::lookup_hash(const string&)':
/home/buildroot/autobuild/run/instance-1/output-1/build/sconeserver-8d1935919a2013358993a8e9dfa992cbde56e503/http/AuthRealmDB.cpp:93:3: error: 'unique_ptr' is not a member of 'std'
   std::unique_ptr<scx::DbQuery> query(m_db->object()->new_query(
   ^

Fixes:
 - http://autobuild.buildroot.org/results/198c23f1de5cc90efe2d3b4ce053939457e003f7

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/sconeserver/sconeserver.mk | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index d15b112801..bfbd5dc6ed 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -17,14 +17,10 @@ SCONESERVER_DEPENDENCIES = \
 # https://github.com/sconemad/sconeserver/tree/master/markdown
 # has no cross-compile support provided by the sconeserver build system
 SCONESERVER_CONF_OPTS += \
+	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -std=c++11" \
 	-DWITH_IMAGE=OFF \
 	-DWITH_MARKDOWN=OFF
 
-ifeq ($(BR2_PACKAGE_LIBXML2),y)
-# Needed to fix build failure when icu is enabled in libxml2
-SCONESERVER_CONF_OPTS += -DCMAKE_CXX_FLAGS="-std=c++11"
-endif
-
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 SCONESERVER_DEPENDENCIES += openssl
 SCONESERVER_CONF_OPTS += -DWITH_SSL=ON
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
