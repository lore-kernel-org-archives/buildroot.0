Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A184DCAC586
	for <buildroot@archiver.kernel.org>; Mon,  8 Sep 2025 10:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3E72584ECD;
	Mon,  8 Sep 2025 10:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z_3J9adCZT4A; Mon,  8 Sep 2025 10:55:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 301B384E70
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 301B384E70;
	Mon,  8 Sep 2025 10:55:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 83E2F186
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81691423C1
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WdvrYvt-DkOA for <buildroot@buildroot.org>;
 Mon,  8 Sep 2025 10:55:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 88007423BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88007423BF
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 88007423BF
 for <buildroot@buildroot.org>; Mon,  8 Sep 2025 10:55:48 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45dcfecdc0fso36016165e9.1
 for <buildroot@buildroot.org>; Mon, 08 Sep 2025 03:55:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757328946; x=1757933746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x0XXiwa2y/Dvh3/x0RoEOAh2jlPPYvW0/TUXvdxcSQo=;
 b=lGoXa621Hw3xPjBVCz3qatUyD/JohkcV3EEGsbl9XsUKAfht+CDsHqFNzqdnmcyE+m
 mGfXcaV1dQ15ZHCu+GE1CUal6oMqgk5V/oy86rK30SRnNBKYwJ9pYcg6T3/O7D0jqynC
 h39j48nCmBbk1eRsqjCDN0u1oMJHuYGTrs+WfnLKgMehEFFcZJTyFbS5VjJj7jbwHfj7
 tyZrdgSnTYYZ0yJzk7JG00UoYo7/a7/m21wI419cEsURm7W0xINTJYZlN6VaxnOPIKN8
 yVMHe9kodNO2yFxD6jfdDWnLMVgTJR+TToZsyMTYCmpGA11JRYQpArjKz8GGVB6faMGA
 rKrw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUX/oLMZAZHz96qW4Cf2jsuP/FHLnwbShluyvOuQGhqrfecczLXowpW5/Q9WJmpekMmxzUKZYfisDs=@buildroot.org
X-Gm-Message-State: AOJu0YzzniG48QVl2apJgxcAzWcXlVkIS9aX1lUtygDq8pk51ndnK10Q
 MGmY30Zz8aR0v/3/0VXa84ndYMafi+LGx7iv3iDwJ3Yf3nvo1hpnCxfJoT+A5qpjYIAsbPRqGde
 tdcAVJRk=
X-Gm-Gg: ASbGncts9vRX7b8YSfjMW4ZncgnQqRVaewT8vhxuBVjxYNiTuO4YGChus7aoCbT7xn5
 z+ktIXBmEfUsmtOk/yZz4TpK94ky8jBLt/NgZWV2g0sMRQUni6FPkqg74ZYvCtTQIA+I38W+iYa
 J7LnCt7imNmyDdjMTAQBIdgAIgyQL2nohOErKQ2+Cy0i97eZgxzsIWe6c6lX5Gi8qZ20xLuSXQi
 OaLkXrSIlZN8DFnQs/aS4Ukkn09AGog976PKrbh3DgSnEZ/7Idzn79QBa/Uy9FWDRRyCf2IU7VL
 v8SibNtu1mAioXFU888yXDgRGoJ42Qs2G0RR+3KTOeUlsrI7JbHvjETQ5c8SRjrFzzQc4kru2oE
 9bC1GSw55I/DDMzJ2gXfGihMygJyxjQrlPoLGTSkFH+U/ZJTVeFKhGmHxsxA0I3/RJBSx+PvOZ6
 17RiuQzGjS0b5ZJvNhJaZ7C0Hk
X-Google-Smtp-Source: AGHT+IHl7h5ZfPD8pdOyymHByva5297kvxHBhoV77GDtGzrnDyVkEs7Zy4IAo48lXO2kDIOxfTJecg==
X-Received: by 2002:a05:600c:3596:b0:45d:d6fc:2509 with SMTP id
 5b1f17b1804b1-45dddeb00bfmr76726845e9.6.1757328946523; 
 Mon, 08 Sep 2025 03:55:46 -0700 (PDT)
Received: from sah2lpt241.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45dd0aec70dsm91505235e9.0.2025.09.08.03.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 03:55:46 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Mon,  8 Sep 2025 12:55:45 +0200
Message-Id: <20250908105545.681618-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250818202709.3216273-1-thomas.petazzoni@bootlin.com>
References: <20250818202709.3216273-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1757328946; x=1757933746; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x0XXiwa2y/Dvh3/x0RoEOAh2jlPPYvW0/TUXvdxcSQo=;
 b=cbjwa8sFBmZANu9RSvu51vcxYM7F4yAo4y7XbZvHqedDHl/S0lgwHNL+lIeqJbICvz
 VGzp7pJ5WuMuCfqWOAOXr+HG9AcBiPklr+BwXn/0RriOewHO6pW0p/g25MqvDldvPuLk
 Qaz9Rqgm/W8myFeaRT0Af0fRXffGzUHlYbdE5To10oDCQbtBB9jUXFrWjBsnDBy77f0q
 wPbZadHQIhWvrh/JoL1KqJKeu6JAxm2t3P3osIa5KW5YSRKST7mUHHs3EZjZXgERtqg3
 E9xHqRn8ScwqOy4jc+buV40B6tjoX0ufCpZVrBBfUZrJxR4/qsaseq7EJkby6kdjVJ37
 SCDw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=cbjwa8sF
