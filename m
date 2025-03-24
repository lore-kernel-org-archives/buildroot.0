Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8A4C36002
	for <buildroot@archiver.kernel.org>; Mon, 24 Mar 2025 09:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D330060BB1;
	Mon, 24 Mar 2025 09:17:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D96jpplllsAh; Mon, 24 Mar 2025 09:17:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 270DA60BA4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 270DA60BA4;
	Mon, 24 Mar 2025 09:17:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DCED81B8
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 09:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D7C5140794
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 09:16:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d7gP72U6gr9n for <buildroot@buildroot.org>;
 Mon, 24 Mar 2025 09:16:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9266540782
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9266540782
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9266540782
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 09:16:57 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso29753815e9.2
 for <buildroot@buildroot.org>; Mon, 24 Mar 2025 02:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742807815; x=1743412615;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lk8pxJG0OVQTrwFUyxmgH4rGCE4Uvs9Pp/aRFDfiDeI=;
 b=FcuDrI50Xjh2KzsTMkHSVzY3r65ZuyZfBO4EcZV6hSSqXbJmdj9qedk7TB/l6ULklf
 DSt6m0KX6YWRdVzPDzjDwV3GoiBPRff2/RJ0zjV+2GXsTu29YDSMXDT87TvvwTrI4LW7
 B77Y/Q+srCRsonJ2lwTHOC2gQbuiHB/8o8Rez9Z2l36qtMDp+r2cSVQy32YQqU+CWVrj
 hKD82Q+eM4MJOZHZDkw2FhQFgEOQyE7InKILaM7eFPK8yXfjED3E+5D6cfMV/15eIsL4
 YR2Q7Z2+HwgZSj/zQhYq0ShgMxvs4RjhjMhOD/oqJSxzzAe3I5DSWTCWx2uOQ/6ta7kt
 OLWg==
X-Gm-Message-State: AOJu0Yw785OkQPx/o+u64VExyVF+W+PJsFDTcZpiZTrsV1TIke7TbZu1
 lOarqv/Qk0BIALfVL4Ktcroe395cnwfmtUgjTF6TUJ7AwSyP//CvsJ55UlKZY/ZRmSuOw6gQIiS
 6
X-Gm-Gg: ASbGncumFNvp0+6yeUTbmS+D+pSeUN0hMtz4HDbvFWWyKmFYlemlF3hRWBV1YhCVOo1
 3/8lkFfilYTAfMU3PvupjcM5jMCJlqTYqpTnQjcbw+oxSz5mpu+YLt6BEt4GFydj76PSuB54xPr
 rG2pS7PQ1LOgg8W62v9sU7uXvEQE8ib01MAivbGJ+2/fxlSIPYYKDes01ql8ohjjs8x9Z7RFH36
 czCGfo3AZnMkFEXf+reu0ieqW3TFFl07n5mGSRbVoXkGi9B6kZSl3Ue+F/cYuIEl74EwuC5EeVU
 IAEZb1rZlIs+s2JZeh7km91VDIIcDOhkbgfvbMr2vJ5qq8BvbIKPQCXw2HUONNvRDLmg3RLWFf6
 VybfJJQS4ZvdsodhmDk3lGzG1
X-Google-Smtp-Source: AGHT+IF6Ha7etEBI4naYaSW+XMdC8s4GeOxnBnPk6gKayNsJ1KCPbJUO+ryPOH4BH/gNl4cTql4XaA==
X-Received: by 2002:a05:600c:3c9a:b0:43c:f4b3:b094 with SMTP id
 5b1f17b1804b1-43d509e189bmr107160635e9.6.1742807814850; 
 Mon, 24 Mar 2025 02:16:54 -0700 (PDT)
