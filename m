Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F9D7C3DA6E
	for <buildroot@archiver.kernel.org>; Wed,  3 Jan 2024 12:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0619740978;
	Wed,  3 Jan 2024 12:25:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0619740978
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yNul1hcuEFof; Wed,  3 Jan 2024 12:25:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A4E6414E4;
	Wed,  3 Jan 2024 12:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A4E6414E4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FED51BF409
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 12:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 030A481EE8
 for <buildroot@lists.busybox.net>; Wed,  3 Jan 2024 12:25:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 030A481EE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pEGFYvFjDXNT for <buildroot@lists.busybox.net>;
 Wed,  3 Jan 2024 12:25:02 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8235A81EBF
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 12:25:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8235A81EBF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4AC59C0005
 for <buildroot@buildroot.org>; Wed,  3 Jan 2024 12:24:59 +0000 (UTC)
Message-ID: <51cee250-4800-4a57-8d44-3b6ce46e2214@korsgaard.com>
Date: Wed, 3 Jan 2024 13:24:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: buildroot@buildroot.org
References: <20231208172114.1514561-1-fontaine.fabrice@gmail.com>
 <87ttorpgu5.fsf@48ers.dk>
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <87ttorpgu5.fsf@48ers.dk>
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/erlang: fix build without DES
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 09/12/2023 15.53, Peter Korsgaard wrote:
>>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:
> 
>   > Fix the following build failure without DES raised since bump to version
>   > 26.0.2 in commit 2cfa86a54882f2831b36a78a0ca642aa3a4bd0a4:
> 
>   > cipher.c:51:42: error: 'EVP_des_ede3_cbc' undeclared here (not in a function); did you mean 'SN_des_ede3_cbc'?
>   >    51 |     {{"des_ede3_cbc"}, "des-ede3-cbc", {&EVP_des_ede3_cbc}, 0, 0},
>   >       |                                          ^~~~~~~~~~~~~~~~
>   >       |                                          SN_des_ede3_cbc
> 
>   > Fixes:
>   >  - http://autobuild.buildroot.org/results/1aace0ee738f8ec4aa2c9a739fc7535c3b6bf884
> 
>   > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>   > ---
>   > Changes v1 -> v2:
>   >  - Add a patch instead of selecting DES in openssl
> 
> Committed, thanks.

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
