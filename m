Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D770C25B75
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 11:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC7BE81B69;
	Tue, 21 May 2024 11:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OKgaPRyb604h; Tue, 21 May 2024 11:06:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6F3681BC2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6F3681BC2;
	Tue, 21 May 2024 11:06:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 958BE1C4FC0
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 11:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F4B7401F3
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 11:06:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id apMf-m-Tyo5m for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 11:06:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=139.178.84.217;
 helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EC71D400D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC71D400D1
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EC71D400D1
 for <buildroot@buildroot.org>; Tue, 21 May 2024 11:06:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E10BD61DD9;
 Tue, 21 May 2024 11:06:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38F46C2BD11;
 Tue, 21 May 2024 11:06:20 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Tue, 21 May 2024 14:06:11 +0300
Message-ID: <20240521110614.5322-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1716289580;
 bh=0H/gk2xFI6OIsZP02loc1ZD914iIHo4vOgxzIRSew0c=;
 h=From:To:Cc:Subject:Date:From;
 b=ocjdaRhPvNpdbdcyvXC+GYowaRbED6At1nvwm/Akc1q6MqFaVlAr1DMX8sEzyth4y
 t4L5TMl4umDvvSh9ROtqtAXHeOqE4x7qXmeYW/Wxe2LbEKCU7HMFJNeqbty17bY9Xk
 E2JvArNIl08PuklJX5bDJWSZ3jQKaKK76G5k+Hs/LPdGHDHYUgZUQ74FUtsIyFqWlF
 nt/+kHe5vphC2Nu4xBU0ShlZUX3LMJaXzOrY/gZLXcHo88t27ons0x0SJvPn0SuVCJ
 3EWv3ZP7tyBYcY8fpzpRcJJPUtBVwsGffsxUwdB66DPCzUfjWF7EsxalZ4HRms8Uhu
 7w0XHV447YX9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=ocjdaRhP
Subject: [Buildroot] [PATCH v5 0/3] swtpm and libtpms host packages
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
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add swtpm and libtpms host packages.

Jarkko Sakkinen (3):
  package/json-glib: add host build
  package/libtpms: add host package
  package/swtpm: add host package

 DEVELOPERS                     |  2 ++
 package/Config.in.host         |  2 ++
 package/json-glib/json-glib.mk |  6 ++++++
 package/libtpms/Config.in.host | 18 ++++++++++++++++++
 package/libtpms/libtpms.hash   |  2 ++
 package/libtpms/libtpms.mk     | 18 ++++++++++++++++++
 package/swtpm/Config.in.host   | 11 +++++++++++
 package/swtpm/swtpm.hash       |  2 ++
 package/swtpm/swtpm.mk         | 23 +++++++++++++++++++++++
 9 files changed, 84 insertions(+)
 create mode 100644 package/libtpms/Config.in.host
 create mode 100644 package/libtpms/libtpms.hash
 create mode 100644 package/libtpms/libtpms.mk
 create mode 100644 package/swtpm/Config.in.host
 create mode 100644 package/swtpm/swtpm.hash
 create mode 100644 package/swtpm/swtpm.mk

--
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
