Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D397BC0218A
	for <buildroot@archiver.kernel.org>; Sat,  1 Feb 2025 12:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 992556FB07;
	Sat,  1 Feb 2025 12:38:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jbojyeNP4c58; Sat,  1 Feb 2025 12:38:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A028E6FBC5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A028E6FBC5;
	Sat,  1 Feb 2025 12:38:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B1519183
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 12:38:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 94C6E4031A
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 12:38:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WzXbxflS62rs for <buildroot@buildroot.org>;
 Sat,  1 Feb 2025 12:38:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93A88400F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 93A88400F1
 for <buildroot@buildroot.org>; Sat,  1 Feb 2025 12:38:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 826A2861E4; Sat,  1 Feb 2025 12:38:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 1 Feb 2025 13:18:37 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: c06e05409fe97be52d61dd00370609694b20cd61
X-Git-Newrev: d63647b8b5193126dd018942ed8da8489d365c3c
X-Patchwork-Hint: ignore
Message-Id: <20250201123839.826A2861E4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/xen: xen tools
 needs bash at runtime
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4835431073222849815=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4835431073222849815==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=d63647b8b5193126dd018942ed8da8489d365c3c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

When the Xen tools are built, a number of init scripts are installed to
the target.

Some of those Xen scripts require bash to run:
- /etc/init.d/S50xencommons
- /etc/init.d/S50xen-watchdog
- /etc/init.d/S60xendomains
- /etc/xen/scripts/launch-xenstore
- /usr/lib/xen/bin/xendomains

Make sure to select bash when the Xen tools are selected (we need to
select "busybox show others" for that, too).

Suggested-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Vincent Stehlé <vincent.stehle@laposte.net>
Cc: Alistair Francis <alistair@alistair23.me>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit bf18fd4cd183eab2e91b91d275fc62e2707b9182)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xen/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/xen/Config.in b/package/xen/Config.in
index 577066666d..70a06f3cbf 100644
--- a/package/xen/Config.in
+++ b/package/xen/Config.in
@@ -33,6 +33,8 @@ config BR2_PACKAGE_XEN_TOOLS
 	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
 	select BR2_PACKAGE_YAJL
 	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_BASH # runtime (scripts)
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX # bash
 	help
 	  The Xen tools can be accessed by the xl command.
 

--===============4835431073222849815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4835431073222849815==--
