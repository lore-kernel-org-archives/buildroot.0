Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD1AC54E94
	for <buildroot@archiver.kernel.org>; Tue, 24 Jan 2023 18:21:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 000A14032B;
	Tue, 24 Jan 2023 18:21:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 000A14032B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6zZ722JhZGK4; Tue, 24 Jan 2023 18:21:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 534FD4015A;
	Tue, 24 Jan 2023 18:21:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 534FD4015A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BFD901BF3B8
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 18:21:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A4A34015A
 for <buildroot@lists.busybox.net>; Tue, 24 Jan 2023 18:21:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A4A34015A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qMj5MUursS2q for <buildroot@lists.busybox.net>;
 Tue, 24 Jan 2023 18:21:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C68440102
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C68440102
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 18:21:15 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 y3-20020a17090a390300b00229add7bb36so14829103pjb.4
 for <buildroot@buildroot.org>; Tue, 24 Jan 2023 10:21:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GlEIGkQX7zYSuwbGHxeNDT3Q1lYgKNFSMQIlh697s6w=;
 b=ZGtMYsq5t9D0tFTTgdPom+25wiLdUFwLfsB+Kjylvxmz2so2eVTnM1TfKW+xfBf3nr
 ZYt6DXUnE/CUP43cV497WNqAg/t6deWG4PWEem33nRXBBRuh0jYWXm8X0eeDmMztuCkf
 1ir3scZbXBVNXFT6Hz6x8YNy9pWfYQRnw29jT5d3LpzPxTxh7THOeE8xT5y34GnJqiU7
 x0q239yvxoHrt9CTNpQqfs27o7DxRrNWOK0vQ5P+qUNciqazrpY6r8KmcEhS0oabqZC+
 +1ceXCs/fCB1cBo9mYMnD83vpvmEHcdSUBsQUF4X8DUTF7eBlYU21jtR6/XOmCtmZZfn
 WwUg==
X-Gm-Message-State: AFqh2koklWzfXdcwM3RltjKm21bVxjxOVauYlb8B48zPwdJQt6/fbp8Q
 5qayLzFjKSeo0+81Wh03bbVeMzXGVSaun3fHY9YeFngrJas2CSDw
X-Google-Smtp-Source: AMrXdXtMAMhXVOJn6XyBAP9Idgt21lhmOY8aRFwagSIUgVfmuhZ55IwDOwr4N8AZolkxez1JX3mY1BX40xGuCQa7DBU=
X-Received: by 2002:a17:90b:3647:b0:228:ccad:2089 with SMTP id
 nh7-20020a17090b364700b00228ccad2089mr2937666pjb.19.1674584474236; Tue, 24
 Jan 2023 10:21:14 -0800 (PST)
MIME-Version: 1.0
References: <20221102103428.82414-1-juan.carrano@ebee.berlin>
In-Reply-To: <20221102103428.82414-1-juan.carrano@ebee.berlin>
From: Juan Carrano <juan.carrano@ebee.berlin>
Date: Tue, 24 Jan 2023 19:21:03 +0100
Message-ID: <CAH2v1AqdjKmiMpDpNg_3UkV6m_L4MK_iQ=Y69D8wFL_M+FJQ=g@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ebee-berlin.20210112.gappssmtp.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GlEIGkQX7zYSuwbGHxeNDT3Q1lYgKNFSMQIlh697s6w=;
 b=Q0O86rP5V1roS/1uvq9jHmEi7ZvBWkqqB9OU/nJNaS+w3CmYi9alGyRkoeIkdXhAcL
 bS5nQfX8Xhn7Uk8m2H6p0Wgd2RgM4u052DB5VS+gWVvV/tF5I4dOBiUjecQckNxgfRDG
 cpi7pyVXF69nCW0F4uTHEImGkhHkgd7mi5aMRXKuS88wakrhyf7eNiee4qDBhVW8GfKJ
 Jb+UYxAp2OaRjVXnbqS7K9xdmLP/k4mXrfyRtW5xfDnmzxa9SaI3NUrFFHkFeQ0U3pPd
 bU8M0uh+qJi1l60Sb21KJ2BQ29cjZo8wSui/D0lz50qhcSCs/TZsrQSjST87Ddwr90e6
 wQiQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=ebee-berlin.20210112.gappssmtp.com
 header.i=@ebee-berlin.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=Q0O86rP5
Subject: Re: [Buildroot] [PATCH] support/pkg-stats: list packages from
 external trees.
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
Cc: Sen Hastings <sen@phobosdpl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

I'm bumping this email. Is there any interest in this feature? If the
implementation is lacking, I can make any required changes. For our
use case at my work this is very important, otherwise some packages
will not get checked for CVEs.

Regards,

Juan.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
