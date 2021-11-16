Return-Path: <SRS0=m+kO=QD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C0FBC433EF
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 20:08:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22ADE6324F
	for <buildroot@archiver.kernel.org>; Tue, 16 Nov 2021 20:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 22ADE6324F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1BE140336;
	Tue, 16 Nov 2021 20:08:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tKGdVsFBY4uT; Tue, 16 Nov 2021 20:08:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D36240214;
	Tue, 16 Nov 2021 20:08:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD9BE1BF3D1
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 20:08:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3BB7607FD
 for <buildroot@lists.busybox.net>; Tue, 16 Nov 2021 20:08:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lbxT7xGSQPwI for <buildroot@lists.busybox.net>;
 Tue, 16 Nov 2021 20:08:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AB0166060A
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 20:08:26 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id t5so421779edd.0
 for <buildroot@buildroot.org>; Tue, 16 Nov 2021 12:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=BSHMGyU3gd3MGXDmfklmvUskSTj4dUNxmQdPYvonEio=;
 b=Y+jfgKl0XQvjXn+oj6lL94yNANli6lYDxe/xgJtJbr34usG3RhtV5cUN2O3YsBzPZi
 0ykW731+9vcZ295zQGPOa+L3WWvl0L5G/6bDmh2/qD4W8oEYH25FwMdvmHcsuzSOLfRz
 xnbtH0z1Db3nvcBEgF2eBK3zFCJdGdzQprYmeBRItlS3w9fYr8QAiZiJ/C6248nTC8h7
 OebrRbtqXUcgQXh21cE/00VcRE2mLr/ZJ+2oW/6sqbZ1wirkEYLOFm0ksTq6MQyseizJ
 YK17lRd8boKkmJyLmgPIL8NEXCogsYeeUOEWDETjmgn9H8tlJVvX7s+uR/OQF5Kc0VHp
 TdgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=BSHMGyU3gd3MGXDmfklmvUskSTj4dUNxmQdPYvonEio=;
 b=uF+f2keM7sRRvLOuz4v8w6TgzKyNU+TpGhOhouCQvUhcsdN6bQRHPhN8nbKgMS8tWH
 kV79LrEfau9mfyiCXipetkTuBq2i3I0HwuR0/Q0uSDQHUSS8m3XIiul8Lur4PfgDGT86
 tZuC+8bPb8PHkQYCZ1eo/cHOtr+2f1MufGPl5lREgxB2xwhlTD0WOlCzn40zjfF/nXbj
 sDOquxRACYWMoB602UwcRJfZH+tpvMO4vrahJnJ+cfnVzpClLlrauC2dcki14Sv7VlmG
 wuPRg2enzQuW6X/8DqNP2dVfhsQUafU9SKamIm2BMiohyt5WT4ui3+yok8E/GSpTgT3Q
 q98Q==
X-Gm-Message-State: AOAM533edSxi2jjE9Jip5zdJbnmfmTVLltlTLTC5dqWyMIE00VmJDn+X
 OAVGMj6JxTN1EUcjScOJ1gkahg==
X-Google-Smtp-Source: ABdhPJxW4nYO0AaqM4Ip7LwvzMj45Y6O8bUU/3YrR10YPp/u59FTNkzYJ5EFA4wuReU4Y7LI3p548g==
X-Received: by 2002:a17:907:a414:: with SMTP id
 sg20mr13538125ejc.183.1637093304611; 
 Tue, 16 Nov 2021 12:08:24 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id p3sm8901158ejy.94.2021.11.16.12.08.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 12:08:24 -0800 (PST)
Message-ID: <bf8cd65e-051a-b94a-dfc1-7404d75bd2d2@mind.be>
Date: Tue, 16 Nov 2021 21:08:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-GB
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
References: <20211114160935.2429065-1-fontaine.fabrice@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211114160935.2429065-1-fontaine.fabrice@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/oracle-mysql: add mysql_config
 to ORACLE_MYSQL_CONFIG_SCRIPTS
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 14/11/2021 17:09, Fabrice Fontaine wrote:
> Add mysql_config to ORACLE_MYSQL_CONFIG_SCRIPTS so the per-package fix
> added by commit a18c828bed99d7e0db5128224ffcda4897cd8e80 will be applied
> to this file which will avoid the following build failures with
> libodb-mysql, open2300 or rsyslog:
> 
> configure:3286: /home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/libodb-mysql/host/bin/powerpc-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -rdynamic -L/home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/libodb-mysql/host/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/mysql -lmysqlclient -L/home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/oracle-mysql/host/powerpc-buildroot-linux-uclibc/sysroot/usr/lib -lz -lnsl -lm >&5
> /home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/libodb-mysql/host/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: cannot find /lib/libc.so.1
> /home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/libodb-mysql/host/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: cannot find /usr/lib/uclibc_nonshared.a
> /home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/libodb-mysql/host/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: cannot find /lib/ld-uClibc.so.1
> 
> Fixes:
>   - http://autobuild.buildroot.org/results/9e3c09dd3d9bd55de14fc89a1d17ba9c008b195b
>   - http://autobuild.buildroot.org/results/b42c8c86e9574ba9f2c04daa3476206270241a66
>   - http://autobuild.buildroot.org/results/08156c934e9b4d946c354dbaf78ea5d9ae9a4701
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   package/oracle-mysql/oracle-mysql.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/oracle-mysql/oracle-mysql.mk b/package/oracle-mysql/oracle-mysql.mk
> index 6607486d4d..8a6bdc0097 100644
> --- a/package/oracle-mysql/oracle-mysql.mk
> +++ b/package/oracle-mysql/oracle-mysql.mk
> @@ -15,6 +15,7 @@ ORACLE_MYSQL_LICENSE = GPL-2.0
>   ORACLE_MYSQL_LICENSE_FILES = README COPYING
>   ORACLE_MYSQL_SELINUX_MODULES = mysql
>   ORACLE_MYSQL_PROVIDES = mysql
> +ORACLE_MYSQL_CONFIG_SCRIPTS = mysql_config
>   
>   # Unix socket. This variable can also be consulted by other buildroot packages
>   MYSQL_SOCKET = /run/mysql/mysql.sock
> 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
