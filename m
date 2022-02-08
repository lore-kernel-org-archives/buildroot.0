Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58B5EC433F5
	for <buildroot@archiver.kernel.org>; Tue,  8 Feb 2022 16:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBDD460F05;
	Tue,  8 Feb 2022 16:31:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YPqvkBN_Env0; Tue,  8 Feb 2022 16:31:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A7F560EFC;
	Tue,  8 Feb 2022 16:31:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E32A11BF5E9
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 16:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0A93403B9
 for <buildroot@lists.busybox.net>; Tue,  8 Feb 2022 16:31:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OyRoe_RmnBAz for <buildroot@lists.busybox.net>;
 Tue,  8 Feb 2022 16:31:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7E459400CB
 for <buildroot@buildroot.org>; Tue,  8 Feb 2022 16:31:34 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id HTOtnZ3ptNVvLHTOun16L9; Tue, 08 Feb 2022 17:31:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644337892; bh=3H3drck9lihynHLLCi821OaQx0NUyY3AusjcUuNZMDg=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=MOtCDkpRuRYLHBfjGV1//RT1auYzZdLl0hs84BKKjfhPRD6bvpe/Pd/5KJqcLTjXG
 hp85HuiEMywrgPOHthoN1nrQtDQq+Guk7ACdc2A1z8u6HrSYememmK3q/d9ZxO6f9U
 3+2WYRnGK3ycDfl0LVxmkfIRWqeBw+DQAMni2oagxIXrQbszJS6qRyswcZNl+OGMde
 J5tWV1jwb/v/qvJG9XmAQ9ne09pdvgcdyxOMMXbHktrLoqZ2sh0NKqi3R1nTQIrNQs
 B9yyoA63nHfJ9WpErjXFuWLRtUTFA5zJZjVDRTfGMR8JX++RVyNDh92m0Gn4HlZXvQ
 oxe/pytazqZ1g==
Message-ID: <cfd7b2a1-f06b-c068-939b-f4f0bfe740b8@benettiengineering.com>
Date: Tue, 8 Feb 2022 17:31:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Neal Frager <nealf@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
References: <20220208071559.2862411-1-neal.frager@xilinx.com>
 <SJ0PR02MB7758927E29E93F773AD4C9F8D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <69efa9da-ae55-6795-8724-ed7105083924@benettiengineering.com>
 <SJ0PR02MB7758317CF3A3B2D662099BC3D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <32cc1c12-1496-7db9-5e32-1b99404a4fe3@benettiengineering.com>
 <SJ0PR02MB77585322044616B1600B5D83D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <SJ0PR02MB77585322044616B1600B5D83D72D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
X-CMAE-Envelope: MS4wfMhBx0wRCQ2G+5LHz+afLvuez2rmeecsJUy6gg9Ue6uTI26tqkU5IpPe/dQV2W9BKQnBhU5sXStuP4306xXH+imCFNOrFx6zlbnyKqrp2PbwuVQ7KA6e
 0eHGPMxi804UB/sOtjkSaYflJOp56zaAE/loLaAlNzU2ZA1BqXJ/wmv9GuujgzU7RHXh64clMh6NfskOAKqZfd7JQ8FnBrjPUcyyBtR8bYqPrhfr+8xL534l
 OlPvAfljOeNdJVIFRFlMIcoOC9wwTQtV+1IRlt7B5NlCxyqAEyTimZUrTRdN3mre
Subject: Re: [Buildroot] [PATCH 1/2] configs/zynqmp_zcu106: Bump
 ATF/U-Boot/Linux to Xilinx 2022
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 Michal Simek <michals@xilinx.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Neal,

On 08/02/22 12:56, Neal Frager wrote:
> Hi Giulio,
> 
>> I think you should go with local patch honestly.
>> As the patch is now.
> 
>> --
>> Giulio Benetti
>> Benetti Engineering sas
> 
> Ok.  Please go ahead and start building with the patch as is.  I have tested it on my side.  It builds and runs without needing any manual steps.
I'm building both defconfigs and see if everything is ok.
In meanwhile I ask you to subscribe and set as "superseded" the old 
patches in buildroot patchwork:
https://patchwork.ozlabs.org/project/buildroot/list/

Take care next times, when you send another version you should produce 
the patch with -v2(or -v3 etc.) flash and indicate what you've changed 
between versions.

Thank you!
Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
