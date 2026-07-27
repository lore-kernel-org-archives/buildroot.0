Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EF7C531D0
	for <buildroot@archiver.kernel.org>; Mon, 27 Jul 2026 15:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3768A80E57;
	Mon, 27 Jul 2026 15:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yt-b3pQImhKf; Mon, 27 Jul 2026 15:45:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D9D280E54
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785167146;
	bh=IPPRaYNG3sytJIG6XRccKmL+gCQItiJlcpv3TM2vKJ4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=AiroZqWJev3NC3YlzNhoyqYorvpe8R5WRxzfS+QipRf6yzwTWK+pRrGuv8Uy2ulEa
	 Lxe23fpn5v3E33/rafqKt4M4SKZ/R4c7KW4SqZdTgCum3mAVzDIZz40FiVN1owKyTJ
	 3Lxb85YNM9ZVh/nz+uSd4M7mhjVgQMTNnUoAX6oLPev4e5W79MehHCwgGIrFKNxG6l
	 PWBr+oeD5VEDrUTS2RNUcPa4shh1aRla/7zfmj4llfvzpJzxsYpk+nldvBH2GUZBsI
	 7ftDkurycx/xONqOrSD1lTm9YihLuTse9Tp7cQe8zBJ7x1FM9UcLfSZMHfGFDkBPEL
	 Ma/wMcs+99mDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D9D280E54;
	Mon, 27 Jul 2026 15:45:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 41696350
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 15:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 271C640760
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 15:45:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fcUEtkCtwI7I for <buildroot@buildroot.org>;
 Mon, 27 Jul 2026 15:45:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 852FD4075C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 852FD4075C
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 852FD4075C
 for <buildroot@buildroot.org>; Mon, 27 Jul 2026 15:45:41 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MuUj2-1x5Uzx28B8-0168UM; Mon, 27
 Jul 2026 17:45:39 +0200
To: buildroot@buildroot.org
Cc: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>
Date: Mon, 27 Jul 2026 17:45:23 +0200
Message-ID: <20260727154523.3265562-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:hideUWCMUy8jSwMFjeMl6f/96HzzvgkzusHgTkodmgsJqLG04Mx
 jlwSdtvs/4hX62UPgkuzoLKdiPlCjftzT1x2VHI0rg8loA2BUAT4tUFP0PgQFQLVDkfNyIe
 H3632mYzb83BcAzDLK/QCNe2uI2BRJSG3TSEQfHzrO2XHuQOlh4QJU6wrz3AT+CuCeEspYf
 /qTEygE9uiPyDKSSKUfzw==
