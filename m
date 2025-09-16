Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB27CAC599
	for <buildroot@archiver.kernel.org>; Tue, 16 Sep 2025 09:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49401608BB;
	Tue, 16 Sep 2025 09:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cjuvLrlSVRtl; Tue, 16 Sep 2025 09:21:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6B1E860A5A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B1E860A5A;
	Tue, 16 Sep 2025 09:21:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 153B412D
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 09:21:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0676760A55
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 09:21:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NmzkFHXdGefl for <buildroot@buildroot.org>;
 Tue, 16 Sep 2025 09:21:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2EB6C608F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EB6C608F6
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EB6C608F6
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 09:21:47 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id
 41be03b00d2f7-b4c9a6d3fc7so3181182a12.3
 for <buildroot@buildroot.org>; Tue, 16 Sep 2025 02:21:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758014507; x=1758619307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LAd0LTvqHD2WKlQqB9/nNW0lEQ1WrbWRZ+TApe24r+Q=;
 b=WtqMcGFdUuYQ6JB05XucU+TmEmlzvnsDUN5880l11W75eIHNl+CN1rkQ2GkTjRPcRG
 Z0Kw71zUSTQRbq6Gp++v9juNdG6OHuVR0BwSP4uofqUpaU+Cz/LDXIZOK2lWanSdZ2pf
 K/VRdAGHjxYZY1+4GHJ0rx3HeqqIHgoktkU5ypii5aA0Wj1aewbeCfZzrk/w9gWCRvVo
 cqXRaiQ7o/ykHGg9s2OSYbXXW6eMr+NKCRfhNKB8aZoQQ+WOTzm8NM0gUlUhQ2TDODFF
 7vS4hTuBB4hw5+mrlT9MM3C7VIN/CuS9mrdiigbbyyZi+9p+hR6hM16E8q/8PCEGHOFp
 Q88A==
X-Gm-Message-State: AOJu0Yx73BhwyUrLkIF2y+kWuv0QLiVsX9Omu2cLcaZc23RGyc8gJb/Q
 E5ffl0U3lotTkOsazcJEC52T0i+R+RDLly0HPGn+DYDEN64OtweMJqRArb1YZAeiATWKtPL86fu
 JzlkmP8RC0g==
X-Gm-Gg: ASbGnculn8ijEIhA7RJGeFLZ2KApmj6rJyoYit76uR5gQsC6/KYLWGbRIbYS4aZf310
 g0drmXKhhsJCneJRvzy/fc91v6Pao04YN7hcQYwqz1TeWrKz43axOPQzCJer1Fj54Jl9SDuPQH7
 nyCLEmX1hfRCjs9YC1pPPpZr4tZckLeI6H2OI2UGcYrMbMfV3+fTr+EzTtWbxuzOSduTpb9NqNT
 CiyD0nc0EFYKw8bUdWohXHHkeo7unmz1BAdg60hYUllT2kVPKIeI7wF2QldkSzVJ0OONz0g+64E
 90xPSRms1WrqiORAurdVVXXeiS0ncONC3aK8oAQM5c9qhn2oXXcgCG7PuHzYs/WmtAaPVYjUTo1
 TmhJ+axQTuEmw0Eq3L9AbNpmVzpGQZpbeD8CXED56js164BxozIPQGj+ozO4=
X-Google-Smtp-Source: AGHT+IFpvoxWivVjnl59fU4yjp7eTjuenaj3S28Qr9eEGqhC7ksAhTR7Fz1Ao+kLyNhY8xTM4MF2lw==
X-Received: by 2002:a17:903:8d0:b0:24c:a617:1178 with SMTP id
 d9443c01a7336-25d23e10f45mr188460365ad.6.1758014507183; 
 Tue, 16 Sep 2025 02:21:47 -0700 (PDT)
Received: from localhost.localdomain ([194.113.66.107])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-267ba746249sm24035955ad.35.2025.09.16.02.21.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 16 Sep 2025 02:21:46 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: luca.ceresoli@bootlin.com,
	Christian Stewart <christian@aperture.us>
Date: Tue, 16 Sep 2025 02:21:25 -0700
Message-ID: <m2jz1yiwkr.fsf@aperture.us>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250907150711.3438750-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Sun, 7 Sep 2025 17:07:10 +0200")
References: <20250907150711.3438750-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1758014507; x=1758619307; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LAd0LTvqHD2WKlQqB9/nNW0lEQ1WrbWRZ+TApe24r+Q=;
 b=ibxUUENw2u0qg62arwkzYSJZ1f523WMyluZnly7OVWb0bgGW8c2AgyQI8F3dUBAlYJ
 jI6AC9lu3m2yMjn6eRfJ4WjfTQ/YJzpksL2itShRXxHFiUax3n4POJftrV/RIaf4auva
 FlUhxMeX9jEAc8h+6S9Rq6z6kyWTd2gi9u5xyj8+KuLJTZxIfpwhbFHGDzj3xAWFOC78
 jwRTWymtAhLtvWuKFfDliUPrYVZ6rYYbA5IqKk5UqrqpALdV6rEOY3QyeDy2v/2BeUM1
 GjXjHQNTh5GXprBBq2k7EgpWiZFobNZ/+MSz5kgWyjzKKkD+gX6drtCoGaRqoiJYucc4
 nVsA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=ibxUUENw
Subject: Re: [Buildroot] [PATCH v2] package/unzip: bump to Debian patch
 level -29 to fix GCC 15.x issues
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,

Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

> unzip currently fails to build with GCC 15.x. We're already fetching
> from Debian, using patchlevel -27, and it turns out that Debian
> patchlevel -29 has the GCC 15.x fix, and very few other fixes:
>
> unzip (6.0-29) unstable; urgency=medium
>
>   * Ignore invalid "Total number of disks" field on Microsoft ZIP64 files.
>     Closes: #661956, #1064000.
>   * Drop conflicting declarations of gmtime() and localtime().
>     Should fix build with gcc-15. Closes: #1098043.
>   * Fix zipgrep handling of escapes. Closes: #1054628.
>   * Stop using update-mime. Closes: #1072396.
>   * Add debian/source/lintian-overrides for *.a files.
>   * Do not trim Debian changelog.
>   * Add debian/salsa-ci.yml.
>   * Add Vcs-Git and Vcs-Browser fields.
>   * Update Standards-Version.
>
> unzip (6.0-28) unstable; urgency=medium
>
>   * Drop debian/source/lintian-overrides, obsolete since version 6.0-18.
>   * Update URI for Info-ZIP license in copyright file.
>   * Update standards version to 4.6.2.
>   * Run wrap-and-sort.
>   * Update Homepage.
>
> So let's just bump to this patchlevel version.
>
> Note that the .dsc file link in the .hash file was wrong, it was still
> referring to patchlevel -26.
>
> Fixes:
>
>   https://autobuild.buildroot.net/results/d81cb9d7c9e87dd233dde350d15cb03427ba2036/

This seems to fix build failures on my end as well:

https://github.com/skiffos/SkiffOS/actions/runs/17750130442/job/50443305589#step:8:30204

Tested-by: Christian Stewart <christian@aperture.us>

Thanks!
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
