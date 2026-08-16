Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB97C5B572
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 22:15:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E03DB4066D;
	Sun, 16 Aug 2026 22:15:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nz6OwzPKQ6Aw; Sun, 16 Aug 2026 22:15:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E5404065E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786918556;
	bh=yBitkVvsTZkmR9Hgw+eQISWS/70/SMgazToFutmjOL8=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GkvrR8ziVEuEtWJKiwDlH2gjrejHWbcNWEke13VaAhIvPpvhl4o3pUK4480YThF2x
	 zg7DXe1ZfP18CzZXCw+Wjpfc2VFRcWgwyKLcFn2gk69cME6CoXh8q69kuvmRxpfLgE
	 7/8TAzl1G77KCUaJRd87Det0JNkIYxuC1ZjpF4nhEbrjzdxi5TH/pUAg8C0ux/pq2l
	 FP8EQ/7GV2kjBB3HHvu4kK8KtpKHq+IJZkSWGU1GN8YqM/DB1QZ2aYgQT/U6VnHz0k
	 kwSlmUgSp2LPoKtliFJTVvqDEJMNSKsd7rBB9Bp6957gb4+1mU9nVk4GGJPRNeo9de
	 ilBh/2UHWzC6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E5404065E;
	Sun, 16 Aug 2026 22:15:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A5E3147
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:15:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0208605ED
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:15:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FClECO4Og-0O for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 22:15:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 246C3605EC
Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 246C3605EC
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail3 header.b=Up8BRpWR
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 246C3605EC
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:15:52 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=Up8BRpWRGrA3ZQPKX5UBKzrNBMwmCHym4hq0LF5PFAYnAAbwPTl598O/cdzKBtcCSympQJ/h24RLJyaLqO15iqRtNOBhPiUy/vkzV32J+HMI5gFLjhypx5wCB+qtabilaAeacryGz4ooeUwnZAizeU0aTroMTd5pcE15TFQAzr33WcrsmNVbRGjTGSJfT2hv+MQhxYEwTZo0fBD/r989rHq+jbQhW3J1Uyh6SpYJ1++/Zkz/lEZZs2s7GrelLsk5bq6bDaG/w3ISQh138czOq42ZYL5LniiAp0pBcoihOqYsgrN9xPXDdoidWu9b5J5yOw6vCQ066nwIrPdxepGp7g==;
 s=purelymail3; d=purelymail.com; v=1;
 bh=saJfYB2wEUMe7+yVO1IVeZVkHP/OaIwy7i7MOGecPUQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1161335829; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 16 Aug 2026 22:15:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1wvj8s-000000021N6-2vaR;
 Mon, 17 Aug 2026 00:15:46 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org,  Christian Stewart <christian@aperture.us>
In-Reply-To: <20260816203207.3980846-1-bernd@kuhls.net> (Bernd Kuhls's message
 of "Sun, 16 Aug 2026 22:32:03 +0200")
References: <20260816203207.3980846-1-bernd@kuhls.net>
Date: Mon, 17 Aug 2026 00:15:46 +0200
Message-ID: <874igtd84t.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/5] package/containerd: security bump
 version to 2.0.11
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > https://github.com/containerd/containerd/releases/tag/v2.0.11
 > https://github.com/containerd/containerd/releases/tag/v2.0.10
 > Fixes CVE-2026-47262 & CVE-2026-53488.

 > https://github.com/containerd/containerd/releases/tag/v2.0.9
 > Fixes CVE-2026-46680.

 > https://github.com/containerd/containerd/releases/tag/v2.0.8
 > Fixes CVE-2026-35469.

 > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 > ---
 > Gitlab pipelines passed:
 > https://gitlab.com/bkuhls/buildroot/-/commits/99b74ab8c322d7aacf9b9bee370fc273a0dc7fa5

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
