Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECF56D0D151
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4C6C41622;
	Wed,  7 Jan 2026 18:03:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nmeupfyT65mT; Wed,  7 Jan 2026 18:03:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC5604160B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767809005;
	bh=LoQz+TqUpMGoW0rgnSwumkLNXN2ZFfBqY8kJkiQkUnQ=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=AnBhGyDmwQry5ezJWvOuaw50u7fZt9XbN8fD9V2AzGYWf/AZRx5Ue93v0SJjvEyKJ
	 JU88q6PJ1sTGU8IjIw3IV/8KSXvlDmhVqZwIkthqfK7hH3LwySd5kSycwUSrwzdKcM
	 bvkTIlj7vqpd2VFbODpDM+NDKBSQAXq2RHm3tbssQ66I6josW/E01SgP3Up2/Jwmvw
	 vPfHMOTVuntaw+hwA0nRJy0S5jYnayksjJrYO6fLZ0PKayUX5m8+bXqEKrWVjLMbF7
	 BuFTG29JSahhf7YMiADVheE+ECpeRRPOYje9bpNK5HZji2yXyhDAaZCVvJwuzdOmb0
	 UlrC0ED+VVgZA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC5604160B;
	Wed,  7 Jan 2026 18:03:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FD6325B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 37EE540C80
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R4EfkSMCYx9V for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:01:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6395D40A73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6395D40A73
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6395D40A73
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:01:13 +0000 (UTC)
Received: from postman.. (unknown [IPv6:2a01:e0a:2af:22b0:1db5:e71:2517:bbf7])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A11F813F8B3;
 Wed,  7 Jan 2026 19:01:10 +0100 (CET)
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Wed,  7 Jan 2026 19:01:07 +0100
Message-ID: <20260107180108.2470425-1-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767808871;
 bh=sECPCLpm8+LtqW8OssyPZstWGr36bfpfAqOuEfzRsSI=;
 h=From:To:Cc:Subject:Date:From;
 b=SUvsqhW8iucwF+Lb2VwfwaS2FMih4CDoBrjtLFkgRS287aQsuNc8XMnn5nI0j/q73
 xjoT90TaQ3haDBbb9SqFzMOH5Fjz2efyPaUo9QG2cEz6qHaistmDZaDgz2AhmxX9T7
 /Y5tGMkUwkzEAadE3zpU+SNkBRlEYC69zzNCQhomtrAHMA6V5r2AJyCKQdDiUagkyS
 u8f8dC7lUYP3OpYRjrfgbnJpwbmaNJzNHpcFN+dfY/jCSB0kzooMdBQzN9HyQPV3qQ
 ZKYOR+It2N3TyJwbOzgy+A9KoBZt13fdMo4ZXhBx/lMXW0fStzX3ZIQgvx+GLvPMWt
 4YlF+/EK779nQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SUvsqhW8
Subject: [Buildroot] [PATCH v1 0/1] package/python-ncclient: new package
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
From: Vincent Jardin via buildroot <buildroot@buildroot.org>
Reply-To: Vincent Jardin <vjardin@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch adds python-ncclient, a Python library for NETCONF clients.

CI build verification:
https://gitlab.com/vjardin/buildroot/-/pipelines/2248870132

Vincent Jardin (1):
  package/python-ncclient: new package

 DEVELOPERS                                |  1 +
 package/Config.in                         |  1 +
 package/python-ncclient/Config.in         | 18 ++++++++++++++++++
 package/python-ncclient/python-ncclient.hash |  3 +++
 package/python-ncclient/python-ncclient.mk   | 12 ++++++++++++
 5 files changed, 35 insertions(+)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
