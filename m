Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591D8CA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 238E7606EF;
	Sat, 10 Oct 2026 20:35:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4C8P4Ipgbsld; Sat, 10 Oct 2026 20:35:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 49A9B60632
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791664509;
	b=MG+bDilegm6svu/wdbFpNAoIM8GRMesCmNyHadT4yZEgSG2d7l1M5n2lSHMkS48ZSv+n
	 tFOW/IuX24gv1CVZXd913rqxQyr+fD3+b3yxZgnuL9Z392iSFI0Ie+AL4kw+SQBwr4TcD
	 BUl+7lU0gLuusWd2A3c90CBBD10CIkJi8m3NejiSIqCQQUFxIbY8rmT4GCADpwXFREZBq
	 Io5yXar72mpA0iZ48wAnnivNy/E3uMbQem2Tgivt7bEcIwBu5UOoL//2ze7sHuaYWLFg8
	 O2AUtIegECi8/aVnmqhe3M76eS0EmrMy49D4kamuz1FtP81I4Ole5uJimKMIcVchMqA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791664509;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Last-TLS-Session-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Content-Transfer-Encoding:
	 Errors-To:Sender;
	bh=YbDRsXfr4LBg9w9rDla8Ba4Kr+WnfaCWxPnLA7tBc18=;
	b=TUabzXhfhBs2lKpOELJxmcub5sWppvJ5sBe+9dYASP9f0u/VCa8hR3f1OJ1m9PVohFbn
	 l9Vj3JeB01D/UC+fCHeI8LIsJWg6Dl7x8uup8dZ6b7K54JvG0VZ0b49Tu0WvKRH5ujeYX
	 4aQv2NEOIjW+DLOpj++VSbRcv6b+PTKMA5UWe/4pHlALgqCHP5nArIydCzdpvYd+Y0Wso
	 FxTcS0pESrhFIiQAXfmNC65buP/AaxejCE4Q6g5Y+TeRwAmLMizgHq6cTPjdB0WcX24Ac
	 7xnjZWy+m2gtGHU487i3o53LJgUcx6UUdIxQoE51rWRcJBtGmKAwGy84mUutvT/B2zw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791664509;
	bh=YbDRsXfr4LBg9w9rDla8Ba4Kr+WnfaCWxPnLA7tBc18=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KaPgCrmBHZ7oRHp54zVWBlXsjny+rfMYXlrRycVnFGgDdsfx5XuQ2Khj/Rqp4zYi9
	 qwjUsAqpdD67jbrdJUsR/UlEfUR3/OertYqT47p7m2v/ZGelsFaG0JnGqG9xTrnzoT
	 /43fQ0xr4N3KWoyFLYr0Z4OczAklXHqGOHds61NVq1ZGiLUH0w71FVmTXwRW/G8dAX
	 3NxVCbIR4Ks56z4kN1EMncEER6jBGKpRTM7DNlO7KeUQZV8J9Y0cSXCKNAsbxx4LR4
	 z3XFriXZc29UccV6wVxnbzO7ZtfLg3KVMVeo5QTEuzIbuN69VSG8RGyF+Kb/Zl968X
	 +pux25Fq4R/Mg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49A9B60632;
	Sat, 10 Oct 2026 20:35:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D793A235
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C92B6810C2
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:35:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gx9BP5Ze8ZC2 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:35:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A7CF4810C5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791664506;
 b=N2Hk8kyeV84B3VAHaG2YN5TKZHideZUd3dRHsZ1bgrSFAt1t5KPUVGle2z16L6rjlwc7
 urj1VMLQA39xNcx+ZDhP77PrQZqJeQgTaEDFcjgHi2wV/Ek/ygYyIkl3fRJ18/exOOtQY
 BZSvKwugoci90CyWj/ciBOswKvS510UhY5vGQ2xiZdE/kOUwXQVoUCdRMHmG7WdZ2vJAb
 +//66Y5BimzwCWHRwh6EDJSstxXB3tQRP2pT2ZDHoLRIHm+0xyngivJ4tjrBQ61z4Ffja
 JrILgkFtjyHyBzU/3Ecd5X1ozRhuJ/uNxyk5dtKmnrHmthtIk1+Zytfp22mMenQyLOA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791664506;
 h=Received-SPF:Received:DKIM-Signature:From:To:Cc:Subject:Date:
 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=pwtc5zJZU9X+XS2hr9uh6GlAR/ph+4qTbosl29Q4xDk=;
 b=Oh0cV8NoQUmeFjE4BW+q3dOnKas7InWzSWvuMiUn+w3oJf1ESTewGHsTwj1dMeIk6sHC
 xZUg1rz12a2XBblvPNKrRUvqMFVNCTexpxz6qBgHmT8wOxpAMCpGIQp+7kXwMJ2tTH8fF
 DH/yCGeeUWkN6eS5v0ri6iNX1ewAtT3UYY3Wi2FxSb+o+qufIhcGZseNqFrGWGbPugUSD
 x6yGR7s01VVO7n/zOAT/lOnlz+C16YyE+ALq0rv3eYirvVroday3bL4FkA1I6tDIYMJH3
 Njqw5CxZ86SiNq9p3WY43mzEzaAsB4ymA4bUqJS0fxGdtmMzLoPSYEM7MX5cJmlr06A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=rnout.be;
 dkim=pass header.d=rnout.be header.i=@rnout.be header.a=rsa-sha256
 header.s=dkim header.b=E+LVeaRE; 
 arc=none smtp.remote-ip=79.99.201.12
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A7CF4810C5
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:35:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 11151B978F6F; Sat, 10 Oct 2026 22:35:01 +0200 (CEST)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
 Quentin Schulz <quentin.schulz@cherry.de>
