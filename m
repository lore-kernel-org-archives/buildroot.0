Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E41C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A35B60DE8;
	Fri,  4 Sep 2026 12:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8G93VX76aOBZ; Fri,  4 Sep 2026 12:19:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D92BA60E1B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524356;
	b=XKeFezfP6M4mMx/xfCyYCsDhvu3kB1FwYaJ2THb4pr5JXrYYDF4U40CbevtbZiC83IFg
	 uDhLzyQPE+339jkGQSqZ5ZAxYXokmzGJmRlk1RyVElbhUbTzY0Yl9NEqT9cyV3UJwJm5U
	 QVc53cKkES/nIpjNdhIwmLjyoxZh33lgs2vD2ZfE9eOeNlVIMjgyldtFG44SPgSLt0pFe
	 f28n3nVwyIJOYgJlVkHcG34OuXRWx2Izx9MUItRCwqRUKIdaYt1HXxVciDSX2BFzKKsbd
	 tCxEOHguyhFuIqOd8ql3D7FK89bkbimogmpXgYRMs7ZLIjvNSnw2Aff7Q1EM+EJSRCA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524356;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9Ns7bkzNl33B6TVieG1851pk0/ay2OehYzJc/7MCq2s=;
	b=IetP1cPqJdLCH8i0a3MwksMVLgg8wY0cN7CTcXvcgFDqR+JgIDdIFv2yqCiQB1txcHwt
	 +oltaMcCWOt1uE9R7p3UGzXLDflnsFrcJjRvl4+gLD8lNRE3iJ5o+3mkqYQufasCjzwed
	 EOcKncFl/AkwvPrTi4Urcm69fFfn4VghMMAAR2y608Vx7eU3AiswlvCW009r50YD+660/
	 XFo6BOSYMLqwK3vVuC1ztyxv3eDlrJsg9EQrrM46cW066S9FHIS1csCX4LmxOGOK5TAxe
	 tiRzi3zEuSOFSfwWCOTc5m56ALsgWZ8urCFH6xU3Eh7QoiEVjyHM7rriRqlnimaRs1Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524356;
	bh=9Ns7bkzNl33B6TVieG1851pk0/ay2OehYzJc/7MCq2s=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=b2hX6f/yb7mkTltx+V5TxaBB+zEaVs4XPk4Hr9qFNzHj1tsUhL19HCDTTLTf/E7MD
	 fqp8Tss6RnrEpz/iZKj0W2+EDtmlAMIebEY3yThVkuEynmFucuAulC/fQTQALNn3IH
	 LIBLltSh6hl5fvhrkofbyfmSw8HHhaUS0n1l3y60G9z+lKYE/ZFfp1wNDCAyDaijt2
	 R/VyfVPuD+Xv38voYhVak6SjnJ5N1kzWOiaOOtL71iqO4WLwDxGS4h+3ZaLXspIY7/
	 Ts75YfM8VMCO74p3fq1saRgnJCAtsssJIXINEU7J5Z1kS5nuejpgltEKhonAA7SVQ9
	 k1Wnw3UQXmXIw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D92BA60E1B;
	Fri,  4 Sep 2026 12:19:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6EC96F14
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60D8F40B87
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W_aaGyVa3Q1E for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:19:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 295D640B7F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524347;
 b=kTbAwifJZBbfrT2ptA6RFeo7yOXOcBIeyRekYAeRWJ/1HSRR0tKkhtA4IE6xQC7mNiP3
 2UZhCfXadtBIWa6J0t6csFiVWuHCitNquldHmtMLq1jnlgcDAdWGy0JjuJXi1N1uI98E0
 VBL7oxMBgkzT85jEvmilQNGjf66bthzN+r8FhwXz8hhKJn5XfCiz4BX5+tSAWhczNytCg
 +eUBhNWaUaKYj3iUc4nVPk4HV1Scjua/Ip/CGFsx3z9c6+qJTFbq4bmbNd5nXyy7Sn24T
 Vf8t08bytGDbyP3wtlDkgR97nCR5rN5lbsnswyHRK/0SrPHPcBvZYQrn37k4PdGkEjA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524347;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=hS9Q50Z28OxgeuDM+pCSiYFRDh0Azrd+TezAVDzptoY=;
 b=CmYv8Mg63dYQAkuFSVR47X0KiyhLmAIRXUCpet0vnY8PH1I5ilc50CU+MV8w80cBfmym
 3dKf0cmHdgt7bLQiexMUG6OA615WJ8whegowPfCKZAUY9h/wijFJubUsa51KeP6Z+HJpP
 193K8tQRurgMXeH7qGGrJ7r2wYRXmfxiPz/P3mu5f97Vs84kZJSYteAQw8bfn1FMkFLXA
 f7kYSdb2EEOGX9toUOPKDAXzYspeo8deyAKp6K3LHydg+S/x82Mp+kKdmqPuHlSr6SHxP
 02UN47iKu/YxfrevJAs3z3oP5hJEFBQG1UKF0eZ/dG4hPSAdAbpMkdLuYPKVOzA77XA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=S1uiZXu8; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::335"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 295D640B7F
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:06 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-49b9320423cso10233605e9.0
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:19:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524345; x=1789129145;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hS9Q50Z28OxgeuDM+pCSiYFRDh0Azrd+TezAVDzptoY=;
 b=VYjaxoCuXJ0dvmxKbQI3GKJwlxCWVXHRjEnFYk9t+wpzNispj3vNr8RLXiabttq9z3
 dxZNkSMvE4AFZQLLNnVM/EKOXi7j21n0Gwmutjn5h3qspls419n2S2Y9TpW90jeSnH5t
 vBXtBCBoiwnEV6SKpj0aRA1huV+9284EFRLF49qtkFjKexU39fc1Fjzo/SV/fQcrVamR
 WrfqWz8frVmDXuvYPfZbdFtOEo9kI3dQ3RcIjw5RjU2fUygyk2+1HER9eqL5vSiHnHO9
 MlNU0isNd+d3prpafq0cVo0njQTxt4Sd+MODa6mFHJy+1oP3FTG5eQlgFl/Mt5I3vebe
 cTbg==
