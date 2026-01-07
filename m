Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F511D0D14B
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 18:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 304C7416C8;
	Wed,  7 Jan 2026 18:03:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HqcM5U12SOwD; Wed,  7 Jan 2026 18:03:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DA3B4171C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767809024;
	bh=nV9usciOiE7E8A6whRiydUnSQOlOlOOwY2R5//f4SHw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=pZ+qCUcqfVFlT8IYxDntRXqGjFlCpy2mhzFCmeVyklQVjlJ+XAZQNNi+aJ5RXdfD8
	 bLLz7kftYSwaONDCYMv/2qf6UMYSPkZzxlvHYIVDNMaWPZMTBE5Q88fimLhsI7bvs0
	 ckAHuXLI4YhfZIn9xofzndwcoy499IkMA1ydWJ6VJK9p3J7x3NaidsbZWahIa9RRxA
	 L7DCaSf6uZM5PcmK+KOi7/vv0Sg/UeHrKAQUAiqhsNS8r8R5nFELJgTB6DBQ4yqrTC
	 8yN3LLJ0QDffoPrYwkyI4ckHGRU40uSD/5EpqrP1CTw4vnyie+wJipbLkaFCMTrvsm
	 7D6wRxQ8PG9Ng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DA3B4171C;
	Wed,  7 Jan 2026 18:03:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F36C925B
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:02:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E46964142A
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:02:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lI8CtWW1vN45 for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 18:02:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DA26C413C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA26C413C6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA26C413C6
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 18:02:23 +0000 (UTC)
Received: from postman.. (unknown [IPv6:2a01:e0a:2af:22b0:1db5:e71:2517:bbf7])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 1ED6913F899;
 Wed,  7 Jan 2026 19:02:21 +0100 (CET)
To: buildroot@buildroot.org
Cc: vjardin@free.fr
Date: Wed,  7 Jan 2026 19:02:18 +0100
Message-ID: <20260107180219.2470568-1-vjardin@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767808942;
 bh=MC1lw+G3m4+tI367YrZ9C2+idoNtFMDOJk+0p8dWnzI=;
 h=From:To:Cc:Subject:Date:From;
 b=cEPZUWOLswBAcVYhyBIyBxoHzVLmZwhka+KMyUIC3hzGKFpDA1JeNGBVBlGvTxMZO
 BsoLZrhuWCPgPLoC1FhkX8UJ4ius8wSfbKJEL/hErs3xPyOLn33BxWpYxT6oH/VREL
 ZbYrIcnsz0LqT0+nuL1YXk3Lyu/yAvTyPWx6xZfXTuwNSFHYNmtE9+RRX00LjKfmZu
 Jpxsj0jnEtYiAofxfi6vtZVDFpD4bmeEF/uy12QKb2pf0htg8TVMKtq/MYcspXlSlF
 yX9zZd2ruw2lT2dUw3PBVVyXgyB5A2rTIrq6et4X9wSQZlQHw3LY4X1kw10dyIE0JF
 AJLNwQH3IZoGA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cEPZUWOL
Subject: [Buildroot] [PATCH v1 0/1] package/python-sysv-ipc: new package
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

This patch adds python-sysv-ipc, which provides Python bindings for
System V IPC primitives (semaphores, shared memory and message queues).

CI build verification:
https://gitlab.com/vjardin/buildroot/-/pipelines/2249320194

Vincent Jardin (1):
  package/python-sysv-ipc: new package

 DEVELOPERS                                  |  1 +
 package/Config.in                           |  1 +
 package/python-sysv-ipc/Config.in           | 14 ++++++++++++++
 package/python-sysv-ipc/python-sysv-ipc.hash |  3 +++
 package/python-sysv-ipc/python-sysv-ipc.mk   | 12 ++++++++++++
 5 files changed, 31 insertions(+)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
