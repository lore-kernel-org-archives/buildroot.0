Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B21C982DA
	for <buildroot@archiver.kernel.org>; Fri, 18 Sep 2026 13:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA75360F22;
	Fri, 18 Sep 2026 13:08:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xofUjvgybqOM; Fri, 18 Sep 2026 13:08:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org B51CB60F4E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789736923;
	b=XXNRB9BlbIPwD7dyYi513opdWp5iVBrJd7rDq+ekPbnTOTC2JwzcLtSIc5mww71xRXlT
	 Duk8rlUPkko8+7IhHivzcGqgzWy+20ZPCa0Ol4P1n/C5oxdzlnd6z03l0P8hTWP0HnCfu
	 /HmFk4sdaAIU5dsSfhCSP7n0Q5SdI1hS+gbzI/ROD7NLjJr5S+RqLnoJpvcCAbBLyW81D
	 RgFmvhwjdwvm0S+N0LIODs0/UAlpqDEqNABukkGEQBhjdQ9kXgIwIM/3RjQbZkFek+kpd
	 qaW+PUWD8S0Udlm4qH/6lsOIoYkLcLzY56k/ohoJ8fBFVpJD8Hk12og8mZiRRwGMuNA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789736923;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=IJtXWizDmyHIZTDAFprMuE+NadIVPap7YjGs1tw/eu8=;
	b=s2vbx8vic5HL9FfXhKqCOMAyusSVvvTuWIw3ZRGv1nQZcNAJaj8noIuIRDDWarbEYSLU
	 IFHlmfirKOpf5WDMWl5tLsjRU8sEB57ZF6zn0vLG6VohfSduDcBFXCjkcBjzb2FWdOACT
	 Lq2IGo3+mvMCwKfTYCnzZT2/MFFW/8tsnByOQURcAypm3G+Tc4VF/A+7tDuHxObe2q0oz
	 DwkoAr5BEg8/QhIioh7XKf++IzztFc/UJ4UTAs6HKxF0k3WDmsifBNIX9WzuKuxAfHonb
	 2WPpBzv67mVBdrLEW2fHrP/UWkX8yT95LN9qT8R6Vl5Pvl1PGOD5U5IWm/2vRHSp3lQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789736923;
	bh=IJtXWizDmyHIZTDAFprMuE+NadIVPap7YjGs1tw/eu8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fOtnbJKgNn0VoggXVUpWfA3quw9w/JUh907qGBUwu8tI9091mnzzjirBh2tN/mEhW
	 2+59cNGGaw2uOD+EM6PA4sk3XTzX0olLEg07QJIkj0NmLsaE3NpKicNHbNJzUaQfYZ
	 WdIjG28Oo4AmI5frXrf1MUXV5hxYBVYabpsk9l0C64la7EezrZUkD1tbZqyHVhrrKC
	 yWKCBOrTVAmYU6s6WHCicReP6SHzJntHO1ItHyNs5rCj5LVFxqAI20GiVlt/bUwTxL
	 +/TeX2e8pWdCTl9Y5Te8aSBRbwN9jsVORXP0Iy3tY7yNQBSnfVsNWHAP9j1MN/AFsH
	 9zr8IB3eK+fCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B51CB60F4E;
	Fri, 18 Sep 2026 13:08:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B2493224
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97BA7811AC
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ATs59eawwFJL for <buildroot@buildroot.org>;
 Fri, 18 Sep 2026 13:08:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 94D608116B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789736912;
 b=YwrnU5I230ub6RoO1DcuA2dcUs2hO5i74iz+yzOvy88yuutPWMAFhr4VhD9P+ci3nqOd
 Ktc/I3GGdw3E0f6VeJ+FZXmZCOTqhHy+YFYMiWgD7846s0zsiT6oN0gVLJ/4g/XXXVXGJ
 Hb8QwXFLVF2S+u0IEcZOeXwN3gjof9z8SBxhVRl4GYUsnqVunqBSz7YwdqGyjsw/JzjJh
 7SaNnv4NfBLX252f5W7nczn7mUFF6+3MRSOO6GxM/BspdEhs3uP5Yei4qfJniDgh4k3kx
 9eBeRPsNEIFtMCk1XcqFvAdAOjWjTzW1ldIO/WtS33Ay9sWLW+fQBurBlYlsKyfCrPw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789736912;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=ChC6uZGOB/VjpoQZtDaU2xSUV6xIT8D8nE0bJqs04o4=;
 b=GN9P4qeogObPuR9yRde3sbH4pv8ggnA9lctcGy8VWAW4yywcegXqq8nIK6Z+fov+U9B1
 aHs3ZzsGNFyjtCI62/8GC2GXzdGrjhZyJXDdWRJ+9W+R07s3M3XvSK41MZz/WbLFQcCt/
 nm7elTa8f9aTdqRHG198Jri3Xu4qpCX6JrZEkAIPtjMvtbh+beurmFtflqZ9dm5zyXCEE
 8if1mEy3jbE4Wdw00/4oP0j4mIgBXJxjLA7UGfQ28B6YAzweWQ+Hy1FHwrPP6LuDnfxcN
 NqDfSIMlP8cGhNKVHXV5q47MfLSiwJhaDE13R1G1z06EPb93kIlqew36BrEe/PSHUyw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=KhJTBtsh; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 94D608116B
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 13:08:31 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f6356256so273672f8f.1
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 06:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789736909; x=1790341709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ChC6uZGOB/VjpoQZtDaU2xSUV6xIT8D8nE0bJqs04o4=;
 b=Yo06OVnEFsdLVcteKrAyLAbsIJ/3c4+wNwPSeINYP/hwAr6CL9SSxlumQ4emM34jDP
 TWyECc4lr+r3jbjS1zwkLfFp5AlFxPBIexpLiLjcAn1OZj5jpjznHDTJgBNxT9FgT+QL
 Vk41FftPr0iuA+qGXqDlLQ4pHlAuw1KU+7Aa3IhihW4XfTLd5vLhEH6JmO8Nn2nK1mel
 0vW+KmQKoFadzhpmDP7neK/tW/GCWxfAO56OH+H+F+yXbr6H5t/xHDyju5oOAu2YWGeC
 ix7mgdqLTPgW0c2oAQIHtbNocoePCwpJ25cl/m1rUrm5quDyoeTC+8wVAToFbje4cSJY
 HJAA==
