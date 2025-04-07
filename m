Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9D2C36010
	for <buildroot@archiver.kernel.org>; Mon,  7 Apr 2025 19:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4316D40499;
	Mon,  7 Apr 2025 19:03:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bzTeAImmBhUA; Mon,  7 Apr 2025 19:03:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DBE2408C5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DBE2408C5;
	Mon,  7 Apr 2025 19:03:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 39E6F1DE
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 19:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BCD661095
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 19:03:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MzbCgrPMi7bo for <buildroot@buildroot.org>;
 Mon,  7 Apr 2025 19:03:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=maxime.leroys@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5055761076
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5055761076
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5055761076
 for <buildroot@buildroot.org>; Mon,  7 Apr 2025 19:03:52 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43d04ea9d9aso22886635e9.3
 for <buildroot@buildroot.org>; Mon, 07 Apr 2025 12:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744052630; x=1744657430;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=qexkl5J60mhg3HwwlxQVNJQWmsK6dtU3r+wS6my1Zlw=;
 b=EiHl9i5TfOK5FhVj0hNd52H/3WbifdTeOUZCZn4tm7xPnWaaIvqEFgibn8ki1dra/V
 M1q6pcU71IdMrzUCkibcu/fzuyebWhCR/ewUakUij0RjiL9lUcMhLwDvvor/gbUUmd4W
 XY34jU5wsN5A4f7bdXJrlXkP1idrQ+o7g6WT4XREHaNWQxtRX76oFcGxHrRX4ITt8/cr
 /qppFOWXRdlf0xMxgFlf2gK2ln7sqm++g/TcBU5iYJuTG7pY85tcl1GySJWurH54UWn1
 lgEqg+cCyT9//kQHf1eAnZutgcWUsk9bnW8118BLM8EEdD6PKeMCQH0tptvrVVLRlG8k
 EwJw==
X-Gm-Message-State: AOJu0YzbGzoFaoaBlE8PYawMcUQRg8Zj0DYn9fzLxLNYN/inKYbov0Ok
 bu3/YQEZKyDb9B2NG8Dr1TzEc/ls5AzsDGecEQlJFag53DWkU84oU9nSHcA+
X-Gm-Gg: ASbGnctPrlJJi9YHSOQ7fPZpUAGT+HY1BgFDiwm/jn2ls78mU1J/J5/LsRsWG6Nttuh
 ofdMWHETE5dOqxmR1rnhJ4k1HIuhfdfT4UrEYRAw6MWnNgiEWT91RQdXruJlxb4OZe+EFnW6KeS
 4k0IuPPd5lXfj7UXY1vTFRuG/+XAgEmroJ5bkTZ9bC98Unrula21u9ahhfrH0I9dAXyEjKyFnRB
 3Zf0gTk1oolVOFpYxz+/IBiHGbu1IYpIcws00Re5d96YcgXTVPxXzeb3NOqzcsXcNfH/0koJx6S
 +W9LGTzbHk4YNkTPeWtbYIntQrS8rRrJNnOh5g==
X-Google-Smtp-Source: AGHT+IEaGY664xhxF08JLcOun5zZYr5JxfDv1inV+rtHkOSgWjjbByERYGx6LMAiWalkGPzB7Yoxyw==
X-Received: by 2002:a05:600c:3487:b0:43c:f3e4:d6f6 with SMTP id
 5b1f17b1804b1-43ecfa19260mr143219375e9.31.1744052630078; 
 Mon, 07 Apr 2025 12:03:50 -0700 (PDT)
Received: from freepad.. ([2a01:e0a:6f:bdf0:2962:9e9d:9c98:77f5])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec169b4e4sm142036785e9.20.2025.04.07.12.03.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 12:03:49 -0700 (PDT)
From: Maxime Leroy <maxime@leroys.fr>
To: buildroot@buildroot.org
Cc: Vadim Kochan <vadim4j@gmail.com>, Julien Olivain <ju.o@free.fr>,
 Maxime Leroy <maxime@leroys.fr>
Date: Mon,  7 Apr 2025 21:03:36 +0200
Message-ID: <20250407190338.7436-2-maxime@leroys.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250407190338.7436-1-maxime@leroys.fr>
References: <20250403190705.14994-1-maxime@leroys.fr>
 <20250407190338.7436-1-maxime@leroys.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744052630; x=1744657430; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qexkl5J60mhg3HwwlxQVNJQWmsK6dtU3r+wS6my1Zlw=;
 b=j896bNWwhM5/YCRnETQLhP39tofVGqgpyb8jKyoJBOSYtNIDR3fg7lPFvoa0DenltV
 qQP85B7bOdqD5tle7lJXpDa/Jc5xN4aOe9uq0FZTy/vfbPTe4c3re/YxIsdWJJWjMgkN
 MRChfqtgSrJYjgFhPpw+LXwhab2cLtoq6lgnNC76yi0SN3o1YEoopZKl83Z/WE98qKYl
 Wz3vhKwDlSRnmeRIe8b5DTtGhBw605JCnp/dB94lLdAX19Q5dN4diz2dY1FK/R2z9/Q9
 58WHZWp++xfRk9fyc9mYAtfbn/JzWjKolBPDw63+uET90gqVlBBmX0503ouUJNVK+uw5
 slMQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=leroys.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=j896bNWw
Subject: [Buildroot] [PATCH v2 0/1] package/frr: security bump to version
 10.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thanks to Julien Olivain for the review.

Changes in v2:
 - Fixed a CI compilation regression by adding a dependency on the kernel headers version [1]
 - Added a link to the FRR 10.3 release notes
 - Updated the commit title to include the "security" keyword
 - Included CVE references

[1] https://gitlab.com/maxime-leroy/buildroot/-/pipelines/1756279015 (CI build for FRR 10.3)

For reference, the CI build for the previous version (9.1.3) is available at:
https://gitlab.com/jolivain/buildroot/-/pipelines/1751537318

Maxime Leroy (1):
  package/frr: security bump to version 10.3

 package/frr/Config.in |  7 +++++++
 package/frr/frr.hash  |  2 +-
 package/frr/frr.mk    | 11 +++++++----
 3 files changed, 15 insertions(+), 5 deletions(-)

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