X-Forwarded-Encrypted: i=1;
 AKwUvBztQdNBYn6s7eiLUZbN+60YA6ILTrqc9TE+B4NIUBNtu+kNM6fcDQRcWpTN+0QJjpphmRSDwmDHoqg=@buildroot.org
X-Gm-Message-State: AFuF++m2d5+7Jvyv7OzH6eJRp55+2w2xJBGwnfJj66zVSWmanxxWiF7m
 wZyAE6UlYY7RqUr524DjSOkMIKB7P8RKu5GqxSXQH1+0OntVQoKQaFjaNTBEf8D4cHs=
X-Gm-Gg: AYBFou1aEJm+PRRDgXAUmJ2xwJrvo7UwPWH0YoE3WaW9tUeTZJEJ1xAX6O2xpbWFkIv
 N5XKOOCoY44dhFIsQDgUsBVDWh7bxvwrEiQ2SYwTZkVR7aOWdqtyrsewKdXHKo2Cq5sep5ufir0
 zPQNoG4eRiOQvY5/Cl83u3riviITIdTBHUrt7X3CZu8IcytagCrtPq0YCMXAUVqqc7cGyQTo4lj
 AgSu++2HSPppAXuQtp59ebEQerNd7QEwqEs3krewN8oZgGb9yMklDSJYTAwbcP9A4nlOzYBdSIB
 SB5HMatwXBcPzfHgHaunoada7IMrOj8ult+bHegcCgC9/h6wwMcWi7I+Xsj/f/QMUS702TAhx08
 7LoEW7r4vnU3OZL0Ud9LjZZ+M3qZlQQcIsdBltfAjB/F//ln5aC2Rzs5LN0PoZ1Swbgq7ht0eDv
 nqj82w8uQvOVOkBbVpQEqiYQbZMJfAgYqMyh5HFNRvcMUtz3yLbev+vQ==
