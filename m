Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB28EB64D7
	for <buildroot@archiver.kernel.org>; Sun, 18 Jun 2023 12:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA23341721;
	Sun, 18 Jun 2023 12:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA23341721
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VN2OdN1tznNC; Sun, 18 Jun 2023 12:50:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C8A34136B;
	Sun, 18 Jun 2023 12:50:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C8A34136B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0DDC91BF5A8
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 12:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBA0E80F76
 for <buildroot@lists.busybox.net>; Sun, 18 Jun 2023 12:48:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBA0E80F76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 59opfocE8uKD for <buildroot@lists.busybox.net>;
 Sun, 18 Jun 2023 12:48:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96B5780F66
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96B5780F66
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 12:48:46 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-98862e7e3e6so99537866b.0
 for <buildroot@buildroot.org>; Sun, 18 Jun 2023 05:48:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687092524; x=1689684524;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dQsAZAwfOBK5fxMkibiykH30oTkk29uXxbPjNY4tvlk=;
 b=Q81eklgwl7F2XNaDYPVru/8N8k3KegFPGt4lultcllZKbuz0rzdlcotu+HseO3cEOl
 Xener3Su8x1o5lbFpQXzZ0MLJffGz9O3GPlyR59B+WVXH5PrKFY2DAuv6/wFTTIyZuXV
 4EWMCOt/M0NEaJTj8qVwjrdDluI0OG5U+7+vJhQYb7XoMB3F4j7IwsPHwOOOgeRSsA2L
 PYkTFmeOKoi5ZyMilyIRwFjtdKp9QvOfr8zJ/ToH+U6+mafqtPTHRm2JDXqRe+5Q5yhX
 uYaAhH6q/K0m+o8BD84xRXWJYiEIqcGHIoKQ2q+tS3fisK16iEs4GiA9zaI6pTH200J0
 DXmQ==
X-Gm-Message-State: AC+VfDzWj8rzAz++0oassQI65P9WxDXE0eGWP10bExRZABzleq70eAoD
 npm20cMRhYpv0TPXi94/RxVjxg==
X-Google-Smtp-Source: ACHHUZ7QmpP2DuUwNYNCpdFQnWsaYzkgMPSHaCoHqbfX1CWRcdPJxTzH7Zo+dfKjFV7qVIHUEGOg8A==
X-Received: by 2002:a17:907:9306:b0:97f:3d6f:93b8 with SMTP id
 bu6-20020a170907930600b0097f3d6f93b8mr6953867ejc.43.1687092523925; 
 Sun, 18 Jun 2023 05:48:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a170906684d00b0096f7500502csm13274306ejs.199.2023.06.18.05.48.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Jun 2023 05:48:43 -0700 (PDT)
Message-ID: <242be249-0acc-8d0e-b547-dc5cb3d36957@mind.be>
Date: Sun, 18 Jun 2023 14:48:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Sebastian Weyer <sebastian.weyer@smile.fr>, buildroot@buildroot.org
References: <20230330112750.1710771-1-sebastian.weyer@smile.fr>
In-Reply-To: <20230330112750.1710771-1-sebastian.weyer@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1687092524; x=1689684524;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dQsAZAwfOBK5fxMkibiykH30oTkk29uXxbPjNY4tvlk=;
 b=GSMqplehBXNDESQ+8FOtkP0v0cp1H/Jm/A95VKt/IwjYfyyro1ahXDzwzkG9I2yJXW
 8MPP+EcLOEM2i/eXTCnoyYTzFNQdadeRltVAh0ZyZAo2nQck2vJB3xjXHZrcKnPtxZ9L
 JimCPGOvJgLo5+Cw0lHqukkaR/UFeiUBLMsEdz5SDTcpItEQt5yLpaNz5G0tJB3ZWxZh
 EevlChVLWg+OXzvZ6bUQh1RWgvta9VRDyx9nOU9XqICBSW40RgLPqOzpjUweuGehuQ30
 ywEIaeD1uNjKyr6sQrDudA5m+iDCRVoJ0AO8Bb2hp8DlJM7sxzcE3NpCHGFN9YHaLsTg
 sOrg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GSMqpleh
Subject: Re: [Buildroot] [PATCH 1/1] support/testing/infra/basetest.py: use
 Bootlin toolchain bleeding edge 2022.08-1
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
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 30/03/2023 13:27, Sebastian Weyer wrote:
> This patch updates the default toolchain used for runtime tests. The
> last time this toolchain was updated was in commit
> 0207a65323fc73fe9570f3d7e03bbfed4ab6d477 3 years ago. Since then,
> multiple things have changed:
> 
> Firstly, it used uclibc-ng as the libc whereas since commit
> 4057e36ca9665edd5248512e4edba2c243b8f4be, glibc is used as the default
> library.

  IMHO, that's not a good reason to switch to uclibc for the tests as well. I 
think it's good that we do runtime tests with a compiler that is a bit different 
from the standard that is probably already used by the upstream package.


> And secondly, since commit 531b2a10cda6bae78ecc141c9fe48f2024f71dbc, buildroot
> dropped the support for gcc 8 and it cannot be built internally anymore.

  That's also not a good reason to switch to a different gcc for the runtime 
