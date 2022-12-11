Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C601C4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 13:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5F5640529;
	Sun, 11 Dec 2022 13:10:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5F5640529
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aLDS1JD1XKMx; Sun, 11 Dec 2022 13:10:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 04E9C4052B;
	Sun, 11 Dec 2022 13:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 04E9C4052B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C056C1BF2BD
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C23D8140F
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 13:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C23D8140F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n2q0aXzo-Ax9 for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 13:09:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D27478139E
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 13:09:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D27478139E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C21BD86097; Sun, 11 Dec 2022 13:09:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 14:09:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ad775fc8118927bde9bf442bbb7e8307280e97d
X-Git-Newrev: 953e2889734d1ccac609f997e0f3ebdeee20c41b
X-Patchwork-Hint: ignore
Message-Id: <20221211130926.C21BD86097@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeradius-server: disable with
 libressl
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

commit: https://git.buildroot.net/buildroot/commit/?id=953e2889734d1ccac609f997e0f3ebdeee20c41b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Building with libressl results in the following build failure since the
addition of the package in commit
736c4c1655d93652a9a7e79235bbe726b3d46176:

src/modules/rlm_eap/types/rlm_eap_fast/rlm_eap_fast.c: In function '_session_secret':
src/modules/rlm_eap/types/rlm_eap_fast/rlm_eap_fast.c:228:47: error: invalid use of incomplete typedef 'SSL' {aka 'struct ssl_st'}
  228 |         eap_fast_session_ticket(tls_session, s->s3->client_random, s->s3->server_random, secret, secret_len);
      |                                               ^~

Disable building with libressl following upstream feedback:
https://github.com/FreeRADIUS/freeradius-server/pull/4689

Fixes:
 - http://autobuild.buildroot.org/results/c8df444f4c39f83e254dbb642a5852a1c956f7bb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freeradius-server/freeradius-server.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index ebd459341d..af3320eb44 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -178,7 +178,7 @@ else
 FREERADIUS_SERVER_CONF_OPTS += --without-rlm_sql_postgresql
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_OPENSSL),y)
+ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
 FREERADIUS_SERVER_DEPENDENCIES += openssl
 FREERADIUS_SERVER_CONF_OPTS += \
 	--with-openssl \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
