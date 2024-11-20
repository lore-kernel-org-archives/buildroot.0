Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B0FD743D8
	for <buildroot@archiver.kernel.org>; Wed, 20 Nov 2024 21:04:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F62F610C5;
	Wed, 20 Nov 2024 21:04:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FDMa0zRqd1gD; Wed, 20 Nov 2024 21:04:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 504636FA2E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 504636FA2E;
	Wed, 20 Nov 2024 21:04:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 55C3B5B28
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6FC5E60B92
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:04:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xrMtFxX336-A for <buildroot@buildroot.org>;
 Wed, 20 Nov 2024 21:04:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C974610C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C974610C1
 for <buildroot@buildroot.org>; Wed, 20 Nov 2024 21:04:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6BE6A86505; Wed, 20 Nov 2024 21:04:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 20 Nov 2024 21:46:19 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 38065ea890737e4d8061d170106b1995632e7842
X-Git-Newrev: dfb9f3412ad6dffbed03a50790d2c005915909b6
X-Patchwork-Hint: ignore
Message-Id: <20241120210408.6BE6A86505@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/ntp: add
 upstream-provided patch to fix regression
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

commit: https://git.buildroot.net/buildroot/commit/?id=dfb9f3412ad6dffbed03a50790d2c005915909b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

This patch fixes a regression [1] introduced in ntpd 4.2.8p18 [2].

  ntpd[200]: Listen normally on 3 lo [::1]:123
  ntpd[200]: bind(20) AF_INET6 [fe80::bf3d:254d:dee0:d345%3]:123 flags 0x811 failed: Cannot assign requested address
  ntpd[200]: unable to create socket on enp0s3 (4) for [fe80::bf3d:254d:dee0:d345%3]:123
  ntpd[192]: daemon control: got EOF
  ntpd[192]: daemon child died with signal 11
  systemd[1]: ntpd.service: Control process exited, code=exited, status=70/SOFTWARE
  systemd[1]: ntpd.service: Failed with result 'exit-code'.
  systemd[1]: Failed to start Network Time Service.

If the IPv6 link-local interface was not ready for binding on the first
attempt, ntpd would segfault in update_interfaces(). The segfault would
only occur when ntpd was started as part of the boot sequence. Most
- but not all - boots were affected. Evidently it could happen that the
timing of ntpd's start up was delayed enough that the IPv6 link-local
interface was ready for the bind() call when it was first issued by
open_socket() via create_interface().

[1]: https://bugs.ntp.org/show_bug.cgi?id=3928
[2]: https://bugs.ntp.org/show_bug.cgi?id=3913

Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 489e38fd2c16f9de2a187a4774df29f8c929bc30)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0004-Fix-crash-when-binding-IPv6-address.patch | 38 ++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/package/ntp/0004-Fix-crash-when-binding-IPv6-address.patch b/package/ntp/0004-Fix-crash-when-binding-IPv6-address.patch
new file mode 100644
index 0000000000..b4e7378a32
--- /dev/null
+++ b/package/ntp/0004-Fix-crash-when-binding-IPv6-address.patch
@@ -0,0 +1,38 @@
+Fix crash when binding IPv6 address
+
+Reference:
+  https://bugs.ntp.org/show_bug.cgi?id=3928
+
+Upstream: https://people.nwtime.org/hart/ntp-stable-3928-29.tar.gz
+
+Ported fix from updated tarball provided by upstream:
+https://bugs.ntp.org/show_bug.cgi?id=3928#c14
+
+Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
+---
+ ntpd/ntp_io.c |    6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+Index: ntp-4.2.8p18/ntpd/ntp_io.c
+===================================================================
+--- ntp-4.2.8p18.orig/ntpd/ntp_io.c
++++ ntp-4.2.8p18/ntpd/ntp_io.c
+@@ -1917,15 +1917,15 @@ update_interfaces(
+ 			}
+ 			new_interface_found = TRUE;
+ 			DPRINT_INTERFACE(3,
+-				(ep, "updating ", " new - created\n"));
++				(ep2, "updating ", " new - created\n"));
+ 		}
+ 		else {
+ 			DPRINT_INTERFACE(3,
+-				(ep, "updating ", " new - FAILED"));
++				(ep2, "updating ", " new - FAILED"));
+ 
+ 			msyslog(LOG_ERR,
+ 				"cannot bind address %s",
+-				stoa(&ep->sin));
++				stoa(&ep2->sin));
+ 		}
+ 		free(ep2);
+ 	}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
