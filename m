Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C0F81090220
	for <buildroot@archiver.kernel.org>; Thu, 19 Mar 2026 13:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42553841E5;
	Thu, 19 Mar 2026 13:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QqDuNuPcvIaK; Thu, 19 Mar 2026 13:05:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5AAB4841E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773925507;
	bh=l//O+5oyfrSmfGFZb57O5QFi3eSQtSiCESdWh+/pldg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EswbKbNCj/0pp5APyiYitwbi5w3dymMNdcSwK7waML658CtzTPh3NPVT116GzMewU
	 FKEJBOs7R8RGylOp2wWtFpyXTdxuD05rzSlvOsXSPSWZskNN3E4kYThA7IS4duJG4K
	 EPH6fo1PiWGYRrZNllKSndgGDvufabtcq/AdlCZZNSrZubIdG8dNKPlfabsAwDwvrr
	 jqpyjN7/6+7UlOHwrnE+bLNNngi9zRX+rqDWCqfgejc4rC6XXI6+0h5peQ2oah9oIF
	 MwqeJWchj7wdT8pCnyYBJNvewC15LJltQiq5hMX5lZycFbIEfJ62VTajwl6HWv7dQY
	 HpXI/FYEv6u2Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5AAB4841E7;
	Thu, 19 Mar 2026 13:05:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BAB11AD
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 13:05:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7D5FA40FC9
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 13:05:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2DwUlEmYMqde for <buildroot@buildroot.org>;
 Thu, 19 Mar 2026 13:05:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7C93140F8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C93140F8F
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7C93140F8F
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 13:05:04 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4852f8ac7e9so6885225e9.1
 for <buildroot@buildroot.org>; Thu, 19 Mar 2026 06:05:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773925502; x=1774530302;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=gXnXpabrf/cQNYufAq8zrN7LPxLC047Tblr5C3YxH1Y=;
 b=eiCunCq7Ry1FbfgGDH14yYnZmfnQgN4qpg5YIhpcxbbp6Zx4hgRZZQd00wdVm3gBvE
 wf/01Bk3P+oMfkbX0Dqy45bjHc0STtVIPlvnSayClDjFW72SVfM8YXZCypMVeleEh3yx
 7JdRxfr7T6jW4sFImGewMAv4uxD8KLCJKpfyRNDpN5q6KeliO2FCKVM2Zzsob46RqD46
 hADPGqFNAPaujEK3TrSH2LfAbue1g5cvSsVvEFwdMJmUXLZMHN8KqWRgWECy6xR6Yyff
 lyek0PlnQshaisGRC92GKo+7YHQKMsKn3AluUv5IFOzPqH2RwN/QRolZcsV/x4Vzj+PH
 eZBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRrmuORMEoRJrXtuAnnV0bTBTPgUjblq37aHPPXzGGZBv8EbYK+uPtGhhuFCPC8/op5193XdeZucM=@buildroot.org
X-Gm-Message-State: AOJu0YwwGbTpWl58ehFIwsqxtHipB9nr4fND7du7tfWg24PVznfL6AB2
 DDfUGULs9p9AVy93w/WUrQbrVUsHla8XPNGyBGbD3jbEixhkPDjd9QfaP4siK02RoLaklN77bgW
 kLAWQb+s=
X-Gm-Gg: ATEYQzzgWnNntm2AUqFUbYXY3h9rZqpmYbNKK52ScNC4eWRu8jx+a647LGNIgDpODwx
 BQ+8nSleifEvmfthmO0Bq91nwkSZi1tTxmIq8BdQOOK435QdkM1ISaq5wr5Zwm7FkHyrgzxW7Qv
 KlToEuFSZl6I5U1Lrk4u9I0xw5pZRg8IytGdNqVzAHZ7G2FujkanDXP8v6yWvc2PRqernEXmGhY
 7S0h3SwN0O1nE98l75X7/jsg0nPeqAMfV5q/dugsBKUXM3KkOFPWH4Lz9kvUJ7ZFUha2lbdQ54B
 tFB4jSo0A0eHh4v67goQJreeFApUcPq97D/wnoa0/8XiNuKG14+0FuLBUSiCVt8fvmGK+CV5TOS
 n0gqf8BiiIi20UFxYnRTo2FmlmmZZokI/z0pZIi7PzWnrEEKInFBAvzEpbmpogmnfWJ5oB0UNCt
 jny3tUQA0IExytLro=
