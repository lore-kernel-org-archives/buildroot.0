Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A88C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 18:47:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FC5460FF2
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 18:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4FC5460FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D86B5401E8;
	Sun,  1 Aug 2021 18:47:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RUFylxf3Lsbx; Sun,  1 Aug 2021 18:47:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D13CC400DF;
	Sun,  1 Aug 2021 18:47:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED5FC1BF399
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 18:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DAFBA403A9
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 18:47:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e-jhbboUfeH1 for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 18:47:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 08AFD403A2
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 18:47:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 2FEA58A4AC; Sun,  1 Aug 2021 18:47:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 20:47:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4634e84978a3e64e9050021d209a41cd88a1ad16
X-Git-Newrev: 0239ea5615a24469b6160f371fbec2735c89d4af
X-Patchwork-Hint: ignore
Message-Id: <20210801184724.2FEA58A4AC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libloki: fix build with gcc 11
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

commit: https://git.buildroot.net/buildroot/commit/?id=0239ea5615a24469b6160f371fbec2735c89d4af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 11:

In file included from ../include/loki/SmartPtr.h:33,
                 from SmartPtr.cpp:20:
../include/loki/SmallObj.h: At global scope:
../include/loki/SmallObj.h:462:57: error: ISO C++17 does not allow dynamic exception specifications
  462 |         static void * operator new ( std::size_t size ) throw ( std::bad_alloc )
      |

Fixes:
 - http://autobuild.buildroot.org/results/768727160beaca5df3ef18be29cfbaa3ced67ad5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libloki/libloki.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libloki/libloki.mk b/package/libloki/libloki.mk
index 7564239f6a..07a9372df9 100644
--- a/package/libloki/libloki.mk
+++ b/package/libloki/libloki.mk
@@ -23,6 +23,7 @@ endif
 
 define LIBLOKI_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11" \
 		-C $(@D) $(LIBLOKI_BUILD_TARGETS)
 endef
 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
