Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 589F6FEA83B
	for <buildroot@archiver.kernel.org>; Wed, 25 Mar 2026 10:15:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17537832D9;
	Wed, 25 Mar 2026 10:15:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m4AF2zScxVOF; Wed, 25 Mar 2026 10:15:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25EEE833AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774433728;
	bh=Ej56kMEqkMfbY0oFqEwcUgrWZVAd+BEmeoGrg5y4Qrg=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=f5KtSrkX8RIRpQNW0TcBdX21oXm/MDenHqLjcKx8bypOHTaml05Dz+YmqIFd2oWm7
	 AMepz0ZGGuO8Di7R/fwOi/tKVrYMUJGK4T7TcPkmOaCNfqBaXiArPeY6KNiraszvsf
	 FarVBIqjb9BQr6VE/fhY7WmA1gReiAdY8Fc8fJ35m+7rhL64iLgqsy21JmAHkmckbO
	 8TCfFWyAsBgRNLQrWVmLCqGggkilRxl+Ob2Z1YkAtfLeEYuQyHiZyVi0svzigsnrp9
	 JHrbiSXSLvOhxyKVfAk52QkekS4amtGDUc+mxmFWsbh8of+zBGBqqIyYB2vHZ5NmOu
	 Yu1xXdVTTu/5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25EEE833AE;
	Wed, 25 Mar 2026 10:15:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 50E8F1D3
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 10:15:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 42793410AE
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 10:15:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kknj2ZuH95A2 for <buildroot@buildroot.org>;
 Wed, 25 Mar 2026 10:15:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D085640C05
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D085640C05
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D085640C05
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 10:15:24 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-48538c5956bso6843165e9.0
 for <buildroot@buildroot.org>; Wed, 25 Mar 2026 03:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774433722; x=1775038522;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OzEH/9p9K3SUqV+4L0eoykMqCgKS4keDgPtcdHZcSvY=;
 b=OxUgjmH3W99H55cbpTICxfih9d3QikwEj6fBSWbPFRVZJv+FZRvLPim3yPdwZP2JXp
 VMRLKpDGNqJ1QuaK6Z9zB224Fh3cnIUuRNCiUMOHkTSU9/7LiCQp7Sdf+HVn+VJodzli
 ZoWxOlN0fYee77LrAVTVue/1eO81o6xHqoR6N1yZiQ5JX4zP+MNHCI0iThmPosqEtquR
 Gl5FcBtQRzcwUp9YHCU9Uhk7Z6TfJMiucBlWZfpDbWtnxlX63jl6tiD46glkm2oKBQzW
 STckNCOEusnW38LS6Dh/uAcpBH9Iw+gxaHmYU6PVhMOSZ+fLAhJsj1XyfeRUnhS7kXzt
 DSeg==
X-Gm-Message-State: AOJu0YwN5C1bNvm1vn2dpxGF2Splcun2Vsej5OA81eH25u349RhLLZI6
 DMdZlwtes394j1idHqg42ldyxspLDsm0eHWfTJQ3Oqr5p/fjbM+d6XevsdkN0VddG+5xNzPF7HI
 t/FSE1WM=
X-Gm-Gg: ATEYQzzzw8M6dHROzUjsBTFiXL6ZeASJ/op36s4PXDv42lyI/lBa3H6Rv3qkyjtQuSv
 3qQSBun+KRQSm7+JBiHwKr+petrh9N6Xe4QlYEaOBAq+FmadO/spDyyEZdRubmnD6l6ZxdbB/5Z
 d4KN5S2/NuZujvZVVN4Q+t7rvnWqBwQHna1uqFsbBjwheUn8TOd24xk9/DUlnChbp8tpwa7REnf
 MsdV1EJEFOUt0lc49PzOmeiWyhEw0Z1liTKlaC5qn/Th20BDYnYxcLfG4HbFEMKMy8zBPJTyghz
 jAC39iCADtrYJ38OUAzG6cMmW0atRDPTpGM9GqKZRgD6iE/DNfvLNPkjfpyR61CJkHMSmm9ufsV
 BFqN3/jOrCZX/2xwJhyuX0A2ti/qyWq2Lhk+Ptca9qFi2uHNyyziOOhIpPPwcF9/XkdsW8zgki1
 uMbPuiu/GaR73+5hSX
X-Received: by 2002:a05:600c:1e88:b0:47e:e59c:67c5 with SMTP id
 5b1f17b1804b1-4871603a058mr38611445e9.8.1774433721967; 
 Wed, 25 Mar 2026 03:15:21 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48716641406sm18326895e9.11.2026.03.25.03.15.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 03:15:21 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed, 25 Mar 2026 11:15:18 +0100
