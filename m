Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4420C27C54
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 19:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 55FDB41938;
	Thu,  6 Jun 2024 19:40:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DkP81SGE-Yh3; Thu,  6 Jun 2024 19:40:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D35441936
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D35441936;
	Thu,  6 Jun 2024 19:40:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3B3A41BF57B
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2550884722
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 19:40:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 00TvO1eWag5M for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 19:40:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1112184715
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1112184715
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1112184715
 for <buildroot@buildroot.org>; Thu,  6 Jun 2024 19:40:31 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-421578c546eso13483895e9.0
 for <buildroot@buildroot.org>; Thu, 06 Jun 2024 12:40:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717702830; x=1718307630;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JX0IdesHRfY7DQmce9yNDu7Eu0RcP3/yYJ+E5PeXfhU=;
 b=j7RChwZz1dBRYBToVnsKh16AMxnCO6/Uu0hID/N8aY9Q5a8CtCj8OelNS1jFCwB+ZZ
 63hmaxRHz8uaFmF8/G8paOmLdhuNhl3XeReNbXsiIQvV6pUj7O5hH3ip9ms4SnYDszFE
 I/6m3/vjRODpJdT+syZtgr4E+Tc5sgU0zGOmfdgNEvOj0I4yhjpKDKN0Brz/8chrk3FY
 CHYsd8mbbKqZTIpip665YNr5HU7uW61GDrZf804QWNi46+x45hiNb4rFnkchcwyF0EAF
 LOxbjcxnfXUtt6wi66INwrW5GDRGT7nFV4jDCarxQ2kEXVTeTkP6ZhhrIWw7WBkqVzoE
 wpkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+PFEsPZrPuRNnBFfuUI7GwG9T+kEYPHTE9/3pw6t4fW4YLU7PUVGFOTkC1J8/be17DrPN8quGqrxmjJz59m55QtjkvtFVgA==
X-Gm-Message-State: AOJu0Ywk0q9Vidskb5B5WLxX353oOSZebdBRcbMO2L+APe+5T/okwBDB
 AkGWVBJAz35rSBnNX8ec7YafCJZ5revboCtsR2kB9U+KmKMxjiTpbZ553GB8/w6ymBhMJYTaKOa
 c
X-Google-Smtp-Source: AGHT+IGYMA1NkBVDjYOIyqsdWEmQBxMVjO0Mx3ojiLWWK/B6mX4FUjYA3sPecy1Wquzda4kiYdQUNQ==
X-Received: by 2002:a05:6000:183:b0:35e:7eaf:847f with SMTP id
 ffacd0b85a97d-35efed4b749mr398560f8f.15.1717702829819; 
 Thu, 06 Jun 2024 12:40:29 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-35ef5fd1b56sm2316383f8f.112.2024.06.06.12.40.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Jun 2024 12:40:29 -0700 (PDT)
Message-ID: <8dc84ced-c9db-44f1-b576-dd80a3bf105d@mind.be>
Date: Thu, 6 Jun 2024 20:59:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Brandon Maier <brandon.maier@collins.com>, buildroot@buildroot.org
References: <20240513213035.1738493-1-brandon.maier@collins.com>
Content-Language: en-GB
In-Reply-To: <20240513213035.1738493-1-brandon.maier@collins.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1717702830; x=1718307630; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JX0IdesHRfY7DQmce9yNDu7Eu0RcP3/yYJ+E5PeXfhU=;
 b=BSNqQcEkNcyz408yXiPBPHPB8pA5/yIiLlX2QkMhCLKELTzWQYffQSWl6SALh4iUrf
 3HiCPDKxPoaJIccIH2QLbWz/LaryAcEuSk7RJw/EgUJl51JFC4Fqvvc3trAoZK12AFf+
 WOtbaMUQkEscP9pys/2ksFUYnb48cphyVb6rWPLhdmgdLWQksJ2/5BmKeIi9RuxKNxLo
 /nqcJyQNliOwDC9qIJA08Z0MyEDhCqRDGNNUS8kWA3I7IbU77zTELTaDejUcwMAYnocn
 OR99GLYA5zeFGUap2cwf4oSLpio0Dwqx+4lsq1S3cn+d602Nf9X46SjHMrDxPvUR8Lno
 p5vQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=BSNqQcEk
Subject: Re: [Buildroot] [PATCH] support/testing/infra/builder.py: fix
 missing $HOME during build
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



On 13/05/2024 23:30, Brandon Maier via buildroot wrote:
> When running a test that uses host-python-setuptools using the Buildroot
> Docker image, for example running the following command,
> 
>> ./utils/docker-run ./support/testing/run-tests -o output -s -k tests.package.test_python_pytest.TestPythonPy3Pytest
> 
> The build fails with the following error,
> 
>>    File "/home/blmaier/buildroot/output/TestPythonPy3Pytest/build/host-python-setuptools-69.2.0/setuptools/_distutils/dist.py", line 354, in _gen_paths
>>      yield pathlib.Path('~').expanduser() / filename
>>            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>    File "/home/blmaier/buildroot/output/TestPythonPy3Pytest/host/lib/python3.11/pathlib.py", line 1385, in expanduser
>>      raise RuntimeError("Could not determine home directory.")
>> RuntimeError: Could not determine home directory.
>>
>> ERROR Backend subprocess exited when trying to invoke get_requires_for_build_wheel
> 
> Python setuptools is looking for $HOME but failing to find it.
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   support/testing/infra/builder.py | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/support/testing/infra/builder.py b/support/testing/infra/builder.py
> index a2abb9ed89..295bc7b83d 100644
> --- a/support/testing/infra/builder.py
> +++ b/support/testing/infra/builder.py
> @@ -52,7 +52,10 @@ class Builder(object):
>                              "> end defconfig\n")
>           self.logfile.flush()
>   
> -        env = {"PATH": os.environ["PATH"]}
> +        env = {
> +            "PATH": os.environ["PATH"],
> +            "HOME": os.environ["HOME"]
> +        }
>           env.update(make_extra_env)
>   
>           cmd = ["make",
> @@ -79,7 +82,11 @@ class Builder(object):
>           in the environment that calls make.
>           e.g. make_extra_env={"BR2_DL_DIR": "/path"}
>           """
> -        env = {"PATH": os.environ["PATH"]}
> +        env = {
> +            "PATH": os.environ["PATH"],
> +            "HOME": os.environ["HOME"]
> +        }
> +
>           if "http_proxy" in os.environ:
>               self.logfile.write("Using system proxy: " +
>                                  os.environ["http_proxy"] + "\n")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
