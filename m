Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2463CCA6017
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 07:12:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BA7B6061B;
	Sat, 10 Oct 2026 07:12:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rAa1uV2y081q; Sat, 10 Oct 2026 07:12:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2AC4960621
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791616356;
	b=nkYYzwQbKWqKz2hYdeE13pmwadUWmEyGpih6kd1wvhydkx7pDns0LfrDJfz8zmobNM48
	 dIJT9xixgzTciTvTqiO7VKHhofDCQKD9QTC0gBSoq5U5n6ZT1dSJ+oFdMWZC4XoK+pbW+
	 x6QOe364F0dtex9obrbqTslUulEtjctklyldn5YJsuynw+rxkdUPMg9zaIeEs61EZkly1
	 ygLYAvzKygCZksM2btSfkbpIyk2KR1cDPBediZIKHli0xqHASxojbNuwgApv5qdJDIQ02
	 hT06Jt3vDNE5M8c0GU3ufKyMtwfKiDpFcW8/RRzyATm3O7A+TZ5mM2EP43btSexLRmw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791616356;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:
	 To:Cc:References:Content-Language:In-Reply-To:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Transfer-Encoding:Content-Type:Errors-To:Sender;
	bh=Z7xvf6Xm1OUnHtpkEDAL4aIiaED9z0Sh27fPWQ9ewPg=;
	b=RfzvYWS+Rd07Tv3yBzigzXYzSrnb+YlJKuwOXqyGkRHj0u/vhnRIzaXtcDHSicYaYCRE
	 LXcMWkU+44pZeBKbJYDI1JMohhx9n621aFvEkXoKJvSJWZwi3I5P1RoTgjUAa6Ld7KVHT
	 G4t3BLRPnBdiA12iE8Sx9dUu033jkO7DkOKbs3QO3jJYXqNRCtkAVT8tEmZS9Quje54fX
	 onflxSnTOmO7zb6sg5XlIcQ5TkP9+VV0pigfgxT2/8ltME+Vu0XLM9o9zTx/F7IHV3lJ1
	 cNHcTP+cp63kwrANn+uAVldy/dLIxumXgcVnpQnud4qAX/UPc4POaDk8e1HLE6xpGFQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791616356;
	bh=Z7xvf6Xm1OUnHtpkEDAL4aIiaED9z0Sh27fPWQ9ewPg=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e7nr74DgyhHXuyIm73GRSuHOINMm8K1J+zqStj9Ya93raqTFADcEhCryoaOt+wtCb
	 ui56C/xkEvzfaCtQgcl2XtXkowjfuTCANWCoVRl7DfMT1c9OWFUzo9J18/SnhY8cI+
	 Ejnm0wC6daf45J+i4yt/139g+L45IW1KPxnedgNen0IlS4oTGJUlIvye5r/yD1n3Xi
	 2GfnSvPThmhFtldNg/HVQrBaKGVyEfXLsUs+qrOdOLWFIpuwGDfmKWWrdcEbLqEVr/
	 kPUlMZZz0S0watQrsqkjufJXKmnTaXk+lG4zxNf4DYB+RHuNa0ivnqhhauB6svViyF
	 iUDfTmtoLuFEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AC4960621;
	Sat, 10 Oct 2026 07:12:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87C1875
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:12:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7920480DB8
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:12:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bxjzuXbH0e5Z for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 07:12:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6BC5C80D2D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791616352;
 b=KRPVhevd0a6scuhlZKmE6hjtjI/770qoylbLRB7JG5FYPJYv+pEbpJtY4RVGC5ZqzWSA
 pghSbTWKALqW2zpK56XaE9v317Zra98aeemWu+Mbe2q+HorfZ41bHXOYbeGnaXemtX0NA
 WEJRacDSXDBiTo+0sFkWWeTgekYT0z0eH8hsCbyApHPLDs69uaaXsQHX9TlVGYzoDpD5d
 vdNYS+U3BMH5TXmBO9R0tkVIx6RaNeS5LVSYPxJ2RlagNcC4AbdL1Yt45iGFA8nE/H9EA
 CrPE7vjvDeYYWQ6LcNAPnb2xCSR/0HuTUNCzB8bO8fNk8rSoaLhSqq0y3Pqhpik5bZg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791616352;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding;
 bh=OMXaVEXLbv2IqFe5lz8NfvSAuwv7OoE26YOQp6IMTP0=;
 b=CA6RPQZhi/GY1+iFL7ao5KtuE5NX9QSDD9KUl9quMZ98WW4gFUnwhj0Z+JMRe2zkPtyf
 j7W6bJTDemdCGDLFOhSqBiAPPhzZ52cUwY/M3ifDe6SlwvnC3CatQQjz9/L9q3aCInLKT
 y74kK3FmACEB/cyHxBfdeH9zbPIjnFAEXAd1JZcZFM71lr6aF32nWZcCrm4bjSc2ai7oy
 O9R5g67Q7w99L90uoxQAEbot1ayqSyqJ9lXKA0aZHfNaRYpS4S9udZ6QcWHpeTSOPaU1X
 T7T4BVfDfif2pGRNB/yE4VN07RzklM5haq2A+wJp9NrvK5S+oyiMChJvgN7UkrvMPFA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KDX1nBdJ; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6BC5C80D2D
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 07:12:30 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a1698ea378so3524765e9.2
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 00:12:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791616348; x=1792221148;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=OMXaVEXLbv2IqFe5lz8NfvSAuwv7OoE26YOQp6IMTP0=;
 b=UJck+oIf8ofcUo1x3cThmNDRY3MBE9xaGHXwRrE/dvRGaowLUjZ/SE574hQqcqIUcz
 9dPa9q9XwdjTEeOZ64SoDV0sU8WIXASK+keHXSz+u9QLJh5KT6JfTvIh66sKWPBL5y+V
 DnDoG/29rn1F7kf8v3x5nLo99d7Tzps1N4t+5P3I7c7Y6HZiFPL5Y4o14g/H2xd22lsj
 mnHIma0ObryKAfEzij8KsJ936N08VGeHFxLLi0mZPg9DX8cR93Y5lC/f6QpH0umT/+Q7
 uPAi6HPMKG3YDmxUoWvtfhUwhb9s+tUDwli6sxVtFaW+GPCrmqyCdiEWoB7nLfhmw/VA
 /h/w==
