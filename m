Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D17C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 19:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 957DE40884;
	Mon, 15 Aug 2022 19:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 957DE40884
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2Pvx45w5VnfX; Mon, 15 Aug 2022 19:45:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5506240878;
	Mon, 15 Aug 2022 19:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5506240878
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8AFE01BF38D
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 19:45:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 661DF81753
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 19:45:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 661DF81753
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aelACXjBZV22 for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 19:45:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E8CB8174F
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 19:45:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E8CB8174F
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 786D5876C8; Mon, 15 Aug 2022 19:30:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 21:44:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 685100fe85f5ee0849adae7c68dfabf9c844f77e
X-Git-Newrev: 3a9369fdebe0801b20fc2e4faa7043009d6beb25
X-Patchwork-Hint: ignore
Message-Id: <20220815193038.786D5876C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gauche: fix build failure due to
 libatomic_ops
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

commit: https://git.buildroot.net/buildroot/commit/?id=3a9369fdebe0801b20fc2e4faa7043009d6beb25
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 9.12.0 in
commit f2eb56459ed3d8f5fdb026a31fe85e8df7d3b42d and
https://github.com/shirok/Gauche/commit/9601603db7aea7bb6e075b4f7f09210a919a35b5
which deleted the internal libatomic_ops:

configure: error: libatomic_ops is required.  You can either install it on
                  your system, or fetch and unpack a recent version into the
                  source directory and link or rename it to libatomic_ops.

Fixes:
 - http://autobuild.buildroot.org/results/4c7a1b690d1b12e39b6b24f8cc8a144f79c73711

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gauche/gauche.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gauche/gauche.mk b/package/gauche/gauche.mk
index 7c43bd4573..b635c488fe 100644
--- a/package/gauche/gauche.mk
+++ b/package/gauche/gauche.mk
@@ -12,7 +12,7 @@ GAUCHE_LICENSE_FILES = COPYING
 GAUCHE_DEPENDENCIES = host-gauche
 
 HOST_GAUCHE_CONF_OPTS = --without-zlib
-GAUCHE_CONF_OPTS = --without-libatomic-ops
+GAUCHE_CONF_OPTS = --with-libatomic-ops=none
 
 # Enable embedded axTLS
 GAUCHE_TLS_LIBS = axtls
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
