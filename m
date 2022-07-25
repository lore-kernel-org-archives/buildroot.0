Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A75BC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 22:21:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 770C841A4C;
	Mon, 25 Jul 2022 22:21:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 770C841A4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wfthsJvO3wxQ; Mon, 25 Jul 2022 22:21:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3DB641A4A;
	Mon, 25 Jul 2022 22:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3DB641A4A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF2DC1BF363
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B665160D4D
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 22:21:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B665160D4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RumNaz6XH5OB for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 22:21:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DAA3360B4E
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DAA3360B4E
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 22:21:24 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 w8-20020a05600c014800b003a32e89bc4eso7141502wmm.5
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 15:21:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=J43wBZ7HYurv6yORVtoaV3LzNj9IoAkXR9zOiw+WQkU=;
 b=kBmonnzwYENEGwv0jg1NPIN38HfOk6EL3BrvXcJ3WzVkaov6UCte3LxjeGnRUeBrFH
 YGL1yreseHwilEjjfIXkS5of+ovUeNMv5vA1oqLhlE4SKjbP1PYHiVnRGMMVU3Svmpy1
 5rYFbK1HQ7nwdNqEn8JJniKfq4NAjwUqw6AdE6ifEGc5rU0jwMsRtlX7Nv9X/+RgY1Ez
 4v9YY45nzlBY5+HAGTKJhIup5AtJA5arwNdjS/r48QrGbNXtnSs/8AcRlq3NOfKvv5X6
 T/AD1fiKEprLTRLpu0Xoj96csME2/5TAyt8MEXNZ1xGLVa3KVyB4FtK3WtsTfb7lPu00
 TDlg==
X-Gm-Message-State: AJIora+4WnFWAhZNa8m1HzqIN5tbBQLNliZ4CHAGsBl9ifRTjlM9PZwQ
 H1l/mUw/h5+hFeExBGB16hoMPz7L5bf+fQ==
X-Google-Smtp-Source: AGRyM1uVyfMTY9hy18GcVoq8y2LGcyPE7R+kF3JgVcJ7T+7UiCD9NpCQ5aCQUBhhEnGvafdu19noxw==
X-Received: by 2002:a05:600c:4113:b0:3a3:4b67:d086 with SMTP id
 j19-20020a05600c411300b003a34b67d086mr8375625wmi.20.1658787682738; 
 Mon, 25 Jul 2022 15:21:22 -0700 (PDT)
Received: from ?IPV6:2a01:cb19:8acf:5600:3b0f:2669:24db:51d0?
 ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a05600c3b8c00b003a2ed2a40e4sm21051639wms.17.2022.07.25.15.21.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 15:21:22 -0700 (PDT)
Message-ID: <39611960-d2c8-d777-8a2b-bd8cf9b9702a@mind.be>
Date: Tue, 26 Jul 2022 00:21:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-GB
To: Ricardo Martincoski <ricardo.martincoski@gmail.com>,
 buildroot@buildroot.org
References: <20220724054912.2354219-1-ricardo.martincoski@gmail.com>
 <20220724054912.2354219-3-ricardo.martincoski@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220724054912.2354219-3-ricardo.martincoski@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=J43wBZ7HYurv6yORVtoaV3LzNj9IoAkXR9zOiw+WQkU=;
 b=WHHdH/569fK2dH16/CTN2jZ+od3vgU33Tnza58zqFKoS87whvaQcxdPrFzLDbAucDF
 VGJomPJaw6Viz3gY3kVFuWskdDdGJkqRCOu5WDHJ33aI24uAzDIBce7jguhp+HRnKamG
 GooJ+McvlIsObFxweR9jXSruxtORcj3terBWaXPYkm9WLhLpXD0ZMKxSXvg5Ee1z7TuF
 Eq2THxcqZuLCdVsHB0uy8xEfyd1gibLvKv0C4cpJKisv8SxfH3r1Gkt7C9N1E/ASIcTZ
 TkMo1yLXq1P7whyfUR/MB4UcVxHU62GCD0vEWSAZnTBlFyD9CnkOX+h6fYLknyXs3u/V
 Br7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WHHdH/56
Subject: Re: [Buildroot] [PATCH 02/16] utils/check-package: improve
 shellcheck reproducibility
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
> shellcheck is already in use to check SysV init scripts.
> Currently its results can be affected by the existence of a
> .shellcheckrc file in any parent directory.
> 
> For instance, in this example:
> (1) /path/.shellcheckrc
> (2) /path/to/.shellcheckrc
> (3) /path/to/buildroot
> the configs from file (1) are ignored and the configs from file (2)
> override the default values from the shellcheck binary.
> So the config file affects the check-package result for SysV scripts.
> 
> Avoid this reproducibility issue by adding an empty config file to the
> buildroot topdir.
> 
> It can also eventually contain configs (different from default values
> from sheelcheck) that we want as a standard to all shell scripts tested
> by check-package.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   .shellcheckrc | 0
>   DEVELOPERS    | 1 +
>   2 files changed, 1 insertion(+)
>   create mode 100644 .shellcheckrc
> 
> diff --git a/.shellcheckrc b/.shellcheckrc
> new file mode 100644
> index 0000000000..e69de29bb2
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 00315ffe6f..8b2fdb8f6c 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2467,6 +2467,7 @@ F:	package/libhttpparser/
>   
>   N:	Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
>   F:	.flake8
> +F:	.shellcheckrc
>   F:	package/atop/
>   F:	package/thermald/
>   F:	support/testing/infra/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