X-Received: by 2002:a05:600c:8b09:b0:485:3a27:a960 with SMTP id
 5b1f17b1804b1-486f420c141mr128640935e9.0.1773925502020; 
 Thu, 19 Mar 2026 06:05:02 -0700 (PDT)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-486f8b322d9sm60991465e9.8.2026.03.19.06.05.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Mar 2026 06:05:01 -0700 (PDT)
To: Martin Willi <martin@strongswan.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 19 Mar 2026 14:05:00 +0100
Message-ID: <20260319130500.121171-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305115752.1861153-3-martin@strongswan.org>
References: <20260305115752.1861153-3-martin@strongswan.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1773925502; x=1774530302; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gXnXpabrf/cQNYufAq8zrN7LPxLC047Tblr5C3YxH1Y=;
 b=Uuj5UunTJtCUrhUwvqdVZbuh0YkflEK8Twt2DmiWyUg/NFgeQ1Pa6vN9EBxnppe92N
 GXcwU4gzRvo2KAG8VdbqKSw6tlvtzlN4QeDih9H35KUSEMpHoNuUwaEkRY1YKEi0HfgT
 Qa2Q//FpdTutrWw/lSxLp2pu8v4VOr2RN27g6phGKso4+w4Cjr2uFqqEMdL/eEGpXcgU
 BIk9Tff2E4b7Yu0+vCirDHmHCzi04GHR0oTGwlD/oZEo3Lj2fLIKeB+fmAXZ2ZCcX511
 JGnDuminoriYu4HdTzVtezo6Qnk6C2XojCuB1vyaK3n4xgxlRg5fY3uYWsT1J+HC/7/X
 bxug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Uuj5UunT
Subject: Re: [Buildroot] [PATCH v2 2/8] utils/generate-cyclonedx: add
 build-phase lifecycle entry to SBOM
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

Hi Martin,

In reply of:
> Generating an SBOM from Buildroot usually means it is produced during the build
> phase. Hard-code the lifecycle phase to "build" to reflect this.

I intentionally left this property out because I think it makes assumption on
how people are using the SBOM that might be not correct for their case.

While most people are probably generating the SBOM after the build indeed,
personnally I generate the SBOM in the pre-build phase.

I don't know what's better, not having this information or adding information
that might be false ?

PERALE Thomas

> Signed-off-by: Martin Willi <martin@strongswan.org>

> ---
>  support/testing/tests/utils/test_generate_cyclonedx.py | 2 ++
>  utils/generate-cyclonedx                               | 5 +++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
> index 2d03e650fed5..b9f375364da1 100644
> --- a/support/testing/tests/utils/test_generate_cyclonedx.py
> +++ b/support/testing/tests/utils/test_generate_cyclonedx.py
> @@ -109,6 +109,8 @@ class TestGenerateCycloneDX(unittest.TestCase):
>          metadata = result["metadata"]
>          timestamp = datetime.fromisoformat(metadata["timestamp"])
>          self.assertEqual(timestamp.tzinfo, timezone.utc)
> +        self.assertIn("lifecycles", metadata)
> +        self.assertEqual(metadata["lifecycles"][0]["phase"], "build")
>  
>          self.assertEqual(len(result["components"]), 4)
>          self.assertIn("vulnerabilities", result)
> diff --git a/utils/generate-cyclonedx b/utils/generate-cyclonedx
> index 459f1ea5d121..7d9f951ac8a9 100755
> --- a/utils/generate-cyclonedx
> +++ b/utils/generate-cyclonedx
> @@ -517,6 +517,11 @@ def main():
>                  "version": args.project_version,
>                  "type": "firmware",
>              },
> +            "lifecycles": [
> +                {
> +                    "phase": "build",
> +                }
> +            ],
>              "tools": {
>                  "components": [
>                      {
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
