Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 284B9CCF2C4
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 20:51:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6FBB4074E;
	Sun, 18 Oct 2026 20:51:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ZslhZ_3GJ3n; Sun, 18 Oct 2026 20:51:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AD503406D9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792356704;
	b=baEHc7p/RYwFJbn23Sizo+21RwK3wbpX5ToURBNaclxDF+GCdjD69sPdaTtYvF/oIMpp
	 ZfQrVtc+BJinOf6k4HiccZOrU7JHSGq5co+pPoYpqh4IV5E2VDPnyo6CMgYVseeGTjQ5T
	 4NZ3lJ8Wmtt4cp/t6q1txTKfcqzzNfeA0BsXCf01lv6rAK8TajDtqhDqK6Eq4HEz5BCdo
	 ZHl6cP+p6vvZc8d6J/3Qd0PXDafApVxv9Dfzma51iA9oNgp/iuo6DGoD3fc7U2qkYl5ev
	 4HtdxipEHOhkZWx1w6//zj8ISHXNsua8CdLitK3piERunCQ48eEE+CqohpJl7XLcCzA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792356704;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=18J3JpJxLaw1RmNgNv9pa0HN22MXjiQxkpC4rdSzP3U=;
	b=Qon9Y73rQj6bKBiABBJmM8s9R3JSsE+c6DCPh9gzpDUIcknYr2tXLSLqe3Ph9DijMdqY
	 zCtQ6j+gIJ7+VknUrKwjuVVxXRNQNYq+f6xj2vxsEYeWT0qiRUDulaZBG3WKZahBxNTVz
	 p7wr7RMu0HuRUh5amIbEu3/J2pEVAN4K/QZ2Ra1cDW/Qz4rCQorJWySFfaa7yjlQC+MMn
	 EFje4CvpKoSqITiRylRUo1RdKHy4odie7WLaVVogWSkvG8cmz8hmPf1v0glC+Lrsa+Qgq
	 PA8Gawm3XpC/+8iEPUAnvttDEBJlKZdgNqxPAiU905Ji4RCGVSQKjKzyxCdHrQJRIGA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792356704;
	bh=18J3JpJxLaw1RmNgNv9pa0HN22MXjiQxkpC4rdSzP3U=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=QOhXO6r178P4cbsA6T+6V+QpT/8Y5V7Oespn+7vsYabLW9PaOv6fxtQT6GJ3s7sBq
	 i11Pd3nyYEWS0ujORfW0AgfmEgEXm71oUQHBbPqHgRJCriHIggu8KQrfkAQtx6prI2
	 qNnOKMpfC/IpIIxduum4Sow++BgLuwBEOfAIHDmVzmcMQ8Ksg83Xq708U0cjqg1j1F
	 PzbnxvyqYYOaQ6HprmOoLIfLQkYTr4aXi7iyu2GAP17GsRRuEDPjbAREY0K6RqF/li
	 oZOrEW6eLMoMoVA+kCyWA0gLVtOnnPaNeUpKo6lNmydgsqPzkONY2NSFQjNkKZNdYu
	 5NOfXDyJgIk4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD503406D9;
	Sun, 18 Oct 2026 20:51:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 131DB1AB
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED03E6060B
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:51:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MTT-qvJVkPwr for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 20:51:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4BDEA60656
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792356699;
 b=rohQ+t70+uagkQaHk0GYOu0ByhqcgipGBPSBmOizBuL5xKb4bgcrB7bpIXhO2MbUtwQm
 jaKBfGIzk2GaNJUSSiY9nmXnhhMJn2lwDs3INXi9HJw0ZE0gwkspvaTBuWJd8lrmOve/L
 FYpeGbwgpUziODZxMZ1bw9Cj0yBzYUMs2KxYEJ1qpkQqn9egRNUFzpBZK8a13bLokVokx
 slYH7mw+Oc1EFe+L3mnvZV4rf+B8iuB89suLcAIZ6bW3efzKBNSOZwzqfN3X9Sa4qKLB9
 q5LfXKUVnJbEK5wFnCnIYzsmONfr4fOVFR6MhKcnQlq0P3KkW5qAVjtcKQFygO3/wUA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792356699;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:References:Content-Language:
 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=Fg0RPrUNbNLrnVFRDhVtwNeCzSHRl3WrdQKWqmGOqcg=;
 b=HT37iex/DmrZ7qkmtIor5jgvyWEnaVI9GTX2xDsoqSOfUwtDhJHKi07tSjVcM/pxhde4
 ho28fUELg1v9Jv8PB8FJm/5nUfPxWsgNkfdrLZkIUYUKAyuNPXWT9wUAqTaI2RDGYV6bE
 cAen3ri8Wm+q3bKWpJiWYAfjY3aJlLtX1MyXuY1mwQk0X9XvM8vexqoaXajo948Z27Ie/
 sndJKvNakZ2n6TIi0iS1HsEQKDhCllopkE6BYNe1vMtDSskxJkGkwDbKbcfrA3ShA5dmK
 U2dNN1yepw/aj+pIvIyJtnetUxmMG9o+xUaLuGt+Jf9q1lChO0c5v67iQGObg/KvpXQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=YgQLdw5H; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BDEA60656
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 20:51:38 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6Daq-1xGKvI1S6y-004hz1; Sun, 18
 Oct 2026 22:51:36 +0200
