Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7AADEE01E7
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 20:43:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AAED608BA;
	Tue, 10 Sep 2024 20:43:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iSj4u57HoK7P; Tue, 10 Sep 2024 20:43:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61B6B608BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 61B6B608BD;
	Tue, 10 Sep 2024 20:43:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 651511BF95A
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 52BF340602
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:43:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F38wJy76Z9Qm for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 20:43:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 626C7405FA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 626C7405FA
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 20:43:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A99286F53; Tue, 10 Sep 2024 20:43:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 22:43:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6cedd92744341c1c9b5f76026db05a9fd653485d
X-Git-Newrev: 75b543880ceaeb8ff039b0cf3a2ba3e1d38aba37
X-Patchwork-Hint: ignore
Message-Id: <20240910204328.5A99286F53@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/misc/Vagrantfile: support libvirt
 provider
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

commit: https://git.buildroot.net/buildroot/commit/?id=75b543880ceaeb8ff039b0cf3a2ba3e1d38aba37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And configure memory/CPU like for the other providers.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/misc/Vagrantfile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/support/misc/Vagrantfile b/support/misc/Vagrantfile
index 8252f555b6..1155026ee3 100644
--- a/support/misc/Vagrantfile
+++ b/support/misc/Vagrantfile
@@ -29,6 +29,11 @@ Vagrant.configure('2') do |config|
 		end
 	end
 
+	config.vm.provider :libvirt do |v, override|
+		v.memory = VM_MEMORY
+		v.cpus = VM_CORES
+	end
+
 	config.vm.provision 'shell' do |s|
 		s.inline = 'echo Setting up machine name'
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
