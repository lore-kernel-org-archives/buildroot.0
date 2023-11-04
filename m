Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D1AC4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 21:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFA0160AD6;
	Sat,  4 Nov 2023 21:37:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFA0160AD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d2WGWu0QSb7s; Sat,  4 Nov 2023 21:37:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBD6860DFA;
	Sat,  4 Nov 2023 21:37:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBD6860DFA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 729821BF2F9
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B45C821CB
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 21:37:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B45C821CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lT5XjC-7KpbW for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 21:36:59 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 564AF821BF
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 21:36:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 564AF821BF
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-53dd752685fso5426069a12.3
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 14:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699133817; x=1699738617;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PUrPjlDWuiegP19L49u8UkPdB6j255kcNQd6qSLSMJ4=;
 b=dEUob85sMYQPe5eUD5Kf78qsrt4wI0p8F6pGt3HCqsOCm17KDuq3/mNItyTFh84lFE
 MhKB1KtaFPUyP5T9Y9y6A9NAgbEsue+95sFkwq+zLK3LD4AqqcU0DID6N5Aqpx16PQ1A
 XTgBOSTXiabNY0twnGIQrKg6l0cXePBdIK+Y9nEGM7bTIcE/IOHNIG1XjbBv8MNUUk4n
 jsUXVDovS5v9D7GGJ1m58lh5pbx36tIsMFqW/7LkfsWBT6nP/d5+4OFWl0QRkt3P0hjA
 6pD9pmgRMDMeiNnNqbnwLtxoX6Q+c+tvtiSJzHMnh61mu4o92b4XV59y4A2T5LGIpN2V
 Fk0Q==
X-Gm-Message-State: AOJu0YyQ3Y7F8DqAkb4GCEJqIhS7uq9aLEJ5HccfVzFQFpPz2u9xH2gV
 i+kHmqEJPT1gvJsFMcEFAgevhg==
X-Google-Smtp-Source: AGHT+IEkU3gN1q4TyQG903YDyZJa7HNIVMxDZZK4aXZCJogFKrB6x7DtBGvx8YvKl+fR8aerPilLcQ==
X-Received: by 2002:a05:6402:12c7:b0:53f:b9d0:9818 with SMTP id
 k7-20020a05640212c700b0053fb9d09818mr15453155edx.42.1699133817494; 
 Sat, 04 Nov 2023 14:36:57 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf?
 (ptr-9fplejq23yjvo6iq027.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:d490:c3e3:649d:eccf])
 by smtp.gmail.com with ESMTPSA id
 r11-20020aa7d14b000000b00534e791296bsm2465277edo.37.2023.11.04.14.36.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 04 Nov 2023 14:36:57 -0700 (PDT)
Message-ID: <24412b00-dae5-416b-9e50-df06c168ecca@mind.be>
Date: Sat, 4 Nov 2023 22:36:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
References: <20231026092701.12345-1-adam.duskett@amarulasolutions.com>
 <20231026092701.12345-27-adam.duskett@amarulasolutions.com>
In-Reply-To: <20231026092701.12345-27-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1699133817; x=1699738617; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PUrPjlDWuiegP19L49u8UkPdB6j255kcNQd6qSLSMJ4=;
 b=L57fsNi3hFPwbbWXRf/qz4ClWfjQ9F+lSoK2pDeTzyWJ+CGuKBNhIBSV2va/o+GEX9
 KM4SH/r5Glw7k2UwTMVkiS7yBIDsPlOIi6PZSqW9V3ybEovscplnI9vsO5XFSrG52zMG
 gT1+63yJZjo+a+z1jAeQjtjZJWaL7yONNL7+DnH19h6fJ6WC//ApravGg5TsrENUO/kX
 K+HqqKU/9uQ3TvHIWiUB2pw7T5A/XDArl4EpzEJe0iL1UDfCzCRBLjW4MRd5OlwEBUca
 nAZnYWQ7Qc48LeEbEIj8hjGIU1V/G++aLVr9+sLHzrdx5wLnE7jtOJCNdEJLewkaDx8H
 7eRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=L57fsNi3
Subject: Re: [Buildroot] [PATCH 26/30] package/python-pathtools: add
 0001-replace-imp.patch
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
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Julien Olivain <ju.o@free.fr>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 26/10/2023 11:26, Adam Duskett wrote:
> In preperation of Python 3.12.0, add a patch to python-pathtools that removes
> the reliance on the imp module following the instructions found here:
> https://docs.python.org/3.12/whatsnew/3.12.html#removed
> 
> Also tested with Python 3.9.2 on Debian 11.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

  Wow, this hasn't had a commit in 7 years...

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .../python-pathtools/0001-replace-imp.patch   | 55 +++++++++++++++++++
>   1 file changed, 55 insertions(+)
>   create mode 100644 package/python-pathtools/0001-replace-imp.patch
> 
> diff --git a/package/python-pathtools/0001-replace-imp.patch b/package/python-pathtools/0001-replace-imp.patch
> new file mode 100644
> index 0000000000..a5bc240cea
> --- /dev/null
> +++ b/package/python-pathtools/0001-replace-imp.patch
> @@ -0,0 +1,55 @@
> +From e2372bbecdf46a100b09126f2951431c1929637b Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <adam.duskett@amarulasolutions.com>
> +Date: Tue, 24 Oct 2023 08:59:21 +0200
> +Subject: [PATCH] Replace imp
> +
> +The imp module has been removed in python 3.12.0.
> +
> +This change has also been tested with Python 3.9.2 on Debian 11.
> +
> +From: https://docs.python.org/3.12/whatsnew/3.12.html#removed, follow the
> +instructions to add the load_source method back into setup.py.
> +
> +Upstream: https://github.com/gorakhargosh/pathtools/pull/14
> +
> +Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> +---
> + setup.py | 19 ++++++++++++++++---
> + 1 file changed, 16 insertions(+), 3 deletions(-)
> +
> +diff --git a/setup.py b/setup.py
> +index 4718885..1be0315 100644
> +--- a/setup.py
> ++++ b/setup.py
> +@@ -22,12 +22,25 @@
> + # THE SOFTWARE.
> +
> + import os
> +-import imp
> ++import importlib.util
> ++import importlib.machinery
> + from setuptools import setup
> +
> + PKG_DIR = 'pathtools'
> +-version = imp.load_source('version',
> +-                          os.path.join(PKG_DIR, 'version.py'))
> ++
> ++# From: https://docs.python.org/3.12/whatsnew/3.12.html#removed
> ++def load_source(modname, filename):
> ++    loader = importlib.machinery.SourceFileLoader(modname, filename)
> ++    spec = importlib.util.spec_from_file_location(modname, filename, loader=loader)
> ++    module = importlib.util.module_from_spec(spec)
> ++    # The module is always executed and not cached in sys.modules.
> ++    # Uncomment the following line to cache the module.
> ++    # sys.modules[module.__name__] = module
> ++    loader.exec_module(module)
> ++    return module
> ++
> ++version = load_source('version',
> ++                      os.path.join(PKG_DIR, 'version.py'))
> +
> + def read_file(filename):
> +     """
> +--
> +2.41.0
> +
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
