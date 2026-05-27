Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D499CD5BD0
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 21:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C275A42472;
	Wed, 27 May 2026 21:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id luPCjueUuQEW; Wed, 27 May 2026 21:38:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E39F842473
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779917894;
	bh=hqXTCT66YAfCKaQa5DPsd1YqEYV1yXVLyzEN7S2lEtY=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Reply-To:Cc:From;
	b=aSVjCxcLeuM91LVZ2RtRtZ+L+I/vR+raiwnAWgOcRXy39V+DRJB/jB2OpqaArH74x
	 oCKuamjKPE7qenHGRCWa4JTSmdSlCqk2sfLAgNBXUpsxZeOqaw0A809DrwSAbrh1u2
	 fPVq8Joxs+OzYDiwT9ZOgjm3pv6uhp3H/f7fqyyF8P1bn2HWfHmOyzxWdqQzrDsi70
	 ddcxx3H63PqlK197Y4LQOPMyhEf8uYK55O5uvRypW25WQ1HmlnmXqSE9LP0MR2oW+u
	 BP1YRV2cc9KFxVSFwRbj36dKhW2ogNIiPhsCDiphBMyF7KreR+5ClG82/Q4QGfDkbV
	 XY7IkhIlW3DgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E39F842473;
	Wed, 27 May 2026 21:38:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id AB53928A
 for <buildroot@buildroot.org>; Wed, 27 May 2026 21:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C14E84653
 for <buildroot@buildroot.org>; Wed, 27 May 2026 21:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xwBLzSXs8WTj for <buildroot@buildroot.org>;
 Wed, 27 May 2026 21:38:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 77FBD84652
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77FBD84652
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77FBD84652
 for <buildroot@buildroot.org>; Wed, 27 May 2026 21:38:11 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-bd4d7f4fa02so2056904366b.3
 for <buildroot@buildroot.org>; Wed, 27 May 2026 14:38:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779917889; x=1780522689;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=D6WvnGDbVevsJcoBptw2PR8ytmBr0uSSEyF0Jm6CUrI=;
 b=rAo7USaIgcYIkJjc4UTDXbf21mwzIPscRmCcNisseWbqmlfHJlqlSRa83GsN/tLhMe
 s2uTBZgbw10pQaLQJjdrYebO/fHtaBY1O6DA7xkvCojYTbMF4vaibyjkhYW55Gg7Prab
 oQzk2AKfdWQ33HWFYwk1G8LmXcSFiWUgT97EMEuPhbor7XsfptMZK7UZQYDBUDKfUICn
 Jk3onjlDOK/OW10ZPKAvpEBMYZkWMJSNALEkwJRJjSArnXAT6U8g+k1IKNFVY6TvaDMa
 L4O1FN9iiD3+UJvnCWJ6zo8udHDRHePru469M2FZO+FFRewz+oWZlyaDh4ElHkwOQB9g
 tSDg==
X-Gm-Message-State: AOJu0YxMvL+WmaLRJXPhQrrWh6OXyeg8AeySEwne9hOPbIOv1wua01OA
 TvW2uzbGfkStZFDW8gHuQpVTQgYSdpmliOUWBi2fL7jXmWYKAschHUMChpeb72ks
X-Gm-Gg: Acq92OHr3kbzfD5dRmybSNYOmBjLNO43rhLJtuwFeGb2I6ZrGqFF5i4RyggZQNSkCMN
 JZL03D4rGc17n+iX6I60KSct/GFrut6+NQFmeqQKQisGW/jY9/IchoYIqDw9cQ+x2cotSWnKWtr
 pyNQPuhct38/RNJPEY/SYUxcjeZeabCk1JtYbg/Dv+l1XSaxXOOz+Y0s40mqdSvKKrCnKiiBZG6
 y5KnMluNoFQlt+6SmEpzIpnPE9bmvNujEkq4M3mMzjLRvIMI9JcgVBjltQRzj2rtgphEtKML9st
 KaRvFPwqguMbv72p3pE8fWzsbLzBsIUxRV7qnJBzCLFJSLUP2Va0HyD1mOOIsCGdxUsfZhvp14M
 xNXoOHNk2yj0CyoNkOR7XJfKHaDxI0tQ2ExNOrtDDYNpk6uTytBJl0/w7p7oMPm+sna992Ef9KX
 sqfuorqtzyBC2ui5PZLZdodtZXQXh7W+iqJdJeLXvlvQWf/1puywTw4QRVOr2AmJMTTF8Ixs35+
 KA9qEdOmf1/XNH8
