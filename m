Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82886CD4F24
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 19:54:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DC6640304;
	Wed,  4 Sep 2024 19:54:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hkcOJOVXtcqU; Wed,  4 Sep 2024 19:54:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 028BD40345
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 028BD40345;
	Wed,  4 Sep 2024 19:54:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DDE381BF3C4
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 19:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA90640227
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 19:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TbPT7bdpYWTQ for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 19:54:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=mattianarducci1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6122B400C8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6122B400C8
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6122B400C8
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 19:54:41 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5bf01bdaff0so6851848a12.3
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 12:54:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725479679; x=1726084479;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=drbu5HllpkM2MB1OssL5EHKlDGNK4g84DNvMALa2oR8=;
 b=aS1+LVb7Z9bOdpVmVJ3q9xlL7f2pN1YzmequcZN73GDUfvfNT8MyoEEQfOiWxt4aAf
 /icwYcjspcRQPFgHiBqXpjBIK+2gdbBunVJiQr5IiESvx2oCPE9WgGUnnPWtZHKXV7sY
 3Fs4CzME+yldodafmZihvWE83EycYuzECSESzINuEvcXpwyQ9rBcUZ0+qzBJCJeWZKim
 S0W6vQjWxhDxUoQ5btycqAqHzHFhZ3XGdWa8IBatopt1oh/tcAdEJBspXlcsjd7/Ds5I
 yPwQpXW2IgyQv0z6MLDBI42NfM/dcGVEFVbgu2Dzd1985b4vWIhRGg63GKzjUOoHz4Si
 6UQg==
X-Gm-Message-State: AOJu0YwFyvOplY1tyNrvtzvr24xln9tEdOkiP2HdoSj1bkMRCdW6+o5P
 YtMxFXtOVDRZ6LELWNbGYMPM5Qkiv7dRGAw+rud+pSlbaflSEA1zBGg0sQ==
X-Google-Smtp-Source: AGHT+IFjY4IY/tf+5Jqc6LMBRUFlgEcqSRpXCBDk5tJImaO7xh2dzI+Bs7DioeKg12q4MB3vpoK0bQ==
X-Received: by 2002:a17:907:3ea6:b0:a86:95ff:f3a0 with SMTP id
 a640c23a62f3a-a897f77ef10mr1756469566b.3.1725479678749; 
 Wed, 04 Sep 2024 12:54:38 -0700 (PDT)
Received: from localhost ([78.208.12.227]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8a62038c16sm31146966b.49.2024.09.04.12.54.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 12:54:38 -0700 (PDT)
From: Mattia Narducci <mattianarducci1@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 04 Sep 2024 21:54:37 +0200
Message-ID: <4949491.31r3eYUQgx@localhost>
In-Reply-To: <20240903215308.27bb1d2c@windsurf>
References: <1913421.tdWV9SEqCh@localhost> <20240903215308.27bb1d2c@windsurf>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725479679; x=1726084479; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=drbu5HllpkM2MB1OssL5EHKlDGNK4g84DNvMALa2oR8=;
 b=l58SZKKUfT4fJu/oQX3disk4Oc7U5ocX23zHTTWWTTxy8fSZlzU1qISGJTek5udN4q
 Oskpo7HSqFWnXpXnSxVTk1FCJT1FlImzSIu05pzk2i8lcVeFLqZzrUjFmp2DTaVJ+rBX
 bjQiB624hBorfSE0QD0eG38sqIWhLXNW5j7POENS1rOuaoQ6UJU1vzbgRRQSFhOLgjVP
 +2hrq+TCQcFd2D4I6xrC/LBibHfZJVSzVXLBpp+ayUKhI6ArNg8ToN/FdcmaUO5svmoK
 brjvXQLlhO+7/f1akyOg8K8hhFeKLEGk8d+z+WS/7QYVwyWsp+eshH616zV6qXrw6Co6
 2/nw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=l58SZKKU
Subject: Re: [Buildroot] [PATCH 1/3] configs/pine64: bump U-Boot version to
 2024.07
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 03 Sep 2024 21:53:08 CEST Thomas Petazzoni wrote:
> On Sun, 01 Sep 2024 18:42:58 +0200
> Mattia Narducci <mattianarducci1@gmail.com> wrote:
> >  	partition u-boot {
> >  		in-partition-table = "no"
> > -		image = "u-boot.itb"
> > -		offset = 40K
> > -		size = 1M # 1MB - 40KB
> > +		image = "u-boot-sunxi-with-spl.bin"
> > +		offset = 8K
> > +		size = 1016K # 1MB - 8KB
> 
> Here this "size" field is a bit silly. We don't really care that the
> size is 1016KB. What we care is that the offset is 8 KB, and that the
> next partition is aligned on a good boundary.
> 
> So could you test something like:
> 
>   https://patchwork.ozlabs.org/project/buildroot/patch/tencent_92439641515553684D208B3331676FB36C05@qq.com/
> 
> instead?

Sure! I have seen this approach used for other boards and thought it
was fine, but the offset is definitely clearer.

-- 
Mattia


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
