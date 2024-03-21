Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08880C6FD1F
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 18:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AA83E401D8;
	Thu, 21 Mar 2024 18:21:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OA5X4_VGkxjo; Thu, 21 Mar 2024 18:21:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B37CA4033F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B37CA4033F;
	Thu, 21 Mar 2024 18:21:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB1141BF359
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 18:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D4B2060F10
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 18:21:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6b4pPHimljqs for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 18:21:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DD2CC60F07
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD2CC60F07
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD2CC60F07
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 18:21:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1254B6117F;
 Thu, 21 Mar 2024 18:21:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E93C433F1;
 Thu, 21 Mar 2024 18:21:33 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Thu, 21 Mar 2024 20:21:24 +0200
Message-ID: <20240321182126.24115-1-jarkko@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1711045293;
 bh=6HwyhITDGms+inVBn/S8LNupxlNP1jiDTAgc8NelRmo=;
 h=From:To:Cc:Subject:Date:From;
 b=TZvCd6GvoaAXxJSwwfjD6qbr1m/DfU7Ea3adZN8+7toZW0rsPh/lgRVA2Ncle9GqD
 jbvqbqjXmYEld+3qPj1t19xGFB0nqcc510M3vewPSdWtzlkkCh9RVhohRS7fXwdTzC
 dN1y86nzLbQVTRXUtwHxIvoeWCzvebUrZLKeJzIi7vaUe67VGQKOz0LlJZr3s6rcqm
 zc393cdyntJ9QtEq2UwhBUeGFgWkZjBlRZMVan4Vx2gbDj7Mc9uEtGE1LA3rPPV0rR
 J3gLvwlxkUYvMYXgK7WXe+tlK1ioiujHU6a9+jhiz54WUOiPsNs1O5/v4Y+3ZK6CQf
 rY3EWTgcfP/2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=TZvCd6Gv
Subject: [Buildroot] [PATCH RFC 0/2] Add swtpm to host packages
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

This work originates from my test sandbox for linux-tpmdd korg tree.
I'm not sure how to refine this as mainline BuildRoot patch set so
I just dump what I've used for long time with RFC stamp :-) Please
instruct me and I'll try to follow the steps.

Cc: Stefan Berger <stefanb@linux.ibm.com>
Cc: Peter Korsgaard <peter@korsgaard.com>

References:
- https://gitlab.com/jarkkojs/linux-tpmdd-test/-/blob/main/board/qemu/run-qemu.sh.in?ref_type=heads
- https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git

Jarkko Sakkinen (2):
  package/json-glib: add host build
  package/swtpm: add host package

 package/json-glib/json-glib.mk                |  1 +
 package/libtpms/Config.in                     |  9 ++++
 package/libtpms/libtpms.hash                  |  1 +
 package/libtpms/libtpms.mk                    | 15 ++++++
 .../0001-comment-out-expect-and-socat.patch   | 46 +++++++++++++++++++
 package/swtpm/Config.host.in                  |  8 ++++
 package/swtpm/swtpm.hash                      |  1 +
 package/swtpm/swtpm.mk                        | 17 +++++++
 8 files changed, 98 insertions(+)
 create mode 100644 package/libtpms/Config.in
 create mode 100644 package/libtpms/libtpms.hash
 create mode 100644 package/libtpms/libtpms.mk
 create mode 100644 package/swtpm/0001-comment-out-expect-and-socat.patch
 create mode 100644 package/swtpm/Config.host.in
 create mode 100644 package/swtpm/swtpm.hash
 create mode 100644 package/swtpm/swtpm.mk

--
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
