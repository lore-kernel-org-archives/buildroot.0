Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FBBFF885D
	for <buildroot@archiver.kernel.org>; Sat, 25 Apr 2026 08:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C8A560DEE;
	Sat, 25 Apr 2026 08:57:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5xZogz0PZXlg; Sat, 25 Apr 2026 08:57:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26E2C60DE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777107435;
	bh=Zx19SX2mAAIH5B9WxP7zSnFp2Yrjz9yphLvpgGPE0fA=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=dgvWIolvcFm5srf+LVwkj1BgLvQxOL44aZ2Qvapepx4LOoU0wYM988YN1Z7zYgjHD
	 MoKacD0V+BKJwh+P/+dD9txS1nuJLTiw0XOk+716VUs31+ioE9nSsdiyq7A1OanaOj
	 c0bGOKSfFCPbKryzQ1O9Bs/GDAbbY8Vy2xHWqqFLZySlLljN6ARSC1PL5AthRYwym+
	 IjcgjMoVssyC+3vfZ2NEMvHMaHy3gl6aYb1LyhcNlBCQTWJZ7Vco3vuaax7oIxaCDD
	 x8P3+qQznY5dqn2BiN5V4/VBk1saXNqayNKFP+pJ2HVqjbSURg6TQuI8+oOhhKwfvV
	 hsBFENxsT66pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26E2C60DE8;
	Sat, 25 Apr 2026 08:57:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 762C8231
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 08:57:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5C1B88214A
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 08:57:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8ETipezQq_xV for <buildroot@buildroot.org>;
 Sat, 25 Apr 2026 08:57:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 203098213F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 203098213F
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 203098213F
 for <buildroot@buildroot.org>; Sat, 25 Apr 2026 08:57:10 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MzhnH-1vUNxF2u49-015TC0; Sat, 25
 Apr 2026 10:57:08 +0200
To: buildroot@buildroot.org
Date: Sat, 25 Apr 2026 10:56:53 +0200
Message-ID: <20260425085657.474422-2-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260425085657.474422-1-fiona.klute@gmx.de>
References: <20260425085657.474422-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:tCDQ2bCgMCjLDWJzMU29EmDmBj0F4/iNBU6f7qmUaOW37NE/B97
 ZqNF+8ydw+dy9ioFjQ3yxJmjXlP+8WltypFQ/Fug+94Go9pBTuxSYwUByNwHiw8x7IoE0yk
 JqY2CB/U0JEOcPasZjLJo3AIYUpN+9WuPaCmZJwFnBQAIT50aarKXOx0DgI+dOJJy+Dpmjl
 AzKUpTp5L84B7N9HQiJAw==
