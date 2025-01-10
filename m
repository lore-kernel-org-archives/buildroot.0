Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDE6C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 673BF84BFA;
	Fri, 28 Feb 2025 16:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kqo4zsVhkhZW; Fri, 28 Feb 2025 16:52:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7454884C3F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7454884C3F;
	Fri, 28 Feb 2025 16:52:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F292711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EFAA942F53
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jjoAQfqenRDt for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9554242528
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9554242528
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F58084C4E; Fri, 28 Feb 2025 16:30:00 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 10 Jan 2025 18:49:45 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: cc2866ccec465623cf6deadc641b879fc61c561b
X-Git-Newrev: 5d2f3737a1e52d140bd412bf01241eecf5cff994
X-Patchwork-Hint: ignore
Message-Id: <20250228163000.8F58084C4E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/gpsd: python support
 needs pyserial
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5d2f3737a1e52d140bd412bf01241eecf5cff994
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Usually, ubxtool, a python-based tool to drive u-blox devices, connects
to a gpsd instance and delegates to it the responsibility to write to
and read from the actual device. This is sane, because a serial device
can only be opened once, and if gpsd is running, it has that device
open.

However, in some cases, ubxtool can be used to directly talk to the
device, to pre-configure it before gpsd runs, or even in the absence of
gpsd altogether. This is not used very often, except when setting up an
RTK base, where gpsd is not needed.

In that case, ubxtool will directly talk to the serial device. It uses
the pyserial python module. Since this is not the traditional way to
talk to the device, failure to import the module is ignored, and the
error reporting is deferred until it is actually needed, which is why we
did not catch the issue earlier. See [1] and [2].

Fixes: f3ef0723cf71 (package/gpsd: enable python support and modules)

[1] https://gitlab.com/gpsd/gpsd/-/blob/release-3.25/clients/ubxtool.py.in#L47
[2] https://gitlab.com/gpsd/gpsd/-/blob/release-3.25/gps/gps.py.in#L36

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Bernd Kuhls <bernd@kuhls.net>
[Julien: add link to described code portion]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/gpsd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 92a124b8ac..fa4dc7a814 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -238,6 +238,7 @@ config BR2_PACKAGE_GPSD_PYTHON
 	bool "build Python support and modules"
 	depends on BR2_USE_WCHAR # python3
 	select BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_SERIAL # runtime
 	help
 	  Python libraries and tools for the gpsd service daemon
 	  including gpsfake test harness.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
