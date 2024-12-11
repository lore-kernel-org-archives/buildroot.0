Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7F8C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:36:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 016476FBFE;
	Fri, 28 Feb 2025 16:36:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4PBqmGxtbcCE; Fri, 28 Feb 2025 16:36:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3AA76FC06
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3AA76FC06;
	Fri, 28 Feb 2025 16:36:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ABF368
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0A6F842471
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TfRJt43idBV6 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B036941A30
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B036941A30
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A308086D17; Fri, 28 Feb 2025 16:29:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Dec 2024 14:10:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c12008448e6d0f78774b386fb0f66a14c3064eed
X-Git-Newrev: 65f268e21cbe450e1addb64cca1b9de73c420076
X-Patchwork-Hint: ignore
Message-Id: <20250228162936.A308086D17@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/arm-gnu-toolchain: add
 BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_SUPPORTS
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=65f268e21cbe450e1addb64cca1b9de73c420076
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

ARM gnu toolchain for bare metal arm32 target is only available for
x86_64 and aarch64 hosts. Introduce a new option to disable packages
using this toolchain on unsupported hosts.

[Romain: improve commit log]
Signed-off-by: Bryce Johnson <bryce@redpinelabs.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/Config.in.host                   | 1 +
 package/arm-gnu-toolchain/Config.in.host | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/Config.in.host b/package/Config.in.host
index 191833d94d..e06824ad6b 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -6,6 +6,7 @@ menu "Host utilities"
 	source "package/amlogic-boot-fip/Config.in.host"
 	source "package/andes-spi-burn/Config.in.host"
 	source "package/android-tools/Config.in.host"
+	source "package/arm-gnu-toolchain/Config.in.host"
 	source "package/asn1c/Config.in.host"
 	source "package/babeltrace2/Config.in.host"
 	source "package/bmap-tools/Config.in.host"
diff --git a/package/arm-gnu-toolchain/Config.in.host b/package/arm-gnu-toolchain/Config.in.host
new file mode 100644
index 0000000000..dfd30e5223
--- /dev/null
+++ b/package/arm-gnu-toolchain/Config.in.host
@@ -0,0 +1,4 @@
+config BR2_PACKAGE_HOST_ARM_GNU_TOOLCHAIN_SUPPORTS
+	bool "host arm-gnu-toolchain"
+	default y if BR2_HOSTARCH = "aarch64"
+	default y if BR2_HOSTARCH = "x86_64"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
