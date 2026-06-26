Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A09D3C43211
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BF3E8254A;
	Fri, 26 Jun 2026 14:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tu6HnnF2Vt5S; Fri, 26 Jun 2026 14:56:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3DBE824F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485789;
	bh=xfPzNfQ8SnmbA6BiGhkeP7Ic2JxDSGGX0OHPx4tIOsk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=eVDHlvy9NxtKp5E3C2v1o/wEFGThlOvi4+qxqICblbmRka62exmma6DWgOZd/oZLG
	 kBzTL/DgA3kv6G8uJiJMu4tep9AWiSnJ0Kwg61asdHA4fAkS4o57St3gT4I0NKr/tu
	 /uA/IAiYvZ9ysx0s10VvwXM3RxxCX5E8LONN/2tykMXolhnm8kxtBlUuFubiVrVSBY
	 VPBwpjgL6NVEj81SLn6RseWVUeigbTAy9JA0MviPzEOXMEoh+v6WxMrfLub9edZE6E
	 6je9DbquLTknl7cciUduo34zglMKCtlep+BVP6gVnF8Yc4XgquR6g/XxEJYr13kWna
	 zCNZFW4x5KZrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3DBE824F4;
	Fri, 26 Jun 2026 14:56:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1620B3A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07CB082435
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yhlpDXfyqhHK for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DF776823C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF776823C6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DF776823C6
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:14 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-490b7866869so9139355e9.2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485773; x=1783090573;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=+8uhUOAQEDFRPC1AEsdojjT5jALLfF2d/22kN0xlJCY=;
 b=oqCSIpHwwHVDXghNSG9SHDlQmPCT7VXy7JLwtHjEil8NyTsmRWirzhwcMxXGhhIYmM
 6MW0W/6ZZJYf2NboZ3c+JFCYK32XVys5KBMhQty/NdN8C9x3gh3QuzwnNQu5CPKv44lp
 ffo+m00ME/ZBCSC1xYsTEiiTM42LWl2tinDIe1/xZoPxxUFkfS+x9EPGlu6MYDTccnqg
 ze1P5zh0DQ1JgHOSmJHYYlvOoafaF+IhpUuVISG4kOnA7uMyN/kbumCD5+wMhM6RRMM+
 hvP42HS2NYOc0hvH9Q6dvlRC8iysp5S07N4JKvPmRHCk4fQpNfhckSSmUQZIIGa1KAQg
 yeuw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/VVhQdeDACK5TX9AkCsEooxhYYbec0PxDQr/o8xHqy/JCv24IrBCCWrKz4ukF90lyBHCI1K6EPXQM=@buildroot.org
X-Gm-Message-State: AOJu0Yzsk3jOoANATtjQobnucnCx8/E9dA9X7cCROmFuDJpV2o1KWE9q
 ivANWHd4/KqKTBDlDxdZTJiRFc2S134YjxGfD36eGMpdqjr8i+X9agoNSDHCfEqqnh6uknZL2Te
 j+HAy
X-Gm-Gg: AfdE7cke/SK38y2G/BsoKAqWAw+Z8HpnMGS2YkWBdBflGGrNpWnr4H1R7k/jGj0LjRu
 ddUomhc4kAeDg+xjlifj/8B1yR4Wukcge1VBkjK8ZZYTBnx1dELoSeai+WxRlrps3TDDkg8vS9F
 qUBZU94Z36e8IsL7eJ8/aPvICLftvJrlCUTlhtUI+EsOQKKpYkAtqFLX1IPFchh4wX71u+W0inQ
 kgAmjgavwy6Try6h++7QcgMyKL3IvAa/4jlN3f1IEEVdG4UrCgoNtWRl3/S60IcGqQHCkV1bIK6
 GxU1cAx+U+khLHibDn0FSEtIt3P791IMw+idJ8V579UZP06P5h/35poGv8HWr+f5OQkG09o+roI
 m0Hmp06DMSqZ4fxbtpjt9CFn7zPzvVbnjVBfpUeFGuuaCd5X4cpm9L6El7AOZFvcLJeCb5evGCH
 NxgK26
X-Received: by 2002:a05:600c:4e54:b0:492:523f:a3df with SMTP id
 5b1f17b1804b1-4926685fccfmr107418365e9.5.1782485773010; 
 Fri, 26 Jun 2026 07:56:13 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49268fce5a8sm82584415e9.3.2026.06.26.07.56.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:12 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:12 +0200
Message-ID: <20260626145612.344249-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-10-peter@korsgaard.com>
References: <20260618124835.2935850-10-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485773; x=1783090573; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+8uhUOAQEDFRPC1AEsdojjT5jALLfF2d/22kN0xlJCY=;
 b=FbuGdgupLkujx36BJYqDE3XCGUwDvLv55rIDh1XcMZNurSQj2yWLQq2SuRlfne8nta
 2IDrDtV6vHP2rVrpBDQygGdCG8+PhSBfAn6ai0ypbwjljfTd8BJS84EFsosidB+1u5Jw
 my/m+b0DArpz+IB8dGUeqiPypEWVuUOKLKxeWYHgxJBrxUqQVtba/QCya1NzuitZQM5t
 BQqFogvW11vg08JqLU/5ApxS+ny5943CDJektS6aDQ+MskqDaST+acOqWwfItDXpGnZm
 q9PWOOmP0B+FAp8/09aFPXL2qL9J+fI0Q3T+NbCW+o7mDjf2sd3jbV/VrKO+/9i7KM4x
 1PyQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FbuGdgup
Subject: Re: [Buildroot] [PATCH 10/29] support/testing: test_fping.py: use
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
>  support/testing/tests/package/test_fping.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_fping.py b/support/testing/tests/package/test_fping.py
> index 507c4ce73b..e8aba653f1 100644
> --- a/support/testing/tests/package/test_fping.py
> +++ b/support/testing/tests/package/test_fping.py
> @@ -41,5 +41,4 @@ class TestFping(infra.basetest.BRTest):
>          self.assertRunOk("ip route add to prohibit 192.168.12.0/24")
>  
>          # We expect fping to fail when pinging the prohibited network.
> -        _, ret = self.emulator.run("fping 192.168.12.34")
> -        self.assertNotEqual(ret, 0)
> +        self.assertRunNotOk("fping 192.168.12.34")
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
