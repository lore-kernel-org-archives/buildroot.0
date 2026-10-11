Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38887CA9EBD
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 06:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83C6F4082E;
	Sun, 11 Oct 2026 06:05:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4rjvyIsBLznR; Sun, 11 Oct 2026 06:05:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A8E76407ED
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791698742;
	b=iZp3anGp10QH9p3u84N2OJMdDUbyDZsF/RJ7jHugmYtcS7bDX5bygvObGeUYeuIBjCwQ
	 //uTOjO2xSKwjc0ss4JPupu3LServcGaTi9/x9226McxW7V4CcQ6GOZcKiJLF7OiucwmY
	 qpFGzfafW4PZlSa/t/irt+q3iiqRlrckJvngs9wWXk5KZPr/FIvMLvx8aC3ByyHhxMSOZ
	 Voopi8dAjgm+ExBcju6HRLYfMTvwZWlllLKf6u38hRMIGZH9c9GapiteXfE3XRKo0hAO7
	 rfotAGuK0vY70+a0u0LzHzZElmyXJEVJnDf+/K9LNvvVyLnQlTQuduFosv+uQsi6GAQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791698742;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:To:References:
	 Content-Language:From:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Transfer-Encoding:
	 Content-Type:Errors-To:Sender;
	bh=PL8Rk1LwpPQwYWC0x2tJILkUlDCiXuNFz1xStlFR6MQ=;
	b=YcIWyUgLR7RNDVPjVDK8VkxqDF7EKCiDoTK2WIM/Sl27jQ1Fpswm6ZNv2gjn0nXE8Qqr
	 md/l8irAqdC6z1FRyBRg+RoR8VmMcww7hifX8nQRDPVrdDHAClGYE9MKSTSfN1f5/LGmZ
	 FUp2mMzqFksZ0WWg/z7DnZW2C9isTl3q7Th3y6il9sxim7JInYcr3tQlMawEoV9rQp038
	 6/kjRk7mUkVi2l9mpfQ6E5n5CjEi6HVsxld6JWRzv8Wa8duih092cibxVPJXDc/CdUB0U
	 EXq09JSZ8+bQjQu/6mOTb8DAdAOzDXDLJ95DIzpzYXDeexYh8KqsfaGFC7U7qql4MOA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=none header.from=korsgaard.com;
	dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail2 header.b=dAQa6S4U;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791698742;
	bh=PL8Rk1LwpPQwYWC0x2tJILkUlDCiXuNFz1xStlFR6MQ=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZAf80ocxNNcrDOxc+99tG89SmjUmzhyuhjjxZHLZFSZnyimC1RS/Iwi/k6CoshcGe
	 w2hdjikWxlWaXupH2LaXGCoTCjjBaiAPndTzR64Oo0ngU28N3vdsbrGYX5qeTw4Qp+
	 8Vyu3W9eDtqdDCVtdnZk4QIHSq33EkvH9KBG+80qqRliu2taiWDiK2eR73V8X9jqnm
	 c1Hf8K+pF8coEyFIqcRLG6GE24bB3WVojZPBqBdZ5qcF6sEMwJRnEQT+MzCEGXuJCO
	 Z2UIqa/W5liZEi5b1l7nqE8x8dMNbODKpDisnCTLv/quoY8DzSL69N1QpOxcK0MQO+
	 QqrH7YY2CIVxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8E76407ED;
	Sun, 11 Oct 2026 06:05:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AFF6317
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 06:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0A0B407ED
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 06:05:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TaVW7ma2wAPT for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 06:05:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org D6843407D0
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791698740;
 b=jzxkXfPpi5E2k79Jjsswo9G5jDBPoXPXp/v67ZxmfIIo0cAFuvzeuuIVE70rXmshYAGG
 3r/NdRzLedMpvDelB1wLzZ5Il+3I7t0iKRdIQUOPTEOJCEdSV5gSi55lj1n5DcPXJyBVT
 CKCdQhBcGHg2LdvycFPHoxfh6QOwmKNWwEHBaLjONHdwYSsALlaE2jPlGN2lMq81at9Nv
 0eDW5+ZbZ968G/Aj/CXMuR77mnHt+N2SRpCWG6NjSA9wHjjh2KBsfzwF8aRxeNyacyBja
 r1FnbOUpkAaAFeEyHflf/DtbS7aGX2vsQ3d5cWz+rBeVWWRzrbXKP76ehFZUpgFSrIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791698740;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:
 References:Content-Language:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding;
 bh=ifGTpEalH6pJ0C8UrMwd+6dtm5c2EXvI9iZcEbHoKLI=;
 b=WKDkAN2fYgh4T3pY09oER7Z5GNDjfLP/GHcnCcBpZLiBHNEEh+BW9jJ4/+Bj9SZk5yqL
 sGDgjjK1p3Wz32NC0NnnjCWmN5WUXJ25+cq4cF/GIA1cl9dCwp1BdTcEfHVRnjtqWfFSd
 y8XaDfs2wm8IWWStI6L2srhckDKjUSYXpEZM61hIiOsPxR20yugY9MK0z4DHiSnvSZRFb
 zCV13Z2T9YDvSUXguz1XPUoQ/OEz2KwQ7fYfLpNBcdpLVzkuuyuSw+sjHpRa/9SWhjc36
 qy8ui97afSi2XfRutqxV+JwrMxZw1oAa/rnrQs2Br5/xvnPCZVngSlqehYhMAhGbnJw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=dAQa6S4U; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=dAQa6S4U
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D6843407D0
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 06:05:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=dAQa6S4Ua92ohjJ0fua/TD58jK6oQBzf7cGYDEsdO+mXZPgY9709nNW4cVQSn0S2W5w5LTrg9MkysA5eJivboaM0MOtQ7HLKjep+zJv8X3Fv5nrTeweXSHuMTn3SyzOxzkH3Zefjo2GVsfI7VddHfX3YHX4xa2zMYYJVWGstW+ZESmiFHC/13ecHyZaVoXEvHkwRRim06YfAVj4rFksLlXWnMicv2ryhb1shWTVVU2cHrGcwFwtNC+FrqwzPSY4nShynCOgB1NnX3heKeyl7gN6OewVIChGtGYPBmAqBgX3U0MG6KYuve9iH4BdaWfpF5DF4LreTHrDwWjVldLA0Vw==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=FU4DR3huUZMC4upbs+sfZj9XlLlggM2PdVrbHWYxZf8=;
 h=Feedback-ID:Received:Received:Date:Subject:To:From; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 2073066843; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 11 Oct 2026 06:05:32 +0000 (UTC)
