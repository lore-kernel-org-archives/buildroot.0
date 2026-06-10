Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12B0CD8CB9
	for <buildroot@archiver.kernel.org>; Wed, 10 Jun 2026 08:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 889C460858;
	Wed, 10 Jun 2026 08:48:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ci6q1A_iQF7Z; Wed, 10 Jun 2026 08:48:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7670460857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781081296;
	bh=ZLhyoXjLORa+Hxr8LblNWOdcteyngNDJV1RCHL8YfSw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=jf+6Bp2uOxs0CP4eWotN4lU2uxhKV9Mz9X7BswLfLXzx9k5fQcguBhLgBzp+2S+jL
	 cBTMKLKkEz9YnkZJFzGuU0SlYDK4grAEhfnHVT4hKY6VLkf3GG8cbRJgWecLNkQtGU
	 xl89cSxZc06LcDkp2XMrNUAUteBKw/hiiBqunAqjROLKvJEfMyo68a1MKCx2KdopJz
	 zkAQGx1G86kuU/1n7124duyEL5wxuNGyHt0gvRjFkyefQwSFyhaRWBwdjb4u3HG7JW
	 wGdUbUzTcTyFJ5WC4jsNEUM4NpwhmygG7tOK2CEHGtqvlMZ+LfvtqsYxQDGuP7mfAm
	 WbPQoOOaLCydw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7670460857;
	Wed, 10 Jun 2026 08:48:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 17E82256
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 08:48:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0964081AAD
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 08:48:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ypSGE54MShM for <buildroot@buildroot.org>;
 Wed, 10 Jun 2026 08:48:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 37353818CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37353818CA
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 37353818CA
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 08:48:13 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-45ef56d9b67so5028900f8f.2
 for <buildroot@buildroot.org>; Wed, 10 Jun 2026 01:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781081292; x=1781686092;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=vM89Z24IAXspbjEsouxhkuMZpqEeHJF2WpClkbS6nC8=;
 b=HeJ4rw3GMZivdQhNDLxEXdiCZIVP7daehR1sJYGbdTiHn0BWsBvLCbCugRDKheGJeT
 TrRRenhs3OJQKJfjXyVnVNRcl35L7PVOaZARgKJrxRdnitXUj0cKRPictO8meKL6Kw5r
 Qc/YLZEbIJk/IOr5YdS3RG/vESTyU9ZIe7tAOd21KM46e4RWVxtOqCjCXusYhHGic6db
 N2hHlpdeF4r5ASUmU4N7bjhZziVzclTaBMx7uPQg6NNkuC2tVq/xy3TX1bo4F60jKOry
 TrigPnY5QCJs4d/0bLxuZ62p3uDrFdqLv09uJ5zii6nc+rbStDzg8xggpHqDJA9CTtdx
 Qj/Q==
X-Forwarded-Encrypted: i=1;
 AFNElJ+L2dN7ghq2lrh7fCbAPNFRFZao36xKvIfSzc+13MzA2Qg3iQl1NKrT1WqOulzn0UPNhmp9dBCghYI=@buildroot.org
X-Gm-Message-State: AOJu0YxveOwTynKPbC1p3ekGqKwJA+ZiiYrNnRLvzRMLPyO71sBdg69g
 Rz4u8B/u+I54cEVtGwr6tZiDBMc286NNKTeem028bx47y1NVPTLFhLIxmNQir6NoUYY=
X-Gm-Gg: Acq92OFfIKgYrpgIqoJd7hGP6lw2GGhCxd3suQ7eeT2cg9Q5K9igjmpqMuxk+7kB+St
 x2kERTiJyIQ7qfA9DdiaNGPxILoZphRDPzxzNfEEdTsNNf2gbNZlsNNrFWO4xoBcoC638wKzDZL
 HXGEhVYsWy4+h0qaJXC+MY3KW0F59ymEGNppSwUEK2hKo1PNKaDWrHoO7HBTDj1c5OOpry89n9h
 FGNihfefE0T1LzK45Gs/Ebpd2dFq1V2BMJbK6gtrizJvLJKkjQ9y0zIQFi0DDDKhpo9UykqjlKK
 XeZNMS91RavFE922QkIfkmu7pvasIUdBPwgb/guTEuTkjIA90ilESG2AGBzCBfAm/H2nOHkieaS
 Wz/TJ3fq4e6HTMceTjtPHAb4g6+DjDilq5VXvHVSNrdLDNnibA5Sx/fY5FRZnE/ZTpMdnnt3+7V
 SUJnYDTmmJioUJhHr27GZqGPlPsA==
X-Received: by 2002:adf:f54d:0:b0:45e:633e:a7cc with SMTP id
 ffacd0b85a97d-46030505f9fmr27357789f8f.24.1781081291200; 
 Wed, 10 Jun 2026 01:48:11 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4602cda3651sm58474815f8f.32.2026.06.10.01.48.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2026 01:48:10 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>, buildroot@buildroot.org,
 Bernd Kuhls <bernd@kuhls.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin@orange.com>
Date: Wed, 10 Jun 2026 10:48:10 +0200
Message-ID: <20260610084810.106594-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260608221416.919015-2-titouan.christophe@mind.be>
References: <20260608221416.919015-2-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781081292; x=1781686092; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vM89Z24IAXspbjEsouxhkuMZpqEeHJF2WpClkbS6nC8=;
 b=epZbtU/s6lu09k24BsRi5Ot6zlLI8CtFrdJ0fARTgeCTohtsZ5/1vpu722y6V3rsWY
 emfhvgaEfwJVpBAfYgBxcIke7ag2GtP3EsxxphcINH8UGVMUbGZRtTvSoR3i9PocMPXB
 9JrNcmrUJ2i3j1LDm6ZlitjrjvLel1GQse8E9XD7XKmypiiwDpsGA2DFVkffTmjJoc3n
 xtu80mak7EsGaC2qDGlRy6fIY2AJ9gsgihSV+Jnorx34I4ti4FrB3ODnlOZ0PMFIbbk7
 ccc6F7F4sXw+uXmn2eC3YXaKbscQ5if5o8CtOMW4m7k7oijYlbBsO+XPj7BAkgG84djC
 M2zQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=epZbtU/s
Subject: Re: [Buildroot] [PATCH 2/2] package/{binutils, gpsd,
 x11vnc}: fix newly implemented MissingCVEPatch
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

Hi Titouan,

In reply of:
> - In the case of binutils, add a missing prefix to the specific version
>   to which this patch applies
> - For x11vnc, fix a typo in the patch name
> - For gpsd, remove 2 entries that are legit

Maybe I misunderstand 'legit' in this case but to me that make it sounds like
the package is affected and the `IGNORE_CVES` entries were wrong. If I look
that NVD entries they were correctly included in the 3.27.1 release.

Would be useful to include the whole pedigree for this entry:

```
The patches IGNORE_CVES entries were included in [1]. The GPSD bump [2] remove the
patches but forgot to drop the IGNORE_CVE entries.

[1] d41ed2ea54 package/gpsd: fix CVE-2025-67268 and CVE-2025-67269
[2] 37ef4f862f package/gpsd: bump version to 3.27.2
```

Best regards,
PERALE Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
