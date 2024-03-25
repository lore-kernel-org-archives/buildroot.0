Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AECC54E58
	for <buildroot@archiver.kernel.org>; Mon, 25 Mar 2024 10:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D219B605BD;
	Mon, 25 Mar 2024 10:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Yi2sgv8jrD0; Mon, 25 Mar 2024 10:43:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4F4D60720
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4F4D60720;
	Mon, 25 Mar 2024 10:43:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 33C681BF2E4
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 10:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E00060720
 for <buildroot@lists.busybox.net>; Mon, 25 Mar 2024 10:43:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id btL4wDgq5dFB for <buildroot@lists.busybox.net>;
 Mon, 25 Mar 2024 10:43:54 +0000 (UTC)
X-Greylist: delayed 7899 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 25 Mar 2024 10:43:52 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4121E605BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4121E605BD
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4121E605BD
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 10:43:52 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 79E2EC148D
 for <buildroot@buildroot.org>; Mon, 25 Mar 2024 11:43:49 +0100 (CET)
Message-ID: <bef112fb-fa1b-4b95-8968-e57736babc84@grenoble.cnrs.fr>
Date: Mon, 25 Mar 2024 11:43:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <3a03670a-7a1b-4fd9-a44a-b5ffff19dc94@grenoble.cnrs.fr>
 <87msqmd6cn.fsf@48ers.dk>
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <87msqmd6cn.fsf@48ers.dk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1711363429;
 bh=sMFwcYCFusxSw+hLtj1+TzWeCiyQjj9BORIQu2BoOug=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=oXu3GOFvwNHsaIc0guSYkT9CfR58yvPeCji4IIQ0fx9wkkTG4gFaXTLZQ+IwOPssS
 VTrt/0LuVZi+9qU+4fErhwqxKsdyQIS3KHqLGzVzbdaEa2JX45itVkfEmcR6QOcgzd
 RkCxQB6gN4E6D/dEKIbHy/VqACTChAzu4cqTrT+mxOjZn5WwujQtuXSS69PBE77c5Y
 M1Ik2Yatl/IdpjWfaGr1Ei7Nq8KumNF+/b8qszcudUnTSjSIgVqlzS9VoMK+qW8GDo
 zmDGVUf4o+qkrKEgzVr4kouyTNVKN0bkuUVTG+udU83CTKgC4cERnmKTZNwzwjTqV1
 G0W9lC5jzomEw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=oXu3GOFv
Subject: Re: [Buildroot] Being kicked-off the mailing list
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

Peter Korsgaard wrote:
> I have bumped the mailman bounce_score_threshold from 5 to 10,
> hopefully that fixes it.

Thank-you very much for your prompt response!

> The documentation for [bounce_score_threshold] setting is: [...]

That's weird. The original setting doesn't seem very harsh... Anyway, we
will see how it turns out. I will report back if it happens again.

Bye,

Edgar Bonet.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