UI-OutboundReport: notjunk:1;M01:P0:cqUxf4bO2sM=;weNX184sjoPyw6tI7iApRLdvvFl
 3tP+t0uuDUhYgjOAWdd/ZFc025vzBljwDucKkK91uizmm3VAh3jilAeP4sbySuKfWomAcCtE2
 DF2T+Jr4/nEPWbn7dzRONv20eaeK6R3SrbOkN8dm59dE6i1pv20ziRfwGX+eBv+o9cRbBNA/i
 utw96mRovrDae7bJXg2AUdUqSjopjwUkO4cX8tpKIDP7aOVMjZsUPaSHvtQck6fpUmFa7vx1I
 2Ha9w9ARsQz29BKV81HB9S6AeJ152XWoxjd/L4SzF0iy/PaUg4ABEFQgEfHrpsf6aD6H2HumP
 YHHMm6FExNiTfuuYKdGl7jSxF3vOUDGmXPB16d4K+q8XTLJgXh1KuaWqzCWKri6fJvTyPg3mZ
 +bnCVL5zQEqFvCIJjXv7Ejeuvtm2XF01LXnVl34W7aZCTcTbOWqot1humZ/YiPFCMGoRZU4qp
 DvKNYIX+3wnw5UZxetBWUVfU624ZZzVIvDnK1D3h3/CSUDuXhwZIzn9ap4hsL2asKb8Xks6Sk
 bvpdFuH7guhJ21aE3albqSTJ48A2rPWBZWyfKbkmfi3zdZX1yec7SCmFlm5IX8q+XRIdAGGpj
 B21cEFqY54NpXuRxUbsEcl56rxHpYE+XCgbUw/TsP507ZZfZuCcMwYtd4m8eVCYSuKxTcyd7v
 7WqkH9PxxNhMf0y1Tal6rdq0efMpcfLinFvSTZ4/Q+mQfQ4l2irY4gjxplq6TdlF68whNO6+3
 MYkjG1QqgAF3Endq2LNeqenCGs9hxTgkgv7RsvlA4mPq5HEnka8CPiLi9DRaw1shuwrl0yEOp
 +M/NztCfd0UMrtS8Q55ZtOsmramIVI5xvc0WrI8DU/R2dEDGlE6vgnPgm4l1tMGTiILPeP84a
 6Yiit0M+Is/fgo1KP1r6BFEh23fYNXizVs0/Atznykvza5GAYQMx+71whlwPQUQAoN6pTw97D
 2EEU24Uf8w4qRRSBGqMLQ/1G9qEw2JfFESCBFv6iWGlDiyk3u0RigFAn0rnqk9grsPKiZIxEi
 WFTuYu5aPnT169XSqnwoUohiL1hmxcMG+KktEPchzHAl7F7+m9qqWWL5A7Ok5fkGuYMtmd/k/
 1JfBG3vVnEE9Xfn9jDFvDN1Y2+GuWemC813OHshogweKdoNL8f9KQKrpePkR1/cbUM+FeTrgI
 0vlnLoO3LTCqk+PtyChvdKPLmNFkDxC3BSxl7WlO8yq0nCrkVMYl8U5VJZ/9paxJPr9/IG1Di
 3pCM/iR7/KufkhNcAAGXWor7ZVLT7iHGUYuoNEXyluH23fGTt1vBA+qfDaJnVVE9cX8Ndj9/R
 j6smqDVDKECG5+7DI4LtRO8mD9kP03DMqKHXpHfCZx1EXoU1Q5VMrqQ7mDL9h6auBUaBq+QWf
 hcewDSPU8ScDEs08LpAT5Y4tAVEc6s7S3hc3P56CxyV8JsziQMQJE4FBDBCYbrULwKpbx2Y48
 n3lw4nQYAkQqM/aUa0bk8/W/BHFeAaY8zXxuScWF1MLrBKGzhfzlwEQoEsoJthDWPj+Bz8Yzk
 5TlW84A2GlwzQyc4y4QZbSiAzArtFjgjPmXSNN/eSPHBHr2xfvhruINFCs6buml6GxvBNKJbC
 GzFl093tA/OD4/KecsdPi8NMvq6mtWLQ+4Z2PnPsRXaEIzzSGByjXoXHZKR3+j7bMmUaIdz+i
 GBMCh1+v+CuD6N9onjYkETQHItp4TAkOUC/65mQxHraegOB0oOpos28qHm+AnlFrLICeXVC0K
 SAy5PqwsLqkwoz12Qg8EJBtqmgMpfOvOH2M/LO2pRr0hx0uyRxNXpo0/WU+pJpzYKxhS8H7Hq
 ArRMrBY4zl2FTMBYytByIJ71McBiz4W8w30PksfiOHJ45UhW6F6utETZU3GR8cHnMkhFi3i3C
 e2NjtlomJfYladgsqfYgjE3BikoyTPrtljjNO9NNaTDLq30A3NDZhZUyCvhN9BvDYANcQ8Fzj
 VcCLKGtRTTSwfX9I/56gUIMm49gyV/1YvExJRzdlllig7inK/9pR0KS80KWjdqJ17rS7nDVWK
 rq05KrMxGuY2A/QbFdPNI4rCuAp2GCUWUVs3LD98gXFcgZ8INLPsMDsh5DMCzXrhA+AJwlpKN
 hve7JutSHVOGsZgDYQ8yA8vVbNTO8Mikao/BRIfAe5tGfuyjmEooEMJQIlWloopYFQB1HYbxL
 FDM9R+4PKS20phjNYFeTSfndby1qg0TxnhOLW7ToYJ/YhEU9WsUoc66sWK1JG/dGUp4X6PMDk
 8YOD+P0x+XODlMZGi07uG/PWfVVegMmCZ24njZcf7hOhnLWl6DbWPZ8Xs8yAE+8K4FbD12/aA
 flb/98lCOPMEplSNCnJ/AYORsd4rX+83bDxjvJxO+59NnoxSjvL+hRfjcPDeBkEwEsE/l5H4w
 i3KIdzbdj44TU03VixptU7Tb0KgAVmik1iGiTELQj506FnmNaBMyCS1pjG9p58b7nSCWZdGNw
 LWWxGQoRu8eM2bOTPebBEEIBNX0jMdVcqMwKmdXQND5MRwSDKfrFXURGP625KygfOVFvCpPrP
 MGxM9ts5UXXPUeuBdmKwtFayFCvu8i70ZcsKqjDjK7AO+4cCl8ClglZgigN3CxxOqqY8Of5wy
 EMGf+5KBqtXVkfQqz1nTyASpXMG3nFIfydOtst6pxTfolsMfF92BgHxLvfgnULF0j4H0N8O6l
 KHR9nPeqqPNSwTvZcj2bn25c/XOHe38ALIp5OSsxxcIipulb4m4NmBeLO31iyA/tEOJl8deFD
 /k2LgimY02RjZVvYNAnNfxnbGtZluYWpO93oePk6fT8HERP+FcpZ3wbL8oBjRZYH/kp4MS7Ie
 98YCDkmzJT7YhxUFlK3Vl97VzD9t+ytmuv8lVaeo4+nayqaoyXNybJ8eR/6j419k89pGzWInx
 7+ARl1Okwim+iiZjDGjXn+XTGmLTtew8EJ7ZpSvpj89AvCwJkGjtY1RwFQGV2r9rSLIq1f25u
 s7qzhS68mHEYA1k+YxreWQOGEnHeHEY+E+UAMeuWbgX6stuQDs7iYGbTghjKxtV+jukLMS4bS
 +GtktfT+yrIQ8jo5Gt5+v1xvmQHfGVCvq5ITUYLvjykeQmRjhsd3uNMYMtuvAVcesmoBPvMXw
 SXMYLEaX83Pqr+p9ZgLpWLFOIbWZfmhOtBZfs15GzC83t2Zsb7cvGdQ62Gk392tqafqP3alzr
 2hVptpMw93POTiormY/sh5jVAmy/AIsQB1vmJUQsujks2pqH45l8XDzlRDm7X0meHv2jF2aXF
 m4IN8ACFLB6q0zzbn4UlGJsw/Sl8mOVlvynkKe5b0HUBlyiqlNYv7hfLQ1hcfhzOVgoFxGeYp
 ojs2PRsehxYxA0Ro2Iuwwp1v66udxPKeHorEPuyyf9L8+X6zlqnfbsn2ldAEHrcTxz/7GpwAo
 PKKKveAzx0X4WAQ9gP+3YQdxa26A7AVPWbXYDq0iTba7TIGkP8jwVWJdC5eFltAzTkWc/4guq
 4HPu/xg7rEMUMTMZQ0Lm0NdERNWAy7oP3gJZOzxWhh4mmCP5b9XsOEDBwwTAwIz/50aY+v63f
 3M6wTKbfollFZEjOWKE8XD9LQ9ils0BWgrmrWF46Ow+mgzlit80thT1SxyDh95ZY91SD/Ei1w
 7PrJK5od0nMuhFe4xh9HySGWJy0GmgpgW90TEgnD6Ibr+7Qx/jDwMtv2VU3DBjon1hA2wG8OU
 GZ8YBGGwQXfq0AMNzg9PUWDBfJA4l7jZlJKzyCvrhXFYHDb6hTkTq4fnKUQKUv4x16NZRfxnz
 wSg9Df5N7PbBejchzE13k4qroKbikRprALTU993V/hCoICMgbQC8R6cPrdyqDCoG7Hr/rmKNU
 j7nTroe2Yf5QQshTQSgIIwmJUT+V1lKJR8rQt0RZQMjkpVhoAQ41R3AmF8hPDFBR1BMmYUF8a
 CdRzOFlPGtmizPRqxKjLJf274R2URe8aSNolyNAhrirtA5A8y5PKcDvUVKreTUast1BBXoc2V
 XMmuo512EeISTsi7y+1IH8RfVmVg0JZbdyE7abNnjAErQRe7MR3i4/7rGEL8tClgi/sWVaqlh
 C//J2YqX5BJQJkfrgjb9rYODQtOqli26dvzmxD2CTcXDc49lrfPmEQkTyEGN907XmrWPPWZcR
 iUAkGV5/fk5tRz0f7mdvLszc816hSDFoQeLaLD+/3YiqQsz05g7HXx1XzQWTuWMgLquFvRcCS
 f66DCebM880Q9DVJgrjhV2cNmTzwOdaMdi9qLwq5DNxvVXrM36wYnYKpOYgoTM7CxLTn0ZE5S
 sGhryvBwrs8RYXDykSuyHtDwhWZOXkomFUu/f86k8AO3DyYt0S25hO5AAz5YM+0It15pFBc3v
 oWBVvF4ZN/BMAGg5WG10l+XeD9qOeg/vhH7MHuRyHbbPAEtGhtr2zEYFyVVjWPI3mtgRgvEzt
 fpe6TD7Kcibic/ajU4iIlaetVSYLAT8wleS6ab0ogfY7lVyu3jPwMQXy0wAj7hV0BoIKLdh9S
 7899T97ZS+XH2otO2JD5rEg829qN/G+p1Pnh5vjDCDIbX55uLs17LjDmtX5vmbf4JDJwMEYV+
 1xXP50qEPwkJilArvWmv6E57gXdv3Cv5rrqPt+nlNAAIq//jPk6xWuXnJLcmLu/YmWmrUJWJb
 /xk/MNFLGWhgOg0FGolgsjO8VCghT5fw10iSCE0KSSnSZcSF6pI/JqFr0g5/xg1znwonlBUjs
 Z6lrB7OKX76ASXVpap8TIFpGnGpTJojkD6tpbfz1dA/Xw8hXXGcDDud7j2fY4CUSDmDXWwbqR
 BoQMxZ4r6Xn/j5b2I7JUK/M1mi5ZkZoPrliHt3wCaU0THWowc3WYXiNTZjD4OMEaS396gc26D
 oN3bWxVbvT7XgiFexp7jabGmx0Icfw6H1PKbjpui/NxRU4rZx9PVSlCCiu+1lg4IoEeYcZ/V6
 oyrWskznt3MnpbI3SMq/CV5yj31VL21Np0EqPdqIr28Al5Dj1W0unvN5R+0jyNny91AXaYWHI
 fVwaN8gNyUMxkv/IwWaLtjQKEgUZzNy9yFV18BRKzjDENM5Qs5UT0DmN3jpCZplO6SUklBU5Y
 ShPZjECftEBBtzbynow9fzETYeoZbEMtSWJAJmXfVfP6G0QwJeJF/9usrgv1r4tpmRkjhCoOk
 Km3D289qXVuxTblvVOdCMvsQ1qnggFPZwi3JHEUrMLfOha6clhIknE7pT2w/rDxgdejGf21/u
 ytnX5MJbv88K91Z4pSKVSRSNpE161k4+TddF0ety0QJvMF4/Gj2bdqU3aJzm5d3Yy5UBoFGJt
 0bgwlSyb9SoBGcdTA3b78QzzXh4dTPO1IUNJBoF1g1QFhFikn3+3YBwZSEc2r2fHdhglSbeBe
 CzLt7mFoTbYa3tMg3OGUX2KsQNuiLSHYQ4SxmSojyTCVYFD6jgsB+RHCAsluAv2YIynSOZIlc
 vY+eWCMVsuscItjvwb60RaPNmtV4noCJ7/sTAA1hhwrsewtaQ8gr8xFa3OdKkqCSs4ICuohAT
 zVGg/WrMXSicXX54+Fsa7UtQ2SxOCcfCi/WxZwVvG75CPg4EYIZXr4JkaKN3FnXRoM4PPPnuX
 AgGvQE8fUrrhzAJDaf3rWEPM3wtILw/uHZiIMLLgiUULP55fleIfeuRC876SoT3d0m5z0tWGa
 COsq9cU+qLVJRge03WhpGBWfTRNdbo3LPENi2SGYswWPtMdJB7thbGYO59vzIyTeJjn195Abk
 i6XKAPctUo2MCQNjMJ5PdEkIGnvzc58MCBjKYQJH3LIrr5VrEbjAdvANeo6grfG07Zosa+AWu
 x15c7Vfu0ZVRmtnUQwvwlaVUwvGEgQ1ZW/1D1r+WM8JheZ0T4UMjjT8H9piwHzao3AOHcK8D/
 XFxNUVYuyBgL
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1785167139; x=1785771939; i=fiona.klute@gmx.de;
 bh=XllPXSzw2pM4xjxw/7QaAVvJv0xzvy9SDzdhbaXfjC8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=G1/vmrtp/Uq+odlqXmNlb19FYKpC7raDieRLkchtYdhSwk3t9dy1LtQ9n9x8LsAx
 +dQCOlLn3cbVVY81BwuGakgRGd2syj0Y+/VQ9sOxAP21V7K1fJJbWdPeGYGcmOMvD
 if/7idQR93cgUYSnjqqR9YWMWs5VJsZJ4QDDcGsKatkpnbV+E3jEYeh8XKfAKyFzv
 0Vu594M9pOiJ+Q9A4UeqnM7Ju0Rk0BaF1x3bcac5MOuaNMzURx/56gTjFZpg6phfH
 sZU8EQ74erz+xXBBtyc6jhoG9rqvYj95tuH48UochMZ9Ms4Lpp05/cNDB0kJxmXk9
 MberGTy8FrfK46Lisg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=G1/vmrtp
