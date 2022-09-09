Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA87ECAAA1
	for <buildroot@archiver.kernel.org>; Fri,  9 Sep 2022 19:46:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2A66416FF;
	Fri,  9 Sep 2022 19:45:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2A66416FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZKU5SmmmzAan; Fri,  9 Sep 2022 19:45:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 797FF41716;
	Fri,  9 Sep 2022 19:45:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 797FF41716
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1AFC31BF384
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 19:45:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA2F241716
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 19:45:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA2F241716
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CzuBr4YE-n7z for <buildroot@lists.busybox.net>;
 Fri,  9 Sep 2022 19:45:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C46041705
 for <buildroot@buildroot.org>; Fri,  9 Sep 2022 19:45:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C46041705
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 58DBD82D9C; Fri,  9 Sep 2022 19:45:52 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 9 Sep 2022 21:45:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8560315ab29eba19b1917e93f499716cc75a11f1
X-Git-Newrev: cc9d55e19f564afc5a36be482329c43637252a6f
X-Patchwork-Hint: ignore
Message-Id: <20220909194552.58DBD82D9C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-autotools.mk: only pass
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cc9d55e19f564afc5a36be482329c43637252a6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
