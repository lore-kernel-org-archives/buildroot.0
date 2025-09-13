Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE754CAC587
	for <buildroot@archiver.kernel.org>; Sat, 13 Sep 2025 13:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DD7561697;
	Sat, 13 Sep 2025 13:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FY_12ApReG25; Sat, 13 Sep 2025 13:08:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C7A06162A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C7A06162A;
	Sat, 13 Sep 2025 13:08:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D508B25B
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 13:08:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2963843D9
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 13:08:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sCkZrZeRD2MF for <buildroot@buildroot.org>;
 Sat, 13 Sep 2025 13:08:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ECD6E8420D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECD6E8420D
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECD6E8420D
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 13:08:25 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3df15fdf0caso2225301f8f.0
 for <buildroot@buildroot.org>; Sat, 13 Sep 2025 06:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757768904; x=1758373704;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TfR4FlNp6V9SEtJAgsDGF9gTdssBhEWsWGILJB/GVe8=;
 b=gUTRchjEo66OCZ0AoiIJWXOQQdPbFcDWiFWCTOG8rXgLi0+4HxV5Mz5kOIU/TUulsS
 42dMINhdXRQRFmTi6aH97MFp6Z5BbcYgjBNm+M7kMKgKIAQ111uMd8+tx4Pr770OHzWN
 WLvLIF6+XFAYd0kwxpgL7e6azjg9eYPyqKiTKGJVVDpNL/ds7QcHFG9Xplx0zMhmAL2T
 GZEfVsCH+tA3bNFabXYAWQxIZoIhwFAO41w8pxVNDaGKw3BAqdMREVzXOm9gg9D06awP
 AnTvFohg4kN8lcpmXjNiyPTqidFbNsztMazVkYa18tn9hwPq/lAlwTdcGzboyY4fCjHj
 eDzA==
X-Gm-Message-State: AOJu0YwYRdURwitCQwBorn5gxuiLEwUf1qYJ3Xr0xSIJOdLvf3Ppc47l
 ksD7z32uXvct1l4/0iBQeQMdE4IeEnYeOmDxBEyx/G89Ieq77k+Te9hpOuIrJOU8
X-Gm-Gg: ASbGnctjRY7fs6v5zclZkLaeqIPuYkGwJxl/OPLSdq9SWllt+O7swPjh17joHjjJA6g
 Cd/cMuEKFaXoRGMkm9iTZSBE3ZgMrzlt+q1mqfu0pCTP/gq/oKmTqLL2MJkqarnV7EP21BXEVGW
 u3UmOpmWlieuw9dC1tJpU3ozwv2y3qAvD+py60BT9GTUUU+6YH9AxzWOiK8Xl5pb6uQarOBc5Nu
 h0UwMyS/GIBHqFmZDiYaNQ5ocKPQP0Dziw46b5ACy20KaW5EF+cBwAhmYghY6iynUAcW96T09Lq
 vMI69W3JdZAXXS+gVXE8kjRelytmIf3uggPX62ZsJQ04B7XTGjz/j2a4XFi/+Y8zWwh8de0zks+
 hUZyCkLj8k/GTWOhE5zfGFvEw3ms=
X-Google-Smtp-Source: AGHT+IHEKQ07I3cx6xkroKCJRkb1KXDnS8ZoPky5Z5GoCHJIG8dW+Yj/kKxxNHzR5PaZ0P1KBDmI6A==
X-Received: by 2002:a5d:64c6:0:b0:3e7:5edd:cde1 with SMTP id
 ffacd0b85a97d-3e765a17302mr5073369f8f.61.1757768903431; 
 Sat, 13 Sep 2025 06:08:23 -0700 (PDT)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45edd9f75d1sm77287045e9.17.2025.09.13.06.08.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Sep 2025 06:08:22 -0700 (PDT)
Date: Sat, 13 Sep 2025 15:08:20 +0200
From: Petr Vorel <petr.vorel@gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
Message-ID: <20250913130820.GA107962@pevik>
References: <20250912212302.1057923-1-giulio.benetti@benettiengineering.com>
 <20250912212302.1057923-2-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250912212302.1057923-2-giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1757768904; x=1758373704; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TfR4FlNp6V9SEtJAgsDGF9gTdssBhEWsWGILJB/GVe8=;
 b=UrPKPLutOx083/B3SIxNuTkKrEyi2w8FBrCvRZ6Sy+yylyhJzuEJdSrptJYHODGOew
 0kdsLQ4ZiYym4E/hZlJnHgiIWX+LPhqVlNOhWPUYzScCGzZzQX7IdwEcuCPCkst6zChH
 9TcAYSOIvYCBB6z0NJCyrmmeFDwWlFxxSVgoIO9onyHXiLj1Q1vAa987VmzOsGFXbPo7
 7mCVoJj3UFtgdYOcLfWnQSqvQdGMU6TK5x/ZqLMw6bZAqnn+j/uhHeNYb93fBdzPjWq9
 rucsjKTUTViXhydkFoUcKGnwIQNPts6hU9u00FaP2fPwxm44N8FaSsag2hfRtQtR019O
 ch0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=UrPKPLut
Subject: Re: [Buildroot] [PATCH] package/nfs-utils: bump version to 2.8.4
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Giulio,

> Release announce:
> https://lore.kernel.org/linux-nfs/6f271c01-cd4b-456b-80ac-77a96b99a1fe@redhat.com/

Thanks!

Reviewed-by: Petr Vorel <petr.vorel@gmail.com>

Kind regards,
Petr
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
