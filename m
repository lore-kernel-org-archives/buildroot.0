Return-Path: <SRS0=W/Lv=OL=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C41C433EF
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:46:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3544B61156
	for <buildroot@archiver.kernel.org>; Tue, 21 Sep 2021 20:46:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3544B61156
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09D04610D8;
	Tue, 21 Sep 2021 20:46:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IFigX3kW1ILh; Tue, 21 Sep 2021 20:46:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 585FB60EAA;
	Tue, 21 Sep 2021 20:46:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB9361BF47E
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:46:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D780060EAA
 for <buildroot@lists.busybox.net>; Tue, 21 Sep 2021 20:46:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OopVljIJ6CIE for <buildroot@lists.busybox.net>;
 Tue, 21 Sep 2021 20:46:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0868060ABF
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 20:46:09 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id h17so1268712edj.6
 for <buildroot@buildroot.org>; Tue, 21 Sep 2021 13:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PpGHdRGReR9Rg6bJvucGRZ7SkdCpcn7tfCMFFabkCn0=;
 b=br0WELP0Lc2n8tuPrtmRvzeCD4z1gxMU5xiAfjKvgs+rTTeUvGWepxHjUL12J4cBsI
 I+9HBKFZUB2FGDp4iQbCHhVl2FGTWCo5f/X7fR0a1mdC2h5GiRYcYbjwhx20NSsUjjcp
 U7CA4UDVIEVi20gPBZQlL7HPGM+Qy6FerfbBLKDS5vLLjiDDrb2BflEo9IswDs3/TgTB
 ER6JujbAmuei8vt+o7W7Y4kmH2zgJM0K4Vi2E6KJo1Atw4qmZdvgUPDAhmCJxAdNodET
 A05TheskP+vU+m3Qxje9C6wCbcKm0QOPhcvCNI9AE6t8YAqJxa3WOSwPHUJOvzPsjs6r
 /chw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=PpGHdRGReR9Rg6bJvucGRZ7SkdCpcn7tfCMFFabkCn0=;
 b=Va3s7BTb2xCZNDg9ffop+5vgFXAvUQ6sCSDGsYIogI7XBGz8JWy/FaY5g6yOmWkQHy
 57corskRm+FavDveON4oLQEqo+5S0sqRdOthFQMmisdrP7pYuLnarj0cWv4sTaac3dSL
 ldg7/j5oA4K/tb11KnUUovZNqTRXurDZ5oiCVXI0JYApgjYJf/llJ4mC/WM6BkPrKEIx
 D0K5tNTRSSSgipgv/QzVd3tgYF0KKdW5aIz70yDxKK/hGkKyzgc8+dZ62Wr0HUU/kDhY
 MP/hHKrRPPBcMvBvNBbwvq+FkNIfiLhCh6WrL6sBc8jBr3LImn4ULizt/A4/7H0EQkBu
 6I+g==
X-Gm-Message-State: AOAM532Fi3b2NAMYT+/u5A9xIV33mdKQVn336/Ei6H3/mWztKfVA3Lpz
 PfNCW91S0QEdgwIzDWNRzFemKw==
X-Google-Smtp-Source: ABdhPJyQQYhYEGcdXoYwVQSAsivethu35+8UxD5humxi1TTPxIbvVCJH/7p2MPIkezam5BmUe59wSQ==
X-Received: by 2002:a17:906:7754:: with SMTP id
 o20mr24374454ejn.475.1632257168241; 
 Tue, 21 Sep 2021 13:46:08 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id w10sm18478eds.30.2021.09.21.13.46.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Sep 2021 13:46:07 -0700 (PDT)
Message-ID: <1d202363-484d-cc2a-818f-2b1b4fb7b358@mind.be>
Date: Tue, 21 Sep 2021 22:46:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Content-Language: en-GB
To: Thomas De Schampheleire <patrickdepinguin@gmail.com>,
 buildroot@buildroot.org
References: <20210913072942.30109-1-patrickdepinguin@gmail.com>
 <20210913072942.30109-2-patrickdepinguin@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20210913072942.30109-2-patrickdepinguin@gmail.com>
Subject: Re: [Buildroot] [PATCH 2/2] toolchain/helpers.mk: gdbinit: set
 auto-load-safe-path before sysroot
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>



On 13/09/2021 09:29, Thomas De Schampheleire wrote:
> From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> 
> The gdbinit supplied by Buildroot does two things:
> A. specify the sysroot where gdb can find shared libraries
> B. mark the sysroot as a 'safe path' for its auto-load feature, to make sure
>    that pretty printers for libstdc++.so are added automatically (see commit
>    6fb3216a80c64c08375429d89497eaeec5622150)
> 
> When debugging a core file, and the gdbinit file is specified via '-x'
> rather than '-ix', then the order of these settings matters: If you first
> set the sysroot, then gdb will immediately start finding the shared
> libraries it needs for the core file, detect libstdc++ and its associated
> libstdc++-gdb.py file, then give a big warning about safe paths:
> 
>    warning: File ".../i686-buildroot-linux-gnu/sysroot/lib/libstdc++.so.6.0.24-gdb.py"
>            auto-loading has been declined by your `auto-load safe-path' set
>            to "$debugdir:$datadir/auto-load".
>    To enable execution of this file add
>            add-auto-load-safe-path .../i686-buildroot-linux-gnu/sysroot/lib/libstdc++.so.6.0.24-gdb.py
>    line to your configuration file "/home/me/.gdbinit".
>    To completely disable this security protection add
>            set auto-load safe-path /
>    line to your configuration file "/home/me/.gdbinit".
>    For more information about this security protection see the
>    "Auto-loading safe path" section in the GDB manual.  E.g., run from the shell:
>            info "(gdb)Auto-loading safe path"
> 
> and the pretty printing code is not loaded. This is because the second
> line from the gdbinit file was not yet parsed at this point.
> 
> By changing the order (first configuring the safe path, then setting the
> sysroot), this issue does not appear and everything is as expected.
> 
> Note that when '-ix' were used instead of '-x' to pass the gdbinit file to
> gdb, then the order would not matter, because the entire gdbinit file would
> be parsed before considering the core file.
> However, even though the Buildroot manual now suggests '-ix', users may not
> have noticed this change and continue to use '-x'.

  Whaa, excellent, not content with fixing a bug once, you fix it twice!

  Applied to master, thanks. :-)

  Regards,
  Arnout


> 
> Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
> ---
>   toolchain/helpers.mk | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 1dfb52ac38..ef8e9a5f64 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -481,8 +481,8 @@ check_toolchain_ssp = \
>   #
>   gen_gdbinit_file = \
>   	mkdir -p $(STAGING_DIR)/usr/share/buildroot/ ; \
> -	echo "set sysroot $(STAGING_DIR)" > $(STAGING_DIR)/usr/share/buildroot/gdbinit ; \
> -	echo "add-auto-load-safe-path $(STAGING_DIR)" >> $(STAGING_DIR)/usr/share/buildroot/gdbinit
> +	echo "add-auto-load-safe-path $(STAGING_DIR)" > $(STAGING_DIR)/usr/share/buildroot/gdbinit ; \
> +	echo "set sysroot $(STAGING_DIR)" >> $(STAGING_DIR)/usr/share/buildroot/gdbinit
>   
>   # Given a path, determine the relative prefix (../) needed to return to the
>   # root level. Note that the last component is treated as a file component; use a
> 
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
