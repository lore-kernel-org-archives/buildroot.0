Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBC1EC43211
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBDE8610B8;
	Fri, 26 Jun 2026 14:56:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zf1rAhI5UVBd; Fri, 26 Jun 2026 14:56:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C085F610D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485779;
	bh=PlIAqGaK9xLnq9eZ31FkpZD2IgAI8/Sec2p3RluMvTg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P+FWdqWDDvxUaS/Ws87dpm1/50vkay4BMBmPafiOreqeJhZXFHC0SDWKAwfmlrFUJ
	 /78QI2nlelZI5sjFnuT4aL5Yyqo5XH7+g5gkPcNqwDiQ73Fln8UP5Ch9FnoRLLpMLt
	 tjACpr8PIJ20RLtUzMKka0Y17PnuRvNrAzS9FrjNwUVJZKkMj/rfkx6lIJEcxhfeFg
	 FVYmEkB+xjD3u2iQZiIPDUb2XElzsWMLTlWg9ArG+buS85g5Ign7PRiU13ySz2MOb0
	 zQmdiPL+UX8Ym5CsDbNkBSc4xrMiPsPfzaqFg1vCMq+FRx0oWG1KnX/Pkx1nOeHQ6V
	 tmVeoO6ZYuKUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C085F610D5;
	Fri, 26 Jun 2026 14:56:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C66653A1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B82A44070B
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hGZTZlJ11lRQ for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:56:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A956140702
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A956140702
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A956140702
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:56:09 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-46cf972f281so598148f8f.2
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 07:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782485768; x=1783090568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0Jbl67dy2b6LHHW3QuQNY2F4v+OJd6VaULiCqHOdYfA=;
 b=jsdulIdn8LOGDwD/mmk1tScdzwvHGOwehMaBdbVHLEh32BG0HtbPCQ6Czrfvs6O+SH
 xrrzbUI91Y1S8cdJk6xZY3VopBiYErqDnf8cRlq9hz8jVzfVN5q78iwOBQ0T+VSY6+DZ
 K9jR1jicV+EJRM/NvC3CoZmmQVXfZ1P/imDBliI1LSneHLMR30wQGYCdd4Ww1sPSvBCh
 fdLBHxVtDqM5pjb5Yfx3XsBlnr8LLY3rNZgl3FH5PFAeucjVliCglQNojf5sEwto+/8u
 nP4dPfo5EJvVfTVim/ELy80SDMe1+LqAnkE4nLk+ga9H1xTogqOlbbg1cesYEUzYy+ri
 YKLw==
X-Forwarded-Encrypted: i=1;
 AHgh+RpSDSK1lO4uE3ZdR2D/+Mo9IFlsBmgZzH1OW4+xebcV+5P9wC0nANTaglaBhyE2oopuMmhiMQoLGDo=@buildroot.org
X-Gm-Message-State: AOJu0Yx9OETYBIoB1R8GCuLhVFIv6CxkkzHzLiVtCeq4+Vxq0IgMzqOu
 oiHNDGEnAp32S6lqIC3d8sF/O1HaKyM9oeU8+fZir2G18+7NGOIoFcUjEVvgRl7aTJI=
X-Gm-Gg: AfdE7clnyL8Wp8kvhb7dcgcwsyxX80lazIT7rVbtqdPNA06rpZDpey8TN819/hUalFp
 dxymITe4K0KZgVNA+vkkzPbdwzVfGRUTvaTZFo05ygJ2/jcY5n7Yj0QHpc2X19V9gN+T4VUHUsZ
 3xTKtzD/zCW4lloYDXNIJemkhkTkzkJ4a+ghRJzbpAAg7o7frSDou1yKOD1+zoP9fMZBOvLy0t2
 hQFNo0Lrrdmoe+7kESNJnr1EWbM3FrHosNl7oxwuGrMsX3JOJYnIyeG11fdFm3cgYmtfI3Vqr71
 jEyO6j1cA33dciQaeYcQ22uzqypUXrKmzDiBFcLV8jvnYY4eR0csBuHwg/cLK2cim6rdt2FHg0o
 wy97qj1DBSdIJKX2ltRiTFsAvi7OjHGKV39cRzEgcEGFFSNA//+cuJTQv3JHS49DYZbhmkpN3Vu
 R0+J4O
X-Received: by 2002:a5d:5f4c:0:b0:461:a161:8102 with SMTP id
 ffacd0b85a97d-46dc11e3ce4mr11410502f8f.28.1782485767679; 
 Fri, 26 Jun 2026 07:56:07 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-46fe25429d5sm806904f8f.7.2026.06.26.07.56.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 07:56:07 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 26 Jun 2026 16:56:07 +0200
Message-ID: <20260626145607.343921-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618124835.2935850-4-peter@korsgaard.com>
References: <20260618124835.2935850-4-peter@korsgaard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782485768; x=1783090568; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0Jbl67dy2b6LHHW3QuQNY2F4v+OJd6VaULiCqHOdYfA=;
 b=A8BVp74qGhMPaaK94Ru0DP+C/xUTsDUf1Kcr9jIW3fqh789rYmdi50zvigHnXNOeLt
 S8glSHx5G8GCoreSJpkK1IVtwz/fgWGnos2ExxdDf2RFlIcyk9F6kA/3J5LqnaY+xJM6
 NGOJd4LJHJ1EHF58gomrrqZrlgBbWdurnelqNfAZ7QS0aBDZf15xzAJxsg5uZb/CxizZ
 2x1RHKyQjGXkbL6CZ3Tu+4wv/NBsAuoy6rBaqsg/332LF1zLqFAVvsEHNHQUeEXA0w4+
 Pe38j3FhKIgIicpbKmUcoXFNVrYfDTqq4F0aZBTkpq/i4e41oZA0sbJc6B3etvKlJNoM
 mBBA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=A8BVp74q
Subject: Re: [Buildroot] [PATCH 04/29] support/testing: test_audit.py: use
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
>  support/testing/tests/package/test_audit.py | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/support/testing/tests/package/test_audit.py b/support/testing/tests/package/test_audit.py
> index f68a4b6831..722542a845 100644
> --- a/support/testing/tests/package/test_audit.py
> +++ b/support/testing/tests/package/test_audit.py
> @@ -80,8 +80,7 @@ class TestAudit(infra.basetest.BRTest):
>          # normal user. This command is expected to fail (as only root
>          # can root is supposed to read this file).
>          cmd = f"su - {user} -c 'cat /etc/shadow'"
> -        _, ret = self.emulator.run(cmd)
> -        self.assertNotEqual(ret, 0)
> +        self.assertRunNotOk(cmd)
>  
>          # Our last failed read attempt is supposed to have generated
>          # an event. We check we can see it in the log.
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
