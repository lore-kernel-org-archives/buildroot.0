Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DEFFCC062
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CA0A04211B;
	Fri,  6 Mar 2026 19:53:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wYcFj0_ivkwA; Fri,  6 Mar 2026 19:53:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE8C8420E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826804;
	bh=uU5TPZYz9YF+U7zs/zwKp6/vjAfZ9aq5Oqh3aL1ixnI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PwzixECKZUZjuwRHRFUhgpL/sQBU9ZKUDCxUi/VfSyJOySbcNuvIJNiPCMC07itcj
	 cmKBN5EBCKCXhCaDpPwI+dEPOFoPRWkwL2IvXH77lVzTm3LZkQyOL+KBjbAVc76pEl
	 q2PauNys+3Krkuxe8Axz1ro1/FrGc8gS0FU08EhOJWbYpfh8iJ7plpqjpOGtLl1Jy4
	 jWfmWyTNz85bEfvUqKajMJBoIzc5/4TGhJ9N1hKO0TBDGcPqVxTY+NzX3xmQXOJR7l
	 NBffnEOn0p8HmB3YLf1VL42Fz7bSTtPU8+dZjbVYEwsTvGqphutrW5oKrVPMqi0lmO
	 qBIesAoh8yKlA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE8C8420E7;
	Fri,  6 Mar 2026 19:53:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E85D169
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8431883D65
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v-nEqO4z2LYR for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 13B8A83D56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13B8A83D56
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 13B8A83D56
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:16 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-48329eb96a7so63383995e9.3
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826795; x=1773431595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nxkQTTpAHJkT0E3SATuHpWyAPevxgtpLNL9u0QAjVFk=;
 b=V+gF1aLiQMkOtM0yyqgGkwzJsWGva/eAdk7tGbJuGMzdlPvTJVEu7ejVp8gpxSXjvH
 sadQjTTIBvbsM0ReTF3iyoFHxz+Oy6W79jtTSYiWxpp0JBOKe4pxiIBG1jsRURN/O40x
 AyeDAEmF+4+4R1KaDEV2EVEVRHPBJ4H6utrxxEetAiwr91TcHobKidtaYx7BxUGH0I25
 UoTeEf9uA0tDEW0DCcM33F/9DJbvrTkwdT6rlnHC0PKEUc1D1T80PpsaO64jhPAazQAo
 0mkJzKffWp68SFFYsI3Pg8afmkRovI0FLD6Oe6k7Qrtzeje5f0rROmIn24ERs9XWKrq0
 by9g==
X-Gm-Message-State: AOJu0YwhhYJ2MowkOw6QK/X49+e2vGm1eOq6Zi671UCNpF2Ou8fj4quH
 +Es/xoOrdV4wIpuL6ZMwXPBsEA5cuIW6gxLyCP/XXCJaQp9DioGY0XsJraf6rCpQ/LCUyVrDWA6
 g6oDP
X-Gm-Gg: ATEYQzw0+Mbg7T/xosP3EPLM+WaWnpH5W4e3Y4x+cP+ZbLu7X8WO3y1rm6FSr2x/sle
 /lyz7dAdQnFdoAQyCNFZ256EEnYftss0mLS74pVu0m53zfexV4QLWRNGpx05R2AOKa6SEEyW3qL
 Rk0ff3wwuoJNsrTWwvYSzdCzmNP2RBXGJWOtmb6Co2RjTGYCfL2LIj3OJ1Uz+x9XLvZNG/nX727
 c93F1ky03mR7Qdc5e5dpEAtl9sfLeTFaOjunWU0NJDi2r7CKBPjXbczSfryCv6bjNl6v0QywDwf
 A/g1uzJtY6eVjxVuAxI7+KST8V0Uplr3DJerSat5QxNaxlG+8b1hzIHxn3Nn8F/BFFNqDxH/Jlz
 Zlezx6QUAPGmJwZ4weApPbOPojfdjMDi9ZdJ2arE9brDl4wDygW+J2FsQRy/sMDxMt+qZEAeNCu
 YgR78zwX1jnOIQM+k=
X-Received: by 2002:a05:600c:3b13:b0:47f:f952:d207 with SMTP id
 5b1f17b1804b1-48526969359mr63231605e9.19.1772826794825; 
 Fri, 06 Mar 2026 11:53:14 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4852687c1ecsm43227475e9.1.2026.03.06.11.53.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:14 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:14 +0100
