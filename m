Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA555ECAAD4
	for <buildroot@archiver.kernel.org>; Tue, 30 Aug 2022 21:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50E4381454;
	Tue, 30 Aug 2022 21:19:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 50E4381454
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2bD07lH1tdTy; Tue, 30 Aug 2022 21:19:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 55ABE813BE;
	Tue, 30 Aug 2022 21:19:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 55ABE813BE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2765C1BF388
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 21:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02A1D813BE
 for <buildroot@lists.busybox.net>; Tue, 30 Aug 2022 21:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02A1D813BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4YCh-mieFPHz for <buildroot@lists.busybox.net>;
 Tue, 30 Aug 2022 21:19:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0065A80A77
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0065A80A77
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 21:19:53 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id u9so24744351ejy.5
 for <buildroot@buildroot.org>; Tue, 30 Aug 2022 14:19:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=DnAFi6tctsSpz4U+lzHGrvEPKYlUAEyG+Za2ohL4xUc=;
 b=cD57Hk8RBxkzjRa9BtsypkTMF6pFB4erKsZMCNfpCf1DGxtQVr9HRU+O/Py34n4/M/
 r0ZOv0PhNIScLBKR3g1lphwmwLYXWJ64wR9H5rNOsXOsw48oR9lbUhpfwu4Mvd+JPOpz
 aoZbo6U0zsLcHJSgKQB7Mupw59XfPHJ5/Xbc+1oU88CgcYLxJxOVu93d2GOAHFaeRydQ
 mvzeSJ3nlndPj2IX3yH2JpO3qQyFXQMsrKcyFM68KGep3PGyh8vyzn+JBUFPnbObks1B
 3Zl2OIhJEj4QecLAa1bLsp/6jPso++lQ3rRsmMWfAX96y1y/RiHcD+pQTz95A9qRChTU
 D71g==
X-Gm-Message-State: ACgBeo3No+iKE3rBDUY6yDfQSMOZddDXUWr5dp8vbUxIogiU9rzaW1B+
 w54UsPloIK+S28TCrZRB7/HaxA==
X-Google-Smtp-Source: AA6agR6s3uY4CeRIA3T8Z0oBI418HCzSsxqiFKUHb5iQ2lGz0/lCN7pbK1N4g6W9f+DSysSlOgg5zQ==
X-Received: by 2002:a17:907:2ce7:b0:741:6e62:4558 with SMTP id
 hz7-20020a1709072ce700b007416e624558mr9720248ejc.273.1661894392121; 
 Tue, 30 Aug 2022 14:19:52 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 o20-20020a170906769400b0073306218484sm2873060ejm.26.2022.08.30.14.19.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 14:19:51 -0700 (PDT)
Message-ID: <88bf3698-83e3-2c88-1f8f-d2cd130f8157@mind.be>
Date: Tue, 30 Aug 2022 23:19:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Content-Language: en-GB
To: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
References: <20220827161431.333659-1-romain.naour@gmail.com>
 <20220827161431.333659-2-romain.naour@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
In-Reply-To: <20220827161431.333659-2-romain.naour@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc;
 bh=DnAFi6tctsSpz4U+lzHGrvEPKYlUAEyG+Za2ohL4xUc=;
 b=aSN/4nicg5/M8LZWOfz+oDDQcsWOis8qBcR7xxb8qUJb7KLASGqLWtkxzDLwiKmUu6
 OlJPH8/zGFm7fmQyB/mo1tFS0sd0OIYRALG1nwriORGN9Lnn1UJ8el6bMs7T04ePtj/C
 IJOjB+KGSmCj3qUcn0cl0mtQ2NB6e53Z/yGIlX3iQkRPBan/cirKz2BlIYqVddoxuJdP
 B50dcEgFKVeZZRnbllQsW9KjpBi/gwl0cm2CicXvqbnS0djyyj0zA9tdHDiVUkpToZMC
 8Rv6pqmpehiDNeclLDCW9RCxobDnle1gqbUQx22KAAoAaExqgdPn1096riAoeAL+mNNm
 tXCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aSN/4nic
