Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A8C2C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 20:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EDB5D80B32;
	Thu, 22 Aug 2024 20:11:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Otec4wFIJ2On; Thu, 22 Aug 2024 20:11:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07FE580B89
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07FE580B89;
	Thu, 22 Aug 2024 20:11:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F2EA01BF59F
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 20:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC9FA40E8D
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 20:11:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y5n-46hh7PJ9 for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 20:11:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F0F7540153
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0F7540153
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0F7540153
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 20:11:35 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a866cea40c4so156230266b.0
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 13:11:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724357493; x=1724962293;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GNqJl/GosC5WJ7vxeb46DJp69Moo6nu1KMyLHXjz8t0=;
 b=N/N0MoAKyes7iUEVlfH8GKcyxGOWJ7plj5al6bH1hu6E4vZiCNfK10B5gGd3I9HyAD
 xmrXRLOAAmnk7qTitGQO835oi1xTJE+WjToHtqrYlD3OnwzHto/2yOWhOHK3TYxI7VGi
 kLWq9RU9kiqv2NaZmn6bRcXDZN7p8RUfetJoQ8Xz11gTLdxPEEmxZh8cnCGcyOIZ2HIH
 HmyKP2oxXMMOiz6zK/XjpVEMmO+Y5Zn9f4tWl/E4gaqzKwsO66d/+c4z67CUZzq6r6dH
 9+vXOfXvuanZnp3YpgFNdKUZpK+9m1QHb5CJhmNWGv4aqaxwA2Ym1cOSAsGnOMSV90JX
 FtrQ==
X-Gm-Message-State: AOJu0YwE8duzvPwdKKdpsYdC8YbP6FeqSinJxu0oVfWZT6myoK3RKBBd
 rYABv2Ng1AWyF99yYIvopB3syitDoo3A3PR1Zjhulz4rxSOChGPs
X-Google-Smtp-Source: AGHT+IEl1tLLDPMiuwuex2hkj9VOMi7oVbS7z9N27zMzKVmB/LQW7RbptbSv7eIL1Hk5bs37Js5zDw==
X-Received: by 2002:a17:907:7f9e:b0:a86:73cb:35a3 with SMTP id
 a640c23a62f3a-a8673cb3605mr608220066b.64.1724357492917; 
 Thu, 22 Aug 2024 13:11:32 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f2e768esm160590166b.93.2024.08.22.13.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 13:11:32 -0700 (PDT)
Date: Thu, 22 Aug 2024 22:11:30 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240822201130.GB1160317@pevik>
References: <20240822182050.65230-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822182050.65230-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724357493; x=1724962293; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GNqJl/GosC5WJ7vxeb46DJp69Moo6nu1KMyLHXjz8t0=;
 b=d4YbM/AfkNBaaIpFPUj1Yf6NoeIP/qzijKkPGsK01LmL/RM6Cw9G3tkpI0P4jcp/Ai
 u6PIU2pUH4q7/fSzKDwFZiBxuNddyRRrCPtqmHcSAj27CirnByjkjabW4E+Hgy+rxPi5
 AJ3ESXeZYJFsc2ZonrgIYjVRUpeA//bX5JQdHiD9ZorYiQSKyL4MLq/CJH81xSo7PpWA
 z6LPiYr9DDsr5KT5rG73KaKMKIE+LmhjmVJppmLrxawXVS6y1B71tkBzi8LFwwoALYLi
 lIg+1JcM61wV2zrs9YB4rIzhJsRvCSauX+CUoqK1qacehitRdLNh2X9/bWci7jsN5oPK
 alcw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=d4YbM/Af
Subject: Re: [Buildroot] [PATCH/next 01/13] package/exfatprogs: bump version
 to 1.2.5
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
Reply-To: Petr Vorel <petr.vorel@gmail.com>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Marcin Bis <marcin@bis.org.pl>,
 Grzegorz Blach <grzegorz@blach.pl>, Asaf Kahlon <asafka7@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Louis-Paul Cordier <lpdev@cordier.org>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
