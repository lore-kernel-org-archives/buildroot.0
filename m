Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E8FCC433EF
	for <buildroot@archiver.kernel.org>; Tue,  8 Mar 2022 08:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB973401EB;
	Tue,  8 Mar 2022 08:58:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 24iMGht06E8G; Tue,  8 Mar 2022 08:58:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13B2140204;
	Tue,  8 Mar 2022 08:58:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C36531BF32D
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 08:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1F5460B57
 for <buildroot@lists.busybox.net>; Tue,  8 Mar 2022 08:58:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=dbrgn.ch header.b="UXHdebbh";
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.b="APIcWg5c"
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DU71kCLzC7VM for <buildroot@lists.busybox.net>;
 Tue,  8 Mar 2022 08:58:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5403160ACF
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 08:58:24 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id A47423200C20
 for <buildroot@buildroot.org>; Tue,  8 Mar 2022 03:58:20 -0500 (EST)
Received: from imap48 ([10.202.2.98])
 by compute3.internal (MEProxy); Tue, 08 Mar 2022 03:58:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dbrgn.ch; h=cc
 :content-type:date:date:from:from:in-reply-to:message-id
 :mime-version:reply-to:sender:subject:subject:to:to; s=fm2; bh=8
 +jGrlmWo9Fq/HyVqv0/UJi98RVN72d492AjfROiXPg=; b=UXHdebbhHa2mRPU8E
 meqh5Oq8AZietj49Jon6Nkup35ErukYfwRCPacVQTCYLJYMhrcchoPX/mfSJJgnh
 X+OX9fBdtXqvQ3C4/X5kP8AqLaZ8cjz0oNPlONNbFfylFWVK6Jg+whXoVDUS+tdC
 +b0mrMCbHe2JVsnZVxgES5devPpnsbSjsoTPHD6mCGE5yO1Yazs+OC8S1xg1hXyv
 Qzf+92WYFTsaLambRCiRYFKfKiEpgcDm5BWVIla3E/ugCRIHr/wn0QRNmts6xF5J
 ZNqhiHNegArWnM0bhNWU5Vabblgt/XxfO+JNoK6yKxiFFGjJtzvtpoDJaGGIa97P
 1zmvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; bh=8+jGrlmWo9Fq/HyVqv0/UJi98RVN72d492AjfROiX
 Pg=; b=APIcWg5cl0+vnUPULNr8P9knB0639GEedcZG9PWNowcIAQ8d8XBprwVQi
 AkrlD31+fY0Nb9UKflmjhHgYuV2dF3Y/KNdmJLbn4mmFKegcbAK3PWYWo7okBBpt
 jjQRVaeNARWb2nUBLGKbk1F3C9tYgJ6giQix483k9yh4iuASyb3vzybIe2y1Ak5l
 ZFksgpoXBYQC991f6hAJWNIYqqqwaSrFOTBuZ7MNieyk2LppvOTyIlKkmIVtYABM
 cInuJYPVo6goEyR0Bheul7LLnQI4vjGGmxGjp5FU1/RnFOKKadiNbMR+dRqcb15M
 9Aw4Ozjgr0hO4zIWWDuN9dYIP16hQ==
X-ME-Sender: <xms:qxonYoE7Sk3A2d8v3zLZJpeLJDMS-eOhk4FSlQrFKmXjkb10AZCBQg>
 <xme:qxonYhVY85rqTg6Plq0t-WT1hYwUcC2S6Y__jEiiTTV-1GX5MuubC6HEoCarB_JkE
 gV_Vvze7dUypU31>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudduhedguddvgecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesthdtre
 dtreertdenucfhrhhomhepffgrnhhilhhouceomhgrihhlsegusghrghhnrdgthheqnecu
 ggftrfgrthhtvghrnheptddtkeduffeiveefgfeuhffgheeivdffjefgveffjefhtdekgf
 eivedujedthfdvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
 rhhomhepmhgrihhlsegusghrghhnrdgthh
X-ME-Proxy: <xmx:qxonYiK3e_uqF7qhRaudkl9mojHoGQR4ICCAnuacwhgV106Rk6eX6A>
 <xmx:qxonYqHxcM4R1EDXIDlTC9ssIimsSkllin7O8Y6wBEh9hQJ3feKhhA>
 <xmx:qxonYuVL3fltLdjqr_tUgR7rlqfhgYwJD7NJUaLhB3opY44JljqoLw>
 <xmx:rBonYnfW5_-rk0XHIS_l_mC9jPE_GMzaFK9vERp8STUwZbSTZI1W6w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id BA5E321E006E; Tue,  8 Mar 2022 03:58:19 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-4778-g14fba9972e-fm-20220217.001-g14fba997
Mime-Version: 1.0
Message-Id: <0e6293a1-fa3e-4399-b963-14634d3578ad@www.fastmail.com>
Date: Tue, 08 Mar 2022 09:57:53 +0100
From: Danilo <mail@dbrgn.ch>
To: buildroot@buildroot.org
Subject: [Buildroot] Patching buildroot package makefiles with BR2_EXTERNAL
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

Hello

I'm trying to set up an Nginx module package (nginx-rtmp-module) in a Buildroot
project that uses BR2_EXTERNAL. I added the new external package, that works.
However, Nginx modules need to be compiled along with Nginx, which means that I
need to patch the Buildroot nginx.mk file, right?

What I need to inject into the makefile, is the following:

    NGINX_DEPENDENCIES += nginx-rtmp-module
    NGINX_CONF_OPTS += --add-module=$(NGINX_RTMP_MODULE_DIR)

Is there a mechanism to do this from outside the Buildroot source? It seems
that BR2_GLOBAL_PATCH_DIR only works for packet sources, but not for Buildroot
makefiles, correct?

I tried adding the assignments above into the package makefile
(nginx-rtmp-module.mk), but that doesn't seem to work.

Any help would be appreciated!
Danilo
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