Subject: Re: [Buildroot] [for-master 2/2] package/gdb: prevent gdbserver
 being selected for or1k builds
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
Cc: Stafford Horne <shorne@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 27/08/2022 18:14, Romain Naour wrote:
> There is currently no version of gdbserver for or1k. Until this
> is implemented we will prevent both the direct and indirect
> selection of gdbserver for or1k builds. In practice this means
> that 'cross gdb for the host' cannot be selected and that
> 'full debugger' must be automatically selected for the gdb target
> package
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Stafford Horne <shorne@gmail.com>

  Applied to master, thanks, after extending the commit message with:

     This partially reverts commit 991b7b990ad8cd4a37564cd91d5bb0ee7e1e9f11
     which claimed that gdbserver for or1k was already supported before
     version 8.3. That is not true - the commit that adds gdbserver support
     for or1k [1] was only merged for version 12.1, which hasn't been
     integrated in Buildroot yet.

     Without that support, the build of gdbserver fails with

 
/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-musl/11.2.0/../../../../or1k-buildroot-linux-musl/bin/ld: 
server.o: in function `main':
     server.cc:(.text.startup+0x6dc): undefined reference to `initialize_low()'
 
/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-musl/11.2.0/../../../../or1k-buildroot-linux-musl/bin/ld: 
remote-utils.o: in function `prepare_resume_reply(char*, ptid_t, 
target_waitstatus*)':
     remote-utils.cc:(.text+0x28a8): undefined reference to `using_threads'
 
/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-musl/11.2.0/../../../../or1k-buildroot-linux-musl/bin/ld: 
remote-utils.cc:(.text+0x28b0): undefined reference to `using_threads'

     Fixes: 
http://autobuild.buildroot.net/results/b3c/b3c0df53d09d9facaf0c3c2bc4529f9fcf7737ee

     [1] 
https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=4933265c3f71b9134363d0c05f09542d5cc677f4


  Regards,
  Arnout

> ---
> gdbserver for or1k requires gdb 12.1 [1] but this version is
> not available in Buildroot 2022.08 and only in the next branch
> (upcoming 2022.011).
> 
> [1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=4933265c3f71b9134363d0c05f09542d5cc677f4
> ---
>   package/gdb/Config.in      | 3 +++
>   package/gdb/Config.in.host | 1 +
>   2 files changed, 4 insertions(+)
> 
> diff --git a/package/gdb/Config.in b/package/gdb/Config.in
> index 71fa6f6064..8fd5eb9fbc 100644
> --- a/package/gdb/Config.in
> +++ b/package/gdb/Config.in
> @@ -17,6 +17,8 @@ config BR2_PACKAGE_GDB
>   	depends on BR2_PACKAGE_GDB_ARCH_SUPPORTS
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>   	depends on BR2_INSTALL_LIBSTDCPP
> +	# no gdbserver on or1k
> +	select BR2_PACKAGE_GDB_DEBUGGER if BR2_or1k
>   	# When the external toolchain gdbserver is copied to the
>   	# target, we don't allow building a separate gdbserver. The
>   	# one from the external toolchain should be used.
> @@ -43,6 +45,7 @@ if BR2_PACKAGE_GDB
>   config BR2_PACKAGE_GDB_SERVER
>   	bool "gdbserver"
>   	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
> +	depends on !BR2_or1k
>   	help
>   	  Build the gdbserver stub to run on the target.
>   	  A full gdb is needed to debug the progam.
> diff --git a/package/gdb/Config.in.host b/package/gdb/Config.in.host
> index a294103ca3..15d5f52a36 100644
> --- a/package/gdb/Config.in.host
> +++ b/package/gdb/Config.in.host
> @@ -3,6 +3,7 @@ config BR2_PACKAGE_HOST_GDB_ARCH_SUPPORTS
>   	default y
>   	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
>   	depends on !BR2_microblaze
> +	depends on !BR2_or1k
>   
>   comment "Host GDB Options"
>   	depends on !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
