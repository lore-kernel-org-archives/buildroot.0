Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615D9EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 14:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09AB881E60;
	Sun, 25 Jun 2023 14:03:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 09AB881E60
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id myoEY3Ta5bUS; Sun, 25 Jun 2023 14:03:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40EF981E44;
	Sun, 25 Jun 2023 14:03:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40EF981E44
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ED90E1BF3BA
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 14:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4CC74013C
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 14:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4CC74013C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LAdJYGP2L5XB for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 14:03:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C025A40102
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C025A40102
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 14:03:23 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-9786fc23505so185409566b.2
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 07:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687701802; x=1690293802;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ts7qP8Bqt17F3Tk/4GPWhm/5N0QET+EU1g2hZkgK558=;
 b=LBRWuiIR5d7l13ns+X52VOrnmHP+MsyDT3wAEbrixSZkSRE3tVP0PnJ8iM0co0RDkT
 y94XKlQjECoToFgncVjdk7LJ7ogBtS593RCjx7esfHmUlEFz3V9tsuyYMlS1aObszjpx
 2PIvuTeIT2jAxDy74QP+eRlqxArcZ/sJC94QHTlNiUDQ5ohX86Ea8ALO0s69ZXmfPKP0
 bIzQ202HoJ84aRLsFCrpQvnszK46NaeC9pUXlDX/tkspLJiVW++nypH0ZRd5aPf0UTv7
 d93cK2GzIQfyn3IEqqTGPWZMyDU6+OxgFbF9hNbp8A/ZxuH2A+9kH8D4yhunva3y2XtV
 Z4Uw==
X-Gm-Message-State: AC+VfDxxHVoTg2m6QkIIGBCA5HYglwqD7zIzPtVWButS+8k/g5DO0j1t
 bE+fBQxKpTdrsCfp2DWj2K4Z76DQSfnHpnNyn3Q=
X-Google-Smtp-Source: ACHHUZ6JH4Edd07j3hxohn1e4B+2fTNWsmBn1r00msH5GjajkpUCXqxFzGj1HFC8ohYgA1fkOb/M+Q==
X-Received: by 2002:a17:907:803:b0:982:cfe2:32fe with SMTP id
 wv3-20020a170907080300b00982cfe232femr22912252ejb.63.1687701801736; 
 Sun, 25 Jun 2023 07:03:21 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 bt15-20020a170906b14f00b009887f4e0291sm2103534ejb.27.2023.06.25.07.03.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 07:03:20 -0700 (PDT)
