Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2350CCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:02:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9720B40A3F;
	Fri, 16 Oct 2026 15:02:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EgMwkOvfKfBt; Fri, 16 Oct 2026 15:02:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B4C1F40A7F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162957;
	b=PqgkY9ukI8Eg99revfKZ5OjvsdvibQkH6hkpYz1zPFYt4eAR33NYngAfI0PgbYbpHqyt
	 WgdnTd/mo+NeiRODXmwuNB2s9chzyEewductIZHUU2ceuLy0hRN06WdtEblAh+j/wgW6C
	 bSYEkAaknocBRgGH9wsEOfH9An/FoEqXz1DvdGTnRaZAR1gnfiWPaPXW65b6P20QxBOQn
	 vwsX8pNHu2TF/WLKMnTYBxuQCcFMSQvEbTSBu759Q3alAGYvM1RstLBBJQMkT15AfI3s3
	 GmczlaeLZAs3DRDSQHVuO4YWcgyFFxaMbBMs8k60oFcx/F9jOHCh7dxHrFwAEHuZXqQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162957;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ia66UkUyBXyeD/hDPuLpWff0igsyHzXW0LFoJ6l/mGI=;
	b=J4MSQjWQZuEDSOkKdPG2BWCNE/JHCLTq4addhIEVc7e+PH1CmNwEjxvzvGebmRvlTxdc
	 i+mhKP74eNw7C9gnQS7+9YM50MhZKPSPJpDuDeVkd8dDelLIM/HUeNfgoNkIlxU6PuuUd
	 oRauq7+fjgv/04ICIL1ikXn5PvaHdfkybAHLr8HwSPcWkceaZfWwCONacUJBFiA90SzQh
	 gYyWoUgoaoIg0MKVJ0Aec6Yku71N3OvrdNy/FlQWuU2uD4aNpEDFrM26xmxrms2fy3/Pg
	 OakeHjgRxLrbzNz9z5cSM9vt/vQieOT4Xa0J6VESmBG6AO7QWJ4JMjGsRz5bexAFCLg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162957;
	bh=Ia66UkUyBXyeD/hDPuLpWff0igsyHzXW0LFoJ6l/mGI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dr4z3bv6Yto42cjWxeYWp1TLLW7+P6YCwlW/VYVcMZgHkj2gNsInGN1UKz5WIY3QQ
	 l3Qqf+RH+ob2MiioZBgYWXBm44RYXoJTXwHfSAMfheMbwIiSzm1q2DbVgneYWOLvgu
	 o3jVvFlGfM5kkgXZTnqZTmEosRk5YAMEBIUBduSobMsD+YHOus4Ca04r8c84ojDMKk
	 ZIMcfnciavMjeOMDrw+/MxjoH5xF15i6xOQKYaHES1BnMvJVjV5DYyfePzZJBcKCpl
	 jav4ozWqb1e9NwR2aJVwUh9fMl1VIcIN8HM637peshAvdHN/ysoA5p0RyaX8ZlRT93
	 ivUqEqg9+Jj5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4C1F40A7F;
	Fri, 16 Oct 2026 15:02:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 22E327AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20A5D8156B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I00mP5vtolg9 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:02:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org EE95081549
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162955;
 b=NvkJLewSxsWPSoSg4sJSXQKR+lRiCok5NUeZ1eX0WpVAuJGULOMzeyw6rWvlBhE+VIHe
 Uin3cZeET4dqoc3Zg2OMMF/5HTHVIAENBWxeU8vA3Yv9ZRGZAFHFAiLwwYJ7cPfngh6ZR
 o6RZersFlkQIJV4Jdt5sbuILF++emLoxi5osWV4gA3SKfsb1c3Gfw/jr9ufqYIGPp5S8X
 Cr2+49Zf8CdIYE9uhBcQm0B1YaIJYPFLBzSf/ohJrz56jULd4eOOAY5+nXixMJktfuTMB
 rPdpjQ746DOXAs8NmbMnngdHFqeFRkXwd5t6LhaDObfL+2uogqM669mqGk+qLjcypPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162955;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=4qeoryHVtcXES+9GULg7CJU1WGfLtUIVeup49Yotfg0=;
 b=hORl2RPlgCzXe9zgm/7V4Ay6YbhHOqB7ebC5umJSyTW/F1s4j8jfA+6hZ0C7Tnsm2JPd
 84wv97U5nyye8klNq9RAvuhwhwW0q4GSWDrVnVpMNmVpQe3kTdVfgvLfhaXbb5sRGbFSd
 k9XfPsZLZNG4SrKpTWCMyXZ014x4ctTxNyJrb3Cd+48kvptqoqK12NbJ9BjvCyDc0ChQS
 9fgWavfZgI2wRLM5TtmaBC1MetxDOK7ZsJfVr+MF0Kjjj+KhwDhcCSPd41dsCfLdr5PZG
 q5nm1kYpKGbVWGWjUbapUig/pU6oxMdnqVNe16otwbjopDFSxJQ+coihhEHpgKbCGew==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=GQgwU9Dj; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::330"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE95081549
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:34 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4a02718da81so439715e9.1
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162953; x=1792767753;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4qeoryHVtcXES+9GULg7CJU1WGfLtUIVeup49Yotfg0=;
 b=rFsoOuCNTEzoHDTQDkwPiIItEAPNl1GSmzsd389coxSAkhvtM33ItlEYGY5ZQytRrm
 L1JVWwG+MYfmgX5zlA3tgRGAl12wOVV0B+GDx+XDYs/BM0KCmfEuBlxPKhhJmQd+RAKt
 NSDMNE6unBmFG6AlfcnF+cUxKv78BHtS/LYgGG1zF2elpdUc10CibOZLqX/QjSpAXRB1
 bRI2kDwjEkQznL1gObsOLW15mUmHMbIG0ZntAMn5y85LDb+lnk7RE+5Eubr4wFLkWJqA
 XE8ZB1StUuhRH5lylZi2atN82EdLcRMA3yoxrBkNoTTp1wBI6Ex5JedQBp2eUClz9fwZ
 aqTQ==
