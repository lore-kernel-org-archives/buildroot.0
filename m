Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3372E7DEE3
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 14:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82BC481EC0;
	Mon,  2 Feb 2026 14:36:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r5TaeFMcpLOR; Mon,  2 Feb 2026 14:36:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C728081E1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770043016;
	bh=alxeLZLd6+I8IiBGbVHEmnaK1xM+RzmhGkYl2lPJ0/M=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hAvQTpqIy8qYNBejXYv7JTCaEuCTaxucuc/AiKIpLgMcUgpIq9nd6Q05jXG1ei75e
	 TnjabwoqD7i6bx3lL47M8Wx4BX3UtX3O7l6+/ICAE8znUJ2Pw+12FmvNauzWBJulOy
	 nK7RVHkCuPig1e9e0cMd6xxxHLaW4r7I6lNE856MELWTd7CMSUTHGSgKIftj1qk2up
	 h82wPi6ECajJ0mHUKmsVFVF5LcJJVpmGI3iXxtxr2wSXUQjjaOd67t/B/ZZYBZfkQu
	 P4kSdX08+VhclY9Laa/OyhDOS1LRMMpD+jz5jdjlqwDBD6t4OAw0aPutXDYFBB2H+H
	 ypee4mdks/ddA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C728081E1E;
	Mon,  2 Feb 2026 14:36:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C011423E
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:36:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF3C34073C
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:36:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NThdEnFmEijr for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 14:36:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=olteanv@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E1F9040730
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1F9040730
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1F9040730
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:36:54 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-4359f35effaso267463f8f.0
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 06:36:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770043013; x=1770647813;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ibOT0shP7QSfSmAukF0xq/DkQOfJ/ydMKgcVIpxzgOs=;
 b=P1B5+UDe40ez4q9Btmmxy/TSm8CTqreCiIDw5wQ7E/errUJYTOqSX4Jpb3NqkbrHcv
 MQeNsxbygiNyb3urtlx4eKrmgTbQFv7cn+7MIrN0opRqrAULvMEmUYXaLCo7LJ8U4oo/
 MFNC7mTKQqXyjyn6IHNBY8MRxrbdhxxgjf/laBr7ojH3lEXhd4zqycRVThqi6VvWZBsR
 eC/j1cJBhVINMvH6AinidM1KVMJ7olF/6EIAWPNeuR2K3paAHUIfZeCP0cOWTV7WK1VZ
 LVGuRk0DmDPCbRa+QXE0AdbX8Ua4cPCPPcLhyfOGVuMw6mq06hlmmtDavQXsLVym3/Sh
 /3fw==
X-Gm-Message-State: AOJu0Yz2J0U5KeQUAM09OJHpU+xkRRcpUqGXKMZHFCDlkNg8Ku0I17ui
 FbnEKWb5/v8hzirbeUi09dI+7iTqCd1pFmmhuqY8gB00Omod4xBYZvt7
X-Gm-Gg: AZuq6aLmlEAmxj3zvMAmQUa/okKAsVQM841oYCWWCyv5Bjqse4G5CHuONPF0y5WWsnl
 ul+UY9F081LBN/3HJt52u25vBRKCOFHAEOTNvbXTYt2LTVYfCej+PvhbXO/Ekwdc78LiLuzefCt
 UgTFyScHDPG8mefH9/EV9J6oEItA9q+u7OK1wb0RVeBrYJlfcVOp24o6PgUTi0/+aNrX4/XEZ+W
 sRzRjtG57CL5jKD0buzB3uiNXNnruFcjgQniVvbJBhPdmcW+QOGlS2orno+vw3dBnvs2bXd74aA
 G1xUHrKJeDXUePqlzJCvJ3kS17CsT0t8ysnmV13cGuCdz8GZjJCi7XJb41M8XaxnHvuAkCjMVpk
 hZQ7Z44KlOLaRPTeK/NLLvm+fN15TADmdtkathrMWzgO+PD9OD14TlGo2cSWl/37i1mRZhlpzE6
 kWqrw=
X-Received: by 2002:a05:600c:3541:b0:47d:4fbe:e6de with SMTP id
 5b1f17b1804b1-482db4ac12dmr95081835e9.6.1770043012626; 
 Mon, 02 Feb 2026 06:36:52 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:74c4:3a65:f9a9:6c29])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066beeaf9sm486192875e9.6.2026.02.02.06.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 06:36:52 -0800 (PST)
Date: Mon, 2 Feb 2026 16:36:49 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Maxime Leroy <maxime@leroys.fr>
Cc: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
Message-ID: <20260202143649.si7ybcwpodqew3ou@skbuf>
References: <20250830173313.164981-1-olteanv@gmail.com>
 <20260202114253.283868-3-maxime@leroys.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202114253.283868-3-maxime@leroys.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770043013; x=1770647813; darn=buildroot.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ibOT0shP7QSfSmAukF0xq/DkQOfJ/ydMKgcVIpxzgOs=;
 b=mce+ADcxLjOZ30AmcnbWPv+1yABlQyY4AL60UohbtIQXFjR1JnvA/cYnwMZwUnIlfk
 raDh0MaHrsCOpxxffBi/6qIKRXTMu2j4ENhvroI0m2QZ1kzCRd9X92POA6CWalpbY+Zx
 ivCtmhDaZJeERNyLLe04Eq/dtWpAnMddV9vCPV0J9IxV6XSf98agQU7p4VhIBsvkAAos
 3R19YPhwJa0qvmfUXR19ttivHJq2L/SVBYxXSybZFKluKkDBH+11oIkC486hxVHYj2b1
 YAF8fjNo2C/BFbqolwO130n2IRMDDbkCCD8x/S7M3uQlz8ks8JhkhqEd+b1pz9rb7Rgk
 iR0Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=mce+ADcx
Subject: Re: [Buildroot] [PATCH v5 2/3] package/qoriq-restool: bump to
 lf-6.12.34-2.1.0
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

On Mon, Feb 02, 2026 at 12:42:52PM +0100, Maxime Leroy wrote:
> Align with other NXP Layerscape components using the same tag.
> No code changes, just switching from commit hash to official release tag.
> 
> Signed-off-by: Maxime Leroy <maxime@leroys.fr>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
