Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73206FDEE49
	for <buildroot@archiver.kernel.org>; Thu, 23 Apr 2026 21:02:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B3E660F96;
	Thu, 23 Apr 2026 21:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bL4CU_wn-IFe; Thu, 23 Apr 2026 21:01:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 335D960F88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776978119;
	bh=H16k0Ae+xusIENtVJxPcTJrgLLkhz/lZUCkdBynLiPU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=kD6bystE8TTM2ciOro6LHG2G5hH6AazDdIx5CP+mXPcW3yRs0NGdiNd8KfHINHXlq
	 CbCFq3Zd8Q7GXacWptWa2/KbCakQe/M15/ottayZopfJou1gBGk0USr70SIKf0B30O
	 g8FxeOpf3/UTmWPCISZdDlqX+CLuxLzAzhuxtqtO1Za3GmfUZtX5m6QCb2XkkMP1jB
	 gaucLywfJMbd58MYxFccBXFGzMN6A27UddVrj3KSKACaScQPhNjRvp6/GKUAUBzdL+
	 5bS+ND0+auO+8lmaiIuGEExDRyQRjlM0Yxwy/lBQFGOLGPWzXauPIZxUrgaPt+f9pt
	 xbQUa2LabqLFQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 335D960F88;
	Thu, 23 Apr 2026 21:01:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D74C92DF
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 21:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C949C40D3D
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 21:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aSOyz6wcMN_C for <buildroot@buildroot.org>;
 Thu, 23 Apr 2026 21:01:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4094B40D3A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4094B40D3A
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4094B40D3A
 for <buildroot@buildroot.org>; Thu, 23 Apr 2026 21:01:55 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MzyuS-1vU7qr2t8Q-014cVZ; Thu, 23
 Apr 2026 23:01:51 +0200
To: buildroot@buildroot.org
Cc: Martin Bark <martin@barkynet.com>,
	Fiona Klute <fiona.klute@gmx.de>
Date: Thu, 23 Apr 2026 23:01:35 +0200
Message-ID: <20260423210135.2859706-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:roHEJZmBZBV3du9Qf1CSfN/MYsxkeKPXRR5jlP4Y3s8I0U+pmE+
 pSovjAC/LNxee5bByNqmnE648yahex/rgJ/PoPKsN71Y4ByaQyDOIdt2H2wcDzDC+hiQk+k
 cgAJ0slQx5TpHyfA1Ea613IRDZmM0m4tdlgW/r28IVej7Y5HmILkewpDByHK9AsPDXrJZtF
 D9u8aeGyJ5nSQhV1UespA==
