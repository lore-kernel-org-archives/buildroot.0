Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63ED5C48BE4
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 20:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA8BE605A5;
	Wed, 24 Aug 2022 20:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA8BE605A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fTju3lbD6k6t; Wed, 24 Aug 2022 20:45:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E58D060FF3;
	Wed, 24 Aug 2022 20:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E58D060FF3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A86491BF831
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 20:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C9DE416C0
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 20:45:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C9DE416C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R3P9vKcoo-X3 for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 20:45:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8EBD416B5
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E8EBD416B5
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 20:45:28 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id ca13so24513211ejb.9
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 13:45:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=0zGauvwpSh1Gy6R58Qxw69p8sRjbtfpy+NMCiJuF/xc=;
 b=u8AFL45pGAwI/cFCs+F9SeJt08HZmBmiZNzQA7Ab41H4IwsGmGyTRrFypMpkU3TA0e
 iQOjyaP4cYSj+XBJHQC5nGbl94gpW2kWb16gNWgYJE69SvGSTLdENmfja9vs/n0ZKQaK
 GkQHCk2MWLpT3tW5cGEwugeFx/t3sPwH6q7vSZOFOy6G5KRVwvrLtErYGu+BMzwaiOpF
 SNe8p7u1BAApsEfVaKvXQXrSALGUiq04HiauReL3VejGnzTDofSW1Ca+nclOkD8uHs+3
 oEKcm09KzD9UA7va6hkhyr6P188HFvNpIgByi0/2RLrIXDyMjPXl4fG68svsGD7LexnI
 LX/g==
X-Gm-Message-State: ACgBeo1YtBP2+UyN6OE6NRjeQGLx2V5isImsDgD05IDRE5ltti0RuIK5
 h1T3HtEqzCXI8oTVtLjxmV1izg==
X-Google-Smtp-Source: AA6agR5+j+IJqnYaYdrVSoF0c+WWaFJRel4ufEE8jo10LYcareuu3X7c7jeRXGYU9y1+PV3bRrUQFA==
X-Received: by 2002:a17:907:3d94:b0:731:744f:63ab with SMTP id
 he20-20020a1709073d9400b00731744f63abmr400635ejc.541.1661373927178; 
 Wed, 24 Aug 2022 13:45:27 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 da12-20020a056402176c00b004478fdbe190sm1070176edb.10.2022.08.24.13.45.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 13:45:26 -0700 (PDT)
Message-ID: <735a04b6-f278-c032-3a37-e0cba04c2f07@mind.be>
Date: Wed, 24 Aug 2022 22:45:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>, buildroot@buildroot.org
References: <20220823194732.701895-1-marcus.hoffmann@othermo.de>
 <20220823194732.701895-2-marcus.hoffmann@othermo.de>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220823194732.701895-2-marcus.hoffmann@othermo.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=0zGauvwpSh1Gy6R58Qxw69p8sRjbtfpy+NMCiJuF/xc=;
 b=a4mMgDnuOuxFsJr+ufP6qv/tB45zCBQpwaDDmEzeiXADgNdHiqxXa28PC4uia6Kb2+
 gbU9S5lD1Z9CMWT2Se5VT/FrpZ0BNug2LTNtCIDxIAVU2zvYXM/zIxP85WCD7tLhtj6y
 7DXJuDkxlleypuIhXS3TXwBsgdgq0tOWlOJ5+guRenzCpPTLNpIVCmg5HdK+0ORsdUFt
 TcfHGGZoCszgxq1aoY9E77ThqcPLCf0r+hJNUa1NDT0z2UIyIuH0Cd8BiJlIf74n9tHr
 unJve0r+Wh/Z86fIaGaAac58rc4HumtxlFbX32kJWdQX1W7oCurbY6wGzi38DG5K/JcM
 NZ9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=a4mMgDnu
Subject: Re: [Buildroot] [PATCH 2/2]
 support/testing/tests/package/test_python_paho_mqtt: new runtime test
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
Cc: Davide Viti <zinosat@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 23/08/2022 21:47, Marcus Hoffmann wrote:
> Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Tested that without the first patch, the test indeed fails with

# python sample_python_paho_mqtt.py
Traceback (most recent call last):
   File "/root/sample_python_paho_mqtt.py", line 3, in <module>
     publish.single(
   File "usr/lib/python3.10/site-packages/paho/mqtt/publish.py", line 222, in single
   File "usr/lib/python3.10/site-packages/paho/mqtt/publish.py", line 126, in 
multiple
AttributeError: module 'collections' has no attribute 'Iterable'


  Regards,
  Arnout

> ---
>   .../tests/package/sample_python_paho_mqtt.py  | 12 ++++++++
>   .../tests/package/test_python_paho_mqtt.py    | 29 +++++++++++++++++++
>   2 files changed, 41 insertions(+)
>   create mode 100644 support/testing/tests/package/sample_python_paho_mqtt.py
>   create mode 100644 support/testing/tests/package/test_python_paho_mqtt.py
> 
> diff --git a/support/testing/tests/package/sample_python_paho_mqtt.py b/support/testing/tests/package/sample_python_paho_mqtt.py
> new file mode 100644
> index 00000000000..769ad6250fa
> --- /dev/null
> +++ b/support/testing/tests/package/sample_python_paho_mqtt.py
> @@ -0,0 +1,12 @@
> +from paho.mqtt import publish, subscribe
> +
> +publish.single(
> +        'buildroot/test',
> +        payload="Hello, World!",
> +        qos=2,
> +        retain=True,
> +        hostname="localhost",
> +        port=1883)
> +
> +message = subscribe.simple('buildroot/test')
> +print(message.payload.decode())
> diff --git a/support/testing/tests/package/test_python_paho_mqtt.py b/support/testing/tests/package/test_python_paho_mqtt.py
> new file mode 100644
> index 00000000000..b1e2b8fb422
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_paho_mqtt.py
> @@ -0,0 +1,29 @@
> +from tests.package.test_python import TestPythonPackageBase
> +import os
> +import time
> +
> +
> +class TestPythonPahoMQTT(TestPythonPackageBase):
> +    __test__ = True
> +    config = TestPythonPackageBase.config + \
> +        """
> +        BR2_PACKAGE_MOSQUITTO=y
> +        BR2_PACKAGE_MOSQUITTO_BROKER=y
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_PAHO_MQTT=y
> +        """
> +    sample_scripts = ["tests/package/sample_python_paho_mqtt.py"]
> +
> +    def test_run(self):
> +        self.login()
> +        self.check_sample_scripts_exist()
> +        cmd = "mosquitto > /dev/null 2>&1 &"
> +        _, exit_code = self.emulator.run(cmd, timeout=self.timeout)
> +
> +        # Give some time for mosquitto broker to start up
> +        time.sleep(1)
> +
> +        cmd = "%s %s" % (self.interpreter, os.path.basename(self.sample_scripts[0]))
> +        output, exit_code = self.emulator.run(cmd, timeout=self.timeout)
> +        self.assertEqual(exit_code, 0)
> +        self.assertEqual(output[0], "Hello, World!")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
