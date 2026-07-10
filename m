Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BB5C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:52:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A31D40C6C;
	Fri, 10 Jul 2026 13:52:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mz2OQuwYkQYO; Fri, 10 Jul 2026 13:52:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5177840CCF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691521;
	bh=qiXJi8bymycOMMwPYZXQiQYQAdpy9iRbfmmWLTkiCwE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BaKWHnEhOEsE4Tsq0+gkxSC8FcYItIgZq/8QmxXPky18m5jfXOPajzAR8SP9W72U7
	 Is3V3OoWATJrkF1IwUBqCVRSKs+7Ris/tbZXDi7qNYRyfC4uNIZk0FFve0O3s1Ny/z
	 mG5dWYB4R1uSsnYePtls2nLFuxqsBRyHxHYlksjHuJevWNMQVsXSIkilPeBg6dddR5
	 kC5NiQ5Ooq09RZScan9tJpwlX8lxy1vM4az6cuqdONGaDJzdr2ocLK0fmrPkdt/dhR
	 Cg12eQSCueJftsuPy9K0hTBxSrecSo3kVZsx+0x3clq0Lk3zDQEUyW2Nr5fBueFCjh
	 nfT5mB2mmpLTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5177840CCF;
	Fri, 10 Jul 2026 13:52:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DEE72FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83F9581183
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yq2R8oLvhO53 for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:51:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 646558113B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 646558113B
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 646558113B
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:51:57 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-47df6a5202bso575711f8f.0
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 06:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783691515; x=1784296315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Ypvq0OTmd2rpAl/2JDzXlem5dznfe0QQ93RV5MbkkkA=;
 b=D8nJyGYvqxErjPbfqyQ8TtvQ9ew/SqJRh4yXjlTBv5EG8vTZeZM+X4Y9+JzY36iU8c
 Kd14fv3LDP6IXicXzziNc5SbvV9uONGXf34Fu3cfNbnu8LGF9eFO2YfnKHK7k9y6lqFd
 QrUFMkWtyelO+RMFysqaXfIlNwvutbUG3vZspFHL4HWmfyw+SgWEGs5NRUp47ryqWfJ/
 CJhrWEi9WshYXoPR2zk3XZGCqdwT7MdNANeqkIYSGJpn9kTmVMRQL3nj4HpECmaEYIWK
 GlKTCNAeYNm9oDskIC+9/bWyNiVpuLzsSGHmJVPlB/gPGrb3hg1XISHy1r/VOVIpVVUg
 IWKA==
X-Forwarded-Encrypted: i=1;
 AHgh+RouTPCbn/qMYCGHZOu8qwhei/E7A0QBmdjunh1J+G60KuM5FF6fm1dzoBv8B3z6mNHwyEmiWruk9e4=@buildroot.org
X-Gm-Message-State: AOJu0Yyk0kCgRpZ3DuKgZIlcuU+Ih1LwM/G0DMDqy9oYwDXEnpnuEqTC
 GbfV9Tod3DXe72Nl2XipNzY8Fl8pRpG44zlqmcIMgsn+Pgv/N7MsFC68Q/U9pOsJkkg=
X-Gm-Gg: AfdE7cnqEfbACrIw5BGVpkKprr4AouKm3Cb+f8lsWMWfRZr4vaHmHeVYohVXXTbbSZG
 5/Oo8fAmVoOrFSRzUuU87zIHcb5rvLs2O7Nnbj2gLlSuxA366vJbDgjdSzCbFkMMiDTCNQCvuLz
 HY4qscbseieUIy1JA9uZ/dfOMRR/msJ8xqZ7k9IgUbO6zaHWOqqi2c3cg9tSiNTPGAt7jjDpMjg
 GHrm5rWUyXFecAjdShyNnNmz1D0HocTsCm8F+GjJPmnyV8+WWkaQ8AYp2NqvuYI2702a7M1Q6WT
 bMUydcklQmrpAFW6oj8f7QWGIZGsu3uVw27snGGWAYdwNsoO3NURNEANByxAov1r+r81nsLHO7B
 DXcmy9Kmps4DEMz3lZCvBtmJCbIYg0omH6G/GBfSJS7G1gEHtCXeDodVKhLQP/eBsFMMN8uIf5/
 NkchxNj4knbIWwQ4My
X-Received: by 2002:a05:6000:2c06:b0:475:f100:3607 with SMTP id
 ffacd0b85a97d-47df081c95bmr13251746f8f.54.1783691515335; 
 Fri, 10 Jul 2026 06:51:55 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47a9de1d910sm58622317f8f.6.2026.07.10.06.51.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jul 2026 06:51:55 -0700 (PDT)
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 10 Jul 2026 15:51:54 +0200
Message-ID: <20260710135154.759783-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260627113409.777671-1-fiona.klute@gmx.de>
References: <20260627113409.777671-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783691515; x=1784296315; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Ypvq0OTmd2rpAl/2JDzXlem5dznfe0QQ93RV5MbkkkA=;
 b=IZRdX4qJZHOXZWuCd7OkIupnyh+CTXZa5txbWMg2Ni1AP5LzBVJorryK4cF31hGiHM
 4I79/s6MS2QxU1S0Y0xXqe5o59OJqw0vv1NEs8kXHxOdK8xJ5/zqHHguEWbaRKP8r8YE
 jtyof3STikHI2JXC8x6V72SzPWoMH767Vj4SXQUKICejLfnOYAFGTM6amh0f+DgMc0EE
 FAv8PUFX8m8NSW1CijkNktl+020C4ZDA8IZWimY6WeBdOKmHScyWVL38N9yTfvCsQsiK
 VaiswA6U2PLbudleG19J7stv2vWsyyJ/wxIoXAHQTvfNy0LY4kXK5PqiNKDyL/KhTTsr
 7oUA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=IZRdX4qJ
Subject: Re: [Buildroot] [PATCH 1/1] support/testing:
 TestPythonPy3NetworkmanagerGoi: check we actually get data
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
> The sample script would've passed even if the connections list was
> empty. Check that there is at least one connection, and that the
> sample script can read loopback device information.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to 2026.05.x & 2025.02.x. Thanks

> ---
>  .../tests/package/sample_python_networkmanager_goi.py     | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/support/testing/tests/package/sample_python_networkmanager_goi.py b/support/testing/tests/package/sample_python_networkmanager_goi.py
> index 240e8437fd..dff68e66f9 100644
> --- a/support/testing/tests/package/sample_python_networkmanager_goi.py
> +++ b/support/testing/tests/package/sample_python_networkmanager_goi.py
> @@ -24,3 +24,11 @@ for c in connections:
>      print("{}:".format(c.get_id()))
>      c.for_each_setting_value(print_values, None)
>      print("\n")
> +print("found {} defined connections".format(len(connections)))
> +assert len(connections) > 0
> +
> +# check that we can find the loopback device ...
> +loopback = client.get_device_by_iface("lo")
> +# ... and read its type and status as expected
> +assert loopback.get_device_type().name == "LOOPBACK"
> +assert loopback.get_state().name == "ACTIVATED"
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
