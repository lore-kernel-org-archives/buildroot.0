Return-Path: <SRS0=dUZC=ON=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1,WEIRD_PORT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16415C433F5
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 20:09:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E24B6124D
	for <buildroot@archiver.kernel.org>; Thu, 23 Sep 2021 20:09:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E24B6124D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 558F340168;
	Thu, 23 Sep 2021 20:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id T4uKL5rM38eH; Thu, 23 Sep 2021 20:09:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C16D40201;
	Thu, 23 Sep 2021 20:09:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C6801BF3EB
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 20:09:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 294E040303
 for <buildroot@lists.busybox.net>; Thu, 23 Sep 2021 20:09:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gRhcTgtZsDyI for <buildroot@lists.busybox.net>;
 Thu, 23 Sep 2021 20:09:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C9BA40325
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 20:09:50 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id c22so26956093edn.12
 for <buildroot@buildroot.org>; Thu, 23 Sep 2021 13:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mTasH0l5ZC8UO2BJIc3DVJ0QET+VGNdGHf5MUlp/BXU=;
 b=E6XRTIIvIfkMJx0hDz02d6162c9tsHP2gjZvIEKitMhU3BIaNYPSYdt4ettIT2hW9y
 WO6UMUZ4iSPJekTHvbToF4c7r7jCB+8qkXbq2iSeTXb0qANrwK3JjlnFpCZxYI/12TZx
 T5I8hE9uyUFyIPMBlSStY6p73cE5oYZ9jIs2ApUtqB6ztGcgv1lRKIDbZk9bb0QPdDCM
 kYO5eS91v9nIJUYjMSDCJd92vpaiA5FbajmGAlsChTGmSMZDsXWYprzB8Axqi/C8JCdE
 60L3hRnqM8O7KQ3pNtYzm8sJcVJh25w8ovYoz8G4QrYEJ+wfraEx4+z6LQ4TboNwVMyV
 HO3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=mTasH0l5ZC8UO2BJIc3DVJ0QET+VGNdGHf5MUlp/BXU=;
 b=xzXToVdfSQCB7ilslCQL56BrQbDuNvyyTCDEeeIkpHv1eW0OSilTuzjU4eMmqPWaIB
 81eSZ23IArgIkVPRHVptwRXnwAxwqiUcePUGtU/zfNndGSJEIMYVl4uKUC/FCa/FsWM5
 DNz2ptwMjb6lTCahQ467YEYqrvhLC9S4UFMyrq2ybk40MCcbHKf5OWqcMPs0JdOeb0lD
 Nj7LJfAI98eHajy9mcxgjWji2PhDhKw2cqltLcodD+8OTMPD1ahIdS6dWcgcRuqhQxjV
 ip5jXYgV6YWeK/5SgZq1IMqZZ6Elvo/B6hAchXvS+kxIgl8KekjIEZrdu83N2Kx1uPKh
 sk+A==
X-Gm-Message-State: AOAM531tPLBUvDjhGajLoCcofKzz4gAVvwNSEUQx53s9H10S6VS2Q/HC
 h8nwhP+FWXiDsAHJDrbcM9pkesYBC2fu9g==
X-Google-Smtp-Source: ABdhPJxL93QiZ8l+7EEYgTDep4yb581EUiPxZ6w/liMz63R7CV0leAywasEvNbP9FzdHODJ55qil7g==
X-Received: by 2002:a17:906:2cc5:: with SMTP id
 r5mr7139938ejr.524.1632427789211; 
 Thu, 23 Sep 2021 13:09:49 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id bj21sm3626318ejb.42.2021.09.23.13.09.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Sep 2021 13:09:48 -0700 (PDT)
Message-ID: <2725df65-c938-2fa4-7489-33da48a00ffe@mind.be>
Date: Thu, 23 Sep 2021 22:09:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot List <buildroot@buildroot.org>
References: <20210919124517.524402-1-thomas.petazzoni@bootlin.com>
 <20210919124517.524402-4-thomas.petazzoni@bootlin.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210919124517.524402-4-thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 3/4] package/python-flask-expects-json: new
 package
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Lionel Flandrin <lionel@svkt.org>, Asaf Kahlon <asafka7@gmail.com>,
 Jeremy Connat <Jeremy.Connat@orolia.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 19/09/2021 14:45, Thomas Petazzoni wrote:
> This commit adds a new package called python-flask-expects-json, which
> also to validate the JSON blurbs submitted to a Flask web
> application. A runtime test is added as well, making sure that the
> package minimally works with an example Flask application.
> 
> The files added by this commit are associated both to Nicolas Carrier
> and myself in the DEVELOPERS file, as Nicolas is also interested in
> this package.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

