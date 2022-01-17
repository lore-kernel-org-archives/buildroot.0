Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FCC6C433EF
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 12:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E75424015D;
	Mon, 17 Jan 2022 12:57:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1kyZj3nelaeY; Mon, 17 Jan 2022 12:57:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C6EB4027B;
	Mon, 17 Jan 2022 12:57:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 423001BF3EE
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 12:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 302CD60B43
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 12:57:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=dbrgn.ch header.b="PLRbcBcs";
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.b="TYqwvV/Y"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wW8OHYQdyxR5 for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 12:57:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8AF3860B31
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 12:57:17 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id CFB315C0BF8;
 Mon, 17 Jan 2022 07:57:14 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Mon, 17 Jan 2022 07:57:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dbrgn.ch; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=0
 /aizRtwnVvRlLNydmwDEWX3hqVZsHyaIhXrGe9/C+c=; b=PLRbcBcsVQSOflMif
 fakYRSYZtVp5J3elLNc/u3mRKqxamIm5Jec0uG7vNc6N4LHH0XnPudfaeUY6+JyF
 XqeQMqGEKl5L3qBejgiFK213AgruTYyhES86zOOkLAmXM4DhFWnTcTlTYgR1J9i5
 27PoPtNnJj4DICOeURVHtj7LgPSfFnmtSzpIq/Sbh6HFfnpZ6HkTQJZ/eT49nVV8
 AgtpU6gs97vBiX4+QzkdjWNeR9SIGTSvbJXyjz2Vuzj3whnbrjJoiJM5eaLC+lrY
 +zePhQCmHfLRsWck7JhMSa4ux0qSjDRGuDt/O7dLKggWpOKJvyl/lGuKXqkdVq2I
 M46KA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=0/aizRtwnVvRlLNydmwDEWX3hqVZsHyaIhXrGe9/C
 +c=; b=TYqwvV/YV1NQyLc2+bNUj8AHBExoX9nMGrsPnj4dobsQc6HqKb1e/6VA0
 lUsoqTajzdA4ePtvSoQQHd8agYEL7qQQKAtYJIeHQImcjYlAi2g5GUavpDB/V62r
 6C4cgdIHcJFc+m45HjVaT5PzpmmUSxAqvROpnKBIUiPA/gWA77ceQBU3n4RTY/xV
 OS3F2qkb9PdcIhBQtPzzeNFMyKcC1qhqv/U67Ep8UgfE1R2s7An+2AWkmiLxv8jU
 UCYzDyBdheG1Z7PUWAZfhffAQAmY9IPy3cdZ3FdiA8gxPQsfGkdMOP+NBZJ19WvM
 4pGzaQ22bGPz1EkALBUWAig3i3neA==
X-ME-Sender: <xms:qmflYV3pT5nroi2VQou1BUwmKost2zr_IsxbS4i_GqfXz5Xism4oEQ>
 <xme:qmflYcEGYiItiNtptgoDiW64Ykf1x-wige7g4vsAWjt_r-62FobASGRdMO3vHmQF3
 h2EiJVAmasYpyss>
X-ME-Received: <xmr:qmflYV6eGkUrvEWhttxtC3gqrUVhjnTz3OgOvhiWqUw9gbUtSPc1pxhV17Sc8bNQiyAjijCXYg-JFMq8w8Ht4T29Nuk9Tqs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddugdegiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefkffggfgfuvfhfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpeffrghnihhl
 ohcuuegrrhhgvghnuceomhgrihhlsegusghrghhnrdgthheqnecuggftrfgrthhtvghrnh
 epuddtieetudeuvdelhfeikeejudeuffekteehheevhfetgfduleekgfdtfffhgfehnecu
 ffhomhgrihhnpehkvghrnhgvlhdrohhrghdpmhgrihhlrdhruhenucevlhhushhtvghruf
 hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghilhesuggsrhhgnhdrtghh
X-ME-Proxy: <xmx:qmflYS1OKR6hOcc2OQqnKlNYDrVboCPb7LQDzyZQZMI213LuZzzNQg>
 <xmx:qmflYYF7kkeL-BJkFylNbEtNo_e2SJaL5DotpGq5s7jJMUpnMfpM2A>
 <xmx:qmflYT8YJ06yjw2r9z2kboQHkybNj_bw6BgyN0Ikb05pAht5AYZnyQ>
 <xmx:qmflYdQXB-oE1sHkCr6pgy88jrM6r0J46_a-VHQisHHmn3z2jr9nIQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Jan 2022 07:57:13 -0500 (EST)
Message-ID: <03d2153b-9a56-98d7-75d4-d447b3a8e303@dbrgn.ch>
Date: Mon, 17 Jan 2022 13:57:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220117105017.28d6aacc@c3po> <20220117102450.GC2313964@scaer>
From: Danilo Bargen <mail@dbrgn.ch>
In-Reply-To: <20220117102450.GC2313964@scaer>
Subject: Re: [Buildroot] DMARC on this mailing list
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
Cc: buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Yann

>> - Rewrite the "From:" header so that the e-mail appears to be coming
>>    from the ML itself. Put the original sender e-mail in the "Reply-To"
>>    header instead. If this is not being done, the sender IP (the mailing
>>    list) does not match the sender e-mail domain and SPF fails. Note
>>    that this *might* impact the buildroot ML reputation for some big
>>    mailservers.
> 
> This is exactly what is going on. You can check for example on the
> archives:
>      https://lore.kernel.org/buildroot/20220115101415.986123F41E@exit1-us.msgsafe.io/

Strange, when I view your e-mail (coming from the ML, containing the 
"buildroot mailing list" footer) raw data, I still see your address in 
the "From"-Header, and not buildroot@buildroot.org:

   From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The *sender* is set to Buildroot:

   Sender: "buildroot" <buildroot-bounces@buildroot.org>

...but DMARC evaluates the From-Header and not the Sender-Header, as far 
as I know.

Some mailservers that sent me DMARC failure reports after sending 
e-mails to the buildroot mailing list were:

- silica.com
- uni-bonn.de
- yahoo.com
- aol.com mail.ru

With a reject policy, my e-mail would have been dropped by those servers.

Danilo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