UI-OutboundReport: notjunk:1;M01:P0:JE+ga6a+90Y=;EtAFzoXRShr97C3U7txMTwl49Yo
 jmuasJe4JJmr9eD5AC5GQcoPsdiV4/hmSMSMo/rbu/yofXeVu1XbcHR919EWBLaIiA5Jo5PiP
 RgT1RzOZBkToeEszJz6ioQ6wo3ET4IdeyfvfOeFQ8186FyciRlE9RimfbTNtdwH/JtLNaCzg+
 U32yz2Faqn6MXQUi47MCuRMeoMeKd3xiRA6y5G7Qhxi2lVnOX1pmNGzND6pb9IyCTJKOnCaEH
 CGQdaIFBJSpQMSXnGOcuc2V4xQ4DU2Ze0KkFkOW9YkvPU1A5ZsBd+L7V6Oixxol/agKMSUHym
 leydh0kAKHR5K080Tdn60CLq5otcTzef1BIJd725BH/4StLx7OOaHouOuo1+nh+odItQP21Hr
 mXcnBvWXau/Gv/vJqTYd6+zt/c/DnJX4gYiwtAO6JYwth2W804ATNnBw0otHAMrhXRwP7cdZJ
 qfQCB1uvOr8qY8D9Q77nEpOqf2PkBvUEOtpo2AS8Lb6JCV6w7MBsyrCXt+zXnmIIxoB3eWFV8
 5APx/POdDVkurMiYZeQFIB8O/ftKl6FWTjKWOfJKgmTwpwSr57ZbkGQJ8AJQNaqhAMTh/DyM1
 tOUQ8dzg9LGvVtY+Uw1SwE9QkAhNteKW98fCTaoPgMh2tCuk8/6a+ieZeODmKyppfz0NHiiXI
 NcsOLtKK7InDf7wobyVTgPKxk9tsbYbVCYz58ElJSW9NLNKtvWPQxFeZZG7+Q/erSnL/N0/nk
 nh8JWeLz/9KkwfWsYawpGHXR91DsktGoXuEKd9a4r5K7s+oWOAu6vnW0WkDs8JeOE6W/FmK3T
 +DGjx3yiOEPh6ywpQTm7gzqmMWEi8X8FoyEB0+6XkW1djyl/6DUCGtSeBCwF0mIHl0jMuWN2U
 Z81ANerc9bDpkDRUYiT3RUIFMPWUEFwjg2P6FgRgBFPtkB6QQgVTIqj0AL5xnNgv8E0+W5Cc3
 Gq0z8gtatczHtm2lVbxJ0mWTAElHwcvFycktwfzCzi29xKwprk3oBHh+uAL4LN5Bqxywjr8pC
 1yVW+uZyttNWBmbamkY1+OtI3jkbjCLe7bM6U6XSjnCpyOEWuXtf5+BSlCA0YqF1ODontAr2t
 j2c7vKjyax/yl8KJxf1mAWEsCbIShQOYddZJrRM2vE+XqM3t97LviJeWOPKshq96+hBBaC22x
 mN8Gd77u78c+gvwrZS1nE5J9e8NXF2uszCIlhR90baTX6NA1v1U85mkMkqMIuZbVchyV3Leoj
 yqHMMyIUxWca0VcnPF7q9J29+tRbFUSSOParBP9lnYwRGFrq3xIINzZQWe9LE6KaVXcrnvF7L
 Y7YiJGD546F8+vO41qXaaWmXDApIF+10imQWJqUjn87vQgoDr3fzLJmH4Z29nDxKc4/dfjtOf
 J5Jac8/EObWTe8jwmFsCS7xAfNQpltLPGdlElrmG5wfJZtFOmUyQ4mQ6fmJhqGB0A+QCUDp5b
 nCyNyD0/BQT8R6Ti/lQmMycPzyxiVX+QQNI4tWtpMxCB1oxLhOIzPieYkRGM6bBvutNJFueGj
 NBVoseg1Y/919KLg1w79Cs2Z/rh2NeYCVFSbUx3TyO8ioYULXZhqv25b1CCc3r3ZiqhG1FfFw
 VDaDi8lnuAvMvU+Y5mKNuoFiwYhrxICaB8h/6TyhIPt8VEU3vcNOBor8GgpKwZExRS0WFwD+0
 w6Vx4cvpvvsnK4mtlqeSV//gnK5VoX1riem2Yqcm+VhoFs7vRUcsR0yJXjTFa4yB643TuPl6d
 kqbnxEPjEMT2ENR6tZO9O655Dy3jDH23NdLJKBfy7PC01+MXAuT+rrnsCJXSvUof7jwOzopDu
 PzzrbsFNJfTSgl5jSoZEWg2d5YVxBGlsakE0clcSjeIgvXi0QbUXW2lydiDLPVdvGKABeyls1
 3cE9l14HY4aYHWy/argcggUH9Il/k2XNIOVx+A240rHVYS0q67qzzKTP6UOFo3sgsxlPbwsqg
 FI6wrQrWw0HJLSOnm1UkTPaFa+L6dNQpj4abzqBMsGmjUPOLwSun6Q6mubQTcBGa3zwFbLM+n
 OF3asYNfuuS+cuwuRuZ3v7NpcsCGRSXCu0/sX/8qLvntxmpaQB7mwRSTNhHHaSM+Zc1MBvlwE
 VhvGFOdxwor0eC8N4y99mkFjLh7EpDQgbpnG8H4Dd2/CaKJWp4LZ3Vu8Ac4BIPV5i3hK+84vG
 BCKBh00dBqRz9Yvxmkd7g1NJbT5SG/Ejlha4RXnZpX989SGaTVnMuLUoWLbZ9SCuoQY1OeV47
 AzQtmanx2+zlAsdf49LlYr7OsoFbruBfLw4Ympskifj0WRNhp1nA82mpm7D/AuzesngNNDMbL
 OxWD7D4dwwyxVlWwR0shD0DRSNxu0V2N9tygYvO9IES1D2hesmxdJU642B6yswjciVztgBUDe
 liqJ2mw5lpqp5DWo9B9pCnDruRmiH1j1E8dG6V9GS5Oex8iEtuoRJKnMRXFauyRQXwNjZxguY
 WcCaRM8M2UnWqjXYJy4MW/KdU131ktZqJTGC/tpyG50Mrt52Wr1e+1j2GK6zr7Za2d7vUwQmW
 H7AviX8MU9biL6N++IaBVnLP23GOIqVRH2K2Qx4ANb4IaGsyK6Lbji7xnsi/FVPtYU4sArGwT
 098t0keKe653XzZAbKV6InQjF9XeyYoWY4OjeCFy49ZF3pS0VkMNlQdmpNsObLKIffu8dQgH8
 ZyTt5uedAQqyLDflCoVQmOEvBroBsdJLkPYoRWw2pSpBvqbMy4Kuo1eaow5rGCvCVcpDLPAZl
 1MiuWGn66Gd2Yqf1Ke+PQtGoyUXIvrZ4prq5cL3Ks9uyU6gA5D6yq8b4m1X9JnOWobmsWvF3Y
 /f8MAq654EDJYhE1jOa7v0BPHX2DuPLkizZmmzueKVZ/wJqbP+VfsS4N4PSANMTujvDvRc09r
 +x5WQT2ULpuQ6cwscdYjJ2nxofl2JDO9ljWu5sGsyTAUjMbxcoEi5bzeiRc8fVH1QP2sXMtva
 j+14HhUcPpgjNaJhqdtxCYgJyY07IyolCchMecsqmdYsBz0rdgYJXe74BSgeNpTE3PhLv5vV8
 oZvnjPBLQV16HXsUrXEaTtWD/cq6disI8TVDGIByNhvN7pdNiXa83dkyCmlZj3Ar9enk0MG0K
 E9xWKsW/+B9BGVVDDM71LCa+5rmfjPMAqC7yOitqZK0cekagH4ZZvQmYPk7o8rLu/4d6ZbBQL
 WUryD7DFZfRuhqk4MQhTgEFrkWhZ9yNdTcRdKhVWJ/F7tOpZF/yWVFgWaEfYY/cfOqY+e9UM6
 2fO8+PGxgp23VWJOZM0mBxRtFkzf+8p94XtkGYwbp4rTLX+y8bF3hf9o3tR9R2ucbXDeVfQnE
 ktXB/e82MfzDmmzW3A5sgV0+kpFU34pubFGPWhI7kRfxV6SfvKeyn8r9lZWKNUWOCP32Tumh2
 dxUVvhJCZI/aRfTw+YMBivfeMAD3DubHX0sPbyivZtyP3ozbH6IJ8glviumU1x1TXKGh6T7p5
 Rfp0eIEI6/YlQfjekSV+jKW4MOA6wnTSMAwWmZOErwNQNPhDei9fJtmwNhQurkxbIvQscT9mI
 mx8DcMivfphpPlciGmtLSxDCmhckjIonO3n8XmoF683GbtKPfXhiHrefVTN+vyeiidCgCN37N
 RESTWNReoP7/JGE+lFhOmN1zPjsAtbGI93bqeBU2bTyCYP56t0C4kJkecMs7k1vXeZ3GKeT4F
 3z/ONfCLkykUoTZnRhlAL043bGSOVYkisScY3uKCDRH4Hm2jIW9fljI6n3lbd1mBB2vdP2CJN
 89aYhRGQKWU0Afm/ObiEsw7EfpaLIPKzrXQDMZ87sBf7jBlgnfYUUBYEH2JqUFYpwbo1r6mj3
 Plla01+KPJGhSNCYIGYUGEX8cOWADVO7F14Qb1hqds73PLlQ/7kIO9Snongk6NJozEeak+T3V
 S8YXH7cEKLiKDqkDLcx2wZnC96TOR8/9h0XFjBB/5Gft/2ne2jp96crby9OT0hA1UqSSrOvxI
 Esn4SnAeRgn+37YXaE02u35Qh4d4XwF1McBH4Urbtima7F1RXfUaHPJuwK5rjggPOG88Bnl9c
 SG7AskxCcOlfVX34+47otftFs032S/Wd8mAeQe6Z01aAZJyB/vaLDyVJN1OWGDMkT+HU1diBd
 ZNl0Nvcivx7t6EIzDaU4CjLOkh2zNfXrMqcsv9NLt71A56I5p0QmxKlxNv9TqF0xlDwbR5DiW
 6XunVGpDeQ2KNELKeWeLHVsfiLEKVlz23jr3goEv3ODh7JSRDdfZUkLVQxNeXc953y31F69FL
 ibVfZ3pCgxZXEZzZhA5WogYZ1vcJx2lMYCkZaM+xJnS+DuVcY0ZTvMDzzszw0N24otr1wIkaL
 XGNoWlaxGA2tvxUAW1nC2Nd1ds3ajHg7oeClm4bTX2p9FaB7Y6B4qil/XlVEFoUhdnPhRyAsh
 p3OV8KziEpssia/+s1UjjKmZ2Z4q25aTgnUdVuc4YOdLvvS5rayEyRJ/P9iiyJW+cuIgiB+Ps
 +IS3u7IWzvCGUN09c5t1EQLAIhugVd9KoPs+iPBI2Z70XHbTzxJ2q1f1RPQRno6ZNPNAE8fax
 jKxZKSq44dZLY92ApC/NLiOCzPXGObCLReUq+51KsQMH9WjJrRF+js6NTr1l37lbflV3hKIgw
 cyNdrDHEr6y4zVHKFDrq7H8nUaKyIr0xO8O3cfQDqAGthUXz1TaPI4LoX7r8K5y9kLxd2T96W
 7+wTzAvJu6oSvjkqUAPtgjSPpyxCLEUGSwzj2IaEu6J5BCgM9hOo2Aux7//WmWXKYrWHXdZG1
 CE2n4Rydf8ncrD0L2IvosWRH6BwXXfU0Igaxu7r4TpSXUcgzCCiUsgSzZeaFQVDr/hnPCjBcv
 u9Ksmekj+iGNfbvZeK1ruo2vRciMZLvhD0sk8ZU7c41UjquDbwFV9QqY0+Iz2WIQOwCc4LQCP
 vkHTxHlnpdQh7tr36Il6xdkNuLa2NTvrhllLuJZnJNtqixxuDzSdWOsV9q4C5lpaylcPtP/nv
 v48yaOubJLAHhKBz35O7AEuWfjQrMa8DqyLF4gWN7RqZp8IQg5R6PRRSahzguToZGe3kpBxtb
 eYjKxONAl3x2SrWgTewcSTL6t4momImPZNjm0lGUk/V2a8Vvou9mABXfv8wro1u9aT9V7v50P
 nvDBrO99U/5mUtJn/3WrfpyanH8OcUSGJ7OS8YTDX2dJHow4CtMb7jqr3FM+VuhTbQaTDvCsJ
 KhPvWQZVfSMQWbtlE7kZgxRAtN6PUU7jOeJ+qUR7EWBymQBcakC34IWRXze7KLvs4LgbuVNQA
 hAUMUg7EJNGXGkM8E7e0aej2zN+jcYJKUR6xWgv6GnV0nzLnDsxe9Xk92TlyP4KaW9cNT9/8e
 tcu+r+tvar0clCavH6kA4t2Gt36GGDELJjxTvlJuyxlqik2UY59Bo+WYLuN1DlzvEAWxx5DpR
 oDL/Rm7Bm4rQv82LeErGbbzRSkyMVmNbvcgljY2XaawAaXMNQdOH0/EzuvdH2D1SzTuW9Z7zD
 rkZ7nOQ8IEZeUxezpPow0jN3COuO6PywhGhzgUdSeOozyG8JQ7E1HRvTW
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1777107428; x=1777712228; i=fiona.klute@gmx.de;
 bh=oNezBaJ8X0oM17bU+3yIat0M/0Anp12/ggR2Q6r2+IY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=JFyyI+u3650rA7bKZ9HUjUFOGWOqNxkeCvXtYi9x1sywYXXhDPEbAHNwNipJ4p/3
 Z7iNWOACwEemUobchfY648gP8MbEnuYIrfzECZ1SXU3v7wLa9AaSQTuZr3yBPd9Tm
 knJ45mFN2VyF8WR/85aVGRxHkb0SGtDDcDBJ6QNJd35b2LP7xpm5D5gBdBWqIL+rv
 s2PsqVGKU/coZEGm6X9i9q2sTQyICfzKMYN8JuDY3JEi5t4K/lQIwmo8MyHfjmmgD
 U09cscsEOIvOj+JBINNgBPH4h+XDJmFWKOrW8Cna6m7gL46QZuqgJfLCaPoQWYD2y
 wcQvy9p6wA5R7/qlaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=JFyyI+u3
