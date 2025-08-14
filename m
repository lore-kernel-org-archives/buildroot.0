Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B37CA0EE6
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:32:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 343BD607BB;
	Thu, 14 Aug 2025 20:32:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A2rpBRQOxHDp; Thu, 14 Aug 2025 20:31:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2CF060771
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2CF060771;
	Thu, 14 Aug 2025 20:31:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F1DC393E
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E467340459
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VwAFDjqJFWTA for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:31:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9CBF6402F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CBF6402F5
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CBF6402F5
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:31:52 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b9d41baedeso770964f8f.0
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 13:31:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755203511; x=1755808311;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=duwQ3PA73Q4yALLV46EAQ1rYNn53A2CM3KEnSy3yIzM=;
 b=DaByJJKd1aZOzDIllNfwg6GZ02RqCmoPI8KFQkoV3OxTrkOjO7bxevoGuCIDvW4IhA
 r4Hzd4vsjUiypNDRGdeY1iWnoU4V7UOXn2gOSjPp0HnphQSRDpsk/3lCGqcZ2Gb4Kg2l
 SDXVYHmNCjpu+QdcMFhdMEYXtF2VfH5+oc+cQtbe6pR53X17MRv9LOau9Q3tq8jiHamF
 0gQWJF9Lvr718durzr/LWasbA+jnjPwvgaCldI3jBttGZlfkwxQHt/OuFrpUPo9T7YCM
 pUFBmR5oFMqYnRsW2DZwgFSixQhakg3z3PmTeqig3ZrSkZjXUbv0jMUDlskiGd+kh4jy
 pBqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKMg0VxKqGu3a/qbl9watBS4eQ/gNk8770LG7WZsG1/MEFpARBZPtZFkt+zy1EOjoGEtxdy8LprZY=@buildroot.org
X-Gm-Message-State: AOJu0YwH+YTOIWhq7AiPrkF/mFJE9aZC8HhnuoMzRqXVXuaqU3tF7xkz
 jUcVD7eOJPzY0P55D9Wc41J26k4m/4QsX+n2VnHmiXVTjEd7QVw1MfsS/9/DzWI0dW0=
X-Gm-Gg: ASbGncvtUmlv1AzUmTW6NFA2IahzNBR2nU77IWQSVQCxZkAcMmLThL6DDtHOZX8KR3k
 ig/XHFFvgEV0Q0UhWcP0GSDKeukr38v2OCFaIOrNYa9kbZzGYypVxeGTIwXpDtUE3YjHCHlLWKx
 6DGJ4srdih5A03LTqP4SzxHy19eJkBsjiXMoKOCcwZc8pR1RYZ4Y9AvovYTyL6VSpZ5Bq7SOgZU
 m7m/CI3c/7UWVT7ssusYC5ysedcDwmjfJ7krF2TtJ+jAO5R3BCgYa/hhuQYeavBlN2qKaKsD/OO
 sGadjxmYxrHub0lJqrm1C33QpzE3cMCIq4x52/HjTNTJYV/IoAT+bSrZ27m+pVA56O8XV8zBJzS
 c0EfkVOC59n1yW+zj8v0p0EUS
X-Google-Smtp-Source: AGHT+IENl3XuFZN1fTKTdJqZ+wkBLmnlAn0oda6uvs8YYFjKeZmTWppzBfbY8Ukobo3UGcReMebWEQ==
X-Received: by 2002:a05:6000:144f:b0:3b7:7c3b:1073 with SMTP id
 ffacd0b85a97d-3bb266cdb75mr73723f8f.52.1755203510826; 
 Thu, 14 Aug 2025 13:31:50 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c6cec65sm34545405e9.11.2025.08.14.13.31.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 13:31:50 -0700 (PDT)
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 14 Aug 2025 22:31:50 +0200
Message-ID: <20250814203150.2815659-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250726232139.3052172-1-giulio.benetti@benettiengineering.com>
References: <20250726232139.3052172-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755203511; x=1755808311; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=duwQ3PA73Q4yALLV46EAQ1rYNn53A2CM3KEnSy3yIzM=;
 b=D2QSrSIUOZCxdHExJARX6opji1YS6GCk+e8dvLFS9VqRYrQnzE85GdJxt3OjoZNfut
 +QLq3r1epBrARU56LK7tAnwNo/FQNYvDTvYLyqX7Ams9hsn3KubSzY4Dq6HIUZe7DwrX
 OyIl7TZTnRD7Fk0j6v10bzx/MXL9k8Z7kBkWpSJoHA+yv6t4VgMvvTQbqMXicX2O0Cml
 CaJaoohgb8Sgnxms8/Vg/lZZ1a3qJFfHJKlO0l/uYv9Mi+lSwLF0A8ne74jNFMJRmPFh
 yzvYN6DDjN4FZNoXTqrOIJyEQqHVof44OVnO2FmwlzlT8rMRr5mtfR/IboN8Tsu21BRy
 BI6g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=D2QSrSIU
Subject: Re: [Buildroot] [PATCH] package/rtl8189es: fix build failure due to
 missing Linux CONFIG_NET
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
> Since not every defconfig provides it let's enable CONFIG_NET that is
> required to build rtl8189es successfully.
> 
> Fixes:
> https://autobuild.buildroot.org/results/835973d5b71bb085f62c533867746fc3d6b3a8c7
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  package/rtl8189es/rtl8189es.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
> index b60b08fe34..9a2ca09668 100644
> --- a/package/rtl8189es/rtl8189es.mk
> +++ b/package/rtl8189es/rtl8189es.mk
> @@ -20,6 +20,7 @@ endif
>  
>  define RTL8189ES_LINUX_CONFIG_FIXUPS
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
> +	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
>  	$(call KCONFIG_ENABLE_OPT,CONFIG_MMC)
> -- 
> 2.39.5
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
