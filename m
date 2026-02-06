Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDD1CEB28E2
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:12:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A86AE61208;
	Fri,  6 Feb 2026 08:12:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sU2rChgjmHKz; Fri,  6 Feb 2026 08:12:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 425A2611FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365521;
	bh=IFWRPBROhrgKVeEuOTDNhEPvxNhjim6bEKF+Gz2wQCo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KxKVIDQczBPOAIJIGSvsb7v4GGnK9wiS5RI3blBtIjfWxG3DZg/5XySKo7pjgT4va
	 +Ve8kmKkz3RBy4BTR+O6s8YKRQNpa7suwBiniVqnh4ilFX08jxlY1+4I5AflpCwfEw
	 KmGdN0p6HmA67688yZS3RB0OonfO1WTZCknMl8zsJRkjU9LJ0pmFN/J8he/Qnp3VBw
	 0yqEcCK030UFLSU66WfZ/MnCgOwrWQQcwe7HPobA6s/IG/JinjuXxxaO1jADIynLrU
	 DtfPZyiT+QsVP/Jw4HkbNCuzg3JiEy8HjMwkqmAupjOBIn3St+NaocgqyKOjfOlAR0
	 SjQPfnczFpx0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 425A2611FC;
	Fri,  6 Feb 2026 08:12:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E0001173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C537D40A1D
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wgUCAyTXG2Ps for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:11:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 94960409F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94960409F9
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 94960409F9
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:54 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-4806bf39419so16974845e9.1
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:11:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365512; x=1770970312;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=uiLJTJE5f2uYR31TM+9O8iBltim2nzSDZAsabXhEWpg=;
 b=wUdIDfgri4RNo2aBIq5d+TgWZEHvRSdLqDnfqFylAfq76v4glLzdzSJvurY7YGhp4v
 53N12ETORwf+EbEUEbicC1ghaJrOOhyhVe0hM0B6Oz4ILoOTD+klNRVpLk2IY7HPmMU6
 rwixF2BG/0xSBD1Xd0Ba4/wTbrYxapKwlwU8GOpQo6o3MT+fLM0qa9nyk8s2IOMspKn4
 EM6wpq1yRNWcOA4uRP+gKeRvLGV8zMfXKokPyoZOpMLK4NjB4aEL6pbBrqphceV6X60v
 QaBXjQV/OBhLW+kJQdrYjg1IMg3XLmEbQkr209/xN/ThTCf7T/QPOGWMATURMHL5L3DG
 5BAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVeqxdRfgtQUs/zIWxv1Dq50HzC6B8aMFLurHEmMc2Vn965nFLY5ZYULQc5neZlJqc0Z4R4nJPvCxE=@buildroot.org
X-Gm-Message-State: AOJu0YyczLir3IKKh29xn/eZHQVVKMIp3ARtCmxydEMAXpEPZNr5jtWM
 PyVRVMJ+4t5H5Pel0O3QvbtmC4Nm2rYP2NdvmcD4tH3s6K72qDEbhX0QHeGugZPirms=
X-Gm-Gg: AZuq6aK76Pf6ZAiweaCAHtBZgTJ19aN2x6kfP/hCRhAAOYI1ZAGVzvE2crODILIDZJU
 oKQtes6fWwY64YB8QYIeOYi8jlr2FZc8APexmAoRwCSmE6oYJNgHHFawc29SpA07Sl//P/rpJSo
 Hf0v4uhhOEejSGAZhd7vHa408BJGyXjJoMqsmZbvE4xe5Xw290ftUACNSK11Rc1j8QDr3qgTS22
 KMYo4E1ftJfKWbPpbttm6Pwh6BgbkSBr+cwynWgzhD+xofN7JiSvuEk4SC7Rrgu8G/r0TYMzqiA
 3g5bOz+i/DfHZHD3KcXX0o2rRS73MK1MLxbDpcGumTT+wUenr6bYJGd6dW3avt/scAiZ9oLhUXv
 K3NEW7QQPF7FhXPEQrWf45N6L62Rasg0efMRuWwELqRtjOgEKDtoqafhSxd/GO/Ji4oosuUF6oH
 azgMY=
