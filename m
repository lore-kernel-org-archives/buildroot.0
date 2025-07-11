Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DC8C83F1A
	for <buildroot@archiver.kernel.org>; Fri, 11 Jul 2025 10:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1378D60E52;
	Fri, 11 Jul 2025 10:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zpTv-UOxLaSI; Fri, 11 Jul 2025 10:44:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3667B60F60
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3667B60F60;
	Fri, 11 Jul 2025 10:44:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AA401199
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BF4340251
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fPWhE0UQ5Xwm for <buildroot@buildroot.org>;
 Fri, 11 Jul 2025 10:44:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CB80D40510
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB80D40510
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB80D40510
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 10:44:32 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so1885574f8f.3
 for <buildroot@buildroot.org>; Fri, 11 Jul 2025 03:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752230671; x=1752835471;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WhdkhnYtWMYauBdDF6Ss9J7sGu086xfB5UF7yo1rlRI=;
 b=MBME34K4fYZcKBHAt6UVHz1Fl0yvroowyDoIk7TrDseLQ/sNVkmRRPucjqERUwypxK
 IJVOKtXvB1+i6h3WapP+IvZia7qkIBnzzNWa5CemwRND08txg07u0QrdJW6GmpVMj81/
 M7yEb0X0/zsjAqYkYUjMOLOW4vEKrDg+96wo6pF0smr79cthU3R5YP0TCgwJsi6tcGGv
 El8uIH50j5QPJ33S/aWGWu4yTGwEK5UQgvjVO3iTg5rrdjx5w1ltj28Qs5TLFtHMahWE
 8SnpQGF/7fiEvIodEf6Tmf5f1VFl/wvW3NPxNfbJyHiVrJZTsTHW6H2Llas9kI20vJW5
 oWhA==
X-Gm-Message-State: AOJu0Yx2s9fSsCUHw8Ik/iwnBgLc5sffuBKpyO8evHg3Bcg6Jq1O5gMY
 Sw6VCCp19kEn/TGqDxNHmI2SAVCovGkmzpawedXmgNfoXFD9krB+grh9MdAJgpGM+22bj1AhwGN
 IwoPX
X-Gm-Gg: ASbGncvP2S0IzMUTq5TWmOVOChJ70PCIiyJL8f4CTORzotUZez4k+Lp0dUV6fZ4C9fl
 R647PoUNsEqKearQhRAR1tAx9apCjEiVTs++lOoGM8Qso3Tp4+1KhNn/Nt9P5puUL3jnyt/zTgT
 UQgBZiZp5F0GdGJPZd1gPFy57w2L03k5L/19bHxTl3uIV/y3e5D/UwNfThzj3/+djLpe/PgG/PD
 AcCnZiD8bgdRp5It45gvpAREXHmwGyoi4hhCMNQnvDofkSEQK9Egx8TXTKsqApcbCNGeUVSccSP
 0BQyKn5M1LHz3smzYFfrcZhoWED7W0dO78ckYdS7ujTTVfpjY/ckmIZ4dFAwcru4LDkzEMNgA7K
 wB6j+os+9MBZubg==
X-Google-Smtp-Source: AGHT+IF6nyjwEobETSOc8qulZ2jX2uO6vohiw3GQeXUKY62PQI5cOsGAWzRMfWATxUaamIZMNDVkJQ==
X-Received: by 2002:a5d:5849:0:b0:3a5:8a68:b823 with SMTP id
 ffacd0b85a97d-3b5f2dd4531mr1784218f8f.23.1752230670671; 
 Fri, 11 Jul 2025 03:44:30 -0700 (PDT)
Received: from arch ([79.132.233.65]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e0d727sm4166764f8f.51.2025.07.11.03.44.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 03:44:30 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 11 Jul 2025 12:44:29 +0200
Message-ID: <20250711104429.823071-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250630155033.403089-1-thomas.perale@mind.be>
References: <20250630155033.403089-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1752230671; x=1752835471; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WhdkhnYtWMYauBdDF6Ss9J7sGu086xfB5UF7yo1rlRI=;
 b=djy5qZCb3H+rDYoHvf2hq0WrOeri3dq4WA8KGvdkX2tyz6cL7L8ZYFnk0tqIY/sTdU
 PTBq+NxihFaBExyvFbkz+AfWCLjZsEARKtpFpgFqyKYcW7WJRZnSCbMaUo9JRiBB6JTy
 W4TKNvKLT7Dh/l9z5ekfrxIDbJxvZQaKNEksUZiSXkGDR2Ec753CZtlnxliOQ3ZTmPVJ
 DyJgw8Xp7LkBiRe97gl3E6ZLNsAMdYQmFWHN5GeeogoaZHIRPU3UHZOUiZTZjkDKqYjy
 j4Pn8U4ACFaN1OBk00tQT1Rc/fvsHRVWBtMPnuKgfRYS5Ujh+xHmJGov05m73CTxx3Ww
 xjTw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=djy5qZCb
Subject: Re: [Buildroot] [PATCH]
 package/gstreamer1/gstreamer1-editing-services: fix COPYING hash
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
> With the version bump to v1.24.11 (see [1]) the license hash changed for
> the gstreamer1-editing-services package (see [2]).
> 
> This patch update the hash accordingly.
> 
> Fixes: https://autobuild.buildroot.org/results/9e1/9e1807cf5ac7bb69ae9bbe7a6a71411eb500188c/build-end.log
> 
> [1] fd00502ee0 package/gstreamer1/gstreamer1-editing-services: bump version to 1.24.11
> [2] https://salsa.debian.org/gstreamer-team/gstreamer-editing-services1.0/-/commit/2a56edb6af3409ebdca39a96f310b43e0d780be0
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  .../gstreamer1-editing-services.hash                          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
> index 584d235451..501ea22144 100644
> --- a/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
> +++ b/package/gstreamer1/gstreamer1-editing-services/gstreamer1-editing-services.hash
> @@ -2,5 +2,5 @@
>  sha256  85fd74dab259e137a95ab4427e009dd853f4ca82874500cb5493c33bcef1ef08  gst-editing-services-1.24.11.tar.xz
>  
>  # Hashes for license files:
> -sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING
> -sha256  f445dc78b88496f7e20c7a2a461b95baba5865c8919b8289ac24ac0a80c6ce7a  COPYING.LIB
> +sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING
> +sha256  ad2eec519ebd4b5df86ea84dff24ae3bfa2edea846a703b58902dd221ae375db  COPYING.LIB
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
