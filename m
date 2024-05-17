Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD8F2C25B77
	for <buildroot@archiver.kernel.org>; Fri, 17 May 2024 20:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CF86834F2;
	Fri, 17 May 2024 20:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S6hZbz_Kx0MW; Fri, 17 May 2024 20:08:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84DFC834FE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84DFC834FE;
	Fri, 17 May 2024 20:08:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B9A511BF330
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 20:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A32A8407B1
 for <buildroot@lists.busybox.net>; Fri, 17 May 2024 20:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H-z5cLrLYeb4 for <buildroot@lists.busybox.net>;
 Fri, 17 May 2024 20:08:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 253AF407AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 253AF407AD
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 253AF407AD
 for <buildroot@buildroot.org>; Fri, 17 May 2024 20:08:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 45A8D13F8A2;
 Fri, 17 May 2024 22:07:57 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 17 May 2024 22:07:57 +0200
Date: Fri, 17 May 2024 22:07:57 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Zke5HQJ0VyR-bkjn@landeda>
References: <20240517171258.783129-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240517171258.783129-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1715976480;
 bh=24ZzOWcbjIdUUYUMAWcSHaU95c4siOky3Bt3JSALR4w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iRstYVGmJZsD7qmjoyp7KwSvQL527zD4YiBUady2W/WyXoFjD0aCGKg1MDHjz+5Pf
 djKx7TkH7sdDG4sh4EHqdpHtK1X6ACYIm7m1b1PLgFcNAKOzR5Wf4y4kv2KF5iPdFN
 /Du4VuF0kHWIYiv3MtO9xFAVQah+t3yXF+IZJUP9RoKY1ngjgbHMynRemJ2mYdiktI
 wb9QcqZX/0hicjquEMSe3jERhzBR6tNMWHpaSh83elkdRgJvVhja8pQpEz0rtbc2iW
 3gQ/cgHpXoMooc11RPYPRYoGUJApHfNPFxoGghe+t9hXmKEDHTsE1DesEXHmDutOqc
 5x2Z4hVMvz38Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iRstYVGm
Subject: Re: [Buildroot] [PATCH 1/1] package/gr-osmosdr: fix python build
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-05-17 19:12 +0200, Fabrice Fontaine spake thusly:
> Fix the following python build failure:
> 
> In file included from /home/buildroot/instance-0/output-1/host/include/python3.11/Python.h:38,
>                  from /home/buildroot/instance-0/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include/pybind11/detail/common.h:266,
>                  from /home/buildroot/instance-0/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include/pybind11/attr.h:13,
>                  from /home/buildroot/instance-0/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include/pybind11/detail/class.h:12,
>                  from /home/buildroot/instance-0/output-1/host/arc-buildroot-linux-gnu/sysroot/usr/include/pybind11/pybind11.h:13,
>                  from /home/buildroot/instance-0/output-1/build/gr-osmosdr-0.2.4/python/bindings/device_python.cc:1:
> /home/buildroot/instance-0/output-1/host/include/python3.11/pyport.h:596:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
>   596 | #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
>       |  ^~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f009958c37902a224512b336fcb431903bdd0b96
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gr-osmosdr/gr-osmosdr.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gr-osmosdr/gr-osmosdr.mk b/package/gr-osmosdr/gr-osmosdr.mk
> index 316ed80887..0d1e4edb30 100644
> --- a/package/gr-osmosdr/gr-osmosdr.mk
> +++ b/package/gr-osmosdr/gr-osmosdr.mk
> @@ -23,7 +23,9 @@ GR_OSMOSDR_CONF_OPTS = \
>  GR_OSMOSDR_INSTALL_STAGING = YES
>  
>  ifeq ($(BR2_PACKAGE_GNURADIO_PYTHON),y)
> -GR_OSMOSDR_CONF_OPTS += -DENABLE_PYTHON=ON
> +GR_OSMOSDR_CONF_OPTS += \
> +	-DENABLE_PYTHON=ON \
> +	-DPYTHON_INCLUDE_DIRS=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
>  GR_OSMOSDR_DEPENDENCIES += python3 host-python-six
>  else
>  GR_OSMOSDR_CONF_OPTS += -DENABLE_PYTHON=OFF
> -- 
> 2.43.0
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