UI-OutboundReport: notjunk:1;M01:P0:sdz/TEN/QLY=;ymXc6F1nV9xEc5S1zBVAJufOSsS
 n+Fn1bN6jZmgtgGshBvFFtck2S3YXYowBrWBUyVcupXgHlqbXxdAZbjlqhD8C54AQXagqt3BG
 OJbp+rnwE4+eVOY4O+Skv0vradqR48Wf6LTN/jQbCEsYfo6tJxDvUR3pM02Up3oB3LbqPq7SQ
 D5qlLnPYOxGkfYnyu2WmyyGAgLlWUm7p1bRnoExH0WwNax+qATG0KIjfITeD3S70JIPhFdcng
 D4HCpsp2vutDlF5pzM6jd4KD07oR+/QTZCb6hEJgR1Cm5uoNyZ6Mnef7OOVAbHEcWn9e+EEda
 r4mqGvQIMAGBNMbgux2I29u1wCUhQ1jpR09V0TeEII2L+ulmaWmgZcc06mJ8aCONPHvIDf/gY
 sKVzKxsLatbe4N4tjPD7EapSwe/8988fC/gh9CuL7DNhR8VidujDTNMmyUW+XIBno81UKlJqa
 gl7mBXd+iTqiwAtu9HTVfOiWe02VnT9mFm9yC6qrOcjrYsJ0lhAe3hgAoqs/IQsvGZEnsyEbd
 iBVA0/OExVcOcqWXG982X6tovB4aEaPcQPdOKrWf+DjLlWeAaXaFpXGQkaD78QY4617MKcrqZ
 CyHx5sDOcAFGcaBHHr28CRHShTGgO67LoHADBrqeXjDuCTR3+P3YqNbyHQ9/ZDIi42+k90tQX
 2sMNImbsPeMHD88IE1SclFDmN/Ge/ZIJYTgKQIulAfW/5Z+gIFL0N5IfWKNqecTWNEWqSnNPj
 Q5q8cV1aR7kGWcXi6IRh/kNuZFUD+hfxfHTjmcpNILp2ow0MBpgylzaRVmr54BZKN+0EZKDC7
 fnHN8gUsi8gpZ8cvbfyPKAfT/2Pgktj1YtPYuzqEHzzLcLlzV6sp1IQtAObg5qy4/Jg0vQZSu
 g1SiqwN4WR9Dx1smr3qxDQnrffgJCChffTZ90rD/xTvWGakK1lL1ocXvzTfJf6jo1FIIuGfox
 G+QIdgG20zyMYo0XXS0afqlEhNznUsZ7mhiQbSK4yc03X28lfTTIjLeBccOO6asORIDhRRbe+
 sZY9ZlfZBzn3tSqqKnskldfKxnwtads2s5tCNrwwk1ea4Lxcv1Pyjo+mt1KtmdTp9R0YFmUrp
 WZUanHOORWWyQ4MWUhCy137suaucg54zeHlvSTIF9E9YMqvPzhazBAXqkNnPQtXq5cGsLvCBN
 rZVZ6PfEodx5d90gYjXJk4kBo5MxPLRu50Vog338iwx4O0VQS7iWonY6ihYvvxLtCA11xZ8U0
 nnumRekaYMMrrJrnhNWbsUIUQVEdhp9xtg9YdFC40KLoK81hnW6s8bRSberCIMxkYmFBlAevQ
 j7fmsJBu9cE80WIPfvkXfPmkg+IdylsdGNuYlYvlEk0tYBbt8J+GGD07kYcqwgyXI5gl9e5Rc
 CJQwU0uYQlDQq1zrqmP/c8iEVZEneOtiWvFEw1xAiHL4HFLgmr+jyn8oqt8dxLlE3RjAX2Z9r
 LO1YS5NcDhLI21rA2yEBpeOqkRg8qCcYj1wuqiZK5GZQTCV3f/REWbiM9h//ZP6NnCwrGIh6K
 Fr5uj32gx/egDP8lr5NodzyIWsOUH3kfoudin7LMYvpOZUzbdoIENiahl2ONW0+dxwaZZFQph
 /eAhcUgtA2n3zCTJbrHwy+JnwPuLoHxLvnrx53DgMmDqLKISoGVdcr7+t4Y/2gmS05oxBGqyO
 eXtDz2mMPAff5JI50K2KLhLagtqzCKuSYLN1cBA61da9leAkCL7T2LmII7DUtRUXOxab0B4XW
 STRWXBdhct2I5VJcPE/aqI6pHJVEywbq0ggvTEFJNoGYRzxuj1JyxilUA2a75tRyOyXW4sA2f
 wZvlUtfAKFry+I/4PsIZnhoRDO7PFFrxSxtsW8NxlWT7gIxAsKmPz9npnRvknT1oR0t/egZYj
 NtO5fXAHHZqrpGzH/6Aq06MxEi6cIcUHeO5ICZ+0OgOh54jq1wK3tC5szC6UWcoD+ickq0NR5
 J+2GemR62KA3hNlskzW1bGeCjjiW5Kosxd7S9KUvGOlNFqtEb6hqk1XnCaQFA7e9V5Jb9w8ng
 +k99/QxEp6HW7QZ8XsPbhdOE+jMRM65Bh6tvY2wSvROaWtojpUO1ZIe3rIbpeRUvMx8+UoRWO
 prbRZwT5/klDxMsb6ZINRiDLKoBQX6U3FVPY75iAf9S1xFwga5PzHBLYR/FOcYhvbEOS4WZqv
 FLAN3eoXUs6d8KJZtdyDOSPC6VqXly8UiE9efqO/a/lhEemlIYBlLeOh7+3xyDRnjBFws/nQA
 7YRIElOatmU7lZBd2DwBIu0QgUrXtKdUfCmqMoJH2of99c76dVhYYlefLhYWIJK/oZcGunWBG
 N55uM04Ii0Pa2iya7LcTf3zVmxtercPhHAo/Y/TyKYQKM4nNJpjCUZzuQE17q9O+IoGtn+QTT
 3hZMVfH6jBsuUHaFk9Tiw0nO9FiGxh//dAY+dDni9pYNCGMoTuYUFKFrlHSA3DJYax2rrjBrH
 g+yGwm/rgdGQL4cweoHMTIIVO9yAsLtDr5/GKu50RQp57Skpq/gdDU2YqimXGBvQawraMhZ7t
 XT5Bb84OPOwUTrggcYX7uN+e4lhd1VhZ6dtUkRtey0SO8o2rUHT5dffldYbN5UcF+YXGDLXSn
 9IObN6Mpkr40qTMnGIyG7d013XIKySGk9RCdlE/p0KrHpJb07is9O27bSZD3BankT5Z1JvMMT
 XI9moymDcNHBHlyfpAhla9MjZxyqx42nWzHLpVFQeSX+byxvXf7JQkMpXSJhKIaZhTAUEdCHo
 4zQFArHBEvEKvyXR4tC/pQS20hElGtijsv45B7DMPkfNH/eT/aQA7jPIgzMddHxk/XXrs1E4t
 gWeo/mF2u32oD2+TOQ/GkwvxnUe8/Q3c6jFv9nFlLMK/okryUjHl42hdcvofOKdH8M5zx06no
 5hIHagPiXBDlkRalbEiBoe+26Wjl7zFOqHvG1EurZ8fxFT7z/Dq9IgEE0UxVXkZah+Hgr3T/D
 gFzO1M9U2ZFAamGhUk6hLFrXM7yI0Jzt5+5Kiv259qxhqKdc6lHkyjKtFWF2msY4jyjQrB9U2
 kB3/p8ISE+VdZuaGzql9dAh5dHBteQj0rgDC4m1Ner1fPClvaAd0gciHsdm69k17sH1US7nIl
 vaIuRsZJYIBHJ+AZmY6XRldEpeN6Kwu9Ids0fnlamwgvixKlToL19TkDaaOyEGv7q/8UZRo1w
 FURwdv1ALtz7eiG8zkYNJxnGA9bKK1HIyFKrCAIcVujYGaiHmr45f+PclIqAXAdQADdOO0pez
 wnndMjHfBPJehUPPKTtdU791tMFUdR3Q+XTk5kX/BgLwyYML1bW1v9wOF4NHX5iT/FehQgKdO
 GLtov9Iy4n8nw4IiFoxZDrAGOdl1iBbgjzEchIcUZs4MQ9Nik9Old7NIfVgArsScRKi2RTtW6
 dmmMHCtp3FhSY/K+EM8deRRnYtAYHmCKlUgZEul2sIDNJ+Ya1o94iRTDuwHrkvOecr76A0hgL
 l0y/6MrRTYgtEwMBaOzVYRg63Oqd/8WXvh3bFLGLA3l6hE1Z2g5ufMiS6AhrBSkpRfKTzg49T
 pVs8EGD5uXsexb5RxDaHYBPNTsqQg3lXOEvMWYe/qUwOtzW7C5mXCFFZfDE9eKV5Xgu7rwxGi
 3TPwF1HfaF/4YWfd26aYjM0549ohmXrOE35rT9tZS/L0kCPWTwEF8KZq66FMUC+acdzIPYInd
 poTlmNrH+7BslqhqwiAb1e5wDI8XDjuLpzHIq6zkYWHjOE7Qse0p1QKNMQW+p0n61L970XS72
 8GisAPGplsGrxVN/7WvI3OLxXAGvJEUcD1NhHrwC/scoAUdjLHl6nuTtZ42fIU4wNuZCeJEXk
 rmL23wNMC3SPjAr9naHjvcS+FPg2NQ4fM7WdrB24GmLUwncK+I0CKSZUI/0Hgq8fLb1GJKbye
 5qUZ1Oie+LDOu3dCLrVxtzguJyypW9aD/k5Cw8ELL3FXjrz1V3h777CtEhXK3v03jFlOpr08z
 8nf6j46FYcbRUWD6fcUfjbQLnUhbU1w7OzIRtcpD4BZGCRhPNgFJFzLjSqlTHuD7CA15xEEMj
 qU9TcSpUxQI+FWyScnXXy4LFIMPqTySR8iVl+ERpjRCDyFlKeFpX862Q5J3vTjjQpQYRzrSmq
 vepqTtjsBbbK4gdEtLB0Rv+vENjGSruC6pVvJlwLAmFIG469w7v+1zv22X0GDlv10lp0koA/I
 u/k3fNPpDn7izjaCZzoR9dIpoDSRlz4GarXL2fr6wBdqrCf7FIM6hbMM4TBsXSWTCLu6sMfmI
 HqO5e6d1q26mJUTPEyKfR6o8Wmtxx571R37IvwtRie21N+L+70QlZGcvKsBXTfwBRZyLzIUIE
 Bsm1yNAwv7H/TJbI6zwd5XisPSVYiqR0NvBtg/M36vuEV3szADd4vnVEAJwQoJ96M2AgR8XVI
 hr2uf0qnAMv59eama2FzwasbzGJV6DH3CwA7bBdwI4AP9JKqtuDg4enAuE9+4vppmQhg6mSL5
 dlJWlbywHRcXuWQs/AZJ+US6FsWK2M+xGxQ1aCbjXIOpDi5XLIswwNT7NiiJfiEaT2ix+BZ4M
 XZUv3SjD4L8FJS/hDeib0pG/+EU5WtIm1C0Wt4OBRhRgdkW35jZIu1XUHBeHnxIIUst+sPYHn
 1c6szsXIrmRTk1YpxEV2OZY1KgxEDAda16DNH3mChHHFN5Rki562bPwzKkwciMbcVpW0ScUpj
 yHx+FK3Vb9KSD5TDJRXe/ZslQP7rj3fjfobw4nX+zYj4/7vIb0CLIryhfXaGYOhgmGTzTs7u8
 lnj8uhdGQ/XhJB73Y5hvPPVQeqtAkRSjmWaGGbwBWD9jpzJetOC8qdiVVsmTdOhQrRmoTuly9
 FLnsSUPGNvl3Kz3zsrO2i/JNPqDKDL298Bw1N/L2j4WoDFTtGDLfZIhcP2D71xeEd0J2DGfDt
 1ECCJqG4LHEu2njA+VWWWfsEHUBWp08oa1yEk2jXnUcwZcr3o7rvY9AMTO4j6OzSV+KUvzW9I
 /sFJNApelkyDlU4rjGE5Ut6xJFZkOP7UbDIEE632RUwTgefvcsGI215AZICHSAiEiwSXdqGUv
 Zp44CTjK3SLJ8XWQ1uZCI/GtPn8EzLFKwHavIAlZ1LtUYH/BA9U9yjEg0fyTHSXeY0onuKWy4
 Qx2MBaszFQ6jyMNM2MpcEP2bWN9LMByTd6wW8/tFMh1PVYKQh7tv/5k/ZKeVXJLQZeN8N9GC9
 m2Olk+uzVOaKMzwigD8W+AchSm1UQm7KhtGziMMT8VvLrnfPf7ysw1drgUdRZSNYgqlSDNhYZ
 VqPMiTXZvFjCll4a7oM7SM3PvQZUorYHtjwEp3+JYhPtOW45Kc9oXap+sk0XaxHJFUMhIBBu5
 TpUFf9hEKsOjYX/2MpHCAmihWJiYZVAzMTaJ9nXDpEL01XxxYSrPTK3uzUnTUrIHUg8vp3/0B
 qwZ649mJlRXL2TjZwZ/DYMZfPzhWOMR8PPyVAFNbG5kzdn4KQrOHHDBMJPU6DRSIship+962r
 ynK0qLTruQmfxJNgbgxzLRj7B1Aebi+xjAxHqiYTdV6SNpppJwS3NdgasL7tPfwuwFIBPGABR
 TqEA0w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1776978111; x=1777582911; i=fiona.klute@gmx.de;
 bh=3s89hWQnKk/evrfgWC91uoFSLCrYlpftidqwegfAFAU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=E4ug9+4jwfWdFbipAD7USBXycsWI2F6ocgRXTN9tWxysT+0CVqmyt4nNMcSTDQJb
 sGckPKb+O5iOKAT3GEgC5Yc25Aqf0Vp31QoRX3jlM8vOSPZZTq42tiSlqryVfaRfn
 /9DSAkZlYdcHuUS4FAUO5dR4Fis6+jfBjnN5OKkiezl29aoUMfEmDMnZGHDjMiRsh
 dNrMbm28Dx2RRhCZpzh6nQhWnojRSqAsEerifEZxAYf9B2C4kneiHOP9kDy1cNthO
 /Y5BqNeEr9yGqRcaucswDZmlkYFdu80rp5hoq9Az1n6E/kbHrzGHmOM0N1scopity
 pPF4tJErhaldW1i3Ng==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=E4ug9+4j
