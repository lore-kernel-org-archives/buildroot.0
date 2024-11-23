Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB31E6ADEA
	for <buildroot@archiver.kernel.org>; Sat, 23 Nov 2024 09:40:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58D2A42D3B;
	Sat, 23 Nov 2024 09:40:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ihNsyg0sIDQr; Sat, 23 Nov 2024 09:40:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D459242D37
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D459242D37;
	Sat, 23 Nov 2024 09:40:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EC4631D8B
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 09:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA94561495
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 09:40:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dqg2c7lEjKMx for <buildroot@buildroot.org>;
 Sat, 23 Nov 2024 09:40:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 19BC96148F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 19BC96148F
 for <buildroot@buildroot.org>; Sat, 23 Nov 2024 09:40:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 07CCC863C9; Sat, 23 Nov 2024 09:40:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 23 Nov 2024 10:39:18 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 687de602f5787e0cd42baa36d73f47f49cffac7d
X-Git-Newrev: 985d126cd78e2b071a57532e5b18867ef3481378
X-Patchwork-Hint: ignore
Message-Id: <20241123094045.07CCC863C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/fbv: fetch from
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
Content-Type: multipart/mixed; boundary="===============8437632798753858768=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8437632798753858768==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=985d126cd78e2b071a57532e5b18867ef3481378
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

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
 

--===============8437632798753858768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8437632798753858768==--