tests. But here, there's no reason to stick to GCC 8 either, so OK.


> This new toolchain bleeding edge 2022.08-1 is based on gcc 12.2.0, linux

  Like Romain, I don't think it's a good idea to use bleeding edge here.

> headers 5.4.212, glibc 2.35 and binutils 2.39.
> It is now required to add enable BR2_TOOLCHAIN_USES_GLIBC and
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC since uclibc-ng is still the

  Actually, regardless of the default, I think it's a good idea to explicitly 
specify this.


  Regards,
  Arnout

> standard choice when using an external toolchain. If one were to change
> this, it would break the builds for people using a uclibc toolchain with
> a recent version of buildroot. BR2_TOOLCHAIN_EXTERNAL_LOCALE doesn't
> need to be enabled anymore since it is implicit in glibc.
> BR2_TOOLCHAIN_EXTERNAL_INET_RPC needs to be disabled since support has
> been dropped by glibc but it is selected by default when choosing glibc.
> 
> The previous toolchain bleeding edge 2018.11-1 is based on gcc 8.2.0,
> linux headers 4.14.80, uclibc 1.0.30 and binutils 2.31.1
> 
> Tested with gitlab:
> https://gitlab.com/DocSepp/buildroot/-/pipelines/821745386/
> 
> Due to gitlab constraints it's not possible to check all the tests. Most
> of the tests that did not succeed didn't because of such constraints.
> The remaining fails are missing python or perl modules, timeouts because
> the test takes more than 3h, tests.package.test_kexec.TestKexec  is
> executed with a property that is unknown to qemu and several tests use a
> different toolchain.
> 
> I noticed 4 tests, TestPython3Py, TestPython3Pyc, TestPython3PyPyc and
> TestTmux that failed due to locale and libc.so.1 not found errors. I
> verified that they did run with the previous toolchain and subsequently
> introduced changes in their configs so the tests succeed with the new
> toolchain.
> 
> Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
> ---
>   support/testing/infra/basetest.py            | 10 ++++++----
>   support/testing/tests/package/test_python.py |  2 +-
>   support/testing/tests/package/test_tmux.py   |  1 +
>   3 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
> index 670c7213d6..586b51e56e 100644
> --- a/support/testing/infra/basetest.py
> +++ b/support/testing/infra/basetest.py
> @@ -10,13 +10,15 @@ BASIC_TOOLCHAIN_CONFIG = \
>       BR2_arm=y
>       BR2_TOOLCHAIN_EXTERNAL=y
>       BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
> +    BR2_TOOLCHAIN_USES_GLIBC=y
> +    BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
>       BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> -    BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--uclibc--bleeding-edge-2018.11-1.tar.bz2"
> -    BR2_TOOLCHAIN_EXTERNAL_GCC_8=y
> -    BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
> -    BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
> +    BR2_TOOLCHAIN_EXTERNAL_URL="https://toolchains.bootlin.com/downloads/releases/toolchains/armv5-eabi/tarballs/armv5-eabi--glibc--bleeding-edge-2022.08-1.tar.bz2"
> +    BR2_TOOLCHAIN_EXTERNAL_GCC_12=y
> +    BR2_TOOLCHAIN_EXTERNAL_HEADERS_5_4=y
>       BR2_TOOLCHAIN_HAS_THREADS_DEBUG=y
>       BR2_TOOLCHAIN_EXTERNAL_CXX=y
> +    # BR2_TOOLCHAIN_EXTERNAL_INET_RPC is not set
>       """
>   
>   MINIMAL_CONFIG = \
> diff --git a/support/testing/tests/package/test_python.py b/support/testing/tests/package/test_python.py
> index d6f69a83c7..c9ecf9acda 100644
> --- a/support/testing/tests/package/test_python.py
> +++ b/support/testing/tests/package/test_python.py
> @@ -29,7 +29,7 @@ class TestPythonBase(infra.basetest.BRTest):
>       def libc_time_test(self, timeout=-1):
>           cmd = self.interpreter + " -c '"
>           cmd += "import ctypes;"
> -        cmd += "libc = ctypes.cdll.LoadLibrary(\"libc.so.1\");"
> +        cmd += "libc = ctypes.cdll.LoadLibrary(\"libc.so.6\");"
>           cmd += "print(libc.time(None))'"
>           self.assertRunOk(cmd, timeout)
>   
> diff --git a/support/testing/tests/package/test_tmux.py b/support/testing/tests/package/test_tmux.py
> index 7a10b7a2b0..f2c620d5ca 100644
> --- a/support/testing/tests/package/test_tmux.py
> +++ b/support/testing/tests/package/test_tmux.py
> @@ -9,6 +9,7 @@ class TestTmux(infra.basetest.BRTest):
>           BR2_PACKAGE_TMUX=y
>           BR2_TARGET_ROOTFS_CPIO=y
>           # BR2_TARGET_ROOTFS_TAR is not set
> +        BR2_GENERATE_LOCALE="C.UTF-8"
>           """
>   
>       def test_run(self):
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
