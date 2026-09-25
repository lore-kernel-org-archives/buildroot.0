Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6681FC9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:43:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ADAB606BB;
	Fri, 25 Sep 2026 14:43:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OYgAvb-LG8bq; Fri, 25 Sep 2026 14:43:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 4579660D7A
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347412;
	b=DDML8IFeTOZxvvlLUHjqzFhPePb4frpfu8rSdY2hxHKlI0FF8VUJ/NXW0e/qr+3BmYze
	 ACKRbDcHaZAbU7QONRqqXUYUXQ2Y6Wmnao6Q6jfv1C6rqR5VQKRJhSLpk0tyIQbUFILf9
	 ddaRw1w1sWMWeGRDE0rZRCdwDL4CAoF8VtKGarhdywQmdvyS7JsArKhDjmt9Y7xH9qP84
	 r3XjDWgrw6lLIo037YsKzLCpI6fqMPsKOsTaAETEvi/sTS0OEuSp95/3Zw2wfGVIMdUYO
	 YV6rCZEfOY92dOQ1nC+eca3V75cK0hA0X26oDsEoY8YZGnxc/un7hvp8u2IpfEy6y3A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347412;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=hL6bIAEciAfFIIotqx01nu/aKAqodXXo9RXq7rVuSDY=;
	b=fSSOjr4aTXrUUp93iN8vBpaKrVE8he99BfgcWZif6ZS2WAa4xTovp+uRX9rLZcQnOH7L
	 bJBzfWKdO2+tTBSO2XPXMnssin1CsAG0M0VR3huVaq1P2pLcGoxN4XR8e5+MhIcbNBDWq
	 nCkLg3g6vFsVh/4V80nd9a0J7JS8fibZV51bP4IbDP/X6P1WvulNB2XHD8H8eoc2CwEgH
	 dQ0+ijp8d6D482QaZbMavnHwSkAGoU4OGAjGa+My5sp9GRE12oEhjF/uiohFK5FRi/QHZ
	 UfW/anjyf6h7WI2LLi+hUc+vs7/5D1bWC2JDmMOrd2+5m4Fck30IUs/ANhfFoNttgrg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347412;
	bh=hL6bIAEciAfFIIotqx01nu/aKAqodXXo9RXq7rVuSDY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=D4xwE42D0Vne7bFjva52yT/YuB5EqgwPMvgA18DvMAzpIqbo66WbgtrXs4lkcrZMZ
	 /OKgLRJifq1MqRqeqTnTLear4q7YMdrfUTX1o9iv8nN/g6ProkzJdMrAIPQMps6eMw
	 gOhm5h4HwBn+LNUkNaaq+RtOp92FMRyjiojMS+iole0l9AdCcxGnq752Q6g0+XxXWT
	 JRZt7C0dpsyP5jS0RLrnkUp+Q+zb6ICY1JmkAxM+vsprwjhXao8k28Vlufou1XZbce
	 zDRhhbbekWjjXsWkeP6XmZf9U87r7zZjVV4c3G/EvLynsbqifocNwA2kwsuZ2UftV3
	 sg9BrKO2QgBIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4579660D7A;
	Fri, 25 Sep 2026 14:43:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04E9C334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0284260D7A
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:43:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qoFbJa7VGNqJ for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:43:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5D716606BB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347409;
 b=Tp2MpQo/AW08GVpmqTErrZHn8yKsPEsTKvbptIoVz/I7bD8dmQOcTXp9U92OhXSwrEu8
 +MiRXX4ys7vezsjbF65QHVSs23E020NMqFE7P2mHIhIGQ5LJCoFFIPz6uE4h/w+LgcIR6
 dT7jNnqNAPqerfIwdtFGc1bM35Xm/uPZb0zFQQXmR0HzOrNTK6vLrF4LLUiUrU6/6Q0yP
 G0BbVwt7lHp05fUOfN+QkG+FevVSfDl/YIJ0k9PxTpvU8S2cYMKXHeq0K9xsWRxX/iX12
 liWDcQWN9AugR6T/gm0MdppXKGc6fBDZ5Z2mUKXyRhhcV9rMSh/ZS1kOtWj5MtP4ZSA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347409;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=vWdS/to1XyI01CMCRJOfDpk0QavHFaalL/5NWy3QY3Q=;
 b=YCzh4sfqwiClLWH2gp8vV9cIxurYnLS54jsZfXvMt2yqkVt6QIRNCaNEAYpADQC2ME7E
 3aTnUwID2jdEE03IxIQRApqmVOKETB/UZbb53kVvoV32JpQzwXCo78/JsjmAxKzoxDbN7
 FOC8aC5nxtIs0oBVkMQRk91f3IxDhh7Ujw9sqKlpAUyFq3VE7W/CurfVZl7XeN2nbRvrt
 SQ96FV2Noen9dxbhVbFiq+Y7N0fnK+Cac5gJdbnenflRBQMMPEgHGOPf0OeSuiv4+Q1Y/
 Luu75IzBY47tOROMNWlQCyKUx0/3B2JMU7ko/8SwhxCmFSro7/MlEVhLeXgA4Qt/evA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b="YKCM/Efd"; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5D716606BB
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:43:27 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49b912df756so8174675e9.3
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:43:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347405; x=1790952205;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=vWdS/to1XyI01CMCRJOfDpk0QavHFaalL/5NWy3QY3Q=;
 b=xTcmWsr6oQih+ErSozJVz0hyAesmbt0w5q0u7Hw1kXvBPJf35p/bBp91ARM0m67R5m
 X1W+rydgea+62J2/n5b4LNfKRlO7OYWd2THswODHAZRtpxV76gT/wATbxAqj4CKIAGRJ
 uY7AMVlWrs3fanOubWsSvo+rSY40e5Tdv45wO3N7rgoMvQv5wjTD7tanCkcd8KEBHdZR
 0VD3mEzl3H0Wqo4StUiUDQU59bZDx5sYdQDXXDBSQpWvyv7I0Dx4e7zDXL6P4rE1eYo1
 LJWH7GZ8xEZxMZtV61VRdMKiPJRXydjfYbD0mmL2vo0ROZT7vu0Q4IxDF/2pXDcCMLhC
 YRcw==
