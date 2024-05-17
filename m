Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608EBC04FFE
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 13:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1981F60623;
	Fri, 17 May 2024 13:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFlsvGJuQIOT; Fri, 17 May 2024 13:20:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DC0860664
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DC0860664;
	Fri, 17 May 2024 13:20:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 36A6F1BF3F0
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 13:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22EB260664
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 13:20:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GBtuCIGaJXGk for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 13:20:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7A4E860623
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A4E860623
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7A4E860623
 for <buildroot@buildroot.org>; Fri, 17 May 2024 13:20:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 24DE961A7F;
 Fri, 17 May 2024 13:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48F8EC2BD10;
 Fri, 17 May 2024 13:20:46 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Fri, 17 May 2024 16:20:35 +0300
Message-ID: <20240517132039.7124-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1715952046;
 bh=Tsi9acb1ft715LzX8CqxwRfC9V5GzWOex+njOqj0B5o=;
 h=From:To:Cc:Subject:Date:From;
 b=tranzXGuyq0/TuPLRSFxlQbcVCQeHV7eugfkZJ4f7XVbVPisxHAo5HAlbZMLBJdFe
 88csf4LTBzQoHlFWzrp9mkhF7wLcLshqrRz3ezL9oXSfULo5ZzclLoKyZxZX7CJpTe
 sWDrDBFx268mkTqMCFkbr24brm6DQ8c0Z87CcHQ+fgLhJP8T6BYfv/nH4ZJot+nmtE
 Fr6WBa+YS3/u1IkXbkdKiaBCs6Sb1VZjKaspj9/YvS500+genN4Mn4WFJY0DS3Rbgs
 MYgmaKrrmVbnZDmwrBXqkmSTYcFNbx7PCJvT7dJLIct1iL8/QpJDkUHgrEGAH2KwPd
 xYGGknbTFTScw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=tranzXGu
Subject: [Buildroot] [PATCH 0/4] swtpm and libtpms host packages
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
Cc: Jarkko Sakkinen <jarkko@kernel.org>, Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add swtpm and libtpms host packages.

Jarkko Sakkinen (4):
  package/quota: Update DEVELOPERS address
  package/json-glib: add host build
  package/libtpms: add host package
  package/swtpm: add host package

 DEVELOPERS                     |  4 +++-
 package/Config.in              |  1 +
 package/Config.in.host         |  1 +
 package/json-glib/json-glib.mk | 12 ++++++++++++
 package/libtpms/Config.in      | 20 ++++++++++++++++++++
 package/libtpms/libtpms.hash   |  2 ++
 package/libtpms/libtpms.mk     | 17 +++++++++++++++++
 package/swtpm/Config.in.host   | 16 ++++++++++++++++
 package/swtpm/swtpm.hash       |  2 ++
 package/swtpm/swtpm.mk         | 17 +++++++++++++++++
 10 files changed, 91 insertions(+), 1 deletion(-)
 create mode 100644 package/libtpms/Config.in
 create mode 100644 package/libtpms/libtpms.hash
 create mode 100644 package/libtpms/libtpms.mk
 create mode 100644 package/swtpm/Config.in.host
 create mode 100644 package/swtpm/swtpm.hash
 create mode 100644 package/swtpm/swtpm.mk

--
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
