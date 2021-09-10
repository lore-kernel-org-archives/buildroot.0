Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17C61C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 11:13:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D140561100
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 11:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D140561100
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A027060B69;
	Fri, 10 Sep 2021 11:13:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C4aVGbZXReeC; Fri, 10 Sep 2021 11:13:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1887460B45;
	Fri, 10 Sep 2021 11:13:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1744E1BF23C
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 11:13:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04F95405F4
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 11:13:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U-TwlFKYBPAZ for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 11:13:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 019D2400E4
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 11:13:02 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id am9so191586ejc.7
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 04:13:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=m1h2lSMMctVcO8CJXRNyXqvdrR5hQ4RNWNUprL/oJx4=;
 b=plRyoelrR7ct5zazSEMHHoj/TVJ1wACJoEEr/TG7ZF7oX3am50rXWFsVmb/G8aP1P+
 7n9OLoXlp9iqnry+Usn0oVqfLOvStqfmROCE6Kkk6J2rHWnqwbKa8Li/62Mth9R6zlyl
 xD2NAzoOMTE8QG4Pgywms561+3lKX8C/dN2r8gB4x3vpx20oEHSO53TpUBRKJyDuMV+/
 ECqXVh5DqKXOYSa7pKMkJ6pCUZGHzm5UrFQLXiYa+N0u7MjY3oaRp41Yq3mBHagLj2Ae
 7GRlrxpfWnwh76hV5xyqwlCh0K8ywPOAvXRdM9ZI+idX+e6KDM7Q0W9bIrEtZjUZrne9
 4atg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=m1h2lSMMctVcO8CJXRNyXqvdrR5hQ4RNWNUprL/oJx4=;
 b=cnAOv8uGJmQ/BlNjtZ4ydA/V9F2oBQ6dp4qmUNPY8H+YnflxQzx30XtUhNEv3iiazw
 dSAtVy+ExBeh8thiOPR/3LavkXbhIklI3Fp7x6osqFKrxOKQm5EnS7w9cSflVAhjHoNf
 jBiVLT5vkLcTVKTI2rGcBB3cueA9WQA3az661BLQgncx7eYBOAjtZIs0UwT4NpbQCGgP
 s+72jRM8sNxltCLiFk97pnd/uyoHqc051sRALNQvjfdlBumqjldJIQ5i9p9eGh/0rULI
 TbaNp3+L9cgnIZpgPA2ygSmopD3oLVONWxYAnms/WNLcl1GCFBi+x0UoF2Im4x8ipbv0
 ijJw==
X-Gm-Message-State: AOAM5328fM0AbVGRl7PcSMeBLlt+SyMWTU5SuHAC3Qd27mAt2vSuLzY0
 256euNDdDzcSV4vrMDqNnJG+bGI9Y2Q=
X-Google-Smtp-Source: ABdhPJw3Ih7s41sw771JmNSJ9F5hYRNEb052GoGnZ3/6Lrg/HTudB4jtVqS7k3tI2bh70dQ2llCcqQ==
X-Received: by 2002:a17:906:4413:: with SMTP id
 x19mr8892139ejo.234.1631272381317; 
 Fri, 10 Sep 2021 04:13:01 -0700 (PDT)
Received: from dell.be.48ers.dk (d51A5BC31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 ks20sm2236152ejb.125.2021.09.10.04.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 04:13:00 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mOeSq-0007x6-0X; Fri, 10 Sep 2021 13:13:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210903214525.615577-1-fontaine.fabrice@gmail.com>
Date: Fri, 10 Sep 2021 13:12:59 +0200
In-Reply-To: <20210903214525.615577-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 3 Sep 2021 23:45:25 +0200")
Message-ID: <87r1dwadl0.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyudev: fix build with
 python 2
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
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build with python 2 is broken since bump to version 0.22.0 in commit
 > 0adb141d342707ca9a478f57f187e38d5bb716f2:

 > error:   File "/usr/lib/python2.7/site-packages/pyudev/_ctypeslib/utils.py", line 54
 >     lib = cdll.LoadLibrary(f'lib{name}.so')
 >                                          ^
 > SyntaxError: invalid syntax

 > Fixes:
 >  - http://autobuild.buildroot.org/results/8b35ca6910dfd881953968f8d88ac842d57c9262

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
