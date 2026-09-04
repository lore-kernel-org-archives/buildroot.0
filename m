Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF14C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC57C60DDB;
	Fri,  4 Sep 2026 12:19:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jA_Fq_o9wHe6; Fri,  4 Sep 2026 12:19:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8626760DE3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524349;
	b=oOi4TB9lhu3P/HMBFjWAcB8DyO7fY1zkskFnxvrSsnD0kvirCDBEZhwi80ZVyshk6AVP
	 4XgpZueU5YMGfgulFJVsVMbDeF2nKf6gW9Rr2NNxxdnOt/immOkEEi7Yp//xFMV9xtmiU
	 4NCXp21el3Eqxs71/hD0hZwwT15AUWifBdsFQkIHFv3dNAAo1vSyQER8y+Sk+ndr5ylR5
	 Uzum3OYpEX7gunrNaWskFG0sd+CFDntfz0wttY2efpS1jW7RnMZwjTITrAq/TotqX00yc
	 n1ePavZvlfZHbinLlkr8KD4vXlZe2kkzrpvGAaODIBxHJDuQAgeKunC94ZifocSpvaQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524349;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=8wfq+VVuESuiR7H+JSdYNsXwHJKCG3ZCpyQHrRpYk1Y=;
	b=Gwg/bpwwv1MoRT65KS4sBniMHxtyP/qrKg9eW5isaudVKAV5vA23iWiIMDUCSF0wAlLl
	 zWrTvgBI8H7qOlVrE+sVMp5s3u96axNUpHkLMeSEy6AsE8iT/gL4Pl6fR2ogvUGN1Tl2C
	 JrDuYhmvcJhhmrwbMtXFpLQSDDB3OHTZcdLv230SZIKHI+HgvNKzfVXXuxM4xGB6eVEic
	 Sj4Oycm7VDakXEhCQZR0cj1V7TQnHF9uN9dAM5UkQNFfs9i1l2EtKw8mn22U6VsIzebkF
	 mRlRTOJCEF74CkxL3zUrKvee+G0ypz+xbjpKcv/NlNBfsXxBeD2PTVc4AAJhtB8RGXw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524349;
	bh=8wfq+VVuESuiR7H+JSdYNsXwHJKCG3ZCpyQHrRpYk1Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=T5jMas32ocFDVDcWlB45KSM3U3ySqkeEucBHTtE/aVjNbQXM7PE+uaGgnpsSsQ71V
	 dvl6yJ2B2cdFVXrWUpzqWBOG9nprWto83/8eCUKmWLVVLgb3zrGmXZTWF/rLQMcvJM
	 r2XEcE9Xztdg/dJEkc6aeThdStPFjz5Je/rTXwDwi2aQSbHH5VkNNVynFDzALMgC6v
	 fIQizNhSchmFH+VkRncokAd1XK6PJJCu0NAb4iWNPN855QS9p7OY/f6z01CfT8bCaX
	 XY9DvSq88qzRYAZjuQ5f6hgSa1yzz8GSju3SxcReWyFoGF5HoUFdVTNXITzmGmPvn9
	 yPmpwXrkEifoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8626760DE3;
	Fri,  4 Sep 2026 12:19:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BC8F410E
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA16281174
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hlBRgVbsgk-A for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:19:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7EFD081172
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524343;
 b=f4pYiziJYUyPfl5JsqHAxnX158ZntWTYIsNjOIqJvvoI2W0R0hnCpyzc6GReUs0leti+
 igH1vebiRw1XLf5NwO+78Nr4C8Z29RabeZLx2UMxUhh30pXDR/EJZFvW6VEDJLJMcnN/6
 boJI95j2V7lBHBuSGOI6bmzfQ69S5oDmNJl0zjzTBakfCOl6HU33zvPawp1LnHOENZppD
 BVuRE/faM+FZle01AwwT+SRez5Su9tDY2KTTgqANLFjnlj7qFFetv/u0drYtN+XF8OaVM
 Qto0shYn4b+wjWLqUjPFgq+kmy1F1vZD9EBavJa+e1UOOhXQcuXH+7YHhlmESskN0dA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524343;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=ovRhyP/EUgoFnpj/bHAZJvC48+fpr1wOH7XwmfWfvn0=;
 b=N9vwOgjt2+OStbAgbFLjbW9sO0QDaiqFEVihY2fHns3VVKn97c8TXd4R6pTfHfr1ARvl
 wsL1+5lO4+PoNpVdtkly2Tgg0Djly2sacqqcrysf9FqsKehLn2LvDYWk3Q4mYBJyKftcF
 7bfMS9x8lOYusJmpet/k5it0xOkjbOkPAJJ3QKLLmEOtSxFnqvmcRftjsTMi+I2SnvB5J
 rBMl0IW3ZALu4Nococ01SfxOmvEq8oyVbxLlcVF+YdAfzkbgMKEjpmEdp8DnaUEBZ3pxr
 cinC3hmDvZDZBl6Xc8TYZqvV/8wn9gpVJnQKHegbae3E15/9r+kDKcnVy1iofGnaQyg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=OyJhPfa8; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7EFD081172
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:03 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-49557167508so10788545e9.1
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:19:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524341; x=1789129141;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=ovRhyP/EUgoFnpj/bHAZJvC48+fpr1wOH7XwmfWfvn0=;
 b=WgqlKMhbR1MdQy5+7JgzyDJHd+LTYlZUMmrvBYlZZ0iBJVroHwVFk6Z4GlnlmRSw8V
 J7rNtnnkjPP/Yl8RHzfnmbG6l2Fue3Y1iw7SuIGToliJ6T8Gx8unecaHY5AK7iXVQxmT
 +Cbo/dOQ5xpCCtAa0tNbVP/58mue3HdFLMIELr3PHGpk7U09HRUR+ezShanY9F4CSI8p
 WajCfr01LXxrDLU+IRTqICiwkVR6LOfueWyjWxyGCfThp4jQZG+TJm7DIgek8ic+UHDO
 xbFQT1Nvytu4xv/01YL0zzfacf5JE2rRJ8M0p24ljNLLaryfLE0Kof8Lg7NzISO2TC6E
 DSIQ==
