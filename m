Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20FEEB28E4
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9101D61251;
	Fri,  6 Feb 2026 08:12:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kILF_Ul3qqHw; Fri,  6 Feb 2026 08:12:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 858AF6121A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365532;
	bh=KBRkPEtNq4bL427zSERUw9Updx45mFP0Pd/buEhrsek=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EnPWq49SNVqJl+gh6zna+KI09s3z0wlyU2cs5jeNgftyZWXu+L5A982r9GfivuFWX
	 odsWLi9SyR+02X/5wjvXdiNXFkRGmOw1VNIPFqoPNTKzrlN//AbBTJqP7HfUEtb0L5
	 X9dpl98rEEObNC/BDPjEnwkLMC4BdmRjz23fQ9GIu9OjIRo0TseztNmbSdeXbob7tz
	 UTex+DERgj76to78Prpfg7ffnKhBQh33v9rroBfDmWhzi6MrGLs1bPCYyTaOEBekx/
	 h11PC2wn3F9LdfRWVWxKytbGfjkUFbd4TygW+3pMdaK92BlJ/hCVodhNMzCZzcAqFg
	 I0muEPEiNwFtQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 858AF6121A;
	Fri,  6 Feb 2026 08:12:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C61BE219
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B35C2611EF
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gfGjfD5KKbVO for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:12:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::341; helo=mail-wm1-x341.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 41543611FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41543611FA
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41543611FA
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:01 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id
 5b1f17b1804b1-47fedb7c68dso18533375e9.2
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:12:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365519; x=1770970319;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=zXsa9VcQD6tWUFdT+2RZKGWITVvzzFi+MLZsT9zYOfw=;
 b=g+nPbrMHl6t596eN59LxLTkkZ1eBnTwDKqCAYeyi3Num7vjfIFUonDuieX8dJCGeCn
 uX4QxN3bFcLXiqHb9TtVaSbuwIYxHABEYSzBpnhBpaQK4kjsrJL6hk7FrzUUhzVDXx2I
 pNzFmcX37rwEi/QyY6M41AIaSs48IzoWKsm4ZYI5QC1n79/ty3uayuz7rVECgbh3CrJV
 U7FVyO7B3lgJVgK+KvsyZtdauDIL5o+ISVpSKS9GkV3KNARXE6MST66K7zzBnF096HU8
 F9uUY7bW95WrGe5Li16DrknbtGxrlz84iAwl6mSl3gcbupR1abfJmBdV4yZrkY2bAau6
 RbuA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+D3KzF0zdJOhqJ4F7QGOUW35ZbJU1bQiGJsSluO46fTMugUmVsW8lcW2wUEYltItmKQAiKUnb1W4=@buildroot.org
X-Gm-Message-State: AOJu0YyzF5LbEJr8jTGdtNJH39rdCqcAfdSlOXIjuVdUKkcCrW72/8uC
 g5el9Y4c5Ueyx9f+58PKD4g+51qK2QiLo+xb4OWmvNwgFAOO1RoH9K3z8u5g3hp0a5M=
X-Gm-Gg: AZuq6aK2bA7mEC3nNcqNbsnq6JRJZcXQfTD+ZqRiDdgrA3hKztzotTExAcgAeOmjhDP
 v4jVnCIMrZNGLrIC5re7dhyGG2jLb4ttdLVqnRo+rcD3o03QqUtcKfQCQa58II3V6JhYS9N2bLn
 Fec1So5j1hNPx1OF6x164KeZT/gmbQFgZKfZJHU3HFDknZ0NHfArn8z32y2H1LGK+JIA3B4UhkO
 n6lvxUU6FAY4l8E1sQdlVng5d7JpdthpwSuO7waVTuYSmIyEQfeEBVE8JTUYAcyiZyqELC05xXw
 r5hVDdvF5kUyApv7dPlJ4GqcaraVuOvhHFZG6CtjsSPWJN+frgnBNX6c4P9KX1NTP/shF4lJrNO
 F8DGgbIJS7Qdii0iOjKkC2Vc88hR/7CKWPLjAM8HKHhXdFqYKy6TRL2M2LdU7MlSihQ8mQjQlza
 wQMl4=
X-Received: by 2002:a05:600c:3e0b:b0:47a:810f:1d06 with SMTP id
 5b1f17b1804b1-483209291eamr20736025e9.4.1770365519051; 
 Fri, 06 Feb 2026 00:11:59 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4832039d238sm23292355e9.0.2026.02.06.00.11.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:11:58 -0800 (PST)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:11:58 +0100
Message-ID: <20260206081158.32631-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124161540.2325660-1-dario.binacchi@amarulasolutions.com>
References: <20260124161540.2325660-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365519; x=1770970319; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zXsa9VcQD6tWUFdT+2RZKGWITVvzzFi+MLZsT9zYOfw=;
 b=ZBClGCpMqvUzGefxOPIv4/ari8vm02XMhEbfhEDqiiOusuiMdFfrhMtEtbS1BcqMJT
 cjTb93RagbUhQXmXcAOI4Xh/uR8VS8GkImJTH7Zwoc0hTE/TpLBeSe0Nnb6GHbGL74qC
 pZ1aHS/141u0hfZ7zlJC7Brr+cIRx+cqmCDTWKyR4NtdlY0ejU0lguhBx0u9MVOusDWE
 S/NQhdDqTzTN/o9NmOI04VAdGHrJuNbkkIEt35V6MeGzpRlV930T75wX4eP2/kMbcsZA
 Gv804ZLDIYg6rEGgGtxMvFXmD76JIcrmSEUpTokba9ocvKZl3dPHsfDmIWOQWL4Vv4+c
 9sCg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=ZBClGCpM
Subject: Re: [Buildroot] [PATCH 1/1] board/bsh/imx8mn-bsh-smm-s2: exit
 post-build.sh on error
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Add 'set -eu' to ensure that command failures or unset variables are
> properly reported to the 'make' process. This prevents silent failures
> during the image generation phase.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  board/bsh/imx8mn-bsh-smm-s2/post-build.sh | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/board/bsh/imx8mn-bsh-smm-s2/post-build.sh b/board/bsh/imx8mn-bsh-smm-s2/post-build.sh
> index 49df4cd6fb10..ede1738ecbc5 100755
> --- a/board/bsh/imx8mn-bsh-smm-s2/post-build.sh
> +++ b/board/bsh/imx8mn-bsh-smm-s2/post-build.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +set -eu
> +
>  BOARD_DIR="$(dirname $0)"
>  
>  cp ${BOARD_DIR}/nand-full.lst ${BINARIES_DIR}
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
