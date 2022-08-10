Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C8EC00140
	for <buildroot@archiver.kernel.org>; Wed, 10 Aug 2022 21:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE7CE827C6;
	Wed, 10 Aug 2022 21:31:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE7CE827C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ND5e3LoWabzZ; Wed, 10 Aug 2022 21:31:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD2A08278F;
	Wed, 10 Aug 2022 21:31:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD2A08278F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E40841BF40E
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 21:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBD414091E
 for <buildroot@lists.busybox.net>; Wed, 10 Aug 2022 21:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CBD414091E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bVnnxeaxzx3O for <buildroot@lists.busybox.net>;
 Wed, 10 Aug 2022 21:31:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F74C40531
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com
 [IPv6:2001:4860:4864:20::31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F74C40531
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 21:31:01 +0000 (UTC)
Received: by mail-oa1-x31.google.com with SMTP id
 586e51a60fabf-10d845dcf92so19311820fac.12
 for <buildroot@buildroot.org>; Wed, 10 Aug 2022 14:31:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc; bh=fzQq2iK2usv2ZCEpXefxUEOG781R3qWu9TxOPTos7kA=;
 b=yKxqcwmpM2TcvlhjkL3d5j8h6N01gUdk+TTA8kP6gHZ63U6i/UE4zXKRU/UdaOEAa2
 RU6LIUWc8X6ftDkAfSVvCnUy94CThYhEfj9kRPBiWfnPVkKiK+FcKXA93G52Mc07oVI5
 gGuilRc0V9QcQJaRuEioWAmHUAASQ8fEN/4dhvbG15C2umm1X43T0ZgZM2Sk+6gDXSHU
 FSBbwGq2uoeLkU32+XUu/bbF5YFSQWSmsUoaRElUU8jUgq8XnxikbI9ucgzzINvZGE1P
 yclGFGFNCTva2tfhonwx9KGNpuP6kxax5bYLveBxaNsC41GWPV+nuP3US2uluSqmh3Se
 k6QQ==
X-Gm-Message-State: ACgBeo0KKp4C0XH+mdv8PPLO6ju71OtgoRFOcXuNFXmFKjo25E9OeCeO
 tNaGQ7hGlZiy7Fk0RO+9XktCfJfmyRhI4g==
X-Google-Smtp-Source: AA6agR6DP0fCNtGvXwriGaPzctisDi/EJftUsgJn5PS9hNS5KMPDg05NrA8eST7KuzSYC+YhAMrdPQ==
X-Received: by 2002:a05:6870:1495:b0:115:8a17:32fb with SMTP id
 k21-20020a056870149500b001158a1732fbmr2411729oab.86.1660167060307; 
 Wed, 10 Aug 2022 14:31:00 -0700 (PDT)
Received: from [10.0.0.73] (96-82-249-149-static.hfc.comcastbusiness.net.
 [96.82.249.149]) by smtp.gmail.com with ESMTPSA id
 a24-20020a05683012d800b00637032a39a3sm861885otq.6.2022.08.10.14.30.59
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Aug 2022 14:31:00 -0700 (PDT)
Message-ID: <fb969d0c-6c59-a3ce-0a72-ddd85a388df6@gmail.com>
Date: Wed, 10 Aug 2022 15:30:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Content-Language: en-US
To: buildroot@buildroot.org
From: Lance Fredrickson <lancethepants@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:subject:from:to:content-language
 :user-agent:mime-version:date:message-id:from:to:cc;
 bh=fzQq2iK2usv2ZCEpXefxUEOG781R3qWu9TxOPTos7kA=;
 b=dZAZ+gqCuDvjCKQPjhS42dZry6cW30b1IBYMOs3sPp41Vypr1qpJG/xF8v7VU+znbe
 Z0j0niIcMws1LPI10cLj4ViFWeATLn9rtpEEstg6ciTJExJS1RwNE9V4oMRCF7muXzxE
 S0aWgO9EwDpckOnT3+Z+CN42iv/IJAMjHycrsfNvqgNiBGU4mi4UZFdcuMkSNlsD0FGI
 JaUm+r+uMdu1P23533bOG54BYH+sgsomEPkpj9m3hKMN1t/0JFP+V73Mlu7pM3NrEjNL
 JtZlWKok3e0TAJBipiFbQ8Tutpz5u13J+bD8nWGM7m8u8IfQZdoglOMmPx89s3ZY5a6C
 r1rg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dZAZ+gqC
Subject: [Buildroot] [Aarch64] libstdc++ segfault at end of execution
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

I'm having segfaulting issues with c++ on aarch64 using uclibc-ng.
Anyone else using aarch64 with uclibc-ng?
I submitted a bug to gcc so am linking that here for this description.
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106581

thanks,
Lance Fredrickson
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