X-Received: by 2002:a05:600c:6087:b0:49c:d52e:d0ea with SMTP id
 5b1f17b1804b1-49cf81e3454mr98142145e9.4.1788524344805; 
 Fri, 04 Sep 2026 05:19:04 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf7703cefsm91368765e9.5.2026.09.04.05.19.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:19:04 -0700 (PDT)
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:19:03 +0200
Message-ID: <20260904121903.406469-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827200814.1801974-1-thomas.petazzoni@bootlin.com>
References: <20260827200814.1801974-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/collectd: fix build of virt plugin
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
> Since the bump of libxml2 from 2.13.8 to 2.15.0 in Buildroot commit
> d81922c1ef8825f10b802984d9721412a1a1a377, the "virt" plugin of
> collectd no longer builds:
> 
> src/virt.c:2208:49: error: expected ';', ',' or ')' before 'ATTRIBUTE_UNUSED'
>  2208 | static void virt_eventloop_timeout_cb(int timer ATTRIBUTE_UNUSED,
>       |                                                 ^~~~~~~~~~~~~~~~
> src/virt.c: In function 'register_event_impl':
> src/virt.c:2221:26: error: 'virt_eventloop_timeout_cb' undeclared (first use in this function)
>  2221 |                          virt_eventloop_timeout_cb, NULL, NULL) < 0) {
>       |                          ^~~~~~~~~~~~~~~~~~~~~~~~~
> src/virt.c:2221:26: note: each undeclared identifier is reported only once for each function it appears in
> 
> This is due to the fact that the virt plugin code was incorrectly
> using the ATTRIBUTE_UNUSED define, which was supposed to be an
> internal define of libxml2. But it turns out that up to libxml2 2.14.0
> and its commit 208f27f9641a59863ce1f7d4992df77f7eb0ea9d, this define
> had been made publicly available. It could therefore mistakenly be
> used by collectd's virt plugin... until libxml2 was upgraded.
> 
> We backport an upstream patch from collectd that fixes the issue.
> 
> Fixes:
> 
>   https://autobuild.buildroot.net/results/4c8463f0372560f4c3a20b0f67854460f0d1c400/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  ...UTE_UNUSED-for-virt_eventloop_timeou.patch | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 package/collectd/0006-virt-Drop-ATTRIBUTE_UNUSED-for-virt_eventloop_timeou.patch
> 
> diff --git a/package/collectd/0006-virt-Drop-ATTRIBUTE_UNUSED-for-virt_eventloop_timeou.patch b/package/collectd/0006-virt-Drop-ATTRIBUTE_UNUSED-for-virt_eventloop_timeou.patch
> new file mode 100644
> index 0000000000..6cf0a55ba2
> --- /dev/null
> +++ b/package/collectd/0006-virt-Drop-ATTRIBUTE_UNUSED-for-virt_eventloop_timeou.patch
> @@ -0,0 +1,45 @@
> +From be6ac1ed28b4842e8f2e54c39a2b3fc48feaf8b2 Mon Sep 17 00:00:00 2001
> +From: "Matwey V. Kornilov" <matwey.kornilov@gmail.com>
> +Date: Sun, 26 Oct 2025 18:36:56 +0300
> +Subject: [PATCH] virt: Drop ATTRIBUTE_UNUSED for virt_eventloop_timeout_cb
> +
> +ATTRIBUTE_UNUSED seems to be never was a public part of the libvirt interface
> +and leads to the following issue with recent libvirt versions were
> +ATTRIBUTE_UNUSED has been renamed to G_GNUC_UNUSED:
> +
> +src/virt.c:2209:49: error: expected ';', ',' or ')' before 'ATTRIBUTE_UNUSED'
> + 2209 | static void virt_eventloop_timeout_cb(int timer ATTRIBUTE_UNUSED,
> +      |                                                 ^~~~~~~~~~~~~~~~
> +src/virt.c: In function 'register_event_impl':
> +src/virt.c:2222:26: error: 'virt_eventloop_timeout_cb' undeclared (first use in this function)
> + 2222 |                          virt_eventloop_timeout_cb, NULL, NULL) < 0) {
> +      |                          ^~~~~~~~~~~~~~~~~~~~~~~~~
> +src/virt.c:2222:26: note: each undeclared identifier is reported only once for each function it appears in
> +
> +Drop ATTRIBUTE_UNUSED here as there is little use from it.
> +
> +Upstream: https://github.com/collectd/collectd/commit/050877ed952ffc15c849803a9b3e77c5cec15f81
> +Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> +---
> + src/virt.c | 5 +++--
> + 1 file changed, 3 insertions(+), 2 deletions(-)
> +
> +diff --git a/src/virt.c b/src/virt.c
> +index 01c7c777..ee0440e9 100644
> +--- a/src/virt.c
> ++++ b/src/virt.c
> +@@ -2205,8 +2205,9 @@ static int domain_lifecycle_event_cb(__attribute__((unused)) virConnectPtr con_,
> +   return 0;
> + }
> + 
> +-static void virt_eventloop_timeout_cb(int timer ATTRIBUTE_UNUSED,
> +-                                      void *timer_info) {}
> ++static void
> ++virt_eventloop_timeout_cb(__attribute__((unused)) int timer,
> ++                          __attribute__((unused)) void *timer_info) {}
> + 
> + static int register_event_impl(void) {
> +   if (virEventRegisterDefaultImpl() < 0) {
> +-- 
> +2.55.0
> +
> -- 
> 2.55.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
