Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE3FEB28D6
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 08:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDFBD6123D;
	Fri,  6 Feb 2026 08:12:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FZiul1FW6xu5; Fri,  6 Feb 2026 08:12:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 593406121A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770365529;
	bh=CEVJ+Dqiv+fBIZ5N2HdQOmQTmSJRc+u8/aC3vnNzcA4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=plNPY9byotwhSp6qhhnMN6GG8bzVA60F03/VrGRIOXqjju9b+dM9MvSVhndSNfsYv
	 U7WjPAweRRK47C/pskGB9rZvRqYNd2g6+JSt0D8OypQREAbXb0w8sQ2yk4TBrFXoQ7
	 BfDp9Gpqc9/x7f0166zdLVemh545LVDZlVM/U+7jLeLnSGFUpSpbioue8m6+tH90hZ
	 N0lCbRxGO/O7NEdZC0q4i+CNU6yyc94iVMYqJRG/xfh/oiU0inFs3vKMuafhHHtyDZ
	 AIbmO23MtQNyTMidhjSpdKtMjZs5AEQO885Ur8jJE8SlNIiOJxrPV+xVQdhLA1kMtl
	 Ktf8itcRJCKGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 593406121A;
	Fri,  6 Feb 2026 08:12:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 957A9173
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86BFA40A33
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:12:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HDETfa_ECa_t for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 08:11:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4F10340A2A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F10340A2A
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F10340A2A
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 08:11:59 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4801bc32725so3044775e9.0
 for <buildroot@buildroot.org>; Fri, 06 Feb 2026 00:11:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770365517; x=1770970317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7VeJrNoOo73Doi27Eo6TlO36w0k+iP+UarUfAnWrtSQ=;
 b=QxjQ0lfd7VHrDYOtIXULv5bySlv/EEOwq7lbWC6no0WItr529WHklPuN6XcXoxoZQS
 /y88GTcobdIXkcIf+hmEeBszovYUKI4r1HtFlsgiBXcq/PvQ05RuRMZLMnruZL81W+GR
 GfCTxu0rg2Jr/mgID22Z7asyJe0wTmJ5IcHtsvZHV2tF2pc+w2wGrLEMPwllvmr+WNGz
 sPw5yoMXOcxzmqRh2+LP+fNNmUDi/hXarXB/KnOde3wEe5dePN082cwC1m+90BGAz/TH
 ZLzm45uKE9t1L3pAzHxwC4aAnI7smCLAI2mbL9TDO5CcDjQQUfxSv/NCmwiT0q8z2ML5
 4Rgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2iSSBcsVSC7VKbn2B90VVnUJXqItGRLfMTcc0JTK/KgxSGnInLVFpU6w2WW6y4/BNTbE0/b2y3B4=@buildroot.org
X-Gm-Message-State: AOJu0Ywjv8Wd/XdoTZ7Bz5nqdl1g1KFCpB1ccJcpmtveuFkqhTAnOQ9q
 MkNiWjljciCeeponjaU8M0DWJtsgg34lBgq2GGcwDn/oNR67PC4/F/PyWajjf978k+g=
X-Gm-Gg: AZuq6aJJgC5RImCDHfSr9bDnLPEi5ZXTabK/w3JJt0jQd8wzBtIMYebK5XxPuDiQAAT
 2h75BkDP173qVVi5F5hPomeX2cvQvacj33dztEUT8sMP2vX3LzLE0U7BP2tMqXEdp7osvkdmR+K
 ke3fKsfpeLS4R0ClElyLKH4MXEbq6/gDZ3nt5taJrdn+XacsWVoTHftYrbv3mmVHBCoJrbxIuqE
 ttq+tR4OnbMSGS0b4WMWN1nMINqqD9Cb8Lch3tE3jFfH8TELfLOTxuDmrSRfhuL96tTSUW6URbE
 eVXNXREltCSkrVy6RupY7JHvAk1KpBxXaZRgvEVfJ0JyjvmynSZ9Fyn9ezkBd3KAQ4jgtbVnOeR
 CDixeA2D1JL+XYSMZA+e3hBUnzW9lpkl406nta5/nX2AX6JFi7ZYezKcB1Nn53pzc3qELx1RdpV
 9WQUO4Xh2C8zYUpQ==
X-Received: by 2002:a05:600c:37c8:b0:47e:e952:86c9 with SMTP id
 5b1f17b1804b1-4832017dcfcmr26117655e9.0.1770365517187; 
 Fri, 06 Feb 2026 00:11:57 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-483179dbdcfsm142155315e9.0.2026.02.06.00.11.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Feb 2026 00:11:56 -0800 (PST)
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  6 Feb 2026 09:11:56 +0100
Message-ID: <20260206081156.32523-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260124153642.1076905-1-dario.binacchi@amarulasolutions.com>
References: <20260124153642.1076905-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770365517; x=1770970317; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7VeJrNoOo73Doi27Eo6TlO36w0k+iP+UarUfAnWrtSQ=;
 b=Xt006wqJA/hdarcrLuNATDK8mfJjojIGECgDrfrzpTpuBd9NILXoX0CBzbBzLCwJDi
 QCEtjjDDL5jG5fQQ23gI2wErPafnA1ms0nCsfQMp4fY2gdgoCmp0j/uGqiCjcKwhTL76
 hNCi+GXIwNJTLkw88vlmkPKiJVf+6N6GpPq3Nu93fybNwO/kVs+HMEUX5mLuIXgKISCn
 bQtYi3diwKQDLssRLsO+86Ri1Xyj5c3POLGJHF5tPnK9PHp0QT5zOEBtaxLA+jxEieAq
 3mJiXFwp91pRjvW0ID9BVp/5u5QEcC+O8W1kVtcHRxitKsvkvn6KSnLnt8W3wuSp6aEj
 gx9w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Xt006wqJ
Subject: Re: [Buildroot] [PATCH 1/1] board/beagleboard/beaglebone: exit
 post-build.sh on error
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
> Add 'set -eu' to ensure that command failures or unset variables are
> properly reported to the 'make' process. This prevents silent failures
> during the image generation phase.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to 2025.02.x & 2025.11.x. Thanks

> ---
>  board/beagleboard/beaglebone/post-build.sh | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/board/beagleboard/beaglebone/post-build.sh b/board/beagleboard/beaglebone/post-build.sh
> index dc84d26eca63..dcb923356dfb 100755
> --- a/board/beagleboard/beaglebone/post-build.sh
> +++ b/board/beagleboard/beaglebone/post-build.sh
> @@ -1,4 +1,6 @@
>  #!/bin/sh
> +set -eu
> +
>  BOARD_DIR="$(dirname "$0")"
>  
>  cp "${BOARD_DIR}/uEnv.txt" "${BINARIES_DIR}/uEnv.txt"
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
