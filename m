Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E04ECE579
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 15:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 86649400F9;
	Mon,  9 Sep 2024 15:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id klXnY1KS6qOP; Mon,  9 Sep 2024 15:27:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 648B24045A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 648B24045A;
	Mon,  9 Sep 2024 15:27:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA76E1BF362
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 15:27:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E551D80BCB
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 15:27:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oh9B9V8KF2An for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 15:27:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2419480B99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2419480B99
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2419480B99
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 15:27:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C86F2000A;
 Mon,  9 Sep 2024 15:27:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1sngIz-00GGXV-28;
 Mon, 09 Sep 2024 17:27:53 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  9 Sep 2024 17:27:47 +0200
Message-Id: <20240909152748.3876779-2-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240909152748.3876779-1-peter@korsgaard.com>
References: <20240909152748.3876779-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 2/2] support/misc/Vagrantfile: support libvirt
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

And configure memory/CPU like for the other providers.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
