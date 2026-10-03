Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBE6CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 10:16:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E135A60EFF;
	Sat,  3 Oct 2026 10:16:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Oe7qGzgYU2h; Sat,  3 Oct 2026 10:16:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 25E7F60EF8
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791022561;
	b=m/1V9hF6GaF2IfV/M2VF2Jd1X33nUs+LD6yNLIEBnT+k0gR7Uol2suxpUWG69qYsBap/
	 MXCy44rL0KTDsFNSMi5r2jhQwS5rNwt2+srcAvpAKp80AVNW59C+687j6eggwRSFR6XPE
	 GP4b93H08YCLmp51PO+j5F4kxTMeWZurXOFFVceEwi5AqOn0u5asa21P6Ddw2xWGHRF3R
	 /VFDcQKnmEadL6YjUP/RHS/r4RNNUqE5R5wV9lFez7y6j13EdVbkFnN4ntc5LP9eoxmA6
	 v5/Di9I7Be3x9/ybGyTbvc5hyQRhquDHyFQaVGB2LHshxmT3ioYbdIz189bhPgTehwA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791022561;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=atyEhl39lxl7QF97A+nA3Gfg1Rx/+MJG6/RktrqWHHU=;
	b=pt1LQNlUpaKJr9HoW/+HxC1bFpygB9d7kg+2YZhtuAtQhj3uB5XajFlFl7AVxQMDzscI
	 b6HvlcpQ+qwb/iIarYGRrRE5frC/dw9vOreuxKzZOwVVUuGPppBRojQ9gRbVVv1/XBl8x
	 iIV6Q1CkUL/udKx1SPjzCnIpU3egAgoLV4M8bPg3w0BNXtq089tjwh+5TQPlp3blp+/n9
	 s8VVYhJQ9FY7CGJrwR1sCVB5S/4iCpgVflHtc2Acrnp0TVkgHzbK+99OapLu1UWIG9vHG
	 HxfcYS9M8SFShlFCyv/2cwK3f43WPJEPDjgY6PPHJcyw3mZZacBpZnSUcFLfmvJkNiw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791022561;
	bh=atyEhl39lxl7QF97A+nA3Gfg1Rx/+MJG6/RktrqWHHU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=U9SVQehaEipm46tCNnwc+Rxo4mUoS6qhyAhx0UBSgPPNheRtRspFVgKkOrMg+Bwa0
	 SyYOQjGFswyZKkSku+eSmAi+MXaHUY73P1v/8zVdTcCqObaxCGfoYeOo5jFh1pEnil
	 pZH/NIdiTgIqomctCt92yYsrvihw+rPb1NgijXvjyiIcV5lSKd7Kq/kEf8ejkXbk0K
	 6obHnHEzuT8lm/bhMuBqQtEI7RrPnVJdteyACG9Ljo9ZfmbaZs4txi23uf7E8kSOJD
	 fwEgZNE0jW/KLoz5JIhUQsi+ZsksAUZpsTC8+MEdM2WNXa/TrpjA2RPzPHdb68mcW6
	 Q2KxsGHoM56Tw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25E7F60EF8;
	Sat,  3 Oct 2026 10:16:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 372C534E
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:16:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1C6FA4007C
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:16:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ziDNW-_PdPw for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 10:15:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 7B71940059
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791022559;
 b=aMA4fHCJNwA6jz7Jy+l8s2cL9oPH2bg2Q19FiXZU5WMfy4BNlObhg2EEQNC6WD7dJREO
 J8n3Jqt5YQ1Xkmc7VPFr/17icKRX4CD77hYst+c9v73gzr4lIgL/Jjx1wUBczmkGuvOno
 oJ/g9uAfVBuRYd3rTqV/LdfmtHjESicDrSZLDNhYo08Vm/wki6KzANa3h5iFuGh44TA22
 U6dfU+q+1+PxVDH1HXgigefly07Wy7JewqA7iMIsSNe9KDKKO69RdUdqBQd7TUv4+F9Nv
 JNzIqL3yCfCIucBGuhEGMbC3d2aQY/0OII+pQTJv03rM4tIUida8JHhChEOehbvEhXQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791022559;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=a2Cx3/OHVFPsHUNuEdOz0AV6NO59xCO+3mgcTgDVjfk=;
 b=aRFMH6+67X3Ptc9Z15zZiI3xKIBFyBmRg8h51HqmGhfxpm1pqF6v7RX+pmR1HHepsLhU
 BshihS4NG9STJ9ZS1eDXoRW+8aP1wZsjVZf4/Z9oh6MuXwfgyMcTic1P1rhdHFtUitDwK
 2GcULhWX3ucIuZQlBlSnWub8TKdIfdWvHmYooUZHykBwOg99ijIevrc0CG6qo7ckowZQB
 KohnDcj0UobQc2o8OgGj39jMVLALt9wQb9bRdPutqmVV2kwqF9E0ayhRkkC+815emRr0z
 EQmupRrOp0cgbKxaG8h7k4ml0gZkMPaYWeAOYwz7o8gYmX0p+0kgPxgxPTHR4lk1nWA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=N01GeBEg; 
 arc=none smtp.remote-ip=212.227.17.22
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7B71940059
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 10:15:56 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mkpex-1wqZjZ3Q1X-00mQXk; Sat, 03
 Oct 2026 12:15:54 +0200
