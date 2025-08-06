Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C52AAC87FD3
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 20:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8305283F4E;
	Wed,  6 Aug 2025 20:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZoFrgUZl2UZE; Wed,  6 Aug 2025 20:24:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9991383E11
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9991383E11;
	Wed,  6 Aug 2025 20:24:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 66E0ED79
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 20:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58E1061CC7
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 20:24:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nUaEr3UNHbB5 for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 20:24:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2AC3060E93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AC3060E93
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2AC3060E93
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 20:24:56 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3b79bd3b1f7so112021f8f.1
 for <buildroot@buildroot.org>; Wed, 06 Aug 2025 13:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754511894; x=1755116694;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0cX3RKhgch4PJgxqUXlotbZJw6UCRX7w9RVbW0gAYcg=;
 b=g5orQn/9mG/yDCOs1R5SxiBKWsDcxkCzgwLvv75F5wD3iH0HXUKgo9KON55iF7x1zc
 b1jbH6SuYD1/oXY2vyNOq4i2g7sysyBU8eBZOYAv3ObTWsFnCsINvX46EyLwRYW9fsPX
 sCcFsK7dEraM1WLWeiMGZvbMXF8vjDXXnjlFjUATEh8wFAa5sGWdO1qezQgWjPfthx5j
 xV8bI3EQl3cvuYygPh4GqFNZXIW/kgfY8i3E+uTA/RAfqz9XvKPl7dSHYYgnpE4E/gaU
 jAKfkL4xVVXJ4a1b6aYR4xf6PgjKIzS1pLbqS3NmelGg+k/VBZBm6Jidkc87JdtwmEAe
 q+yQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUobcKqCyE/bF/i9OO0jXyEZYlSpkyP5tXVgE3XN3d88SVXKJBlVe2w8zreM29W7hewjCtYjHk3Ee0=@buildroot.org
X-Gm-Message-State: AOJu0YwNMJnX6ZYgCoU/WGZ7DvJ29LkMSK1WPD60+jwJRZqozqUsEqlG
 jvgrS/rKxPMLY6x5Rbul7xwLHVHs14uxKsU36GdZMMlydkvMwSk18Qj5YqWdFb0HD9QC5WC//W3
 J9WUy
X-Gm-Gg: ASbGncsIzoQg7N5gygzE0KvZ/3NdBkkNur4YUR3zXeyiNA7p32ulVM4w9zZEibr3HhG
 BO06ifwVxwY8cwUK2GwkY10+dECjQ0gsjDVFHoL/JyEWC3HpGE1kZ29NAAwZr8eg5fpK+qFgf1y
 BZ9CNDnEDeTK/k1XHbeSJz9JWYKeT3JaRpR36Rw+sq6p/V+BeZg2whJ5y7ZuqdEVMwMzra4jhyY
 mFVAF1cZRa6WyXBktwq/HmY05mAmM4jG/slA/wuOirR6dTA7MgI+9X4ZESpeCJVfGg4jEgJJwWu
 DgJqyOPrVuY7tjCKcLI5OlPaEPzA0sb/tUuTs40HODVTvPL9sbMnS4vNs+vgbvNiRi7tr+8yHVv
 US/M3zJ5HOmT0Fqha/f4vOsSQ
X-Google-Smtp-Source: AGHT+IE8aVW0mGMvcBMMFXQ93bjDAiNSiJbfOgcfLO6cvttKl5vSoNi9lKiTy72sXLvgJZJKHL6AcA==
X-Received: by 2002:a05:6000:24c7:b0:3b7:7cb3:1124 with SMTP id
 ffacd0b85a97d-3b8f418b44emr3836630f8f.11.1754511894063; 
 Wed, 06 Aug 2025 13:24:54 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c3bf93dsm24204559f8f.27.2025.08.06.13.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 13:24:53 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
 Thomas Perale via buildroot <buildroot@buildroot.org>
Date: Wed,  6 Aug 2025 22:24:53 +0200
Message-ID: <20250806202453.627084-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <87zfccgr8a.fsf@dell.be.48ers.dk>
References: <87zfccgr8a.fsf@dell.be.48ers.dk>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1754511894; x=1755116694; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0cX3RKhgch4PJgxqUXlotbZJw6UCRX7w9RVbW0gAYcg=;
 b=O9knzZxsK0HZhVrJ/WyOIZyDCEuy3LtGRXguYpfOclMT5RwYo994mk94IbdBZhWMLQ
 BMAAXFLVJMpUWKFGnypS8K2rRhG1AqlIDgifb5xZPcIqYEK4Y5A5hgIGyN0sCfPV1k0q
 CG5iIl0LD1Z9ZlX/sUDsgEKflehoRAPTqNDxhEZXR4kWbJ/eSN+bAw2tXw3zsXaFGXyY
 z1tbyzoGASPgCab5bVf9pEVawfuYMp2N7xXoUJvxf3Bq0Cp7/d061HMmjBiLTBUdAC8s
 8Ww9Q9rEODmrSb63+InWpf95dMPSKXndyTUF6BZNr8JtW9owrbRnNnSHt4odVF/D7B9c
 SNKA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=O9knzZxs
Subject: Re: [Buildroot] [PATCH 1/2] package/tiff: add patch to fix
 CVE-2025-8176
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
> >>>>> "Thomas" == Thomas Perale via buildroot <buildroot@buildroot.org> writes:
> 
>  > Fix the following vulnerability:
>  > - CVE-2025-8176
> 
>  >     A vulnerability was found in LibTIFF up to 4.7.0. It has been declared
>  >     as critical. This vulnerability affects the function get_histogram of
>  >     the file tools/tiffmedian.c. The manipulation leads to use after free.
>  >     The attack needs to be approached locally. The exploit has been
>  >     disclosed to the public and may be used. The patch is identified as
>  >     fe10872e53efba9cc36c66ac4ab3b41a839d5172. It is recommended to apply a
>  >     patch to fix this issue.
> 
>  > For more information, see:
>  >   - https://www.cve.org/CVERecord?id=CVE-2025-8176
>  >   - https://gitlab.com/libtiff/libtiff/-/merge_requests/727
> 
>  > Signed-off-by: Thomas Perale <thomas.perale@mind.be>
>  > ---
>  >  ...ip-the-first-line-of-the-input-image.patch | 116 ++++++++++++++++++
>  >  package/tiff/tiff.mk                          |   3 +
>  >  2 files changed, 119 insertions(+)
>  >  create mode 100644 package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch
> 
>  > diff --git a/package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch b/package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch
>  > new file mode 100644
>  > index 0000000000..3bc0f26772
>  > --- /dev/null
>  > +++ b/package/tiff/0001-don-t-skip-the-first-line-of-the-input-image.patch
>  > @@ -0,0 +1,116 @@
>  > +From 3994cf3b3bc6b54c32f240ca5a412cffa11633fa Mon Sep 17 00:00:00 2001
> ..
>  > +From ce46f002eca4148497363f80fab33f9396bcbeda Mon Sep 17 00:00:00 2001
> 
> While it probably works to concatenate 3 commits into a single patch,
> that is not how we normally do it here. I would prefer to see the 3
> upstream commits as 3 separate patches.

Hi,

I sent a v2 that splitted the patches
https://lore.kernel.org/r/<20250806202029.625736-1-thomas.perale@mind.be> 
I forgot last minute to add the v2 header sorry.

I may have sent patches that were bundled in the patch, I need to check.

Regards,
Thomas

> 
> -- 
> Bye, Peter Korsgaard
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
