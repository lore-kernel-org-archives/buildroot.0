Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49945C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 16:36:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECCC240217;
	Thu, 22 Aug 2024 16:36:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C81GbFqPoHef; Thu, 22 Aug 2024 16:36:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD1A34022B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD1A34022B;
	Thu, 22 Aug 2024 16:36:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F20A1BF39A
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 16:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8955440168
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 16:36:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hIrdsXFF292L for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 16:36:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 732244013F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 732244013F
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 732244013F
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 16:36:45 +0000 (UTC)
Received: from localhost.localdomain (unknown [213.36.7.13])
 (Authenticated sender: vjardin@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 30CF52003AE;
 Thu, 22 Aug 2024 18:36:39 +0200 (CEST)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Date: Thu, 22 Aug 2024 18:36:29 +0200
Message-ID: <20240822163630.37849-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240822134112.32868-1-vjardin@free.fr>
References: <20240822134112.32868-1-vjardin@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724344602;
 bh=rNYPUQrMegRq+ppS65k5bPCOT/za7AKp9LzSaqvNuok=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kPfQR9QoVioKpJHi0kXk+EaXiHZgqbp7jfYW0wpsM5QPFmFOUCYXLLUt76zVMoi4n
 vcJAbKKmkMDsLvvd/7+GEh7FC1hu3K1p6QrMJMDAxog0+4B6Esx64xtO7PepSecZYS
 Wf/rT7doQ+xB1FiU+IaDjmz7+I1ysMTNmG6VJt6oChKb6+Ogy0+WtvT5/ZI8JaEzzY
 1hNFo1D/pPR7KswRksTYvOaMAh2BXn5tKV+sngJckWLGvKVlaHMNSlLnyvif6J/VWa
 gPRRRwlts/aXZTEjYVQ5Tdw10bxOQDCSm+tsBJY6OCjA9FuZVHD9Z315/sdu/40lDc
 97daukTwxXDkg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=kPfQR9Qo
Subject: [Buildroot] [PATCH v2 0/1] package/frr: update to 9.1.1
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
Cc: Vincent Jardin <vjardin@free.fr>, Vadim Kochan <vadim4j@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

v1 -> v2 changes:
  - hash for COPYING file was missing

Vincent Jardin (1):
  package/frr: update to 9.1.1

 package/frr/Config.in | 1 +
 package/frr/frr.hash  | 4 ++--
 package/frr/frr.mk    | 3 ++-
 3 files changed, 5 insertions(+), 3 deletions(-)

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
