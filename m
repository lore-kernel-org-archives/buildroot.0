Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91140EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:37:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 643ED846BC;
	Fri, 13 Feb 2026 19:37:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eGmXPSUYjMBI; Fri, 13 Feb 2026 19:37:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7D33846AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011433;
	bh=AiqcNyLGbBsfUZ7MnVs/4tIsQxU4ofRWEvwB0lV2qoQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DI7859zt/hON/brVkBZEcXQBY4l3wiJ3XUc3LFmcZzLn+QlfQEHPQ7CUfpFISSCI4
	 4E7CUAgjhhT2gX/bOnOUMN5qKoqvK9ZZJlM40Bx4UXSx7vJCnlZjt1mc8h6KVg1CCB
	 juuz38h6dzjhqyxexIyJnsxB7ITrRehPGDcokJ5vm1PyrLP1+hoQivsdC1w/15wfrp
	 7+7YtEV3Xi7mnxhO3TxA80SEBbS3cw6RvpUMYWN5hMRvGucP7DZtgL/IZpzirSaws9
	 hGHsqlif4guafaDV5QT8xRNE/xjXjO88Pcm8G8TAe/qTNEt70UA57QEmU86Ry9ZSPk
	 FnLbI9EegOv7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7D33846AB;
	Fri, 13 Feb 2026 19:37:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0311D69
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAEB084674
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 19bQSYlQdgYD for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:36:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B4A4F845C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B4A4F845C4
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B4A4F845C4
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:36:42 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4801c2fae63so10809235e9.2
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 11:36:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771011401; x=1771616201;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wGcbisqYD+vqSbCC+P22IK/DNA63jhQXPGlgsVn+VtM=;
 b=ifuVd70xRwQTLVpiQeWZkgMWsSEyLfq2rQ091ICbKsp3/QR3CGbbyUDHsYuHAtSgt3
 DsivQXvtqcUZl3eBNb7Kxeq+z+COxX4OncR8xaPr3Jwl20EqsuzgbcCL4tHSqxXUmTnS
 EQTj6BzMf4WokfvsCrlS8C7iOgNHiXO4/z8z0XgQjjxy4ydew73tKfPjMBtzAAdb0e0F
 PH51Pehdkn0N8UqrY1bIe7xe8Gn8pIvmdSr3yguDG5Vu9ywaOjuCeBNYSc9VqY1XfJud
 9Fn2Dpog4ImoQFPLeMD2f/4Cw0/hoGM/EAiHtrXe049ZdmcftJGlX2cmz1G3oLopjEjQ
 v2HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1bJhOgbn7Na64CWXQLcV6p9+b0j/o7Gor+so/ESCcaZfLLO6Z9zrbxk/OhvMyNfLeqv+FZlWtG6g=@buildroot.org
X-Gm-Message-State: AOJu0Yw5i/KtB7r+9iNX50WjKTS/43uIZcrQHUUSd7gWNrHHWHXYrfqW
 1wYBHvAffxUMQKELG6FHqsAExaNOM4eYRI74cO5B8TLHQhRZMR8sR0XbKKt/Aj0FMOE=
X-Gm-Gg: AZuq6aIab1mYvSjkN/9ZfNIw6yaFQD7McJQhplTVPZI/1RZYgayU3X6PoVuS5yDsFK2
 a46cXD3l4auk01YReGDG+n+RbYtZEsLvTkbiG27ClkLPDmKdIazXPAeI9E6qpJ3QwGwugiLKtS6
 9lB4r+p2+H5pkGqQW76erM/yAgOr6Lr1wDE9cNRs0hrI6QDFk4l67cI2wDPnD1QYSpoSTjSVovn
 JBmDiYrJIZiBIE9D2xhDWW4jRosrsmQaHTCS3Gwl/hL4RtcR2pqJAOfkwWXkI1MTFkF+vWMXTDh
 i/sebWvT/naFWPfWWzFPDLLy0qb2PvK4Tyt9i6rpKre+YmpWDJs78LPPMIo9CRjh+VyTwHPXkWv
 ntjrZ/+q79D36k3QZN0OarA3pmSlVUcczoJsfEa8+SAaUhqbGT7JaM7g9bANcPoZqgwKO/VP2wQ
 ThwGq+s/jO1Xn07gE=
X-Received: by 2002:a05:600c:3b8b:b0:471:14af:c715 with SMTP id
 5b1f17b1804b1-4837104307amr78059895e9.3.1771011400685; 
 Fri, 13 Feb 2026 11:36:40 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796ac7d91sm7892527f8f.26.2026.02.13.11.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Feb 2026 11:36:40 -0800 (PST)
To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 13 Feb 2026 20:36:40 +0100
Message-ID: <20260213193640.37783-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251120123703.1371644-2-buildroot@bubu1.eu>
References: <20251120123703.1371644-2-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771011401; x=1771616201; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wGcbisqYD+vqSbCC+P22IK/DNA63jhQXPGlgsVn+VtM=;
 b=MRKYJPYYXKUuXDJoVZ2yqQWMOp+zhcr0gxlZI9P1o5qonGRck34pWi1RYXcSSLzoHf
 Jpa7fzn9ij/+qm0GID5nUzENhM+pdvUdz1Y39haunEgOU6k+vsmYXb9P1FGA0u0LMNU1
 OO/S7sDPFiTYSGRaRxrqIXd95SugT+pOtjGItnseLFWFY3oRldOW5qJEDasD61f6ynYW
 J9lYAA9vPluEWxUUzpldu23yCCtjDo6AHcUuWiZ2IrWlLCseaNDnmanFzDek/VeBSVOv
 SLo1CRyXTdblsFWnnlaoDeb8yr8LbUJnUUdiIh6G5pUvc3/VxYHkE32+ZHh1jvVjkqEx
 eiGg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=MRKYJPYY
Subject: Re: [Buildroot] [PATCH v2 2/3] support/testing: fix
 SdbusModemmanager/SdbusNetworkmanager duplicate test name
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
> Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to 2025.11.x. Thanks

> ---
>  support/testing/tests/package/test_python_sdbus_modemmanager.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/test_python_sdbus_modemmanager.py b/support/testing/tests/package/test_python_sdbus_modemmanager.py
> index 34ab66e3bf..58e02f99ef 100644
> --- a/support/testing/tests/package/test_python_sdbus_modemmanager.py
> +++ b/support/testing/tests/package/test_python_sdbus_modemmanager.py
> @@ -1,7 +1,7 @@
>  from tests.package.test_python import TestPythonPackageBase
>  
>  
> -class TestPythonPy3SdbusNetworkmanager(TestPythonPackageBase):
> +class TestPythonPy3SdbusModemmanager(TestPythonPackageBase):
>      __test__ = True
>      config = (
>          TestPythonPackageBase.config
> -- 
> 2.52.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