Subject: [Buildroot] [PATCH 1/5] package/kmod: bump to 34.2
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Julien Olivain <ju.o@free.fr>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream changelog for 34:
https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/tree/NEWS?h=v34.2

34.2 contains a few bugfixes on top, see the Git log:
https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/log/?h=v34.2

Remove 0001-fix-O_CLOEXEC.patch. This patch does not apply cleanly
with 34, and while it could be updated easily it is needed only for
kernel versions before 2.6.23, which was released in 2007. Older
versions should not be relevant anymore.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 .checkpackageignore                   |  1 -
 package/kmod/0001-fix-O_CLOEXEC.patch | 48 ---------------------------
 package/kmod/kmod.hash                |  2 +-
 package/kmod/kmod.mk                  |  2 +-
 4 files changed, 2 insertions(+), 51 deletions(-)
 delete mode 100644 package/kmod/0001-fix-O_CLOEXEC.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index f4a428d4cf..f24cc77e3e 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -466,7 +466,6 @@ package/janus-gateway/0001-disable-ssp.patch lib_patch.Upstream
 package/kexec-lite/0001-clean-restart.patch lib_patch.Upstream
 package/keyutils/0001-fix-install-rule.patch lib_patch.Upstream
 package/keyutils/0002-cifs.patch lib_patch.Sob lib_patch.Upstream
