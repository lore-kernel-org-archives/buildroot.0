Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C773C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2226A61551;
	Fri,  3 Jul 2026 14:33:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0lTe_lRZXBz1; Fri,  3 Jul 2026 14:33:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C1D861543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783089220;
	bh=Ms875mWlSeAo1LsrrcxSDr9RBqz4F1owbCQjs1rbaaI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=LmWH+HoQzMq8retCwhUH2S2Twqz6iBXS+N1bPe3VvXFXJgoSNfIZj8D+PjA3QrLYb
	 L52K4yjB96OoMpOGzdenMl5wps5NGlFFQL/3Xcog53VUTMxDysz+06c1/ORa/t35D7
	 CPsKCCAQbpm9UM0ARxwLzox6DiMFVVa1fZB4kYyYOSCyPJCoK4cZSMDCJFyTPcuByq
	 HmP2nk4dON/Lgh8cZKYfs1ZQ+NY+udEjUdFQ3bmf2Lr3hlazV3Tq3YVaKN4tBV/SoC
	 kTxk7USKWaoKUx2tnuYLFwqYUGruQNleF4sm6iQFioWG3mmDNMzjQJ8K9js5ZSOpZG
	 5rlSXhTN8O37Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C1D861543;
	Fri,  3 Jul 2026 14:33:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 12DF5363
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04FD7413BB
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G0bKsQtvcUvv for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:33:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2623F413A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2623F413A9
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2623F413A9
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:33:36 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-493be1b9564so4539335e9.2
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 07:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783089215; x=1783694015;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Xf2BJgFymH5qQ70PEyrspL9RnvohQsM9ZJcOcdBsWHY=;
 b=M19XG8DyyI35sHZ4jS1NU8ciXzH/OTHi9omVRTgNgyhEQw7m0ZTE5v6d7a4CbMMoSa
 qU4zHGmBzkD37oNt8d3XckNwA8GI8kc2XFg4Rm8WDKb6ZXNunkGSvcnbQ9xPfmGjUk41
 x4oriJCOVJvTNBqwSaHCFG9b+DUXcJ8Ps+Iko/Jrp05OQXLF3durpCt7E++OzeeGfM5k
 NF+gMatDx8V/7g436CaeeUk7gdY7G+CDF489WzMr0t3nbLUoctbDokr/M3NApArbHoLr
 NynHWzqxm4odm+AfAhFeO7CcE1HI9AhWGtoKMIusvilg2Qo2T2KOJC+32Sfn0o4R4l49
 qm3w==
X-Forwarded-Encrypted: i=1;
 AFNElJ8WRdoRWLILSu3JEL1s2kGvtmCKPWNt5A4j1p+JV2QH/TECNWBv/90TMSBR0uA1Fgv9vNSc1Xhr8wg=@buildroot.org
X-Gm-Message-State: AOJu0YzZzpmJ7q2iAwN+QX1aVNB5h4EGMF+iLtCBTuSQwu5K1VKjmS4H
 wR6FsMYPrliXPmuKmxPo4vZ3k6NoTdQ1hxQu2hzeg2zdZMaQPQd+UOosPlVpLZaYbxINZ9w033y
 ABq+b
X-Gm-Gg: AfdE7ckS+6+lFuNrlr3Kl6oHz6+4Z4tVpSh1r9oI+MNqbOwYT/vkedRhm892rWYD3EJ
 XcnCa546CM+C6a3L28DD/Ru2PrwuFiMcntYFlw0kwJeLZKBVzAos3Xum2wXdanfl+x1cQn/NXNR
 HZUoEJiefGjDwSvB2Pah/l/R0ZOsOqA4C9YlMLYIe4/03a+pUSj6ycr0BHxEK3stcwNOIuVuOQc
 0xLRJNXa4yG2EUTsn6NfHKvsD8X424McJOTeq2AnaQ0j/A+hyydemfrK9WwIR+lckkk7npaaAHT
 PZbK/J75IlmDxYk+yZOMe4Wul0WL6GB8s+DyKojCniFjGpP2dAs4C1pUwkJHR9yNqv/31/nd2OS
 iBboUOniv+MKkRQ+2KjL+c97mRwOJDaW0B3UHYx85m9Xx3Jd1xHUAiw/4zAn5tT8wfpqhf4s1br
 pHQUte
X-Received: by 2002:a05:600c:4f81:b0:493:b2c1:b2f8 with SMTP id
 5b1f17b1804b1-493d0f08a00mr1619185e9.4.1783089215003; 
 Fri, 03 Jul 2026 07:33:35 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493ccdb62d3sm62097475e9.8.2026.07.03.07.33.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 07:33:33 -0700 (PDT)
To: Romain Naour <romain.naour@smile.fr>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Jul 2026 16:33:33 +0200
Message-ID: <20260703143333.276056-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260624125154.1869177-2-romain.naour@smile.fr>
References: <20260624125154.1869177-2-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783089215; x=1783694015; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Xf2BJgFymH5qQ70PEyrspL9RnvohQsM9ZJcOcdBsWHY=;
 b=Mb4j44qpxYrhCV18LeAbCYDTq5hb5UF+HnQh08GPfLdQ+dMidKakp7bxxXPr8LOUCW
 +tuYkF+FDNfyML8sta7bM9RXJLm5RpUzMj7H+k/ujMetz6c1vJ9QAQXuIMvROrJ/iea8
 WmnFd/4/TJWmTyBiU1vUgo/uSF9K3tEdBfOT37Q4R9XljFi84HXRcSZ9zUFlkLxwJ15U
 0MUCehRTzKVnDAbZINLJ5t+dClVXr+U40QBfQB3KNis8HI5S83vnkn4QvTUKgmggvWy+
 9XiN902jSy72sDK7O3KScrV03WSo2xEPlDx5yOJFqGDc9JnaLc3RIqhSuc6Lr1cA62O6
 8Hmg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Mb4j44qp
Subject: Re: [Buildroot] [PATCHv2 2/3] support/testing: TestIptables: check
 for netfilter legacy tables enabled
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
> TestIptables expect netfilter legacy tables enabled in the kernel.
> 
> Make sure we use iptables-legacy:
> 
>   iptables --version
>   iptables v1.8.11 (legacy)
> 
> The test would fail if nftables compat (iptables-nft) is enabled.
> 
>   iptables --version
>   iptables v1.8.11 (nf_tables)
> 
> Add the following configuration fragment to enable iptables-nft:
> 
>   BR2_PACKAGE_IPTABLES_NFTABLES=y
>   BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT=y
> 
> Acked-by: Fiona Klute <fiona.klute@gmx.de>
> Tested-by: Fiona Klute <fiona.klute@gmx.de>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to 2026.05.x. Thanks

> ---
> TestIptables should be extended to test with iptables-nft by adding
> a new TestIptablesNftables test case.
> ---
>  support/testing/tests/package/test_iptables.py | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/test_iptables.py b/support/testing/tests/package/test_iptables.py
> index 72f2dd71a4..eeb4ccb5dd 100644
> --- a/support/testing/tests/package/test_iptables.py
> +++ b/support/testing/tests/package/test_iptables.py
> @@ -38,7 +38,10 @@ class TestIptables(infra.basetest.BRTest):
>          self.emulator.login()
>  
>          # We check the program can execute.
> -        self.assertRunOk("iptables --version")
> +        cmd = "iptables --version"
> +        output, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +        self.assertTrue(output[0].endswith("(legacy)"))
>  
>          # We delete all rules in all chains. We also set default
>          # policies to ACCEPT for INPUT and OUTPUT chains. This should
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
