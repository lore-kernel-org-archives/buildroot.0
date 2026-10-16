Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CA4CCA46C
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 15:02:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5943540A34;
	Fri, 16 Oct 2026 15:02:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kVC44cfq5Oaa; Fri, 16 Oct 2026 15:02:02 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8384340A35
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792162922;
	b=iqf11lCVbfj1OPter08MwEI0DsKAbYyRUcnia6pLfJt0Gftif0RxmL3KDQd9GddZk+gN
	 PetrzN/kPsbTQW49vQuKJB6NP5aCcT2z4k5lquKtmqpl9fkdLViYQka5/3x5TGYw2hpAm
	 Q0IydhzP2CDisLM3hQTUsv/wVdlkMD3vmlwbqDStBLkE+AuUZ9JXcvQCPH1rJqA1ecDYx
	 1CS30kkD8lWEb72RYhKQG+GM6Rs2Krq/XTT5i1jaEhuc6gGmu55HlY6tO5b6Ax2aQ5gst
	 OUhlVpfaxYjWvd5pcwmRi9ZDEjkFqbAPXEoM5bQRAe91Hzd59ZM8LhnVUF6hnA6IrGw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792162922;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=YrR4dAbjviQ+FbjRkPHpMcWQ9szndlE7cmRUxw25nmk=;
	b=GVPn01D1qp3o86Up7c0yZyqlHE231YPATOGQNeJ/OF5U507pKOtQHi/xggvSzh6iTPRC
	 9ewe3rN/uwaCCqgv6T091MzTMgde207pol3xZs0hPD5qXHTb0K2cyKyLoh6cD7qFT319M
	 KRr1XqLFGKllYjUjOo76lmb1OCpk+NsdMKelTmYMOnVoiP/GCQynjoUCfdy6FDqW9GnHt
	 CLR96qoRauEGVdomGPxBTLHmleVTZIzii5JV4woM7oSL9rx27GpbNeiUDUc2zczvLoKul
	 DlDASD9q/GxX/49kZ/R+mhkfe8fVsrXmK1KhVhgDKB7lHCMslJVEJyrWw6IF9+Vzw1A==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792162922;
	bh=YrR4dAbjviQ+FbjRkPHpMcWQ9szndlE7cmRUxw25nmk=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=M34DfBLhu084BMtxm7N2/joN72O4bSV7T4VAuVZRzZnqUypdeSdEGe4L/pwKhdFpw
	 BJ5JHtU094KQNAya09t6hV33bGrvOcCEREUSPcnGNFrUdCB7ig4t8Tgam19m0O/ZVG
	 opie+RJrMWMwrpcncXiPIdYPeREmBX15Ww9Nm1bxefKYclF18S2ntHSuBYy14d3sPF
	 1p5uzkpJjyAuIoAWzz2UAIZF51i8ZcXzlRqXsw7ZDcuqLbq+rxesxc/Gu7UjYyGIWC
	 ShuZhYl609TQkKeTaxeQL2dF7zTwhQmDWiRZeq9F9ljl6TAOs1+J0GJSOYrlSK15Uy
	 jF1280kiRrKzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8384340A35;
	Fri, 16 Oct 2026 15:02:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 40FBC7AD
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26E318154E
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BUS0Mji619RE for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 15:02:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 43D5781511
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792162920;
 b=ok3zH0lYRgoaUK56s2JEO2b+EdXIYan4G2os87vEkT5zDhbX76fbqW1j9R62cHv48dXl
 eLtQTNQCvc8oJKkk4k5uu8UnI76uif/7T+BVXAL6IwwFa/iKfJ4/Tpal7XJ3kWAXCrQ2u
 7RIhONK+NCyvUozCKi64sgmXSLc0sHmhVr7irr3TodUhbgKTFBtkB10N4POT9X85qtC+1
 9wCIc8xvkAq4yJohOf/I6GI8mXiQ2Ryf9NjZDXL+KDUuv/wcFaOegugoGoLtLZXVpZ9mY
 Zfmw/OJ+hWUMwKQMC7cy4xXPcFM2RMnCOugVxaokBSQ94B0aUG4/DSGH5UJeEp6rn7A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792162920;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=sOawhTouGIPojnicKs+0iLjcShsCiBmVPw9GWMA59Vw=;
 b=tG5WuFOoPlFeFyVrro2AzZwoDU7ggu8iJEbjofRCLD8J6T+dqVLCacFPVaurmfTg+NiX
 JQcDynbTfwuekBuXHCiQhlt4Ja2XdVjHxUguXDagn9wlO2q9c3jr8D2nRrlGC3/sXQTP3
 2UO0jmO+SGOUPnyniiz2ILCTyQKNqdVvF2w+g8WoLZGofR4NQCRsM3LQQRxj/3kXE34YG
 jVqlAU0FMInhONuDQFJMt3RoG29wDIEblE6gxIpmRAsCKXFBKzWKQa+OrNRqohbrPRtcN
 4JftxdgtkI6yXFuy0xtzLsTJgLRgcfrH7eqWtsS5XoFuwxClADxlwYtbmfsAy26HECg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=mind.be;
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Qp60agoZ; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=raphael.melotte@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 43D5781511
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 15:01:59 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4a1698ea378so398015e9.2
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 08:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792162918; x=1792767718;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=sOawhTouGIPojnicKs+0iLjcShsCiBmVPw9GWMA59Vw=;
 b=KzSerpNgvwZUj2W1tUchkYB+fBXLKL/YzdM88PwsTmBWQAe9hRtDGaIOZa2m+alPpo
 azynFwKMTACW8ahHwKnS9IHACjyo+hQDFV2IcSdDiLlyDH3wyxS44phxoI5whfD5lcYx
 8OXKOCp7NMb8pdxrBUSNJ6IkR5jPTGz0Lrl+bUYzgaiEouzOlU4ETIhiVRB3zwTkmJvn
 MjmU5961Xe8bY1TVXEvVQlCYLtgn/yFCq2q7ONNj4maiUVObliD3c2L4KWL2ct8zLnwU
 DE+RGkCz2qnaFrvPPRPWFRHw5XzMVppTpmoIhb90eubGpBEIA/uZk7rTdbMWxzdTtJhy
 TdwQ==
