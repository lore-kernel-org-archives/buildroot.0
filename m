Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2457C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:12:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B552460EC0
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:12:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B552460EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C10940654;
	Tue,  3 Aug 2021 23:12:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bRs_GxxJWTs8; Tue,  3 Aug 2021 23:12:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6D1340632;
	Tue,  3 Aug 2021 23:12:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DE7751BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A206640680
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ar5jNW1QIUhv for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E6C140552
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B715086434; Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 20 Jun 2021 18:26:16 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f5c0c74ebe1ce91fa12073f7c9f5652befa31541
X-Git-Newrev: cc1c8c3bb1ca4a1f1d2978f3cc100d292c70db8b
X-Patchwork-Hint: ignore
Message-Id: <20210803210953.B715086434@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openswan: disable
 -Werror
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=cc1c8c3bb1ca4a1f1d2978f3cc100d292c70db8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Disable -Werror to avoid the following build failure with -DNDEBUG
raised since commit 5a8c50fe05afacc3cbe8e7347e238da9f242fab0

/srv/storage/autobuild/run/instance-2/output-1/build/openswan-3.0.0/programs/rsasigkey/rsasigkey.c:524:6: error: variable 'success' set but not used [-Werror=unused-but-set-variable]
  524 |  int success;
      |      ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/327a0f2b8f0c51bcbb3edb1c3671870d593e93b9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/openswan/openswan.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/openswan/openswan.mk b/package/openswan/openswan.mk
index 7f083f695d..bb56e4516c 100644
--- a/package/openswan/openswan.mk
+++ b/package/openswan/openswan.mk
@@ -15,7 +15,7 @@ OPENSWAN_MAKE_OPTS = ARCH=$(BR2_ARCH) CC="$(TARGET_CC)" POD2MAN="" XMLTO="" \
 	USERCOMPILE="$(TARGET_CFLAGS) $(if $(BR2_TOOLCHAIN_SUPPORTS_PIE),-fPIE)" \
 	USERLINK="$(TARGET_LDFLAGS) $(if $(BR2_TOOLCHAIN_SUPPORTS_PIE),-fPIE)" \
 	INC_USRLOCAL=/usr USE_KLIPS=false USE_MAST=false USE_NM=false \
-	USE_NOMANINSTALL=true
+	USE_NOMANINSTALL=true WERROR=""
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 OPENSWAN_DEPENDENCIES += libcurl
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
