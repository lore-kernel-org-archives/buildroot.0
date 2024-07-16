Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B62C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 16 Jul 2024 21:26:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CE2C40C05;
	Tue, 16 Jul 2024 21:26:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id msfeDM_ytJIW; Tue, 16 Jul 2024 21:26:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4CE2640C11
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CE2640C11;
	Tue, 16 Jul 2024 21:26:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 343FF1BF37B
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 21:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 226F380F80
 for <buildroot@lists.busybox.net>; Tue, 16 Jul 2024 21:26:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NKq6waWyUb9Q for <buildroot@lists.busybox.net>;
 Tue, 16 Jul 2024 21:26:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44A0380F74
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 44A0380F74
 for <buildroot@buildroot.org>; Tue, 16 Jul 2024 21:26:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 32E4C869DA; Tue, 16 Jul 2024 21:26:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Jul 2024 23:25:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d7e6cdf54683c6e84fc7f93b5fad886526223e1
X-Git-Newrev: bcf05650bfdaacbec4a09c73a661ec3ef1d4a09b
X-Patchwork-Hint: ignore
Message-Id: <20240716212653.32E4C869DA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/evemu: needs autoreconf for python
 3.12 compatibility
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

commit: https://git.buildroot.net/buildroot/commit/?id=bcf05650bfdaacbec4a09c73a661ec3ef1d4a09b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

evemu ships with an ancient py-compile script (from 2011) depending
the imp module, which was finally removed in Python 3.12.
Set autoreconf in order to get an up to date version of py-compile
which automatically handles the different python versions.

This is a similar problem as in
42eae73ef1 package/cracklib: python needs autoreconf

Fixes:

 http://autobuild.buildroot.org/results/a52/a520583be6e86993d268d6535f727a352bd92028/

and many other configs where Python3 is selected and thus evemu
is configured to build the python-bindings.

Signed-off-by: Andreas Naumann <anaumann@ultratronik.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/evemu/evemu.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/evemu/evemu.mk b/package/evemu/evemu.mk
index 886ceb1142..6bba59cf82 100644
--- a/package/evemu/evemu.mk
+++ b/package/evemu/evemu.mk
@@ -9,6 +9,7 @@ EVEMU_SITE = http://www.freedesktop.org/software/evemu
 EVEMU_SOURCE = evemu-$(EVEMU_VERSION).tar.xz
 EVEMU_LICENSE = LGPL-3.0 (library), GPL-3.0 (tools)
 EVEMU_LICENSE_FILES = COPYING
+EVEMU_AUTORECONF = YES
 EVEMU_INSTALL_STAGING = YES
 
 # asciidoc used to generate manpages, which we don't need, and if it's
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
