Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACF8C3DA4A
	for <buildroot@archiver.kernel.org>; Thu, 22 Aug 2024 20:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4338805B5;
	Thu, 22 Aug 2024 20:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L__q8gRkUYnV; Thu, 22 Aug 2024 20:14:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BADEE80868
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BADEE80868;
	Thu, 22 Aug 2024 20:14:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9DB221BF59F
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 20:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9800960612
 for <buildroot@lists.busybox.net>; Thu, 22 Aug 2024 20:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dTHFyxLyfeku for <buildroot@lists.busybox.net>;
 Thu, 22 Aug 2024 20:14:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::633; helo=mail-ej1-x633.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BA79B6060C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA79B6060C
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BA79B6060C
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 20:14:37 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a8666734767so159434366b.1
 for <buildroot@buildroot.org>; Thu, 22 Aug 2024 13:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724357676; x=1724962476;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GNqJl/GosC5WJ7vxeb46DJp69Moo6nu1KMyLHXjz8t0=;
 b=HBIo6TXZuya3J+RcMv1yKtKurvoUdAzBDtqatitjAk4wr8E4O8yY+Rezn24wXjWmen
 jdIMNur56wgW9eyZHyyIkVK0DgUkN+KdBOH/ZI3RTUCLKISD3vSiqLyUSB711G+pJio1
 bMEHLh3mGGxWjUmkUdONTzuMLxiEIn8kBjrydSluwpodTu8bYv5Q63avSOIH+Rn3yxkz
 CG7G7fWh2veNzdUyf4eq860z78EP595C7ZkREeBsWHe7SxEi0kGTHIlXiXhXJqsXhtDA
 MzYk/z7w5/PoQnDSC05cfsuTxHdV37DT7EY7cJ+DzAuxs2OBclBqI7l4i2s1D3B/xX8T
 5QCg==
X-Gm-Message-State: AOJu0YzDii04LmBlXb7Xgk0ghnFtJq2n9JndwdPu3Al3XKtXGuiSERIt
 5DQ2TzWwDhcjKafE1Soz4H2n2eQjY3YlOajrPseORY4zILRsd3ZE
X-Google-Smtp-Source: AGHT+IHpzW4ybYYOe6KGToOojqZD7eF2NbBwWTlL+snGKuA3sakXpWe0wFQJftH8ZfAZuCa1wgmfOg==
X-Received: by 2002:a17:907:3e1a:b0:a86:93fe:7a94 with SMTP id
 a640c23a62f3a-a8693fe7b5amr262161566b.47.1724357675242; 
 Thu, 22 Aug 2024 13:14:35 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a868f29a4c7sm159863766b.65.2024.08.22.13.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Aug 2024 13:14:34 -0700 (PDT)
Date: Thu, 22 Aug 2024 22:14:32 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20240822201432.GD1160317@pevik>
References: <20240822182050.65230-1-bernd@kuhls.net>
 <20240822182050.65230-3-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240822182050.65230-3-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724357676; x=1724962476; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GNqJl/GosC5WJ7vxeb46DJp69Moo6nu1KMyLHXjz8t0=;
 b=P3ZcMadYmpx+2BEnKVq8vJawCfg/JxVASImOd2DPwq2eepdopGPSYNFqVlxWLmRTpS
 jZMB+89XojBpeH/xpm/L8FOfXPBqFquATcqzkluEPAtUCcB8E0vxsgOYPtQrhg2VnA9d
 Myagdh4pYr0JSfPGF6o6paHNFWaG06Yf8xwAN0mvGHYWE/PZEc0ILQq1Ze3D9DpfErRM
 YMAeD4J7mkK7/6YLlDv8kUdHAW9vX0lwu6EA28s/LAaD779NOHQFaEil8EuaS8kWVNpq
 ompfIn86L1jjzWcZBhOXu9uUcIIcfRl428lqRt79hUEvwr10UGcxa0061Dcxlz6VBfwv
 +UaQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=P3ZcMadY
Subject: Re: [Buildroot] [PATCH/next 03/13] package/libheif: bump version to
 1.18.2
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
