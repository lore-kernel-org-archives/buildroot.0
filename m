Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31E20C54E58
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 11:46:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EBD9240A08;
	Mon, 18 Mar 2024 11:46:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pRghZ8LqV5JP; Mon, 18 Mar 2024 11:46:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A8A0D40A15
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8A0D40A15;
	Mon, 18 Mar 2024 11:46:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A2481BF366
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 11:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 435C181442
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 11:46:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YOPocFEZXthn for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 11:46:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AE9781446
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7AE9781446
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 11:46:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6854A8128E; Mon, 18 Mar 2024 11:46:14 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 18 Mar 2024 12:43:05 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: f12d8f2eaae0b97136f80d57582b39cd3f7d65f9
X-Git-Newrev: cfbc7c5c8daa548bc317de0ff605b20861163a1d
X-Patchwork-Hint: ignore
Message-Id: <20240318114614.6854A8128E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/openssh: fix
 dependencies with refpolicy
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

commit: https://git.buildroot.net/buildroot/commit/?id=cfbc7c5c8daa548bc317de0ff605b20861163a1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

Commit 2c5a82a29ceb (package/openssh: select linux-pam if refpolicy
upstream is selected) did not account for the linux-pam dependencies
before selecting it, causing unmet dependencies warnings (unfortunately,
not errors), such as:

    $ KCONFIG_SEED=0xCF227CF4 make randconfig
    WARNING: unmet direct dependencies detected for BR2_PACKAGE_LINUX_PAM
      Depends on [n]: BR2_ENABLE_LOCALE [=n] && BR2_USE_WCHAR [=n] && !BR2_STATIC_LIBS [=n] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 [=y]
      Selected by [y]:
      - BR2_PACKAGE_OPENSSH [=y] && BR2_USE_MMU [=y] && BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION [=y]

2c5a82a29ceb made the choice of having openssl bear the responsibility
to select linux-pam when the upstream refpolicy version was enabled.
Semantically however, the responsibility really lies within refpolicy
itself, since that's what imposes linux-pam to openssh.

Move the select to refpolicy and drop it from openssh. Then, ensure that
linux-pam is only selected when it is available.

That means that one may get an openssh that is not linked against
linux-pam, when the linux-pam dependencies are not met; refpolicy (by
way of libsepol) also has a more stringent requirement on gcc version
than linux-pam, so most probably the missing dependencies would be
locale, wchar, or a static build. We consider that situation to be a
corner case that we do not want to address.

In the future, we may have more similar situations, whereby refpolicy
would impose other packages be linked with otherwise optional
dependencies. If (when) that were (will be) the case, then the proposed
mechanism would quickly become ugly; we could then re-assess a nicer way
to do that. Until then, this is good ebough.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c20b2ae4ece10e07eeb80fcdd706a474d3be1475)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openssh/Config.in   | 1 -
 package/refpolicy/Config.in | 8 ++++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/openssh/Config.in b/package/openssh/Config.in
index a3038ba01f..08d3c7d391 100644
--- a/package/openssh/Config.in
+++ b/package/openssh/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_OPENSSH
 	bool "openssh"
 	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_LINUX_PAM if BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 0e72b895df..8ae8f0448d 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -36,6 +36,14 @@ choice
 
 config BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION
 	bool "Upstream version"
+	# Consider reworking the following when adding new entries:
+	# Upstream refpolicy for openssh expects linux-pam to be used
+	select BR2_PACKAGE_LINUX_PAM if BR2_PACKAGE_OPENSSH \
+		&& BR2_USE_MMU \
+		&& BR2_ENABLE_LOCALE \
+		&& BR2_USE_WCHAR \
+		&& !BR2_STATIC_LIBS \
+		&& BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	help
 	  Use the refpolicy as provided by Buildroot.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
