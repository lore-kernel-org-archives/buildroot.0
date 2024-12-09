Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B31AE7717D
	for <buildroot@archiver.kernel.org>; Mon,  9 Dec 2024 19:53:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1BEE40263;
	Mon,  9 Dec 2024 19:53:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oQDyATLmGYSK; Mon,  9 Dec 2024 19:53:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C32DB401C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C32DB401C5;
	Mon,  9 Dec 2024 19:53:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CC8AED2
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 19:53:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4DDB7606F2
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 19:53:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lwyESgwNd2O3 for <buildroot@buildroot.org>;
 Mon,  9 Dec 2024 19:53:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0BDCC605CB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BDCC605CB
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0BDCC605CB
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 19:53:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 776A940002;
 Mon,  9 Dec 2024 19:53:04 +0000 (UTC)
Message-ID: <b8d9b247-6dc2-4193-b4fc-8a3feb0537cd@korsgaard.com>
Date: Mon, 9 Dec 2024 20:53:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Colin Foster <colin.foster@in-advantage.com>
Cc: buildroot@buildroot.org, Titouan Christophe <titouanchristophe@gmail.com>
References: <20241206074342.1532295-1-peter@korsgaard.com>
 <87zfl73joh.fsf@dell.be.48ers.dk> <87o71m1b7t.fsf@dell.be.48ers.dk>
 <87v7vtyzur.fsf@dell.be.48ers.dk> <Z1csc2aGtuzcsuwm@colin-ia-desktop>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <Z1csc2aGtuzcsuwm@colin-ia-desktop>
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/mosquitto: revert an upstream
 change in 2.0.20 breaking nonthread builds
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

On 12/9/24 18:44, Colin Foster wrote:
> Hi Peter,
> 
> On Mon, Dec 09, 2024 at 10:23:08AM +0100, Peter Korsgaard wrote:
>>
>>   > Committed to 2024.02.x and 2024.08.x, thanks.
>>
>> Ehh, I should have naturally FIRST bumped to mosquitto 2.0.20 before
>> doing that. This means that mosquitto is broken in 2024.02.9 /
>> 2024.08.3, sorry about that :(
> 
> Out of curiosity, will there be a quick 2024.02.10 release with this or
> will that come in the standard release cadence next month?

How annoying is it? Are you using the git repo or a tarball? If git 
tree, can you use the 2024.02.9 tag + 1 commit instead?

If needed, then I can do an early 2024.02.10 release, but it naturally 
has some overhead so I would prefer not to.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
