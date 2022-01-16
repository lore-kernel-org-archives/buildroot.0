Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCB50C433EF
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 22:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6386A605A1;
	Sun, 16 Jan 2022 22:38:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id It9EV_QKuXJR; Sun, 16 Jan 2022 22:38:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFB2360ABD;
	Sun, 16 Jan 2022 22:38:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 773141BF3CB
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 22:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 72A76813F5
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 22:38:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=dbrgn.ch header.b="tC7XSr5e";
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.b="oMveRdkd"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n9z40WlXu-8d for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 22:38:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B452B813ED
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 22:38:09 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 0AEF75C0112;
 Sun, 16 Jan 2022 17:38:07 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 16 Jan 2022 17:38:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dbrgn.ch; h=date
 :from:to:cc:subject:message-id:in-reply-to:references
 :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
 1lv6T1v0YLN9atHL4uDwbiyo5rNUzz0WY/UOv/8LKZM=; b=tC7XSr5ez8MogIA2
 hMPzQ3cj96SdF0osOGOFa15igOflX+lsrOllHw+eV5jpV9RHc8/TxHYBD6aeFEbv
 QONNu4j+VgngzygTzRVrcdtL40psaQGW84lUJ2jKrSze9oSMRJei3kJ5sxuSyc5B
 ou1AnDorVdduWNHaVdVGc1eAjpckWzwOBWxr9CyXM8JZpTTVwahLjCdPy+00rImG
 xQ5hxCyNJnqISgE+9ag/Dlnz6lh73blafgHOR9fsYlFPUzvFiq0Deh12ozJiO6eq
 E8dhI0dFbdSCOE6+YVJQlUu4GmVdyjV8OTgHUB8CmtC7MtmlHjIiCyZEHeNPggOD
 8u6tjQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=1lv6T1v0YLN9atHL4uDwbiyo5rNUzz0WY/UOv/8LK
 ZM=; b=oMveRdkdDlwxr4J1YAa94IghtgQG8M7EP/S/DuRRtMn5UG/zK3LjPreSE
 vmF/QG1BI1gfV8ahAdrXKOe/LLGhxg9r71Wi3HcBStsN3suaJIG2dM3/Kg7YXhMS
 YdRRyFqXLXQ8ZcorWltgDw2n4prbVSDiLzTjuaKeczHjm1ok0CMmN4SyZr6jirj8
 yaMtmpgoB4MYAKD/nbkb8F8I2lbK8jURbfeTtsiL6m5+SbYoq7fIjW3zw7LXK/7D
 QLjdnpzcWJ17Ru56a2IRDqrCPepqfN/mRTgAeRU8ZVJu7OhQFS5W0CXT2t2N2eb9
 092XVpBZrPBa7TmIGNjMxTNtyYO8g==
X-ME-Sender: <xms:Tp7kYbWgXHqLJshInvuz5qlb-VG4GnAoRjjRvp3TnrkYS5_5mFLUPQ>
 <xme:Tp7kYTknpbbFi_8v9y_UbT41Nj-vN1mWduc0xxtDwUwRXKCD5WbxyXRmU6TDFLAij
 rrTK5w0YoB__IBT>
X-ME-Received: <xmr:Tp7kYXZBe7NoxCBJfnfGijMs9FXtBNtQt5TyPwNbpb2OOWW8e9JCweypxDZufB8MOkNVGxB_Ifqy48cDGqGbcw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddtgddtudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfgjfhfogggtgfesthejfe
 dtredtvdenucfhrhhomhepffgrnhhilhhouceurghrghgvnhcuoehmrghilhesuggsrhhg
 nhdrtghhqeenucggtffrrghtthgvrhhnpeeuueejffduhfetudetteffudfhtddvfffhle
 etudefvddvheeffffgtedvjeefffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehmrghilhesuggsrhhgnhdrtghh
X-ME-Proxy: <xmx:Tp7kYWVP9hlJm7-axi_aIrrgonxSASiHTEhR_IlCCTGEdpnqgcowEw>
 <xmx:Tp7kYVlQlFyks6cGSRKDH4HU1CxFCBxZTW9kHJdM061GLe6AcshGHw>
 <xmx:Tp7kYTfISGwBO_6xo_FW9eCyZlROLCp0KpyngmLVpZobIa1daBTKaw>
 <xmx:T57kYayvra2inxlPmF5G4mus3R2KqyuB52EQn6YCuyy-97BviX93Ag>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 16 Jan 2022 17:38:06 -0500 (EST)
Date: Sun, 16 Jan 2022 23:37:58 +0100
From: Danilo Bargen <mail@dbrgn.ch>
To: james.hilliard1@gmail.com
Message-ID: <20220116233758.59918490@c3po>
In-Reply-To: <CADvTj4qFSfOYQ+AkOsQyGgNbuRROEmgx1giiKGaJn2jRVyhsOw@mail.gmail.com>
References: <20220116230404.71f68dbb@c3po>
 <CADvTj4qFSfOYQ+AkOsQyGgNbuRROEmgx1giiKGaJn2jRVyhsOw@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James

> Just use the hash buildroot generated for you, it should be correct.
> (...)
> Yeah, it's not going to match since buildroot is doing stuff like
> vendoring the cargo deps before generating the tarball

Ahh, that explains it. Does this mean that for Cargo based packages, it
will always be TOFU and checksums provided by the project / maintainer
cannot be used (because they will mismatch)?

Danilo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