-package/kmod/0001-fix-O_CLOEXEC.patch lib_patch.Upstream
 package/kodi/S50kodi Shellcheck lib_sysv.Variables
 package/lbase64/0001-retro-compatible-with-Lua-5.1.patch lib_patch.Upstream
 package/lcdproc/0001-LCDd.conf.patch lib_patch.Upstream
diff --git a/package/kmod/0001-fix-O_CLOEXEC.patch b/package/kmod/0001-fix-O_CLOEXEC.patch
deleted file mode 100644
index 145ac34207..0000000000
--- a/package/kmod/0001-fix-O_CLOEXEC.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From b39a62f6682463bcd47480348fac3dcd209a19a5 Mon Sep 17 00:00:00 2001
-From: Robert Yang <liezhi.yang@windriver.com>
-Date: Wed, 22 Jan 2014 01:06:40 -0500
-Subject: [PATCH] Add dummy definition of O_CLOEXEC
-
-O_CLOEXEC is introduced from Linux 2.6.23, so old kernel doesn't have
-it, we need check before use.
-
-This patch is much more like a workaround, since it may need fcntl() use
-FD_CLOEXEC to replace.
-
-This problem was reported by "Ting Liu <b28495@freescale.com>"
-
-[Thomas De Schampheleire <thomas.de.schampheleire@gmail.com:
- - move dummy definition from libkmod-internal.h to missing.h
- - update commit title]
-
-[Vicente: Adapt this patch to version 19.]
-
-Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
-Upstream-status: rejected, suggests to add in buildroot instead [1]
-
-[1] http://news.gmane.org/find-root.php?message_id=1412062906%2d27378%2d1%2dgit%2dsend%2demail%2dpatrickdepinguin%40gmail.com
-
----
- shared/missing.h |    4 ++++
- 1 files changed, 4 insertions(+), 0 deletions(-)
-
-diff --git a/shared/missing.h b/shared/missing.h
-index 4c0d136..e123e98 100644
---- a/shared/missing.h
-+++ b/shared/missing.h
-@@ -19,6 +19,10 @@
- # define __NR_finit_module -1
- #endif
- 
-+#ifndef O_CLOEXEC
-+#define O_CLOEXEC 0
-+#endif
-+
- #ifndef HAVE_FINIT_MODULE
- #include <errno.h>
- 
--- 
-1.7.1
-
diff --git a/package/kmod/kmod.hash b/package/kmod/kmod.hash
index 46a2d538ad..032f96adfe 100644
--- a/package/kmod/kmod.hash
+++ b/package/kmod/kmod.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/utils/kernel/kmod/sha256sums.asc
-sha256  dc768b3155172091f56dc69430b5481f2d76ecd9ccb54ead8c2540dbcf5ea9bc  kmod-33.tar.xz
+sha256  5a5d5073070cc7e0c7a7a3c6ec2a0e1780850c8b47b3e3892226b93ffcb9cb54  kmod-34.2.tar.xz
 
 # Locally calculated
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  libkmod/COPYING
diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
index cbf89bca9d..db9b3cdf21 100644
--- a/package/kmod/kmod.mk
+++ b/package/kmod/kmod.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KMOD_VERSION = 33
+KMOD_VERSION = 34.2
 KMOD_SOURCE = kmod-$(KMOD_VERSION).tar.xz
 KMOD_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/kmod
 KMOD_INSTALL_STAGING = YES
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
