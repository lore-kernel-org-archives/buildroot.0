Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8CFCCD18D
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 14:55:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3600D6131A;
	Thu,  9 Oct 2025 14:55:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id khAPLeOJqVsS; Thu,  9 Oct 2025 14:55:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 539F2612E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 539F2612E4;
	Thu,  9 Oct 2025 14:55:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B380521B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 837B4410E3
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rtf2Nn3yMHFr for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 14:54:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5E105410BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5E105410BB
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E105410BB
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:54:54 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-46e6a6a5e42so5520535e9.0
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 07:54:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760021692; x=1760626492;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=++3aBzTI0AEM7MhvmqAnXSZ/MByTceNAg4cHA3h8Sqk=;
 b=LzP3ADhnc8Nzagaic7gTigkEdKNYoZ5c9rxzyX/i+4NGq2wEyR5LMiykXl+tKEL7AS
 tGL3RmB2YlR5B0mfnxol4mNml9bGW3Nek2YgSnqgwtDWxczLnkOqKzq6adQNeiw10xBc
 ZdH2nirS/vGWUfKir8GFngLEhQXl5r/KF1t8Y7/I35DJ/hCX0z2CXDv670TRrJ82ni2q
 ZLo1Nrx4Sinh4LR2j3GsS42kOgI5pJtHqv48zUiScZu0OmZXDr2iXZINmvvntqujsXIG
 8TKVP0ozbDUOlFjjNNAffJRUd8/rFQExShGVsEt+Lvm+SdYfE5nlMmPAQLHO/8oH0Iej
 joyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoJPFhRl/b2H11+cs7vBBkcYG9/dPUt6PePIm5b38MlXm3quiXrVrGpqP1uunFLBFnTU+QPDJ6NLw=@buildroot.org
X-Gm-Message-State: AOJu0YxpqVFrUZ2OvBC772gU5wT4rdUQTtmY0KUegQqNqiwVuwyjT2mk
 LHNMBfwXQWVkKUIacVJ7rReJvoeMVYS0HlmvMhbvkwo+iDLlI9zbXBT2FuQGo6HeliI=
X-Gm-Gg: ASbGncs1ZQCbyWJjKrv2GmrX1Nv6JxFiTIz0Y/Emu/yeoQtUkSsI0FBPq1ZMiv2L6uD
 om1uP1SQlw+A1AMZ1twSnzbhzs/PBL33/pbLPR6WmwGjIv5XJ+3eN4OpkS6sk59RdxFS0QuGyGG
 hmPdZZ7HPoVVyai6Wr3frj5sEnyPN6nF2j8KtZW+0YaZi46J5/VfQT1KWQjprRC9iB0KGWpDeYE
 HAyhsfbWegjYAQdrT8XWwp/Np6qyZqEIauiNCKOLvZSDQ3BW/4lrV5T9gHKC6IUtaOFolT+JJn8
 8wcvMpMt2hLIQTBTdBuX8JVzCUSX3ujWvh/c9Bz6XgWFXUQrdxym25PhcgJbAnbKkSx/KnkOi2O
 tQdVUpbEXOvfZH0bTRtZ4AsWL0H6r866unkDkasIi
X-Google-Smtp-Source: AGHT+IHQeWP15yK6uxZZzV/8/MVomVbfUdGAyXHdpu6fDxKskh9ET8FIHeoRW+wVi5Nat7JHXZcRGQ==
X-Received: by 2002:a05:600c:6304:b0:46f:b42e:e361 with SMTP id
 5b1f17b1804b1-46fb42ee3camr5058275e9.41.1760021692266; 
 Thu, 09 Oct 2025 07:54:52 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb483c7e0sm1294115e9.7.2025.10.09.07.54.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 07:54:52 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu,  9 Oct 2025 16:54:51 +0200
Message-ID: <20251009145451.482843-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251004122113.2161276-3-bernd@kuhls.net>
References: <20251004122113.2161276-3-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760021692; x=1760626492; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=++3aBzTI0AEM7MhvmqAnXSZ/MByTceNAg4cHA3h8Sqk=;
 b=IyxDkrqPAGtGvvkPWXSApR/fojpTZ2FPDaNtbS7Si7sVAGKYPs9EQHXLyKfMJsDuRR
 AMjr+OmMP4DZAm85bkgfuPJ311ELrVlnLuF18aSly46Am1NgZXculyuoxpMIeDzXJCXH
 2+XW2eKeN98yn3GVzcLMCD7mSI0IHVrnkSmC7XyiKatfLl0PM8S6uZoluyJCK4yNbFfY
 v4/Yhx41Z5kMkz4iH2B1EkyUYFbW1uXvVckxAscvKQTfa05UbVyJB72OiDMkVv9EovUW
 LBRr7aypCx+Dax0Jb5yeh0NZg58CCZHG1MY9bpr2YEd3GTVNLVFZMKigdcmqe+TRBTUJ
 fZrQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IyxDkrqP
Subject: Re: [Buildroot] [PATCH 3/3] package/gnupg2: bump to version 2.4.8
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
> Release notes:
> https://lists.gnupg.org/pipermail/gnupg-announce/2025q3/000496.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x, 2025.05.x & 2025.08.x. Thanks

> ---
>  package/gnupg2/gnupg2.hash | 4 ++--
>  package/gnupg2/gnupg2.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/gnupg2/gnupg2.hash b/package/gnupg2/gnupg2.hash
> index 6a34f2a1ce..01060f897b 100644
> --- a/package/gnupg2/gnupg2.hash
> +++ b/package/gnupg2/gnupg2.hash
> @@ -1,5 +1,5 @@
>  # From https://www.gnupg.org/download/integrity_check.html
> -sha1  2d510a1a7294f2f9ef3f2e280c93c3ad9b0cdb68  gnupg-2.4.7.tar.bz2
> -sha256  7b24706e4da7e0e3b06ca068231027401f238102c41c909631349dcc3b85eb46  gnupg-2.4.7.tar.bz2
> +sha1  c704085aa7cc131a67edd0b7c0c90e5c35ee4adb  gnupg-2.4.8.tar.bz2
> +sha256  b58c80d79b04d3243ff49c1c3fc6b5f83138eb3784689563bcdd060595318616  gnupg-2.4.8.tar.bz2
>  # Locally calculated
>  sha256  bc2d6664f6276fa0a72d57633b3ae68dc7dcb677b71018bf08c8e93e509f1357  COPYING
> diff --git a/package/gnupg2/gnupg2.mk b/package/gnupg2/gnupg2.mk
> index d98829ca80..debf15ef63 100644
> --- a/package/gnupg2/gnupg2.mk
> +++ b/package/gnupg2/gnupg2.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GNUPG2_VERSION = 2.4.7
> +GNUPG2_VERSION = 2.4.8
>  GNUPG2_SOURCE = gnupg-$(GNUPG2_VERSION).tar.bz2
>  GNUPG2_SITE = https://gnupg.org/ftp/gcrypt/gnupg
>  GNUPG2_LICENSE = GPL-3.0+
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