Received: from arnoutx1.local.essensium.com
 (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d43d7c6a5sm166356805e9.0.2025.03.24.02.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Mar 2025 02:16:54 -0700 (PDT)
To: buildroot@buildroot.org
Date: Mon, 24 Mar 2025 10:16:51 +0100
Message-ID: <20250324091653.234226-1-arnout@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1742807815; x=1743412615; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lk8pxJG0OVQTrwFUyxmgH4rGCE4Uvs9Pp/aRFDfiDeI=;
 b=PO4t1Pk+IcjqB9Wj2gjpvjehRZW9h3VJDdIGmlz5vtHU5AKGX7uEeNeQecYl6uCjmj
 guYRUqVMUzuMjuTgO5HXg8M9sMTkj5bTfSKWal+jKBTge1RP49ung9H+VUPVy9Xo1QQw
 YcGtCCO8Zy8TxkiFpu/O0Xn8nxW03Jfnnk13pE0Bw1PTmFQYLARTfL6q2QkRjqXXPfIW
 0Jh6qdB4ZHGIAyIhZG9Kqni8gbwU84Un/j88gc75yMr+tIrhFx+GxZjfUcEUn3I1P1h9
 TJaL85K63MozCbI/dBiSQzBedFJ84DmfByhpiRsyez46jF6jSWCRdmTw/yUS7B7gSxs5
 61Vw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=PO4t1Pk+
Subject: [Buildroot] [PATCH 1/2]
 docs/website/images/openhomefoundation-logo.png: crop for better layout
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The Open Home Foundation logo is in a white area that is too large for
how we display it on the sponsors page. As a result, it ends up at the
bottom of the logo area and it looks very unbalanced.

Crop the logo to a tigher area. Since it is going to end up being
scaled, it's difficult to predict what the best size it is, but cropping
at a height of 300 pixels gives a visually pleasing layout at at least
some resolutions.

Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../images/openhomefoundation-logo.png        | Bin 9533 -> 7091 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/docs/website/images/openhomefoundation-logo.png b/docs/website/images/openhomefoundation-logo.png
index ef932fb2a92c65f9fa37c70426ab8b6fe4f22b68..1b359f2cec532dcb2392bfd5c5a3d2f43a9f3251 100644
GIT binary patch
delta 6415
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%0A9F`N+*EaIIO;
zBe)aGWml(0j622NHsdJjA`N#hSr!~D>k~)jtqag{QL572*7Wdk-8pMt%ahCD=#)Rj
z=uf+WV@u!X&=Fz9+l{&913|B0<1*`<FqmTlH@|99Sdt(h)@1ThLD?k(cI~eh?P7E;
z4Xr@eUPj<>pkDYDEzqNSq|+T_@qC+OAzlz56rC92mE$`|o<b-_i(eQ-)qJ&Z1~vfw
zFNgTF1H_H`X4^+cFto+>u{g>R->=^!!|NE;d=o#r8U+&mI`6ovf917`uRDZV6VrvR
zzwHY2R#x}#rULNw?tcu3cVbi?T)PQFEu#1Mmp>Vq)h->#7v;WxpUTVMu!73HTmvRd
z2{OSGJaS%jrnO-}V1wJOBqvH39+$ACaeKZ0Gdc7D0>A!fsu=BNnU8#$tr4=v&2RG>
zbd!$T?sFblFfiMmXH?YDqhL3tv;JM*o1Cu(gcp47EQ-ak6$ZR1;IAhedoKjVH0gk)
zZABB_{`OvvsJ*|+dr(<T)Z^)A7)7P$w&p=NDXBRYLi?koP(S3y##Ots<Y1k;s&0Q&
z!O5W}dM!rbewFVJE!1DwlU~<TEBplJ;0{&S2-{Bd2}PAL_y&4~k#mZ7*>uI;eE%Iv
z4x1Y`j2oFTMXmfW0ZTIoVO5|p<CbySJMJcC_X2QPyPtIBVGb#^%s~Y)VTVKXAcW@q
zR=C@px)f#gSC7dzqpkq>-107W0G{sIcf24$8Tk;PmT2ijR(_b?K5V3D%-?Bh7CAC;
zLC#z5?|B^XDn<4zbEmk-W(U4yuSV$k2kc!N_yu=(&uI1C{e;|Xi5_U8K^-4I!F$0q
zsoORq;EjH|Tkhp204l!zQLvg#UFtng&dO5xgAJtze*0PeXmZ#NDAE~*ch}X4hWKa5
zh6OJJHL$qUOv|0)^i}Wsbs1+sZf#B<#Z26))SlDP$$OoM*K_ni24MFEP}8U4mPbGd
z2e@Hi6Qd7TxAH3MAXH!)>)6y`rFG(RP^S@o!EPifwm}UP97rHiBhlvIUzCIu`|8<>
zV+!x;5L7j$d1^qt;37yiXSnZ~=~NbeyFXg-d5&wOCuVnTL!#z2*f3V^Tdz3#bNUHn
zzG!Q(jqV_R0MSR2;roo&EkG?y4u&$d9`mlqk*L&_>F)(YPec{No@ltJ5Z#!J%=8?G
zH5^y}t9laaH@jRbAm&^ci}TH(!e@XIWZY<B1K}fyNQnEFFG<Wt)DAQMAz%N&REoe%
zGTv5NE_xORe{FApWNC>r6~A3Cgw*rk)TPCI>;PNjfiDb*Zp-fcgXc1hqrQJXbadBp
z=L7JfT73P`M(ZGUa?SpbD(xt9MHB*O?sx3Zy2_>An2rmk*i`_eC`+81Mr}Pzm8apu
zJR7nHd14VsHnS?_NKgQ{Q@H+}XWeteTqBdBK$e!^$xW+Ro8`4ZfU}btF=KRCKzHjQ
zraOc;e({COh}F*4Z8KB)*5%Wx0(rJf_aY{~Qx>S{fX+4gZz>e{5Sxfg4Qs2K*K@Mx
zJ&>wv*mb~I2@VY)+~eyzu6c$`bEAC9s!fkNo5H7D_P1?}#`VnZE7Ip~8ixryT*EYE
ze?FH0HLYDfs`0wYm^ToqQhdbQ<?F+m^|d)rR`AQkU%lbGJgR-nym!g|kCYu6r)TSf
Yw-i2J0c9?+$^Tm#s=6wbN*_P}4;=aCIRF3v

literal 9533
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

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