X-Gm-Message-State: AFq9FYKIPikKCp1FWmuYMvSLScxaSNwVxGqxSunw1EIZhN7oouF72bjD
 X86chtf30NIiOeLuPapcNA7EXtIyDgy/605J8nE3YVQNkrIFHMMD1Zy7DRuBIkvsF27hlhhUsgy
 hk5ckCXc=
X-Gm-Gg: AYBFou3EiwSZyVK2zQW389bpnv2n41x2QiIg/oGUlvM66DQx5Gy8SsJPTU+IeHNZijF
 pp6m9HA4yhBqRk0BgSo4QQKQFMhzxh/kGW8rTIS2pHAcKXKR7XZTB+rpkpi/V2V1EGeOKUjVO6u
 kwZMK5bGS41l+r0EyQyO6G/izWjwHwL6sSM5pHSMU08mJckVqMTbD9k7dV0dfoqt0RGEgBRnKMb
 YV6tIxRM6w8M0FvzRuh3pRQ7TMBaA+Mee8W0MqTRRiZRK1EVEXUXwtT6rdt/oDSF0Xu2xCFeAx9
 7z4K+os5vBLkWotU7ZmHCsd5wPFCrMzpNcqMtchtTUjK2KfRcXWZuQ9uOW215o5RKdIRBaCvuBr
 dflW5aVsb5Tz23MehhObVUne57/93HnBQ6hkFbLxXIFQiKrWNhBXUJnfa6Nz+IK6gWS2zEJtXL8
 LQo/7Fe9WgFfST5WUMezp+tG9VuAJzl6EkeGx1pZnzLLNydu1MUvkp9VjRtNGwiFZHm8+/g+Nmr
 Gdra0dV0IufIqKl7uU418C0zfBNz6oJS/kMI5O8aw==
X-Received: by 2002:a05:600c:4e94:b0:4a0:159b:d283 with SMTP id
 5b1f17b1804b1-4a1d7626630mr1185915e9.30.1792162952863; 
 Fri, 16 Oct 2026 08:02:32 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48dfd4e7ff1sm5988180f8f.25.2026.10.16.08.02.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:02:32 -0700 (PDT)
To: buildroot@buildroot.org,
	Thomas Perale <thomas.perale@mind.be>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:02:29 +0200
Message-ID: <20261016150231.60584-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624101340.80670-1-thomas.perale@mind.be>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/9]
 testing/tests/utils/test_generate_cyclonedx.py: test scp-style git sites
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The commit [1] fixed a formatting bug with the SCP style git sites
> declaration.
> 
> Add this style of link to the test case to keep a track of it.
> 
> [1] ebcfdb8b0a utils/generate-cyclonedx: fixup scp-style git sites
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  support/testing/tests/utils/test_generate_cyclonedx.py | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/support/testing/tests/utils/test_generate_cyclonedx.py b/support/testing/tests/utils/test_generate_cyclonedx.py
> index e6640fbd0d..b91add2349 100644
> --- a/support/testing/tests/utils/test_generate_cyclonedx.py
> +++ b/support/testing/tests/utils/test_generate_cyclonedx.py
> @@ -149,6 +149,7 @@ class TestGenerateCycloneDX(unittest.TestCase):
>                  "uris": [
>                      "git+git://git.example.org/foo",
>                      "svn+https://svn.example.org/foo",
> +                    "git+git@example.org:project/foo.git",
>                      "https+https://sources.buildroot.net/foo",
>                      "http|https+https://mirror.example.org/foo",
>                  ],
> @@ -172,6 +173,11 @@ class TestGenerateCycloneDX(unittest.TestCase):
>                      "url": "https://svn.example.org/foo",
>                      "comment": "svn repository",
>                  },
> +                {
> +                    "type": "vcs",
> +                    "url": "ssh://git@example.org/project/foo.git",
> +                    "comment": "git repository",
> +                },
>                  {
>                      "type": "source-distribution",
>                      "url": "https://mirror.example.org/foo/foo-1.2.tar.gz",
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
