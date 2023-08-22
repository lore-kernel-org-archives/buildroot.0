Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD2AEE49AB
	for <buildroot@archiver.kernel.org>; Tue, 22 Aug 2023 20:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43E0A40959;
	Tue, 22 Aug 2023 20:11:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43E0A40959
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AF62C47Z3IUI; Tue, 22 Aug 2023 20:11:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3098441548;
	Tue, 22 Aug 2023 20:11:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3098441548
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2DD641BF33D
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14EAE81A1C
 for <buildroot@lists.busybox.net>; Tue, 22 Aug 2023 20:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14EAE81A1C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tcEPVuUQFEIU for <buildroot@lists.busybox.net>;
 Tue, 22 Aug 2023 20:11:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E2E08175D
 for <buildroot@buildroot.org>; Tue, 22 Aug 2023 20:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E2E08175D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1DC638618E; Tue, 22 Aug 2023 20:11:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 22 Aug 2023 22:10:36 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 290f3985ddea38887818bd982cdb153f5698cdb1
X-Git-Newrev: c93788350aa04a19884638ffa3c24446572d8169
X-Patchwork-Hint: ignore
Message-Id: <20230822201148.1DC638618E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/swupdate: install
 headers at the standard location
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

commit: https://git.buildroot.net/buildroot/commit/?id=c93788350aa04a19884638ffa3c24446572d8169
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In commit eb2f2886b2364e5b6a0867f55106bf83acb064e7 ("package/swupdate:
add staging install"), the swupdate package was changed to also be
installed in the staging directory, as it provides an API to external
programs, through libraries and headers.

Back then the commit log said:

    This patch installs headers and libs to STAGING_DIR, to prevent a
    header name collision a subdirectory /usr/include/swupdate creates.

And indeed a custom INCLUDEDIR was specified. However, installing
swupdate headers in /usr/include/swupdate/ doesn't work well, as
progress_ipc.h (installed by swupdate) does a #include
<swupdate_status.h>, which doesn't work as swupdate_status.h is also
in /usr/include/swupdate/ instead of /usr/include/.

To address this Daniel Lang submitted a patch [0], which was proposed
to upstream swupdate to fix this header inclusion. The patch was
rejected by upstream saying that the swupdate header files should be
installed in /usr/include.

Currently, swupdate installs only 3 headers files:

  /usr/include/network_ipc.h
  /usr/include/swupdate_status.h
  /usr/include/progress_ipc.h

To the best of our knowledge, this doesn't conflict with any other
header files installed by other packages. A good proof of that is that
even Debian (which has many more packages than Buildroot) also
installs swupdate headers directly in /usr/include.

In addition, the original submitter of
eb2f2886b2364e5b6a0867f55106bf83acb064e7 said "I'm not remember what
was a problem. Probably network_ipc.h but Im not sure now. I think
it's safe to install this headers to /usr/include w/o subdir if this
collision was met only in my environment. PS: currently I don't see
any collisions with this files."

So, we switch to installing swupdate into their standard location.

[0] https://patchwork.ozlabs.org/project/buildroot/patch/VI1P190MB0493D233ECC579510F8C0FC69FB29@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Tested-by: Daniel Lang <dalang@gmx.at>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/swupdate/swupdate.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 11a3946753..84905d2e0a 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -230,7 +230,7 @@ endef
 define SWUPDATE_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(SWUPDATE_MAKE_ENV) $(MAKE) -C $(@D) \
 		$(SWUPDATE_MAKE_OPTS) DESTDIR=$(STAGING_DIR) \
-		INCLUDEDIR=/usr/include/swupdate install
+		install
 endef
 
 define SWUPDATE_INSTALL_TARGET_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
