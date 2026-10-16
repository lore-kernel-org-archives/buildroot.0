Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 245D1CCA462
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 12:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA6EA607C4;
	Fri, 16 Oct 2026 12:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3jGdZ3XYlDaB; Fri, 16 Oct 2026 12:55:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A52C1607FA
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792155354;
	b=dBzNqBLcDb/L7g4z6++9R7KY92mmN3bSeMDIQCWNvwz+YjhufY3mQ+WUslJsbSqI5J5F
	 /3kbbLcWv56ajmsksUw5mO2fUr8Ew7bfik2U4eWqNdeMCOZdArs2sJevojm3m32wxXiWY
	 3H2hviDBEDZeNmSMM+eBH0dA/ZR2wz8sFeVIWKudoUnSnOjb/4nMbSMKNx+tQ/NjkwWh1
	 GQuAiVh0Kfv1zMlK087gJRToGI2h9wDtYwbzRf2MObGeIXwcuxPyRWj2MIWw/35RnmNgZ
	 /+KTQMOgpWb06kuE51IDqIH1xKMWSmX+msTkxI4htBgMdP1QkIDGiowtpwmK2h/escQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792155354;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=6Q07qXdnbcseNcMU5c2pZA6qgugb2OIuC+17CrTlKUA=;
	b=rr24ebdMFUirDnESNLFwmg2Am2GsISiGfuIc31DNLCWcFWGQLmTGNo2SzJd9f73hTuW9
	 33ztQVXTAZt1unWm7Te1k/6wlsQQO/2A1biS9cJfcMYcHMs28XctNB/BIslbvtuS1lWPK
	 WCNX+vvFVSzAVkeoFtxHaO/f3nH5/r9m+qZl1Q1IVw64XpHMDI+Wu5LFZNuaVwlFnlPbr
	 QQ5h7FqZ9GeLSOf3s+EFhuMS2U6CwM7xjLzBqz8fqScjcUCWyv5wAdIQo5gIcEXa42MiL
	 iimqOinYSvt4CiIE4Lem/Gp12TaOFeZuekcPdGU9Docw3ROp9zzEvHdh0Fz0pfOwFGw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792155354;
	bh=6Q07qXdnbcseNcMU5c2pZA6qgugb2OIuC+17CrTlKUA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=aA9TfYMl6I6LyFmApiZ1jlDBo5RlOhAwbN/QNjsDBO79hhcDadn3m523sRz/6lWcq
	 rlBMMBIuh9+vFL+ruraIUVrA/nVzr6/XJ9+6SPjo3EFbtpF/rTFLLbp3tYAqyiSchD
	 5QIEqPJEuMnlRHezDvuL4yjcIlJMF4QfsJQT0U+aeQYbYRd14ozit7mBpnPeTjxuEE
	 4ZwkyHEiIBKFidZUxncFdvlqzWAQ2ZkBfak+ZdKm91DmP9GsPIwTtPKp54ZoNr2zGZ
	 Soj7MGNgWTudMl+tjehioLL2x4cQ2VHyvJ8w4xrla49X/25hcUyd945FRyTEJGlCbD
	 DziOFmxAL4ZvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A52C1607FA;
	Fri, 16 Oct 2026 12:55:54 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D1CEA1DE
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 12:55:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C44E54016B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 12:55:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MXg9ECn3-Lbe for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 12:55:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2170440042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792155351;
 b=ARzZQHQe9M1VnvY4nLFX41pGBINnaJR4rH8kgZB3pE9/JL6IgDT3DIQfGaiH/Ikvrnr4
 k+atwet45KKlZxfS2SgQtW3VkjvrkiiUh70E80hEJZa7J5EVbo8rSzoUp29rx4DHmH5jp
 bhkGoDomptD6ET/mqA9chD62gABiAY4TxJo2sZr8wIBx3TlJV09zsZ/uWi7qXaGa+WKKt
 ShQO4CcOULKt8evf7dR8YzMMdPdcrv/l8ltpXUgIzipwQ0I1O3yXzVhNB92we0+1/g2ZR
 jGfwKXcNUF7r78UyP0QE5LGlc3POjDNp+NnoLCRhdQ9YIX5lsTVrzB3UeaqAZAsCvVQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792155351;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=YR7SqGuST9JIRC5yQlTwpIIuEA39wGlQ1sxnZnDw6x0=;
 b=lavYKeKtwnk5lV3j2YRriH17UlvRw3chy0syR3pFUgt6t8JCPPBOmrD02oT038S9z4yN
 3KEqbSHsaOd6ASpCrNcZ872QspALDORYaWshuP4QAPD4aN/aMbdVwZd3dJ/yUzdFYabAe
 ECIcOVLUw5LdTk6RBrchCiY30TWm+zOHUSWsDOCX+p9N8c134CA1jUkGdyurI32zFY0x0
 IMgxvckh5YO9ex9+8porIweiFZ/x7gkezkEuOn70WSDHKdmZcp1IkFkMXeTk8KNG5YpUq
 +9Xnl30G+pcfuASGgXuiNMyVc87y/KowjsiEi5l+rqxTIHDbKbvF3uRPgYm9qfVJf2Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=gmx.de;
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=H8c7O28S; 
 arc=none smtp.remote-ip=212.227.15.18
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2170440042
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 12:55:50 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MbzuH-1wleNX2VwN-00lAMM; Fri, 16
 Oct 2026 14:55:48 +0200