X-Received: by 2002:a7b:c3d5:0:b0:47e:e38b:a83 with SMTP id
 5b1f17b1804b1-483178ebf8emr50608535e9.7.1770365512533; 
 Fri, 06 Feb 2026 00:11:52 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48320719bd2sm33265725e9.11.2026.02.06.00.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:11:52 -0800 (PST)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:11:51 +0100
Message-ID: <20260206081151.32243-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260119103809.2880459-1-peter@korsgaard.com>
References: <20260119103809.2880459-1-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365512; x=1770970312; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uiLJTJE5f2uYR31TM+9O8iBltim2nzSDZAsabXhEWpg=;
 b=Et0c4R6PvH6TRcVnMjTZr3Sg3jiVaS45KvLB+o0xNAkGVTssylAWf2lvmZCi3Ha65Y
 yDkphyXWjOmRPzTUAsLk0dsuIFQKM8V8Dt2y+5Q1iJzX1y++bzSMo9E0AvoGWmd3BIc6
 +8hi8DFQcXlYEIELIiYg6j92u5YdjcpPpPdeILh5PiClbHzgZb2kDOn6xyqoEKL11xEc
 yhq7rP8GO7WGQLdHDlj3yQIU+RIWsu+bnUKG/ACuvqnDb5Emm8UU/YD47hXosnc9DG/w
 hfthtugOyoMVMARzksPbdHXbt0RVNioOhsQ25gMqIuP6VEYXUhqfgyMUb4HVgy3nYy27
 ybYg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Et0c4R6P
Subject: Re: [Buildroot] [PATCH] package/python-urllib3: security bump to
 version 2.6.3
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
> CVE-2026-21441: Decompression-bomb safeguards bypassed when following HTTP
> redirects (streaming API)
> 
> https://github.com/urllib3/urllib3/security/advisories/GHSA-38jv-5279-wg99
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/python-urllib3/python-urllib3.hash | 4 ++--
>  package/python-urllib3/python-urllib3.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
> index 76fe4e5fc9..858b8ca3a3 100644
> --- a/package/python-urllib3/python-urllib3.hash
> +++ b/package/python-urllib3/python-urllib3.hash
> @@ -1,5 +1,5 @@
>  # md5, sha256 from https://pypi.org/pypi/urllib3/json
> -md5  838e0ffee00ec870a3ba6727a7832ab8  urllib3-2.6.2.tar.gz
> -sha256  016f9c98bb7e98085cb2b4b17b87d2c702975664e4f060c6532e64d1c1a5e797  urllib3-2.6.2.tar.gz
> +md5  2c381874816fe551f50a2551abae62b3  urllib3-2.6.3.tar.gz
> +sha256  1b62b6884944a57dbe321509ab94fd4d3b307075e0c2eae991ac71ee15ad38ed  urllib3-2.6.3.tar.gz
>  # Locally computed sha256 checksums
>  sha256  130e3a64d5fdd5d096a752694634a7d9df284469de86e5732100268041e3d686  LICENSE.txt
> diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
> index d57473566b..7f7f0b03d2 100644
> --- a/package/python-urllib3/python-urllib3.mk
> +++ b/package/python-urllib3/python-urllib3.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_URLLIB3_VERSION = 2.6.2
> +PYTHON_URLLIB3_VERSION = 2.6.3
>  PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
> -PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/1e/24/a2a2ed9addd907787d7aa0355ba36a6cadf1768b934c652ea78acbd59dcd
> +PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/c7/24/5f1b3bdffd70275f6661c76461e25f024d5a38a46f04aaca912426a2b1d3
>  PYTHON_URLLIB3_LICENSE = MIT
>  PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
>  PYTHON_URLLIB3_CPE_ID_VENDOR = python
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
