Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB41C43334
	for <buildroot@archiver.kernel.org>; Wed, 20 Jul 2022 11:51:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65DA7419DC;
	Wed, 20 Jul 2022 11:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65DA7419DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xwbytkKYHwXs; Wed, 20 Jul 2022 11:51:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF1B6419EE;
	Wed, 20 Jul 2022 11:51:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF1B6419EE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0F1DC1BF2F0
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 11:50:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EB06160D63
 for <buildroot@lists.busybox.net>; Wed, 20 Jul 2022 11:50:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EB06160D63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KVc404fZZXx1 for <buildroot@lists.busybox.net>;
 Wed, 20 Jul 2022 11:50:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C8D5360BE1
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8D5360BE1
 for <buildroot@buildroot.org>; Wed, 20 Jul 2022 11:50:47 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id B451E1BF203;
 Wed, 20 Jul 2022 11:50:45 +0000 (UTC)
Date: Wed, 20 Jul 2022 13:50:45 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220720135045.2b25ad0a@windsurf>
In-Reply-To: <20220712162712.1582871-1-fontaine.fabrice@gmail.com>
References: <20220712162712.1582871-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658317846;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H6jl5Ceu4xQGH3d+FLZtGN81VreIPVcPkK+LzdXaXDk=;
 b=lpcAVVT+S98IHJd3Ydzikp64D4cwW4gb21Y61p+lrfzzyHYyuM3FHMDVZ9pHccdq/QMRos
 FIVmdHI2qWLm1NT1eIyK91Uemp1QcFk/hpjE6voRsB0Jz8q6odonEu7peIAbYake2SqYZS
 sGqdzldVAY0teyEVPNglCSM4ebt+hZCBlht+T49dx32yVHcxWMy1CV2+60DoFPg6Cx/p+I
 iLGx/p1R9F0ocLcUlPl+asVm6pTz89mxUX3MabYWGNlTfd6IN21k1+Vh7uC6RjxokNqfu1
 MYjOpjm8iqTknqyhl6PLeCq5365deJS8+b9qBQu6VO28lJybItzqS86JrLgnVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lpcAVVT+
Subject: Re: [Buildroot] [PATCH 1/1] package/harfbuzz: fix build with gcc < 7
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 12 Jul 2022 18:27:12 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure with gcc < 7 raised since bump to
> version 4.4.0 in commit e186b4d89dcd3eb9fae557959181d7176e7c873c:
> 
> In file included from ../src/hb.hh:473:0,
>                  from ../src/hb-buffer-verify.cc:27:
> ../src/hb-cplusplus.hh:170:13: error: specialization of 'template<class _Tp> struct std::hash' in different namespace [-fpermissive]
>  struct std::hash<hb::shared_ptr<T>>
>              ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3fe7526b685368007ae0f66e15ef2b27d30d5063
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0002-cplusplus-Fix-build-on-GCC-7.patch   | 50 +++++++++++++++++
>  .../0003-GSUB-Fix-build-on-GCC-7.patch        | 56 +++++++++++++++++++
>  2 files changed, 106 insertions(+)
>  create mode 100644 package/harfbuzz/0002-cplusplus-Fix-build-on-GCC-7.patch
>  create mode 100644 package/harfbuzz/0003-GSUB-Fix-build-on-GCC-7.patch

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
