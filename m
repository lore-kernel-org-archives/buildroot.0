Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98A95CD37AB
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:09:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE47F40A40;
	Tue,  3 Sep 2024 19:09:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7UMrOJu5KO1E; Tue,  3 Sep 2024 19:09:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6EEBB40A63
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6EEBB40A63;
	Tue,  3 Sep 2024 19:09:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 330351BF267
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:09:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 20AAE40A21
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:09:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lbIu3sq9WEum for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:09:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C35B840A1A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C35B840A1A
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:09:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD3BF869E3; Tue,  3 Sep 2024 19:09:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 21:07:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8194a727a211bb944d78eb0b82ab952fb8083a5a
X-Git-Newrev: 9172ffc3b425e2520827d0592b1fffef59b906c5
X-Patchwork-Hint: ignore
Message-Id: <20240903190919.AD3BF869E3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/babeld: update URL site
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

commit: https://git.buildroot.net/buildroot/commit/?id=9172ffc3b425e2520827d0592b1fffef59b906c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported in [1], version 1.9.2 has been moved to another archive, and
it is recommended to use https://github.com/jech/babeld as the official
repository.

The use of the github macro:

$(call github,jech,babeld,babeld-$(BABELD_VERSION))

would have downloaded a file with the same name (e.g. babeld-1.9.2.tar.gz)
but with a different hash from the one downloaded from the previous URL,
creating unacceptable backward compatibility issues.
Therefore, it was decided to download the package via the git method. In
this way, the downloaded file is babeld-babeld-1.9.2-git4.tar.gz, thus
with a different name, to which its SHA can be associated without side
effects, except for breaking the release monitoring process.
Unfortunately, for now, we will have to live with this limitation.

Particularly interesting are the explanations provided by Yann E. Morin,
which you can find in [2], that guided the creation of this patch.

Fixes:
- http://autobuild.buildroot.org/results/2447060c86acf1bd8d6ee0bcf8f9b6adcdfc50c9

[1] https://alioth-lists.debian.net/pipermail/babel-users/2024-August/004187.html
[2] https://patchwork.ozlabs.org/project/buildroot/patch/20240901063634.3504315-1-dario.binacchi@amarulasolutions.com/

Co-Developed-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/babeld/babeld.hash | 2 +-
 package/babeld/babeld.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/babeld/babeld.hash b/package/babeld/babeld.hash
index 2e0513efa0..1c534d6184 100644
--- a/package/babeld/babeld.hash
+++ b/package/babeld/babeld.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  154f00e0a8bf35d6ea9028886c3dc5c3c342dd1a367df55ef29a547b75867f07  babeld-1.9.2.tar.gz
+sha256  22549e27645ecb9ef4c715a3cbeea01fa2dc7ea6951e8f97dc9c4a7b2a1de8f5  babeld-babeld-1.9.2-git4.tar.gz
 sha256  b415c41292cedef6c97b243609e50552887c29343566c639f23282d31efd2afd  LICENCE
diff --git a/package/babeld/babeld.mk b/package/babeld/babeld.mk
index 785fa2bce9..ac32e798c8 100644
--- a/package/babeld/babeld.mk
+++ b/package/babeld/babeld.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-BABELD_VERSION = 1.9.2
-BABELD_SITE = http://www.pps.univ-paris-diderot.fr/~jch/software/files
+BABELD_VERSION = babeld-1.9.2
+BABELD_SITE = https://github.com/jech/babeld
+BABELD_SITE_METHOD = git
 BABELD_LICENSE = MIT
 BABELD_LICENSE_FILES = LICENCE
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
