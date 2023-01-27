Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B12A9C54EAA
	for <buildroot@archiver.kernel.org>; Fri, 27 Jan 2023 20:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20E5461209;
	Fri, 27 Jan 2023 20:16:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20E5461209
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HdBl3aIhuyz4; Fri, 27 Jan 2023 20:16:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F6BB61201;
	Fri, 27 Jan 2023 20:16:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F6BB61201
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C22EB1BF2A9
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 20:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9C89040260
 for <buildroot@lists.busybox.net>; Fri, 27 Jan 2023 20:16:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C89040260
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qg_nmp3PPvFY for <buildroot@lists.busybox.net>;
 Fri, 27 Jan 2023 20:16:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB46940145
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [IPv6:2607:f8b0:4864:20::b35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB46940145
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 20:16:20 +0000 (UTC)
Received: by mail-yb1-xb35.google.com with SMTP id p141so7340419ybg.12
 for <buildroot@buildroot.org>; Fri, 27 Jan 2023 12:16:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XOtcmTp/SX8Xw+PTJlCqQkTSDBOex0P7Y4XjVotmnps=;
 b=zd9Zfut0ufFlYGX4xnR6bAlx8m8gEu0rM8PTLXXukTO4xm4rRWsp0Jg/NyhO0GJ/Fn
 9RBMh2Bn8Qh7rf4qEtmNJ9g6NH11sp/JrTCH8lBJj78PjoCaUzua3hZrB3n+30UC2NN9
 zagEqO3sLVjM3gy9FVe2T7KO+YnC9u8c+PIO/7XM9UMv25OTmbWBFthMXQSoBL4pm9hS
 LRmdfaENce1vTpXUpw37fqtt7AboFU27wJBB2aWUKLmIKq74362QLdKrHLmFq4kDQNev
 NNMZgCl0R7YgyYDhs6RC/SAG4hLZ2Vff63kFsmRXFUDM4TjBap+WQHlr0DuVM2ik1xFW
 lQJw==
X-Gm-Message-State: AFqh2kpb/ZQjRWx7Ux/OJb99DXlmJz52eGaKOa947jfKiWWEr6T/KAUT
 YLFrAHd8GTbtDQaFgWL4b2k=
X-Google-Smtp-Source: AMrXdXurEjqE9UK/OCFyAnHz1/J8MUUUbYa+u1tUzDzmwhleaIv0WWSO2VezcoprjIrNjr014ywgbg==
X-Received: by 2002:a25:3793:0:b0:802:a2ef:ebc8 with SMTP id
 e141-20020a253793000000b00802a2efebc8mr19812109yba.32.1674850579600; 
 Fri, 27 Jan 2023 12:16:19 -0800 (PST)
Received: from [192.168.1.3] (ip72-194-116-95.oc.oc.cox.net. [72.194.116.95])
 by smtp.gmail.com with ESMTPSA id
 dc6-20020a05620a520600b00706bc44fda8sm3421548qkb.79.2023.01.27.12.16.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Jan 2023 12:16:18 -0800 (PST)
Message-ID: <008fbd65-b246-b7d6-3e17-fd8577c87299@gmail.com>
Date: Fri, 27 Jan 2023 12:16:17 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Content-Language: en-US
To: Vincent Fazio <vfazio@xes-inc.com>, buildroot@buildroot.org
References: <20230126185049.3600233-1-vfazio@xes-inc.com>
 <20230127201446.1181422-1-vfazio@xes-inc.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230127201446.1181422-1-vfazio@xes-inc.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XOtcmTp/SX8Xw+PTJlCqQkTSDBOex0P7Y4XjVotmnps=;
 b=PByNM9edaT2QIySvu4QA85FMqQ0v36V+EGTTkxnSWtECfZoJ8aRwDQTSk03uPa27J5
 BO8wSkGun6F3Bc1b0sk9hR9Uw/XZagToq0GLZ2TAwk1jTqAwVhs/C3WS5pAYY5T73M8w
 K8vsA7C5IWnYGj+6Gi5rgQhuHN920WTg+v9xW9L1YUxWLtkEwlgKKngc5EpfHEIkdXha
 3Ms2ICKrFq1ETZpSGMFTCPZp0hoJHtwxKQ6THutpuM/xuSA6tmu7xvUTRRagSgF8wIJR
 Anb6W5QCubjYzHvbMDo1tOgrxhv85xYMqL8L3SJa0VbKWQVPkJlaHdxYcwRaNw1KUh9/
 AdSg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PByNM9ed
Subject: Re: [Buildroot] [PATCH v2 1/1] package/ethtool: fix builds for
 older toolchains
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
Cc: Matt Weber <matthew.weber@collins.com>, Vincent Fazio <vfazio@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 1/27/2023 12:14 PM, Vincent Fazio wrote:
> Upstream commit 1fa60003a8b8 made a change to headers that broke
> compiles with toolchains using kernel headers prior to 4.11.
> 
> Apply the patches slated to address the issue.
> 
> Fixes:
>   - http://autobuild.buildroot.net/results/e69886deb6ff466db96043388b5dac7271a5ec58
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>

Thanks!
-- 
Florian
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
