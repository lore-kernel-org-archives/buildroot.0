Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C1BC3DA49
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 20:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47B3D6062E;
	Thu, 18 Jul 2024 20:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RJNXe7GuLJtG; Thu, 18 Jul 2024 20:55:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40B7B6064E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40B7B6064E;
	Thu, 18 Jul 2024 20:55:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 927851BF3F9
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7FA0C40F3B
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FW9aRbrDEW3w for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 20:55:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E3F3B40E5D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E3F3B40E5D
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E3F3B40E5D
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:55:47 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-426526d30aaso7269375e9.0
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 13:55:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721336146; x=1721940946;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=3Y3DWTKEWC970hrvUoWCvRD6Z3Ag71jv8uj1wrCSfIo=;
 b=Ygj4MgK3SZ4inaav5fxqBvcIR44wqGp/bSvbusLdjZVJbczTjlEs75lJMrwu52SsAT
 /OCjAcN6NxaeIy4cyjcAaAVHHldMhWdau+LprSNszc735qN6LIUohAo8rE2lXT8nEcYc
 sbbeAAzV7kMffHGznglJckfEt0jddoJgT150C34q/uqerpKRwc7vwDH4B7r0KYstUDSk
 ZmhZhvj9ucM5aA9nVVXnGQYUoVubJkPMEQOdJOmujK6Qik1JluNOs+xSWNoiaQJPVnge
 5YF8jM27ek9C+3vYji5dDt6vo2xk51vLFB3Fm4cdPSm5ddzVUfIw/z8pSunXtD+zH0x7
 avsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWIPNNDvrbiqH9i4OnvD54zseQImGmxekCqQuCQ0Q7ba65pAlYrCfNGNw/Ua+UYwubeJK8DSZ46OOMED5sFpIjatga/1OWjw==
X-Gm-Message-State: AOJu0YxkwEq4faVjAqBksqLCqECXLADxVGMMQdKPIxe1o6YIGwRKRJgU
 cIT46HK242hjeG7+9siszAcEcujdfxcis9v9oodZQWsPwxR5XpkbGARex/oFN2nYo3MUQZXAB6z
 6
X-Google-Smtp-Source: AGHT+IEZlQVjMahJAqtDC70H24ZzB3Py8U4C+i6ik0uDBC+N3vzjs18LNkVTPheqPmY3aESEzrOuCQ==
X-Received: by 2002:a05:600c:4eca:b0:426:5b21:97fa with SMTP id
 5b1f17b1804b1-427c2d2d8d8mr46017055e9.29.1721336145815; 
 Thu, 18 Jul 2024 13:55:45 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a3b7aasm29271815e9.6.2024.07.18.13.55.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 13:55:45 -0700 (PDT)
Message-ID: <b45cdcba-d484-486b-9e5e-243bb4cfaa39@mind.be>
Date: Thu, 18 Jul 2024 22:55:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240402050826.119180-1-james.hilliard1@gmail.com>
 <20240402050826.119180-2-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240402050826.119180-2-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721336146; x=1721940946; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3Y3DWTKEWC970hrvUoWCvRD6Z3Ag71jv8uj1wrCSfIo=;
 b=NkPbQw6W7KCyll79lluKLFb4XGDHR8eW+Guw3beBucgd71XfqrZjftiH/HmaIoeaGJ
 62G/MvGu0Q9hN51O2Vj/LVvNaeWeYueJZKx+qn23d83pCcr96dMwjRt7Gm6wWio9G4X1
 bxm2PHDH37YsqKyETYIy2r3sMhgcGOtKAafWMZGnDecT+Lw81FlmUqdQJ+uf9CE4DZMk
 8lx86CEB7kzvGdEDSXcZ7ONZZa3zJfKBdRaxo/ECCSOIUDD6NfgBI72BOp3oEtDXkcnu
 vE+H8BjPolURwPB6umssMiRrpMo+uNGiHYKpxShwIivW2UhVoCF/FeNrNMQJKHgWSKDv
 EgCA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NkPbQw6W
