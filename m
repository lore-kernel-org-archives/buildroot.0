Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF006C43458
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8424341200;
	Fri, 26 Jun 2026 14:56:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wAbfFKE4MIjS; Fri, 26 Jun 2026 14:56:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAA5941210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485788;
	bh=s/q3FREimFlNdkRvTLp5NMBomwZnpkCAl7XEs1TwcOk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=WZLunLoQt0mbwZ2NNr55dg9UnYRTDKX+SozXQEXSx+fxnwgeQHUHy8Z5Eendh/4SP
	 pkFKQWGAk/uP9rSFKX6XiYnn06jemxROMqheuMNy1a1HTN6p1pqQtt5YQRKGKNAb9G
	 Pdjn/8RESJqzxeK6JwRCBQWSxfp2ED3p8e0zYKyNUA9zzcq9N2/RKvqnjlTAk63ERA
	 HG2WJotTwweEwXtYEQP//HWl5VXJn7VUPxinquBJ0goziIH+UMLMDkOZ2Kop9YGizd
	 n0iDTbDjs4LaonVcJxlodMnubs6F3sjR69f5I60KR6L8rVeP9Z7jktJH1b9THU1BP5
	 AoOiwIhSI6ArA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAA5941210;
	Fri, 26 Jun 2026 14:56:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E817231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 645B74070B
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gCGt2k-cG2AV for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3C82940702
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C82940702
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3C82940702
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:14 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-46cf972f281so598206f8f.2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485772; x=1783090572;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=82cCbFDkBKuU7aNED1HkxMvjRp3ch431QbsgG1f77pg=;
 b=I4VW/oog+wWcDYC8Tu32fxm79gDspy4H0oW3BlTcrfvuq2WU2IBPDArRYIZm1GO2ia
 fXXbzago8XohXe4ufmkfdpCja7/Z13vCNE8qcqfdGVbm2ni05Ot7NTlFXbja5uUyNGEr
 7X85g0uTupg7UKP5IvXS9goah6Fvg2hS5k691kUzVDEHSsE40kwLW0obaVmD02Mde5nX
 fEqqVZ3KZ7c68ALgzsgSwqsKuYrl98W/XdTZj79MeW4lPhbetbRDVRq4LViDbIgtRxi9
 EOWe2NdASj2IqSK+FVFoo9QwQXxkXljvXKpf86hcda83nn/7yBklx8CskWS8rvhbnDOs
 6vfg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoC8jx+MXPodp7er86WKCTavvc2BZ2yKv9lm/XNOvES8Ej6RGouoA/UchiAT+P6BireYo0/fkNMqzM=@buildroot.org
X-Gm-Message-State: AOJu0Yyfz3sEhFrINuEiSp1T6Kac2+NXchdCWwse1+jXqYiWBk4tGTi1
 TgLr2LYmZx5nsqTms1pF7+i5LLiAbBgpm/L3ahHF/LXFqf+lcrLNuhbRpKphe93Zs+o=
X-Gm-Gg: AfdE7ckTUKMpa6u8tExmoZ6fKCeAbevlx6JH5LsYulJAx0/N/o19cZn9PFobwgL80XB
 yLiKgrDVDrPhnAjUKO21YlRS19cFSBYGFhqugy/AfBaeazksX3Zw6Gp8lm1O2LyGAk4Vxxozo8q
 zA+zIkaItJAHKdqZl48rsIdaMqGJdzY8Uo+xngtT13GV3N+7avrnBvkQo5yG9ihDlJv7thxj8m6
 nQQRMYdkCip6xTlobdmOlvpI6tKh7yslLf0yfjjcLKDO75DQVjsfFwWI2kyYD67zI/Sif4F588e
 z7ZUlJCG7NY22gov8tpGdx9nw8UuurmK37F8XzGue/0wGgW1VnavKsEhRrR7PhEh9c1ip+832fH
 vWAfxKK4tLk+SLkGnNkvcw2RLfKfjYP/pjN+zUvRIvAkkqCGUOYmnO6ioyyW/+EQb8M7/4D6k/e
 SfjF3t
X-Received: by 2002:a05:6000:29db:b0:45d:3aa3:7f76 with SMTP id
 ffacd0b85a97d-46dc14cbf6emr8395144f8f.33.1782485772042; 
 Fri, 26 Jun 2026 07:56:12 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46dd5f9da4fsm16870139f8f.23.2026.06.26.07.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:11 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:11 +0200
Message-ID: <20260626145611.344193-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-9-peter@korsgaard.com>
References: <20260618124835.2935850-9-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485772; x=1783090572; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=82cCbFDkBKuU7aNED1HkxMvjRp3ch431QbsgG1f77pg=;
 b=WfEoJZ2G4sSGcDzphltpxw8yp0ZxdFdb4FSVAGR/+1orckeBuTxEg+9Iiq+u+zz7H5
 ywvOEC8+wUgUlf9rs2V52YnA3mBTU5kylNELXJ6vK4lDoKDtrwuQUVPGCrseIbIunVxj
 9xtmvuSGWuKDxjjMfX2dyO3dxLo9GbiLBMJbHmK+Z+fR0FABZQAhteOoULAEcefyhWld
 vMXiYg5Ee6nfWl6uw/dyR6unRmJ31hm+Q7+HGBw6k1xsjzBudR2p3jamo5rpkmZYqhdc
 Ppn11WpfQMOU2mvTFJEf14tVwPrIz4HCSEV8ocD2lWqmVsBHKt4hwT/NoADVrhKn3Z0Z
 j+qw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=WfEoJZ2G
Subject: Re: [Buildroot] [PATCH 09/29] support/testing: test_dos2unix.py:
 use assertRunNotOk()
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
>  support/testing/tests/package/test_dos2unix.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_dos2unix.py b/support/testing/tests/package/test_dos2unix.py
> index af5850ae3e..1c0ecf5967 100644
> --- a/support/testing/tests/package/test_dos2unix.py
> +++ b/support/testing/tests/package/test_dos2unix.py
> @@ -32,8 +32,7 @@ class TestDos2Unix(infra.basetest.BRTest):
>          self.assertRunOk("unix2dos -n original.txt dos.txt")
>  
>          # DOS file is expected to be different than the UNIX file
> -        _, exit_code = self.emulator.run("cmp original.txt dos.txt")
> -        self.assertNotEqual(exit_code, 0)
> +        self.assertRunNotOk("cmp original.txt dos.txt")
>  
>          # The "cat -A" command should print '^M$' for CR-LF
>          self.assertRunOk("cat -A dos.txt | grep -Fq '^M$'")
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
