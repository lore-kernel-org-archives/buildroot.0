Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35FCBEB28E2
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE96B61212;
	Fri,  6 Feb 2026 08:12:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ufSaN5UKV1Ip; Fri,  6 Feb 2026 08:12:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E202261263
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365537;
	bh=0K2Pv3p4DGNjwaSDMTHbpKIazXn32CzmQ72U46XEHCI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CKOrL0vv6TTEy850CIuceQ1viTjHmHqzuvB6bGIWBIM9MBAtJHZod577zjyfg2kgI
	 uYV1wkiNLeDlftyQnNsHInZu7iX+pqAYIKtnIUbaj0OdxqdhXMQGKtGGYl+jBgW8Nk
	 rWNbi+y7KHQdQG5UkIPrM9wAdU+Fd4u0+IRaMZ/iMkTEIALBOhFWnTCyUQVYkigIvV
	 HVu6UMdcQsE5AcvLw7ENsYqIcbkG7y4gAhDZrJHdsPSh16nvZaCE5Ukz029RZEd8lq
	 tHBgEYwGc6A3xb/v46igp1zeD246+9LUMJuTm3ysueWdEcCfwzsqiaItDlZ47CCFeW
	 wkMOhtq0sW5TQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E202261263;
	Fri,  6 Feb 2026 08:12:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CAB5219
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BF7D8403F
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rG7NmBudM4cO for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:12:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 372FC83BC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 372FC83BC7
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 372FC83BC7
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:02 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47edd6111b4so20845735e9.1
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:12:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365521; x=1770970321;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AZl6+th4fdzKP7PIYPRXIwHAuVM3aMrpSlby/A1dyRQ=;
 b=sz5Jxc0ORqTawV9kY+TUGxvvq3CIF2NfLXi6Oq5VCMijxKKLjyCwwtm0wGZLShDBYv
 DHmASvDH8zGecqHQbt+R9Hob6Q9OSu0ZMsChGXwqUeAgRN1rHyjzLlIKSQYC/n3jCFYj
 3LktUxhSjZT8tN5a5QWmKRR+mvxG41+vUe50i/+IXK8P8vM2Hsr7zY4426ip2WXTbwAh
 DSIeIuMI85YgVxL5eO4AHeRe1AKkxd5SKhGx/cw2+uPd7vxSMhCB1gYpUF1kZiSPA1vB
 eismsKPpWWrbNMZhoXJk5bNb+My6AYozjgTuYEoYJk9Dy2sNoJkAfjdNAopU6eDTIK5B
 hOfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgEG5WNP/l+acyGzzqztMpgki0PsXsObXBM8eFpK+V+lfXjmvQaRF3qWHAQRmZxc5mxO3/878gU+4=@buildroot.org
X-Gm-Message-State: AOJu0YxXaS051Hxfg4Ujeq0lboziWuPSBiV7M6A+pbyl4qSqme+Xdxhh
 JrPlbjN3kHS2ZGVzW7M+hlfafJ8+qviLXMSkjema0cZz3t7/C5prGsTrZvQWM2eB9Xc=
X-Gm-Gg: AZuq6aJgCIVbo1k/q3YpbL0NQBrVXwOcJDhYa682HBBQFd3jdUq5kjE3uKsNZY4eM2H
 lXb/Gg7ZapaNFhbnFIayd48DOUw7jCb3QSXpZN2pCMjWPSJGc0ohTn0hXLqvUJfQVtTgYbcBaRU
 fcbczg/ubn+WGdxF56xpeAaOdsJ5HQKqBMNZbcfKep2LFn2V91OBOVwT4hilyZ4iNFwC3Jv+ovm
 A24XrXzh5FIGKgGKJbZ8Y7qOB2hbrh6NF8BLSEFwLUb5QyHjU9r02Pld+bV+pMaPf8Ck7nYW6VA
 uz3U9iZLxB5JzIvRgTTxtZnwWr0h4HcjR7+6NxLIqUoWIXZuHY400qICCqv82+dok5yAw73X3K+
 EKCcd+Bn4kYroZgfFFpyeu/gmAGZxizOI8BWPY9tOCrf3cFOXDw8LZ8N6J+zZNrNKF0jI4ZBE1T
 NtNS1MvBV52cZuPw==
X-Received: by 2002:a05:600c:848d:b0:477:9ce2:a0d8 with SMTP id
 5b1f17b1804b1-48320181b22mr26821525e9.0.1770365521006; 
 Fri, 06 Feb 2026 00:12:01 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48320719bf4sm33612285e9.10.2026.02.06.00.12.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:12:00 -0800 (PST)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:12:00 +0100
Message-ID: <20260206081200.32739-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124153803.1077707-1-dario.binacchi@amarulasolutions.com>
References: <20260124153803.1077707-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365521; x=1770970321; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AZl6+th4fdzKP7PIYPRXIwHAuVM3aMrpSlby/A1dyRQ=;
 b=GQ/Qr/9d5Aj0S3cGngj+EchB5gTWdHLYSfTDOi4wAPzqwAip4igtRUvj02rG1/GT5/
 6XXgLHI8taSz5+i0UkZ51DMfuUYdiGNDiQOK34rpLQj12wZ/ky3iKYvEmuYowL6t0JLT
 MY2iYqktFXApynY31zFjLuAZRDMgq7CRFZrFKw1UamhY0aveFX/RGiCjBnLt/HcdMoBm
 n9NldnjVeUN0gXE3gFrrpauP7ytBnZWumrgd1vD8P9+++6Ii2YhnTouwjoWL+hTl21xF
 YkbBSAxbyAbqWFdoM+af+FFAY8/aJPSbX7iL9M/aREevpvZ1+CZl26tqs21sV7a9II+z
 M2xA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GQ/Qr/9d
Subject: Re: [Buildroot] [PATCH 1/1]
 board/stmicroelectronics/stm32f469-disco: exit post-build.sh on error
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
> Add 'set -eu' to ensure that command failures or unset variables are
> properly reported to the 'make' process. This prevents silent failures
> during the image generation phase.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  board/stmicroelectronics/stm32f469-disco/post-build.sh | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/board/stmicroelectronics/stm32f469-disco/post-build.sh b/board/stmicroelectronics/stm32f469-disco/post-build.sh
> index 03e9dcae8215..74c59fdb72dd 100755
> --- a/board/stmicroelectronics/stm32f469-disco/post-build.sh
> +++ b/board/stmicroelectronics/stm32f469-disco/post-build.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +set -eu
> +
>  BOARD_DIR="$(dirname "$0")"
>  
>  install -m 0644 -D "${BOARD_DIR}"/extlinux.conf "${TARGET_DIR}"/boot/extlinux/extlinux.conf
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