Message-ID: <32b3219c-254e-461f-92a4-388070c2e242@gmx.de>
Date: Sat, 3 Oct 2026 12:15:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
References: <20261003070128.1295458-1-bernd@kuhls.net>
 <20261003070128.1295458-44-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20261003070128.1295458-44-bernd@kuhls.net>
X-Provags-ID: V03:K1:eDGB9sroHe6dzJzNyfpNaNRtDsqL1HQcGVroBrkQZSO4yCAnEmW
 lKjMLkci1S6c6cn12LlCRaSJaeyIqnUNBJ/s2I+rEPn8LXKyImAN2TxYcnrInsfCV9io8jo
 B+ZFZxG8FASyjF/lLmc+UNNmgEBt63eDmwbR/uLjf+p56lrHAsUFvrohufHDOpkI2S2Mt4N
 f7nCRfXBQkSpw9ap+pbhg==
UI-OutboundReport: notjunk:1;M01:P0:GdJmff4jCeU=;/5agS8yrCQFE8IVwULX4Jw3NQ6x
 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
Subject: Re: [Buildroot] [PATCH 044/114] package/python-mdit-py-plugins:
 bump version to 0.6.1
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

Am 03.10.26 um 09:00 schrieb Bernd Kuhls:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Cc: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thank you.

> ---
>   package/python-mdit-py-plugins/python-mdit-py-plugins.hash | 4 ++--
>   package/python-mdit-py-plugins/python-mdit-py-plugins.mk   | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-mdit-py-plugins/python-mdit-py-plugins.hash b/package/python-mdit-py-plugins/python-mdit-py-plugins.hash
> index 4537d908af..bb29e571e4 100644
> --- a/package/python-mdit-py-plugins/python-mdit-py-plugins.hash
> +++ b/package/python-mdit-py-plugins/python-mdit-py-plugins.hash
> @@ -1,5 +1,5 @@
>   # md5, sha256 from https://pypi.org/pypi/mdit-py-plugins/json
> -md5  8afddf3e020778a9d4490f43ce469d2a  mdit_py_plugins-0.5.0.tar.gz
> -sha256  f4918cb50119f50446560513a8e311d574ff6aaed72606ddae6d35716fe809c6  mdit_py_plugins-0.5.0.tar.gz
> +md5  78fcde535f69c580e9bdc4393ef2a8bd  mdit_py_plugins-0.6.1.tar.gz
> +sha256  a2bca0f039f39dbd35fb74ae1b5f998608c437463371f0ff7f49a19a17a114d0  mdit_py_plugins-0.6.1.tar.gz
>   # Locally computed sha256 checksums
>   sha256  4a2260d6e2cd0f5a151a1e86dbfe7d3ed552b1e2beabf9941c1ba5c49cbce484  LICENSE
> diff --git a/package/python-mdit-py-plugins/python-mdit-py-plugins.mk b/package/python-mdit-py-plugins/python-mdit-py-plugins.mk
> index dcbec98089..c324f1badf 100644
> --- a/package/python-mdit-py-plugins/python-mdit-py-plugins.mk
> +++ b/package/python-mdit-py-plugins/python-mdit-py-plugins.mk
> @@ -4,9 +4,9 @@
>   #
>   ################################################################################
>   
> -PYTHON_MDIT_PY_PLUGINS_VERSION = 0.5.0
> +PYTHON_MDIT_PY_PLUGINS_VERSION = 0.6.1
>   PYTHON_MDIT_PY_PLUGINS_SOURCE = mdit_py_plugins-$(PYTHON_MDIT_PY_PLUGINS_VERSION).tar.gz
> -PYTHON_MDIT_PY_PLUGINS_SITE = https://files.pythonhosted.org/packages/b2/fd/a756d36c0bfba5f6e39a1cdbdbfdd448dc02692467d83816dff4592a1ebc
> +PYTHON_MDIT_PY_PLUGINS_SITE = https://files.pythonhosted.org/packages/59/fc/f8d0863f8862f25602c0404d75568e89fb6b4109804645e5cdfb1be5cf56
>   PYTHON_MDIT_PY_PLUGINS_SETUP_TYPE = flit
>   PYTHON_MDIT_PY_PLUGINS_LICENSE = MIT
>   PYTHON_MDIT_PY_PLUGINS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