Message-ID: <307b4464-69be-424f-9ac1-b6c3888670f4@gmx.de>
Date: Sun, 18 Oct 2026 22:51:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20261018182507.536698-14-james.hilliard1@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261018182507.536698-14-james.hilliard1@gmail.com>
X-Provags-ID: V03:K1:TMI15CmqdfHeSgf62R73nFrAQMsc0u5BHi+B5fwqOQy8pvg6llI
 O/aY1DfWJH8tyvJayDYsO5J9daURkcJzNsrSLadrrZwF089ex9nesdLlS6O1nxfL8sp+Gqg
 E4Wm6cbJblLfMjhgvrbcoi/N//JCL9pAwhPFaqr5OJVMcINy8ipJ+0hFv/qSYxCw59ZEcse
 Qm6IyIq3VQ43lv7xnbFEw==
UI-OutboundReport: notjunk:1;M01:P0:p0ra3saKz8Q=;maAtghISLrBGXmjh7PlmUjy66hB
 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
 QQqoOwMn9ks=
Subject: Re: [Buildroot] [PATCH] package/python-tomlkit: bump to version
 0.15.2
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 18.10.26 um 20:24 schrieb James Hilliard:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thank you!

> ---
>   package/python-tomlkit/python-tomlkit.hash | 4 ++--
>   package/python-tomlkit/python-tomlkit.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-tomlkit/python-tomlkit.hash b/package/python-tomlkit/python-tomlkit.hash
> index d796a1c53d..8411872c4e 100644
> --- a/package/python-tomlkit/python-tomlkit.hash
> +++ b/package/python-tomlkit/python-tomlkit.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/tomlkit/json
> -md5  8e5245fd4099c9a6f99774b24a4591ae  tomlkit-0.15.1.tar.gz
> -sha256  e25bbf38843005246210a12982776f27f99cb9be67160e14434d0c0d21ee1e97  tomlkit-0.15.1.tar.gz
> +md5  65f5e37b20e3b81a5ba29e8149e01c01  tomlkit-0.15.2.tar.gz
> +sha256  83e32755ba1d20d9340bd069ee97e9f6232ba2346b63ffcba425de01f7e327a6  tomlkit-0.15.2.tar.gz
>   # Locally computed sha256 checksums
>   sha256  f2f9b460ba719da6626add264d3782f275a4ff7aab677beda08b330911e23adb  LICENSE
> diff --git a/package/python-tomlkit/python-tomlkit.mk b/package/python-tomlkit/python-tomlkit.mk
> index 1466772fd9..5dc015533a 100644
> --- a/package/python-tomlkit/python-tomlkit.mk
> +++ b/package/python-tomlkit/python-tomlkit.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_TOMLKIT_VERSION = 0.15.1
> +PYTHON_TOMLKIT_VERSION = 0.15.2
>   PYTHON_TOMLKIT_SOURCE = tomlkit-$(PYTHON_TOMLKIT_VERSION).tar.gz
> -PYTHON_TOMLKIT_SITE = https://files.pythonhosted.org/packages/94/96/e07752635b98536177fa1f37671c8f3cdde2e724c6bcf6034b2cfb571565
> +PYTHON_TOMLKIT_SITE = https://files.pythonhosted.org/packages/08/72/fc01563df95c189a9f65850096bdc205bc2fe37da6c740cd64afaf18d07e
>   PYTHON_TOMLKIT_SETUP_TYPE = poetry
>   PYTHON_TOMLKIT_LICENSE = MIT
>   PYTHON_TOMLKIT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
