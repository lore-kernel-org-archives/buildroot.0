Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 619EDCA5FEF
	for <buildroot@archiver.kernel.org>; Sun,  4 Oct 2026 15:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2698E60614;
	Sun,  4 Oct 2026 15:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vi5iQlrSRTTQ; Sun,  4 Oct 2026 15:39:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org ABA8A6060C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791128348;
	b=QvAxGsMVNVhlsfdmDcl7YXNXTmvCQ802oElZyRSwAVa9/BcbSacXrQZC1UdmIllcj6mO
	 ILv1dxbzjVLIQb1TD/VRToZZyYGp2E657tD847Ju7krT6al8kloh/IXZXwRShQW00o0eZ
	 YYt4FGQ42eHIMbcG2sMFhq8gFwKtsbgG9Zxq41XPLcOi6pZD+tdxVPKdmVTLBgQtJzKrO
	 tzEfEKmGJJjnwGtWDKMLzSQ1H1MOQ/vcH3IQKMxUlo+kLQCy6D/UNaqmoOIkar+Q7e1VO
	 B9qiVcuE2H+gxSxwVeAIYudL8XpU5EXngucMf0wpK3sE3uQ+IAcdOEl7ESAFQEY3+uw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791128348;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=3QO1mJfh8h89BUYYafkM3vBflQDwNNOfGQqaQn4+CNI=;
	b=L+AtGbucXbSF+bmeA45W5YUmJmGSoB49UZYiWNke/32PD06XFA415cRS0/2gBARkwljZ
	 PjiMZnxi6njmbgcdZ7WfXHzgypV1eUwMTk2M9t9YNGrazgK2CVcSYbvp6hJPLgdXIVKN0
	 rvOAjBGL8ncJIDtFtauZrwjjVgBGJ2CMum8MWciMnsnC5Dg8oVyjzUXgsxkzT7nJNH5in
	 Bw+S9DpUMb7KkEASvNYmAmipJZYYeVEK12Ry+zkfaXhy0mcbAJm5O4f8r2mIKGq4/ySPE
	 Hkb33X3ad9AxuBEjW8cynwNlUM3846HgBITrI98cLu4CFPYUrln+jmqXzwd8eHTQmZA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791128348;
	bh=3QO1mJfh8h89BUYYafkM3vBflQDwNNOfGQqaQn4+CNI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JLvDga35nkqCZkKnpH2HcvgUHQYT4ylSjriVUy//YA/ydjZ3/Mhr2q1m5nHu2x2Z6
	 Ydorhf2zJNvnhmBMAc5m0D7D4rLHYKFQ5ZXlx4kwrl4g8qq/tx4RpY4JLgrqC1oJhF
	 kN1b4P6Cx4hfvq+5hx3XFnJTVaBi/2TlhuBMZDn/CH7rvsIFBXODUpAxNQDeLqEaRK
	 oulb6obCshaw0/5ybRY0zKiz5eJSDEYKhplEEcOYubCaDuEduFkIbqCZPODD1XGvP9
	 hUbN6g3LElwYSNbQM3KTF+WbmF7mQ/7ZF3BIrBBGWzmAUCvu2qcSK+q+hIeOsDQvZ/
	 OstrNdBFhkFOw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABA8A6060C;
	Sun,  4 Oct 2026 15:39:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CDFCB22B
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BFA5640677
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dKObb0fiRk1w for <buildroot@buildroot.org>;
 Sun,  4 Oct 2026 15:39:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org C39BC40674
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791128345;
 b=Loe69uyKSf1qaOCPIX7tPaxHHBripFFMOihyavaT5JcDciIFLNaY98PuNvFlxm10HUlI
 HJMcZW69/dSAsvm6x0G9CV8ibO4PMh0otk7pzFU2RhsGZfgXh+vRUxrc/Kcp1BpR76pbE
 LV0yzxTkRZx6kJit8/OuAtX4sOtbW/z8hcz8ewib6a6k5Li4y3MN78OgqmZj1bTQoEfN1
 4o8RlxJGrM871P9P5VDJapGzj7N/3OeqbgpxWg5b2Ztx3ta2ubViTLOPBgVOFfn1Fbd7u
 hZt1+8w/0tSEuPOvOjo9bOGufmwJyDxhmZIGiUSYbnBQZy00ZCxsXA03brS+3CbsQIw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791128345;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
 X-Last-TLS-Session-Version;
 bh=a7BpeXgdmTJVRbnHchau3iqrOuk3jNK5EaW7y6uB0kw=;
 b=EzG7T1xC5/rjdjzh50KbecMlic7uvhHyQaMwm6/xekT3tPabDDFBaCAandkVz79zP8Wb
 bgz/HWx801TJtDHEK6VnxfQLoTAoo6lw1XG/oH7FRvbAk0+X/HRelIWcqqwy0ejUXxVE8
 oiPrTdDd8EI1UsyyeFoLxtHCcPguhb3ZaNbrCvTxg2H64MIJ/D83UWMhrJoaA4KfAQdhB
 Ces7J9kQHX9O2n/oR1uBqC7pdj+UlNXzQkhbeeFlWDzupLVd992M6znBWqH3Ktgr6L5vb
 kd4LtaYl4b3jR7yyV++oLPR9X/Vkhtg07weL0EdoSFeBuFq3WNcbyhyNxC+oisyVLlg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=q5hDROuk; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C39BC40674
 for <buildroot@buildroot.org>; Sun,  4 Oct 2026 15:39:03 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 32B801A112F;
 Sun,  4 Oct 2026 15:39:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0783B604FE;
 Sun,  4 Oct 2026 15:39:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2C4B410328192; 
 Sun,  4 Oct 2026 17:38:58 +0200 (CEST)
