Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA254C04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 14:14:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CF6C81911;
	Fri, 17 May 2024 14:14:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DqdgKVZiPsZ8; Fri, 17 May 2024 14:14:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D11A81951
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D11A81951;
	Fri, 17 May 2024 14:14:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 748A81BF215
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 14:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6167C404C1
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 14:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VXPtloYRjD60 for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 14:14:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4C7B340025
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C7B340025
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4C7B340025
 for <buildroot@buildroot.org>; Fri, 17 May 2024 14:14:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 859E1C0007;
 Fri, 17 May 2024 14:14:15 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1s7yLe-007CWu-2o;
 Fri, 17 May 2024 16:14:14 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 17 May 2024 16:14:13 +0200
Message-Id: <20240517141413.1716448-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH] package/procps-ng/S02sysctl: pass SYSCTL_ARGS
 before -p argument for busybox
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
