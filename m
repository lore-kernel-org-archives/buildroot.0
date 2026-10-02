Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68D41CA5FE0
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 10:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CE8D60629;
	Fri,  2 Oct 2026 10:33:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xd5L9bE3iU3p; Fri,  2 Oct 2026 10:32:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 260BE607FF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790937179;
	b=TnmeNz7B2/JJW9exQvL0SR8whFI/Cy9358wzsLn8zIqb34MmM/su2UxKuKLK3lG3KCON
	 8mCCyddGGhnIn/rLlf+zjyFDkxIzvUFpuhJ1eMeqG0vWNrQBKbDUx2Q7MXw0FmZxhXoG0
	 YIw19yZetz0vzh5QjlQqhR9GZwC8v/CZ6Pd6ERsSabhsN4wV8K3t7OzsxbZR7LKfSQmMP
	 cP3xBZGa8YenoLtGf86lQ4r6NBFkTRj0x5nG2gLpkJMxJ/Huzm742oW55njIV3DgUWzqT
	 isvGncMlfGAnGuGsffH+Oyqz4YAevvPwnQpl4z2e17obHKRT/RWA1eHPbCEmC9FSFRA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790937179;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=6DaMtd/fWhn5/39TSJVBF+gb6PFbJOlDsxEIdABgCuw=;
	b=grxSZS/OmfXzQSczNu2iZsR5DKQgPVBYDPyPU91CFeyaDNJiqv16LUEu812fhj+9mtUD
	 FTu4MCR1s3ATnOgiRjf3CfwjPaXWV/GVzOPH9ndJbQIIeIf3R+A+iKyFhTLoeUUXQ1Eix
	 5WdJYiXqR9whkMStGyflA91fYhBXNzXeoQPGZW8isZMsWLbqz8FbsmyQt9cN+KUPm+v85
	 yTbanshP6b/5y7j1vYMnZ0Mg6yBD4ceecmFBtQshGN2KVeD7fk6rVXcVAwe8VunSHjQyn
	 RY+U6lohbwo3VvrmSzNdFHgVpaC6cPchuIUWaxnFwXWJIuZQlvczcLk7z/4dw6Ml81A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790937179;
	bh=6DaMtd/fWhn5/39TSJVBF+gb6PFbJOlDsxEIdABgCuw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Y/vt4mn0vNMMaxCRh6uxLZFrTcIVpbwi/XQFUMfGCBGD37LmKgM5DOiDbtizkTpMp
	 XQPpImKHXNtZ6qv2LRFnSblLHn81TRIMGUFY+VavsVYAqoG0kSo+3F5axQBsK2XATm
	 cVvHFI+tyZ9eSeA1FxbZ4rW5sBV4sNA+AnOnwf3RKSlxQukzIsK7qz36QQ9g9hTld1
	 MLSLcwaFMC8AfqFL8eIMtxRj6Qacx4EO0EAXtluaSYPqtqxkTuW4b+V7QpZ7dhDxgx
	 l8x12k75Et7Yc5bUmIUzY8lbSUdjx7IKYsB6Ftwe5K4KwOxgtNwpF5rA3kzpscZAq8
	 rBbG6KFwZiUhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 260BE607FF;
	Fri,  2 Oct 2026 10:32:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E7CA4DA0
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:32:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E5DC60629
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gsIr6oUcGrH5 for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 10:32:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CD2E46061C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790937173;
 b=Gj/sPOBFHGa9BqHqhaRM3wzB8vNCs3fLgw3vJviT8pqVAvysUvGqePcOJ3PX24hLocXO
 wqhQ0shoXXLY48ifG/FljwPjuI0oR/I7XR4ttpHjwRdX3+FX8PoxoD23Kw7lV2zrZOrB1
 HplRtw6AqP/O2ifNpPsg6Tcxmf7xk/iLwq+JMZlMJAxiU1mZGJzAeCGhDCWcBUDqFja7V
 Pw5QcDItjwEMpft8iioDUinJL7MOCNcvLOfWX8KPZVvKIwB4W3WN/+vrexKDJy/C81RxG
 dVHD78DP8g4Qj/sQXfUlSwnDYCa8HtfnUGGL9Ts92GMG75KuFW4iFSpamBl8tGjKwGQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790937173;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=CW3SLGDr5D/Q2PHD8PvmpjM9UCKseMXe58oU0UtQeLY=;
 b=dDOi/MC2h30uuC6xA/9+lEi1/Orz4k7ieM/1G/JowEJOAynOSMkbP/5YbnE3k7tP8i1i
 2KOQr8IbajeaRoRayNGaXKFwUXV+YFtBXrXQX0SmtwRKh7FQ6gR+szt40Dh1u6JsxA68J
 syMy61Gq/eAMAkOTPIDhtyfqTBLT7BKJgpermG/G4xVXzSuYqTBnwsSThS6boouwAKhoY
 p6s1RdBXEQyQ+w96r2WsaAQ+b/e/uY6sZZiy2uYUdEp2rRDGxdq2BDwKKUybqIA04RbGb
 6c1KVM8QCEMSj1blf6EQcSwGxb/vx08Jii2GJ1y3+Mitu7RRJ3v49TMz2Ze/dZs5GWA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=dOKhBfFC; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::f"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a00:1450:4864:30::f;
 helo=mail-wr2-x0f.google.com; envelope-from=raphael.melotte@essensium.com;
 receiver=<UNKNOWN> 
