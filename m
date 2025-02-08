Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113AFC02198
	for <buildroot@archiver.kernel.org>; Sat,  8 Feb 2025 04:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 828A64297A;
	Sat,  8 Feb 2025 04:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K9EkGNcEtq0s; Sat,  8 Feb 2025 04:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5179D4295D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5179D4295D;
	Sat,  8 Feb 2025 04:46:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F96B1B5
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 04:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EF8EF40481
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 04:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jf7OMwyRH_ZG for <buildroot@buildroot.org>;
 Sat,  8 Feb 2025 04:46:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com;
 envelope-from=petr.vorel@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9E86340287
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E86340287
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E86340287
 for <buildroot@buildroot.org>; Sat,  8 Feb 2025 04:46:41 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5de4a8b4f86so2037989a12.2
 for <buildroot@buildroot.org>; Fri, 07 Feb 2025 20:46:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738989999; x=1739594799;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rhIBbtyCOpbH8xjJL3abH3TajT3PVlKxfeWbDpG5sWI=;
 b=XFPl5efJXWiqT4Xemdg7FJ0dxZEFS+Dufh49JspCXN+XukExZPCBJYGNNkBZOFJog+
 /LfE6tvAJB+ibSKtASPeCxWum0PVOa5k8X5nyjE+AE5TafXtclP4jnnSUuc2zznmbXcD
 sOZj7M7JwTEGXehZ8zMkZ/GUn9/gYARtGvaR1lYUOkqRxmbrI8UN/vk9DXluLlX1slWl
 tl8+F2sQR37di8lTFjMwJ4bY+lFOKNDlZj+IoGtyWRG4PPmfvBhvPqt53YGcGIos3fdA
 RM0WgGTg6nDT2PoOY/QzeuKSFG4mQxxUWDIF0BZ4vpy6JxlhWpb01llK2PdTFUjdruK3
 4Sfw==
X-Gm-Message-State: AOJu0YwLQIkXzngF9w2Sf2uYQyWvJpRlHWV0NPMRCME13ftWmkzos0Xo
 yzN6PBqqhtba75Wektq5suSrkBAKkkTHS0GconTtXl9wnSFs/rx/
X-Gm-Gg: ASbGncvmwpTwgmEoRWIyHFcVyK8XoDGgIX74uXGD2gIKjc23ntMMCMO63ZUFYaLFKKM
 K8m+V5m7iKogsrvZUL8G8+/lK+suy9FvmAGrZr/H16EHFsohdJvApdpWEdR4kuIKyhjc+M7l5tm
 1zIE2JURzBaKh5+XNLrdqfQv2EPRGge5rBR4egXE4z5pKnWubfUqKhPRr0lcfy19mxGrZohH+K+
 T81K09cPORZF5ss7mz2b96tqi3EoJ4mvkcSIsV71+muOjyzaZHlBow0oPgwFhu75BHkAfAxPVUL
 1TPp1p6+RZWvmoE/jjdw
X-Google-Smtp-Source: AGHT+IHBSlPvY5IahsTaY+HiXX6KqazpdAw+83TyK+Z9g7Xs+SjVrLhNa+nXvEiNx4vT6TMUkP/LFg==
X-Received: by 2002:a50:aad0:0:b0:5db:da94:6e7e with SMTP id
 4fb4d7f45d1cf-5de45073388mr5343682a12.24.1738989999397; 
 Fri, 07 Feb 2025 20:46:39 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5de52712538sm1371520a12.49.2025.02.07.20.46.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2025 20:46:38 -0800 (PST)
Date: Sat, 8 Feb 2025 05:46:34 +0100
From: Petr Vorel <petr.vorel@gmail.com>
To: Buildroot Notifications <buildroot.notifications@gmail.com>
Cc: buildroot@buildroot.org, Nadav Tasher <tashernadav@gmail.com>
Message-ID: <20250208044634.GA1770044@pevik>
References: <67a6da1d.170a0220.15dee9.b177@mx.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <67a6da1d.170a0220.15dee9.b177@mx.google.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738989999; x=1739594799; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:reply-to
 :message-id:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rhIBbtyCOpbH8xjJL3abH3TajT3PVlKxfeWbDpG5sWI=;
 b=WlNK+plkvFoANKG3cEqaa9TsmxD77RiQFjHOBQxe8kVvVndQGuaqt0nZRDd/1h9Cpw
 0EcRU3q878G9c3yo8x2Bio1h8/AkTe2/pXa0mzi9OpAbaoxcc78n19XfoYF6qJ4FW+Ox
 vDdnp/cv1vRj6Z3TIwLO4A5lcwj09qzJshxay9VOGeqypP5pLvFk9CnShmaCcN3eDM7A
 aw5Jn5nZ30JWtE6FLLgsM/7LI37mIvEAIet63c/+v5/89cu0W+BPd1oV2ZnAA/wDnGNd
 Q7PiGmu1tZMpnAoN98obVT0aIQ8OqL/xOd33PugErWlHHUNARgNV2eWDKq0GCONw9j6W
 UWSA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WlNK+plk
Subject: Re: [Buildroot] [autobuild.buildroot.org] Your daily results for
 2025-02-07
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

Hi all,

> Hello,

> Autobuilder failures
> ====================

> Below is a list of build failures reported by the Buildroot autobuilders
> in relation to packages or CPU architectures you are in charge of.
> Please help us improving the quality of Buildroot by investigating those
> build failures and sending patches to fix them.

> Results for the 'master' branch
> -------------------------------

> Build failures related to your packages:

>     arch     |             reason             |                                       url                                      
> -------------+--------------------------------+---------------------------------------------------------------------------------
>     arc      |     ltp-testsuite-20250130     | https://autobuild.buildroot.org/results/609697d89e0c5948842c7c0e5dcec4d93be3258e
>    arceb     |     ltp-testsuite-20250130     | https://autobuild.buildroot.org/results/8814f6f166ad6ddd58e8627964d147ecfff4d76f
>    xtensa    |     ltp-testsuite-20250130     | https://autobuild.buildroot.org/results/05728d3609553a0b78875d62adb88cccb43e00ed

All are uclibc-ng, problem. Nadav suggests [1] it's caused by the fact that time64
on 32-bit targets is not supported on Linux < 5.1.0. I'm not sure why this is
just on uclibc-ng. Should I bump min kernel headers for uclibc-ng >= 5.1.0?

Kind regards,
Petr

[1] https://lore.kernel.org/ltp/Z5q7NwweeZ0iNlzc@nadav-dell/

> Thanks for your contribution to Buildroot!
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