Subject: Re: [Buildroot] [PATCH v4 2/2] package/python-betterproto: new
 package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 02/04/2024 07:08, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied both to master, thanks.

  Regards,
  Arnout

> ---
> Changes v3 -> v4:
>   - use poetry instead of setuptools
> Changes v2 -> v3:
>   - add missing python-datetime runtime dependency
> ---
>   package/Config.in                                 |  1 +
>   package/python-betterproto/Config.in              |  8 ++++++++
>   .../python-betterproto/python-betterproto.hash    |  5 +++++
>   package/python-betterproto/python-betterproto.mk  | 15 +++++++++++++++
>   4 files changed, 29 insertions(+)
>   create mode 100644 package/python-betterproto/Config.in
>   create mode 100644 package/python-betterproto/python-betterproto.hash
>   create mode 100644 package/python-betterproto/python-betterproto.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 1c8f6db14d..8a165c1aa9 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1007,6 +1007,7 @@ menu "External python modules"
>   	source "package/python-backcall/Config.in"
>   	source "package/python-bcrypt/Config.in"
>   	source "package/python-beautifulsoup4/Config.in"
> +	source "package/python-betterproto/Config.in"
>   	source "package/python-bidict/Config.in"
>   	source "package/python-bitarray/Config.in"
>   	source "package/python-bitstring/Config.in"
> diff --git a/package/python-betterproto/Config.in b/package/python-betterproto/Config.in
> new file mode 100644
> index 0000000000..8548fd43ba
> --- /dev/null
> +++ b/package/python-betterproto/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_BETTERPROTO
> +	bool "python-betterproto"
> +	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
> +	select BR2_PACKAGE_PYTHON_GRPCLIB # runtime
> +	help
> +	  A better Protobuf / gRPC generator & library.
> +
> +	  http://github.com/danielgtaylor/python-betterproto
> diff --git a/package/python-betterproto/python-betterproto.hash b/package/python-betterproto/python-betterproto.hash
> new file mode 100644
> index 0000000000..8d23d2ae56
> --- /dev/null
> +++ b/package/python-betterproto/python-betterproto.hash
> @@ -0,0 +1,5 @@
> +# md5, sha256 from https://pypi.org/pypi/betterproto/json
> +md5  bd4192c2997959100097479c34ff87e6  betterproto-2.0.0b6.tar.gz
> +sha256  720ae92697000f6fcf049c69267d957f0871654c8b0d7458906607685daee784  betterproto-2.0.0b6.tar.gz
> +# Locally computed sha256 checksums
> +sha256  a5b8df75467e4b57a308a94cce5fdae84808a83ee6cd5af7e175c6b9784a753f  LICENSE.md
> diff --git a/package/python-betterproto/python-betterproto.mk b/package/python-betterproto/python-betterproto.mk
> new file mode 100644
> index 0000000000..37f72f8166
> --- /dev/null
> +++ b/package/python-betterproto/python-betterproto.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-betterproto
> +#
> +################################################################################
> +
> +PYTHON_BETTERPROTO_VERSION = 2.0.0b6
> +PYTHON_BETTERPROTO_SOURCE = betterproto-$(PYTHON_BETTERPROTO_VERSION).tar.gz
> +PYTHON_BETTERPROTO_SITE = https://files.pythonhosted.org/packages/45/43/4c44efd75f2ef48a16b458c2fe2cff7aa74bab8fcadf2653bb5110a87f97
> +PYTHON_BETTERPROTO_SETUP_TYPE = pep517
> +PYTHON_BETTERPROTO_LICENSE = MIT
> +PYTHON_BETTERPROTO_LICENSE_FILES = LICENSE.md
> +PYTHON_BETTERPROTO_DEPENDENCIES = host-python-poetry-core
> +
> +$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
