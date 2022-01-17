Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D15EC433F5
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 10:25:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D7A8400D6;
	Mon, 17 Jan 2022 10:25:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qvKA388DT6UY; Mon, 17 Jan 2022 10:25:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64BDC40220;
	Mon, 17 Jan 2022 10:25:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A23EC1BF3D7
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 10:25:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9089581415
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 10:25:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=dbrgn.ch header.b="UDlyR8TL";
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.b="nkSoScnW"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IixiDdN7740H for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 10:25:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67CFE81410
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 10:25:03 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C97905C055D;
 Mon, 17 Jan 2022 05:25:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 17 Jan 2022 05:25:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dbrgn.ch; h=
 message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=I
 n4gOfvn3OeHQ560649HUkyfHvKU5dEYY+Z3fbYqyC8=; b=UDlyR8TLWDDGMAo1y
 prY2EkRqH3FYi1hl5bjO+H7hIfxqs6N24Lb2sVR5DTxNJkGOjpF7Oe+8cLXwM/z8
 CeUCb4Jrz8qXciyhChDD1izfs0roVCObTL7FDqB66xC+VzSfSjjAQW4/CH+jqzXQ
 hO37ZE1AlpgRCjbA47lPqiXkL8bVbtmEX4+/VGNO/5Jvfr7UcX7RwLF8b8tBEFFK
 cxtEpkH+P+NYraedLi4+wmSM5K30fHBXaKDC5lBFDMeUfUrbDAhmv6JlxvzXVEfE
 GMdy24vVT/kEUlaBMGzw2xRp9BALy0yFwnx7jByClK8gnQVVhXyvV6VIS2tYxdR+
 sRyWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=In4gOfvn3OeHQ560649HUkyfHvKU5dEYY+Z3fbYqy
 C8=; b=nkSoScnW/NRrNGVlXShqokcJSaw5O1cWIbpoK1A4xwfTn1P4hfN5C+w+T
 0uLmRCXU5EwmPG0WJTfEy8pAVatk9Kogm77tyuw6Qui1tzbzgYEksEY68oSIp53J
 6jWQF1pO+O0pZQosvZd2ggfK9xcgxHgqsu48/LlWAcF41p/pZKNKUyXB9XNP6Vmn
 BN/bFKlTI3vh9Z5czNDCnsV7v0q94Z0Np6NXLJ1ys0Z0oAXMgj8CRRng1VIx9x84
 2x1N1aXMJrQ1gETLIyvNfvKJh9w6GAAxVNd2CLHi94IFGDar9LaMCV8LH62gydrP
 rVTIvQlv4PDGxYklQOr6FHES93zLg==
X-ME-Sender: <xms:_EPlYWV086nv9XOUdEMj0-4UYmq4i-1x8U9kUaw7Xect7ABZt6bgBQ>
 <xme:_EPlYSlpTUJwm277JRj1T9lTtpG9c52_31OmkxLLlewIhorJ8y5Ns0OBSdTcI_Fpc
 _3_IGVZZtQS3pVi>
X-ME-Received: <xmr:_EPlYab0nD5aTCafawwP70t-WCHsw4iXBAJ909GFihc68LSIkw3RtvmY5BT0ZeTT7kRqQfmKWOJeqXtud6sj1a-rIALOQdw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddugdduiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefkffggfgfuvfhfhfgjtgfgsehtjeertddtfeejnecuhfhrohhmpeffrghnihhl
 ohcuuegrrhhgvghnuceomhgrihhlsegusghrghhnrdgthheqnecuggftrfgrthhtvghrnh
 ephedugedtleevudejuddvjeelvddvueeuhfeghfejfeeiueehvedthefgfeffudehnecu
 ffhomhgrihhnpegsuhhilhgurhhoohhtrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
 enucfrrghrrghmpehmrghilhhfrhhomhepmhgrihhlsegusghrghhnrdgthh
X-ME-Proxy: <xmx:_EPlYdW6jG55PRyClHEuZ7BtooSLpRdsxBDE21u-fOPMmTPPxt1lAQ>
 <xmx:_EPlYQmvZrB_ap1tist30XRB6csowdHMXjA1RE7UtuY2yUBQ29jnxQ>
 <xmx:_EPlYSc5LQgb4O5ws9-dLCNTHn0rquAYokbQ0U1qZyz6cGGAof3yYQ>
 <xmx:_EPlYaj8noWPT6ZJhwa8vcoeekwH0M5tULDFZ32ET9lXW6VvTdQ0LQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 17 Jan 2022 05:24:59 -0500 (EST)
Message-ID: <1ae38367-2e5c-20c7-0ba1-ebaff05cf8e7@dbrgn.ch>
Date: Mon, 17 Jan 2022 11:24:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
References: <20220116230404.71f68dbb@c3po>
 <CADvTj4qFSfOYQ+AkOsQyGgNbuRROEmgx1giiKGaJn2jRVyhsOw@mail.gmail.com>
 <20220116233758.59918490@c3po>
 <CADvTj4pjgwNt4ZnFB2ZmDeZP0nGaGPveqAapCTC+TOx3SEoBrw@mail.gmail.com>
 <20220117101705.GB2313964@scaer>
From: Danilo Bargen <mail@dbrgn.ch>
In-Reply-To: <20220117101705.GB2313964@scaer>
Subject: Re: [Buildroot] Hash verification from GitHub
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James, Yann

On 1/17/22 11:17, Yann E. MORIN wrote:
>> A maintainer could sign the tarball generated by buildroot and upload it to
>> github releases if they want.
> 
> To be exact: an upstream maintainer (i.e. not a Buildroot maintainer).
> 
> (...)
> 
> I.e. it means that we prefer using tarballs as-is from their upstreams,
> when they are vendored; we only vendor packages which upstreams have
> not.
That makes sense! I am the maintainer of tealdeer, and I'll provide a 
vendored source tarball for the next release. (I've heard of "cargo 
vendor" before, but I haven't used it so far.)

Maybe a corresponding paragraph could be added to the docs at 
https://nightly.buildroot.org/#_integration_of_cargo_based_packages ?

Thanks for the helpful comments,
Danilo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
