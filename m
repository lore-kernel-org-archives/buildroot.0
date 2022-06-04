Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE4BEC433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 14:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08CEB60AAE;
	Sat,  4 Jun 2022 14:35:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SL1dZlmfwSjC; Sat,  4 Jun 2022 14:35:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3374360AD1;
	Sat,  4 Jun 2022 14:35:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06AC91BF322
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 14:35:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9348405C7
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 14:35:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eskHEGFJfAvn for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 14:35:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 21DD44002B
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 14:35:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 5A69B8688A; Sat,  4 Jun 2022 14:23:29 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 4 Jun 2022 16:35:06 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bc3de65655d10d8a4d2d09f37051014c933eacfd
X-Git-Newrev: dc08bff26c0c4fd74893493d27f633ceb8183442
X-Patchwork-Hint: ignore
Message-Id: <20220604142329.5A69B8688A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netdata: disable cloud
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc08bff26c0c4fd74893493d27f633ceb8183442
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable cloud to avoid the following build failures raised since bump to
version 1.33.1 in commit 73dc2eef2dc40b78e732872b26eee0bcea1087d1 and
https://github.com/netdata/netdata/commit/e7e5d0c37242d8457e4b2610a95effe0db5ca1b1:

In file included from aclk/aclk.c:7:
aclk/aclk_otp.h:11:23: error: unknown type name 'RSA'
   11 | int aclk_get_mqtt_otp(RSA *p_key, char **mqtt_id, char **mqtt_usr, char **mqtt_pass, url_t *target);
      |                       ^~~
aclk/aclk.c:48:8: error: unknown type name 'RSA'
   48 | static RSA *aclk_private_key = NULL;
      |        ^~~
aclk/aclk.c: In function 'load_private_key':
aclk/aclk.c:52:9: warning: implicit declaration of function 'RSA_free' [-Wimplicit-function-declaration]
   52 |         RSA_free(aclk_private_key);
      |         ^~~~~~~~
aclk/aclk.c:65:5: error: unknown type name 'BIO'; did you mean 'EIO'?
   65 |     BIO *key_bio = BIO_new_mem_buf(private_key, -1);
      |     ^~~
      |     EIO

[...]

In file included from database/sqlite/../../aclk/aclk.h:6:0,
                 from database/sqlite/sqlite_aclk.c:10:
database/sqlite/../../aclk/aclk_util.h:6:29: fatal error: mqtt_wss_client.h: No such file or directory
compilation terminated.

Fixes:
 - http://autobuild.buildroot.org/results/6c87c0d1699fd518a989cb81a191419f427accc5
 - http://autobuild.buildroot.org/results/aa77c027316b45e812eaf9ced61fb8e967bb987f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/netdata/netdata.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/netdata/netdata.mk b/package/netdata/netdata.mk
index 4287e8406b..04b146591f 100644
--- a/package/netdata/netdata.mk
+++ b/package/netdata/netdata.mk
@@ -12,6 +12,7 @@ NETDATA_LICENSE = GPL-3.0+
 NETDATA_LICENSE_FILES = LICENSE
 NETDATA_CPE_ID_VENDOR = netdata
 NETDATA_CONF_OPTS = \
+	--disable-cloud \
 	--disable-dbengine \
 	--disable-ebpf \
 	--disable-ml \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
