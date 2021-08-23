Return-Path: <SRS0=awcP=NO=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6D58C4338F
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 22:26:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A23C6121E
	for <buildroot@archiver.kernel.org>; Mon, 23 Aug 2021 22:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A23C6121E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68D7C80E0D;
	Mon, 23 Aug 2021 22:26:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JrGYG2zcrD0k; Mon, 23 Aug 2021 22:26:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 623F280E0E;
	Mon, 23 Aug 2021 22:26:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40F6A1BF2F7
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 22:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 303E2606F9
 for <buildroot@lists.busybox.net>; Mon, 23 Aug 2021 22:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JNRqp3b2lptU for <buildroot@lists.busybox.net>;
 Mon, 23 Aug 2021 22:26:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 062CB606ED
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 22:26:22 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id n27so8164329eja.5
 for <buildroot@buildroot.org>; Mon, 23 Aug 2021 15:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=subject:to:references:from:organization:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=VN91TYboECWZZmK0NaOSt9piAUPbCPXWn5CNSLQRH5o=;
 b=WqFaECLh9YVU6vKGBYG1olt76criSpAOWlOFMrsniu8xemgf6XHQA7xYthkeAkuhbc
 dqZux7KW+UsqG0K1kPm8sWDrL8C1/wY8dLw9H8zbnkgMUa5hyo71L1kJdHmCHJ/Xylbg
 kbhuLmYdXmRR6kt7OeK/HsWgAgtA3XfA1qesolTu3zOBj8OSH3UA5EoZya0BwDXajtDX
 QjXGtiJy2uNPtIXIa6lCj2bY7rWQaaoLjS+KkBUGZ7n2jzkQZ5yURKJ3oPRlPDuqy0yK
 hlenH279Zmo4emaW6/zw7T4KmfBVTS+ZDhYg1QWOTJpF3LOIBJ3gtNxtgcAYYYp4/ZsN
 otnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=VN91TYboECWZZmK0NaOSt9piAUPbCPXWn5CNSLQRH5o=;
 b=mPqtxegUm94oQa/v/MrKsAL1agAM4qeegR9W1hXUkbGU/FVZJcAEz3l/ok5XpcN2NP
 ajARLLHbMPjvEdm6BjOqGQdGOyLnEJuzi53RPQXU8ZLuPhl4913adTHjfyvsG/Eb3PkV
 BpIzeJhvMeXit8rjgH2rrKYsRFW3khOP18ZI34W94PxApsi/PTVoxVgDZN/t2sIX83ME
 sBfhZfzdgo7UXl9r7wzq8IzwqTy5nr89ZIb0LqwkMp0yE8EUIgA8qixhzOgY/jaFh548
 sxs9iDCCIGfprCYpW3JGLad7ALHoIqPiQysMN9NXmT0iGjszlIT0mU7fqHahocgqPAFD
 6bOg==
X-Gm-Message-State: AOAM5304KTYoPfS2BIZn3waPpu4lKoXxUKrg0bY33WwIXQFFs2rxl45v
 q5LBRLmb2rCDUsrOyTORLf0L5XHZJs0e6A==
X-Google-Smtp-Source: ABdhPJxVrVYB+PE9+j4h/iVGWkP1C5iA3Kny6HtThVkGc1acpQkOHJO2C9tYfOkDstrDm0iJF4cYNQ==
X-Received: by 2002:a17:906:1299:: with SMTP id
 k25mr37273328ejb.139.1629757581333; 
 Mon, 23 Aug 2021 15:26:21 -0700 (PDT)
Received: from ?IPv6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id ks20sm8015050ejb.101.2021.08.23.15.26.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Aug 2021 15:26:21 -0700 (PDT)
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20210822090522.2527091-1-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
Message-ID: <68328887-78a8-b39e-a000-03788ab6fad5@mind.be>
Date: Tue, 24 Aug 2021 00:26:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210822090522.2527091-1-romain.naour@gmail.com>
Content-Language: en-GB
Subject: Re: [Buildroot] [PATCH] support/testing: remove
 TestPythonPy2{Cryptography, ServiceIdentity, Treq, Twisted, Txtorcon}
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>



