Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3468AC43211
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09E2C6112E;
	Fri, 26 Jun 2026 14:56:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W3kSDSPYcIq6; Fri, 26 Jun 2026 14:56:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3ED4E6115A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485802;
	bh=5QaDpHJvrRqEhwKFmjudpolnr3KdEyGaQecqXCB8q+Y=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZJn19XsTdxOVJDAtlyYAGs5T80W2HmBuhnWlgu2XpcDehL1ktjy+4JVesM5vki8gQ
	 kgNNTZVsWx1qoZ6ICzstxCUtpk/F4XyQwKUdnPAam3pcjIqcICEazzr+fQvN8G1Yh/
	 xRDKji5KmmeYnVMnwv1IDE6UDtZyPOwMN5QYG+Ncj4sbiSACT2HL/Owl2lj6G4z5JD
	 rs8U6odfrEXvJtGwpArOZfLzsEjyInrkDDU1A3yI9qPM8HulOqs+P8V7GRyTazgF99
	 hPxl/BRdfKYOfsSsGdGsZ6rULKhzZqzZT6pF74TrNln+EpJY/+vrB7N9dmcNGuMjs6
	 ZAz1TRbgFaU/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ED4E6115A;
	Fri, 26 Jun 2026 14:56:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id DE82B3A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D081A61108
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wu3muvQ1lM7C for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C642E610C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C642E610C3
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C642E610C3
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:24 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-46fe8fabdc0so48194f8f.0
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485783; x=1783090583;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=1o74BHh/tw33x1+AT+dWDTR6Q96qWgn6j9FF+ogUrRM=;
 b=WZyEUfzij2t8oZbbrJsyB/1yogtaHDJbIsPUXYbzlVeVHWzUV1ul6iatPBRWCYUBuw
 yxoVJJjAqXHX73W7mhGKMig/Kq1+qi/pcat/gG20lzvWHIF7LA4D5cC0Z5mnVF7qkxiH
 LSat9b7brgK4xP0ekfsYl99fZcPnGj9KeE0ZstsArrCidGeB0iUeln7epInWeJGwjAHW
 jo6ACSz29dSzmB4SetkrAC+4IkcU6eegj2hAGd2aDSgOy2/ap8SKoXELP/Sa6PW+6mpd
 vbvJTsYwLngaHZtkHQxQ7yQJG4wirHT3/tJsx+1xPGbQ/pnhBMyd9RDcL8/oG4c8II7Q
 Au5A==
X-Forwarded-Encrypted: i=1;
 AHgh+Rra4/qynvjJWDsP01i2i8tQ879t/6iF15a8QV/sP6q5CuqI7kCFVFMDFGFwqTGZKlYaZaap50SpRLQ=@buildroot.org
X-Gm-Message-State: AOJu0YytvWsOWybhr23eWCFcGRnXg9mccGPX9rTZQf8AkEdQ8aBz6zAo
 34Nl5o+g1ZPyMsnW0M3vJOCIGaArC6qbHV7fn/j2yrP7uKqRpN5ffqcnibgTqseA4Og=
X-Gm-Gg: AfdE7clwjCg/bNutJLsGF6+XsUvJaYEwQxbPFcAebIp05eZpMIKZU1kd7dNyWOljaEH
 9LNfy1+HHx40w0dZPIKQDpqjEyJU5eVtN/dAb91xWlUZzYTHKoSVkQTLdvsj046KjM1OmNpQPs2
 jYX4k6ZMUk1q0+atHD8Y7d9eylSYV/xLVF58u3YVii+xLhoqPAVe774UMIKgzD62GOMU+Zr707X
 expig4ArSeOqtkEhBRAaLXG+ECr0Hqe1J+zwmOV1dnZ8FNMefrKm4HZDsqbNTGNfU7dwipuc49g
 8DEkKh3Ixd+x+jkSlzFlqq0eXtFQsE9uv5z3eNEA5LPHnGfs80fBVDt/t5cXsemBp1yK8/Jk/lQ
 aVpBnNHbth65auqyQtkY42Zr4WG6kyxIfF5M7CW4GUWSctHOrOWg2YcPWsvlmfAKkqpxQ3wxzTi
 1Vf+LPFf/X4AYG8Do=
X-Received: by 2002:a05:6000:4901:b0:46d:2c51:63d4 with SMTP id
 ffacd0b85a97d-46dc398a28dmr12194078f8f.41.1782485782777; 
 Fri, 26 Jun 2026 07:56:22 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46fe25429d5sm808527f8f.7.2026.06.26.07.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:22 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:22 +0200
Message-ID: <20260626145622.344884-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-25-peter@korsgaard.com>
References: <20260618124835.2935850-25-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485783; x=1783090583; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1o74BHh/tw33x1+AT+dWDTR6Q96qWgn6j9FF+ogUrRM=;
 b=GhPyoyrmmY7l7+zXu26QfYrXJeY5r8mbLy1ynFQMb+N8PcXCsfK8iNUStOgBcLi8Sh
 XA88gHKyk6R0uOXxB9PPYXvH3syVsVZYnmh3daryVS8Um7K4s0o2dlg3ai8dP4jUozhY
 xbeIaWE0Cu6AEc2vQfA4osZyHuc3Qp1bx7vszOVVS2KI+jaSHC0NR0tovtNvRecbRpq+
 46vQs9/sNWb3GDqKSVfqxSZletObHs+AGJ3EtVWoHSZmpjPbobKJI8/1YziWppfM3fdU
 ZKCbO7gIBw1mxZDpKRLwaHvKPzhwtgqQld4IWPLjjqdoqhGW63wFgPIX/REgJT9+yyvu
 vbyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=GhPyoyrm
Subject: Re: [Buildroot] [PATCH 25/29] support/testing: test_screen.py: use
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
>  support/testing/tests/package/test_screen.py | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_screen.py b/support/testing/tests/package/test_screen.py
> index b6264d34df..977aa5b59a 100644
> --- a/support/testing/tests/package/test_screen.py
> +++ b/support/testing/tests/package/test_screen.py
> @@ -27,8 +27,7 @@ class TestScreen(infra.basetest.BRTest):
>  
>          # There is no "screen" running yet. Listing sessions is
>          # expected to fail.
> -        _, exit_code = self.emulator.run("screen -ls")
> -        self.assertNotEqual(exit_code, 0)
> +        self.assertRunNotOk("screen -ls")
>  
>          # We now start a detached and named session.
>          self.assertRunOk(f"screen -dmS {session_name}")
> @@ -57,5 +56,4 @@ class TestScreen(infra.basetest.BRTest):
>  
>          # Since the session is supposed to be terminated, listing
>          # sessions is expected to fail (again).
> -        _, exit_code = self.emulator.run("screen -ls")
> -        self.assertNotEqual(exit_code, 0)
> +        self.assertRunNotOk("screen -ls")
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