X-Gm-Message-State: AFuF++lMrmaGimYpCXGfODdis5dSaW7Hv5+2mxk1nmymMWofzK2vx5fz
 /UpeqZ16b9yG6KIIvd+XhOIdsyjyqQ+qnbj1cJwa2Uq5z9RRhvX3SY9JIRgb1R01azksuPeotel
 /gLZI
X-Gm-Gg: AYBFou12u/9c4NP3Pos+o2xf/umNiqjCzHWJKrSQKR3EtwH+di20euIWDi8HoYKZRzv
 4mZ1ZS9NVcLFIGA2c7Wcp36P2jz6fFFekK/FTDVZdYDeEY4ng9kQJ7eijjwM8wd4Se2GFXUdDwI
 C20UqZJn9Xm3Uq3/eXpC3GyJ1r4iU+DKPaJbpoDTUP4SgwtY6kHIaG3bv0BAyXt0oYc/VFLHTZz
 3OJNJGiWNBpNubJkFplIpn9herR8aiP8DXD8YfEsK9xZ90gBrhBYJYJmyn+DW6or4ytTs8RZrsf
 ZxKIoNLgy8hx4+LLcLkYZpaGHftSp3QH7hkRYFUnHA0Xm2z1dO6munVrPbbSIwkHiRzTMwMpSUX
 Mg5c9lV2nZv0RL8SHak6Fkg8I/GJdAZv8EEuzDdSP3c1ICY7TV7v+T30ihJnzXHLA6l3CyeXilN
 LggouOKy6EhsttXLPIaF7sljbtVah/8tpBHcLqY7Ia9wNV1/Tphr1nlg==
X-Received: by 2002:a05:600c:4f89:b0:49c:f617:7cf with SMTP id
 5b1f17b1804b1-49cf7f32d0amr76642135e9.0.1788524341207; 
 Fri, 04 Sep 2026 05:19:01 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49cf7703cc7sm69373035e9.4.2026.09.04.05.19.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:19:00 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:18:59 +0200