Message-ID: <20260306195314.7905-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260228202847.96486-1-thomas.perale@mind.be>
References: <20260228202847.96486-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826795; x=1773431595; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nxkQTTpAHJkT0E3SATuHpWyAPevxgtpLNL9u0QAjVFk=;
 b=Qh7C1WATUXEtvWaqepVCoVvZ9PpP+wZX6Kdz8vAag7Drep5iq64sfBP9f87qPj4tzG
 xI27pu9sIsSAIyevUXV94+uqZEiKT+KDkE1ZGKCgolUwVNoW8EaaU/mhZUZ6Bw+WfZ6R
 hSy2AwRsHV656Td4RWMOxoaFwz8fai4CpxKFGlM1qxm+mytW0jU7IR9b6/K93hd+mDUD
 oQcEcml3L2QXU2lmeETI619Gt4tZqgr3wq8W82+50pscLilcB6voJMdpl8Q5Hh2juizc
 eU37XRv7hWWa6br+ZtQinaBCLfjn1DPKFwGjQwi4PJQ0trRj3NY93Jkx9we91RJxRrVd
 qSWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Qh7C1WAT
Subject: Re: [Buildroot] [PATCH] package/rtl_433: add patch for
 CVE-2025-34450
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
> Fixes the following vulnerability:
> 
> - CVE-2025-34450:
>     merbanan/rtl_433 versions up to and including 25.02 and prior to
>     commit 25e47f8 contain a stack-based buffer overflow vulnerability in
>     the function parse_rfraw() located in src/rfraw.c. When processing
>     crafted or excessively large raw RF input data, the application may
>     write beyond the bounds of a stack buffer, resulting in memory
>     corruption or a crash. This vulnerability can be exploited to cause a
>     denial of service and, under certain conditions, may be leveraged for
>     further exploitation depending on the execution environment and
>     available mitigations.
> 
> For mroe information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2025-34450
>   - https://github.com/merbanan/rtl_433/commit/25e47f8932f0401392ef1d3c8cc9ed5595bc894a
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  ...-overflow-in-rfraw-test-data-parsing.patch | 31 +++++++++++++++++++
>  package/rtl_433/rtl_433.mk                    |  3 ++
>  2 files changed, 34 insertions(+)
>  create mode 100644 package/rtl_433/0002-Fix-overflow-in-rfraw-test-data-parsing.patch
> 
> diff --git a/package/rtl_433/0002-Fix-overflow-in-rfraw-test-data-parsing.patch b/package/rtl_433/0002-Fix-overflow-in-rfraw-test-data-parsing.patch
> new file mode 100644
> index 0000000000..6446fea0ab
> --- /dev/null
> +++ b/package/rtl_433/0002-Fix-overflow-in-rfraw-test-data-parsing.patch
> @@ -0,0 +1,31 @@
> +From 25e47f8932f0401392ef1d3c8cc9ed5595bc894a Mon Sep 17 00:00:00 2001
> +From: "Christian W. Zuckschwerdt" <christian@zuckschwerdt.org>
> +Date: Wed, 8 Oct 2025 10:11:15 +0200
> +Subject: [PATCH] Fix overflow in rfraw test data parsing (closes #3375)
> +
> +CVE: CVE-2025-34450
> +Upstream: https://github.com/merbanan/rtl_433/commit/25e47f8932f0401392ef1d3c8cc9ed5595bc894a
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be>
> +---
> + src/rfraw.c | 5 +++++
> + 1 file changed, 5 insertions(+)
> +
> +diff --git a/src/rfraw.c b/src/rfraw.c
> +index 9f4c9780c..71a1c365d 100644
> +--- a/src/rfraw.c
> ++++ b/src/rfraw.c
> +@@ -159,9 +159,14 @@ static bool parse_rfraw(pulse_data_t *data, char const **p)
> +             data->num_pulses++;
> +             pulse_needed = true;
> +         }
> ++        // abort reading if the pulse data array is full
> ++        if (data->num_pulses >= PD_MAX_PULSES) {
> ++            break;
> ++        }
> +     }
> +     //data->gap[data->num_pulses - 1] = 3000; // TODO: extend last gap?
> + 
> ++    // expand reapeats as long as the pulse data array has enough space
> +     unsigned pkt_pulses = data->num_pulses - prev_pulses;
> +     for (int i = 1; i < repeats && data->num_pulses + pkt_pulses <= PD_MAX_PULSES; ++i) {
> +         memcpy(&data->pulse[data->num_pulses], &data->pulse[prev_pulses], pkt_pulses * sizeof (*data->pulse));
> diff --git a/package/rtl_433/rtl_433.mk b/package/rtl_433/rtl_433.mk
> index 08735be850..fc6c2bece2 100644
> --- a/package/rtl_433/rtl_433.mk
> +++ b/package/rtl_433/rtl_433.mk
> @@ -10,6 +10,9 @@ RTL_433_LICENSE = GPL-2.0+
>  RTL_433_LICENSE_FILES = COPYING
>  RTL_433_CPE_ID_VALID = YES
>  
> +# 0002-Fix-overflow-in-rfraw-test-data-parsing.patch
> +RTL_433_IGNORE_CVES += CVE-2025-34450
> +
>  # Force Release build to remove ASAN.
>  RTL_433_CONF_OPTS = \
>  	-DCMAKE_BUILD_TYPE=Release \
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