Message-ID: <b111dc66-e32a-fc5d-2cd0-204437adbb24@mind.be>
Date: Sun, 25 Jun 2023 16:03:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-GB
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20230624220030.492587-1-james.hilliard1@gmail.com>
In-Reply-To: <20230624220030.492587-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687701802; x=1690293802;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ts7qP8Bqt17F3Tk/4GPWhm/5N0QET+EU1g2hZkgK558=;
 b=WjZCSC6FCdin2iBEc4MA8gwMAOUidEAqSngt0pEIc5Uct8J5r3YI9NmSTxkfzFf7zq
 98f1yCUMJCgqUSdziDBE1Jj12PRO2wKoqT+yQjsQwG+1oYPwmNmyz0BSyItGfDOxuMVF
 bBurHOCEQCgsPex1X9fwXjMNod7EF0ZTNtQziZtarxfaazc4LHSS4Q0OcuREee3cBNBQ
 vdRzTGjIceZdgW8fWwQluwGRiPfljXEY0s6VyJTrOoAy3qi1bFSp//hQ+oPxoMJG/pBB
 y37dX2YVISC2Emo8FJZLk3JaXveXfoG3iEn/veiyMkgjYfPN9OIPFIryt3m1Ie1R5+pO
 N4tQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WjZCSC6F
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-python.mk: switch back to
 local setuptools distutils
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/06/2023 00:00, James Hilliard wrote:
> We overrode the default in 4386bbdf0895dbb35e02c25f42603bae9af64451 to
> work around target shebang bug, as this issue no longer appears to be
> present lets revert back to the local version as this is what will be
> use in the future when distutils is removed from the python stdlib.
> 
> Tested with:
> $ support/testing/run-tests -d dl -o output_folder -k tests.package.test_ipython.TestIPythonPy3
> 15:43:26 TestIPythonPy3                           Starting
> 15:43:27 TestIPythonPy3                           Building
> 15:49:35 TestIPythonPy3                           Building done
> Downloading to /home/buildroot/buildroot/dl/tmp_iyk_fn6
> Renaming from /home/buildroot/buildroot/dl/tmp_iyk_fn6 to /home/buildroot/buildroot/dl/kernel-versatile-5.10.7
> Downloading to /home/buildroot/buildroot/dl/tmpokk23l2z
> Renaming from /home/buildroot/buildroot/dl/tmpokk23l2z to /home/buildroot/buildroot/dl/versatile-pb-5.10.7.dtb
> 15:50:04 TestIPythonPy3                           Cleaning up
> .
> ----------------------------------------------------------------------
> Ran 1 test in 398.709s
> 
> OK
> 
> $ head -n 1 output_folder/TestIPythonPy3/target/usr/bin/ipython
> #!/usr/bin/python
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/pkg-python.mk | 12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
> 
> diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> index c15a168f60..fcb8fa0a99 100644
> --- a/package/pkg-python.mk
> +++ b/package/pkg-python.mk
> @@ -55,8 +55,7 @@ HOST_PKG_PYTHON_ENV = \
>   # Target distutils-based packages
>   PKG_PYTHON_DISTUTILS_ENV = \
>   	$(PKG_PYTHON_ENV) \
> -	LDSHARED="$(TARGET_CROSS)gcc -shared" \
> -	SETUPTOOLS_USE_DISTUTILS=stdlib \
> +	LDSHARED="$(TARGET_CROSS)gcc -shared"
>   
>   PKG_PYTHON_DISTUTILS_BUILD_OPTS = \
>   	--executable=/usr/bin/python
> @@ -75,16 +74,14 @@ PKG_PYTHON_DISTUTILS_INSTALL_STAGING_OPTS = \
>   
>   # Host distutils-based packages
>   HOST_PKG_PYTHON_DISTUTILS_ENV = \
> -	$(HOST_PKG_PYTHON_ENV) \
> -	SETUPTOOLS_USE_DISTUTILS=stdlib
> +	$(HOST_PKG_PYTHON_ENV)
>   
>   HOST_PKG_PYTHON_DISTUTILS_INSTALL_OPTS = \
>   	--prefix=$(HOST_DIR)
>   
>   # Target setuptools-based packages
>   PKG_PYTHON_SETUPTOOLS_ENV = \
> -	$(PKG_PYTHON_ENV) \
> -	SETUPTOOLS_USE_DISTUTILS=stdlib
> +	$(PKG_PYTHON_ENV)
>   
>   PKG_PYTHON_SETUPTOOLS_CMD = \
>   	$(if $(wildcard $($(PKG)_BUILDDIR)/setup.py),setup.py,-c 'from setuptools import setup;setup()')
> @@ -105,8 +102,7 @@ PKG_PYTHON_SETUPTOOLS_INSTALL_STAGING_OPTS = \
>   
>   # Host setuptools-based packages
>   HOST_PKG_PYTHON_SETUPTOOLS_ENV = \
> -	$(HOST_PKG_PYTHON_ENV) \
> -	SETUPTOOLS_USE_DISTUTILS=stdlib
> +	$(HOST_PKG_PYTHON_ENV)
>   
>   HOST_PKG_PYTHON_SETUPTOOLS_INSTALL_OPTS = \
>   	--prefix=$(HOST_DIR) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
