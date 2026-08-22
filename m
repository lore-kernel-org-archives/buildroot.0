Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B8EC5B572
	for <buildroot@archiver.kernel.org>; Sat, 22 Aug 2026 12:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EEB6280F2C;
	Sat, 22 Aug 2026 12:37:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wTBYGxHV4Gqy; Sat, 22 Aug 2026 12:37:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787402250;
	bh=VlhFbL9rl5Q79t9iDdFBC/8NIlbamsOsftgOvO2CI0c=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MipDHWCAmIyOeHneTrt/H2x4Sh03NnWyF/Eu4UQT5hHfAumXd3OCkh5j80LMtHAFh
	 6goUjxOTveoNWiQDHG1LDCgLZU0fzm0mj3azh7e2xorbS0EnK0tnlynz/L0Ux1cx/P
	 v9wh0qEOqu0YCJU+mxqgmoJ4PU8Nzlr0ZrjgCog+Mv4DXbkZUdwqrTiwcIbNJTOVbc
	 DSx+JzU53rDON+PayiMYubm6yhBpFVP/bkP+uRncKXVmWuCkfYG0VP7elU2QN21m9I
	 Wp6t++CSBEsrR6tBd4LDZnwv077wUNHZRpGaU4iwxOkWduk9l1OtawY59OMvKGs56+
	 4YHcp1yT9uksw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D09B80F03;
	Sat, 22 Aug 2026 12:37:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C36D12B2
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B529B80F03
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:37:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MH1mxwUi4Cav for <buildroot@buildroot.org>;
 Sat, 22 Aug 2026 12:37:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9E6780EE0
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 12:37:27 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-c16794450aeso267000566b.2
 for <buildroot@buildroot.org>; Sat, 22 Aug 2026 05:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787402245; x=1788007045;
 h=content-transfer-encoding:content-type:in-reply-to:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=KcemgnN4HAYIXzXBnK/sM3TRSwTwJuzSWcfgT39Hz1c=;
 b=KNtpDtJfpIufBX6OPrUH9igfAM2TfK00kMp2v+3KWG7YlfryAGlpScCvUCqXSbJBEa
 baiQpZPovCj3wUYgI3M0xsf81c3lyLILqPeDwQRhNJnfjIrExJJRQWSW1p/wTjymiwtB
 lCkSBz5tuUlJcFQp7nnfbjXpQ5jtd2+MG9jJy6calz23hjXtVPM0r2hv4/FroZ+Wfhsy
 VFjoEK73iHEadCanszQCXqw4EjcpF8w4WX6nJY6ZkOVeNakSqw2aHGLoup8WrADVJvRz
 PpLJ5tcHeo0Oa2HmZqH73ANBNynyDrBldTr97mSv8bclWg966YX6Q48mIVU8Boewwo0/
 0wBw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoM3+PxgCDKezkEAqc3/w+P6ep665ruaaQYLXbXC1mt4pjmtQ5euhuxr24+KSm+9M2lMv7qgBGxkNM=@buildroot.org
X-Gm-Message-State: AFuF++nbR/kUFQ1XjdQyZJRZMkrynkVRX06ASZ0TcZsE7ijrWu5Qfc0e
 uGfH41H+/8D0fD38/Zj3vTVQiXvloBaWuNeGeQcO7yJbMKKWi5ddy8woE38VBuXQ+DE=
X-Gm-Gg: AR+sD10EMiyBqJWPrpYvOc4p3afVu7hkRLU8shXBnW9CcurqtALXdOq5b9FRGQKTHwn
 9uM1a7nd4LhPiMg7j9Rm7pH8MVZjgAl5yZNWEAHbv6Zfq6rdiDg6WbBSwXFfb/tMiAoPlExjqi3
 qwRNFANCKjo00Ng4VoW7x8+VQ0iTpQFRp/jXzRKda43jjq+uN8NU62aY5q0l0mcBE+AYeTJhT98
 ofxduLEw4VmHs4savy02oPvmhGKJegXTpWPYfjcmGa8osPcpNM1k9tL/VBgQR89J8650skEC4/K
 ObUnKtFAoxLzBc5j6iyXxSiFBKNCSSX2jirxeyfy4k9KWCQ1YS0XfJTNIrNtzOCDXNSLVdwnRH0
 8sdL4aVkIQFGnMn+LU/60F9nj+WQzlaGwrhBpYYJC9ieSePJQNTMl1Ud4syfkcRJ9SeBOddjYF8
 24cRReRIGpvOSghofNTDEv8T0Mns//lmlBrC/CUx6PJ19WY3wkYEaImxD5bQZ+ejSY7iCKSHVtK
 2u4E97fqRR1sHQHGVGf3eL4ehyttmgMlWOI3KNJgGJAxdQJ9aKCKiOSg+k=
X-Received: by 2002:a17:907:98d:b0:c12:b2db:873d with SMTP id
 a640c23a62f3a-c246a2ec634mr1659428666b.5.1787402245459; 
 Sat, 22 Aug 2026 05:37:25 -0700 (PDT)
Received: from [192.168.129.33] (154.186-200-80.adsl-dyn.isp.belgacom.be.
 [80.200.186.154]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2496297c7dsm305842966b.20.2026.08.22.05.37.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Aug 2026 05:37:25 -0700 (PDT)
Message-ID: <dd5b1e75-8914-4f1e-b5e4-d0bcf41a81d1@mind.be>
Date: Sat, 22 Aug 2026 14:37:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Cc: ARC Maintainers <arc-buildroot@synopsys.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>
References: <20260808152753.1278414-1-thomas.petazzoni@bootlin.com>
Content-Language: en-US
In-Reply-To: <20260808152753.1278414-1-thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/5] toolchain/toolchain-external: drop
 Synopsys ARC toolchain
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 8/08/26 17:27, Thomas Petazzoni via buildroot wrote:
> This toolchain is from 2024.06 and has not been updated since then. It
> was marked in commit 11a8cdd2bbbd0ef4adf600e4792d75f6f2122ec8 in
> January 2025.
>
> A warning was sent to Synopsys ARC people in December 2025, and
> despite a reply that some effort would be made [1], no contributions
> were actually done. Also, Alexey Brodkin is no longer at
> Synopsys. Time to remove Synopsys ARC specific toolchain and toolchain
> components.
>
> [1] https://lore.kernel.org/buildroot/SJ2PR12MB818487232470DA4456967C73A1A3A@SJ2PR12MB8184.namprd12.prod.outlook.com/
>
> Cc: ARC Maintainers <arc-buildroot@synopsys.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to 2025.02.x and 2026.05.x, thanks !

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
