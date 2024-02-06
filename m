Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06813C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 22:31:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3D34420A5;
	Tue,  6 Feb 2024 22:31:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4HbuR6TZYFBi; Tue,  6 Feb 2024 22:31:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEFEC4202B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEFEC4202B;
	Tue,  6 Feb 2024 22:31:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 00B571BF276
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E1F3E4203B
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 22:31:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6xMBUGIMOOfF for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 22:31:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7C4884209F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C4884209F
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C4884209F
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 22:31:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 939FB20004;
 Tue,  6 Feb 2024 22:31:23 +0000 (UTC)
Date: Tue, 6 Feb 2024 23:31:22 +0100
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20240206233122.30f9be84@windsurf>
In-Reply-To: <20231218220457.1705749-2-adam.duskett@amarulasolutions.com>
References: <20231218220457.1705749-1-adam.duskett@amarulasolutions.com>
 <20231218220457.1705749-2-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707258683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TeKDBDfL+5KWyeQU4DXx/IZED6BW9jD2NWmHmKVHhbA=;
 b=O6DircT0hrCMQYMjFjpeEfLPwj3q+oQ1TCds2PX0CN/k40DjV/j/xch1a4ONEPD9ouJevy
 LuZ/G/kRCTxHQ30jYOVV74pYAn5dl2y2Q/2FwWyh2KponvcgOoNB5gk3OWhIBxRjKJmJJT
 qMPzA+NjpHN01ydNTgDT6cPGgt2IPLYgtBka/aCJrHYRCSXiYHUoo9/Pb2ysRIL5+iJ4DS
 DY/FENmleuo0eFkobJBJl4bDejFlyxW+fojNmqQz0+Ne9inmOUvbjtqcJa5dsSuRDIhnc0
 VMHEtbMzBBpTTa6pZ4XQX3iPPOliTWL/62oGgpTsQ7hfpi2FW6DTaKq80zpPOA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=O6DircT0
Subject: Re: [Buildroot] [PATCH v4 2/3] package/python-crossbar: drop package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 18 Dec 2023 15:04:55 -0700
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

> The current package has not recieved an update since Sat Oct 9 2021
> 33ece2446e25e20929d1c7eefa9f3244a3b79a92 and is not python 3.12 compatible.
> 
> Furthermore, the current version requires at least 42 new packages worth of
> depedencies of which several require patches to be python 3.12 compatible.
> As nobody has stepped up to maintain the package and its ever-growing list of
> dependencies, along with the other problems, it is time to drop the package.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  Config.in.legacy                              | 16 ++++
>  DEVELOPERS                                    |  1 -
>  package/Config.in                             |  1 -
>  .../0001-Avoid-intentional-syntax-error.patch | 29 --------
>  ...s-min.txt-drop-indirect-dependencies.patch | 74 -------------------
>  ...ice-wap-use-markupsafe-instead-of-we.patch | 53 -------------
>  package/python-crossbar/Config.in             | 72 ------------------
>  package/python-crossbar/python-crossbar.hash  |  5 --
>  package/python-crossbar/python-crossbar.mk    | 14 ----
>  9 files changed, 16 insertions(+), 249 deletions(-)
>  delete mode 100644 package/python-crossbar/0001-Avoid-intentional-syntax-error.patch
>  delete mode 100644 package/python-crossbar/0002-requirements-min.txt-drop-indirect-dependencies.patch
>  delete mode 100644 package/python-crossbar/0003-crossbar-webservice-wap-use-markupsafe-instead-of-we.patch
>  delete mode 100644 package/python-crossbar/Config.in
>  delete mode 100644 package/python-crossbar/python-crossbar.hash
>  delete mode 100644 package/python-crossbar/python-crossbar.mk

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
