Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E07DFED3F0
	for <buildroot@archiver.kernel.org>; Fri, 24 Apr 2026 16:26:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03E8E4295F;
	Fri, 24 Apr 2026 16:26:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Dm9nQS3wKGhl; Fri, 24 Apr 2026 16:26:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D942429B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777048009;
	bh=fnwDAA7dRZiAvQjLM5uT0Y4fZYhSzu1TexBqr464fmg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=GLsqRUIobZOIMLDxxx/uu+mRqMPwzEYpzt19gFQvapQkw9Y+FJXAOEzyXp7MRMpqT
	 S6EZz8M0svv7hJt7QwdiD4dDGMKz3/lvSovsZi05KotirBKSBITpeypji1jWLWo7Fo
	 woVOFQWWCE3+Efh39hDKAjTvH0cC298r1qxckPnvdw8AaEq9sAexKQGBQ8D9kurgjR
	 kEFHeFfNntnyU4cvc/2AEzQCQLhYICV4oFdeMEqFoPA+aVyDqHiULngR6DXv3rdRn3
	 ZXya1kWDaccJBFdzBmS4Nb3WH3Bp3jVjxxWjSM2J1KKrtwLlmnmR7Se54mvzOStum0
	 +iyae8m5PvgJg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D942429B7;
	Fri, 24 Apr 2026 16:26:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A403194
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09FCB84E19
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4I2I3Ekm7PIE for <buildroot@buildroot.org>;
 Fri, 24 Apr 2026 16:26:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D6DE584D86
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6DE584D86
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D6DE584D86
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 16:26:43 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-488b0e1b870so131934755e9.2
 for <buildroot@buildroot.org>; Fri, 24 Apr 2026 09:26:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777048002; x=1777652802;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=PEM7z+TsxUoX44y4yFZRZGXWO+MfHj7WsQUd4y5Wyio=;
 b=pj72gOfj8aveASJ6KdqC3PaJoizn7l5O9BL49OWg23uXxZV2JWomJMT9RFkLThNIbi
 /0FAQ3HDQkgOUcCj1cwb6wJm/n1wJzmxG0rxXYKKbYgO4z4z2dzWpSsjSHfbBf2kDA+r
 TOW0IzQGcOMuWECvJ7pcgtJvKCnOey9dJV8FGVTBPt3nkHN6R08h/Co3qEEZHxhZQxcf
 Uq655iPKQScA0Lx4lcoWLX0k0rU6nC7hWxYNEIGJNlX7RO6UttzGgRXMSL63/0Lw33qO
 BsI8UskGBSgtl7M0mHSsSpHiG3bp00sawWLukzwS787H798yvNJpkwHoY/MQAmXOR2oG
 O+6w==
X-Gm-Message-State: AOJu0YwUClUc+iXUBgN+ox6zwrCjbzupq0Uoo/Ky3HtpT+R8UuZ50liO
 x8U3gh/Ls9B3l3iejx/0JTlZRYcCzj3rrOeZY5HegVJmrGz8uv9PmHat3ymRQJqTWns=
X-Gm-Gg: AeBDiesmE0vHLD7uwwj7J9oY1JTFJy3ePvo/0rZi5Dw1RP0l7zeErBj3NZbggiHJdko
 7h3qRg/NHfSazR/4lG+cuzRFnr9t7yfVk3UQY9kt5SyXfB5mRwi0Jb2im99JGHfuAoBto8eD8cV
 Qisdw5HT7zzWJQH2irDCW2x5ZMMd60jRlCWVK+rE728lxsXF0b2Jwv6NVpRyQ15o9zFuYV+4IyY
 UqYhGM+qjp1eEscySG1aksTQN6590AWCvM1EwMMXl5iMk34N1NrACQVscZBBgdnoK+QgeCEMk+l
 0kYniwmbhGpoO/iZRB41ZEU6Fx6tegxN1yknOFY7wYfeNxive9bQ4yeFcG64L95Sg3qLzJ5xbVi
 xUQHd7uQf679hux2oOeiloHu80q8zbTuc5CloXNoek8O4Lekfd3tupgUn2jJzzun4XFy3IxrxOD
 Owciv6kcni50kxg3oVjsLZvFK9rw==
X-Received: by 2002:a05:600c:26d5:b0:489:1c1f:35df with SMTP id
 5b1f17b1804b1-4891c1f3715mr209807425e9.10.1777048001772; 
 Fri, 24 Apr 2026 09:26:41 -0700 (PDT)
