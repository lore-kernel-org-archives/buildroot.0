Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA673C79F85
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E89060E46;
	Fri,  4 Sep 2026 12:19:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GOPyBFqPFztA; Fri,  4 Sep 2026 12:19:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4AFF660E41
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524365;
	b=UwUXqkghnVaOBo+0aFm/uoL/E5XsOuFi+wtKYsXLN0Dn1Ku4j7qI5jUbQ0pexsqXCYtr
	 Py6vLC5thExnYjgMWsAg+52tZ5QdiypIpc/scnSUInziyNeYwPte6kuy5YZHRna3N3wvu
	 4jYx2DgvBsjIUsGiy0Wo2hhVXCKG8deELJMvrpZhnQXcwE5v5rljPdGkWOGZYUZyzhPgU
	 8hP7BPNCig368AwwapANwyQ8tQeqorYNkMpr1t9k8ILNuyhKhVwZJcyfdImOawRWeRa1Z
	 nIYy75L2F7Leu18Tek1s4CdHlgm061/nl0ExG+SYxCS1K017pjztk01YR08DPNcblqQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524365;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=JbpThtoTdqKLGNhE8NYkgyf1ZO0jA8H430TZRisDbTc=;
	b=psg9Em9Y0iV0O3HMGCc+yG+ZIBRPzrDQMutGbuwUy8JpMqJCVKzTAXMs6UG8/wRsdZ2q
	 ehzqtuzi5VhKoSokG5p4wD2cTD98Nzgwz+MVMHJK0rqT2LDbPK/NW3BQv850oHzuJsL8y
	 Urr887vd0qfmIJnHlwc0QGObdi4EhFOGFTh6TJsBsIFCIOttMSHPZNYio5ieFn/3JiwiU
	 Y3Rwb2l54mQmolYdE4s7Pih8rZgnXuKtw2gjMCEpDto1LBles2osRRI9FcLCuiK9Ww4YT
	 1sq9J/fO7hGkoRzyqjl8YDFcJDqs04IMbxfj5YhllXba2bwNlYrBgMBHWquvvN1THhg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524365;
	bh=JbpThtoTdqKLGNhE8NYkgyf1ZO0jA8H430TZRisDbTc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=btYrU638TBqXMHUaahXYMGWCO2rIMoN8Av0sX0buwNZDbprPnXwm8HpAX3QzR4l5/
	 Q9c7LAS6Tp5TdZJLU+zSZtYuQy38Ph47MvqZKvAZJz4QcY0yRJkI7MAeI3p5T6EyK8
	 aIO8xL5FcjfbUEdoF8/DfxKoeSF4UCiVxu0zEJc5Ow+ivXN7/i0x4pFg0bKUgJRkmO
	 s4JI8x2COC5foLRP+tYXyOVcUsgPTVrkowlO5Nif15sbKvOPh0M7th7b6+3MqrLPAL
	 hGLNImrw1nr4vHJ7RYgfKFAsPtIHkg/DeaoNp0HJSJSa6kI5wEdL0vvg+ezom9tvew
	 pWxIPjc8SZzNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AFF660E41;
	Fri,  4 Sep 2026 12:19:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5AD8D10E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 40A9481176
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cdjaq1GWxdlH for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:19:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0664A81172
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524353;
 b=aVJnOw22Oa/CVS+yKMIeLmo1S56MvqtRw98pryy2LKsClfQMVm9AFNar+E1SyOZg0jU8
 WXASSQJ2xLRYmlSItF/qWbnDAZQSIj/4jB+kNU0OyRKyN30FpY3l0hAWqWw5dxv4xSM0j
 2pnBjkMv7XpTddp1PN+E+JVmwBI2ujs70J/CgYyzJ/ls9cmBlmP7WyVAKTKFaINlcMyuO
 N1d/0bIlMA8+CSKMNnNmjzeUPCKTS70t1Eff2fBkrfUlT55r3WmL9vfZAuavr8buPEUIc
 3dOFC/wxP760aybWf1bC7r0vFti6TuI4+UziPYk4AyD0V+katMuvRUHpRa71W7JCTCQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524353;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=4YmT/qkIifgURhjEt/RyIL54lMhhFUvx4EBi7QRW8tA=;
 b=ZHFMMLE4XMG03ulLQUz7DTRB04+s/L78I49eiHyA0jdaWdqghHQgKTn0aW9TMWDRHtOb
 pHc1NYkZKkBh7BZNcpYT2M49O/sV5ZZwmSpZZfSivZQx50DulPCWUwwmfMQJaGpJiQ7G+
 dLK5t8T5l2Dti234UxmZ1IdrAiBbb+QU8SucBSdV/pEuwJge3/CT3wIECxoNDcQ4ljhqq
 eK9lYva4QRBMTpgw3QZoQ/JG56gfGZ02PrSbCvyCJMPigjHINTEGrds8uGAHr954y/vVi
 kpn25glbqu6Q+MdUurRhGo87sOo9PGJIU+QfmHYIGTFpABJ6NewNnsvH/dg4lVBkXjQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ZCkIPwgR; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0664A81172
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:12 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-4858595f997so584713f8f.1
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524350; x=1789129150;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4YmT/qkIifgURhjEt/RyIL54lMhhFUvx4EBi7QRW8tA=;
 b=WatjW4hmvdwa8VNjEWhWTQRY3oohsFZb0/gsu1nwVFMGpDLuj+8h/pfu+7YOGfmNmL
 WmEiJJgTvQg3Qg2KAqFsHtMtmQ0EmVKCp7PaKBF0yYsqZsD5D0aDWQGmeQg5sSRJ+PzV
 76A+uGsaDKRDBYcQpSLR9Obk8NL3jb6LfyPZWhgHOo/2bWcrvmdarmWNgPCUGq75Q0z0
 F+qY7w/8DVUuQAZVqwEXmRYCgWBrKTfl8bpUNsn1kQsgXPEJ8M8llPu3k4x1QeZQ3itq
 3pHEZEJvT2gfA09bkZrH1E5wtOTzZ3Q7S9InIjSNTE/2LkG7oGv51zet5mm+ILRsrJXr
 TrXQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzpP5aNNnsIEz9d+z/i+h3AjArW4VgUbrSsRC834vfr0fYSoYVsuESbirlUXv/+qmv13Yv7bgfviHU=@buildroot.org
