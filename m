Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9FC1D111A8
	for <buildroot@archiver.kernel.org>; Thu, 27 Nov 2025 19:57:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DD04616DF;
	Thu, 27 Nov 2025 19:57:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c82LhDrMdbtk; Thu, 27 Nov 2025 19:57:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 723F461493
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 723F461493;
	Thu, 27 Nov 2025 19:57:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CE3752A9
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:57:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0592842B2
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:57:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3CbP-Olpbd2f for <buildroot@buildroot.org>;
 Thu, 27 Nov 2025 19:57:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B698B842AE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B698B842AE
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B698B842AE
 for <buildroot@buildroot.org>; Thu, 27 Nov 2025 19:57:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id F1CBBB979CA9; Thu, 27 Nov 2025 20:57:09 +0100 (CET)
Message-ID: <23a8a207-dbe2-4a18-b12c-788f03dbc03c@rnout.be>
Date: Thu, 27 Nov 2025 20:57:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
Cc: Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
References: <20251112110644.4054902-1-peter@korsgaard.com>
 <20251112110644.4054902-3-peter@korsgaard.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20251112110644.4054902-3-peter@korsgaard.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1764273430; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=DYMkEcNOLy1lgzLixKyp9fqJTylcjE6qXfugkLoUVnQ=;
 b=i49jlbjjPi1UEN0uYX4qPQyMfl/Z1Rc59cmRDYxl50we0l2yYrxUdFPmZfOcEwvVfUBppY
 bhupsiMvB2lRx3yHwvaUhtJKIV6+gK3Lja9lSeAQ2+TrqNSKVjz3xzVPPprNnR2zEJ2ap8
 4nym5mrVBhlq0fu3bGilZZR9YBc7R0uuDvrrVOJmfn+HVVIu80GOtT8qXOgmPbJYhTvhUB
 rYhlNdiGFVSzpTKw/vpshlTv1XR5VF/du0Tgy093tdWiLefAC8BczpAkFHQ8mACCpbbV37
 jEKeWtTv60nZiIZHsm8hEPd1oZ+3GBBq7O+17OjEOSgM69hJznBCFgeuHYEYvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=i49jlbjj
Subject: Re: [Buildroot] [PATCH 3/3] utils/check-package: add a check for
 'default n' in Config.in files
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 12/11/2025 12:06, Peter Korsgaard wrote:
> Boolean Config.in symbols default to 'n', so we typically do not add such
> redundant lines.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

  Applied to 2025.02.x and 2025.08.x, thanks.

  Regards,
  Arnout

> ---
>   utils/checkpackagelib/lib_config.py      | 11 ++++++++
>   utils/checkpackagelib/test_lib_config.py | 33 ++++++++++++++++++++++++
>   2 files changed, 44 insertions(+)
> 
> diff --git a/utils/checkpackagelib/lib_config.py b/utils/checkpackagelib/lib_config.py
> index bf975d7a3b..202baa7f1b 100644
> --- a/utils/checkpackagelib/lib_config.py
> +++ b/utils/checkpackagelib/lib_config.py
> @@ -242,6 +242,17 @@ class Indent(_CheckFunction):
>                           text]
>   
>   
> +class NoDefaultN(_CheckFunction):
> +    DEFAULTN = re.compile(r"^\tdefault n$")
> +
> +    def check_line(self, lineno, text):
> +        text_nocomments = text.split("#")[0].rstrip()
> +        if self.DEFAULTN.match(text_nocomments):
> +            return ["{}:{}: boolean symbols default to 'n', so 'default n' is redundant"
> +                    .format(self.filename, lineno),
> +                    text]
> +
> +
>   class RedefinedConfig(_CheckFunction):
>       CONFIG = re.compile(r"^\s*(menu|)config\s+(BR2_\w+)\b")
>       IF = re.compile(r"^\s*if\s+([^#]*)\b")
> diff --git a/utils/checkpackagelib/test_lib_config.py b/utils/checkpackagelib/test_lib_config.py
> index 474d17105e..35614ef152 100644
> --- a/utils/checkpackagelib/test_lib_config.py
> +++ b/utils/checkpackagelib/test_lib_config.py
> @@ -387,6 +387,39 @@ def test_Indent(testname, filename, string, expected):
>       assert warnings == expected
>   
>   
> +NoDefaultN = [
> +    ('good example',
> +     'any',
> +     'config BR2_PACKAGE_FOO\n'
> +     '\tdefault y\n',
> +     []),
> +    ('default n',
> +     'any',
> +     'config BR2_PACKAGE_FOO\n'
> +     '\tdefault n\n',
> +     [['any:2: boolean symbols default to \'n\', so \'default n\' is redundant',
> +       '\tdefault n\n']]),
> +    ('default n with comment',
> +     'any',
> +     'config BR2_PACKAGE_FOO\n'
> +     '\tdefault n # this is a comment\n',
> +     [['any:2: boolean symbols default to \'n\', so \'default n\' is redundant',
> +       '\tdefault n # this is a comment\n']]),
> +    ('default n with trailing whitespace',
> +     'any',
> +     'config BR2_PACKAGE_FOO\n'
> +     '\tdefault n  \t\n',
> +     [['any:2: boolean symbols default to \'n\', so \'default n\' is redundant',
> +       '\tdefault n  \t\n']])
> +    ]
> +
> +
> +@pytest.mark.parametrize('testname,filename,string,expected', NoDefaultN)
> +def test_NoDefaultN(testname, filename, string, expected):
> +    warnings = util.check_file(m.NoDefaultN, filename, string)
> +    assert warnings == expected
> +
> +
>   RedefinedConfig = [
>       ('no redefinition',
>        'any',

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
