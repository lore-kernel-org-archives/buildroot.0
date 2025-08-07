Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092E1C87FDA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 18:24:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C8A5C80414;
	Thu,  7 Aug 2025 18:24:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jswncQZo0hbm; Thu,  7 Aug 2025 18:24:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5A2B8037C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5A2B8037C;
	Thu,  7 Aug 2025 18:24:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id ABA7710A
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9233C60642
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I-JKpJNrfhXR for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 18:24:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B65A56063E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B65A56063E
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B65A56063E
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 18:24:06 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3b78a034f17so1111638f8f.2
 for <buildroot@buildroot.org>; Thu, 07 Aug 2025 11:24:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754591045; x=1755195845;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xpj4YjL9S+UAyVkhVhrYpU+OgyEWcR4WoPjP2G0ZgfE=;
 b=xQp3hDFbg8vprOJTqrKclecL7lH48SEbBRDc+0m/2pwXXyf7I9OTArEEOxEVnVzPem
 f1QO0XJufoti0OJTUVhYD42BYHypbGpbdzA6FfOJQZSVn9RFbtwxmSpWbh9ZaQv8a80X
 DrRbi+G74ZhD/eVSvobi1HGqdAbkZ2XN6xDi8Whd7cOCSn3XNSMSMFDcXeinFwMFuGkF
 P5HDXjLkIDUeBdapzBeREH7IgFsFe1t3VkLpPZJnTUoNEiSJBX3B3y65SRBPNyZuDbXG
 Y2wHOJyxbjUYBMVi6ZWN4CugTaduP5DakQ9M2JjE+GN5k58J1BIQxLGG/G1sr15gKvVP
 PMjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZbekW0r/9Bkg5J9/tFlU2+FRqmhdweqOhbgbFFpwphSg3wujJJoMQi4GINb/1Ykpc2x+YG4equGo=@buildroot.org
X-Gm-Message-State: AOJu0Yy2BtlB+f6Zu6d5BwpG6o60GRu9v7Oj4LeWPH9S5LzEPJPharJp
 KH2LkqhHxi/ITYpT/SxlCT58NYGn6ilzupv4SxQT4fjEZkuNbLv+ShEOsXEJqmGQ51INnfCjT5v
 VzQq7
X-Gm-Gg: ASbGncvqlcAoHtRXNvPZGaChJNLZ2YIHcW9j6DHbVZsI8eQvnh7WeTwbZGbukVyq2AA
 6gb7o82wpUJdUwavnnxhzSaXl9w+HicP2Jym+B1ef96N5r0jL2I/BJWKZvRXFO+VeBdvB3o0HML
 eDa1JkCxOTE/V8Xgjsk7+31GegbjbHR7916CJhaQqqV+aoWlPA38pzHBW1VhDFbFNtF/mqrohgb
 u7+Yl6cYLlWP6OLWDDeqz81vV+FVei/yJ9MyLzdbQdvFWRhfP2kGCBJT4DdJi3n3T8hWcBsioZF
 /doqL2a6uVNVyaeiurzzKX7eUE4L7mQ5OdRjEqAY3DXKb0ZmZ568bKQJBYP7PAfAYij1FPjOOaI
 +VtKlBlMGXLuzhA==
X-Google-Smtp-Source: AGHT+IFChxpIjhureNCT05KqWY4xOinONpA393klbXaafQ4P/nP4lz0jxLSVDMWMY59nOqUDTdzCdQ==
X-Received: by 2002:a5d:5f4d:0:b0:3b7:9546:a0e8 with SMTP id
 ffacd0b85a97d-3b900b7aecbmr166864f8f.41.1754591044782; 
 Thu, 07 Aug 2025 11:24:04 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459c58ed07fsm199756585e9.22.2025.08.07.11.24.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Aug 2025 11:24:04 -0700 (PDT)
To: Fabien Lehoussel <fabien.lehoussel@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  7 Aug 2025 20:24:04 +0200
Message-ID: <20250807182404.724337-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250716100712.1244865-1-fabien.lehoussel@smile.fr>
References: <20250716100712.1244865-1-fabien.lehoussel@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754591045; x=1755195845; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xpj4YjL9S+UAyVkhVhrYpU+OgyEWcR4WoPjP2G0ZgfE=;
 b=AH8YVrs4V07vlFnev/6szahuVVFIFwS7Wj8ZamYFD5LHnHoCibyNaMLKpbY7Z8IEK5
 iUpnBw5DU1ercNDGEfAdN+APWLlUwb12VNtKAzl46f26KQN96giE3S43EypvQNwa/qLS
 3Nz35qX1Or394O71RZcIa+Sa4uTIe420tYy/3X8YUs2HUHs4EPiV9kFRMKxhd9BELJcn
 3NjAYG/ngd9AefuK9m3hwLyXELQESt0iZqmUb+azWzEiyDSYYwpoNYwoK+H9zYPw+CIR
 g1dSuqwCWVe8eCQI8SJ5uYoEmSGQsNO8wrzdNTQl0hkYkYQTxFnz2PaL47ueJbedNWjl
 ekNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AH8YVrs4
Subject: Re: [Buildroot] [PATCH 1/1] package/gcc/gcc-final.mx: fix CPE
 identification
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
> Fix the CPE (Common Platform Enumeration) identification in the gcc-final package to ensure proper vulnerability tracking.
> 
> Signed-off-by: Fabien Lehoussel <fabien.lehoussel@smile.fr>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/gcc/gcc-final/gcc-final.mk | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
> index 43aea72420..97a64ae2fa 100644
> --- a/package/gcc/gcc-final/gcc-final.mk
> +++ b/package/gcc/gcc-final/gcc-final.mk
> @@ -12,6 +12,9 @@ GCC_FINAL_LICENSE_FILES = COPYING.RUNTIME
>  HOST_GCC_FINAL_LICENSE = $(HOST_GCC_LICENSE)
>  HOST_GCC_FINAL_LICENSE_FILES = $(HOST_GCC_LICENSE_FILES)
>  
> +GCC_FINAL_CPE_ID_VENDOR = gnu
> +GCC_FINAL_CPE_ID_PRODUCT = gcc
> +
>  GCC_FINAL_DEPENDENCIES = host-gcc-final
>  GCC_FINAL_ADD_TOOLCHAIN_DEPENDENCY = NO
>  GCC_FINAL_INSTALL_STAGING = YES
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
