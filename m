Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BE21C433EF
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 22:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8BFC402A4;
	Sun, 16 Jan 2022 22:04:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id F7N1kYMTwuOL; Sun, 16 Jan 2022 22:04:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18C1B402A6;
	Sun, 16 Jan 2022 22:04:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A16D41BF476
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 22:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96ED360ADC
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 22:04:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=dbrgn.ch header.b="B0MDCTFs";
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.b="kHU5iH1S"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W_-A45tNLX00 for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 22:04:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04C3660745
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 22:04:13 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 4172C5C0182
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 17:04:12 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sun, 16 Jan 2022 17:04:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dbrgn.ch; h=date
 :from:to:subject:message-id:mime-version:content-type
 :content-transfer-encoding; s=fm1; bh=Kba9ZCv2SGHiiBs+6QfWlQ3rau
 kFBrvzNtKNhhlXZuI=; b=B0MDCTFsc7GEjuG0LHynY2CULQSxQwjSto/Fp4ovHL
 gCNw+Bvt9CWPMF1FfUqwI2xilOV2v1FhzhZlpSippY/k90Wn42k9xL81+LkhwEGv
 EQB7EWcv6sz2EKAaG8fja4nhLKTWFww12YzNDdI2g8cWHsatm5ucjnvD04iTt9Rw
 4MaKfVAoX4sIvOmCUyDdYI5Fwyzd0F14ERPjqOh1dFJ1xwX2cQsXk9f9jbvVZiAe
 tJWGQynviVl/0inWHzog9DhckMv4dQc2Yc4iwjuLYgExot/s7PJdIoDT31Mwv1Eu
 O37PyReAAAyrJ0PCnVhrZucw9pvYmjp4+kzqJZkVTZzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=Kba9ZC
 v2SGHiiBs+6QfWlQ3raukFBrvzNtKNhhlXZuI=; b=kHU5iH1SKpIAhyQwlhA+j6
 6eULBzcS5LQeVqTap+hIX/yj/I1NpEPwsyPoSD93ABzbFAWgTWkFSJQ2IlJfKMf/
 j3cD4Bwv8dDEpJinBLSDyOo0vE2z4qD5InUOTz/NZQhLoo5N7TTUU4mwKmmy5TCm
 mwjYSYZpijDcC2cVWZ5QTjQo0B8s/PpjJyX6nXkimBdkvMgaxjwWunxHpdxwInaf
 9IRAh6gwszEG0ey40oVyl9GU+7Lr4QgsSuZtixWVvUbLHrsujHb0HUonWf0hijpO
 z+5prM6ChXY4Q4evsgYIQbJuTLfVbPSpRxmEJrnzeLf2nLtH+XYNG9GWYvNwEA9w
 ==
X-ME-Sender: <xms:W5bkYbNM9Vy7MjCXSqBKIg-aDXWbOC2tssNIlTMOnW8BXyFKb0vr0g>
 <xme:W5bkYV-WVC68V47bEinOmZIEszu-YfjNdz3zjPY6VwMiCHufqxpqJNdCExxJrlmmC
 8PDL4OywBLMLOH_>
X-ME-Received: <xmr:W5bkYaS4EbLc6087ztuMWaoY7I1gUd6EqBMQFjbySbEeLDQB5IhqGt3r7GIOmlK2LD8bFHvm8sE84EkpYlWsjw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrtdelgdduheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkofggtgfgsehtjeertd
 ertddvnecuhfhrohhmpeffrghnihhlohcuuegrrhhgvghnuceomhgrihhlsegusghrghhn
 rdgthheqnecuggftrfgrthhtvghrnhepkeffteffveejledvveehhfelvefgffevjeeuhf
 ehheekfefffefhteekfedtjeefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghilhesug
 gsrhhgnhdrtghh
X-ME-Proxy: <xmx:XJbkYfthgnFJTGZDjfXS6UWZH-pgKrQ0E3nkwoz3DcpAQfxuKVSmiw>
 <xmx:XJbkYTf-MrJCPuv1wSFj3LXMI5SV0d5mntWCvbZFJMZMmDt6661tWg>
 <xmx:XJbkYb1Dtj2Rg1DHfxYjQStKS7qxdsoF76B6xG6nxkCoW9mTYOMb5A>
 <xmx:XJbkYbGRR8anQLw-zxyyd7Mp9pfJVUu2SrynYukhsrH6OG5QJe1c1w>
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <buildroot@buildroot.org>; Sun, 16 Jan 2022 17:04:11 -0500 (EST)
Date: Sun, 16 Jan 2022 23:04:04 +0100
From: Danilo Bargen <mail@dbrgn.ch>
To: buildroot@buildroot.org
Message-ID: <20220116230404.71f68dbb@c3po>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Subject: [Buildroot] Hash verification from GitHub
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

I'm trying to create a new buildroot package (my first one). This is
what the makefile (tealdeer.mk) looks like:

  TEALDEER_VERSION = 1.5.0
  TEALDEER_SITE = $(call github,dbrgn,tealdeer,v$(TEALDEER_VERSION))
  TEALDEER_LICENSE = Apache-2.0 or MIT
  TEALDEER_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
  $(eval $(cargo-package))

The URL should expand to
https://github.com/dbrgn/tealdeer/archive/v1.5.0/tealdeer-1.5.0.tar.gz.
To generate the checksum, I ran:

  $ sha256sum tealdeer-1.5.0.tar.gz
  00902a50373ab75fedec4578c6c2c02523fad435486918ad9a86ed01f804358a  tealdeer-1.5.0.tar.gz

I also added a hash file (tealdeer.hash):

  # Locally generated
  sha256  00902a50373ab75fedec4578c6c2c02523fad435486918ad9a86ed01f804358a  tealdeer-1.5.0.tar.gz
  sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
  sha256  a313b5e62b80a08f3aae0fa62ff3de8482ef55247299eb352ab44f87ef456b1b  LICENSE-MIT

When building this package, checksum verification fails every time.

  ERROR: tealdeer-1.5.0.tar.gz has wrong sha256 hash:
  ERROR: expected: 00902a50373ab75fedec4578c6c2c02523fad435486918ad9a86ed01f804358a
  ERROR: got     : 42febf9ee84721b9230077d62e2fc51201fd59624d3c776ccc1a634788768a60
  ERROR: Incomplete download, or man-in-the-middle (MITM) attack

No matter how I download the file (via wget, through the GitHub web UI,
etc), it always results in the SHA256 checksum starting with 009...,
but buildroot always thinks it should be 42f... I also tried changing
the TEALDEER_SITE variable as follows:

  TEALDEER_SITE = https://github.com/dbrgn/tealdeer/archive/v$(TEALDEER_VERSION)

...to ensure that this URL is *really* being downloaded, but it fails
every time.

Full build log can be found here:
https://gist.github.com/dbrgn/cc9e96051a079f5b63c531ca3c195954

Does someone have any pointers why the hash verification would fail in
this case? It must be some obvious mistake I'm making, but I cannot
figure out what it is.

Best regards,
Danilo Bargen
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
