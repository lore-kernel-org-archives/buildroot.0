Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A3CE77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 21:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D80E80AD5;
	Wed,  8 Jan 2025 21:09:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d9NAtcyA2Cyb; Wed,  8 Jan 2025 21:09:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DA3980A95
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DA3980A95;
	Wed,  8 Jan 2025 21:09:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 57BA77AA
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3377B408F1
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:09:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CvPm-Co8rLY7 for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 21:09:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 69EB140481
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69EB140481
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 69EB140481
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 21:09:03 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1578735705; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 08 Jan 2025 21:08:58 +0000 (UTC)
Message-ID: <b9621656-5e13-43b5-953e-e5066b67ac75@korsgaard.com>
Date: Wed, 8 Jan 2025 22:08:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bartosz Bilas <b.bilas@grinn-global.com>, buildroot@buildroot.org
References: <20241231160736.142068-1-b.bilas@grinn-global.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20241231160736.142068-1-b.bilas@grinn-global.com>
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=aWzamWVXS4vuV0aiEWfq2QWf8NrArwCEL71m5JlHzRa7hyDK9JjytK1lgLob/ALNKuy0LANR9EkeS8rQ2yo18zZxCwz4a6Qnq3xf6CBq3PG/vOWl6Hnlitqf7QgO1LaEvj49dYok0DoazrY3PubS5WVgKxW09b9KMxQmP4tiB1IvuAMxXp0On8V+ZxREV5rNJmNe7UiyrpHn9CxCNQygSTj1dJA+SgwrHer+VI5essRWEXxaHLVAx/QYMoTKvR18lR9bR7/YsyVx3skVrkSPLBubNwAOKWxFkNokZ0rPfnAFeI2i+or2AJAY2BpW76TlYHv0BwrVQkXDxsKBvR+sSQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=8O7Mdxex1caR4/sML3Yz2/E4HuklXtwutyxgLe2Z/1o=;
 h=Feedback-ID:Received:Date:Subject:To:From; 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=aWzamWVX
Subject: Re: [Buildroot] [PATCH] DEVELOPERS: remove Bartosz Bilas from cegui
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

On 12/31/24 17:07, Bartosz Bilas wrote:
> I no longer use this package.
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

Committed to 2024.02.x and 2024.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
