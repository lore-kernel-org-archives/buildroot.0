Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A60BBC4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 13:44:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5FA0C610C9;
	Tue,  6 Feb 2024 13:44:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5FA0C610C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6nmdrZsZ8Wav; Tue,  6 Feb 2024 13:44:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9306261162;
	Tue,  6 Feb 2024 13:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9306261162
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E10E51BF5AD
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CD88E81766
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 13:43:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pY35DqoIh42y for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 13:43:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B1E238175E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1E238175E
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1E238175E
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 13:43:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2F46513F8AE;
 Tue,  6 Feb 2024 14:43:42 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Feb 2024 14:43:41 +0100
Date: Tue, 6 Feb 2024 14:43:41 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <ZcI3jenVrfXAzSIK@landeda>
References: <20240111051726.2918732-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240111051726.2918732-1-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707227025;
 bh=bV7tH0fLpSiub4c0fiE/ebUxTouoTowiBeIwrGEprOs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LlbkXc3yr6EQQSJRqZQVR8HG+47wIGvDfhMZN585hKjkV1aqi0q517GCbnZ+p5QuO
 cQdrZ1+e1mNu72dJPZMEzgRPHZuiFFF+tcOH0TLGNFSryu018E3w0jFNEmM2mbviV4
 XZ19+l5GU2GSZHu1tQVUrJQAgnbuHi7sGtOZdXr1jMyNOXy70KhHVk6QOZE3ar9Ss7
 rPZr/IMe55LN8vK4oUa+XKA+fO+uZDtv37akZJs8dN1f83SO8byRBfroHSvtcEu7+u
 01he8iFjVWIcJPmajmitmEaIqLvh0/f4w6xeKI9ooYH6PoIrKPE3PDIJeqnhmHVRzy
 7ckqRCfxEPGMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LlbkXc3y
Subject: Re: [Buildroot] [PATCH 1/1] package/python-rpds-py: bump to version
 0.16.2
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, all,

On 2024-01-10 22:17 -0700, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/python-rpds-py/python-rpds-py.hash | 2 +-
>  package/python-rpds-py/python-rpds-py.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/python-rpds-py/python-rpds-py.hash b/package/python-rpds-py/python-rpds-py.hash
> index b04aa210d3..8c4b6181d0 100644
> --- a/package/python-rpds-py/python-rpds-py.hash
> +++ b/package/python-rpds-py/python-rpds-py.hash
> @@ -1,4 +1,4 @@
>  # Locally calculated after vendoring
> -sha256  87361601241744fff6235e35050addfe34d00508172d2bd4f178193a28727287  rpds_py-0.12.0.tar.gz
> +sha256  861b1fa8c37819b2e2cebbde6dea66ac2fa1247e4a7c3933dbf4c89244d7fecb  rpds_py-0.16.2.tar.gz
>  # Locally computed sha256 checksums
>  sha256  314e4e91be3baa93c0fb4bccc9e4e97cd643eb839b065af921782c2175fe9909  LICENSE
> diff --git a/package/python-rpds-py/python-rpds-py.mk b/package/python-rpds-py/python-rpds-py.mk
> index 6f71d02047..5f0d30d002 100644
> --- a/package/python-rpds-py/python-rpds-py.mk
> +++ b/package/python-rpds-py/python-rpds-py.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_RPDS_PY_VERSION = 0.12.0
> +PYTHON_RPDS_PY_VERSION = 0.16.2
>  PYTHON_RPDS_PY_SOURCE = rpds_py-$(PYTHON_RPDS_PY_VERSION).tar.gz
> -PYTHON_RPDS_PY_SITE = https://files.pythonhosted.org/packages/75/be/e3f366aa4cd1e3a814f136773e506fc5423eff903ef0372a251df34e6e45
> +PYTHON_RPDS_PY_SITE = https://files.pythonhosted.org/packages/c2/63/94a1e9406b34888bdf8506e91d654f1cd84365a5edafa5f8ff0c97d4d9e1
>  PYTHON_RPDS_PY_SETUP_TYPE = maturin
>  PYTHON_RPDS_PY_LICENSE = MIT
>  PYTHON_RPDS_PY_LICENSE_FILES = LICENSE
> -- 
> 2.34.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