Subject: [Buildroot] [PATCH 1/1] package/p11-kit: explicitly enable or
 disable systemd units
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RnJvbTogIkZpb25hIEtsdXRlIChPdGhlcm1vIEdtYkgpIiA8ZmlvbmEua2x1dGVAZ214LmRlPgoK
VGhlIC0td2l0aC1zeXN0ZW1kIG9wdGlvbiBjb250cm9scyBvbmx5IGlmIHN5c3RlbWQgdW5pdHMg
YXJlCmluc3RhbGxlZCwgc28gdGhlcmUgaXMgbm8gYnVpbGQgdGltZSBkZXBlbmRlbmN5LiBEaXNh
YmxlIHN5c3RlbWQKdW5jb25kaXRpb25hbGx5IGZvciB0aGUgaG9zdCBwYWNrYWdlIGJlY2F1c2Ug
QnVpbGRyb290IGNhbm5vdCBhbmQKc2hvdWxkIG5vdCBpbnN0YWxsIHN5c3RlbWQgdW5pdHMgb24g
dGhlIGhvc3QuCgpGaXhlcyBob3N0LXAxMS1raXQgaW5zdGFsbCBlcnJvcjoKCmluc3RhbGw6IHJl
Z3Vsw6RyZSBEYXRlaSAnL3Vzci9saWIvc3lzdGVtZC91c2VyL3AxMS1raXQtc2VydmVyLnNvY2tl
dCcga2FubiBuaWNodCBhbmdlbGVndCB3ZXJkZW46IEtlaW5lIEJlcmVjaHRpZ3VuZwppbnN0YWxs
OiByZWd1bMOkcmUgRGF0ZWkgJy91c3IvbGliL3N5c3RlbWQvdXNlci9wMTEta2l0LXNlcnZlci5z
ZXJ2aWNlJyBrYW5uIG5pY2h0IGFuZ2VsZWd0IHdlcmRlbjogS2VpbmUgQmVyZWNodGlndW5nCgpT
aWduZWQtb2ZmLWJ5OiBGaW9uYSBLbHV0ZSAoT3RoZXJtbyBHbWJIKSA8ZmlvbmEua2x1dGVAZ214
LmRlPgotLS0KIHBhY2thZ2UvcDExLWtpdC9wMTEta2l0Lm1rIHwgOSArKysrKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9w
YWNrYWdlL3AxMS1raXQvcDExLWtpdC5tayBiL3BhY2thZ2UvcDExLWtpdC9wMTEta2l0Lm1rCmlu
ZGV4IDRmNGI3NmQ1NDMuLjYwMTMzMjIzY2UgMTAwNjQ0Ci0tLSBhL3BhY2thZ2UvcDExLWtpdC9w
MTEta2l0Lm1rCisrKyBiL3BhY2thZ2UvcDExLWtpdC9wMTEta2l0Lm1rCkBAIC00NCwxMyArNDQs
MjAgQEAgUDExX0tJVF9DT05GX09QVFMgKz0gXAogCS0td2l0aG91dC1saWJ0YXNuMQogZW5kaWYK
IAoraWZlcSAoJChCUjJfUEFDS0FHRV9TWVNURU1EKSx5KQorUDExX0tJVF9DT05GX09QVFMgKz0g
LS13aXRoLXN5c3RlbWQKK2Vsc2UKK1AxMV9LSVRfQ09ORl9PUFRTICs9IC0td2l0aG91dC1zeXN0
ZW1kCitlbmRpZgorCiBIT1NUX1AxMV9LSVRfREVQRU5ERU5DSUVTID0gaG9zdC1wa2djb25mCiAK
IEhPU1RfUDExX0tJVF9DT05GX09QVFMgPSBcCiAJLS13aXRob3V0LWxpYmZmaSBcCiAJLS13aXRo
b3V0LXRydXN0LXBhdGhzIFwKIAktLWRpc2FibGUtdHJ1c3QtbW9kdWxlIFwKLQktLXdpdGhvdXQt
bGlidGFzbjEKKwktLXdpdGhvdXQtbGlidGFzbjEgXAorCS0td2l0aG91dC1zeXN0ZW1kCiAKICQo
ZXZhbCAkKGF1dG90b29scy1wYWNrYWdlKSkKICQoZXZhbCAkKGhvc3QtYXV0b3Rvb2xzLXBhY2th
Z2UpKQotLSAKMi41My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
