Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D6EC43602
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C3A9411F5;
	Fri, 26 Jun 2026 14:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_5Do94jtipW; Fri, 26 Jun 2026 14:56:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3C9D411E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485781;
	bh=DaCPoprFnPShVVmeJS8Nw9oPabWJ8DFvq6MzqK9SsqU=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=j4BZwArDp6StBG4FY2M0VpvTA0hGa59NjujLYqcAywv5BcZMKl8j40wPrE9+ZsZ86
	 P2jY6M573/DGF/t/PuttO8Gmvq8uxNrVTBSD55mj6ixFbxpj5VwOqSToa6Fi2S5FOB
	 +EAkBQedpNwSZzJ820wLJioe4SMpLwQYiba/y+R4+kTqMmRfOw5KXkaFvv6tSWk1Tm
	 xMhCi1PXCNMcbk8yTT/RIQMrCADjBO3LT6g/Fc2GurNBjI3TS4sxHEcWgLMVAl1XEi
	 7E2QWYq4pNdFeYHpxSfim7BiKjrjxqI8Z37yuF8qKRmuxtVx989DBkk1jMwnFstIlx
	 LTZ9UYfFXqfMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F3C9D411E5;
	Fri, 26 Jun 2026 14:56:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CD433A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B150823AA
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K8Fm0rKrchZc for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9E17D82361
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E17D82361
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E17D82361
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:10 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-46cdcec58c2so1155734f8f.1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485768; x=1783090568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jgwlJ1kRos/JH/6lFRVemFGbSPT7WPt80nAirEz7gPA=;
 b=FM8WOAqPtP2z4ODqAVPEhWg43WMGMcpNK3SZAtkJ0abRG90RbLRO9CzFcXpr1DC5F/
 uoIeLIuhhMwSfLpolZX3dP0XRI/f98bRGLQbGKml3ShgP3fpjvZ7qJ5CPuD1jRuqxX6H
 hjbCJt8UAc3dDty66ANUJhUzFulJ7YoBxU5V8SEB4JZnFc49R0iR5kQ9LuAXeaezY1RY
 XLD4RvUD4/zXAMSnogTPGL2XofJXbNwJO8gVvFylWEHF0pZDCtZX0V0DElQjI3Snl6r6
 9dwRtyff3mb2EdACUPALtyI2du72u7g1Lvji8/wJzmfKnAZkjJAIGy3uiOa8NmqurF1T
 CbEA==
X-Forwarded-Encrypted: i=1;
 AFNElJ+rORo+StYl9YvNSFFch4tYat+LGfGEXGcCyRHqh8F2AvwpMpPnvkfwTGDk/cZiZqJ6jlu1+1yqsqE=@buildroot.org
X-Gm-Message-State: AOJu0YyQIQOaphbaXbJz9IjDUW+Nwuu5vIRE3ia2/5dXLxH9gaMQyeGC
 51VUkV50UAKA0HuMLzXMCYkyhU5grCJrjRotlURGQzUkXjkZgcxWWVkoeoVDuaU2h44=
X-Gm-Gg: AfdE7cnQmPdqyaRlh9BET3ECR8G+7+pGfbP657v6k3YfjcwzR1hlAZRyMU7KE5xLP30
 M1kGTluPiFc8ncTdExo6/RY/86z9qy/DZKL7fIOfgnKc46a0G7DbUwKkKLipLDp+MGmDnRHilUd
 nlpJDv82cFB2V2X67kirgmg1xn6HJOBlL56It40yfHC/1pnxRt8bs+Zda5xb3263rpYrkR8ROgH
 Ozk0lH+D2VyAHO8fiV8tK+mzKIZKsHV4VFlgDnCZCAj0Rfx+4Ej3ShdJspI10Wvo6TnFMJkXeXe
 BNkZEvY5Ee28h4fkToKnFwvmUtoQYV0EBHChRwGBEpfwUK5Ve6NXjWHS31DBFz/uTcfBCeom5pF
 zKELaMy0DjTCGrAhiY2r9J69ehsNXvxC8Finei9Sx3ZHv5XS7tFsbRaJIZWtS6/cIPDkuxf/aXj
 0OWsw2
X-Received: by 2002:a05:600c:3e1a:b0:492:70c9:c50d with SMTP id
 5b1f17b1804b1-49270c9c64fmr1180185e9.9.1782485768548; 
 Fri, 26 Jun 2026 07:56:08 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268fd9e77sm79359035e9.4.2026.06.26.07.56.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:08 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:07 +0200
Message-ID: <20260626145607.343975-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-5-peter@korsgaard.com>
References: <20260618124835.2935850-5-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485768; x=1783090568; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jgwlJ1kRos/JH/6lFRVemFGbSPT7WPt80nAirEz7gPA=;
 b=eWfPWKYSEyt3P7uMWLrnGIAVDbnzlxoOfblGk9jgWuHl++QGpeTs+FVlZlYMpIk6SW
 0VbgYINNgmDk9yxoszcRiZgGA0I7ftq6PwtMn6ycZw0H+bL3hR6mLXMpedYzYX02zv8W
 lvonrcniAxUgvKYi90GER4U953bIPkUcPxt2qjw9NXFvWTmTZGygM3rJrSBKYsd3gTD0
 6PlyY28l/A4Xq+aJdev3rAGKtRhCGs4SOMBgWgJUmIObV0IRhILlzRsnUIJz52Lr5f+0
 ZhJVHwSB2aKDxV53k1UJ+56RuQPduqn/ApgUrduX/oYnFc2whDtla+BnHAjIrmJT83IA
 jBHQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eWfPWKYS
Subject: Re: [Buildroot] [PATCH 05/29] support/testing: test_bitcoin.py: use
 assertRunNotOk()
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
>  support/testing/tests/package/test_bitcoin.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_bitcoin.py b/support/testing/tests/package/test_bitcoin.py
> index 186240b280..9a7d78e5e8 100644
> --- a/support/testing/tests/package/test_bitcoin.py
> +++ b/support/testing/tests/package/test_bitcoin.py
> @@ -108,8 +108,7 @@ class TestBitcoin(infra.basetest.BRTest):
>          # The bitcoin daemon is not started. A client ping is expected
>          # to fail.
>          ping_cmd = f"{self.cli_cmd} ping"
> -        _, ret = self.emulator.run(ping_cmd)
> -        self.assertNotEqual(ret, 0)
> +        self.assertRunNotOk(ping_cmd)
>  
>          # Start the daemon.
>          cmd = f"bitcoind -regtest -daemonwait -fallbackfee={btc_fee:f}"
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
