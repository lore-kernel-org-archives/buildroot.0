Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9D3ECAAD3
	for <buildroot@archiver.kernel.org>; Fri,  9 Sep 2022 15:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 677FA8437C;
	Fri,  9 Sep 2022 15:56:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 677FA8437C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gnMK_mwwv-CQ; Fri,  9 Sep 2022 15:56:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A3738437A;
	Fri,  9 Sep 2022 15:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A3738437A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E02A1BF232
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 15:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 56DD140584
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 15:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56DD140584
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lsUzervcUC-8 for <buildroot@lists.busybox.net>;
 Fri,  9 Sep 2022 15:56:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6B00E40129
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6B00E40129
 for <buildroot@buildroot.org>; Fri,  9 Sep 2022 15:56:27 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::229])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id BB102D2014
 for <buildroot@buildroot.org>; Fri,  9 Sep 2022 15:49:43 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 40EBFFF804;
 Fri,  9 Sep 2022 15:49:29 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1oWgG1-00GdbB-1f; Fri, 09 Sep 2022 17:49:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri,  9 Sep 2022 17:49:25 +0200
Message-Id: <20220909154926.3965406-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/pkg-autotools.mk: only pass
 --runstatedir=/run if supported
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
(thttpd) http://autobuild.buildroot.net/results/f74/f74cae1d981b284a69d7a4e138faf97e45e44865/
(wipe) http://autobuild.buildroot.net/results/4dc/4dc77752d5851d8a71d234c0b284ca696e633754/

And (possibly, unable to reproduce locally):
http://autobuild.buildroot.net/results/658/65882e1f266e818fecef2892c9493d3b8e1e912e/

--runstatedir was added in autoconf 2.69b:
http://git.savannah.gnu.org/gitweb/?p=autoconf.git;a=commit;h=a197431414088a417b407b9b20583b2e8f7363bd

Some earlier autoconf versions (E.G. 2.13 as used by thttpd/wipe) get
confused if --runstatedir is passed, so only do so if it is supported (E.G.
present in the script).

With this change we can go back to passing --runstatedir instead of
runstatedir, so this effectively reverts commit c28b27032b926c2e
(package/pkg-autotools.mk: fix runtime path).

Suggested-by: Norbert Lange <nolange79@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-autotools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index b6224b349d..968662ddc6 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -187,7 +187,7 @@ define $(2)_CONFIGURE_CMDS
 		--exec-prefix=/usr \
 		--sysconfdir=/etc \
 		--localstatedir=/var \
-		runstatedir=/run \
+		`grep -q -e '--runstatedir' configure && printf '%s' --runstatedir=/run` \
 		--program-prefix="" \
 		--disable-gtk-doc \
 		--disable-gtk-doc-html \
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
