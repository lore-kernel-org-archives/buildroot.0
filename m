Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989EBC5DF97
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 12:38:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EFFD240911;
	Sat, 22 Aug 2026 12:38:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eMqZQvuer1V1; Sat, 22 Aug 2026 12:38:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787402285;
	bh=Wq7m7mp4bWTHHGJybRmyD/7tHvhu7h8g2/0yqnsRyl0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=eIJx7ilm9BCx5zy5VGHSGdkWdOSmjh/4ebwDkVHajy2ponly03AgFGnFJMD1DBcnt
	 1KRBN3wZSgymDPgZdSr/j05jzD61eDEbMOuBRFSptYBaYiiNaQpYBiNO2llhIkZOpy
	 mRfdnSiHeEduKD6SLWnHTGYdCtYuEIwCHiE+VVZycaKxv98JK3nlYe42dVm9Gju60+
	 bCjUWqUMve032yz2HeohfbkWJ/HlBy/oNOTimkk6MsOp3jHvnCpAzS4KqDAZAey6q+
	 NPxqIzv+WW4NGuyX8WAUqp3lW6QHs+6maQaLQBB5XJN/WIbzyniwdV5G0Io+VbUOVr
	 gKXzBZ0mnbUpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B5A8408D0;
	Sat, 22 Aug 2026 12:38:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 703002B2
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56844408EE
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:38:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UhsYF5Sc2NQn for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 12:38:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B20D4408C0
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:38:00 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6a41191c9a9so3945752a12.3
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 05:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787402278; x=1788007078;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=fKmBjTZCOAKgh4nCfCjJ6keHZ1GWishJ9iq+ZjEoMFs=;
 b=ZB9mgWuldILeeIhUgZE65AU25Y5ylAwmrDoAjcbZ3QMxSY4EqvYZA35V3RmK0goDO5
 xthfJtO8YIdi98Wlza7/b9eqL8pHaUfgVMWX8aWg2OJAb3HPeIYGxfzmnJJR+witOXsm
 5kr82H9jVFnoVAuCdJkwtd1r7UNUZ0n0pcOIO1+QGAxlWqtzHhRGHlRmmzgf5FN3rRZh
 0VZpYCs/oB9Ua9R0ueKQrARF1kkceP5o7rHnS2X3iRoGoogYKow0XuxgZX+6EkbEFs66
 rYjDZeKrdLW33oQoulG3D/jTQC5d0OxglLMAulk/N/MEar9PuM9fIaNy1CUPAvY8mW+A
 FcPQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RriK72drOK4LVCHR7mlnn33EcrOluzf81NlxokRSS2O98BtEP8l/PrdPJQ1sXggXsvG3i3URAfnH6w=@buildroot.org
X-Gm-Message-State: AFuF++mP5D5QtWclR8eeIeQZ1wSD/eY7ZZjkVh9SvhpBL8SjjRlhhFfz
 j22vQ1myUNwhJI9lPxL9pI6aL6IxCdZR3JQWNJq7a22ihcrI1cWdMxfdb0uEnOVHaQwkfYv8zLq
 22XoD
X-Gm-Gg: AR+sD13XruKAN8Y+hQCorFCwQb5koubn5EsjgX2AHsxffbC1+hh/CXKS32IMEUOJuPO
 lN+YVJ4KWyq3noGJQbXPhxDsC3Hi0zefRyRwYyIwUvKWAWoQdUemQsnqFZvQHopKG2DIG7tXFAO
 X5yEcp2A3DF7sUzS9EoS0Q5B8iBVx+E0e7mNxXVrnZm0kHEogU295K9jDj3U1FZWIlG0w/EbrYS
 v7qL3LZIO1HQe8d4ZI6Z8c9ZE0P1GVkJBo2YH5tZMAZakWCKktNYXWJ41dEH+0H93nPwyH0b427
 bWgfCMJANzpTbp18kCx9FHEg44lyADq/4IkTTeUB4sbP+4BozNs54q0ZS9mB4+uBBPF4sdv7Bhi
 DT5ilUUtH1FTsdIc0/HoX0IQW6Xm2RuqsjpqD+JLZBwt3M07xAASmQ2pRIxM5K/6S9o6fneIJxE
 Te5NVia+Z5gkTDx+K1a8zmUlqJd/inrM/94esBKLtptnX0zWr3QZN/1lZP2kCWk0tc7chmkqNHv
 PFGSCrS8/piz123kYVDU7UEQHL1ILe4m+l2cEnOjESfXYZc
X-Received: by 2002:a05:6402:3647:b0:6a5:7aad:e75c with SMTP id
 4fb4d7f45d1cf-6a57aade7fdmr6755693a12.6.1787402278066; 
 Sat, 22 Aug 2026 05:37:58 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a3ff178289sm12033000a12.30.2026.08.22.05.37.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2026 05:37:57 -0700 (PDT)
Message-ID: <853a9a6b-3b2b-4e91-b54a-999ff41ffcac@mind.be>
Date: Sat, 22 Aug 2026 14:37:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260816073211.1830243-1-bernd@kuhls.net>
Content-Language: en-US
In-Reply-To: <20260816073211.1830243-1-bernd@kuhls.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/intel-microcode: security bump
 version to 20260812
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

On 16/08/26 09:32, Bernd Kuhls wrote:
> https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20260812
> https://github.com/intel/Intel-Linux-Processor-Microcode-Data-Files/releases/tag/microcode-20260811
>
> Fixes the following CVEs:
>
> CVE-2025-31936
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01379.html
>
> CVE-2025-31938
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01404.html
>
> CVE-2026-20917
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01423.html
>
> CVE-2025-35973
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01428.html
>
> CVE-2026-20716
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01435.html
>
> CVE-2026-20760
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01441.html
>
> CVE-2026-20713
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01442.html
>
> CVE-2026-20707
> https://www.intel.com/content/www/us/en/security-center/advisory/intel-sa-01443.html
>
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2026.05.x, thanks !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
