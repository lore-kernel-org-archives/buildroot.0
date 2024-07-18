Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BECBC3DA49
	for <buildroot@archiver.kernel.org>; Thu, 18 Jul 2024 20:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2E0660612;
	Thu, 18 Jul 2024 20:54:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LbiRy8V-6006; Thu, 18 Jul 2024 20:54:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD91D6062E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD91D6062E;
	Thu, 18 Jul 2024 20:54:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89B1F1BF3F9
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 82260812B6
 for <buildroot@lists.busybox.net>; Thu, 18 Jul 2024 20:54:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 32Q6cusZphFA for <buildroot@lists.busybox.net>;
 Thu, 18 Jul 2024 20:54:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4FFC6811BB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FFC6811BB
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4FFC6811BB
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 20:54:04 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-426717a2d12so4952375e9.0
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 13:54:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721336043; x=1721940843;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=n7mPv1wU24XIHaud3++DTj4bf6sPrTv+U1upTmWpIh0=;
 b=dRNw77lUz4yzT06roC72h7j93tKbheBWXAxvYJzKFGCm+XjQX5YKHwCvEl6FLnwAsg
 97qMcql3dUO3Aq4/Nqg2/upDoJQNvItldtDfsgIRI6Wkit3hkwh6B6oUMD5MhqHIgbdx
 fRzK1PCyBgTmb6DslD4P6Athz1ZvX61Xc72TAxiRFbQZlaGgc6KvtW1Tp/X1PJc6Gqjh
 iUoS5QZwXeXYn0UDlIwb8lerDALOQ5h52Gc+kXRy6N/+ieCIeyx4O6QOYrd4APiLn+/w
 t0TrjzvW6GqvbMuBFeA7ImShrcn1Oo7cjwPGdb79W9m1dEdb8MAWOKWrTBd9E0GkDx6X
 vWVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwXYTOFx9fKTCmKGy9BpCVBpG8v3MKBiYWStxR92uCCiDpQHA7uWb9DHEVGNI5EX41iL23y6vHceMKGiVZ5gJmnsjPzOM34w==
X-Gm-Message-State: AOJu0YxbhFBKZufgXDO62NPqBq1I0tRUHeut4DV7x6md1HBq1IzRNCI7
 9iOycno3zNLLu1JcufzQ+FYa13zpX4KKSrDPQDrphsao6ZiXpRFxd9z2GJzUq+pdwo15FTOQ2PC
 b
X-Google-Smtp-Source: AGHT+IFZhW8+jKfsYr6xjANggVdCwC6/VCQ8UW1HaM9rEelWKedCBxdfCJgdsiOnBWlN1VU1ujblFQ==
X-Received: by 2002:a05:600c:5486:b0:427:aab7:976b with SMTP id
 5b1f17b1804b1-427d2a8e1b1mr16977845e9.5.1721336042623; 
 Thu, 18 Jul 2024 13:54:02 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d2a7f6d0sm14390775e9.1.2024.07.18.13.54.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jul 2024 13:54:01 -0700 (PDT)
Message-ID: <604efb4b-7ebe-46fd-8090-74333b23f09f@mind.be>
Date: Thu, 18 Jul 2024 22:53:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240401212344.1345395-1-james.hilliard1@gmail.com>
 <20240401212344.1345395-3-james.hilliard1@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240401212344.1345395-3-james.hilliard1@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1721336043; x=1721940843; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n7mPv1wU24XIHaud3++DTj4bf6sPrTv+U1upTmWpIh0=;
 b=Y4vaLeTU9hpOKxafmOrAUq7imEhCcubS3Y6r59CRghMAKH9pPsIJ/UrB/0dBft4wWZ
 TDjacgr4zpELbjRrRQ2KIcpV002GtvaaBlECHQIf7q0+u9MBGHZ8qQU7zKBdIuOX/l9d
 zVhhHWOrhgyAxRWnF988dC3RL0FgfT0eboN6QhZjTSN6P4npfM+IPeZGWd3OZgA707o7
 FiHSUinyC+uksCXL8FoTNqcvYVreVvFQLxnunR1+WKuWePi/BiWAkceGJcvJGzmpK33R
 wmVqsDAlf7cALv8A6csceM6czec/X3a6tY5q28wMyyAkE7ijEOcg3ZserlkmE+iLqBYF
 xsKQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Y4vaLeTU
Subject: Re: [Buildroot] [PATCH v4 3/5] package/python-dictdiffer: new
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



On 01/04/2024 23:23, James Hilliard wrote:
> We need to set --skip-dependency-check to prevent pytest-runner from
> being required to build python-dictdiffer.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

  Applied all 5 to master, thanks. I just have a question about this one.

[snip]
> diff --git a/package/python-dictdiffer/python-dictdiffer.mk b/package/python-dictdiffer/python-dictdiffer.mk
> new file mode 100644
> index 0000000000..569f923a9a
> --- /dev/null
> +++ b/package/python-dictdiffer/python-dictdiffer.mk
> @@ -0,0 +1,16 @@
> +################################################################################
> +#
> +# python-dictdiffer
> +#
> +################################################################################
> +
> +PYTHON_DICTDIFFER_VERSION = 0.9.0
> +PYTHON_DICTDIFFER_SOURCE = dictdiffer-$(PYTHON_DICTDIFFER_VERSION).tar.gz
> +PYTHON_DICTDIFFER_SITE = https://files.pythonhosted.org/packages/61/7b/35cbccb7effc5d7e40f4c55e2b79399e1853041997fcda15c9ff160abba0
> +PYTHON_DICTDIFFER_SETUP_TYPE = setuptools

  IIUC, the setuptools setup type is in fact identical to pep517, the only 
difference is that a dependency on host-python-setuptools is added, right? So I 
wonder if for new packages, we shouldn't do it that way. And basically keep the 
SETUP_TYPE approach as a backward compatibility measure.

> +PYTHON_DICTDIFFER_LICENSE = MIT
> +PYTHON_DICTDIFFER_LICENSE_FILES = LICENSE
> +PYTHON_DICTDIFFER_DEPENDENCIES = host-python-setuptools-scm

  ... And with this one, it's not even needed to add a dependency on 
host-python-setuptools!

  Regards,
  Arnout

> +PYTHON_DICTDIFFER_BUILD_OPTS = --skip-dependency-check
> +
> +$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
