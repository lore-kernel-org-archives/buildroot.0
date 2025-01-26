Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 118FFC02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 17:10:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC64281444;
	Sun, 26 Jan 2025 17:10:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LBKkXVKQgsiJ; Sun, 26 Jan 2025 17:10:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E12588148E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E12588148E;
	Sun, 26 Jan 2025 17:10:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CBCFF10
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 17:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD7238144C
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 17:10:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k_7ugVKTwCO4 for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 17:10:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D34D78144D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D34D78144D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D34D78144D
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 17:10:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 9541713F8AE;
 Sun, 26 Jan 2025 18:10:35 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:60486])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Jan 2025 18:10:35 +0100
MIME-Version: 1.0
Date: Sun, 26 Jan 2025 18:10:35 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250126160159.485223-1-james.hilliard1@gmail.com>
References: <20250126160159.485223-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <22681725ba8912d2af2f96ec62c083ed@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737911436;
 bh=lFNHlDiQAWV0fiqsmNEuwl0y3X0DhBAyPZeVmrzkaig=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RzPZFXOkVOJ+5p5ggjkfERvrtS7xSBAxfik8xUE5DOD71OlkMmgi56BqF/HBPcQQW
 xFx5swEkc171GgeDkruf1MZL+dmhRZeleDCipxZX4gFyi+8xi7ditKP9nh/TfzWVN+
 Q4jp98/ANvYMIeVB4m2ItnlfigDVx7c4HoQFbGfPOVwthiVMLhTa/UHU2KTvpnOx7K
 CvUVzn1mIhaR5v8mm5GSKjRoPyEu0UrbmOIjtG/BY+UnYSVNkhIrA1sU4XLeHE6UA1
 OC58yyjK8auactqhmgsE7XU7n8k03B5YedQd2zIRAyeVREe//rpYX65bcUysmmligR
 s29Ii8duyZ36Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RzPZFXOk
Subject: Re: [Buildroot] [PATCH 1/1] package/cloudflared: bump to version
 2025.1.0
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

On 26/01/2025 17:01, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
