Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8CDC6FD1F
	for <buildroot@archiver.kernel.org>; Tue,  2 Apr 2024 22:55:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 221EB406FC;
	Tue,  2 Apr 2024 22:55:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tynHNv2z8oFD; Tue,  2 Apr 2024 22:55:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8E8B408DE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8E8B408DE;
	Tue,  2 Apr 2024 22:55:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D7DE1BF5DE
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 22:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDDD3408DE
 for <buildroot@lists.busybox.net>; Tue,  2 Apr 2024 22:54:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V6iRmnpznp_6 for <buildroot@lists.busybox.net>;
 Tue,  2 Apr 2024 22:54:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com;
 envelope-from=bleemayer@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4CE22406FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CE22406FC
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4CE22406FC
 for <buildroot@buildroot.org>; Tue,  2 Apr 2024 22:54:56 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1def3340682so49895165ad.1
 for <buildroot@buildroot.org>; Tue, 02 Apr 2024 15:54:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712098496; x=1712703296;
 h=to:in-reply-to:references:message-id:date:subject:mime-version:from
 :content-transfer-encoding:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1VWY6EWkkeZgqbvpsgcb+uXXHJ9HAgKSYDI1MS2MDr8=;
 b=mHe1LSGUBsjW7Al6aoyvGlu4RDh2WX9Gm9xt2e8SxyrYuyoudjcOahNCW2Hfbg0Nmi
 /AAt03ZU9FiWAPMXDqN4SDY1Euy0bh6LBczppYmSPK0sKmHJpF9LYo/pOWGja1NkIJD/
 99aan8COsA3CvzoDsaJz7qc7J3/TwdhryqaACG4KnH5XgBosr/SbM0WzAUm8ymwKnz6t
 MNwzPhVULg0+aW1N6sKi3B0yomgkTUM4pa+0Wc7QRkKfMxE9tKQeo1EGs8lVgQp3KyAd
 vIDPMV50TUKf/BHDIxP/+iXDZrzY9dLjJsKN9gcmRRY7tT1TmpefDMcPW+f+tt1OVJd9
 jX8g==
X-Gm-Message-State: AOJu0YwxoV4moWourIOndNXtWAmQwNkQoi4boNZ41WLYon7/8a8702DH
 tX9vgG8uF/LySteQrpPNkC0gDkPsuijiHXxwFdZDS5QEv3nhxqydA0+zxnjr
X-Google-Smtp-Source: AGHT+IEfJHs2eHaVEdw+WZen9kEu8GceAYMkuc71wq5E1eDqJgmo+IH4lJjkBwlnJpYaOAsgEjsrLw==
X-Received: by 2002:a17:902:e543:b0:1e0:e8b7:1fa2 with SMTP id
 n3-20020a170902e54300b001e0e8b71fa2mr18340390plf.21.1712098495853; 
 Tue, 02 Apr 2024 15:54:55 -0700 (PDT)
Received: from smtpclient.apple ([2804:38a:a32e:ea31:91f6:bea6:3c82:51b7])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a170902e99300b001e27c7ecd24sm1828492plb.283.2024.04.02.15.54.54
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Apr 2024 15:54:55 -0700 (PDT)
From: Brian Mayer <bleemayer@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Tue, 2 Apr 2024 19:54:53 -0300
Message-Id: <429BA1D7-0EF2-4E96-99B6-1C1BE9F68BB5@gmail.com>
References: <CAB3eKoDnuOTufkdsMMA2CWnq4=Z=CbZKo+qY-ULPw_houqU_CQ@mail.gmail.com>
In-Reply-To: <CAB3eKoDnuOTufkdsMMA2CWnq4=Z=CbZKo+qY-ULPw_houqU_CQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailer: iPhone Mail (19H384)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712098496; x=1712703296; darn=buildroot.org;
 h=to:in-reply-to:references:message-id:date:subject:mime-version:from
 :content-transfer-encoding:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1VWY6EWkkeZgqbvpsgcb+uXXHJ9HAgKSYDI1MS2MDr8=;
 b=f/BcEmFyb21V7Hl1O2nBKqWbA8mjp3IFpPEVmBeavQj3ipAtG5dlLbY/SfkIg5hSEd
 RPYvKniC2lTYIMWtxPFZEppWXtYyeWhTykdQ070bVG2RYQS1qVKlvMgryKBo/ydvO1/d
 ++sLWGd6B2MUmH86Khz2+WaQnnH/RRnIDxnkZPflZvz6pacfHhY7dD948Gkp9EwLwAdQ
 qfgUjME8EsSOft/xQBk57+bULYQ3B9umHAq9XjhWv57xJM3f/C5WhLgf4ZIYZPgIFud/
 UB1WJ3Q77WZRKhrPZTvtEOGsFRL29ICZkT0zbtjjQwIVKVhfE4kUYFZKqiLz3LzesE99
 52Xw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=f/BcEmFy
Subject: Re: [Buildroot] [PATCH v2] package/sbase: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

My email from brian@myr.sh is being graylisted. So I'm not being able to contribute. Can someone help me debug this? There is no detailed response from your server.

Thanks
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
