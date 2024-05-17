Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F89C25B79
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 14:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E5176067E;
	Fri, 17 May 2024 14:41:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xahyoGYofzOq; Fri, 17 May 2024 14:41:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 117D760744
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 117D760744;
	Fri, 17 May 2024 14:41:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E96201BF2B6
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 14:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0ED98230A
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 14:41:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ra9dgum8ZBq7 for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 14:41:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E821822FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E821822FF
 for <buildroot@buildroot.org>; Fri, 17 May 2024 14:41:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1642C8745D; Fri, 17 May 2024 14:41:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 17 May 2024 16:39:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7b3c0b19d4d587f52546ac92386e8a890022bb24
X-Git-Newrev: 60b02eb6c6863e505289c7f8200c80fe1596fa10
X-Patchwork-Hint: ignore
Message-Id: <20240517144149.1642C8745D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/procps-ng/S02sysctl: pass
 SYSCTL_ARGS before -p argument for busybox
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

commit: https://git.buildroot.net/buildroot/commit/?id=60b02eb6c6863e505289c7f8200c80fe1596fa10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The busybox sysctl applet expects all arguments after -p to be filenames to
read:

sysctl -p file -h
sysctl: -h: No such file or directory

VS:

sysctl -h -p file
sysctl: invalid option -- 'h'
BusyBox v1.36.1 (2024-05-17 15:27:21 CEST) multi-call binary.

Usage: sysctl [-enq] { -a | -p [FILE]... | [-w] [KEY[=VALUE]]... }

Show/set kernel parameters

        -e      Don't warn about unknown keys
        -n      Don't show key names
        -q      Quiet
        -a      Show all values
        -p      Set values from FILEs (default /etc/sysctl.conf)
        -w      Set values

This seems to be the intented behaviour:
https://git.busybox.net/busybox/tree/procps/sysctl.c#n317

Notice: The procps-ng variant is happy with both:

sysctl -p file -h

Usage:
 sysctl [options] [variable[=value] ...]

VS:

sysctl -h -p file

Usage:
 sysctl [options] [variable[=value] ...]

So pass SYSCTL_ARGS before the -p args so custom sysctl arguments can be
passed.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/procps-ng/S02sysctl | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/procps-ng/S02sysctl b/package/procps-ng/S02sysctl
index 85d9ed50d0..c202833ab8 100644
--- a/package/procps-ng/S02sysctl
+++ b/package/procps-ng/S02sysctl
@@ -43,7 +43,7 @@ run_logger() {
 				break
 			}
 			echo "* Applying $file ..."
-			/sbin/sysctl -p "$file" $SYSCTL_ARGS || prog_status="FAIL"
+			/sbin/sysctl $SYSCTL_ARGS -p "$file" || prog_status="FAIL"
 		done 2>&1 >&3 | /usr/bin/logger -t sysctl -p kern.err
 	} 3>&1 | /usr/bin/logger -t sysctl -p kern.info
 }
@@ -60,7 +60,7 @@ run_std() {
 				break
 			}
 			echo "* Applying $file ..."
-			/sbin/sysctl -p "$file" $SYSCTL_ARGS || prog_status="FAIL"
+			/sbin/sysctl $SYSCTL_ARGS -p "$file" || prog_status="FAIL"
 		done
 	}
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
