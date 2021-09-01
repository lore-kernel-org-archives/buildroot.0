Return-Path: <SRS0=5uHv=NX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64042C432BE
	for <buildroot@archiver.kernel.org>; Wed,  1 Sep 2021 14:49:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 035F760724
	for <buildroot@archiver.kernel.org>; Wed,  1 Sep 2021 14:49:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 035F760724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fastmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A5A6D40292;
	Wed,  1 Sep 2021 14:49:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dUqFDL_jDE9i; Wed,  1 Sep 2021 14:49:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6EA940158;
	Wed,  1 Sep 2021 14:49:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D18E41BF280
 for <buildroot@lists.busybox.net>; Wed,  1 Sep 2021 14:49:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1D5F404E0
 for <buildroot@lists.busybox.net>; Wed,  1 Sep 2021 14:49:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=fastmail.com header.b="qEV295x6";
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.b="TZdAcVNa"
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KW61B9B2JKRl for <buildroot@lists.busybox.net>;
 Wed,  1 Sep 2021 14:48:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE79040310
 for <buildroot@buildroot.org>; Wed,  1 Sep 2021 14:48:56 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id A1C9D5C01E8;
 Wed,  1 Sep 2021 10:48:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 01 Sep 2021 10:48:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 subject:to:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=I
 trmbHU0ituzqOZkqhOALY3HC5t3T/ZNRUnJ2fa5HVE=; b=qEV295x6R3dUddDH0
 0rctHzcGlPzzMx3OHQ4zZtDAbUzUWYdkrFOCejp2Ij9lBfU+j4nJisJ9U3GvbyR0
 CLHLAdbSmP9mA5//2A4Ji+O24c8SaTzy67emL9Rd1XQh+Xg00j8wbg3IuUtrD+hy
 tIxthJl2hO2HDIGlunu1V96ca0rBOBxvcx63SeMgkR+xNpwsuu4KXcotAuVEAivs
 xJWJBWgDO4c0e+VZC/ZYFkipjP1tQ4LFJcAsRVvDmXIb7ZTod4+LESYOyosaNddj
 iCp9OrHJVWN7Thk63baKKxU0m4qZCQLXaiMUzpm+6Ti4E7Esn+ZFUo3OnAI1c5SX
 VGo/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=ItrmbHU0ituzqOZkqhOALY3HC5t3T/ZNRUnJ2fa5H
 VE=; b=TZdAcVNaZaWILFNvKkQbv1tBprXggKhMruD4kUMYQLGynHiC5hS+6Lmgz
 Apl3zkkAULdiWcE35NZt1t7MSrN0Ciypf/nO+lQFBSg2e/g2dt6R9w0aYvVw8cZq
 Z3ZRWR9IC2CKjsqnQc9zregLxK2rVEQJt4yqbGU5PhpElkR8GBTTukRiv96NXlfB
 g4/rdyZO5HNXcGE3ojY4h5oOd/Neg/18SYOxcwb+Sos6VJAy6933mvWRE4wSeIj9
 CY/hWFcdkQQHSLy97ZoLhcNL7EHk/A6x7slWcePTmbWVR5AXH8HRcM3kaOo3w4VH
 DCOMRpGzRuhTYzVS715YWkFAfpONA==
X-ME-Sender: <xms:1pIvYTcIedq17t9Od4pTkjG96VOLNZ5DYMo-88c8R1_VLX81rPcBgQ>
 <xme:1pIvYZMFlE9xZJ_MTC4_LiqLAC3JcP9E8rFpTpaccd_eH03D0P46R1fCYyYCbipq5
 lVvhbs1ggQQy6dK2ts>
X-ME-Received: <xmr:1pIvYcjJ7HMcY-mYACacxGnHOzK-KI8qzpFBxOGSiRdVHat-gyHwwcolwwMlPx4NemAP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddvfedgkeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepmfhriiih
 shiithhofhcumfgrnhgrshcuoehkkhgrnhgrshesfhgrshhtmhgrihhlrdgtohhmqeenuc
 ggtffrrghtthgvrhhnpeetuddujeefieeggefgteelvedvheehtedttdfhtddthfegheff
 teefleeftedufeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
 hrohhmpehkkhgrnhgrshesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:1pIvYU8GX9IYjhfxcY9ieRcd7EPaLcmATd9GYzsxUquv-L7AxAi9gg>
 <xmx:1pIvYfttOIHdgpHIxZfM8BuYBCd-AwJxxfJs1OM5Ibdmpt-l2pkcqg>
 <xmx:1pIvYTHyIEZvm9OqTJxCpwAFCdXcbMaH8euk6rooeNyF3ocWChQv6Q>
 <xmx:15IvYYXs7DgiaQpOE94Y6WFp7IOXDEVEcisHuC2bBsYlR-kG-6deCw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 1 Sep 2021 10:48:53 -0400 (EDT)
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20210830201308.143849-1-kkanas@fastmail.com>
 <57f575c2-ba73-a1b1-6074-88b772d1207e@mind.be>
From: Krzysztof Kanas <kkanas@fastmail.com>
Message-ID: <61d12e5e-db00-fc4f-4135-72d4aa926a68@fastmail.com>
Date: Wed, 1 Sep 2021 16:48:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <57f575c2-ba73-a1b1-6074-88b772d1207e@mind.be>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH 1/1]
 package/environment-setup/environment-setup: add zsh
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 01/09/2021 15:26, Arnout Vandecappelle wrote:
> 
> 
> On 30/08/2021 22:13, Krzysztof Kanas wrote:
>> environment-setup used BASH_SOURCE which is bash specific and empty
>> variable for zsh (and other shell's).
>> Use $0 which should be work across multiple shells(tcsh, dash, zsh)
>> It won't work if other script is sourcing environment-setup.
> 
>   The environment-setup is supposed to be source'd, so how is this ever going to
> work?
This script will work when sourced interactively from bash shell due the 
test for ${BASH_SOURCE} so this behavior is not changed.

What I meant by this paragraph was how different shell's set $0 augment 
whether script is sourced interactively or sourced from another script, e.g:
cat > foo.sh
source environment-setup
^D

But I missed case when environment-setup is sourced from another 
directory, lucky this works in zsh case, but not in case of dash, ksh.
So the fix would be applicable to zsh only (actually my main purpose for 
the patch).

> 
>   I think the only viable solution is to require an argument if shell is not bash.
So you are thinking of
if [ $SHELL != bash ] ; then ?
I don't know if that will be easy/portable to do  b/c running,

zsh
bash
env|grep SHELL
SHELL=/bin/zsh
XTERM_SHELL=/bin/zsh

> 
>   Regards,
>   Arnout
> 
>>
>> Signed-off-by: Krzysztof Kanas <kkanas@fastmail.com>
>> ---
>>   package/environment-setup/environment-setup | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/environment-setup/environment-setup b/package/environment-setup/environment-setup
>> index e9bc36fdd093..2b54e88d6689 100644
>> --- a/package/environment-setup/environment-setup
>> +++ b/package/environment-setup/environment-setup
>> @@ -16,4 +16,8 @@ Some tips:
>>   * To build CMake-based projects, use the "cmake" alias
>>   
>>   EOF
>> -SDK_PATH=$(dirname $(realpath "${BASH_SOURCE[0]}"))
>> +if [ x"${BASH_SOURCE}" != x"" ]; then
>> +        SDK_PATH=$(dirname $(realpath "${BASH_SOURCE[0]}"))
>> +else
>> +	SDK_PATH=$(dirname $(realpath $0))
>> +fi
>>
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
