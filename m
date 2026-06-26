Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2001C43327
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A92B781FED;
	Fri, 26 Jun 2026 14:56:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0PRD94NkQlop; Fri, 26 Jun 2026 14:56:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30A188097B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485801;
	bh=ILNgYvL4rb9WjoGYzHpxdS0Nul/wF+c2tgMy9sSb7wI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BJwyNG4puzsXcEyf4+nJcbnDHOoVQvf3o53aIsrVUzFEijyTxjgw5tCWdYnrWP0Ha
	 qPOUmgN8PKIfE8Vhv9jscToYypWxDDwGRsytRmFdvKLwwFTwNPwOK/SDXePlizDKp3
	 qkPsOgapVLHBwICal9L4fqLkmc4pM/r7NmZlpPLldZn5OiNs5BofGb22UTqJpnP/KJ
	 qJ7VoA+EhBqL+E9au8OaQgjsOh5w66ll2JInqG8g5CDPDC9OGCePubl0WEn+M8O1/1
	 nJQxIRPJPrURsBHlqE4FZIrxbAGkgz4nfVcCbHxD+Zv2d/FKKXLYBPW7XtN9R58A3Y
	 uvUE3ft2XHLUQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30A188097B;
	Fri, 26 Jun 2026 14:56:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 29EB0231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13BFF40702
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ogJdgx2Rv2AY for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E881E4070B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E881E4070B
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E881E4070B
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:23 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-46f3ca3c598so897701f8f.3
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485782; x=1783090582;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=JFdM+4LVhP/WF94gl7KirCDoh8oul9/UKikkLDklXEk=;
 b=sxF4qu0q+bsUAK+i3qZ/uBUaclFz1B9w1c/5oT0WghI9P6RwArv5xKqTlbuB4eB9Bl
 /mEnGhZ7v18MKJIPaij8opE+0I5EF1JcduX1sTefPog6Z1rfa+6AtItQq1E+QFW9sD4w
 4HGyFgfcaGYEvfyKyXMXqdaIR6X8d4/Vu6gh6fzamas2Lq1Udjqa01gUkrU+o5ECwaPj
 35oYAVq/irJtAjH5/jhXYSLCOeLdFDEU2mv3iPYCeXdV3OHXeJ5IOzHMVdx92/qph+i9
 YxP4lS5f4WP7fCm6ZPom2nbfgY+0eoSF6OV0J6VL/+ija7/qXk+iwqCpcGcTqi9DTAOm
 JJew==
X-Forwarded-Encrypted: i=1;
 AHgh+RpazLqcFlXYM5bGPTlaPDUn97hwOIVhML8LGjvP9d8WFzNm8gBR3jodfHzxdvCXFTiZTntKZ32U0zo=@buildroot.org
X-Gm-Message-State: AOJu0Yw12bE10rDJj4BU5awahoPREtvZC35Ge7MGs8enGmmscE5Ql3aI
 N1Gb3G6pLNsf499R+wTXYvDTiVVOgiO1SyDFPk5QOYLrcEH96wr/nBcIFdaAdD+U30r6X/3C4rL
 7bn7r
X-Gm-Gg: AfdE7cmEPiR+cLzEETcRHjGEIdaAkyoZITXahBJAvXCg6w0qz7/IXWLPskHE4iR8LZ+
 yfGyLw6j7whNFO8WK/MxDxaIHfFAyZB8ZyPSJprIBEjfwFOJ+YwFS0axmZinUXEcM/VWHzEguJs
 94vtl5eBDkfTfsu7K0LuJXZEOgW8FxfA2w2fprmLusWBDtOzlWvmJoLgRBXt7y7/AshbLc/9VlA
 AhF07URxezPHWvUYFwaAPyLJD1O+Z4r0HOAmBe0xOrSCwpSDQbrvSqWs5wLm4AtjoGzBuU8BIJZ
 VEt4f4l5VtF+B6DOOLmudcSSt0ll5mXvUhQ/iSE0FXo2ZpXmNF0Z8PKtAEt1JwHChBjvVpcwdHJ
 g2J1pg/G6XmBtiRAD85LI1XFV6JSAp+6THssJrQaLZU0nkhIsGklXFewWK0DbLoSi+0sBBYTZsA
 60K1oL
X-Received: by 2002:a05:6000:24c2:b0:463:1885:6b78 with SMTP id
 ffacd0b85a97d-46dbf3038bcmr11523007f8f.5.1782485781932; 
 Fri, 26 Jun 2026 07:56:21 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c2279b7d7sm23824847f8f.31.2026.06.26.07.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:21 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:21 +0200
Message-ID: <20260626145621.344826-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-23-peter@korsgaard.com>
References: <20260618124835.2935850-23-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485782; x=1783090582; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JFdM+4LVhP/WF94gl7KirCDoh8oul9/UKikkLDklXEk=;
 b=Q4wWJGJb0JxWudTtCOx2qvTzsrjB8c2f2Acf7T4xj1VnMZ0HvmoUlr4saZRcSGFOjo
 lO/zxtuuWl+XI9QHgikCSSgFmqteCHAqqm0MiLxmnefV5odySB2DfGFHT3HAYc7S2rqZ
 UlOyZ+NItFg8GyaRn4CkEIyNILw6Z9pqDH87KZHWBkqcd0jSc9ccSDhcBsmYl11YDe6l
 ooCmUhmxXBXfbtZYi9BwQ28xgWBAKCYZtPLUdw8FdWfWqnLkP8Hc6cFftcsAvIEeHL54
 pmo9qZt1nuX7DtXnHkcv2ulY+DNgY281e0fclnh2lK+M2YNQK1nMCntl7Y9M0v11qnKw
 wSGQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Q4wWJGJb
Subject: Re: [Buildroot] [PATCH 23/29] support/testing: test_postgresql.py:
 use assertRunNotOk()
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
> Use the helper to simplify the test.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  support/testing/tests/package/test_postgresql.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_postgresql.py b/support/testing/tests/package/test_postgresql.py
> index bd41fc3f1b..08926b0ffc 100644
> --- a/support/testing/tests/package/test_postgresql.py
> +++ b/support/testing/tests/package/test_postgresql.py
> @@ -180,8 +180,7 @@ class TestPostgreSQL(infra.basetest.BRTest):
>          self.assertRunOk(cmd)
>  
>          # Check the server is no longer ready.
> -        _, exit_code = self.emulator.run("pg_isready")
> -        self.assertNotEqual(exit_code, 0)
> +        self.assertRunNotOk("pg_isready")
>  
>          # Restart the server.
>          cmd = f"su - {self.db_admin} -c 'pg_ctl start -D {self.pgdata_dir}'"
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