Subject: Re: [Buildroot] [PATCH] support/testing: use again the default
 BR2_BACKUP_SITE
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> This reverts commit 559bb33ae71dd2358ca2314ccb24b56cc3809fc1, which
> was disabling BR2_BACKUP_SITE in our tests with the following
> reasoning:
> 
>     support/testing: do not use s.b.o
> 
>     Currently, the runtime tests will use the sources.buildroot.org backup
>     mirror, which is the default setup.
> 
>     However, in some cases we do not want to use the backup site, because we
>     want to ensure that the download actually works.
> 
>     This is the case for vendored packages, like cargo or golang packages,
>     for whbich we want to check that gthe download still works when we
>     update the rust or go versions, or when our download helpers change.
> 
>     So, disable the use of the backup site in all runtime tests, and drop
>     the no-longer needed special cases.
> 
>     Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
>     Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> However, not using the backup site is causing a LOT of random failures
> in Gitlab CI, making the results barely usable. Since it's more
> important to get real failures than random ones due to download
> issues, let's re-enable BR2_BACKUP_SITE in our testing infrastructure.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2025.05.x. Thanks

> ---
>  support/testing/infra/basetest.py               | 1 -
>  support/testing/tests/download/test_git.py      | 5 ++++-
>  support/testing/tests/download/test_gitforge.py | 5 ++++-
>  support/testing/tests/download/test_ssh.py      | 4 +++-
>  support/testing/tests/package/test_rust.py      | 1 +
>  5 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
> index 4f020e8a93..9fb9dffc53 100644
> --- a/support/testing/infra/basetest.py
> +++ b/support/testing/infra/basetest.py
> @@ -37,7 +37,6 @@ class BRConfigTest(unittest.TestCase):
>          super(BRConfigTest, self).__init__(names)
>          self.testname = self.__class__.__name__
>          self.builddir = self.outputdir and os.path.join(self.outputdir, self.testname)
> -        self.config += '\nBR2_BACKUP_SITE=""\n'
>          self.config += '\nBR2_DL_DIR="{}"\n'.format(self.downloaddir)
>          self.config += "\nBR2_JLEVEL={}\n".format(self.jlevel)
>  
> diff --git a/support/testing/tests/download/test_git.py b/support/testing/tests/download/test_git.py
> index 3cf98f6456..ba52e03ef5 100644
> --- a/support/testing/tests/download/test_git.py
> +++ b/support/testing/tests/download/test_git.py
> @@ -7,7 +7,10 @@ import infra
>  
>  
>  class GitTestBase(infra.basetest.BRConfigTest):
> -    config = ""
> +    config = \
> +        """
> +        BR2_BACKUP_SITE=""
> +        """
>      gitremotedir = infra.filepath("tests/download/git-remote")
>      gitremote = None
>  
> diff --git a/support/testing/tests/download/test_gitforge.py b/support/testing/tests/download/test_gitforge.py
> index 477c365a34..e1ac35ec67 100644
> --- a/support/testing/tests/download/test_gitforge.py
> +++ b/support/testing/tests/download/test_gitforge.py
> @@ -5,7 +5,10 @@ import infra
>  
>  
>  class GitforgeTestBase(infra.basetest.BRConfigTest):
> -    config = ""
> +    config = \
> +        """
> +        BR2_BACKUP_SITE=""
> +        """
>  
>      def setUp(self):
>          super(GitforgeTestBase, self).setUp()
> diff --git a/support/testing/tests/download/test_ssh.py b/support/testing/tests/download/test_ssh.py
> index 7d6ac3aaf7..126002a355 100644
> --- a/support/testing/tests/download/test_ssh.py
> +++ b/support/testing/tests/download/test_ssh.py
> @@ -7,7 +7,9 @@ import infra
>  
>  
>  class SSHTestBase(infra.basetest.BRConfigTest):
> -    config = infra.basetest.MINIMAL_CONFIG
> +    config = infra.basetest.MINIMAL_CONFIG + '''
> +BR2_BACKUP_SITE=""
> +'''
>      sshd_test_dir = infra.filepath("tests/download/sshd")
>      sshd = None
>  
> diff --git a/support/testing/tests/package/test_rust.py b/support/testing/tests/package/test_rust.py
> index 8160cb6053..763125ca20 100644
> --- a/support/testing/tests/package/test_rust.py
> +++ b/support/testing/tests/package/test_rust.py
> @@ -70,6 +70,7 @@ class TestRustVendoring(infra.basetest.BRConfigTest):
>          BR2_PACKAGE_RIPGREP=y
>          BR2_PACKAGE_PYTHON3=y
>          BR2_PACKAGE_PYTHON_CRYPTOGRAPHY=y
> +        BR2_BACKUP_SITE=""
>          """
>  
>      def setUp(self):
> -- 
> 2.50.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
