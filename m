Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E86BC43327
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14A1561077;
	Fri, 26 Jun 2026 14:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gu-TaJg5tUuH; Fri, 26 Jun 2026 14:55:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EDED61088
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485737;
	bh=1eDfTRG+DGinW4OO4jgdzX4FEAC62B/JF8nXXYtKX3Q=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UAxZ2Q/j94qI13W5iNt8h1ToNhDUdjNTdIT6E3Go7Sv3aHAj6TdyQ/1mfxfg33hhi
	 KxB3Ulu1q4dqFnJMtTi9a15FzShqCzUoypN3UxNFAQj262nMo/gPrL+O9emsMg48E/
	 beXyrnZ2FX209i2gxByYK2SRSXWkIUc2XZ4gZuNOmg3M/S0KGOEWV0vucVIvQ+9SEr
	 S3R8Dkp6HLmb8HljiyenchpXOPN6GlC4PzW5nFcMGySBlcj8pqtolCttExaHtUrCIZ
	 pGiXcrAu71LwaWpSltChb9/VVqrQVnbtI624OFc+xnMzlhcX2SXoZUmmB76YbeIIBw
	 ZgEeQaRSxMZpQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EDED61088;
	Fri, 26 Jun 2026 14:55:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D1163A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AB0860FB2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OpMBzn-rQRWG for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:55:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4FAB660FA9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4FAB660FA9
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4FAB660FA9
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:55:30 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-46caaa805b2so680746f8f.0
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:55:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485728; x=1783090528;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=3kK5ZW2oDApIYZdqcBi4y+N5xRkpbvnj6I96JmOova8=;
 b=Hygl4M8POv+EphNqMG1jN/2hSvvYUhcGTxjdSmnLoVXU0iRMR8pKmlSscj0tcKqu7i
 C2TWLJ/1tUT+PRgUVSYH5sgMs22RtQyosPt/z3ySg7hKzk75cqCBUNZSZwPwQ1Fkd13z
 uMgMZu7yayNz3rTcZj8GQkAJ6T5r/lbwvSEYUodtv4SmDbzDhOR5ZBVO3xUwAEkHq1jO
 mcqUpg0L7lE+0Tp+iSw+xWI3rhsfjcQ73F8srlp5zz9g+JmBw3bJqWbZQAr5PP1BPdWE
 HQFG6Lfy+lPbnix8m3u5nr/cuLpESgBKs7ec2LnMNsFNE0iUsBo8JPNi3Pem4lSI2aKa
 6FEg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqx1JHxcaNKRVX2eDhTMzbnyD19c6VyRrWcrMjq2u7mav4a25Mlb5Qcm1pN/ob1USlsolbLNP2CCjU=@buildroot.org
X-Gm-Message-State: AOJu0Ywy2BV+mk2AKqlXhHYSdueVAxYT02D+TaWKdp/q2cvcCvUMBku+
 XNlah9rwJ0qgTy+1jXLtNH9HCLkRX98S27RK5wrSqLXOFiPnbEgISQIiBn3rCnpmT1x7zVdwlMn
 EhRcW
X-Gm-Gg: AfdE7ckr3DxSJuZex7T3lZyaeB8QNBRLUxoLreyzHHjEEJPy9GR7sC8fVA4XBeywIlb
 F6wplKa1M5GoFnM547vzAUxKqTriaiqI6feFvQjiuGrQtTqw6865Oboh3Fb0sqvIrI2zGPa3c3Z
 JzLFQOS67feuBJIRa8TUa5Fh8LLhLfPvLXybTCDrPxOWsX9obu5at/fsnOMc6WpCtpx41At9rHj
 KWBs2KsHl4UrRpEh6EaGClOZ/a/n4xZLHM1xu6eLz/WlhJxAjdf0dEg2EInhSraEtlw3FIQYaF2
 uFSSxem6pDbJ8NJKTcieNxlz2wyOQ1XBEQWscaE3Z1s+OvLbQtBCRa53+7bd8Z1+dnNlzGc0GuV
 VmXVpoSXFwUhNWIrxzywthx1v57IFE9yErXlPLHHHJrXSlOQuOtbfKh4tDy4ruHFr67BFxxEbsj
 AWFGDy
X-Received: by 2002:a05:6000:470b:b0:46d:28a7:3ce7 with SMTP id
 ffacd0b85a97d-46dbed35effmr10940153f8f.7.1782485728273; 
 Fri, 26 Jun 2026 07:55:28 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46f4ffc11d9sm4696186f8f.37.2026.06.26.07.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:55:28 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:55:27 +0200
Message-ID: <20260626145527.343004-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-24-peter@korsgaard.com>
References: <20260618124835.2935850-24-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485728; x=1783090528; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3kK5ZW2oDApIYZdqcBi4y+N5xRkpbvnj6I96JmOova8=;
 b=TJEh5mstrfX4uHy/kYWjCdhMgOnacG+ja9Q9KYgYiki8gmkgzQ9/Ktl6FNlOm9I1k0
 f9YefZY6Efqjj+k8RdeC5iyw2Bd0icHX7YHa61qJ5BgtEMgjTMvvMPji5pEM4BLkEG3K
 gcGJ0vUpc+fHfDrbsGv5sNqb2azJfqEV5cW99N1ChhqUaE9xGmW8G2ISQJB1Kg1aIf+h
 fk5VWYVIvrXQk2ItF5dIbnP5PouSVOCZAegAkUlJ2SWD3kTdHk3h3T8qpR/7veCobbR8
 ZLc2ZwwFei2S22KugNZRcbhRbLWl3YBfEYKNPn7mInjALeKcJPzyR0UNOxBGek9DioTr
 8SRg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=TJEh5mst
Subject: Re: [Buildroot] [PATCH 24/29] support/testing: test_rasdaemon.py:
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

Applied to 2026.05.x. Thanks

> ---
>  support/testing/tests/package/test_rasdaemon.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_rasdaemon.py b/support/testing/tests/package/test_rasdaemon.py
> index ec29f1785b..2ae6fd2c28 100644
> --- a/support/testing/tests/package/test_rasdaemon.py
> +++ b/support/testing/tests/package/test_rasdaemon.py
> @@ -43,5 +43,4 @@ class TestRasdaemon(infra.basetest.BRTest):
>          self.assertRunOk("/etc/init.d/S95rasdaemon restart")
>          self.assertRunOk("pidof /usr/sbin/rasdaemon")
>          self.assertRunOk("/etc/init.d/S95rasdaemon stop")
> -        _, ret = self.emulator.run("pidof /usr/sbin/rasdaemon")
> -        self.assertNotEqual(ret, 0)
> +        self.assertRunNotOk("pidof /usr/sbin/rasdaemon")
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