X-Received: by 2002:a17:906:8a4f:b0:bd9:1f8:cd74 with SMTP id
 a640c23a62f3a-bdd23cfd9a6mr1111400666b.8.1779917888898; 
 Wed, 27 May 2026 14:38:08 -0700 (PDT)
Received: from pevik (94-40-87-20.alarmadi.pl. [94.40.87.20])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-bddc30528a7sm650605866b.21.2026.05.27.14.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 14:38:08 -0700 (PDT)
Date: Wed, 27 May 2026 23:38:05 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20260527213805.GA271095@pevik>
References: <20260527194041.2109092-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260527194041.2109092-1-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779917889; x=1780522689; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=D6WvnGDbVevsJcoBptw2PR8ytmBr0uSSEyF0Jm6CUrI=;
 b=H9OUezfeo3zzO/xmoewa4p4Et+b3Vqn/BzG4Bldr3ihsJqw0H7JX8SU6M1StxEEb3U
 lvPjB2NqxO9T8/prO1QaNkVTzROP1R/DmSSjaDpNtCr4AfKPD48aVLb3E1AJ1/2LD7t5
 drT9z8We7BR3fynnU+nA7ScNQQRMdlLtAfQwUuGd9z3xVpzWRw2ziew/uLS0mRHrzXYv
 sVLUqQopQmdDm1dO45h5Hv5VW8iUAOjOmMon640U/V2WBA238q0yWmTPYLieXdGFhCEA
 BsresvZR4MzAaADmZyoCu0FntGYnZ+n0YJY8roskTUEFSJzOoD1c7ww8lW3u4jwkvN4v
 xznQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=H9OUezfe
Subject: Re: [Buildroot] [PATCH] package/rpcbind: bump version to 1.2.9
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio, all,

[ Cc Arnout ]

> Changelog:
> https://sourceforge.net/projects/rpcbind/files/rpcbind/1.2.9/1.2.9-ChangeLog/download

Thanks!
Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

@Arnout IMHO worth to backport due memory leak fixes.

Kind regards,
Petr

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/rpcbind/rpcbind.hash | 6 +++---
>  package/rpcbind/rpcbind.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/rpcbind/rpcbind.hash b/package/rpcbind/rpcbind.hash
> index e268a0733a..3059751050 100644
> --- a/package/rpcbind/rpcbind.hash
> +++ b/package/rpcbind/rpcbind.hash
> @@ -1,6 +1,6 @@
> -# From https://sourceforge.net/projects/rpcbind/files/rpcbind/1.2.8/
> -sha1  2f733aba26075ca91fda3787890232da3d07c06e  rpcbind-1.2.8.tar.bz2
> +# From https://sourceforge.net/projects/rpcbind/files/rpcbind/1.2.9/
> +sha1  111058e312e0634f8bd23a783ea4f99912ced085  rpcbind-1.2.9.tar.bz2
>  
>  # Locally computed:
> -sha256  964132c389918e8964d7334936b6dd10ef025b300c6b29e693ba0f29550e3de5  rpcbind-1.2.8.tar.bz2
> +sha256  ce5f1a87c566ef0b2897a28f50a75c1dc23fec413a46a7f4183423b6b6aa991b  rpcbind-1.2.9.tar.bz2
>  sha256  2b9477d2f4ab277b29702958f0058546edc120aae4b5fb8b8d1a9652104e1ba3  COPYING
> diff --git a/package/rpcbind/rpcbind.mk b/package/rpcbind/rpcbind.mk
> index 3b496ee2c6..96025624ff 100644
> --- a/package/rpcbind/rpcbind.mk
> +++ b/package/rpcbind/rpcbind.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -RPCBIND_VERSION = 1.2.8
> +RPCBIND_VERSION = 1.2.9
>  RPCBIND_SITE = https://downloads.sourceforge.net/project/rpcbind/rpcbind/$(RPCBIND_VERSION)
>  RPCBIND_SOURCE = rpcbind-$(RPCBIND_VERSION).tar.bz2
>  RPCBIND_LICENSE = BSD-3-Clause
> -- 
> 2.47.3
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
