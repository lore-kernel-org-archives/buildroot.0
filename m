Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B752CC83F22
	for <buildroot@archiver.kernel.org>; Tue, 15 Jul 2025 19:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 853EE40EDB;
	Tue, 15 Jul 2025 19:21:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W3hN4LSVRuOP; Tue, 15 Jul 2025 19:21:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18DDB40E9A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18DDB40E9A;
	Tue, 15 Jul 2025 19:21:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3878511AA
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 19:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34D5982EDB
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 19:21:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FvH89XKI_tbc for <buildroot@buildroot.org>;
 Tue, 15 Jul 2025 19:21:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61F12831D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 61F12831D5
 for <buildroot@buildroot.org>; Tue, 15 Jul 2025 19:21:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4E674864F6; Tue, 15 Jul 2025 19:21:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 15 Jul 2025 21:13:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b17a5979c300c52c233bedc9717999dfacc2023c
X-Git-Newrev: ed99b77e5d276d62c2f4c9959b5c558a4f3c9e36
X-Patchwork-Hint: ignore
Message-Id: <20250715192136.4E674864F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/passt: needs headers >= 5.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ed99b77e5d276d62c2f4c9959b5c558a4f3c9e36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream passt only documents runtime dependencies; and they advertise
being able to run on kernel 3.8 or later. However, they do not document
the build dependencies.

As reported by Julien, since 2024_12_11.09478d5, upstream requires
kernel headers >= 5.0, as they make use of linux/vhost_types.h, only
introduced in 5.0.

Add a dependency to kernel headers, and propagate it to podman's passt
backend.

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/passt/Config.in  | 4 ++++
 package/podman/Config.in | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/package/passt/Config.in b/package/passt/Config.in
index a2d2f4f1fe..a93a088670 100644
--- a/package/passt/Config.in
+++ b/package/passt/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PASST
 	bool "passt"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
 	help
 	  passt: Plug A Simple Socket Transport
 	  pasta: Pack A Subtle Tap Abstraction
@@ -17,3 +18,6 @@ config BR2_PACKAGE_PASST
 	  hence not requiring any capabilities or privileges.
 
 	  https://passt.top/passt/about/
+
+comment "passt needs a toolchain w/ headers >= 5.0"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
diff --git a/package/podman/Config.in b/package/podman/Config.in
index 6bfd477f38..a6554a3ddc 100644
--- a/package/podman/Config.in
+++ b/package/podman/Config.in
@@ -72,8 +72,12 @@ choice
 
 config BR2_PACKAGE_PODMAN_NET_PASST
 	bool "passt/pasta"
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0  # passt
 	select BR2_PACKAGE_PASST  # runtime
 
+comment "passt/pasta backend needs a toolchain w/ headers >= 5.0"
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0
+
 config BR2_PACKAGE_PODMAN_NET_SLIRP4NETNS
 	bool "slirp4netns"
 	select BR2_PACKAGE_SLIRP4NETNS  # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
