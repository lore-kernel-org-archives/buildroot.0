Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9024FCCF9FA
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:24:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6708681871;
	Thu, 30 Oct 2025 08:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ht6ZWqRMBXAr; Thu, 30 Oct 2025 08:24:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 080F08232F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 080F08232F;
	Thu, 30 Oct 2025 08:24:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id AE95B2A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:24:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A09D340793
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:24:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cn7ZQqJhu5Je for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:24:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AA22D40748
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA22D40748
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA22D40748
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:23:59 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-4285169c005so423076f8f.0
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 01:23:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761812638; x=1762417438;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dVP33IRMuceqGy7I3Z8ZH7Xd+BSh1mJEZlsYXYQyZvk=;
 b=Dgs1qDmEM+NR3cIkW1vDHLGnXy1L4d/p6e4NODAU/Opz6Cz/UGzsGWDBur+O35/S0l
 d22HyDLRkmDipBhA671bFmDScwDgfMxh8wPQ7DDiBOLTFObVMZpLc6Nx46XjDCFAUAd+
 6xyslVRQNH5+mWzwLZZGvwd3npMGOnBEdsk5tdYBOe/o+E/22xJeF9Ikk0H50uO+BdWc
 5QRsyNRK881fAnLKgIAisHqsW+JRP1tirxlfnAWyIG8EH1AY6xiNHuBriyeWJfgbcJqL
 I75ZgUFYCGyfkGamnUb/tUTBAXlGqMqZhsmhJ3po3XDLN4GWWcL9fwRucbUAcFl0IwJd
 DDQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV55e0XgCjYPqv35Xy5OBSDe3Vo4/ZHrf9Br+iwjkSu7dQi46vTUfe8LNoWnm78efDpLhWGekDEDMU=@buildroot.org
X-Gm-Message-State: AOJu0YwVdk61j0iPBxVtBKd4irRWC6/V43QDXze2q44qodzZq7laJZ9s
 vYeL8OCk3T3o+AlrKVF0VFWgWHE7W6Yytw8o7/4E3uRfEholuOx6c/jWAn+00VyUM6k=
X-Gm-Gg: ASbGnctTUU0G/HS8GR3nXydmEsYAI+5J4xBQsnBAlt0+3h6mDe8teXnzG97jotAtAYV
 LLHT0FN/+1N9xMIrcu4EfpuxBJxpqQ9oxe0F3fAis2bY45+JtuZ8Mt8Ksiw1FAq5kpYaiKyfNXl
 yMNEeifd97CADljbGM7fOiJx6l3jxwGHz/VA6kYc5KSVBVWk/ZFXoOnG0qEoATDjuXWzM1aX5Uf
 mE1K2uRI47+2tmceZHacLu64LSK+Qw4PP4J+xNmG93DHc2T9ltZsZhH9dhaHJmDOIjKKIP7pKan
 jzxGwOdOBrn0Le6Ey90upl0QJyLqd2tL84duIuSWU5k2h5iBLHjb+tOpo+DhsaAK8KLcAPls0AS
 6ddnvZkojZoJYzMPuttDkMOh/JQFhr/sUj5ixsXPLOjsMuLEelvd+jq+dETmr/jTvY0Yxi3vZ5f
 5a+GZ9w9O7+OMCyBVKd0zEia8yjPCFh7qMtJpiv8XSvJp2TZQ=
X-Google-Smtp-Source: AGHT+IHgkMUdKEI03zffFz/xWKxF+ZsiaYVAy8S/nvRV2C+DWaGV2eEBsZnCRYrdmhjezFR+ojimeA==
X-Received: by 2002:a05:6000:22c5:b0:425:769e:515a with SMTP id
 ffacd0b85a97d-429aefc94f1mr5070238f8f.42.1761812637703; 
 Thu, 30 Oct 2025 01:23:57 -0700 (PDT)