X-Gm-Message-State: AFuF++nmntIkq8+Zlm9lGiR6JeVWdFA6E6nGWgUdAkSh9x6sv6fH9vyV
 NjXZejH9nmnQbPz8h34nUIw1lzliyW/jTw4mqG7anUmEsU3Y4gdwZAId2V3R3albQPGPMKcD2WB
 uxBwy
X-Gm-Gg: AYBFou3CiihuP2p9y2+0Jr7esNPHX9j9rP4mrhcYJhiTDr60feubqyYT7+KBoD4PQvm
 yNuuP0f2vqjUUCaEMloMZtPt2+LzbsdvS6At9Pws2ORka1nbSyfpLGY7hleIOgtlYvcSm0xLjRH
 53x5DKlGGiOEeJQQcEWhgnuXgOcXNyfKn4+MYU3noMKPWZRRHZxI1/kBcf1srKeeNTPmkZgU/BB
 VMoqQ9uX6GLz1k911n+0l2RLHqQnHRFBs2XuDE1LBuDZuPCW6+H/NrWSLX/Y5lmuwPTRz+KPuX3
 ZbE2hoCXeb6fGl9oxFkmIcDS8gdc4L0UeY8Mx45DB+yLhfu3WmeQqTRlXimJfuH7SxIdPlmSAS+
 aiODVXg0dGmpTqPaZ34Gdn4zuUh0BFHBQB3PMKPrpwuP6fVL6GxXD5gRMo101VpteEZLkl7mXJO
 0bMmBrc2Xh9864C3lhcUZVsWA/kt5di2ly9/MYse+3TCB8plKhxM8gtnZnRBpUPWK2zBM=
