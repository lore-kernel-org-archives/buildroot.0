Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06463C9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 14:46:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C49698136A;
	Fri, 25 Sep 2026 14:46:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HPLwPzUsIHJp; Fri, 25 Sep 2026 14:46:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0205081352
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790347564;
	b=hK15RZHNsAB66kIlUnv07CbztZZdhGRBS4qQrlI4Zo4H7dClpXobszmwTBjhV0V2c3Ej
	 ol1jelx5nOXeQzR7t1yZKEsTd9ktDt2M8gVCtsvlvoY0hv15E6u+n7O/X7rNcjMa5Yy/Q
	 yiw3iqGA4FqzNQWkBcdALnoPxLCWXyHI+jBJwOs0PmJhkc7oPcWYSIpD23Y4GBzuhXdSW
	 7f73bJe6q7XAzobf9K7o6BmBxW5Oo8WcTs3rHza107C0AxQJuJZuzjlRwz6or6enYeRwC
	 stsrOsc8HWMp2mdDL+tUpnpY40+Lr0g94TbbOjWsMTtWBD/jo4S/KInEOrgMycLHuZQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790347564;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5AKXsPAaIWeymCG4r4BndwaBePf2s/qR7V1dbKK3XN4=;
	b=Lsxyc3XzZl4Pu0FDmM8PrGHU28NKOK2+lqkOKJUvuU2lnmZWvC87tQILugYj+bex4PdI
	 Ec/ex42vEBg8NXATRTrygIq/68rYRS26tAyxDLC/zvmkAjD/VpeGcWEhKDnVH/PPSCirF
	 uJ5gsazhoZo55vi2j1QLcKmPS9F/qIKJs5mvsC+H+UWkq1scytLe7vtYGcGASSSBNAhOR
	 oElxga2gPc6dN6d005VIP5VmzEkIAoskRLfOqywHI7hsGuXvxk12G3IfoI0EjrFKseU04
	 rr/YdOlFOhJgoLpzVNqTC1Za7QqNBNciwyFMgfV7uvkFIZawEKYtDIEYqSLkWTbjSsA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790347564;
	bh=5AKXsPAaIWeymCG4r4BndwaBePf2s/qR7V1dbKK3XN4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LgiHbAEg/J1LBreocCITVYJ2Haon8JCXfHgV4E18aAv1IUXuTYtEC4C6MULZJtC9u
	 Gv+pMVrF7b4vhsJxppVKr9F75xQaS5zwOkb0e+2AoQ/2qDzgM8wEBczt0qGmBdiQvv
	 /VHFQGzzgt+lkwRDmhV+lsK8xXXiEucHYSE/0F2DP0Ie9vvF9u7fYSJUePLGUUW1nw
	 1wz6WybhOCrDIIoAxGLyst8qYwPot7aOGH5gMHcKkMd3LxGD/uFm1bR//DR6/P2lAO
	 rzkUg75wHszpQP+GSKJEFJhSWRCL9hXRlGMSMcix7dn6NFdqk/1ikJzjXLsjeJkXl8
	 bN+LzA6zm0gDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0205081352;
	Fri, 25 Sep 2026 14:46:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 620E1334
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5F50940181
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:46:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qN-wGTlzC6pD for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 14:45:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 4E2F14016B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790347559;
 b=ezmOrzKcmbKrCo1pfMkJF6O8bOHedS4MQsLkSHecL/kcRpbu8sDEWlLzCu7MxSK0SKdr
 ocvj4Xp1hx/yXDmGOpDxLtMuboQaQVpRAK6O/5wWhdaehU1i3g7098t283lZ9ObMOjdR1
 l3wIlxDtMyki8tT7t1EvmXbpBVC6YbOzOOP+RcTwTJD2N7PwxFhtqP4w1zep+veJkO8EP
 D9vJ+0eWAnsn9q4flPMNMHQewflzmkIVxqDeaY2ltsNCZB6oIz81VSq5ttfmXpXurYQ6M
 UNwo7I9IEGE60NhDbykMf84f8JuANbJH5sO1Gz7Y3BwDLKD4SfdFikmJJX8iXnq0FIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790347559;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=nmMlBSxyJM/1MEqvNcvxah3NIsglFp1VyNOsRyuy/ts=;
 b=k+ixIQrT+qcdiNiAfvnDCieZMrAcrK9yJK9lA0jJKqHsSwHTFmAjARIWEGH4t9FJ+ype
 khISL+LzB5OV1EeJPb4QZnx9gOIjxnm77RPpsS1x90zeZtZlBnRm78mK4/sR8Sh/l1jdO
 /Cv1oLEe0nM3cDZjP9n/YZl3UInCS9yMA4m+2C3b1qdi07VCGYF+AQsGa9HwJWterJIyU
 8CmA4DGY5nh/Ri6jHO8ShhEqk4Y4ukWuKjP1TVO1pqq/ArMksFlO+uU+FDyyBuFjQ2Uuw
 LtIohciQKofIKe7p5wNOGdnQMCAjRkuawZVEAtIkThHQ+qV46ArGzyySu9CbmZBvfUA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=TEB7FDjt; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E2F14016B
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 14:45:58 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b912d8239so7749005e9.0
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 07:45:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790347557; x=1790952357;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=nmMlBSxyJM/1MEqvNcvxah3NIsglFp1VyNOsRyuy/ts=;
 b=04tHPxqlX10aSwBPCZN4T7n66z3x8OIjHK/pHjounj6QEBhJQ/UGb6wG7vqe/GVCy5
 gXRqU7/q7HZKa5ztAaVegEsoDMKH8sKOn9QmTuEBf4HDhD4HIGlAQE7UR/elO2+HiWvF
 iOxmy7AeQ/GJ/fQPEi8i6VFqZrUDRdzlrjliD8h7CnRyIe9iecGICNR5iGo0+zKPL6iB
 NolSJSHzH3oGK2eYm2lGfL9viIzR6slhCQ+L79anf3NytImDrUQLRiejiZ/D62MnDypx
 F1UCAigo0ICoX+FYtL4jiLcjaBV865jES3FOl718Iib0/hVMNmbZQ/YGrvA8mIYa+yfl
 QmVQ==
