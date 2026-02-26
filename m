Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A696FD9E12
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC936607AD;
	Thu, 26 Feb 2026 20:47:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jel_w8ynnUQa; Thu, 26 Feb 2026 20:47:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF0F1607E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138834;
	bh=pEEWOvn5iR0WeVxYuIJ3/ZVl+5Wc3gNUVHPdkcFZQ+M=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ICFiHK6OyvHO+7HoWHguVjc2IWFZMLmPWE0yDrX2EfW62YXmWzyQWje1tb2ZO0dgH
	 yR9ITJ3I7Hh6DOhZjChCv7gt1el1dsp0aCRzjJxFraTF+BkVg/eMVE1E0IWQuA33ee
	 R/jLJ/X7+8MhBj4Zms/+wl/lcYgBe7IKh6F5daclD2r3ya41pNzqYCvbzzM4jmGUom
	 GFDRtH/Zkfh45BKdY+u3unAPkDFqC5tnEhK5NNj7efuzeNKuJLliuxWsl/GFybzzYh
	 HO9W6L5hOPAing8YJP+hQsdYVDzSTJV/KgDLYfCVrE/9zstUkEHGCRzrmGE50V9IOF
	 71h4OUwC4G1lA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF0F1607E5;
	Thu, 26 Feb 2026 20:47:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 41ECF1F3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FE87607AD
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R_-7FauoJYFh for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:47:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F11D96077F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F11D96077F
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F11D96077F
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:47:09 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4837907f535so12122455e9.3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 12:47:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772138828; x=1772743628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fduG/aviXvnthQ4fLP7ONbr3XFSFy+x8wBa4fgbLRJg=;
 b=U343dVOix/Y0RkouB3Rx2ffGOu60bICH7R5zvyP6ik1wJbnsujHki6Cq4FT+f6YTYW
 aMyklDQnZLQKqx5aizxBnipsYD292m35LXO3E0dmXnyxLJ5FZ2KUDML65LjUeW1LBb5M
 i1EjILuI53Yd1bnEmgUCvsQ3bl9KSHhFfmg3A4Uk/ypvebXpjUSTKqHUtO/LGrresU+Y
 7KVfvCTMl8LXHSfWcFb+mcCfSdygeSU2+wwhIGhayEx4b73ml/Z7CJKFYC+9sukRxxFC
 4ItNn5LKbwwqOhmlVc10ITRPJ5+qNFaM3R4QJRVaNyxncj96Hc7xLLLScz4OeB4LNtqB
 j0hQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVObfmbwOaBAPVBMcIhmwmRYo4Q/U+i2cDSag8Q689rQpu5ceC7bOsoIfTcp60xWZaYtLtZTXpJ4vM=@buildroot.org
X-Gm-Message-State: AOJu0Yzb5MeubLvR/hMvHnOVukpS2545WeSVHEckAwh2z4Tjnb/M4mRw
 19+it/5lq/eL9MPO/KxDMytYgNhaWkBnoTHy2WtJ8k7PaKVVY0TIK+3XObEsbangxlEkVf+AGu8
 iBQYC
X-Gm-Gg: ATEYQzxFuj+dPFA9/915AwEwBFONzJJ+Xc/ZNBNcku39+K0Xp4+dA3Hw1x9Z+q6DvtV
 ObdltB6la6XfxKOT5WR4Tc/MQe5uxAol8ZXQdl8fpyBR/H4jIxtstNUL+kagIGW1VQQeXhZfq5v
 yEAgtDmW4bguZ8ySl8vHZnzV/8AFlh6s+8ag1gz2PWT19kz6buPf9a8WiFJlQhlz82b2QtZiRT+
 ivOGEEgb/3KzUxNSFxrwqwmWYg0kV+1/7n2dOqj10h7niU/piv/KVgpICs1VYJGpYh76uvuxqqK
 9tIvnDhm+WynrJyzkbcpizfnPDLZ0nGth9TvJaOspt/LUb9vbNUHGPpwQvZIevxzvdL+GiJnFnV
 Gm32O1owl6QgP1H+AnK0TB/8GqrmKx6tK/DGJjrDdvH1Z2C8NDWgBsUBbnT7wxf1X/vjiZFeOeu
 ZgkfaRKM9K66SZ0ag=
X-Received: by 2002:a05:600c:350d:b0:47e:e779:36d with SMTP id
 5b1f17b1804b1-483c9bc5721mr2777405e9.23.1772138827992; 
 Thu, 26 Feb 2026 12:47:07 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483bfcbf79fsm55330155e9.15.2026.02.26.12.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Feb 2026 12:47:07 -0800 (PST)
To: Martin Bachmann <martin.bachmann@designwerk.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Date: Thu, 26 Feb 2026 21:47:07 +0100
Message-ID: <20260226204707.253784-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ZR0P278MB08694E5A8B50C3217342254E8B6DA@ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM>
References: <ZR0P278MB08694E5A8B50C3217342254E8B6DA@ZR0P278MB0869.CHEP278.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772138828; x=1772743628; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fduG/aviXvnthQ4fLP7ONbr3XFSFy+x8wBa4fgbLRJg=;
 b=A/rbxcfQRhglF+kDQcq481EgxJ+t3sOdIcdyJ6xBce+aYdNa+JWZ+VZB6lo4Tzuc/t
 0uEbfn6vILxtwHrvIyb+fdGdUhMuWA7vojDOvIp5Fj1LIJyYQ9HfhLW2HBhKKdseC3RF
 qJVhQdfCMNjnD9MINn9Ib2o1VgcQwQfJLJYpR8tru68jzt13kOJM9cfjUqT6A6fCCKMK
 wKIJFH195tuSXGVbwmcrpgXTY9Zva/BGscnk/Pze4goXtNjJTajfwRhyKE9r0mv3lkf4
 CJspez1GoXFM7RR5Hbeb6+34FZ8lwxEbBzrhvc2kOsywF2ZuaNHQoGlHHQlGAGHPG7o/
 8Kcg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=A/rbxcfQ
Subject: Re: [Buildroot] [PATCH v2 1/1] package/util-linux: correct missing
 comma in license
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

In reply of:
> Signed-off-by: Martin Bachmann <martin.bachmann@designwerk.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/util-linux/util-linux.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index af6044af32..7617041a46 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -21,7 +21,7 @@ UTIL_LINUX_LICENSE = \
>  	LGPL-2.1+ (libblkid, libfdisk, libmount), \
>  	BSD-3-Clause (libuuid), \
>  	BSD-2-Clause (xxhash), \
> -	ISC (rfkill) \
> +	ISC (rfkill), \
>  	MIT (hardlink, flock)
>  UTIL_LINUX_LICENSE_FILES = README.licensing \
>  	Documentation/licenses/COPYING.BSD-2-Clause \
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
