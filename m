Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1807C43638
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA2C18249E;
	Fri, 26 Jun 2026 14:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bF4j3CHhQT0h; Fri, 26 Jun 2026 14:56:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFFFC82433
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485782;
	bh=mxUxhImxAUeyDNB1gdmzgXNIqCMczlzqsLuV8FXmfxI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YyVMxTLcjOGWz5MiAG83A0/W3F6Mu29hykWy5VwF+e6ZcDGQX+YPXYB5mfB+MEA17
	 hgpXOZMON9LTPR/FE4LsAt89hv7ryCj1IYdgr/cJmBTKA87iFzUDo5rILoOiUL5np1
	 gFcRBoMDhCG6+Jq8pVkChuiigrtUdPf6XdknWjbt9+j/EhUK+zLLYkCGuOwXV/iksg
	 zxexwZyoyQGzSleWmcwHotntRCArcFWLoUKYLl4ljoIWWpqqryTHXTf4un2lvsD50d
	 Cq6vwEU68itnU9JcypPXEbvcwYvwfIcGe4umgtgp3g+v+aFgqzDsVEVua6bVC5AO6p
	 jENk7+ebfNtqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFFFC82433;
	Fri, 26 Jun 2026 14:56:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D0C56231
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B73174070B
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VC-xkpBEPJmW for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9593740702
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9593740702
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9593740702
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:11 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-463f1165e16so1060183f8f.0
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485769; x=1783090569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=slDbkGnxHmFxX7vTAUAXQ0WHiKufAIaV+5/7zKAR/VM=;
 b=fJsuTIwcvbMjZgPyFatinkIB56aRFYCdZyZjotntbHF9AIw40qI49f6o2NO6nFUFUu
 uVvm97Q6jqLhlOZZ2l6t8u7wxlIcvg86JyUYhGpK9SjzJV1UkuJXFUd1nglpn7vRyIpB
 2WK+OJRfbVr4LNuyF51xBeUZbQSLAin0d/Q7bkJ+kl6yXH8CX34DGVopVIus/lQdUweC
 t3OUHRwGSGCke/UwGL2YZReERyfXvLvr8MJ9L4/69GL7LCArgV+CQ714Ut1xRXRBukZV
 RNsc+2jhoRoPPNJJWPbUAMFMH1CbmS+PZ41cgVdonu1y5SfJyCRfn0obTRcxGxbRS3YK
 vXuA==
X-Forwarded-Encrypted: i=1;
 AFNElJ90CwiZH8iN6teb71PWC/c2/1g2HbiHPiseKbxJOoT5qdcmEqWr7jhScOJvXxn6ipKBtVBWe8RhK74=@buildroot.org
X-Gm-Message-State: AOJu0Ywm8TaDDPGWflzXZdBLdNBDSPwfdDCfcKcP9cFdEFi9S1GjwRSb
 FhsczXTPesBy1F3lbgQu4WOhgqEAQr/PHfhag3wl9jzuQtgCKtesNlxXAIawW/SAme9F9RBSFMx
 S2Uxr
X-Gm-Gg: AfdE7cnT722Ttoxxv0QeqwwUdaCUFoikh0MX/oauuilSwdIJQ+137uVZszqqXw5CaTX
 OB8M3DhPg+ilFwelxgzSNYTLZKQFgiVSG6VKmv014esSWg3E9Te6UFrRlc1YGLs62XJMdhs0RyN
 80T+LT9fjDRg/y7uZXYV2pvB5qaviE/sTMwtdjSpuJ1GAX76H1pYn2FNFDgGm1YWI2NmRKuJ0+p
 QigQ05PZDbwDnxViWZyfZ0LTirGpyaU455svc0y+Z9ApgyKUojm8oSGLjITIcb3tXviK3LYghhY
 5h7Ui/oOmHeLtMYAYQVmldixzb+s9S8XjttrzyKjbd9wNpri1J2RDhekEVOH99LV/KLelBzeIrr
 Kt0/Ekbl4eF1tpgj5cj93C+t/M+JPf0Tth1JRTYr7TYWCDVnHVDNlL7LYlxmwRiPQwXJpIPToRb
 bqOTUGlhDqKbMniGc=
X-Received: by 2002:a05:600c:1908:b0:492:465c:56f6 with SMTP id
 5b1f17b1804b1-49266873d4emr106797175e9.10.1782485769461; 
 Fri, 26 Jun 2026 07:56:09 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492690100c7sm91715695e9.12.2026.06.26.07.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:09 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:08 +0200
Message-ID: <20260626145608.344029-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-6-peter@korsgaard.com>
References: <20260618124835.2935850-6-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485769; x=1783090569; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=slDbkGnxHmFxX7vTAUAXQ0WHiKufAIaV+5/7zKAR/VM=;
 b=T+GF13LC6yTAxtzrGPXMn2pzGB4WaxetY6I3U0wApumP8dKTt1BrVpFtX3FO4st7J6
 AtF2MDxAQAJBKxQshlQNHJ+2fazjKGn1BHHs79m7xKYmHXTNNS10GHH7YY3sSfsWDyT8
 PBdGygeoCZRi7wAi3zSUOiZ5BzhDZ6IfXnJjLaoo+z3gnwyyaU792hHMkMaT3mBUQc6s
 dh4kUEYWtmiQcCZ4M9IIqN7NgWfG0hU5jsqZQ06I3p6Dx4ZNI6o6mG9fS8gjqMuvxFSl
 uZptjB6d38MsQy8hF/luFzPg0Fjhj+nt2i/vhFop+jcBl0ccse1nQazSlfUyYS1iVGoo
 aZdQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=T+GF13LC
Subject: Re: [Buildroot] [PATCH 06/29] support/testing: test_connman.py: use
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
>  support/testing/tests/package/test_connman.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_connman.py b/support/testing/tests/package/test_connman.py
> index 6fef95104c..2e53135208 100644
> --- a/support/testing/tests/package/test_connman.py
> +++ b/support/testing/tests/package/test_connman.py
> @@ -47,8 +47,7 @@ class TestConnMan(infra.basetest.BRTest):
>  
>          # If we try to ping again the qemu gateway,
>          # it should now fail.
> -        _, ret = self.emulator.run(ping_cmd)
> -        self.assertNotEqual(ret, 0)
> +        self.assertRunNotOk(ping_cmd)
>  
>          # We ask connman to re-enable Ethernet.
>          self.assertRunOk("connmanctl enable ethernet")
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