To: buildroot@buildroot.org
Cc: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Fri, 16 Oct 2026 14:55:27 +0200
Message-ID: <20261016125527.1314651-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:j6G1IrWcdhhFueQXwFR6c9X4xL+8GBggN7VvDZV2D5y0ggZszSd
 wj27MtgUwu3w7jEjlRNlYAkTgmT+1b58eZa0wUtRwW1VUd6zBYHiXY9yGfoQ8QEn7j3+h7O
 GsSK+gg6XuCEshVn60vfx8GALSpiBVXnxOQRHjPBIkmcjdzdOLb8xH0R+OSfhjfItO5b2gL
 XKL4nFx3fy6PheYVW4L8Q==
UI-OutboundReport: notjunk:1;M01:P0:cyezy7dAVmo=;r/vdg3qQ++pvVp41sRyTUl/nS9G
 A7Nz7DVr/ALGJuk4HryDHug/OyBtdcCDSBv4i4ak8g8/x1C0UbCE6vJrrBpmqsJnabYy75zeQ
 2EZsagyb3H7HSW1Z5jQyKS7uKpllzh8bRK7PdeVCr61IRa2q0YI4m3rkjW9cQ21VI8jZQ3gn7
 nFPWSYlyKESIq5HezJNQLgwUI6y2tMiuMCrZqC3a3LQ0Hxee/IinVQohqq6SdThFaYgypQcBT
 /jQRJsJGyZQY93igis5jpPIX/ZzahvXBMrsr2O6g2io7UZlsKEo5eIh4Jrvzao1wrMwh1Kofx
 6hpRyRAPgQGT8Cc1Z/ob9HSnZvr0xD1ArYXVGU79BnwO9i/U9h+zrlhl+1cbhLR4vvWc+niez
 tn9yfGQ18/SNJL9b5CLBw4V/3cWphQJDSlEKg4K0Z5ByYLT89Pys0crhbJsz69yOCpTFGYwev
 Rw2VjHodXmXPf5IfF0NdQB7/MCLubT9h+B3Z/3/Rl6/sbEpognuB4a7OLKbduIjMDHOa2NTzW
 xG1YmKCJ8AACFojbOv0g0zx3jkpQ8xSxxcpi3LFvO1XMQCUPhKy5VnphTTgfcoMLXTA1EhWo8
 9OQwd7eg184KjkT6rNDk55J/vszA1GaWKWOPbQuCFkWbN3PPWeINLbSpxh/AnGLucH7fXR+lt
 34qWaRIORb967B3UJN6r2lCcVdIrPqVBlnzFiesKo5uvDFgvAUpU4N4N9/JdywQamUV7q26F/
 o4Nt2767lfzpCY102wttounz4/clPsupM4SgOzejW9HrWSeV6S9/SjpJLuDC8pfukUlbZLLQn
 SIxetF7UgryHtJidufjpIZagxzeG/v47e7d+xujRtuKgiaaooWJhVLq/Djl2cJzbzM9DhW7YS
 VfetvBDIVG6oy739MNxWPVfaQqd996LFGpCwNyAYc5rTj2nciI5Nt8vYgAu60qDJI4ji7SNE7
 RHlTerGiGkBR7gR4dGxdTacDLLpwOsihLlESPvrFwsd+he6bFaCmxGG2qu/rCRCAqnMXzfdbX
 hRGR13DVf2VFiGVF83WcIF1OPJ9M3YKhRMeqCoWAPE4Dr8oAqTFWoyKf7StFaZxIibHN1jWDW
 3qsFadBkOKYRiJuXF4dd+smo08giJo7xDdKx8BVBrbG5jR3ipB33pq23MFF1xDXYteTiud3CA
 rMhSHTSkYyvB5RXyUyCN61xfSE1fdXbHon6s9shHRF4CFCl9OyBih1p/SJLgQSvq5IcI0JII7
 azOLNcGmCM5Ood0kQfzDW3x5c6JOe+2sdjTL0vQwW+Mll3bSicofxyufK+iiQeBUmSnlT+nlR
 v1IfqHL0FazF0QC3xukvV06Addlzdl+RVTFcGgHRHKvhWDJp9Ca/3Z9+6X8zsJwTPtB6vlsrr
 psU8X1FvOJV6r4QSLDPFOg8Mlbx/yHqaJASXGPydIzTDjTH3mkLS/FZdOUlsEygR9GQqZY0l9
 bzrJrzuueyLgyjwoiZ2ZdM7AcEHhOnkzveyot7WqsN+6KzumDtfRMCpAzkCmMui19YnCwiU/5
 ZGL76q4Jh3B4HVfan8BnhYEqpK59e1wD3bE/EZBw7dyhiIILunkgj1E5pMXqSxNrHFhMMnzs5
 n2btm4xl+cqJ4yJE2gh+jUQ+ekZN9w4R0zvY/6rI6llBL59burO1ikZjC6GOclBraIUqh5CSe
 qRz+9JrDqmPkWS8EKng77PPJgrZjrf6aYCShn6w1mTGy5e6y0CbrQqj1E37lSqpfbDRz3/4Zr
 e0hj1F5bU3vne/4rD+m7ApJpohVnejHBqnriLkeGwXuvIv41Xpdfe3xZ3bcjAK054nd7zJfQo
 8Beyv+gr+mzLDUSOZ00oPRgUGpQjqBrYrC/Dthhydq7v8/HZFtsIsmvHazoY7bdmvjtJVsbf/
 yzzmrUjOTctwPjevgNFAOR7awFtgPtOyWRp79T0pX+ATByZtSn2QHQUBObOHFqitMyH1SPH2f
 0e8R9FT7Gir46UCdRWIxnU7hrDGtJds2oSoT/vUgs4o+3D6LWJ2RJiA4zTgHMbzRCZhcwECxG
 GIq512IVvZlktyMpM+qzROO5n0TKrJKWPpCRMz+5rPK0Mk7p7uUb8HdD03eofMmL2zpN1b/E4
 5A30JAONDd/xxpWMWOUbTXusPLD/qH2W7IwcZrND5wf5N3+/0FMA3dhV6xrF1clF9hVYXwNuF
 lixtjXh7s41pWeLCAb1r7cbwkmGRwZqTkK0c0+POuB7r2ZMFHGEErrAoWsEkOZ1dRcYFIgAf+
 ybwGqBfOPLwjALbSQNf2Q4VwIHgPK+MtllsYi0+vqlsgQt64rC6Rj5TlOfif7McvR9jNJJxP2
 VQ4mxfvWXcOXgW5cwR7q0svjumM6rDCFUhLnceDJE4gia4T8VkKLT00uzaL+k/P4lTp9wVXJ7
 XEBulGRVnsKezyMLqJKdkU7oq2cjNaficJtd4jgGpUkgccp1NtIlP5f7vy38hwaJIs/eBjHSS
 LbY1AefwlknSXZ84W2ZhCtvtV2P7JimltoPqJ4609I++qmKZmdT0zpTlRr4KpJ6tvU7H+17oW
 p69agVE9nOGEIXPMZvlQiRAza3U/51tMy+kkljkKb1dpCS5WiadFglRkdvQme8S2HRqC1fHSB
 RBA+jgt3T6CYH9JlT7JDX89hD72thEYNX4jyZcWde8bw861gJBfASCWXjhyV6YoMU2M4VMQL3
 R2i4vx+2hY7C8+QWHvsd32iyISmWRPk7jKV8IAoua4hwdVOxVhmIZgpcu14sCPI23xwhYakqf
 xCwjV+kVBD5adIyUCpie9EX6nbPsWE+oTSGa0gb6YhX7Rz0h2iRMdygkpRVbFUPxbnCXt1Y4A
 T/6z3feFYneP3p2EylkDcfYBtvxMMnGTz3hTwg2oPvRGBzADUxuWM67SW1eb2FS/JZ4xqznpM
 tyArjDzjaPeeiSs+Eiz+GfaU67ztOkMJ/qAolEP6yC3dnUPYTP4DT7opvwx2VuWvGRb8kTH2X
 /9k7qvEPNmiwZ0neCb2a+FWoJrOGNvBMCEHFVU0A2O+wafhLeZedyOpHEgfiDqfFkWPMnKJam
 JMf1eCXpNQEhhgOk5jjTekUXkvta4I6BQ8AsJz02n8ukk0+xEZa4UkPasIMQVxP9f3UVv4yJL
 POYo2gp75I6UL8kJ6jdBcclL1XJK0sKV1qMcTWHTRxkCUepLeKxz9fpAUHZw3LRZoF0bGNI9X
 gWzmnB2iDCF15cF6bnTxl1yED/k9V8Miq2a2+JZ5thVTVpqPZwyVls/jpPlIl3EPalj0DUrWQ
 180jD0oJ/MtFyHGmiNmr5ik3yE8dto1rzy9c+Qck25+I6CR3q5b6QzxkXSDaY/mkiSe4+lwZO
 Zptlsoc68pZY0mCja3gIZbqLwttK86rIGq8r+CzvmtNuIUh/8M8t5hpDGwzLYroa32kpcdmEh
 LYnzaoOwnIMFPHgyuFRVHNRz1ABm8+f3tFzy1jC+v8Fz2pPBvoIGKxerNkE+BU2m/qjHTx7ei
 efPtlGFoxE1Hm6+Rb+Xymgf9e+otmAwX4XNmQjC9Z8pPB+8y1q3DZZhzaV1sgfZde+BtpyRXO
 crPy8Gebd/jjfDVMXymo9jXtMPw7Om3A/jE4sXVTfVX1nZnkn8UXBj/ZykfKXvl7OPGu6kIXb
 3p/kjSGtv0yBbQNMWxITehlvyPHRo/4twhMvRzmvD9x19M+tKApjP0TVqwlBV0/v2kqQ35hy/
 htQxeq2YsJv67eCk31Ii1+m1xo21Z4e3pdyUdpouPN6aBqIINk/IQIhS91J42STZoXN5rLMU/
 67fiD5kp4FdBvpN2XC4pwqaE5eAXbdiy3TAWpgLiwj8MH1nnWB1AvfI+ajfkllSzbeIWxlCl7
 RXLUIKHZORoYAZjiaOyUNrKwRdSzHqo8zev3T1idoPgrqfb+cwFWZ/snqHVn5z1eCAFBo3BT6
 rHugFePnfHXzslUd7xvBpEHYXoUmyAfsiWbWTrprGtzZHAV7hKDmstEUPsl5O2eSaIH0LloP8
 IgciGOp6tQMN2YTYom/imZOgXXP8rsWOmSRspeVa9/6IyForrrlUR83Dq9CbEWspguSUa7TnX
 AOhwaWRgHlGaioDGxiS79oxU4HT2BJCvkBGf39NqAbONefrH1t5Ifnj1W3pYUl6rS6/cAFK5l
 U5C+qHGdvQq+ETQvI1VxC+NVm7D1zBW8VsMKCm61aObnQIR/FL8JREGjbEBQMGko/Mdi0Ftpt
 AowgiwVN9tInIE8+5kYRk7THU2Kxp+rz0SLHusu08YA5dqprpXtLXYvTYlrOuoqFEPfC1a2by
 kI9tF1VcSnJrqFXwwnNhQA3+Vz1yuzvcdb2NTfqTU/sL6YFHQdlLlY+cmp7FvhUQvHjUmRZQR
 Vpes+mxgy0Rf1JitO73k3wcI5dkzIOKG448UPPFtcBUDIBJ0merL6vu8ONFb6iw3SwWliocuX
 jHMtimelegas8ASQRz5akH1KQt0Cpv4h64IYPFMlY71pOHDNvUl/CcfKxkXrJj0aOXd6UtATZ
 HXf1oX3DhcHBu/sRgBnCF2glbX8aJ8MdDf/vbl+gwSA5f55CSCe5y/Bi64zjWoDza3zJH0Uj0
 PZwRZBDe1PUljEJs7GHafJUyztrHgQ/znbjEeakwcLssRSjFy20xhKJAFwcfSS9JB8kZFGOEV
 BK078/+MRWCLOigA8PSp41opHn3/Ryqa7iEzMy/1/K7lVSPhI6oX8WWYw73ll68fQl1w1gahl
 t4rJhyUxcE4v4cXz2zoGiunxoRP7sXGdkXCE7b6JmMeyHFh8IxcoKEQHBH2w8HkQhbzmGgRMk
 7xm05bRc6bQXEEEFH7d3kmmmJAAXSpPjekmPXAzKlzC4mH6wQCwM/dqI+2+uToB6zuFTTYaUc
 ffieVV6J1W3QexL4mXilC8UR+kMAsOx6rQ5KjX4ivj+o6c51jxfttLvwcpd+m6I5f/806q9TB
 mQRFppFEPOo2C15SroCda7ogHAIaLzfT9yteDYn+2iVSK/kCS35063vs8zYbh1s8xPPBEh9lC
 CQ3S7F4+ohWK/DMvUH1KRbWIP3kvGxhzr83y8BVvpMYZPXzoVCtj1+OKf+V2OrtBnCO5xvq2v
 r2cH3YYONEOI4z1f/Ll9jWcS6wf8LkrbxeOuk1JSjlvUr+UxfSGnTUFkiRBvz9gEj4+INvsuS
 7wooaNLzQLi7WTkmq1bvg1HlRGxvCdhPVAcT/AbaOsEo8cfDrUIoZym4HW5dEpF0pgIgrVGsl
 Io2QNnYf7Zga/KfX0Y8uWqdhIEhFYr/fvbhEA0qhj3DUlglkhVoYKCEyKwOby3nyBrVmXUYmj
 PvzR3TU+xHoCKxnV9fHi1RMn9pXaowPJzmEumBaB98btVG8Pt44foILenRtcu9SimgN9lHc2J
 uauSeZm48cWOdqStwvzSE3q7LdcONVpYhAeV0xOEQvNQhcRg8qHII3lqamLV8dXsjOU9t/D87
 sl6WCfJ9KgzHvzA9AdQsxOqtPdmAcvmsTpEfGpVltIO88VXOVQp+6C4t10nazIe73RHn3arGR
 WRBck/jakO9yh9rd1vZ+hjfgOjaOfr4aqp4zMGu12+dnvXGHTUZ/oEUrIvWS75Q5npVpCp/tl
 VhXw44WOIVNiPE/G0aAsOt0CoGgj683pfwssL6cJnU7fPGGvJykKlo0HomcGYalEB1i8D9i0J
 UoPDZSHUxCsruGHaXm/yz0XvxUjc/E5qTFgaITwg6FlFQtyJFgNLyVy+D9G6fKfI3PZw4cpN4
 KLA6Yh0/b4aioRUgLdEh8NFMXOUZDf4ZJt3UgOssrFJDNcXWrbhF0JnVghb35jZpnxH7oR4Zd
 Mc2cnUJsGThmDZBeLr13c8E71/mtNgcpsvZfki2e8aTyRLiVmpUoAmDXZVltnhmrkOqFNpJOw
 AHqAJCnePTrwhJS3UJpK7tWkgPR8ZCYPdscDUnwZV/B8u1cfWO/84k+BpbmIMpWKeLSIKOKoA
 FUQ//i4hij4bpcQBxRDODMNDTLkijy28Kn2yM6CzXI+WJ07dv0vaycyS9rBQznnNmw5mkxmbw
 Mvrl4Yr5HFbwxsfOd6SPzPNjzcAFVUaWm6omO2/7ReRU9tnviZWhlu1CnHGFdojBuP/9GcAR3
 G3cd1YsbNd7zUK9pCOT6+kV98YRP78vRGk7eRyzsjD3U86UPyFBzvVtkwm8VB+RELgZ3jgIZT
 1OFiCT4hvs7Z/389KEsR12gucyi69MOfHkxneSWLsI2vhGUTUUJe7Hs7zdJpWQJTHbk9wFsB4
 AGD6I1Rh95BKI1KoQWHjVCmHfhGgZOHXDwJPmBpG09DWdb3jvak5XzCBXjY6RHvTs7XWO2KtP
 xKYLTb7kLZW8qtwTzQ/2HeiuBRjxJdKCmbNbMfoBRL9Q1mCWjUQbFtfJ4j48fAwTG+iYcmbVC
 kd4ImWQHBN5v7PpZxBmf0OoQoKcpBM/sQ2mRivTwjt5SfeVcgmf4NmmFOUVST08mSgI0vk53M
 Ypmf4mzP8zwvnm6PYVJkro1LhC3o92/sVsXycA0HqLT6ApBbvLXLTX+eyG0rGCN4/zucDX4Yw
 O7wHkFQugWlPuAKAK06zQ3Y7VBbkCBreGDYaAHT9ROEf6Biu1W62p+VjXHWbZu/Hi5Et70NAn
 7nj5gA5UewmcPH4RsC//+jkl8VDpkCHSJy+yZbsi3Kpzg2wgaVnJ+R91X1uLsYy2B5cON7y7B
 MST6L2felPbeH1O6eceuqTYTyc42fK+SNhwItKTJdwoh52fLGy3ZsHNLct4sWh+11kKz70oD5
 x5aN9QWL9YlxXjaedVwiRBONKvjlTbrC
