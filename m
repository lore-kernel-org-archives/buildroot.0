Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B5EC282EC
	for <buildroot@archiver.kernel.org>; Tue, 11 Mar 2025 21:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EFAB6073C;
	Tue, 11 Mar 2025 21:51:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kY5HzUBuW1BU; Tue, 11 Mar 2025 21:51:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94C6060B7D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94C6060B7D;
	Tue, 11 Mar 2025 21:51:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 26BCC1DB
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 21:51:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10C474094E
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 21:51:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id go7qEZYnslQR for <buildroot@buildroot.org>;
 Tue, 11 Mar 2025 21:51:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E80054094B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E80054094B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E80054094B
 for <buildroot@buildroot.org>; Tue, 11 Mar 2025 21:51:43 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E6850B0053D;
 Tue, 11 Mar 2025 22:51:39 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 11 Mar 2025 22:51:39 +0100
MIME-Version: 1.0
Date: Tue, 11 Mar 2025 22:51:39 +0100
From: Julien Olivain <ju.o@free.fr>
To: Lubomir Rintel <lkundrak@v3.sk>
Cc: buildroot@buildroot.org
In-Reply-To: <20250311094327.1887514-1-lkundrak@v3.sk>
References: <20250311094327.1887514-1-lkundrak@v3.sk>
User-Agent: Webmail Free/1.6.10
Message-ID: <e052dac4cabd384a413b0527f4f5b3e8@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1741729901;
 bh=imqOXmWUYNV0Faj/WUS/XHHbHjramb6Hx7j8/6pk0ZQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=e9rm3aOLLPPXWJWPvd7X3l+97NyEnb06IR7uTM08q+/1c4BXpwTNeKBTu4bpP6o/0
 qESH1srTrQdwT8K/2BZt2o4XpHpdU56VZgTfESxxTNrWIeIzy4OTjy5fFzIBua1e7k
 Ecx01dLNCarEpEmoKXz7zrcTuXvkM56EEWrCdThbAPO9EOxfevElwiK8NbaiinRWoD
 TitdatP5RWC8DY49HPH5PSuSxUcRCvnsKz08NUdBt7gGmYneP1kk9yV9EQgOknOYkj
 Iq5+7Mij8wS75HFPAcXQTklY6pj4hWcTwCXffdjkRgyoLrWWZtXsa6tyly2eT0RISD
 7KU2TO32VHJ7Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=e9rm3aOL
Subject: Re: [Buildroot] [PATCH] configs/olpc_xo175_defconfig: bump kernel
 version to 6.13.6
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

Hi Lubomir,

On 11/03/2025 10:43, Lubomir Rintel wrote:
> Update kernel to version 6.13.6. Tested.
> 
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Thanks for the patch. I applied it on branch next.

Could you also send a followup patch to enabling
BR2_DOWNLOAD_FORCE_CHECK_HASHES=y for those updated defconfigs,
please?

There is few commit examples:
https://gitlab.com/buildroot.org/buildroot/-/commit/4ca8f0ea762061ad04016d065f37e0c351d578f1

See also the documentation:
https://buildroot.org/downloads/manual/manual.html#_adding_project_specific_patches_and_hashes

Finally, you can use the helper script for that:
https://gitlab.com/buildroot.org/buildroot/-/blob/master/utils/add-custom-hashes

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
