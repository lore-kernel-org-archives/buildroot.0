Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8B4C25B74
	for <buildroot@archiver.kernel.org>; Sun,  2 Jun 2024 09:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 27F7A400D3;
	Sun,  2 Jun 2024 09:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IunwjTDtzCz0; Sun,  2 Jun 2024 09:42:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2018C40465
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2018C40465;
	Sun,  2 Jun 2024 09:42:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 283D91BF3D2
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 09:42:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1DE79606E9
 for <buildroot@lists.busybox.net>; Sun,  2 Jun 2024 09:42:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vqsV5Zlq0DFC for <buildroot@lists.busybox.net>;
 Sun,  2 Jun 2024 09:42:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CB286606CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB286606CC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB286606CC
 for <buildroot@buildroot.org>; Sun,  2 Jun 2024 09:42:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6000113F92C;
 Sun,  2 Jun 2024 11:42:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 02 Jun 2024 11:42:38 +0200
Date: Sun, 2 Jun 2024 11:42:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Geoff Levand <geoff@infradead.org>
Message-ID: <Zlw-jsAvHNP_HO2g@landeda>
References: <f01af2e5-4683-47e2-86d9-737f07279724@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f01af2e5-4683-47e2-86d9-737f07279724@infradead.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717321362;
 bh=d0lsjQp2DrC0KIJweOz5WZBjwaR833TTHTQndCnowlw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O/rGn0wM3uXmSkx4/J3O1mnvMw/xt26PVjuN/ptDeAYCzjqz+iu5MUOWQZqTSONOU
 W3aULXbfePz5pP2KxIhZcf/PNpzHRyaywzlNMroJ9tOMw+lWTpuRsFIYtOnb5+9YUd
 DvNu+3fMcMunYr5GGGUQ1g97m4D/OUe332yrGEd67Hg/L6qSFSnx8wLBtJ3oe74IJn
 MGZIpzByyP1R/yJ0BfZakRrQ4gZOiHBeBmjAt7z2SMKlJkJYxoZGJ7ii86ZVPORoM6
 bk5kP9bsp4Oc4cfBl71OMovoUaZ9sBO1Mpilzpjmhr58HxrcRP/UGsSMkiCJOQUjny
 KYdOTm2d4miag==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=O/rGn0wM
Subject: Re: [Buildroot] flannel riscv64 build failure
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Geoff, All,

On 2024-06-02 16:28 +0900, Geoff Levand spake thusly:
> On 5/20/24 13:06, Thomas Petazzoni wrote:
> >   riscv64    |         flannel-0.25.1         | http://autobuild.buildroot.net/results/d2be77d8b9236db45c4f3a558f3198f199c0c568
> I posted about the riscv64 build failure to the flannel project, and one developer said
> it might be due to buildroot setting CGO_ENABLED=1 for the riscv64 build.  
> The report is here:
>   https://github.com/flannel-io/flannel/issues/1988
> 
> I'm not sure if setting CGO_ENABLED=0 just for the flannel build will solve the problem,
> nor do I how to do that.  Any help will be appreciated.

You may want to test something along the lines of:

    diff --git a/package/flannel/flannel.mk b/package/flannel/flannel.mk
    index 317ad14ba3..4279c5bb99 100644
    --- a/package/flannel/flannel.mk
    +++ b/package/flannel/flannel.mk
    @@ -12,6 +12,14 @@ FLANNEL_LICENSE_FILES = LICENSE

     FLANNEL_LDFLAGS = -X github.com/flannel-io/flannel/version.Version=$(FLANNEL_VERSION)

    +# Upstream only supports CGO on x86_64 (aka amd64):
    +#   https://github.com/flannel-io/flannel/issues/1988#issuecomment-2141483747
    +#   https://github.com/flannel-io/flannel/blob/v0.25.1/Makefile#L11
    +# So force it disabled for anything but x86_64, where we keep the default
    +ifeq ($(BR2_x86_64),)
    +FLANNEL_GO_ENV += CGO_ENABLED=0
    +endif
    +
     # Install flannel to its well known location.
     define FLANNEL_INSTALL_TARGET_CMDS
     	$(INSTALL) -D -m 0755 $(@D)/bin/flannel $(TARGET_DIR)/opt/bin/flanneld

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
