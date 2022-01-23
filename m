Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72754C433F5
	for <buildroot@archiver.kernel.org>; Sun, 23 Jan 2022 18:39:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5424408C1;
	Sun, 23 Jan 2022 18:39:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pB0NM1hYHzLc; Sun, 23 Jan 2022 18:39:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 322664033A;
	Sun, 23 Jan 2022 18:39:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 28DCA1BF329
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 18:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2594A813F4
 for <buildroot@lists.busybox.net>; Sun, 23 Jan 2022 18:39:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0LRKd24pFAbg for <buildroot@lists.busybox.net>;
 Sun, 23 Jan 2022 18:39:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7152C813F1
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 18:39:16 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id a25so5703159lji.9
 for <buildroot@buildroot.org>; Sun, 23 Jan 2022 10:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=Dd8i4z1nGcOasHerbIVP+MggHw6Seul3fVVljpSaCuk=;
 b=GgOCGmy5hvi2/HM+lSocgY3KJ/7uzd/0vsXiXRt0K1kgUFAxlZPTlrEHq/pEl1tWgz
 m3lALRGLXaxqty+1FtLCf60b/NW/Cx8TNcut65/IhGfWARDia3dX+BiyAf3PbC/8T2WQ
 p3fJY9q+kUAv9wGoZI3qdskD6URhQEFMqJES5TTXRUQkNEtSAf1jHB8VOVCHYF1gNrlg
 OrQhvdQ5nnNLRCQyMp5ncC5NdVyMbW8Rp9/APqeV8D3dPjlr+D6TwbDbsNkRnsM3Anxg
 fzaZgOL98zwzBcVi/iaE8enU3yfomo84Hu2lWSsrMzfeo0nX0IlxpHLHcsOEnhIq/h+x
 n0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Dd8i4z1nGcOasHerbIVP+MggHw6Seul3fVVljpSaCuk=;
 b=ir7h10P9T+JMOE/3ZjpHRIucxUPTv/9mRpcd4FJvQms17eD8z1aN71RE7353lqrRnR
 ul0E+45It4GFWpvXMDkDAoiw47Y2LmjNFVndxCAFbE6/jbtt8j0WUUcfl/G02LzF7bHQ
 svbUB3dNrj4OWWSAQSH+pTIUpAgI42nahEP2vfWTXE9Pbh8dhVYTEkJM4Y+R08L3zSvA
 kw7MEBNVsoW2LWj6eEliFwWPcVCmRvchgpwZ14yHstbdcc6O7BBGnj9Ni5jmqtadXXYA
 /Dz7O0a8fjcyway2IhwTQsmy5T4gOR6hl/6OLVJTVyO+HAERP0L4X6ohJso3Fe6upa8x
 5epg==
X-Gm-Message-State: AOAM533jMxJ3+CIigkANPI2fwlfDO/f7c7BVvSJdsTfMovoRpRVYyDgR
 pmGfZVJAqRH3lP7xg2RnmSDCVZ/BKno=
X-Google-Smtp-Source: ABdhPJyi0BnNgfWOXmnRjL+dk+P8Q0VwBDpV7uEdBp1s/87MOxUt6prG9+d+d3W9D5jzwLInZ2r4nQ==
X-Received: by 2002:a2e:7009:: with SMTP id l9mr2308233ljc.34.1642963154422;
 Sun, 23 Jan 2022 10:39:14 -0800 (PST)
Received: from [192.168.10.7] ([178.155.5.204])
 by smtp.gmail.com with ESMTPSA id d16sm21075ljj.74.2022.01.23.10.39.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 10:39:13 -0800 (PST)
Message-ID: <277af5a8-5490-9d79-c84f-bac556a0d6af@gmail.com>
Date: Sun, 23 Jan 2022 21:39:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: ru-RU
To: buildroot@buildroot.org
References: <20220118104338.2081259-1-giulio.benetti@benettiengineering.com>
 <20220118104338.2081259-22-giulio.benetti@benettiengineering.com>
From: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
In-Reply-To: <20220118104338.2081259-22-giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] [PATCH 21/28] configs/orangepi_pc_defconfig: enable
 NEON/VFPV4 FPU strategy
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

Tested-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