Received: from mail-wr2-x0f.google.com (mail-wr2-x0f.google.com
 [IPv6:2a00:1450:4864:30::f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CD2E46061C
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 10:32:52 +0000 (UTC)
Received: by mail-wr2-x0f.google.com with SMTP id
 ffacd0b85a97d-4887840c529so2564737f8f.1
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 03:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790937170; x=1791541970;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=CW3SLGDr5D/Q2PHD8PvmpjM9UCKseMXe58oU0UtQeLY=;
 b=fBrnfMXbsfV3rhvSoCoVa/1ahAdS/AF6Wrnsehp148SSfB/VNcBMOFO9m9w2qOhCsn
 1kyziDjhtKg9dgwIS+r6Qcoc5BIcEdkDoz5+pA3QZl5NHTbsp9I6R0QzB6Z9Fpzj3ATz
 zo0zChNs+eLZ0kuqXmDKC3jixekNFKaMzm9ACIf8Y3h2inBqZ3VYZRdFDTYnB3BSBvIF
 zn4UjasoifFcviiet6UJMjm0LG+6NtNiSBxiIpDe7lGZTIPAe5v7pnPwuFhsSgtlg1ji
 rFabjzD98KtfUCvSWFfjwSn+5Xm4G6cukMeL0osY59kNtp7rzuBc7yLLKng2NaJHYVRh
 Qn4w==
X-Gm-Message-State: AFuF++mx8fVN6+Q1MHK8lKMkGEPe/WSSGxqF8xqhwV7s8qBxZsC7nI18
 q/+Q8UHE+iw8mao+cfKJCpTvlpKb9vKJncut9EUYOMeRkPbFVBv1JtZQ5czadFBW3YNQ3rv3eCI
 x18JnELY=
X-Gm-Gg: AYBFou2pwTtc9XP22Yn4ukAyJKr2QLFLPhZ8WcN9btfZi9sKm97DMr95hcz1Y0f8lCg
 kMN++uaUUAyFyKCKJKPH/mptXmv5KwJF42SLjCTZxZ6+LCDJgDwgPxDT0gf2FTJ/69x16a/LLlV
 iXJArbUuQfFYWe0eofovvSQgsWx6cAzz24qCwGr1xg7GjVZJksQSLCFuHxtsEw9XR1Reix+AOGD
 4bfHYhL7QnN/yXCwX+cBO6iA93i4Jizbabxv+a//05c7F+jqEWoqthtAOwmhrbC3J1gE0YktOzK
 UWmUI8QWMKB5O2Won1mmd9oIpmPodJoTm4FGVwQgzPSZCWqrCJdN+1uadRO0wTMXlnVYSTFXiZL
 DTRKsTFzolM/CrB5VHI29l2S4pi/fY4hKDudC6uMboEzF1syaoqS3EqO1ZBy8335fGV46LagrbA
 JANqvTTuEVelziQVBRn++0ser78bZXFSVPAuGWQxDhMNTiziRoCV6bykamYe/5reB+WAWFAcN7/
 1CjFnQDrHHZZmbtchFAD3eAlaPjr5eRSKxheWV1o/o=
X-Received: by 2002:a05:600c:2192:b0:4a0:20b4:ba93 with SMTP id
 5b1f17b1804b1-4a027569390mr28217975e9.16.1790937170240; 
 Fri, 02 Oct 2026 03:32:50 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a027740a2fsm83722775e9.13.2026.10.02.03.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 03:32:49 -0700 (PDT)
To: buildroot@buildroot.org,
	Julien Olivain <ju.o@free.fr>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri,  2 Oct 2026 12:32:47 +0200
Message-ID: <20261002103249.77114-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260922181332.1533919-1-ju.o@free.fr>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] .checkpackageignore: remove entry for
 mrouted package
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Buildroot commit [1] (package/mrouted: fix invalid daemon path in
> S41mrouted) removed script execution permission but forgot to remove
> the corresponding .checkpackage entry.
> 
> check-package is reporting the error:
> 
>     package/mrouted/S41mrouted:0: NotExecutable was expected to fail, did you fix the file and forget to update /builds/buildroot.org/buildroot/.checkpackageignore?
> 
> This commit fixes the issue by removing the entry.
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/16661195972
> 
> [1] https://gitlab.com/buildroot.org/buildroot/-/commit/d8f408b1f16d067d2e676f3db91e7b337aebe160
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  .checkpackageignore | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 47e8dedb72..6d2a024e07 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -608,7 +608,6 @@ package/mono/0002-Ongoing-work-on-the-cmake-build.patch lib_patch.Upstream
>  package/motion/S99motion Shellcheck lib_sysv.Indent lib_sysv.Variables
>  package/mpir/0001-mpn-arm-udiv.asm-workaround-binutils-bug-14887.patch lib_patch.Upstream
>  package/mraa/0001-include-Declare-gVERSION-global-as-extern.patch lib_patch.Upstream
> -package/mrouted/S41mrouted NotExecutable
>  package/mrp/S65mrp lib_sysv.Indent lib_sysv.Variables
>  package/multipath-tools/S60multipathd Shellcheck
>  package/musl/0001-avoid-kernel-if_ether.h.patch lib_patch.Upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