Received: from arch (77.109.92.202.static.edpnet.net. [77.109.92.202])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d5c9dsm31833939f8f.26.2025.10.30.01.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 01:23:57 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Thu, 30 Oct 2025 09:23:56 +0100
Message-ID: <20251030082356.35555-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025120712.3262343-1-bernd@kuhls.net>
References: <20251025120712.3262343-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761812638; x=1762417438; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dVP33IRMuceqGy7I3Z8ZH7Xd+BSh1mJEZlsYXYQyZvk=;
 b=Mwsqzz9e6BjeNcPR8t4TbHQSeXwDyC2DLe1wI0x0s4+lBXUH32ulvNaZtbeOYHHrNo
 ujXXoW7AhbnWCf7eMtg9KFq/vjElFaNoezIyI5t9vBv4cGNDgT3/Tn2MqvxefQf4JLZW
 fdjq8YSYQLC1T/AsfxIeZzFC/2kR8H4xVODuy5XpkOZlo17OEttr4I4I8uJsYQAiOPaF
 rh0QJDA4m4h7z1mlslEsKwtGWPC5Jk4+Z11Bt0k78shokUhfXIQNE5wXYKV2HZ3MUTCA
 iYTc03VSAPsFUE4usNUJ42pUq9GOCV5pkL5c4f7KY59Tdi/F9Sx60ZCgdr5Ar5GFfbQv
 icAw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Mwsqzz9e
Subject: Re: [Buildroot] [PATCH 1/1] package/libdbi-drivers: fix build with
 gcc >= 14.x
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
> Fixes:
> https://autobuild.buildroot.net/results/d30/d3068de2f477d68823c4b7e537f120edf03338bb/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2025.08.x. Thanks

> ---
>  .../0001-libdbi-drivers-c99.patch             | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/libdbi-drivers/0001-libdbi-drivers-c99.patch
> 
> diff --git a/package/libdbi-drivers/0001-libdbi-drivers-c99.patch b/package/libdbi-drivers/0001-libdbi-drivers-c99.patch
> new file mode 100644
> index 0000000000..46b43c8653
> --- /dev/null
> +++ b/package/libdbi-drivers/0001-libdbi-drivers-c99.patch
> @@ -0,0 +1,45 @@
> +Fix type errors in the cgreen with constraints facility.
> +
> +Upstream: https://sourceforge.net/p/libdbi-drivers/bugs/28/
> +
> +Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> +[Bernd: rebased for git tree used by buildroot]
> +
> +diff --git a/tests/cgreen/src/constraint.c b/tests/cgreen/src/constraint.c
> +index c19c0ddd41a7bfa7..95673dd3e222a3cf 100644
> +--- a/tests/cgreen/src/constraint.c
> ++++ b/tests/cgreen/src/constraint.c
> +@@ -22,8 +22,7 @@ static double unbox_double(intptr_t box);
> + static double as_double(intptr_t box);
> + 
> + static int compare_using_matcher(Constraint *constraint, intptr_t actual);
> +-static void test_with_matcher(Constraint *constraint, const char *function, const char* matcher_name, intptr_t actual, const char *test_file, int test_line, TestReporter *reporter);
> +-
> ++static void test_with_matcher(Constraint *constraint, const char *function, intptr_t matcher_function, const char *test_file, int test_line, TestReporter *reporter);
> + 
> + void destroy_constraint(void *abstract) {
> +     Constraint *constraint = (Constraint *)abstract;
> +@@ -164,11 +163,11 @@
> + }
> + 
> + static int compare_using_matcher(Constraint *constraint, intptr_t actual) {
> +-	int (*matches)(const void*) = (void *)(intptr_t)constraint->expected;
> +-    return matches((void *)actual);
> ++	int (*matches)(const void*) = (int (*)(const void*)) constraint->expected;
> ++    return matches((const void *)actual);
> + }
> + 
> +-static void test_with_matcher(Constraint *constraint, const char *function, const char* matcher_name, intptr_t matcher_function, const char *test_file, int test_line, TestReporter *reporter) {
> ++static void test_with_matcher(Constraint *constraint, const char *function, intptr_t matcher_function, const char *test_file, int test_line, TestReporter *reporter) {
> +     (*reporter->assert_true)(
> +             reporter,
> +             test_file,
> +@@ -176,7 +175,7 @@ static void test_with_matcher(Constraint *constraint, const char *function, cons
> +             (*constraint->compare)(constraint, matcher_function),
> +             "Wanted parameter [%s] to match [%s] in function [%s]",
> +             constraint->parameter,
> +-            matcher_name,
> ++            constraint->name,
> +             function);
> + }
> + 
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