Subject: [Buildroot] [PATCH 1/1] package/ca-certificates: bump to 20260223
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog including list of added/removed CAs:
https://salsa.debian.org/debian/ca-certificates/-/blob/b266ecf6afc2d6fda61391bbeda455572e7f5207/debian/changelog

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/ca-certificates/ca-certificates.hash | 2 +-
 package/ca-certificates/ca-certificates.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.hash b/package/ca-certificates/ca-certificates.hash
index 2112badfcc..d234705082 100644
--- a/package/ca-certificates/ca-certificates.hash
+++ b/package/ca-certificates/ca-certificates.hash
@@ -1,4 +1,4 @@
 # hashes from: $(CA_CERTIFICATES_SITE)/ca-certificates_$(CA_CERTIFICATES_VERSION).dsc :
-sha256  33b44ef78653ecd3f0f2f13e5bba6be466be2e7da72182f737912b81798ba5d2  ca-certificates_20250419.tar.xz
+sha256  2fa2b00d4360f0d14ec51640ae8aea9e563956b95ea786e3c3c01c4eead42b56  ca-certificates_20260223.tar.xz
 # Locally computed
 sha256  e85e1bcad3a915dc7e6f41412bc5bdeba275cadd817896ea0451f2140a93967c  debian/copyright
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index b1903f6166..1f3f192d4a 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CA_CERTIFICATES_VERSION = 20250419
+CA_CERTIFICATES_VERSION = 20260223
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
-CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20250419T084132Z/pool/main/c/ca-certificates
+CA_CERTIFICATES_SITE = https://snapshot.debian.org/archive/debian/20260223T202245Z/pool/main/c/ca-certificates
 CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python3
 CA_CERTIFICATES_LICENSE = GPL-2.0+ (script), MPL-2.0 (data)
 CA_CERTIFICATES_LICENSE_FILES = debian/copyright
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
