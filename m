Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4750C433F5
	for <buildroot@archiver.kernel.org>; Mon, 17 Jan 2022 09:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19B48402B5;
	Mon, 17 Jan 2022 09:50:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XfwrT7xf1xv5; Mon, 17 Jan 2022 09:50:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 50C4F402C3;
	Mon, 17 Jan 2022 09:50:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 76B231BF41A
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 09:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 64EB7813DA
 for <buildroot@lists.busybox.net>; Mon, 17 Jan 2022 09:50:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=dbrgn.ch header.b="BB6KROC3";
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.b="CMz92EkZ"
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IOIqQKi_uEXh for <buildroot@lists.busybox.net>;
 Mon, 17 Jan 2022 09:50:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE5BB81372
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 09:50:29 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id D76655C0400
 for <buildroot@buildroot.org>; Mon, 17 Jan 2022 04:50:26 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Mon, 17 Jan 2022 04:50:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dbrgn.ch; h=date
 :from:to:subject:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm1; bh=lXltm3y4k1pLuFlh2VrtJCms41
 gm2Cf90zAPDItZHaA=; b=BB6KROC3lPEqYB+pE20LaSvhVvWi7uREIZvQuMWDjg
 HwXrMdgtPNtQLCj+cM934/+DPSizKraYbc4NmbL6FCZ2UuP9ijtOyH/Az7a9uQAb
 dKwhmZizFbs95wFo/76x0++VrRNLq60SU/L2jV77Zb37zj5hBphH24KVuRcLAyHb
 EMPrAp7m/utLnfQI7oXEQrKZH3xUtIvwb/uUnydhbfUSVpCBUY8dU48yGJFdCr36
 +w5Uq5/rDjxD0gaGBmpLu8jzHnBvoVtEHfPu7MnyUqJcYGRB7qTi88ggoTFAZzMa
 oK0io/3rDCHjFkwQHsnyDFXhaUc03XFMZNd/gIvk5BFA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=lXltm3
 y4k1pLuFlh2VrtJCms41gm2Cf90zAPDItZHaA=; b=CMz92EkZa2ZHr8eSgzURYx
 /ExG6Pa4L+zNr0mwJRLTNeTcLTQKBwqaCZ3NIuqmMwVwcwWgX3t4OpwtVwWK4UB1
 5juLkmI/5JrBsg7tb+pci2AHg98/jLg83vs4XBadOa48x1rc2T5a31QVkb9qYSAw
 lYMFHa55Bm+OwYG1xpMTnEaMBWGsN99VnfEwnFW84nJDSC4zC+vDpJcN6/SKMj/P
 E57KlitZ3uUVbPKE7lfPS81SJOZGjFcHw5tGtKhgurBqOSrt2fV6ImUq3pO0TgnA
 vCZIxXBz+B9qpYac8jhA/qzBoQU9JILyMpKimUKcCqlTw8wnfXNDDnnD0e0R6bIA
 ==
X-ME-Sender: <xms:4jvlYZaYaO112R2DvzteLZdcTiReOh7reM-v1RvYMrfaYSc-IPPRPw>
 <xme:4jvlYQbY3RQeeYEEvK1aFI06cCvKF0md6o6L3bbo-FmBS2wCOOYiop6Ygs_dheFIo
 LmGVuDkigGDsIXE>
X-ME-Received: <xmr:4jvlYb-2coP7Frtovu8ZMWPWu9y56BPVo02NSlMkpAGD3RIDp5o-7hoL4DWgyAkm3trF5pmYzcF9mgufbN5eeA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddugddtlecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukffogggtgfesthejredtre
 dtvdenucfhrhhomhepffgrnhhilhhouceurghrghgvnhcuoehmrghilhesuggsrhhgnhdr
 tghhqeenucggtffrrghtthgvrhhnpeevhfdvgedvheevueelueetvdelveetgfehiefgud
 ejueetteeuhfdvheeftdeutdenucffohhmrghinheplhgvrghrnhgumhgrrhgtrdgtohhm
 pdgsvghgrhhifhhfshdrtghomhdplhhishhtrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrihhlsegusghrghhnrdgthh
X-ME-Proxy: <xmx:4jvlYXrV_mb9exPCprMxoQBZoUzQ6vc1I03GkZ9TPZbsvvrb24XpBQ>
 <xmx:4jvlYUpFCKO_C-30LL1LdxW8-7w3pzP5l9kgvXKdSpk1XgLbn_BcQw>
 <xmx:4jvlYdSY5GWXdh4aOZyqn_9WUNn03fRfMvI2qSnkBz3b2bxOhdj2Nw>
 <xmx:4jvlYRBWaUnTnV-b70i7mGkn_Stc2BqgU42fCbYgA-oRnll8mM6D9Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <buildroot@buildroot.org>; Mon, 17 Jan 2022 04:50:26 -0500 (EST)
Date: Mon, 17 Jan 2022 10:50:17 +0100
From: Danilo Bargen <mail@dbrgn.ch>
To: buildroot@buildroot.org
Message-ID: <20220117105017.28d6aacc@c3po>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: [Buildroot] DMARC on this mailing list
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

Hello folks

I recently enabled report-only DMARC on my e-mail domain. After sending
a few e-mails to this ML yesterday, this resulted in multiple DMARC
would-be rejection e-mails.

DMARC relies on SPF (correct sender IP) *or* DKIM (correct signature). A
nice tool to visualize this is https://www.learndmarc.com/. If either
SPF or DKIM passes, the e-mail should be accepted.

In the case of mailing lists, the way I understand it, there are two
options:

- Rewrite the "From:" header so that the e-mail appears to be coming
  from the ML itself. Put the original sender e-mail in the "Reply-To"
  header instead. If this is not being done, the sender IP (the mailing
  list) does not match the sender e-mail domain and SPF fails. Note
  that this *might* impact the buildroot ML reputation for some big
  mailservers.
- Expect that mail servers with DMARC enabled also have DKIM enabled,
  and ensure that the e-mail body is not modified (i.e. turn off the
  automatically inserted footer). Put mailing list unsubscribe links
  in the headers instead. This way, even though the sender IP does not
  match, the signature should still be intact.

These approaches are described in the following blog post I found
online: https://begriffs.com/posts/2018-09-18-dmarc-mailing-list.html

I don't know if mailman allows turning off body modifications (i.e.
RFC2369 and RFC2919), but it definitely allows "From"-munging:
https://wiki.list.org/DEV/DMARC

I'm still quite new to this mailing list and don't want to put out any
demands, but I wanted to bring up this issue, since it will probably be
more and more of an issue in the future (DMARC adoption is increasing).

Cheers,
Danilo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