Date: Sun, 4 Oct 2026 17:38:56 +0200
To: =?utf-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>
Message-ID: <asJy1yDEqT_q0rH4@windsurf>
References: <20260930120101.474560-1-raphael.melotte@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260930120101.474560-1-raphael.melotte@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/2] package/python-pipcl: new host package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Rapha=EBl,

On Wed, Sep 30, 2026 at 02:00:57PM +0200, Rapha=EBl M=E9lotte via buildroot=
 wrote:

> diff --git a/package/python-pipcl/Config.in b/package/python-pipcl/Config=
.in
> new file mode 100644
> index 0000000000..1cac85352d
> --- /dev/null
> +++ b/package/python-pipcl/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_PIPCL
> +	bool "python-pipcl"

It does not make sense to have a Config.in option to enable a target
package... when you have no target package.

> diff --git a/package/python-pipcl/python-pipcl.mk b/package/python-pipcl/=
python-pipcl.mk
> new file mode 100644
> index 0000000000..c0e97eeeb3
> --- /dev/null
> +++ b/package/python-pipcl/python-pipcl.mk
> @@ -0,0 +1,15 @@
> +########################################################################=
########
> +#
> +# python-pipcl
> +#
> +########################################################################=
########
> +
> +PYTHON_PIPCL_VERSION =3D 12
> +PYTHON_PIPCL_SOURCE =3D pipcl-$(PYTHON_PIPCL_VERSION).tar.gz
> +PYTHON_PIPCL_SITE =3D https://files.pythonhosted.org/packages/64/1a/9ab2=
b272def9db9c80bf18fe8282119c2c4c074cc542030a28e4136dd13b
> +PYTHON_PIPCL_SETUP_TYPE =3D pep517
> +PYTHON_PIPCL_LICENSE =3D AGPL-3.0+
> +PYTHON_PIPCL_LICENSE_FILES =3D COPYING
> +HOST_PYTHON_PIPCL_DEPENDENCIES =3D host-python-packaging
> +
> +$(eval $(host-python-package))

   ^^^

See here, you've made this a host only package.

Best regards,

Thomas
-- =

Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
