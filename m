Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81886C25B74
	for <buildroot@archiver.kernel.org>; Thu, 16 May 2024 15:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43222838B3;
	Thu, 16 May 2024 15:56:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nXH0RBw5r-Pq; Thu, 16 May 2024 15:56:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 299A2839B8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 299A2839B8;
	Thu, 16 May 2024 15:56:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 130EF1BF5AA
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 15:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F1D9F60EA6
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 15:56:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id akbJgc77fTt9 for <buildroot@lists.busybox.net>;
 Thu, 16 May 2024 15:56:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 69AE660E8C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69AE660E8C
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69AE660E8C
 for <buildroot@buildroot.org>; Thu, 16 May 2024 15:56:44 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 91B03BFB87
 for <buildroot@buildroot.org>; Thu, 16 May 2024 17:56:41 +0200 (CEST)
Message-ID: <c79c79fb-8692-40c5-8436-25213b54102a@grenoble.cnrs.fr>
Date: Thu, 16 May 2024 17:56:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1715875001;
 bh=FSccCGY2vX6wxEEYjFjclwWznJdbGCzxw/Ru341nPTs=;
 h=Date:To:From:Subject:From;
 b=hBU1x4GuJvf0jcqrLArTNpzhL31ezQ0h3lezPmDqGkDjAz6LdDX/lcGvM7Im2NxmE
 uggp3t4+00/fvSIbqQCfVL+S8PxHK9ID2qrf5/alub948lMKX2RYRIieL0lJ4Okrjr
 h2iPL7aN5OQwzcG4vLytVtKTP6xrmkSo322ExncVSLAsle4XCPLdMEB4W2ULfk8WGN
 iXNLE/3rP+EXBb0vlXG7f2uuBmGu463LS6zVm/Hu68HGog4rszoEJnekRSqZpjYYAw
 AhMe4duO4Xo3ak6C06btN7TQKOJ1tOElVA8EV+5m50Td85PgYUiYwQ+1CW4B5qvQEA
 nZb2u3NcenBDg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=hBU1x4Gu
Subject: [Buildroot] Support external toolchains based on gcc 14
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

Hello all!

Last July, right before support for gcc 13 was added for buildroot's
internal toolchain in 3009095ba8 (package/gcc: add support for gcc 13),
the support was added for the external toolchain in dfbd1aae23
(toolchain/toolchain-external/toolchain-external-custom: add gcc 13
version selection).

Last week, support for gcc 14 has been added for the internal toolchain
in 5eb0203cb0 (package/gcc: add version 14.x), but this is still lacking
for the external toolchain. Is this an oversight? Should I just wait?
Should I instead submit a patch equivalent to dfbd1aae23 for gcc 14?

Regards,

Edgar.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
