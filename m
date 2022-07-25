Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F400C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 22:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A776583E06;
	Mon, 25 Jul 2022 22:21:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A776583E06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tx0j8yApNMx7; Mon, 25 Jul 2022 22:21:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0834837C9;
	Mon, 25 Jul 2022 22:21:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0834837C9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9E5521BF363
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 758EC41A4C
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:21:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 758EC41A4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lAwsZcbjSB0O for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 22:21:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C732341A42
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C732341A42
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 22:21:09 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 c187-20020a1c35c4000000b003a30d88fe8eso10244824wma.2
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=nX4zgwdTKae+9Ohj5ov2NsQlWt9gDUfgSvo2dr6QFdY=;
 b=QB0sqZRpcJXgkkxBxtvWiHcWackMvmdzs+zjtppekOohMno6T5UpwASIxFRFzo9nFE
 d7CPaVJChJ19dRFd62wKeXLjYum2Kg9bGsR4q5a2STBLf9zM0l1Zjw1rv5JTRBy8xYYh
 otdfnvjn9ldHGep6rO1e7sYcKK5eMIx9e9oDFlPnhv0gVGN68fGJCJblvujPdQn4qCxc
 kcE+qqXqc8wTh7OQnTCUZmAAGdseYwob9aeYvy8dKeqeZstkyUoMp5sdl9T/hqILz9ZQ
 63/EDrQk2sQWai/pZ7loq95fGjAYLMoptfC57J78thJlbK9wPx9A42nVyzHbDDpbXi7y
 p9UA==
X-Gm-Message-State: AJIora8Rr8ZzhtP83WDYXeUNcg9ru3jrEQVqOQo1/suYjmyopYeOJcV0
 ode7/IuIc5nqSdeQJNpyzHIdvQ==
X-Google-Smtp-Source: AGRyM1vq3AVeI+R4wMNloupss2XWhSrUQdboh9KQZcKBPQX80DxEPKUoKqKIAQ9oplqbB0EzZ8q1Ng==
X-Received: by 2002:a1c:4c0f:0:b0:3a3:1401:7660 with SMTP id
 z15-20020a1c4c0f000000b003a314017660mr22695826wmf.8.1658787667659; 
 Mon, 25 Jul 2022 15:21:07 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 l35-20020a05600c1d2300b003a2fc754313sm17237693wms.10.2022.07.25.15.21.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 15:21:07 -0700 (PDT)
Message-ID: <847b1cc2-fed9-37cf-ac91-dfbf067df15c@mind.be>
Date: Tue, 26 Jul 2022 00:21:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
References: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
 <20220724054912.2354219-2-ricardo.martincoski@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220724054912.2354219-2-ricardo.martincoski@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=nX4zgwdTKae+9Ohj5ov2NsQlWt9gDUfgSvo2dr6QFdY=;
 b=VY6ww0RsumZW+rFBDZEsAj6G1Qb7qZyJDxI9VDMH/wx4KflxRhImE9xW9hWV2/Q7qO
 1oO59dw7z/SKAa1OFyFHcb5GXyNL8yRSeo6VBOCTdRxie0ux+okyN2ayTTpqhAYR6kPx
 MJPf8lD6hCJJ92VQda9d80YqbyZH/rQCqi0OMH2oMJC6I9Z8WIAfocYFlCUPfkbduzqK
 QRyjLUxHYcUCOxCBh8m0EvC5qlJKCnlvXclnCUK5XBizX1w0KT+VdMUZjEMttV/pGKF6
 jSuPy/nQcv4qk9UCojwHZzMt1Ypo6h03w8p+BQrJVu1FCmrssd/sKVBQ5IYUDRuwz17o
 2tZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=VY6ww0Rs
Subject: Re: [Buildroot] [PATCH 01/16] DEVELOPERS: update entries for
 Ricardo Martincoski
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



On 24/07/2022 07:48, Ricardo Martincoski wrote:
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   DEVELOPERS | 9 ++-------
>   1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index ee836266be..00315ffe6f 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2466,21 +2466,16 @@ N:	Renaud Aubin <root@renaud.io>
>   F:	package/libhttpparser/
>   
>   N:	Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
> +F:	.flake8
>   F:	package/atop/
>   F:	package/thermald/
> -
> -N:	Ricardo Martincoski <ricardo.martincoski@gmail.com>
>   F:	support/testing/infra/
>   F:	support/testing/run-tests
> -F:	support/testing/tests/core/test_file_capabilities.py
> -F:	support/testing/tests/download/
> -F:	support/testing/tests/package/*_python*.py
>   F:	support/testing/tests/package/test_atop.py
> -F:	support/testing/tests/package/test_syslog_ng.py
> -F:	support/testing/tests/package/test_tmux.py
>   F:	support/testing/tests/utils/test_check_package.py
>   F:	utils/check-package
>   F:	utils/checkpackagelib/
> +F:	utils/docker-run
>   
>   N:	Richard Braun <rbraun@sceen.net>
>   F:	package/curlftpfs/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
