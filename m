Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF6DC3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 20:12:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B61A80B32;
	Thu, 22 Aug 2024 20:12:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OREzWp_JZzGd; Thu, 22 Aug 2024 20:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F93F80B89
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F93F80B89;
	Thu, 22 Aug 2024 20:12:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2E0A81BF59F
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 20:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AEA94052B
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 20:12:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id teHkRZJ3OOXk for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 20:12:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::233; helo=mail-lj1-x233.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3233B4049F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3233B4049F
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3233B4049F
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 20:12:33 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ef2d96164aso11234261fa.3
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 13:12:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724357551; x=1724962351;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GNqJl/GosC5WJ7vxeb46DJp69Moo6nu1KMyLHXjz8t0=;
 b=VWr8wrC2nk58wkPKONbq0SiAAqjWbRzNW2WVktLjsJ+RqCN57ZFc0Skzs468pqB2B/
 0p5EO+Q2f85Kemqgkjz6TBP3op4iM7XLvRX1mSwDIvUrta3y1u/iAinLxDUPHOScuTS3
 LU8CRiN1YWFJ17/5DqBv7Nrx1e5LCVRH6S1hpO7/8pPa4ystR8NyD2udLybmaUjLjCdG
 xLou0+MyIjY1WLWpOk7aOWkbQcdb0HuXUHbocvSXNpF0z0ZCKyCVFLrZTXunTit6L5Uk
 vHVxKknNzKZf0PLdPN+cMoPJbDrnR+t80xEiVWBR9TlxVkwh5in+gYIOItQa0i3NVpqS
 w49Q==
X-Gm-Message-State: AOJu0YzHT2hu69FvuHOcY0ObRL2OT0nB8mvS8xFXaO2bTFOmbovnMdtG
 7MAwU7Glu1Z5z6FgoyELFZq6kEyfiJUyAXK29chZf9jGU+g6LSqw
X-Google-Smtp-Source: AGHT+IG3vhLdapPEZbpxaFvQxk+a4Oqg1QsoD66gAmgDBVI4kXXWRUDarL1g/tg5CDkgxMoUn2i6IQ==
X-Received: by 2002:a2e:a98d:0:b0:2ef:2fc9:c8b2 with SMTP id
 38308e7fff4ca-2f4f49453dfmr1021581fa.37.1724357550175; 
 Thu, 22 Aug 2024 13:12:30 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c0515a9415sm1255717a12.85.2024.08.22.13.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 13:12:29 -0700 (PDT)
Date: Thu, 22 Aug 2024 22:12:27 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240822201227.GC1160317@pevik>
References: <20240822182050.65230-1-bernd@kuhls.net>
 <20240822182050.65230-2-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822182050.65230-2-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724357551; x=1724962351; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GNqJl/GosC5WJ7vxeb46DJp69Moo6nu1KMyLHXjz8t0=;
 b=Onw7o4ZBl4aWI0PSjIUgT4r/FS/mF6YDdBApsszrgWa/YqBNiH3rPa7BaqkNQYT1lw
 +koboVqVkZj/xSXIN0FkYBtIF4FQKMP3OSgEfEAc6XbQFlpejwNVkuJ7e68tEbR+Yf3b
 jtB5MJZGlp2QMm65Mmvc7wvliSnW93ea8+dn2VGJmnFFuZdhGiVLMRGDuzY69diwVpLs
 CHWlKt5OkCOYygo4phz1VxMGYMlnGcB00IuI2yM7S2rynOZXtIGtV60ZkClrQR9T42CR
 19/EBwyla77iTdZXFWIX3glVTEPh/xfDYIMv3DPfn11k7lpiy7ljRMbEbbZcfsq3wvEK
 PBtQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Onw7o4ZB
Subject: Re: [Buildroot] [PATCH/next 02/13] package/hwdata: bump version to
 0.385
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
