Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AA3C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D97B28236E;
	Fri, 11 Jul 2025 10:44:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Y_A1x_vjjrWC; Fri, 11 Jul 2025 10:44:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07C378219A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07C378219A;
	Fri, 11 Jul 2025 10:44:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E2D331E1
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D31D40DD8
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BW9QBgoC5IPk for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:44:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A22B540DB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A22B540DB2
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A22B540DB2
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:31 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-454e2463e3aso4748455e9.0
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:44:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230669; x=1752835469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FCiaq2zzJ/quemGiSfzo3E6QcTDp4oqaZSycQVNHDFA=;
 b=fCupYZRiFznGB1kMifsNuNmIOTaJPMLFV4yCteIOJ4xipQa/pO3MknZtb5hUtCkO6Y
 BIKme4nVra1jVIzDiugreYmJVo+5W4qHiWO7iB3L2ibfr7k8ITw7YZv4xeMWmqAfrtEe
 n/4Qo5dFx1LPffp/VYw/BUBBxGpDrl4UEimHwGCGKKc7o/NauTMC3Eb4VnxahHw3d7+F
 Uh7gKM/Rh3GBhdPtUnWUSO8olEoZMqwYjwZjHPaUKTDuCdDBEhww6zTokSt5rQxUq1i2
 UYQIldWuNJcrgMIHuco+OsRvcOrzi4OLHfxoTKS6U7cZPl6MPtbjQndIFQdU03BFQvr8
 qEjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQF9N50OBI9Kv8mQ36AfZGcwT4ly7dQX7BrBJjuzD6qI3mmn4nN40JCUAi6WXfK/eCre9DJzHmJPo=@buildroot.org
X-Gm-Message-State: AOJu0YySzXAh6IbS9I5mDp5KTkS8VZ93m+5T5uxphFy+b4FP57MzoeZ5
 kJKB3PmCKHEFLnvQhagOb+Yj5R5ym+Cf3OTMYg+aM0lggUkLSgZJz4g5Z6EV9ZrPmiU=
X-Gm-Gg: ASbGncutHBcU0+yvzo8ILpNPDl6cV/kqsIvb/xoaljeh8lDmhe/Jo2ayFJk1FrpEUz7
 sTbRdESvkZD95FXhrjaK4JW4ILqRTndw3QkNEkF6bTJmCQlTpQzIwBVwevTO2lE35LFkXOJxnv0
 NWW9afjjlEHK9zGmoD7UodFiBhNpAOZeTBt49Ebm46rvOJeKOTnHQcQ4Ycs1Wel7hoWxq22SoIW
 5aksEGLIbBWSpg3o0cUXMU5e2K6gkItDFwxQTxA8dAim8exiPRtvNSEnJFyzxHhqsyLgl298gH2
 MoJlzhSy3pBZEWp/m0HWot4ZtIbqphvDl2jQjl4oHq108L4wBi7lBuAiyeWFEiqp4wnLT6vIr5y
 Rs0Nj8P+2uwRCHw==
X-Google-Smtp-Source: AGHT+IGZSD1595IRhzCkXwE5uqQs9xen8XeCh7Rl5YfGMbxAArZX10gWZVWRFhjdeh93Gu/3VP3I1Q==
X-Received: by 2002:a05:600c:a05:b0:450:d4a6:799d with SMTP id
 5b1f17b1804b1-454ec14a434mr22143415e9.7.1752230669493; 
 Fri, 11 Jul 2025 03:44:29 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454dd54115bsm44318175e9.31.2025.07.11.03.44.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:44:29 -0700 (PDT)
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:44:28 +0200
Message-ID: <20250711104428.823021-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250630151412.341903-1-maxime.chevallier@bootlin.com>
References: <20250630151412.341903-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230669; x=1752835469; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FCiaq2zzJ/quemGiSfzo3E6QcTDp4oqaZSycQVNHDFA=;
 b=FZwtVzjClCKbids8WDsdYYEWhU8kA/xElwp+X4rVyNBBa1nMf5gUlv9l15/ZOGxFjX
 sFOEzkCL70lM3hPtpBsTXrAFGqcGvbV0VvIPaar300zYxNogzoKA6EfQZn/rl6dZLXcb
 KvSGxcU3ji4CSsCYJ9FwL2pXL8frR6QAbOGkX2QrKX7ycmQjDQ1xuoQv15N7LsbG+3F0
 zaXMX07FRNttuJdjeS8HO3tp2C3DJKPscTcVjp2Rhhygc17TbKDIOCJjVM1Td1Za5S1U
 B5T2OEG2QMvDKCgFTk0ZzDIJ4BHjPTomnSeo2mP3Jt9wvq3OmdvjKrEXWfjWoaBT1e1B
 wNBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FZwtVzjC
Subject: Re: [Buildroot] [PATCH v2 0/2] package/elfutils: Add missing glibc
 and c++ dependencies for progs
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
> Hi,
> 
> This small series addresses a build issue for the elfutils programs that
> appeared after the bump to 0.192. This release introduced a C++ program
> (srcfiles.cxx), so we now require a C++ toolchain to build the programs.
> 
> As pointed by Yann Morin, the programs also depend on glibc. The first
> patch adds a missing menuconfig comment to explain the glibc dependency,
> and the second one introduces the C++ dependency.
> 
> V1 : https://lists.buildroot.org/pipermail/buildroot/2025-June/781721.html
> 
> Maxime Chevallier (2):
>   package/elfutils: Show a comment explaining that elfutils progs need
>     glibc
>   package/elfutils: elfutils programs now require a c++ toolchain
> 
>  package/elfutils/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> -- 
> 2.49.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

Applied to 2025.02.x & 2025.05.x. Thanks


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
