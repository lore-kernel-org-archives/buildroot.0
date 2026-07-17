Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCA06C44515
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 15:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB27180C49;
	Fri, 17 Jul 2026 15:47:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xxlO-uLK9LaR; Fri, 17 Jul 2026 15:47:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D64E81177
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784303235;
	bh=UIbHyT2O7PZQs2bzEOUdO0V1+u/Pqvy5Lu9cpg2Vmlg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Lrnc+Uo0IDYOvbgdq1kiQdK7vMyM21V01sSV63BdOXdw08ESAYiiVmhjHInu6HLV/
	 Xf/DPU/jf47NK9MWyHduc+S4hgi1Xg4kb1gSYBK/8GAGSbCB/6r3PchBmlDCoJj9L4
	 +CHiPPm/bzE2cEf4Q/Kl/ulYwp770oDrCu9m29Wkgfo9It/IdYDjmeS+s4oC468mDY
	 gu4GL01q85MYWU49Qdt4Cr3zqpAznMBB4bTnVNXuqVVN3GER5Jb/6YyzwJCKj3LCNO
	 7l1neDcGN/Did130uQKqVGfFOGg77DIkbGQona/5RddrPKbX2ieJkTa40PYdpzhBAT
	 g/hHQgTEe3SCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D64E81177;
	Fri, 17 Jul 2026 15:47:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 455BC1F6
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2BB0B402EB
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZMkNtvJMv4cx for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 15:47:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E9F5E40056
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E9F5E40056
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9F5E40056
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 15:47:12 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4954c9f380bso3840935e9.0
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 08:47:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784303231; x=1784908031;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Lq3tX5LZ1QG+Q/7WP6AcoUnU0ilH1BXNTrSwkRGV6Do=;
 b=dJl3KXtRwBm9UfvMjfzxYaszzYJg7hJBHGjBIx/AQ8AsxVE/wzH36U5LYJZQGEnPqC
 7S2Ob3yWw0OcqhHsgvX9aA12hVwxVovG8kaxNfCx441W2LdoNSMeymUO0z/Q7To8wxgV
 m0dG/7CoeAk+TjfdKKHnLjkmAzzOL8oMt20KwO/zBKTiJ4BLcr9jS81F6V18OoMivbm9
 zXiPZIKexfT6dJunGxQzsJXfFvR/nY1A4AZWE5ruiz5J2kSaUPnBPfd0n82h0ubbUa1f
 iw8jYJXufIwKrJqiAZRD5GVVfCpfS0AnsY9oBQj05RuKat6XTO6qMOeCSRdNwEScGAJP
 /c+A==
X-Forwarded-Encrypted: i=1;
 AHgh+RowdhD3xeV6q8I4vRE1m118k0trcZXxh6w6yqBTq5jvjE83w4felc9qwpBufs0bgdWlR2kBJiqpU6A=@buildroot.org
X-Gm-Message-State: AOJu0YzPQoPYLudl7y8jstXbxRJyTj+Mb0LvCT+iMweuezogIjycoCfq
 rs650QCf2ieKFtDSfizFvGGWRiGSCGoJeKDkUoKYzMDm2Fy89mVLtF+XGFE0UYCj6pk=
X-Gm-Gg: AfdE7ckntO1QtL0gugFLmR3zwnwwaqGTqsK5eTudYdRDKDvn1U0jnycn/bpJCNyccR3
 q4EQWi7ifY5e2zQ/cmpYc+3Z6Sa7Xmj5hIpvJlXZeqFY95EESbxZKEJYWV9PExSndDgxl5pAwQW
 IZVNwTOeEroxokGWoSKLTzPwE51QHiKVZ/YJPI5XBH8XOwjDqobD5xPHpzsL1+l7sG51xKyUYNK
 DpbCu6BK37UgMt9vHn5f6wsGp9PZNjcAouDVVn/E6tpf4v8L0ZnrzKYXgbLdb2ZYiTf+afXxhCR
 Jv4Md9wRY+cf7E+mVioUOsTyFuYiWXxY/0Ylz99wlySPyfOVhsnrqWbRYZXwj9ieLhZrQH/nbKz
 Wu28xCAZI0xK7NqIOLH2QI5PkAX6imlmi0Izp3lmCBjYWKN5tSTOYDMihLNcWw01beSe1YUd+sI
 cWRLpdWQ==
X-Received: by 2002:a05:600c:c055:b0:493:fd5b:2d5c with SMTP id
 5b1f17b1804b1-4954a50db11mr27451635e9.22.1784303230789; 
 Fri, 17 Jul 2026 08:47:10 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49549c96f19sm65450435e9.9.2026.07.17.08.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jul 2026 08:47:09 -0700 (PDT)
To: yann.morin@orange.com
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 17 Jul 2026 17:47:09 +0200
Message-ID: <20260717154709.191435-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <8e7b71af93abe216c7715fb7394428cc6bf06aa2.1783486638.git.yann.morin@orange.com>
References: <8e7b71af93abe216c7715fb7394428cc6bf06aa2.1783486638.git.yann.morin@orange.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1784303231; x=1784908031; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Lq3tX5LZ1QG+Q/7WP6AcoUnU0ilH1BXNTrSwkRGV6Do=;
 b=aEYRU+KwPcc1mrLfTdnkhnrCFm8BhRHbWXOTuG8OIJHKlcp1CeX0MincwGLyBs2VT0
 W1Q33RkyYx8Z1QTatQvRdeioWL3Lpa05/6EVjnruWSh5icYMLN89q6voTyAjg887RfqY
 0DMjNaN7e6SaEqgk9ZNpLpan37zgH7tr9spT9ipv5v18JJopKqhROVNFnctYbGYglhFd
 yiFDa8xIGfMnUUSj9bmg9md7hQWUFDKNnY7p/4IKb/pbJrcLSXwzhGEy6LXyhTVz48k6
 xPW0Eu1FR/oEPn+nWRNSbPVoDGaJTiHM339NESNOPw4MMLTR4XDHhvIyEzV5VP4gl67H
 BYGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=aEYRU+Kw
Subject: Re: [Buildroot] [PATCH] package/mosquitto: host variant also needs
 cmake >= 4.3
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
> Commit da9dcddff15a (package/mosquitto: requires cmake >= 4.3) added
> a requirement against cmake 4.3 for the target variant, but forgot
> to add the same requirement to the host variant.
> 
> Do so, for the same reasons as reported for the target variant in
> da9dcddff15a.
> 
> Fixes: da9dcddff15af3e99cbc20297f4a3d25e89c66e1
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> Cc: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2026.05.x. Thanks

> ---
>  package/mosquitto/Config.in.host | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/mosquitto/Config.in.host b/package/mosquitto/Config.in.host
> index 39e287ee89..7b94003fae 100644
> --- a/package/mosquitto/Config.in.host
> +++ b/package/mosquitto/Config.in.host
> @@ -1,4 +1,5 @@
>  config BR2_PACKAGE_HOST_MOSQUITTO
>  	bool "host mosquitto (mosquitto_passwd)"
> +	select BR2_HOST_CMAKE_AT_LEAST_4_3
>  	help
>  	  Only installs mosquitto_passwd.
> -- 
> 2.34.1
> 
> ____________________________________________________________________________________________________________
> Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
> pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
> a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
> Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.
> 
> This message and its attachments may contain confidential or privileged information that may be protected by law;
> they should not be distributed, used or copied without authorisation.
> If you have received this email in error, please notify the sender and delete this message and its attachments.
> As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
> Thank you.
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
