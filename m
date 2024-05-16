Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CA8C25B74
	for <buildroot@archiver.kernel.org>; Thu, 16 May 2024 19:26:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E229A41D77;
	Thu, 16 May 2024 19:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LazUJSEplWPL; Thu, 16 May 2024 19:26:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E561440168
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E561440168;
	Thu, 16 May 2024 19:26:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A39351BF2EF
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 19:26:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CB4B415CE
 for <buildroot@lists.busybox.net>; Thu, 16 May 2024 19:26:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X65sjHXOsGXP for <buildroot@lists.busybox.net>;
 Thu, 16 May 2024 19:26:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=209.85.218.44;
 helo=mail-ej1-f44.google.com; envelope-from=th.huth@gmail.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D3E6A4156C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3E6A4156C
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D3E6A4156C
 for <buildroot@buildroot.org>; Thu, 16 May 2024 19:26:02 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a59b178b75bso299679166b.0
 for <buildroot@buildroot.org>; Thu, 16 May 2024 12:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715887561; x=1716492361;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bb09NxBsoL4M0mQH788lvgUl5zR+74mnETIa+WWssns=;
 b=CwbkDEc3LR9M3TVCQ+55hHDQRekew4kFdiT5n0033HqZ13EAqlS2Rr56c39Mf24wu0
 xalOsF8P1WD9mz6lLM2YunHULfprkwVIe3tfeDMmL882d2VBNRWIobdGKgULWCJF/g4/
 FK2mMkXtfBhryvd1c2yvdGkzaTMMvI4uiyBaZasOu/v3uE7SLybjh9quYPv8Zk1myNMv
 vWpZJV4vIjLjGY4cFsSpPHe2ARVI/wC2mfLd9q6j8fJlziaoc/kLW6S97N3CdaXtwdCf
 WM0PQL0czL7+PtGo54p857xyBGZESanWwfIpjth2In0a6Ik4TvfeJER3tqcgvzDAOqo3
 pISA==
X-Gm-Message-State: AOJu0YzdVyn9U1jIIqB6TFWYnY8F4IVxIzPfkOzTUwY2I76AccenOMbm
 5qv3gEEBJa6ffx6KjylFi3BRjPaTIa0Qs9Tr5lX/tSmjVg6tEFwx
X-Google-Smtp-Source: AGHT+IGQ0IfSKahpbvytv78eqIiBJLnSu6x9KDNkKhh9whfl00ggIfTDg6hyGYpJtEA1xOj/pVSKPQ==
X-Received: by 2002:a17:907:d25:b0:a5a:2aed:ca2b with SMTP id
 a640c23a62f3a-a5a2d5c9fdcmr1707772666b.28.1715887560576; 
 Thu, 16 May 2024 12:26:00 -0700 (PDT)
Received: from fedora (ip-109-43-178-233.web.vodafone.de. [109.43.178.233])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a69148b97sm558120666b.114.2024.05.16.12.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 May 2024 12:26:00 -0700 (PDT)
Date: Thu, 16 May 2024 21:25:58 +0200
From: Thomas Huth <huth@tuxfamily.org>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240516212558.035e6aed@fedora>
In-Reply-To: <20240516163245.641115-1-fontaine.fabrice@gmail.com>
References: <20240516163245.641115-1-fontaine.fabrice@gmail.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=tuxfamily.org
Subject: Re: [Buildroot] [PATCH 1/1] package/frotz: fix build with gcc 14
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

Am Thu, 16 May 2024 18:32:45 +0200
schrieb Fabrice Fontaine <fontaine.fabrice@gmail.com>:

> Drop -std=c99 from CFLAGS to avoid the following build failure with gcc
> 14:
> 
> fastmem.c: In function 'z_restore':
> fastmem.c:842:36: error: implicit declaration of function 'strdup'; did you mean 'strcmp'? [-Wimplicit-function-declaration]
>   842 |                 f_setup.aux_name = strdup(default_name);
>       |                                    ^~~~~~
>       |                                    strcmp

I'm pretty sure there was originally was a reason for using -std=c99 here
... could we maybe use -std=gnu99 instead of removing it?

 Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