X-Received: by 2002:a05:6000:4819:b0:482:fc30:a1b4 with SMTP id
 ffacd0b85a97d-4858704686dmr12031929f8f.5.1788524350466; 
 Fri, 04 Sep 2026 05:19:10 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48588394fa1sm6038680f8f.8.2026.09.04.05.19.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:19:10 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:19:08 +0200
Message-ID: <20260904121908.406719-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260828172002.2364384-1-thomas.petazzoni@bootlin.com>
References: <20260828172002.2364384-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2] docs/manual: patchwork is now at
 patchwork.buildroot.org
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> patchwork.buildroot.org used to be a redirect to patchwork.ozlabs.org,
> but we are now running our own instance, so let's adjust the links in
> the manual accordingly.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  docs/manual/contribute.adoc | 10 +++++-----
>  docs/manual/resources.adoc  |  2 +-
>  2 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/manual/contribute.adoc b/docs/manual/contribute.adoc
> index a0002ce188..f82eb14303 100644
> --- a/docs/manual/contribute.adoc
> +++ b/docs/manual/contribute.adoc
> @@ -460,7 +460,7 @@ editing the commit message. Below the +Signed-off-by+ section, add
>  
>  Although the changelog will be visible for the reviewers in the mail
>  thread, as well as in
> -https://patchwork.ozlabs.org/project/buildroot/list/[patchwork], +git+
> +https://patchwork.buildroot.org/project/buildroot/list/[patchwork], +git+
>  will automatically ignores lines below +---+ when the patch will be
>  merged. This is the intended behavior: the changelog is not meant to
>  be preserved forever in the +git+ history of the project.
> @@ -513,19 +513,19 @@ $ git format-patch -v4 -M -s -o outgoing origin/master
>  
>  When you provide a new version of a patch, please mark the old one as
>  superseded in
> -https://patchwork.ozlabs.org/project/buildroot/list/[patchwork]. You
> +https://patchwork.buildroot.org/project/buildroot/list/[patchwork]. You
>  need to create an account on
> -https://patchwork.ozlabs.org/project/buildroot/list/[patchwork] to be
> +https://patchwork.buildroot.org/project/buildroot/list/[patchwork] to be
>  able to modify the status of your patches. Note that you can only change
>  the status of patches you submitted yourself, which means the email
>  address you register in
> -https://patchwork.ozlabs.org/project/buildroot/list/[patchwork] should
> +https://patchwork.buildroot.org/project/buildroot/list/[patchwork] should
>  match the one you use for sending patches to the mailing list.
>  
>  You can also add the +--in-reply-to=<message-id>+ option when
>  submitting a patch to the mailing list. The id of the mail to reply to
>  can be found under the "Message Id" tag on
> -https://patchwork.ozlabs.org/project/buildroot/list/[patchwork]. The
> +https://patchwork.buildroot.org/project/buildroot/list/[patchwork]. The
>  advantage of *in-reply-to* is that patchwork will automatically mark
>  the previous version of the patch as superseded.
>  
> diff --git a/docs/manual/resources.adoc b/docs/manual/resources.adoc
> index a1b8b366e1..331929e0c6 100644
> --- a/docs/manual/resources.adoc
> +++ b/docs/manual/resources.adoc
> @@ -68,4 +68,4 @@ review comments in a clean and concise web interface, it can be useful
>  for all Buildroot developers.
>  +
>  The Buildroot patch management interface is available at
> -https://patchwork.ozlabs.org/project/buildroot/list/[].
> +https://patchwork.buildroot.org/project/buildroot/list/[].
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
