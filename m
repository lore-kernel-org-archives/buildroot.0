Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D11B6CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 19:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D560409E1;
	Sun,  7 Apr 2024 19:33:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o4yPDe46p8OQ; Sun,  7 Apr 2024 19:33:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65AAE4043A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65AAE4043A;
	Sun,  7 Apr 2024 19:33:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1F2A61BF473
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CB6881CE7
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 19:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KEEyg0kmWeZ6 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 19:33:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E168F81CE1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E168F81CE1
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E168F81CE1
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 19:33:28 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-343b7c015a8so2365591f8f.1
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 12:33:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712518407; x=1713123207;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=qSww6x+X+vRA1IH/v/+ApTvD7ln05Kc5dHjQVTAtFvM=;
 b=Uy3E6VojvEEVoUzjaeNG1reuMkUP7QSuugwlPNwwwM/7HyPTC6R7lO2sdIPtMXCKLp
 ioz0LXRQgqSGWuLWwrb+H5GrWWuvlCDivyicpsD72RwdwK687AAH1xkYFMkGBbFria/q
 Ts95gLssOpz0Gascn7YPu7kxhD6uXRgmOu/2GDLg0H5gxAZLNptgjonz3lKaJnaCkP31
 MUyVqjOc8V35hp1djnZCLf0jw5pLw+3E9EJsbURC2mpsE05IS+jlqcyQ92ksBN46PJL0
 pBCY+90C59LGfJ9ztAcivIDb0I7gJQZ72hCuZFWWBgIKQqlOKKbmzUWrBnKexm+aeaTY
 +UdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrqdhddNS2G4N00TecWT42doOC4lFbrOwHQ1ucU6a3OH2Xv/WSK5XvydZ0WUP9vDpeF8ProDDL7uQxEkYTBJttBA6VMo6VHw==
X-Gm-Message-State: AOJu0YxLDRdKiHtD2wPWOE0r207Q757L7FMn016Aap2YviVtCKraMcAA
 8qI0dMGD4EzoHUUuLGmortXGV6ZrjW2TyEq9/CAyqBitvJnxG9gMymWJGSwbY9U=
X-Google-Smtp-Source: AGHT+IExypbqsgjj4x3f5ZVAfiXGNVb6CAWmMtdFGBEvsp5D7gd1WDbQvxnrm0kNt7q5RCrzxmVo2Q==
X-Received: by 2002:a05:6000:1565:b0:345:c1cc:2d85 with SMTP id
 5-20020a056000156500b00345c1cc2d85mr338561wrz.55.1712518406635; 
 Sun, 07 Apr 2024 12:33:26 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 p5-20020adfce05000000b00343e760c637sm6763662wrn.84.2024.04.07.12.33.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 12:33:26 -0700 (PDT)
Message-ID: <aba84998-3aca-4a42-b1ee-40ccf82fc80e@mind.be>
Date: Sun, 7 Apr 2024 21:33:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20240407115439.872167-1-fontaine.fabrice@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240407115439.872167-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712518407; x=1713123207; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=qSww6x+X+vRA1IH/v/+ApTvD7ln05Kc5dHjQVTAtFvM=;
 b=hcHTCbscw3M2+v6Ya0CFKCzk32q3kZ5oI3+AEWVWegwun0G6OARb70aN4Q9zb5FIiN
 qkA5m4Z+eXLkLoAe+yb0dbvdAxKy4ZkH8XJz0EaNqq/WN8bv6G4tFGlvDAa01ISJ67zE
 0Id5x4OlmhymY6xrU1vjS+U+BhKE7X9RE8Pud7s4Jyubws1le7G60lZVMxz86UrdQ5Rb
 kKo+2m507a9XXITueX4mBP4vKoGfek5SRw/D/CBF7TnrEDoar7N5H/Tv5dI08EmSe60R
 D/UXTugrGuiZaQz1D/70kNCaggylq0wPuC41Fod7bdxHRFQ8VFtd2wSiPrLc1iAwWq8f
 gG2w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=hcHTCbsc
Subject: Re: [Buildroot] [PATCH 1/1] package/python-remi: fix pep517 build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 07/04/2024 13:54, Fabrice Fontaine wrote:
> Fix the following build failure raised since commit
> 8937db8dd595e0988751e5dbb568e870b07b39cc:
> 
>    File "/home/buildroot/autobuild/run/instance-0/output-1/host/lib/python3.11/site-packages/setuptools/build_meta.py", line 76, in fetch_build_eggs
>      raise SetupRequirementsError(specifier_list)
> setuptools.build_meta.SetupRequirementsError: ['setuptools_scm']

  If the package _does_ build without setuptools_scm, it means that the 
setup.cfg is wrong. So an upstream patch to fix that would be better..

  Regards,
  Arnout

> 
> Fixes: 8937db8dd595e0988751e5dbb568e870b07b39cc
>   - http://autobuild.buildroot.org/results/59ff2895baa49260fb83bc375993907144b945af
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>   package/python-remi/python-remi.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/python-remi/python-remi.mk b/package/python-remi/python-remi.mk
> index 419a3441a7..ec1649f8a4 100644
> --- a/package/python-remi/python-remi.mk
> +++ b/package/python-remi/python-remi.mk
> @@ -11,5 +11,6 @@ PYTHON_REMI_SITE = https://files.pythonhosted.org/packages/b7/5c/fca9d9273fc9d5f
>   PYTHON_REMI_LICENSE = Apache-2.0
>   PYTHON_REMI_LICENSE_FILES = LICENSE
>   PYTHON_REMI_SETUP_TYPE = setuptools
> +PYTHON_REMI_BUILD_OPTS = --skip-dependency-check
>   
>   $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