X-Gm-Message-State: AFq9FYKPo8Oskva7GU9FsTsjkRYHhs17S54FoW15wYY8Eiyy6+MGBlUC
 XBiQI/QguGUP0vIda6rsWRelXcjGrCgiUwq7Yx6pKYyDQFzVE8+TSsIifjafDBv8hlzn7SgqgCC
 BeRVuRkA=
X-Gm-Gg: AYBFou0Bg263D9RMyuWVvidAWUO3xoZyi/I4IgqO7bpzQ2Zf1nePjFWL7YeWJ2o+eP6
 5HcNR7UfwkGue3Mrmlkg/XCwVm8o/7sOhQR3UFcJU1EfaTQXqJHrjjiU3EpK83EJVdGIQrPsiyR
 tTqRO6vtbKvgsRstTpJjzXLey9h4ZLjfBs2/JG+7S67qess75xC/Upc2h9hg+dXIp1BQpo2z3Hl
 vof8o+As2rP64vpGCY+bxFCn+AtjSwovHCUuqLdkoTMTnnU/vdP6mQtsZGyI69sZLpsM7joA3a6
 Pnc4FFuJHtaXUGeRiR4Uy239B0quphe9Ru3XncIoNQdFrCqwQ6Vn5w9lxfnZFmN/CmUIrY+pr9L
 ZP2OooxEKK5DUuq1+IFsjW08URel8sQLtWrMW7nh+WQ0YXlk5hW/faJg97o2oAMkl7wzQMY8wCw
 N6bZfpoIRIlWN57QogdL82ij4jzXXHRj2NzuecC2xIM375theR8YrDmZXx43MhPyX2zC8CcQORG
 HYShroDf+Rn+3VuN+c0bkZ0JMh+Gx4CaMpcze8Z609P96mpy87N
X-Received: by 2002:a05:600c:870e:b0:49c:c0d4:53d9 with SMTP id
 5b1f17b1804b1-4a1d75fdc9amr1469125e9.14.1792162917684; 
 Fri, 16 Oct 2026 08:01:57 -0700 (PDT)
Received: from debian-hp-1 (ip-94-140-185-241.reverse.destiny.be.
 [94.140.185.241]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1ccc15aa1sm59162925e9.14.2026.10.16.08.01.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2026 08:01:56 -0700 (PDT)
To: buildroot@buildroot.org,
 =?iso-8859-1?q?S=E9bastien_Guillaume?= <sebastien.guillaume@vendeeconcept.com>
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Date: Fri, 16 Oct 2026 17:01:54 +0200
Message-ID: <20261016150155.60252-1-raphael.melotte@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612121516.1634-2-sebastien.guillaume@vendeeconcept.com>
References: 
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 01/11] package/gawk: add CPE
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
From: =?utf-8?q?Rapha=C3=ABl_M=C3=A9lotte_via_buildroot?=
 <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Signed-off-by: Sebastien Guillaume <sebastien.guillaume@vendeeconcept.com>

Applied to 2025.02.x, 2026.08.x. Thanks

> ---
>  package/gawk/gawk.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
> index fbb620be7d..c7be63a661 100644
> --- a/package/gawk/gawk.mk
> +++ b/package/gawk/gawk.mk
> @@ -10,6 +10,7 @@ GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
>  GAWK_DEPENDENCIES = host-gawk
>  GAWK_LICENSE = GPL-3.0+
>  GAWK_LICENSE_FILES = COPYING
> +GAWK_CPE_ID_VENDOR = gnu
>  
>  ifeq ($(BR2_PACKAGE_LIBSIGSEGV),y)
>  GAWK_DEPENDENCIES += libsigsegv
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