Subject: [Buildroot] [PATCH 1/1] package/fakeroot: add patch to fix segfault
 with glibc 2.44
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

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Glibc 2.44 changed handling of FTS.fts_statp in a way that causes
segfaults when using fts_read() with certain flags, please see patch
description for details. This showed in a Buildroot build on Arch with
BR2_TARGET_ROOTFS_CPIO_DRACUT=y: dracut-install uses fts_read() when
searching kernel modules to install, and segfaulted.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 ...t-FTS.fts_statp-to-NULL-fix-segfault.patch | 113 ++++++++++++++++++
 1 file changed, 113 insertions(+)
 create mode 100644 package/fakeroot/0001-Do-not-set-FTS.fts_statp-to-NULL-fix-segfault.patch

diff --git a/package/fakeroot/0001-Do-not-set-FTS.fts_statp-to-NULL-fix-segfault.patch b/package/fakeroot/0001-Do-not-set-FTS.fts_statp-to-NULL-fix-segfault.patch
new file mode 100644
index 0000000000..9fee69dbed
--- /dev/null
+++ b/package/fakeroot/0001-Do-not-set-FTS.fts_statp-to-NULL-fix-segfault.patch
@@ -0,0 +1,113 @@
+From 5b72148221405de22589011e9f56247468a2c51a Mon Sep 17 00:00:00 2001
+From: Fiona Klute <fiona.klute@gmx.de>
+Date: Thu, 15 Oct 2026 18:25:16 +0200
+Subject: [PATCH] Do not set FTS.fts_statp to NULL, fix segfault
+
+Glibc always allocates fts_statp since commit
+99303f387179332d64e5ee34a6b58e82a523bae5 ("io: Use gnulib fts
+implementation (BZ 22944, BZ 20331)"), and expects it to be allocated,
+including using fts_statp->st_size to indicate whether fts_read should
+stat the entry (see fts_set_stat_required() in io/fts.c). The
+structure is reused, and with that setting fts_statp to NULL causes a
+segfault on a following call that tries to set a field in fts_statp.
+
+Instead of setting fts_statp to NULL and checking for that, check for
+FTS_NOSTAT and fts_info values indicating that fts_statp is undefined,
+and leave fts_statp alone if either is true.
+
+Program to reproduce the problem with glibc versions newer than the
+commit mentioned above (pass at least one directory on the command
+line, files do not trigger the segfault):
+
+int main(int argc, char **argv) {
+	if (!argv[1]) {
+		printf("no parameters!\n");
+		exit(1);
+	}
+
+	FTS *fts = fts_open(&(argv[1]), FTS_NOSTAT | FTS_PHYSICAL, NULL);
+	if (!fts) {
+		perror("fts_open() failed");
+		exit(2);
+	}
+
+	for (FTSENT *ftsent = fts_read(fts); ftsent != NULL; ftsent = fts_read(fts)) {
+		printf("seen: %s\n", ftsent->fts_accpath);
+	}
+	if (errno != 0)
+		perror("fts_read() failed");
+
+	if (fts_close(fts) < 0) {
+		perror("fts_close() failed");
+		exit(3);
+	}
+	return 0;
+}
+
+Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
+Upstream: https://salsa.debian.org/clint/fakeroot/-/merge_requests/41
+---
+
+ libfakeroot.c         |  9 ++++-----
+ libfakeroot_inode64.c | 11 ++++-------
+ 2 files changed, 8 insertions(+), 12 deletions(-)
+
+diff --git a/libfakeroot.c b/libfakeroot.c
+index 69e2f6f..4a00fb8 100644
+--- a/libfakeroot.c
++++ b/libfakeroot.c
+@@ -2151,10 +2151,8 @@ FTSENT *fts_read(FTS *ftsp) {
+   }
+ #endif /* LIBFAKEROOT_DEBUGGING */
+   r=next_fts_read(ftsp);
+-  if (r && ((ftsp->fts_options & FTS_NOSTAT)
+-            || r->fts_info == FTS_NS || r->fts_info == FTS_NSOK))
+-    r->fts_statp = NULL;  /* Otherwise fts_statp may be a random pointer */
+-  if(r && r->fts_statp) {  /* Should we bother checking fts_info here? */
++  if (r && !(ftsp->fts_options & FTS_NOSTAT
++             || r->fts_info == FTS_NS || r->fts_info == FTS_NSOK)) {
+     SEND_GET_STAT(r->fts_statp, _STAT_VER);
+   }
+ 
+@@ -2173,7 +2171,8 @@ FTSENT *fts_children(FTS *ftsp, int options) {
+ #endif /* LIBFAKEROOT_DEBUGGING */
+   first=next_fts_children(ftsp, options);
+   for(r = first; r; r = r->fts_link) {
+-    if(r && r->fts_statp) {  /* Should we bother checking fts_info here? */
++    if (r && !(ftsp->fts_options & FTS_NOSTAT
++               || r->fts_info == FTS_NS || r->fts_info == FTS_NSOK)) {
+       SEND_GET_STAT(r->fts_statp, _STAT_VER);
+     }
+   }
+diff --git a/libfakeroot_inode64.c b/libfakeroot_inode64.c
+index ba5802c..e5aecbd 100644
+--- a/libfakeroot_inode64.c
++++ b/libfakeroot_inode64.c
+@@ -112,12 +112,8 @@ FTSENT *fts_read$INODE64(FTS *ftsp) {
+   }
+ #endif /* LIBFAKEROOT_DEBUGGING */
+   r=next_fts_read$INODE64(ftsp);
+-#ifdef __APPLE__
+-  if (r && ((ftsp->fts_options & FTS_NOSTAT)
+-            || r->fts_info == FTS_NS || r->fts_info == FTS_NSOK))
+-    r->fts_statp = NULL;  /* Otherwise fts_statp may be a random pointer */
+-#endif
+-  if(r && r->fts_statp) {  /* Should we bother checking fts_info here? */
++  if (r && !(ftsp->fts_options & FTS_NOSTAT
++             || r->fts_info == FTS_NS || r->fts_info == FTS_NSOK)) {
+     send_get_stat64((struct stat64 *)r->fts_statp);
+   }
+ 
+@@ -136,7 +132,8 @@ FTSENT *fts_children$INODE64(FTS *ftsp,
+ #endif /* LIBFAKEROOT_DEBUGGING */
+   first=next_fts_children$INODE64(ftsp, options);
+   for(r = first; r; r = r->fts_link) {
+-    if(r->fts_statp) {  /* Should we bother checking fts_info here? */
++    if (!(ftsp->fts_options & FTS_NOSTAT
++          || r->fts_info == FTS_NS || r->fts_info == FTS_NSOK)) {
+       send_get_stat64((struct stat64 *)r->fts_statp);
+     }
+   }
+-- 
+2.55.0
+
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