X-Gm-Message-State: AFuF++lGCpjlPrZhu+iI1vX8JHG6pFLGya2HBUxID78nV6/bFtcY9dar
 hLgD+Z1OzhXgVg2ZqjfEl7FTlJXOr/lBW7IUymJwXFHGrVnPohPwerTpudmAv57FBu3+w8+r7+D
 MBus2rGheWQ==
X-Gm-Gg: AYBFou0WfX61K1qwDMfZCrfy+g79oYB8Zo+JUikvAPJrKiLVeSok/V18UAzQyTt/hjO
 5d0NRh30gUeWmKt3TC9yZO88C8GiRu/8KwffvD+oOXSMXKJR3M0VzxoxISGn8i6p/vA3vuA7dRc
 yv11VCUXLtP50Z+DjaptiiMWJmCLLlqEpPyYj0iaxEKxXRkpTH0wndLjmhfAm669PnS0IHuvD8h
 Pu7+gJEAxS16daaFPrkdkrT/nurHv0zBndvvdQZf9shP0mKfgths1QwYSLedSUwvhcFEQALCLmb
 6wCz3p0u5B7fnaz6FqtFt6wQ13+4yAWkgm9deyBIddNA0/pSySEk8u5e8kGQQ7LPMlyZGMBh/7e
 DNaMXoX6+P3t2W45txo86kUiLutxHWFBEQvm8h/lNzmQeNJrDOgu5PFO+M+d+FWqZBOcWXlYtjL
 h2tRK60hx0pGoGRDa4I5xSwarRSdBTPi2L4Xkz3Q3zyMk5KxFoceoA4m0X3bxxz0rydYgAjW+bu
 effZtUdH4WG93Tc+FYodNqumTdvjucnJWNmqqc/qA==
X-Received: by 2002:a05:600c:46cb:b0:49c:dada:30b7 with SMTP id
 5b1f17b1804b1-49fe7b52f06mr95683815e9.2.1790347556879; 
 Fri, 25 Sep 2026 07:45:56 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49ff27eabc1sm67422085e9.15.2026.09.25.07.45.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2026 07:45:56 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 25 Sep 2026 16:45:53 +0200
Message-ID: <20260925144555.4098493-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915221110.2037230-2-thomas.petazzoni@bootlin.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/gnuradio: show Config.in
 comment only when needed
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
> The comment about the toolchain requirements to have Python support in
> gnuradio is always displayed, even if architecture requirements are
> not met and if Python is not enabled. For the latter: the option
> BR2_PACKAGE_GNURADIO_PYTHON also depends on python, so it makes sense
> for the Config.in comment to also depend on it.
> 
> Fixes: 7a546b87d5b8781b03f3ba5d311d61f4169ee899 ("package/python-numpy: add reverse dependency on packages using python-numpy")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/gnuradio/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
> index e87275de4d..0e8dc66dc4 100644
> --- a/package/gnuradio/Config.in
> +++ b/package/gnuradio/Config.in
> @@ -89,6 +89,8 @@ config BR2_PACKAGE_GNURADIO_PYTHON
>  	  Enable python component
>  
>  comment "python support needs a glibc or musl toolchain w/ gcc >= 9, host gcc >= 9"
> +	depends on BR2_PACKAGE_PYTHON3
> +	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
>  	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_9 || !BR2_HOST_GCC_AT_LEAST_9 || \
>  		!(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
>  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
