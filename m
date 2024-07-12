Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0BFEC2BD09
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 12:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14FE76066A;
	Fri, 12 Jul 2024 12:38:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6WaGla1kw4cz; Fri, 12 Jul 2024 12:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A413560B57
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A413560B57;
	Fri, 12 Jul 2024 12:38:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 479331BF995
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:38:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3262640240
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 12:38:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zGpEaxcYswnM for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 12:38:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57354400F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57354400F2
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 12:38:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4268885E01; Fri, 12 Jul 2024 12:38:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 12 Jul 2024 14:36:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 881a8f13465b1be19540f6e35f2a658d49f63dd7
X-Git-Newrev: a316aeb7dabec9febd664422fd97a431717b59b8
X-Patchwork-Hint: ignore
Message-Id: <20240712123847.4268885E01@busybox.osuosl.org>
Subject: [Buildroot] [git commit] utils/genrandconfig: do not check
 certificates with curl
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a316aeb7dabec9febd664422fd97a431717b59b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

genrandconfig is used in autobuilders, and some autobuilders are running
on old distributions that are lacking the most recent CAs, causing build
failures because package sources can't be retrieved.

Do for the curl backend what we already did a while back for the wget
backend, with commit 0866a280e40a (utils/genrandconfig: use
--no-check-certificate in wget by default); in curl, the equivalent
would be --insecure, and applies to the ftps transport.

The integrity of the downloads are validated against our bundled hashes
so there is no risk of corruption of the downloaded files. The only
issue would be that an MITM could inspect the transaction, the same way
as for the wget --no-check-certificate in 0866a280e40a, but this is not
considered a high-level issue (we're anyway talking FTPS here, that's a
legacy protocol that has other issues).

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 utils/genrandconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 66b7a87311..216e733799 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -677,6 +677,7 @@ async def gen_config(args):
 
     # Allow hosts with old certificates to download over https
     configlines.append("BR2_WGET=\"wget -nd -t 3 --no-check-certificate\"\n")
+    configlines.append("BR2_CURL=\"curl --ftp-pasv --retry 3 --insecure\"\n")
 
     # Per-package folder
     if randint(0, 15) == 0:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