X-Forwarded-Encrypted: i=1;
 AKwUvBxd8XIcssRnqW+oean/qJegDCWoDBHKtXhs8JgnW1BIzUWyTHCeB1Yw4DMRlHDzDWXvLmbSdGqfsXw=@buildroot.org
X-Gm-Message-State: AFuF++n7/BKr8BsKwKG+YXAqbCQ39JXOLgvp/alCUrFERKL5zeLtEvUy
 N+M55eNZ5XnH8HdkmyLtrvYOheRosld2SWOPMqtsw4UFM7uEDmzRksRVEX1MSbsZxM4=
X-Gm-Gg: AYBFou3jbjqLJfypmBJoD5OWGz+WTfSqOrdVtIVyW6nUv1lFkzvPXXD4W8xGoMapZfv
 Kiw1MU+6ZG0VjSOKB2KCL8YjiWzNqDQN8L8SefZwB8lx9yVtPojjSfyBtH39zbTq7zLETGZjHVI
 Z3KbEmj0AFs5YaO+2YADDSQTfVIpi5PExQ/xvlkGqsg4gyiUjqdhs2NI83tl7wum0xeNPhJrCAg
 UW+RqpJ8elrSB/NPoCnq4xqExsWtKHzJuIQ4kbbS32i4A1SLm9XQR52VGiHS3P0R6gtx8vIS7/z
 pkpr9DI3IeZcmbBKaTw+bYw5do10I9YBtbLmOs1Q1j/x01bmHF2yE32LX2KSy+BC+AqWkDaegbg
 nZ5OszMIzgZRMyIKWmQiMQx1NNpw9btQu/dGv/h5tNRkTTM1w7wzGx8DoJPe8bNJay3vjWT6cXA
 etupCpTmvKqPjpkBsQVOF/OyOStHmfsdl5m7qGiG5me1TEh6OQ34MtCDrw5ngG+q2kc58jMmql5
 M0=
X-Received: by 2002:adf:e194:0:b0:486:fcca:afd4 with SMTP id
 ffacd0b85a97d-4871d99c167mr3376376f8f.8.1789736909284; 
 Fri, 18 Sep 2026 06:08:29 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48720078bfcsm3955359f8f.28.2026.09.18.06.08.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 06:08:28 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 18 Sep 2026 15:08:27 +0200
Message-ID: <20260918130827.162197-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912210910.1553765-1-thomas.petazzoni@bootlin.com>
References: <20260912210910.1553765-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/2]
 package/python-googleapis-common-protos: add missing
 BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS dependency
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
> BR2_PACKAGE_PYTHON_GOOGLEAPIS_COMMON_PROTOS selects
> BR2_PACKAGE_PYTHON_PROTOBUF but did not propagate
> BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS.
> 
> Fixes: d37766a886a8dc3d49d45e14955411700a5efd26 ("package/python-googleapis-common-protos: new package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2026.08.x. Thanks

> ---
>  package/python-googleapis-common-protos/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-googleapis-common-protos/Config.in b/package/python-googleapis-common-protos/Config.in
> index 8f487f5ee6..541cb5bee2 100644
> --- a/package/python-googleapis-common-protos/Config.in
> +++ b/package/python-googleapis-common-protos/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_PYTHON_GOOGLEAPIS_COMMON_PROTOS
>  	bool "python-googleapis-common-protos"
> +	depends on BR2_PACKAGE_HOST_PROTOBUF_ARCH_SUPPORTS # python-protobuf
>  	select BR2_PACKAGE_PYTHON_PROTOBUF # runtime
>  	help
>  	  Common protobufs used in Google APIs.
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
