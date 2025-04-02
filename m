Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE19C28B20
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 19:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 380F06F787;
	Wed,  2 Apr 2025 19:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X33wJmJg86vd; Wed,  2 Apr 2025 19:09:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 76F256F808
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76F256F808;
	Wed,  2 Apr 2025 19:09:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 46D77123
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CD5060605
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d5ltj97GXYZJ for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 19:09:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 644766F808
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 644766F808
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 644766F808
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:09:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id CA34AB0057C;
 Wed,  2 Apr 2025 21:09:05 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:57790])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 02 Apr 2025 21:09:05 +0200
MIME-Version: 1.0
Date: Wed, 02 Apr 2025 21:09:05 +0200
From: Julien Olivain <ju.o@free.fr>
To: Arnout Vandecappelle <arnout@rnout.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250402184557.321089-1-arnout@rnout.be>
References: <20250402184557.321089-1-arnout@rnout.be>
User-Agent: Webmail Free/1.6.10
Message-ID: <4ed6328dcb81aa030aa3dad414b495f8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743620947;
 bh=N/EboCNUf+APMvBGqCsziRzWUfdB9JNdVRM3rEp1N6c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=mPi09hx68HLZw8X3mvsbGfboMpVXcTJ0vQ7/o6I+L2268GMxSGMtuWVUS9v+LnNmU
 kWqQfDr8PLuOPbwldpalEbHc4bIoLUa7gIqMFVYobgvpWw6HPHPCjsN0VQAf/2zUCX
 W7IJnAy4pBUiIYt6XM+ceaO39/npXJsiib4VftoE9iLuFr5FkDWUCDZjo36X2+ZlAA
 EB/sos5lf1phJXiqpyIlFxpAirgNWgzQWKrz1ympoUTeaGufb/qDr0vxRiVryLZ8fH
 O7u1pfeWGrxKB7AyaE5m79JSqkpArcuwhYwc8MIyDdAHDlH+qhIZ1uV/kQbHNsqTH2
 UZv51JmihA73g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=mPi09hx6
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: change arnout's address
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 02/04/2025 20:45, Arnout Vandecappelle via buildroot wrote:
> Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