[snip]
> diff --git a/package/python-flask-expects-json/python-flask-expects-json.hash b/package/python-flask-expects-json/python-flask-expects-json.hash
> new file mode 100644
> index 0000000000..d71ddd0592
> --- /dev/null
> +++ b/package/python-flask-expects-json/python-flask-expects-json.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/flask-expects-json/json
> +md5	c1fb8ede58db312d7923212dc97b8ab4  flask-expects-json-1.5.0.tar.gz
> +sha256	0087dc3d089f1ac75a1fc0f259f4dbd02bbb9c356e92e1a080f2309e2f75d053  flask-expects-json-1.5.0.tar.gz
> +# Locally computed sha256 checksums
> +sha256	06154a99fdc664107294a0a5e7e68f776078d075408dd32bbeaa7340fdd39e73  LICENSE.txt

  It's not enforced by check-package (yet), but we're converging on two spaces 
separation in the hash file. So I changed that.

  It's also "wrong" in the python-smmap2 and gitdb2 hash files, but there it was 
already the case so I didn't fix it.

  Regards,
  Arnout

> diff --git a/package/python-flask-expects-json/python-flask-expects-json.mk b/package/python-flask-expects-json/python-flask-expects-json.mk
> new file mode 100644
> index 0000000000..487f15d4e5
> --- /dev/null
> +++ b/package/python-flask-expects-json/python-flask-expects-json.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-flask-expects-json
> +#
> +################################################################################
> +
> +PYTHON_FLASK_EXPECTS_JSON_VERSION = 1.5.0
> +PYTHON_FLASK_EXPECTS_JSON_SOURCE = flask-expects-json-$(PYTHON_FLASK_EXPECTS_JSON_VERSION).tar.gz
> +PYTHON_FLASK_EXPECTS_JSON_SITE = https://files.pythonhosted.org/packages/4c/4a/9d9d050af700fb3feebd1f8466e73d65ce8b4709f27773e07100b0993451
> +PYTHON_FLASK_EXPECTS_JSON_SETUP_TYPE = setuptools
> +PYTHON_FLASK_EXPECTS_JSON_LICENSE = MIT
> +PYTHON_FLASK_EXPECTS_JSON_LICENSE_FILES = LICENSE.txt
> +
> +$(eval $(python-package))
> diff --git a/support/testing/tests/package/sample_python_flask_expects_json.py b/support/testing/tests/package/sample_python_flask_expects_json.py
> new file mode 100644
> index 0000000000..d45026dd49
> --- /dev/null
> +++ b/support/testing/tests/package/sample_python_flask_expects_json.py
> @@ -0,0 +1,18 @@
> +from flask import Flask
> +from flask_expects_json import expects_json
> +app = Flask(__name__)
> +
> +schema = {
> +    'type': 'object',
> +    'properties': {
> +        'name': {'type': 'string'},
> +        'email': {'type': 'string'},
> +    },
> +    'required': ['name', 'email']
> +}
> +
> +
> +@app.route('/', methods=['POST'])
> +@expects_json(schema)
> +def hello_world():
> +    return 'Hello, World!'
> diff --git a/support/testing/tests/package/test_python_flask_expects_json.py b/support/testing/tests/package/test_python_flask_expects_json.py
> new file mode 100644
> index 0000000000..b7326f5d9e
> --- /dev/null
> +++ b/support/testing/tests/package/test_python_flask_expects_json.py
> @@ -0,0 +1,38 @@
> +from tests.package.test_python import TestPythonPackageBase
> +import os
> +import time
> +
> +
> +class TestPythonPy3FlaskExpectsJson(TestPythonPackageBase):
> +    __test__ = True
> +    config = TestPythonPackageBase.config + \
> +        """
> +        BR2_PACKAGE_LIBCURL=y
> +        BR2_PACKAGE_LIBCURL_CURL=y
> +        BR2_PACKAGE_PYTHON3=y
> +        BR2_PACKAGE_PYTHON_FLASK=y
> +        BR2_PACKAGE_PYTHON_FLASK_EXPECTS_JSON=y
> +        """
> +    sample_scripts = ["tests/package/sample_python_flask_expects_json.py"]
> +    timeout = 60
> +
> +    def try_json(self, payload, expects):
> +        cmd = """curl -s -o /dev/null -w "%%{http_code}\\n" -X POST """
> +        cmd += """-H "Content-Type: application/json" -d '%s' http://127.0.0.1:5000""" % payload
> +        output, exit_code = self.emulator.run(cmd, timeout=self.timeout)
> +        self.assertEqual(exit_code, 0)
> +        self.assertEqual(output[-1], str(expects))
> +
> +    def test_run(self):
> +        self.login()
> +        self.check_sample_scripts_exist()
> +        cmd = "FLASK_APP=%s %s -m flask run > /dev/null 2>&1 &" % (os.path.basename(self.sample_scripts[0]),
> +                                                                   self.interpreter)
> +        _, exit_code = self.emulator.run(cmd, timeout=self.timeout)
> +
> +        # Give enough time for the flask server to start up
> +        time.sleep(15)
> +
> +        self.try_json("""{"email": "test", "name": "test"}""", 200)
> +        self.try_json("""{"email": "test", "name": 2}""", 400)
> +        self.try_json("""{"email": "test"}""", 400)
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