X-Gm-Message-State: AFuF++lUf84b6h07jkr18cN2c3wb9mEbAW6M0jXuD8a5LDTqCqQMV+8S
 eDXHBxDRu+16z6mYMhuYTg5yaUGmYIinM767nCd/bLL2ZnoTdyrbG08pnS1EUS3S71pUYIif2dV
 HRFn+oyljig==
X-Gm-Gg: AYBFou2VVZH1fqMcQXAFSd4mwKxATXWlJGTYVH7O7u7BopHuo4tY7EqGS/n2be/lD9+
 3r3Y85J4NOKP096zxWGwBerkMEfTegflm7V0XtYI14BJLe6mTJS2p02mi7K2DHNV0B57AezGOAH
 WxvNFDRWYIZqB2ofmJv7hV2h0XJWVzAdr3/35qVM+D9yDNyTE6g6WhhbIotpb6HfCn7Rr67cE2O
 zXjwHvK/X0U5JHOXsBZh7T4e4q0EmxL0DQdtWIUP7Tp/h1BMLnBxEBjYv0vuzRRvQFN3u+D6qRF
 lU7+uARNMtLp+e52IutV6exjXtHFCGBO8Z5cdXCeqgszXBu2ntJkYfiyds72QXuW+7EkFrW6zsB
 cAc1G/u3Nsf4AmOaoApl+EGRFbX5vEaJ0WDp6YvHckHqD29pX4LjRAoTX30Q4/ECN0GHsI5gB78
 dzQiZpPhP3Kb5jYw4bzHKSjfO1OZPJstoHvF2E2/VT/sXXNl9zLfVAoDsWMDzOl+UlI0v0ligwS
 FLkKjWrSjslLMi8ZsYTnmSB3OkFd40irBYuDYKp7A==
X-Received: by 2002:a05:600c:3507:b0:49f:c432:2e50 with SMTP id
 5b1f17b1804b1-49fe66dffdfmr116918595e9.25.1790347405620; 
 Fri, 25 Sep 2026 07:43:25 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fef5fe71csm49843915e9.2.2026.09.25.07.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:43:25 -0700 (PDT)
To: buildroot@buildroot.org,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:43:20 +0200
Message-ID: <20260925144322.4094574-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260810165106.3930140-1-chakrabortyshubham66@gmail.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2] package/libmpeg2: fix build with GCC 15
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
> GCC 15 defaults to C23, which no longer supports K&R-style empty
> parameter list declarations used in libmpeg2. To avoid carrying intrusive
> patches that rewrite legacy K&R-style declarations, pass -std=gnu89
> to CFLAGS to restore the older compiler behavior.
> 
> Fixes: http://autobuild.buildroot.net/results/53d/53daf0b4bd8b476252ca219e53a966405ece7e51
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
> Changes v1 -> v2:
>   - Dropped C source patch (0005-fix-getopt-modern-c.patch) and instead 
>     fixed the issue by appending -std=gnu89 to CFLAGS.
>   - Added Fixes tag pointing to the autobuilder failure.
> 
>  package/libmpeg2/libmpeg2.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libmpeg2/libmpeg2.mk b/package/libmpeg2/libmpeg2.mk
> index ec23dff57b..dd3008987e 100644
> --- a/package/libmpeg2/libmpeg2.mk
> +++ b/package/libmpeg2/libmpeg2.mk
> @@ -16,6 +16,10 @@ LIBMPEG2_INSTALL_STAGING = YES
>  LIBMPEG2_AUTORECONF = YES
>  LIBMPEG2_CONF_OPTS = --without-x --disable-directx
>  
> +# GCC 15 defaults to C23 which no longer allows K&R style function
> +# declarations, so force it to use gnu89 standard.
> +LIBMPEG2_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu89"
> +
>  LIBMPEG2_CPE_ID_VENDOR = videolan
>  
>  ifeq ($(BR2_PACKAGE_SDL),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