Message-ID: <20260904121859.406369-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826191159.711051-1-thomas.perale@mind.be>
References: <20260826191159.711051-1-thomas.perale@mind.be>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/rsyslog: upstream patch
 CVE-2026-19654
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
> - CVE-2026-19654:
>     A unauthenticated remote peer may lead rsyslogd to crash due to a flaw
>     in the optional imptcp module. A crafted input sequence during
>     oversize-frame recovery can cause an invalid internal message length
>     and terminate rsyslogd. No confidentiality or integrity impact,
>     privilege escalation, or code execution has been identified. imtcp and
>     the default imptcp framing modes are not affected.
> 
> For more information, see:
>   - https://www.cve.org/CVERecord?id=CVE-2026-19654
>   - https://github.com/rsyslog/rsyslog/commit/07b3c40a5a78c79ed9109251f842ca7e955dd586
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  ...rd-regex-framing-match-at-line-start.patch | 47 +++++++++++++++++++
>  package/rsyslog/rsyslog.mk                    |  3 ++
>  2 files changed, 50 insertions(+)
>  create mode 100644 package/rsyslog/0001-imptcp-guard-regex-framing-match-at-line-start.patch
> 
> diff --git a/package/rsyslog/0001-imptcp-guard-regex-framing-match-at-line-start.patch b/package/rsyslog/0001-imptcp-guard-regex-framing-match-at-line-start.patch
> new file mode 100644
> index 0000000000..5eff609fdf
> --- /dev/null
> +++ b/package/rsyslog/0001-imptcp-guard-regex-framing-match-at-line-start.patch
> @@ -0,0 +1,47 @@
> +From 07b3c40a5a78c79ed9109251f842ca7e955dd586 Mon Sep 17 00:00:00 2001
> +From: Rainer Gerhards <rgerhards@adiscon.com>
> +Date: Mon, 20 Jul 2026 17:19:28 +0200
> +Subject: [PATCH] imptcp: guard regex framing match at line start
> +
> +Why
> +A regex match at the beginning of the receive buffer can form a
> +negative message length after oversize-frame recovery.
> +
> +Impact
> +Regex-framed imptcp listeners reject that invalid transition instead
> +of submitting a negative message length.
> +
> +Before/After
> +Before: a match with a zero line offset submitted an invalid length.
> +After: only a match following an existing line can submit a frame.
> +
> +Technical Overview
> +Mirror the line-offset guard used by the shared imtcp parser.
> +Leave existing regex framing and oversize recovery behavior unchanged.
> +
> +Security advisory:
> +https://github.com/rsyslog/rsyslog/security/advisories/GHSA-cj5r-wh2m-7w29
> +
> +Reported-by: Raphael Eikenberg (@eikendev)
> +With the help of AI-Agents: Codex
> +---
> +CVE: CVE-2026-19654
> +Upstream: https://github.com/rsyslog/rsyslog/commit/07b3c40a5a78c79ed9109251f842ca7e955dd586
> +Signed-off-by: Thomas Perale <thomas.perale@mind.be
> +---
> + plugins/imptcp/imptcp.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/plugins/imptcp/imptcp.c b/plugins/imptcp/imptcp.c
> +index 838e1648fc..90a7d6f7ed 100644
> +--- a/plugins/imptcp/imptcp.c
> ++++ b/plugins/imptcp/imptcp.c
> +@@ -1009,7 +1009,7 @@ static rsRetVal ATTR_NONNULL() processDataRcvd_regexFraming(ptcpsess_t *const __
> +         pThis->iCurrLine = pThis->iMsg;
> +     } else {
> +         const int isMatch = !regexec(&inst->start_preg, (char *)pThis->pMsg + pThis->iCurrLine, 0, NULL, 0);
> +-        if (isMatch) {
> ++        if (pThis->iCurrLine > 0 && isMatch) {
> +             DBGPRINTF("regex match (%d), framing line: %s\n", pThis->iCurrLine, pThis->pMsg);
> +             strcpy((char *)pThis->pMsg_save, (char *)pThis->pMsg + pThis->iCurrLine);
> +             pThis->iMsg = pThis->iCurrLine - 1;
> diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
> index dedecdc572..bcc66167af 100644
> --- a/package/rsyslog/rsyslog.mk
> +++ b/package/rsyslog/rsyslog.mk
> @@ -12,6 +12,9 @@ RSYSLOG_CPE_ID_VENDOR = rsyslog
>  RSYSLOG_DEPENDENCIES = zlib libestr liblogging libfastjson host-pkgconf
>  RSYSLOG_CONF_ENV = ac_cv_prog_cc_c99='-std=c99'
>  
> +# 0001-imptcp-guard-regex-framing-match-at-line-start.patch
> +RSYSLOG_IGNORE_CVES += CVE-2026-19654
> +
>  ifeq ($(BR2_PACKAGE_RSYSLOG_EXTRA_PLUGINS),y)
>  RSYSLOG_PLUGINS = imdiag imfile impstats imptcp \
>  	mmanon mmaudit mmfields mmjsonparse mmpstrucdata mmsequence mmutf8fix \
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