Received: from [127.0.0.1] by dell.be.48ers.dk with esmtp (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xFmgH-00000004jHl-1dX0;
 Sun, 11 Oct 2026 08:05:30 +0200
Message-ID: <fe9f5e39-97ab-4d91-8c71-1f5a974acc11@korsgaard.com>
Date: Sun, 11 Oct 2026 08:05:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
References: <20251226150000.919800-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US
From: Peter Korsgaard <peter@korsgaard.com>
In-Reply-To: <20251226150000.919800-1-thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH] support/docker/Dockerfile: make $HOME
 folder read-only
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

On 12/26/25 15:59, Thomas Petazzoni wrote:

Hi,

> The $HOME folder of the br-user inside the container is currently
> read-write for the br-user. However, practically speaking, it is only
> read-write when the UID of the user running the container from the
> host machine is 1000, equal to the UID of the br-user inside the
> container. For any other UID on the host machine, the $HOME folder is
> in fact already read-only.
> 
> Because we do not expect Buildroot to write into $HOME, and in order
> to have a consistent behavior regardless of the UID of the user on the
> host machine, we change our Docker image to make the $HOME folder of
> the br-user entirely non-writable.
> 
> Suggested-by: Peter Korsgaard <peter@korsgaard.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Sorry for the delay. Committed, thanks.

--
Bye, Peter Korsgaard

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