Received: from arch ([79.132.248.48]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc0f8188sm636001425e9.2.2026.04.24.09.26.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Apr 2026 09:26:41 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 24 Apr 2026 18:26:40 +0200
Message-ID: <20260424162640.161018-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260417120641.174060-1-thomas.perale@mind.be>
References: <20260417120641.174060-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1777048002; x=1777652802; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PEM7z+TsxUoX44y4yFZRZGXWO+MfHj7WsQUd4y5Wyio=;
 b=eDh2hfOYTmFRmOhyIe+u+vu9PLwk/bczV4aqazgesy0v5rOuCMCpK4Bm+VXSASczh0
 tSd6/R2+qFWzHaImmMCjY7fzpjw/b9aYOQj8ynaJxjU7+1I6RYiv9kYzoQC4H+0duOIm
 HjIkuik7lt9wZbalWaD7b88ylM2QEqU8KAe7pa0nkrmsvSkX5ElhLFNyH7gxyoWxJfSm
 6kNIWW0cRnaJZtr8iuhAhBuNg/CeMJf71+/XLC7iRfaUMX1TBSj0gIL8gWcAMYbkbs3Q
 PNoMLtarzSI6OJRMcLGgA5br6DfZoMdmxfLCN59HJlH6WoMR6k+dHoZjjVDim+T9fTKj
 ydJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eDh2hfOY
Subject: Re: [Buildroot] [PATCH 1/2 2025.02.x] package/xz: add patch trailer
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
> Commit [1] introduced a set of patches to fix CVE-2025-31115.
> Since [2] the security patches neeed to reference the vulnerability with
> the `CVE: ` trailer in the patch header.
> 
> This set of patch is no longer present on master branch with xz bump [3]
> but hasn't been cherry picked to 2025.02.x branch.
> 
> [1] 06c6c49fe8 package/xz: add security patches fixing CVE-2025-31115
> [2] 1167d0ff3d docs/manual: mention CVE trailer
> [3] aaa50b0e61 package/xz: bump to version 5.8.1
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x. Thanks

> ---
>  package/xz/0001-liblzma-mt-dec-Fix-a-comment.patch               | 1 +
>  ...02-liblzma-mt-dec-Simplify-by-removing-the-THR_STOP-sta.patch | 1 +
>  ...03-liblzma-mt-dec-Don-t-free-the-input-buffer-too-early.patch | 1 +
>  ...04-liblzma-mt-dec-Don-t-modify-thr-in_size-in-the-worke.patch | 1 +
>  4 files changed, 4 insertions(+)
> 
> diff --git a/package/xz/0001-liblzma-mt-dec-Fix-a-comment.patch b/package/xz/0001-liblzma-mt-dec-Fix-a-comment.patch
> index 2424fb0d13..41870a8282 100644
> --- a/package/xz/0001-liblzma-mt-dec-Fix-a-comment.patch
> +++ b/package/xz/0001-liblzma-mt-dec-Fix-a-comment.patch
> @@ -5,6 +5,7 @@ Subject: [PATCH] liblzma: mt dec: Fix a comment
>  
>  Reviewed-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
>  Thanks-to: Sam James <sam@gentoo.org>
> +CVE: CVE-2025-31115
>  Upstream: https://github.com/tukaani-project/xz/commit/831b55b971cf579ee16a854f177c36b20d3c6999
>  Signed-off-by: Julien Olivain <ju.o@free.fr>
>  ---
> diff --git a/package/xz/0002-liblzma-mt-dec-Simplify-by-removing-the-THR_STOP-sta.patch b/package/xz/0002-liblzma-mt-dec-Simplify-by-removing-the-THR_STOP-sta.patch
> index 7845380a8c..14985ebc8f 100644
> --- a/package/xz/0002-liblzma-mt-dec-Simplify-by-removing-the-THR_STOP-sta.patch
> +++ b/package/xz/0002-liblzma-mt-dec-Simplify-by-removing-the-THR_STOP-sta.patch
> @@ -12,6 +12,7 @@ called (reinitializing the decoder always calls threads_end()).
>  
>  Reviewed-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
>  Thanks-to: Sam James <sam@gentoo.org>
> +CVE: CVE-2025-31115
>  Upstream: https://github.com/tukaani-project/xz/commit/c0c835964dfaeb2513a3c0bdb642105152fe9f34
>  Signed-off-by: Julien Olivain <ju.o@free.fr>
>  ---
> diff --git a/package/xz/0003-liblzma-mt-dec-Don-t-free-the-input-buffer-too-early.patch b/package/xz/0003-liblzma-mt-dec-Don-t-free-the-input-buffer-too-early.patch
> index 9915e6b275..d370d8b613 100644
> --- a/package/xz/0003-liblzma-mt-dec-Don-t-free-the-input-buffer-too-early.patch
> +++ b/package/xz/0003-liblzma-mt-dec-Don-t-free-the-input-buffer-too-early.patch
> @@ -26,6 +26,7 @@ Fixes: 4cce3e27f529 ("liblzma: Add threaded .xz decompressor.")
>  Reported-by: Harri K. Koskinen <x64nop@nannu.org>
>  Reviewed-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
>  Thanks-to: Sam James <sam@gentoo.org>
> +CVE: CVE-2025-31115
>  Upstream: https://github.com/tukaani-project/xz/commit/d5a2ffe41bb77b918a8c96084885d4dbe4bf6480
>  Signed-off-by: Julien Olivain <ju.o@free.fr>
>  ---
> diff --git a/package/xz/0004-liblzma-mt-dec-Don-t-modify-thr-in_size-in-the-worke.patch b/package/xz/0004-liblzma-mt-dec-Don-t-modify-thr-in_size-in-the-worke.patch
> index 1a914e08db..b3fd11b29d 100644
> --- a/package/xz/0004-liblzma-mt-dec-Don-t-modify-thr-in_size-in-the-worke.patch
> +++ b/package/xz/0004-liblzma-mt-dec-Don-t-modify-thr-in_size-in-the-worke.patch
> @@ -21,6 +21,7 @@ Block before the worker thread is activated.
>  Fixes: 4cce3e27f529 ("liblzma: Add threaded .xz decompressor.")
>  Reviewed-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
>  Thanks-to: Sam James <sam@gentoo.org>
> +CVE: CVE-2025-31115
>  Upstream: https://github.com/tukaani-project/xz/commit/8188048854e8d11071b8a50d093c74f4c030acc9
>  Signed-off-by: Julien Olivain <ju.o@free.fr>
>  ---
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