On 22/08/2021 11:05, Romain Naour wrote:
> The python2 support has been removed since the python-idna bump to version 3.2 [1]
> 
> [1] 0c7e30b43a5e98abfc8db521a6415b5a5c1c267f
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
> Now python-cryptography only support python3, the python infra will
> provide the host variant for python3.
> We can remove package/python3-cryptography.
> ---
>  .../testing/tests/package/test_python_cryptography.py | 11 -----------
>  .../tests/package/test_python_service_identity.py     | 11 -----------
>  support/testing/tests/package/test_python_treq.py     |  9 ---------
>  support/testing/tests/package/test_python_twisted.py  |  9 ---------
>  support/testing/tests/package/test_python_txtorcon.py | 11 -----------
>  5 files changed, 51 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_python_cryptography.py b/support/testing/tests/package/test_python_cryptography.py
> index 14515fcd2d..62f0ca0def 100644
> --- a/support/testing/tests/package/test_python_cryptography.py
> +++ b/support/testing/tests/package/test_python_cryptography.py
> @@ -1,17 +1,6 @@
>  from tests.package.test_python import TestPythonPackageBase
>  
>  
> -class TestPythonPy2Cryptography(TestPythonPackageBase):
> -    __test__ = True
> -    config = TestPythonPackageBase.config + \
> -        """
> -        BR2_PACKAGE_PYTHON=y
> -        BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
> -        """
> -    sample_scripts = ["tests/package/sample_python_cryptography.py"]
> -    timeout = 40
> -
> -
>  class TestPythonPy3Cryptography(TestPythonPackageBase):
>      __test__ = True
>      config = TestPythonPackageBase.config + \
> diff --git a/support/testing/tests/package/test_python_service_identity.py b/support/testing/tests/package/test_python_service_identity.py
> index 6aeb77de8c..09cfbe0a26 100644
> --- a/support/testing/tests/package/test_python_service_identity.py
> +++ b/support/testing/tests/package/test_python_service_identity.py
> @@ -1,17 +1,6 @@
>  from tests.package.test_python import TestPythonPackageBase
>  
>  
> -class TestPythonPy2ServiceIdentity(TestPythonPackageBase):
> -    __test__ = True
> -    config = TestPythonPackageBase.config + \
> -        """
> -        BR2_PACKAGE_PYTHON=y
> -        BR2_PACKAGE_PYTHON_SERVICE_IDENTITY=y
> -        """
> -    sample_scripts = ["tests/package/sample_python_service_identity.py"]
> -    timeout = 30
> -
> -
>  class TestPythonPy3ServiceIdentity(TestPythonPackageBase):
>      __test__ = True
>      config = TestPythonPackageBase.config + \
> diff --git a/support/testing/tests/package/test_python_treq.py b/support/testing/tests/package/test_python_treq.py
> index e24ae845be..d7a23829ea 100644
> --- a/support/testing/tests/package/test_python_treq.py
> +++ b/support/testing/tests/package/test_python_treq.py
> @@ -12,15 +12,6 @@ class TestPythonTreq(TestPythonPackageBase):
>          self.assertEqual(exit_code, 0)
>  
>  
> -class TestPythonPy2Treq(TestPythonTreq):
> -    __test__ = True
> -    config = TestPythonTreq.config + \
> -        """
> -        BR2_PACKAGE_PYTHON=y
> -        BR2_PACKAGE_PYTHON_TREQ=y
> -        """
> -
> -
>  class TestPythonPy3Treq(TestPythonTreq):
>      __test__ = True
>      config = TestPythonTreq.config + \
> diff --git a/support/testing/tests/package/test_python_twisted.py b/support/testing/tests/package/test_python_twisted.py
> index a458ee45dd..e87312db13 100644
> --- a/support/testing/tests/package/test_python_twisted.py
> +++ b/support/testing/tests/package/test_python_twisted.py
> @@ -21,15 +21,6 @@ class TestPythonTwisted(TestPythonPackageBase):
>          self.assertEqual(exit_code, 0)
>  
>  
> -class TestPythonPy2Twisted(TestPythonTwisted):
> -    __test__ = True
> -    config = TestPythonTwisted.config + \
> -        """
> -        BR2_PACKAGE_PYTHON=y
> -        BR2_PACKAGE_PYTHON_TWISTED=y
> -        """
> -
> -
>  class TestPythonPy3Twisted(TestPythonTwisted):
>      __test__ = True
>      config = TestPythonTwisted.config + \
> diff --git a/support/testing/tests/package/test_python_txtorcon.py b/support/testing/tests/package/test_python_txtorcon.py
> index 1ac2f6919a..8e74190ee1 100644
> --- a/support/testing/tests/package/test_python_txtorcon.py
> +++ b/support/testing/tests/package/test_python_txtorcon.py
> @@ -1,17 +1,6 @@
>  from tests.package.test_python import TestPythonPackageBase
>  
>  
> -class TestPythonPy2Txtorcon(TestPythonPackageBase):
> -    __test__ = True
> -    config = TestPythonPackageBase.config + \
> -        """
> -        BR2_PACKAGE_PYTHON=y
> -        BR2_PACKAGE_PYTHON_TXTORCON=y
> -        """
> -    sample_scripts = ["tests/package/sample_python_txtorcon.py"]
> -    timeout = 30
> -
> -
>  class TestPythonPy3Txtorcon(TestPythonPackageBase):
>      __test__ = True
>      config = TestPythonPackageBase.config + \
> 
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
