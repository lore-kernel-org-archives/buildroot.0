Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E414E6ADEA
	for <buildroot@archiver.kernel.org>; Sat, 23 Nov 2024 09:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2D366149C;
	Sat, 23 Nov 2024 09:39:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1oh-iNyYj7tQ; Sat, 23 Nov 2024 09:39:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84AA96149B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84AA96149B;
	Sat, 23 Nov 2024 09:39:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BE4B11D8B
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 09:39:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ABFDA61495
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 09:39:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6yKEGZnhlOLI for <buildroot@buildroot.org>;
 Sat, 23 Nov 2024 09:39:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91D4A6148F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 91D4A6148F
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 09:39:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 792AF863B0; Sat, 23 Nov 2024 09:39:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 23 Nov 2024 10:36:04 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 45963b1c7c0390a3a59f7eab49b50fd8b695b218
X-Git-Newrev: ba77d95931cb31f27dd7ac014fa1caa233a74020
X-Patchwork-Hint: ignore
Message-Id: <20241123093938.792AF863B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/fbv: fetch from
 sources.buildroot.net
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
Content-Type: multipart/mixed; boundary="===============8736393084936881516=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8736393084936881516==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ba77d95931cb31f27dd7ac014fa1caa233a74020
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Fixes https://gitlab.com/buildroot.org/buildroot/-/issues/73

Upstream is no longer accessible, and wget takes a long time (~7 minutes)
before it times out and falls back to s.b.n, so use that instead right away:

wget --passive-ftp -nd -t 3 -O '/home/peko/source/buildroot/output/build/.fbv-1.0b.tar.gz.GBHVap/output' 'http://s-tech.elsat.net.pl/fbv/fbv-1.0b.tar.gz'
--2024-11-21 17:06:55--  http://s-tech.elsat.net.pl/fbv/fbv-1.0b.tar.gz
Resolving s-tech.elsat.net.pl (s-tech.elsat.net.pl)... 85.11.67.252
Connecting to s-tech.elsat.net.pl (s-tech.elsat.net.pl)|85.11.67.252|:80... failed: Connection timed out.
Retrying.

--2024-11-21 17:09:07--  (try: 2)  http://s-tech.elsat.net.pl/fbv/fbv-1.0b.tar.gz
Connecting to s-tech.elsat.net.pl (s-tech.elsat.net.pl)|85.11.67.252|:80... failed: Connection timed out.
Retrying.

--2024-11-21 17:11:19--  (try: 3)  http://s-tech.elsat.net.pl/fbv/fbv-1.0b.tar.gz
Connecting to s-tech.elsat.net.pl (s-tech.elsat.net.pl)|85.11.67.252|:80... failed: Connection timed out.
Giving up.

wget --passive-ftp -nd -t 3 -O '/home/peko/source/buildroot/output/build/.fbv-1.0b.tar.gz.MxQ1k0/output' 'https://sources.buildroot.net/fbv/fbv-1.0b.tar.gz'
--2024-11-21 17:13:30--  https://sources.buildroot.net/fbv/fbv-1.0b.tar.gz
Resolving sources.buildroot.net (sources.buildroot.net)... 104.26.0.37, 104.26.1.37, 172.67.72.56, ...
Connecting to sources.buildroot.net (sources.buildroot.net)|104.26.0.37|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 18989 (19K) [application/x-gtar-compressed]
Saving to: ‘/home/peko/source/buildroot/output/build/.fbv-1.0b.tar.gz.MxQ1k0/output’

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fbv/fbv.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fbv/fbv.mk b/package/fbv/fbv.mk
index a69e4ad518..4edfcf0ed0 100644
--- a/package/fbv/fbv.mk
+++ b/package/fbv/fbv.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 FBV_VERSION = 1.0b
-FBV_SITE = http://s-tech.elsat.net.pl/fbv
-
+# upstream (http://s-tech.elsat.net.pl/fbv) dead
+FBV_SITE = http://sources.buildroot.net/fbv
 FBV_LICENSE = GPL-2.0
 FBV_LICENSE_FILES = COPYING
 

--===============8736393084936881516==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8736393084936881516==--
