Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42245C7EE31
	for <buildroot@archiver.kernel.org>; Fri, 27 Jun 2025 12:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03C78612A5;
	Fri, 27 Jun 2025 12:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zw6fnrnAWbge; Fri, 27 Jun 2025 12:21:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C30660B99
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C30660B99;
	Fri, 27 Jun 2025 12:21:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FD4911A
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 12:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D10040445
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 12:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aj_zRq6JrKjh for <buildroot@buildroot.org>;
 Fri, 27 Jun 2025 12:21:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7109F414EF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7109F414EF
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7109F414EF
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 12:21:06 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3a536ecbf6fso1220628f8f.2
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 05:21:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751026864; x=1751631664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FIjelYtYxnu9bZwbMwuxN3wPUCFHi8vRIZ15fYDycOg=;
 b=EuVbRNW5iA+nB91Mk3aPs6CA9kZaRjW4iyzgvuICkBLMsGNGBNhc1hLBghF7pYmBUd
 ctq46gBsLZpZikSvMJGq3NVj2lGfXyTm8zM3cncW4QxeDEjqUp+FqHy5KUys/CfZ0wjZ
 aP3+T2GqxxqqOEQ4a6bIanaCnncUhI+rovGJA8Hz+HU5INIyOmO3yo1fxKIZ3NzHKrUI
 VWfjw27p2955dm2gu1guWDEktE2eDXkzVQ1lC0aRzbEItpZLIoOPxFCDlXr3OxtHpek9
 uz7v2v3DMGX6IkI6McPHPQmAjkcqP287Mo3iH+9TX1buOLMmJX3vWKdsxinM5seh7NEl
 +9uA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHaV8tapBHZc0blPIyRIvYBSbYxfp2/8q8gMTeDlJPcY6RlgUpJoF+IRY5EM7mdBu7hG+up5bG8/w=@buildroot.org
X-Gm-Message-State: AOJu0YxmObKkv1tCqP/Pm/Zf77gHIFe02tAI/ImKSnOh9dAuJ6v/3Qjr
 OkzB+z8dVv66PWPq7SSnmoXcqp1GZdSnolaIKsq+gdloVsZWSxJkpjL3JR42ON+YAYk=
X-Gm-Gg: ASbGncsCk9gc/ZHV2D00luIQYN44p5iXJGq82HOYGe1iSO6GUZ8mXJWv44Gle4efu7S
 FvrJmWkLSCLj2bK/kg8LVAlVFaWtyADhIU7z2WanI74DfTQ/hVSHjCik8eCNliQ2+e7Kcpb3Wnx
 eOfl8Ti6+jSMiSaxoPM9E65JS5vQNDzwNma7ZyTQ1Mtt9VHQ4f+D521D2Wc1jGbKs2F7z0xzA/l
 8+MMVE2JLsEs9QZlx9xRa06UoDKtof0mwur2Ji3qcjc2m2FPtVwTZB2yJYtmOgJ4KUxtkhHu1wl
 KYEol3EbSqz1NYqHHe7t8Axj2KQIGOCp5/CYTyj5BXH1aXymqCJQLAeHV8Qlg7RMhTBmxifrxI0
 TRZOoTEvMcq0A5BDP46PyA9FBsKdpczKF
X-Google-Smtp-Source: AGHT+IHBS2rB55sQgaiVfw7H0nrs8DClUqczJe9lrd9s1jdmWYTaQHSJUCIVcAsWMD3kDO27n1VhmA==
X-Received: by 2002:a05:6000:250a:b0:3a5:1f2:68f3 with SMTP id
 ffacd0b85a97d-3a90b6dfac9mr2547731f8f.46.1751026864345; 
 Fri, 27 Jun 2025 05:21:04 -0700 (PDT)
Received: from localhost.localdomain (94.105.118.175.dyn.edpnet.net.
 [94.105.118.175]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a892e59aaasm2503625f8f.83.2025.06.27.05.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 05:21:03 -0700 (PDT)
To: Fred Lefranc <fred.lefranc.evs@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 27 Jun 2025 14:20:54 +0200
Message-ID: <20250627122054.137383-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <CAGkXw1WepD3JC0zTr7be8q2gb03E65djQRmX=khynufoPfsoCw@mail.gmail.com>
References: <CAGkXw1WepD3JC0zTr7be8q2gb03E65djQRmX=khynufoPfsoCw@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751026864; x=1751631664; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FIjelYtYxnu9bZwbMwuxN3wPUCFHi8vRIZ15fYDycOg=;
 b=ThoehoCJbXmLtlfXSSYc5jMe+zofKqzanIM1ei25n2w6ImcS9495it+YlWcGo2uXmY
 oWmwQFCkeD2PtGggpDGqxPlylwvgKroE8yAegucwd6NBoULZRnhBllUBEFiGWJi0BEOI
 SAuYdBPUljIp3QFW26jmsT1yf+RCVVwb5ni/kJLEbeOQMrK97SYq08mBdRnSbwPFCnm2
 6aovDMPWmfb+iJrx0fH1Pf1CG5vHCJPLFD5aUzhN9X8Z48/+ZslNcEG4oAIcLbsp8ud5
 oaw6hSwYulWMFG8v1L0h1jzETGbX/QkBnBUrvimRgJyDWahD8cj2c58OJGgStmfafLV8
 Zozg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=ThoehoCJ
Subject: Re: [Buildroot] [PATCH 2025.02.x] package/haproxy: bump version to
 2.6.22
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

Hi Fred,

> Changelog: http://www.haproxy.org/download/2.6/src/CHANGELOG
> Signed-off-by: Fred Lefranc <fred.lefranc+evs@gmail.com>

I applied your changes to the 2025.02.x branch. I think something went wrong
with the generation of the patch though, the 'hashes' were splitted over
multiple lines.

Thanks a lot,
Thomas

> ---
>  package/haproxy/haproxy.hash | 4 ++--
>  package/haproxy/haproxy.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
> index 74390c2ff5..42f340fa80 100644
> --- a/package/haproxy/haproxy.hash
> +++ b/package/haproxy/haproxy.hash
> @@ -1,5 +1,5 @@
> -# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.15.tar.gz.sha256
> -sha256  41f8e1695e92fafdffe39690a68993f1a0f5f7f06931a99e9a153f749ea39cfd
>  haproxy-2.6.15.tar.gz
> +# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.22.tar.gz.sha256
> +sha256  4c0797f450f997dc287d2c7aafa7a0e5b7a2d71593a2cd58e664e8f3aea614fa
>  haproxy-2.6.22.tar.gz
>  # Locally computed:
>  sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28
>  LICENSE
>  sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a
>  doc/lgpl.txt
> diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
> index 61a9ebebe4..77195d966b 100644
> --- a/package/haproxy/haproxy.mk
> +++ b/package/haproxy/haproxy.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
> 
>  HAPROXY_VERSION_MAJOR = 2.6
> -HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).15
> +HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).22
>  HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
>  HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
>  HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
> --
> 2.25.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