Message-ID: <20260325101519.77626-3-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325101519.77626-1-thomas.perale@mind.be>
References: <20260325101519.77626-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1774433722; x=1775038522; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OzEH/9p9K3SUqV+4L0eoykMqCgKS4keDgPtcdHZcSvY=;
 b=C5Z1DyAnZB29lHBuHcSMcN1TBrSwY/KcB+yQ3XlldZEtFIq19dhhu1KLuviCegybzn
 Xuwj26iQHZwuA1QEbz95UsAEuNv5MCtbHZSBoPRn8Do++/1bzvRzJMEB4xxAKXGAImvj
 NYRIf2hVGpa8BpMo+yLTsM1UnsHlpfrvZt2Pku4AMOtxYN+EwnhitohozjhZwZI48O2D
 wvfY/qix4EkSkmhIDpVgbitiH7+ynKtJxdRXogle1R6JblbDaADzrLkzAZwuZTBX4RPq
 bJRjQ6HDLhy6CArSsdYqPGuycMdlf0ztOjdo6M3fueGS9qIXqOCKUPh2J5qpgXuEL4du
 f+yA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=C5Z1DyAn
Subject: [Buildroot] [PATCH 3/4] website/sponsors.html: use higher
 resolution img
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

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 docs/website/images/sense-logo.png | Bin 2616 -> 979 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/docs/website/images/sense-logo.png b/docs/website/images/sense-logo.png
index d4cab95b82029f5a7e9584e2f1fd43419799aadc..d324111638fd505007a4a7ebae19d580240b2486 100644
GIT binary patch
literal 979
zcmeAS@N?(olHy`uVBq!ia0y~yU^v0Rz@Wpz%)r2KY4Iyd1_lPn64!{5;QX|b^2DN4
zhVt@qz0ADq;^f4FRK5J7^x5xhq!<_&I14-?iy0WC-hnXVm6PE@3=9lH0X`wFKiy>9
z3w(aM$^3Ma{skgsoI4HHFfcH%l?3?(|6@36(i6GNPiQ&=1G9mri(^Q{;jPnsn>Q&4
zG@SgRmsEb`+q$iHmu}ztI_&@d^?M8sKS<bpRqlb%iQ~riCrr3<uG!}*ODW$X55ASH
z0<lRQm&BBwZJBV<(8X*?iww&)CB-FTS7ud&-F@$~^Y>HjpwPQFew5hj881IAKJ#C(
zJu{1JlWx)J<-a#gKa)GNu}<@dnCsz<cXpnfV>bWp8TOLZe<m@e#7HP5^Q>2>>Qb3$
zyClG(PfgJBAw$zvTe;P4I((G{+y{%zU;I4aSha1Qnz6c*t9#_WTRv6yxSvg!8lAQ7
zuHG4G{)L7W)1s{<>a))q1mCUUemCKU?l+Z-+jdB#oQ-<xs(-Vn`BBPRarTtvsng=m
zUf%ig=#I1nju*Db?zpm`;+lDui#CJG{`+^%v$d5?o_nXNKf-c<WBg3d$^DO>Jq}9t
zf5~{%_+A#9;!N{;#;m4^>dnhu|0$DhJbUH*^XC%;m{m0`CcUUw)AqiWBUL1wBRZsT
z#sA#+Y^P<n6Yd;dsk-)+<KoU%Z-I1nznN*P?-zS?r2B5VR*>b%**bUL)V=eLOe~mm
zY1agQg=CND{fw9Ro@jT*3mOL;TX2=5Y31S?HcjWMpNqv~8WtqY2>gHJqTxHvBhT-*
zw}1F4dgS^2xKAM|oqt)JQkOpd*>^K4sg3PK;>ivBou<wD!K`wr<)pBq*?Pqp58l~)
zbrSX|c=10}_;y|dv+R?qMQZY<8^2FE=9KpI)uB@lbvd+*PhY+6?)xWnYog)Nb@#;u
z3Vb%JBsYlg3zYx6ruz8Xd4V-`!F#^C`^Kb+c}G_A2etm*6ZxvchNpkliaxfA&yRaU
zW}7PrhjpEdT(vA<rDN+<HPKs}n%0-7YR}!@cBA9ex*2bb-JbQVpY+givS2pXubM+#
ziz8V6@HKvSsJ<4l?ZHZh=^JlLWiv%idHc0U{Bf#G*AH%wiV1HPy^Ihx6A#z_+~&V%
z>z7xJyGx%=X0D#UA^e=Q-NHpq*~hQ$?r#5JUeC79jqlR7wb%8tYq=+Hu<D=jd;aGq
z!R@=-zoiy`d9beT@BIbu;={l7?2BEuf8QN{bF=N;;d%m--`u~$^fIN&L+`S4(BFyO
q3U15VON?w)roUADIzi%-eDKFVt2hsbhcPfPFnGH9xvX<aXaWG{<IO+-

literal 2616
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

-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
