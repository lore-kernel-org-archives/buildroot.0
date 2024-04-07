Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AC5CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 16:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32960408EA;
	Sun,  7 Apr 2024 16:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PalLUTaZaE8P; Sun,  7 Apr 2024 16:00:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD205408F0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD205408F0;
	Sun,  7 Apr 2024 16:00:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4EF071BF2CC
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BD1D60AD4
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 16:00:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IRKs5NyhhJTJ for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 16:00:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 354A660AD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 354A660AD2
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 354A660AD2
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 16:00:32 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-34175878e3cso2694954f8f.0
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 09:00:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712505630; x=1713110430;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=I+hWbJTdecGtRb8iA6Ay8bc8j8xowizGyXQn+UKeHw0=;
 b=ASzLec09a4FPfzFGobteEFIpX+4lnr2ff4TIU0e2ibt+4yIeozQ5dKNpPfPplDWfRE
 AIR3xItp8GUNP+D4NcG07Kdl8pSD6NI6FVHyR2gqWLOA8BId3iOXY2MosctPnoHxUE/U
 h9n1Op1W4uCX+ZmI9SxTI5iXNRtNnunt+H39Ho/uqL8FLBb6Yh+gL1+hGK9eVyG9Sfbn
 5yMknl+csE92sfSTSDjqBIA3iAYadZgMyya9E7+VKlGh8CP3noF1N5rLZfOYAcTBW4wd
 6JdYRydY4UIYpTm7CX7lF3q8nFk+IYNqlWQSR+IOujV6qAiWx3aKF72x0GgSGwDW2NaS
 GZFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVF6dHbTF0bzKyra21Lk85ZGldWKpRU1HZXM2Vkq5BpNT62N3Q0GvVqixm40taUbyUd7rBnr2leBUxjHM4u6ju4bfpNbRJgGg==
X-Gm-Message-State: AOJu0Yxp4NlwMAVNwyMRz9ZUyyj0qBbFgbk+6O+YeMSUzOmH+AE4n7Q1
 xcofh/66fNLRgtVz94A4kKaOg/9Z13Y/mqka/IOGKovn9TqnZDZWX2JBBYV+Mxk=
X-Google-Smtp-Source: AGHT+IGW8MCDlzHp3CT+HEoccrAt7uzyXRAih5chbS9bG7CsFrdZTuBTt1bJWUbntAR8iGWGRw0ayA==
X-Received: by 2002:a5d:654e:0:b0:343:bd44:c261 with SMTP id
 z14-20020a5d654e000000b00343bd44c261mr4507756wrv.8.1712505630076; 
 Sun, 07 Apr 2024 09:00:30 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 n15-20020a5d67cf000000b00345555956c6sm3694304wrw.92.2024.04.07.09.00.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Apr 2024 09:00:29 -0700 (PDT)
Message-ID: <929e101e-8222-42dd-8f3e-660818d08a44@mind.be>
Date: Sun, 7 Apr 2024 18:00:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sen Hastings <sen@hastings.org>, buildroot@buildroot.org
References: <20240225220544.754965-1-sen@hastings.org>
Content-Language: en-GB
In-Reply-To: <20240225220544.754965-1-sen@hastings.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712505630; x=1713110430; darn=buildroot.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=I+hWbJTdecGtRb8iA6Ay8bc8j8xowizGyXQn+UKeHw0=;
 b=Aw+7ysWLumU/P9GbjodEVYxoser32i48cdtUIs+LOtV7+O3c9lRe48NvO0h0FJrt+Z
 FgTeiHmX3kS2z6IcELXAmMgEX9sW7ct2RHIyMD9W35QkeP7G27sXrnaFNDW7AV3mnFU3
 mSIH+1CTJ9EyjFBvHcFAB/S00U8cnIkWeggxyhZ3SU++8D9kqCh1o3KUZm9UawbdoEXl
 xxgrJrxMI6SnWzeXiSXMCmtPowa+mKYCmnkHm8iD4SAzf1FN7tDG+LTHvxKQ9Rbyywi7
 3anzKQUaTgvNeVmy7CYyaoC126nGXX/V/lwmASq1fxk9GUUXHSCzEGOtyyc0lg+3MxZ3
 8yVQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Aw+7ysWL
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/pkg-stats: fix bug when
 sorting by hashfile
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/02/2024 23:05, Sen Hastings wrote:
> Because the div_class variable was not reassigned a value,
> cells in the latest_version column were still being assigned
> hash_file classes and so were being picked up as elements in
> the hash_file sort. This lead to execessive grid gap elements
> stacking up and creating huge blank spaces at the top of the page.
> This is very noticable on pages with a large number of packages,
> like the ones the autobuilder creates.
> 
> original behaviour(click the "Hash file" column label twice):
> http://autobuild.buildroot.org/stats/master.html
> 
> demo of fixed behaviour:
> https://sen-h.codeberg.page/pkg-stats-demos/@pages/fix-bug-when-sorting-by-hash-file.html
> 
> Signed-off-by: Sen Hastings <sen@hastings.org>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   support/scripts/pkg-stats | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/support/scripts/pkg-stats b/support/scripts/pkg-stats
> index 9307992d29..9ba356cb7c 100755
> --- a/support/scripts/pkg-stats
> +++ b/support/scripts/pkg-stats
> @@ -977,6 +977,7 @@ def dump_html_pkg(f, pkg):
>   
>       # Latest version
>       data_field_id = f'latest_version__{pkg_css_class}'
> +    div_class = ["centered"]
>       div_class.append(f'_{pkg_css_class}')
>       div_class.append("latest_version data")
>       if pkg.latest_version['status'] == RM_API_STATUS_ERROR:
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