Date: Sat, 10 Oct 2026 22:34:59 +0200
Message-ID: <179166384874.45826.16174581448808179626.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260624101340.80670-1-thomas.perale@mind.be>
References: <20260624101340.80670-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/9]
 testing/tests/utils/test_generate_cyclonedx.py: test scp-style git sites
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 24 Jun 2026 12:13:32 +0200, Thomas Perale via buildroot wrote:
> The commit [1] fixed a formatting bug with the SCP style git sites
> declaration.
>
> Add this style of link to the test case to keep a track of it.
>
> [1] ebcfdb8b0a utils/generate-cyclonedx: fixup scp-style git sites
>
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

 Applied series to master, thanks!

 I did minor spelling corrections to commit messages along the way, and slightly
larger changes to some commits, which I'll reply to individually.

 Regards,
 Arnout

> ---
>  support/testing/tests/utils/test_generate_cyclonedx.py | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
> index e6640fbd0d..b91add2349 100644
> --- a/support/testing/tests/utils/test_generate_cyclonedx.py
> +++ b/support/testing/tests/utils/test_generate_cyclonedx.py
> @@ -149,6 +149,7 @@ class TestGenerateCycloneDX(unittest.TestCase):
>                  "uris": [
>                      "git+git://git.example.org/foo",
>                      "svn+https://svn.example.org/foo",
> +                    "git+git@example.org:project/foo.git",
>                      "https+https://sources.buildroot.net/foo",
>                      "http|https+https://mirror.example.org/foo",
>                  ],
> @@ -172,6 +173,11 @@ class TestGenerateCycloneDX(unittest.TestCase):
>                      "url": "https://svn.example.org/foo",
>                      "comment": "svn repository",
>                  },
> +                {
> +                    "type": "vcs",
> +                    "url": "ssh://git@example.org/project/foo.git",
> +                    "comment": "git repository",
> +                },
>                  {
>                      "type": "source-distribution",
>                      "url": "https://mirror.example.org/foo/foo-1.2.tar.gz",
> -- 
> 2.54.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
