Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94929C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:58:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 356F560EE6
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 20:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 356F560EE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0025180F84;
	Sat,  4 Sep 2021 20:58:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 09WOnVgBsW_2; Sat,  4 Sep 2021 20:58:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58F9880F7E;
	Sat,  4 Sep 2021 20:58:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D2091BF20F
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A7E080F7E
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 20:58:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3-GgpECui66F for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 20:58:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 957D780F7D
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 20:58:25 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id lc21so5176840ejc.7
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 13:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=/nL3ZeJdbGdOmejJSXD3sV4OOUVG5LBQUwBs0ILgnLk=;
 b=DfdJQczi6PfWGUlEDOxaSUU+kjNqbc08dq8oesrL4m1Cmb2Xn8G0zwPd7CPH/P3k+V
 SpW1GSuNxXdW6ANFEzs0hsmfDcJOL6VL7HUMKd3okpoA7X7Spe2eA1Lx/elpLJDR77Nf
 UHKXopPnNgE2q0IDmU11CNx6LNSVOfah1snN0+pr3wkuhPTxaZl/j3J0Mp4dSAP6mmQE
 ZOzDTHnRtGwlQR1aVdGcov9/iA1Jx9m3vnU5SUzfDpxjyGyMVrBZ6b18fIL3wv+HBTZC
 UeOQzVGeKjz1HDW2QeHeYrG9bCsJ6Im9QwKxRuBYaz6i9XDczb6ZAI3yrdU3Y5Ek27CR
 K3Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=/nL3ZeJdbGdOmejJSXD3sV4OOUVG5LBQUwBs0ILgnLk=;
 b=D6U+4QfEIBf/dI3ufUSlUO1cqBiQStFD8HM8eQoDzSheNowKxQpSyvOYNdRVPy+0wx
 NNiS9+3QepQZ6a0S3hSfYYxX/WoQNoL4Wy+y3/jjSGEpnAjMqiATLsbD7xe0XEHLMs/6
 ztoVRpi1Y80JIWDHDFlvIGEZ6XwoiwSIJASTff5rX6iZFdb3U7BgbaBDc+nqOC/oNDrk
 uSPHXjaHdjQn/A5jbrOaBmLpW41FGyMSmnIs45kN/xu3n/shFHt0X9qMvpeAKKoExhBF
 4iTo5ZRvo0DQXpmRy9JfiB41rx6srJ3qdyY0nKEJZOdeCRBMWpDLX8WQfTtGUvJOKPkT
 EOjw==
X-Gm-Message-State: AOAM532nB20NbzXHuDy3T/rrAjDEGAi1aQn7fuySEdRPLAd9ULN/s2bV
 phfGBDlSfT2HmbR26aoFXCmTeEILhpg=
X-Google-Smtp-Source: ABdhPJw9HHV6ZGt/rvcCLKMcush9OKBvePZZekUMiCFifZhBxkv+E/chThJRfTANr7jOM7d0nf/BTA==
X-Received: by 2002:a17:906:ece1:: with SMTP id
 qt1mr5671071ejb.281.1630789103891; 
 Sat, 04 Sep 2021 13:58:23 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 c10sm1516305eje.37.2021.09.04.13.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:58:23 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMck2-0004kI-OF; Sat, 04 Sep 2021 22:58:22 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210815165845.1495680-1-fontaine.fabrice@gmail.com>
Date: Sat, 04 Sep 2021 22:58:22 +0200
In-Reply-To: <20210815165845.1495680-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 15 Aug 2021 18:58:45 +0200")
Message-ID: <87eea4m51t.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/iozone: update IOZONE_VERSION
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
Cc: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Update IOZONE_VERSION to reflect what is used by
 > https://release-monitoring.org

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
