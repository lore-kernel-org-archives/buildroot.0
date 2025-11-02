Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D44CCF9E3
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 18:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B0A4614A4;
	Sun,  2 Nov 2025 18:27:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H-m8Yh4L0KFV; Sun,  2 Nov 2025 18:27:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE46F61156
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE46F61156;
	Sun,  2 Nov 2025 18:27:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 87723436
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 18:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78BCB61156
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 18:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ndc5VDYBpU6S for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 18:27:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8579560FBF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8579560FBF
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8579560FBF
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 18:27:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id ABC7B13F879;
 Sun,  2 Nov 2025 19:27:18 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 02 Nov 2025 19:27:18 +0100
MIME-Version: 1.0
Date: Sun, 02 Nov 2025 19:27:18 +0100
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, Vincent Jardin <vjardin@free.fr>
In-Reply-To: <20251021120342.483933-2-maxime@leroys.fr>
References: <20251021120342.483933-1-maxime@leroys.fr>
 <20251021120342.483933-2-maxime@leroys.fr>
User-Agent: Webmail Free/1.6.11
Message-ID: <4bfbb3adfd09ca1998bc4e196410cc99@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762108040;
 bh=aQor6fga38YcHxvMY3KWOyajMa/U0sU+WLMi6Aj0c1E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XAGDOx0MVuibVaF1cBwKB8AE1ak3cPYjLz813hhcZYy+0JkIn3BEZ+70hTxXFES5j
 VOPzMsPNmFlgw2iLsgcENi1XstXX8L0ftrjVezqqSkc6ThfQE10PsHBwmm2eeFOX2L
 mIEYFq+jyaKTrDhtTCn4znGeWHEYgQfW/yzl3qyLS0z+O8xVxspojvxp+NFpSpZYo0
 hv81Wf1NQ68FZhrM2VHC/UlXyJ0zH7226gtpdTTrWwnhg3ZLDax8AmV8T9wu51mYdI
 P6d2WPDfXJqjODczCY3hOrYSQQKXXmW23UDCD4ImsF7DAYiBX7pnBzpbLd2LtEX4Kz
 VuofnCjm7c4bg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XAGDOx0M
Subject: Re: [Buildroot] [PATCH 1/5] package/dpdk: bump to 24.11.3 version
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 21/10/2025 14:03, Maxime Leroy wrote:
> See the release note of the new versions:
> - https://doc.dpdk.org/guides-24.11/rel_notes/release_24_11.html#id1
> - https://doc.dpdk.org/guides-24.11/rel_notes/release_24_11.html#id5
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>

I applied this version bump (only) on master.
I'll do more tests with the other patches of this series.

Thanks.  Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
