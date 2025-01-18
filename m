Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0B6C02188
	for <buildroot@archiver.kernel.org>; Sat, 18 Jan 2025 11:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 086824252B;
	Sat, 18 Jan 2025 11:55:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VB628zwGGFpT; Sat, 18 Jan 2025 11:55:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D6B824266C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6B824266C;
	Sat, 18 Jan 2025 11:55:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FABD2F96
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 11:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 705204266C
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 11:55:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zKwk35Dfjoad for <buildroot@buildroot.org>;
 Sat, 18 Jan 2025 11:55:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 70A0E42530
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70A0E42530
 for <buildroot@buildroot.org>; Sat, 18 Jan 2025 11:55:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E74E85D91; Sat, 18 Jan 2025 11:55:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 18 Jan 2025 12:42:06 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 9e25b3b39591fa50c00f31ed14847c6210c3d7fd
X-Git-Newrev: 45958ec3d68ef9c52d8c0490d30223ff1e92b139
X-Patchwork-Hint: ignore
Message-Id: <20250118115506.5E74E85D91@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/gpsd: python
 support needs pyserial
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

commit: https://git.buildroot.net/buildroot/commit/?id=45958ec3d68ef9c52d8c0490d30223ff1e92b139
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
(cherry picked from commit 5d2f3737a1e52d140bd412bf01241eecf5cff994)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gpsd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gpsd/Config.in b/package/gpsd/Config.in
index 44615f4e43..4f1c6f6315 100644
--- a/package/gpsd/Config.in
+++ b/package/gpsd/Config.in
@@ -80,6 +80,7 @@ config BR2_PACKAGE_GPSD_PYTHON
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
