Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9A9C3ABBF
	for <buildroot@archiver.kernel.org>; Wed,  7 May 2025 13:43:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67D3382EB6;
	Wed,  7 May 2025 13:43:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EMO1pGZENWIB; Wed,  7 May 2025 13:43:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 804E282290
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 804E282290;
	Wed,  7 May 2025 13:43:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C80F4950
 for <buildroot@buildroot.org>; Wed,  7 May 2025 13:43:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AE6038207C
 for <buildroot@buildroot.org>; Wed,  7 May 2025 13:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fTB7ppFOGFn3 for <buildroot@buildroot.org>;
 Wed,  7 May 2025 13:43:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ADF6582290
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ADF6582290
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ADF6582290
 for <buildroot@buildroot.org>; Wed,  7 May 2025 13:43:06 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-5e6f4b3ebe5so12284220a12.0
 for <buildroot@buildroot.org>; Wed, 07 May 2025 06:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746625384; x=1747230184;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6S2S47CMRhEN2Fb+HutDxM+ZXbuzU+Eszqu/brg7oSA=;
 b=AvRjgsJ0x+drbQp9JlR09enhhdg/AWIUz/oCWHSla/sl4H8s3DTsr3xy7SOxYePb6m
 6tuv62GY14CVXDjRMk9PAUc9CzqAj4jE2+kvEUS/Scj2AnNtLiGBfA935NnsDbliUuH0
 ggumwadj4OsY7LoE9OpHfJzh3rtyrw4G6AzHF9VWbeCQ4yzzTyiqdrFK+67sB1svnMjC
 Il3pe++l3s+8V+G1dBWgwRxrvyICK1/47j6l13RtkugQRH5PZKRYjPoQgxCVmwEhE6Zg
 5mGfH99876FcnMWeAfgtsK+MJ80YucrJGypFc38NKGEbO7vq6g4mPh4mbU6PAO/NxDPq
 kHrg==
X-Gm-Message-State: AOJu0YyZWW2Yt2fmJpbcLtN2QQAAmWZZBE5QBHCBYZzj0iJ+GG5lYsz5
 s+alqUNcZtdFgeExXcMZwja4MARkw8RcMjVmA8/dUqfn4Lzceq9Iq6HcU+RyP3naS8aG/mAU5cj
 YZyU=
X-Gm-Gg: ASbGnctvTkjpIuU5koq2D0Ifs2USj5g/Kma03C4rcXMy9EPotwZ2ow8tlpTdLJcrrBo
 qXWRJ+XvDcmX2r2kP1yYNvQHvHnZHS7UANO8QmKdLozZ6jaLoLwRN2odZxT5cDtPXxl+N+af9tA
 6Za/r9d/S0IHS5Xo+X+wWt22A5oZOc/R/Ux7wM6s6LFe/0BUfNVMr8Gz5F47P1AXeF5xfoqO4gu
 xGh+FFQNNx8IhoNs3wGoTPlO156W9RhrH1Piut7g4dDmHQBjoSUIIsRve+bQYBXTtixUTWfSFDO
 sBZ5fkEB7VZ/scGrJ8rhGKmN04AG5VjXQp6uqD/IE3we/XaxgaJQWiSYjMeqJXwDgC3ny7A1DAl
 RYGz2VL+Nb5fB6fM7q4L3n8q6bAK2LBrl1k0=
X-Google-Smtp-Source: AGHT+IHhWtYQgrg6SsdE4QmlHV0TuVNRLvTwP2mtWKbwxCXZJmcmurwh3GP+AWgq8+axtIdx27bWQw==
X-Received: by 2002:a17:907:970d:b0:ab7:1012:3ccb with SMTP id
 a640c23a62f3a-ad1e8bc3ef2mr285998366b.14.1746625384248; 
 Wed, 07 May 2025 06:43:04 -0700 (PDT)
Received: from ?IPV6:2a02:a03f:639d:e501:5db7:a3a4:443e:4828?
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ad18954108bsm904697366b.180.2025.05.07.06.43.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 May 2025 06:43:03 -0700 (PDT)
Message-ID: <6432cde6-8900-4f05-928b-8801e70cfb2a@mind.be>
Date: Wed, 7 May 2025 15:43:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: nvd@nist.gov
Cc: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1746625384; x=1747230184; darn=buildroot.org;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6S2S47CMRhEN2Fb+HutDxM+ZXbuzU+Eszqu/brg7oSA=;
 b=AmmIATyQvk97Fc6YCMIC5yNyAT4JLkDg5MvBWtcTwiDZxilVILJ7tq1HPA5N8awicc
 aPcnlzrY7yRv619rf1rhvaVSxLTaacm9iq51G63EAKH8ntkGEXWBmAV6Ktob5/aA5Bue
 EVulmMuRk/TNgHWKdWWpaQ8hQRiKdRsLsh6ayz0YERqS3T4BAzj+Irgqkjvtuzvxutb2
 lieSH51YKKWv7PXpHOYCmJ+G5opO8EKt7QVg3Qty/VqJSBuwJC0GruHcR3DQzfcaXhNq
 Mvq+weMU0vvpxORtHejNXXw7emV1rYdJIOYJQm3m3TnAQzfvFv6Sz1NSZfSX7wlG748C
 Db0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AmmIATyQ
Subject: [Buildroot] CVE-2025-26594 to 26601: missing CPE version specifiers
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dear NVD maintainers,


In all of the following 8 CVEs:

- CVE-2025-26594 (https://nvd.nist.gov/vuln/detail/CVE-2025-26594)
- CVE-2025-26595 (https://nvd.nist.gov/vuln/detail/CVE-2025-26595)
- CVE-2025-26596 (https://nvd.nist.gov/vuln/detail/CVE-2025-26596)
- CVE-2025-26597 (https://nvd.nist.gov/vuln/detail/CVE-2025-26597)
- CVE-2025-26598 (https://nvd.nist.gov/vuln/detail/CVE-2025-26598)
- CVE-2025-26599 (https://nvd.nist.gov/vuln/detail/CVE-2025-26599)
- CVE-2025-26600 (https://nvd.nist.gov/vuln/detail/CVE-2025-26600)
- CVE-2025-26601 (https://nvd.nist.gov/vuln/detail/CVE-2025-26601)

There isn't any "up to (excluding)" version specified for:

- x.org:x_server
- x.org:xwayland


As reported in "X.Org Security Advisory: multiple security issues X.Org 
X server and Xwayland" from 2025-02-25 (see 
https://lists.x.org/archives/xorg-announce/2025-February/003584.html), 
all 8 of these CVEs have been fixed in xorg-server 21.1.16 and xwayland 
24.1.6.


Could you therefore please update the aforementioned entries in your 
database ?


Best regards,

Titouan CHRISTOPHE

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
