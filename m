Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 495A1C3600B
	for <buildroot@archiver.kernel.org>; Tue, 25 Mar 2025 18:31:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 05EEA80F41;
	Tue, 25 Mar 2025 18:31:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XnKV9MZO9eeQ; Tue, 25 Mar 2025 18:31:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49DAF80F87
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49DAF80F87;
	Tue, 25 Mar 2025 18:31:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FE721B8
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 18:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EA85E608BF
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 18:31:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ruOrPeG4PrFR for <buildroot@buildroot.org>;
 Tue, 25 Mar 2025 18:31:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 062186102F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 062186102F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 062186102F
 for <buildroot@buildroot.org>; Tue, 25 Mar 2025 18:31:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 80A7013F8D6;
 Tue, 25 Mar 2025 19:31:30 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46728])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 25 Mar 2025 19:31:30 +0100
MIME-Version: 1.0
Date: Tue, 25 Mar 2025 19:31:30 +0100
From: Julien Olivain <ju.o@free.fr>
To: Scott Fan <fancp2007@gmail.com>
Cc: buildroot@buildroot.org, Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <20250325014602.1168402-1-fancp2007@gmail.com>
References: <20250325014602.1168402-1-fancp2007@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <c01bcae980ba91ea76cb9abb55746c2d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742927492;
 bh=8UZN6Ur9jcN/Ioh/ho+9WHA0F+ySVToSw9+Knfuj15Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=DRkvs5ofn0S6id678Q3cIBON76HXiDKKd1o9NVbQ4+5J8Zi/rpbT14RTSaj1M31ui
 LnYlxHlPYG1/UlX9VljQSFh6BkNSAroubEjrOy/veLtIsIASei6G58k6UHIrHdZfnE
 tjQjw8OiWhvS1+UwJtuLVNVBN/6zkXfbKFSvfmtXvxQRw87NBe8ZQNY7+/a6kp1mlF
 y6Od40gOgda43EcqyjWIeCrWpQlTdZbNWA09kJLxRGSax3uUD0hpM9YX8IQa/kuFks
 ifzLCVRxu3ebNYwCJKngngwxJMD9GHj//dguX3/Pcac9NNy/jVP0EOUYQ0DsRzhgnV
 GoCtd26A3DsLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DRkvs5of
Subject: Re: [Buildroot] [PATCH] package/timescaledb: bump version to 2.19.0
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

On 25/03/2025 02:45, Scott Fan wrote:
> Release notes: 
> https://github.com/timescale/timescaledb/blob/2.19.0/CHANGELOG.md
> 
> Signed-off-by: Scott Fan <fancp2007@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
