Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5E01C43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 718C58244D;
	Fri, 26 Jun 2026 14:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id luW3z63U-sBK; Fri, 26 Jun 2026 14:56:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96E1082451
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485778;
	bh=Lyoi2Uk2KX+o0DkBLjGSVAAJ2iOhN8bDt7qb8iyCCN0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=R3IoYssBHQm1uLO0W1mPr20oG+c3B3IKc9uioxh/kpSd9pOng4uRxjH+d47sPxKWz
	 kTP6+O4urEpOyT1tTLpsSkF77cfoPONtd6HnQy4TugNtOW6EO/VWafIIEm68MfZBor
	 Tt3Tb9IraFjaYzYFfLsUJhCoNFHkBCN0io2eK0xLE5uGkC79HY+Xqcx6/IkKJB0zxw
	 NmLT88dPTnNVIEbLwIqnn7HrMyWV+GGhX2UXre0gAIwI+zE4L9s3YPWtq6OK+7buOd
	 ZQuoo4KVxkwzlWDNXBbpbmAeq9y+UhP6lsNw/w+TukRRocda0ZPypWkDsm5XjN0d69
	 GgfWLcznQFszA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96E1082451;
	Fri, 26 Jun 2026 14:56:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 04DF6231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE2CC610A7
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zLlgFInHlj2Z for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ED34E6107D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED34E6107D
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED34E6107D
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:08 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-46e30429b10so676473f8f.1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485767; x=1783090567;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4BWgl4KVQd3shPpaRWtkyYicqr3gWPk01nKOESaFtqg=;
 b=Pu01pJU4aHKkKCFahL+sGqPL7j/BYrYPrX82mBBKCwSOFbjSgvolb+7hzPG4g/Jb+w
 V75mHfboWGZqxjZJ9xRf3hWttuHr0UaeTZ7jlBMxBlMEv+0hFMCb6k7LiliTcGNRHqG6
 SZzdsZlSd0glDY4t1RqgOq1o/Lrdh9rzO3vSan39biPpmh9j9woBYJg16S2EiupgrZtj
 179orJeaKDVOk/HkE89/+Y4hRMMzqOAZMkPH5t1TLvXUxHw2YriF0Y9bLdNTAzzxc63Z
 jXBScHBjMfFBMD+uyI2bESWYu4xrK6zxr3uu3Mc3+uwHcz6z62879NhG+t9VIsifPm0A
 yL1g==
X-Forwarded-Encrypted: i=1;
 AHgh+RrlnJuPBayiRyWXnKWQ4PWHJ8oHSgciAccpEfXWTMx0KL0/mEE7rGwCKNMfl0v5Qky47TuhomSUnqU=@buildroot.org
X-Gm-Message-State: AOJu0YxJZcsEQndJCcp6SM51bXHNJ2/lEN4XQFcnK/HWzIY+4bvADukf
 keJWCbBl1A+SNywenMP1nKlDAjT2WLmY8cK0LZy2a/g/dr1uvkzFHVlnF2A9PeCJDPI=
X-Gm-Gg: AfdE7clA+9arRfFmgeoDZ5bA/o5UOfgMXv0bxXoW3fGeDbp/KjLL8PtfqXwr719yryA
 TeN4jMZoXf6CYbF4YdcBUtlfeA45Glg0n1Pmp9PnREf+7kFDLf9WrEMSPN9P/6aSlrJfPTvwWs1
 0+1CijrU50ToZZGRSdOd7JfrG1soSxtJDg3sfbe0azspPUi8bf6dsRTCCgvtNSXQkBcp5S8C6F4
 4qRi8n1wfWJ9ayfr5ePC+vL5E8StasIH+1lDXUiQdb4XlC11FmiddsAsb4ahLBJg0XGvPCKnyRO
 IGlkejxnlfNkHt4YkzFp/LiA2zg3+UhoGMrVnlt59zzTG+PgTXxTD8Liiz/4YSpy8XadXD7OKLV
 b8OFPeHlKzYs2vxgVyP8DAhF9Hj4Wnu0SGgOlVmhhRKXDbpQsdtMdnPD5Y3qsvOJv94cVafbfO4
 511Kb7
X-Received: by 2002:a05:6000:4308:b0:46a:44e6:6f0f with SMTP id
 ffacd0b85a97d-46dc2b0b567mr11515388f8f.35.1782485766889; 
 Fri, 26 Jun 2026 07:56:06 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46c1ee0189esm26650183f8f.9.2026.06.26.07.56.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:06 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:06 +0200
Message-ID: <20260626145606.343866-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-3-peter@korsgaard.com>
References: <20260618124835.2935850-3-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485767; x=1783090567; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4BWgl4KVQd3shPpaRWtkyYicqr3gWPk01nKOESaFtqg=;
 b=Gr/6UmJfliHpiW/f+8gyHMUVehOggWnYbWocO3R+KqOFzcf4ECOno3ks2wZGhDlbfF
 MG1bK0ohRh5p5JHuzjExNbuiXLMRHxRSt9gcIf5DE9tfErHPqRcDvQJG9o/NM3yvjbyS
 vlElh1+JSjuchR1K0JWZun9KvLfxkIhr9lXKhFfcmLQvntNvwfqqhMAz98ZTT/RmqPJ7
 qQGrIhGEpX3eJPI//sng1wCbgHcGdeQ8zWVzwOJn3h+6A5QLxJsBrIG0Z868RpSWECV3
 Dp9yd2O5TtlREFsiabbBltKN2pKi65qN8oPAcuOLgF6yOINXK7CPQQ1s/I+tLw9k0c3H
 5/XA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Gr/6UmJf
Subject: Re: [Buildroot] [PATCH 03/29] support/testing: test_acl.py: use
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
>  support/testing/tests/package/test_acl.py | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_acl.py b/support/testing/tests/package/test_acl.py
> index e4827c7bec..4511c6db5b 100644
> --- a/support/testing/tests/package/test_acl.py
> +++ b/support/testing/tests/package/test_acl.py
> @@ -52,8 +52,7 @@ class TestAcl(infra.basetest.BRTest):
>  
>          # Reading the file as the test user is expected to fail.
>          test_read_cmd = f"su - {test_user} -c 'cat {test_file}'"
> -        _, ret = self.emulator.run(test_read_cmd)
> -        self.assertNotEqual(ret, 0)
> +        self.assertRunNotOk(test_read_cmd)
>  
>          # We add a special read ACL for the test user.
>          cmd = f"setfacl -m u:{test_user}:r {test_file}"
> @@ -73,8 +72,7 @@ class TestAcl(infra.basetest.BRTest):
>          # Attempting to write to the file as the test user is expected
>          # to fail (since we put an ACL only for reading).
>          cmd = f"su - {test_user} -c 'echo WriteTest > {test_file}'"
> -        _, ret = self.emulator.run(cmd)
> -        self.assertNotEqual(ret, 0)
> +        self.assertRunNotOk(cmd)
>  
>          # Remove all ACLs. This could have been done with the command
>          # "setfacl -b". Instead, we use the "chacl -B" command which
> @@ -83,5 +81,4 @@ class TestAcl(infra.basetest.BRTest):
>          self.assertRunOk(f"chacl -B {test_file}")
>  
>          # Reading the file as the test user is expected to fail again.
> -        _, ret = self.emulator.run(test_read_cmd)
> -        self.assertNotEqual(ret, 0)
> +        self.assertRunNotOk(test_read_cmd)
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
