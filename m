Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E50CA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A2A661B4D;
	Thu, 21 Aug 2025 19:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vZEBhcRIrgv0; Thu, 21 Aug 2025 19:20:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 552D061B48
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 552D061B48;
	Thu, 21 Aug 2025 19:20:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E1C571C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79C6741921
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HYFS0U6BsEkM for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2CBD4192B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C2CBD4192B
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BF5618403C; Thu, 21 Aug 2025 19:20:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:54:26 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 761d5434c91bcac110492fe34a96fea7db67dd21
X-Git-Newrev: e36bbb0e2e02b95c25455fca1e3e67bdddcff4db
X-Patchwork-Hint: ignore
Message-Id: <20250821192014.BF5618403C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/setserial:
 autoreconfigure for compatibility with newer toolchains
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e36bbb0e2e02b95c25455fca1e3e67bdddcff4db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Newer toolchains silently fail during configure step. After some
investigation, it is because -Wimplicit-int is returned for one of the
simplest test from the in-package configure file and thus fail the
configure step early, when checking if the compiler can produce an
executable.

Let's fix this by simply regenerating the configure file, similarly to
what Debian is doing, c.f. debian/rules.

Fixes:

  https://autobuild.buildroot.net/results/ff7a9c3c42f11a2ab71fb04ff0f6d593ac9ee327/

(but there are more build failures later, fixed in a follow-up commit)

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 26077c2d41cd8dc827b91d5345efbc43f7eca9ab)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/setserial/setserial.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index 002bf21161..6567738e76 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -13,6 +13,8 @@ SETSERIAL_LICENSE_FILES = debian/copyright
 # make all also builds setserial.cat which needs nroff
 SETSERIAL_MAKE_OPTS = setserial
 
+SETSERIAL_AUTORECONF = YES
+
 # Extract the Debian tarball inside the sources
 define SETSERIAL_DEBIAN_EXTRACT
 	$(call suitable-extractor,$(notdir $(SETSERIAL_EXTRA_DOWNLOADS))) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