X-Forwarded-Encrypted: i=1;
 AKwUvBx66r5EOZAIafTrQlgaxiBQW3U7f1XIc1GV3uHeiputn2OQj+HqneTo1OnB4RqZGSliPG5djwx684s=@buildroot.org
X-Gm-Message-State: AFq9FYK9BMs8qn80EdoAfETAcWjaiG1E5vhSdc0+pGFfaxbdi16R1M5w
 SfrlzMB8o7gh8C0J38Zq6/q5zQ9zFhol6f6/e0dLw3a3QWU5RaNanJOJIfckeDgZw6AcJncYUUt
 ls7R2f/I=
X-Gm-Gg: AYBFou2Y80Qr3Vc7/LsoVum5bo2NMcQLvK1yDdBz6fBUG7dEyMhJiblxJ31P4eI4xyX
 w+b31Tn1nXhqdfEEfAo5M0RFUPn0Vy0mWlPyAESW5z/BW1O/itIEZ3nSJkubAu0o4quMc1+rn5t
 G/wJRQwV+eh65g0+HTdVQYaXgemf/LnoXnbJVOgX4INa9E06kxyunLRpGu1Idz9w/3EwhLunqds
 eEL7dQFvXKzhjRRW+Fs/qNvkmtp0d8/35J+Arhuyb604z9Z69dorOLyIzvklukZqCPbIXitsqLy
 iMq5ZGckahCwjl8Kl5kOeQjEjUJvKPD0DQp/mOtXiLwREk2YjwVdo+j8yb3459Mx7GCJRjJil8V
 c5PE9wrzYUFeNJV1bcurWr0xs8eCCV+OdxC3TJORpcDJwKKir4vFdDd2IzRFMAzzVg3mDpLOlov
 BaMf77atOJDbBm1j8G0HfuGsWATPvubVmnUj3yYqnuldUX+cb9PEta1xv5JCObsho95fmjKCAdi
 J3xvVuxABWzoafwRJ+06Is56OJXQU6yzdK0PEv1yeBYdpJoo40rEIyQF5tUzytjtGN3Tu3KqdT/
 tD/1CLE1+PcWaasl8QQHrJlBwMOS5pIRNA==
X-Received: by 2002:a05:600c:5391:b0:49e:7a10:1b71 with SMTP id
 5b1f17b1804b1-4a18e4a003cmr79131315e9.11.1791616348461; 
 Sat, 10 Oct 2026 00:12:28 -0700 (PDT)
Received: from ?IPV6:2001:1aeb:401:dd00:a87:9755:c250:f5ef?
 (2001-1aeb-401-dd00-a87-9755-c250-f5ef.ip6.tmcz.cz.
 [2001:1aeb:401:dd00:a87:9755:c250:f5ef])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48db9abda3csm7671875f8f.36.2026.10.10.00.12.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 10 Oct 2026 00:12:28 -0700 (PDT)
Message-ID: <1d859692-9299-4d37-b2bf-fc9e00275568@mind.be>
Date: Sat, 10 Oct 2026 09:12:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
Cc: linux-amarula@amarulasolutions.com, Edgar Bonet <bonet@grenoble.cnrs.fr>, 
 Romain Naour <romain.naour@smile.fr>
References: <20261003164513.488800-1-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
In-Reply-To: <20261003164513.488800-1-dario.binacchi@amarulasolutions.com>
Subject: Re: [Buildroot] [PATCH 2025.11.x] package/libgphoto2: fix build
 with gcc >= 14
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

Hello Dario,

On 3/10/26 18:45, Dario Binacchi wrote:
> The commit adds an upstream patch to fix the following build failure:
>
> jl2005c/jl2005bcd_decompress.c: In function 'jl2005bcd_decompress':
> jl2005c/jl2005bcd_decompress.c:161:46: error: passing argument 3 of 'jpeg_mem_dest' from incompatible pointer type [-Wincompatible-pointer-types]
>    161 |         jpeg_mem_dest (&cinfo, &jpeg_header, &jpeg_header_size);
>        |                                              ^~~~~~~~~~~~~~~~~
>        |                                              |
>        |                                              long unsigned int *
>
> Fixes:
> - https://autobuild.buildroot.org/results/cb983d9ad90170aa8d7f2b9a5dfc30055d83b5de
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Tested-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> (cherry picked from commit d2ad5b883342b92c354c8a110ffbaf1ca7dda20f)
Buildroot 2025.11 is EOL for quite some time now, did you really intend 
to send a patch for that version ?

Regards,
Titouan
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
