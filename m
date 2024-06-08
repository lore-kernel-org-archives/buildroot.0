Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C254C27C65
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 13:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C492845F6;
	Sat,  8 Jun 2024 13:09:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HqBZIZGmZUlK; Sat,  8 Jun 2024 13:09:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F4064845FD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F4064845FD;
	Sat,  8 Jun 2024 13:09:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5A1461BF41A
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E90B40119
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 13:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3737o_XXQ3sM for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 13:08:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2906B40253
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2906B40253
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 13:08:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 255A787DE6; Sat,  8 Jun 2024 13:08:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 15:07:52 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 862aeb78303c7eb8b82e73ade65b6cf4308d2e58
X-Git-Newrev: 141e2aa770849a87194ce65c70ecc01eab525dec
X-Patchwork-Hint: ignore
Message-Id: <20240608130852.255A787DE6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x]
 package/procps-ng/S02sysctl: pass SYSCTL_ARGS before -p argument for
 busybox
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

commit: https://git.buildroot.net/buildroot/commit/?id=141e2aa770849a87194ce65c70ecc01eab525dec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
(cherry picked from commit 60b02eb6c6863e505289c7f8200c80fe1596fa10)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
