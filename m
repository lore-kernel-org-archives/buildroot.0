Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B43FCC066
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:53:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CB956141C;
	Fri,  6 Mar 2026 19:53:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aiWIhroFO_vb; Fri,  6 Mar 2026 19:53:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94AE16144B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772826815;
	bh=6x4eJ/5TGiFvPNny8afwZc7bn3/re2E5nrQEWm2AqnY=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=brPJKqw1DQBczmYAjpgbLCMz6qs2QppDwqs7hyAcJt+dNt7qA0jB1CWJLzwDsv230
	 uGhTEZFkYrkA1AfC/uXbhUpsEmUb2hTi355BV7ozAt7gWB4HrUFZF9V3K7Vy5VMGA9
	 0bCzJRA57XFGlhP45pYxWdy/CmluPMAT3ezNemrHi6uYZ+pRQShDEwK0WMD9ucRr/Y
	 ux3HmHyceEjJxRs+uwp9o7CCV+sXKWRxxGYowaJTuFplVuf4N1kwmijJP2icCoAOje
	 Dd45x6q9+QoP1+GlJVbAa6o+KVZ/yAfoROmL0S1fwMCC1KW7JqTJrb/snBzNs1YOAE
	 0GOXv0n8nwKtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94AE16144B;
	Fri,  6 Mar 2026 19:53:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E3554169
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C97B783D65
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KMcGUMAz6hPQ for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:53:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E38BF83D56
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E38BF83D56
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E38BF83D56
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:53:22 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4852afd42ceso3874505e9.2
 for <buildroot@buildroot.org>; Fri, 06 Mar 2026 11:53:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772826801; x=1773431601;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5kS+7EOhSvJjXLtGLJQ/rPQiVQWkujnNpGbl/giOGqU=;
 b=DWgJQYUifse/gogaxQWP++kFW/6mTw5aaaLpXr1ECjiQMo/WZOARo+jHghT47Sl3OQ
 80LLKO+vF6BhTaHbH3PombCmx87KNf0pxjhC56gKam042fBVfKaUb3oaveNgDh4ki762
 SoqmQ01Bcsz/RV0NDX02oWg9/4KLBUZdzHAyuiScDtiojyE07if+qxlY3Vm4vIJLUM7q
 Q2W0JxYN5jkeBWS0Z+usDLY0+aCJnb0xNUommFkDX6B64U1/+t5byL2wPKuZ17MasNIk
 CJP+1Z0Hahq6YEkvl1h1xZYue8GknKwU5bOIMQCn39y8eRTNOjfxb69R3ekbBbJzdrUo
 FBAQ==
X-Gm-Message-State: AOJu0Yx0c0DvyKknrX9KrZzmubGY2Wx7BqY6/b5aurBGoFsnSfReERZq
 RFimGsxWcQfcEUXR79FKXJIIbJcsbRCFOheo0VfDh2tTdHYiwhJl3tOqyj80vYViNda9f6K7+DA
 T5kmc
X-Gm-Gg: ATEYQzwvigm6xaQZPtdXJUpe7l1soz80pjaxU1NIUKR6yKJRKSKb3T6y+3ZOQyq0zG0
 Sp2ZX0fqGrzILcThw4dsMEWzJYHoerSxSfE3TWuUpVdX2JvzHUntaxZ19iYJIVonvebo3uvDY9N
 La2btNk2JkoWgQvy0fVls8l8VEWQJihkEvPlP1+sDhufHOVPeCWwjFCMqgSoWEYH1sh7imaeTzZ
 I5BW3X2mJIQNJ590ItlPkoP4Tsh8cvX4u3w9z+vBABGvmaq2tS9TyKjUC1UkhyW9FrOLs6w0DnK
 wcCN+G9mQxqWk0anVGJU7ruq8+Xv+EQ1CT/HfoCm1uWeZ2Lmhmj194QwEevIKCR89JCdQsEe3cq
 9tMoCV8mPcOcIxC9gqG1s18ZEkkHDJ9LSLjcoypGBXyZV9rLQ0osVg3+iFHkqgTkwyieM4GP6qv
 8rpKegtSAsuSizAX4=
X-Received: by 2002:a05:600c:620f:b0:485:2ce2:4c70 with SMTP id
 5b1f17b1804b1-4852ce24eb8mr8429775e9.4.1772826800897; 
 Fri, 06 Mar 2026 11:53:20 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-485276b7547sm62840975e9.12.2026.03.06.11.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Mar 2026 11:53:20 -0800 (PST)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  6 Mar 2026 20:53:20 +0100
Message-ID: <20260306195320.8234-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303101254.192225-2-thomas.perale@mind.be>
References: <20260303101254.192225-2-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1772826801; x=1773431601; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5kS+7EOhSvJjXLtGLJQ/rPQiVQWkujnNpGbl/giOGqU=;
 b=Qm6cojopOJGhVjgVSsWx2cL2iMYcAI7Kyan6BpXA5fQVjvsDfl7KKBGLDbn4ai8z64
 CPjqwH9H4PD73e2IUjJadSwdWs/h7m5f+0g/SsUScErMQN/UEXygAyvqbCCC9v6ENL9/
 eTrjnxFf5Lzswp6kOBuvIH7tflkHroUlVAAif1zX5k9WHUgpZ6lbT0NNXvFyksGl5GIq
 Evlf8ykmraq2RDTecFGIbCn+0Xr0+UB5MF9MbmKRYIvvfNM3DnsjZ8hR8OWEkoZRnrhe
 hK+OdB95eN/ai2kouZpV1L5NgqI7gQN+TNj/LyfpN7oucgxi6HBUV3dPdQj/N25rNcr3
 EFvw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Qm6cojop
Subject: Re: [Buildroot] [PATCH 2/4] package/freerdp: add CVE-2024-32662 to
 IGNORE_CVES
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
> The CVE-2024-32662 was Introduced in v3.0.0-beta1.
> For more information see [1].
> 
> [1] https://security-tracker.debian.org/tracker/CVE-2024-32662
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  package/freerdp/freerdp.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/freerdp/freerdp.mk b/package/freerdp/freerdp.mk
> index 6929c73683..889c6035f3 100644
> --- a/package/freerdp/freerdp.mk
> +++ b/package/freerdp/freerdp.mk
> @@ -13,6 +13,10 @@ FREERDP_LICENSE = Apache-2.0
>  FREERDP_LICENSE_FILES = LICENSE
>  FREERDP_CPE_ID_VENDOR = freerdp
>  
> +# Introduced in v3.0.0-beta1
> +# https://security-tracker.debian.org/tracker/CVE-2024-32662
> +FREERDP_IGNORE_CVES += CVE-2024-32662
> +
>  FREERDP_INSTALL_STAGING = YES
>  
>  FREERDP_CONF_OPTS = \
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
