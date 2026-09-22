Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23054C982FF
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 11:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D69BF60762;
	Tue, 22 Sep 2026 11:46:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0u2jCyi7LMjz; Tue, 22 Sep 2026 11:46:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org F381660793
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790077604;
	b=TYwxmbjiuSw5MbMtibTz3sGHX5UsjViY19YrLlZuXBMfYdP3jzrSwVz6bnjm7jSwL00n
	 mUAbKvQmfHgf6nPUn2typIP5cThxSdO59oSsHN6GPnf4SxK+Zwd7T4g1KJmpVGZJOBYmp
	 IlWfzTMSLJfp/4sWAFUQp0pjXlISNz3CN06O4t+NRH9oXguyA9MhGYKvP2Gv6yb/bnrnd
	 b3BbLlcLWvpQsiy01CfCIAcSNRwQj7BFuTCl0WfLv8S3EXe8GnH9dnI2X/mWUKP+iWDsa
	 NZxvTuFrycyXn3kyoW1Z4i/Mj2Jv2QBznd4MMt6/3udKEioN0JDtKj3VWpAEosGuI8w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790077604;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=uiCW7V1Ahwm/ydYZ6Oz9V2nJXQQPih48zLY9paVXjL8=;
	b=FbHZIEQJi97L545OC92h+wc02eHrNu1SuwjQeXLo0iy/2Y7niyPriDx3Q2DIS9C/kS4w
	 I0zKQDXhnOGlTO4iehQE0A688HNJmNN2VPl3F3WxstsNKH72IikbgLE8rC8Q66LfWCM0b
	 S6cBqR40/PLe+0/+6VhS2UAyaW6IVEEPDy45E+p3AvLYEVKFBkD+vOMEKQy8f5wYTlWEA
	 +LnwViVqpamMGaHDpTz91v804ohpuPGTCjSHSFSQgCXZXJEAnKMW7gyKVnRP1MHcZTLPp
	 BQUeq+/QyLlXoM2OAoVAKsOcNVe0vXO4BkEobUU+9KhD6rNO+pXR0EdVlmKLPoh7+Gw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790077604;
	bh=uiCW7V1Ahwm/ydYZ6Oz9V2nJXQQPih48zLY9paVXjL8=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=DdXlBItbM1RCC78VMFVXcA0WWteJQlOdfs5HdQeCgXSsyPj4PfptS79KIZVFVa8qm
	 sb/Zo/yZrGfJfqrR2aLUqEsYBN3Il7hIIjMHebOI6cs/ixMaM6Wl99r4/pPCZ0XMWe
	 dIpj+I9CGEenGRA/NSQEvzTXPcfCaLwq6UYneubWM/CjeWiWcfI0J20Xdst6Aptqwu
	 1sXlMYEmT9HmZKzUoF/Zh1BmlmxddI1UN1XnTOBW8wZtJNiKdkeKOnC7u7P/eyG0De
	 HG8fnH5gzus78t3AM50CbFDxN2LaL+0TsFwkkzG1B7nD88b01Re3H0nQ/iHcloI8zk
	 Un64ljs9kRZIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F381660793;
	Tue, 22 Sep 2026 11:46:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B3D9A20
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 11:46:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5BD460793
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 11:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NSl5P4uLRuPy for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 11:46:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 5FC7C60762
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790077602;
 b=l0hJMLNLUQ5Z0AVGsNfjwD1tuw1zhJ9CTaMvwBDp6PLcRSr7bk0NuIUBFabVEDI57pXB
 KgCtDJRZRzwstx2rGoXyu+1DNBQDfZJ02+gBzsIMCAHzLnED3yeDwiw905AHxc2Fef4iA
 EGp21mBPUvAiJOcJQE56BekefPmzwzBdUYg43esk3i6xLRpn3whmEp27jOucM+Le/COm5
 mYXBDCJCTKMUmaEshklfuZnV3qFRsmCDG7R7dMFGvocp6UoCpiWYrf4iRnnXh9bhvO4bs
 l/UKMOipHknBr9/WxwKoMHUPQCHQ4xE7bJR/3ahNPWheAYeGBptjutbGsVVfPgP8bqA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790077602;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=FI2wOusr4KfriR9vIS4jWs4mDmvr4TRruh2iZS6/rkA=;
 b=j6lGTPSPj4MOjW/nBwTuD6bs4zc4kK5M+n8o8xap9tuKhi/5AQhudwfHpzovI2h2pNMU
 9r6tVrKGMvsHbicCWM7Ar2o9Z5+LPUzbeRUi1Khzq3mrRSEM3XXmW3R/Hr22rMIDqR7Fn
 jwH1dnH8XDgZ/GfibCpLCc7bSIN4qPe9SVKcu29n8BZXct6GprzkwiLbthddSnX6MhoAj
 lCAT8RuQjOOQvD+zgXqFqYbT3goN9LCuSf2LrP7ryaTWJDkL+7HuKxiOb1E6UmYeZPebh
 sE8hydLnuK40eMT52H3VOeypmFevWQ6v1FYfanTtwBnyKAzk2QMASVK0hzHjzeIQgfQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=dPVKnLk3; 
 arc=none smtp.remote-ip=212.227.15.18
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5FC7C60762
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 11:46:40 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M26rD-1xBRvU1GFl-000MdA; Tue, 22
 Sep 2026 13:46:33 +0200
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>, Sen Hastings <sen@hastings.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Tue, 22 Sep 2026 13:46:13 +0200
Message-ID: <20260922114613.805843-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922114613.805843-1-fiona.klute@gmx.de>
References: <20260922114613.805843-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:dcZH+2Gd08vkLEidw4DsD5Cf5A96uc1Vz9A/LvkMTuHs+/KNEIb
 c7kF3evP/OGehAhqY86JWSwE75dMmiI+kJCx+4MmQzzX61I7+jRSF0cr47d1qEY9ZY15UL0
 rSy+wNbWyPvZE+593t2lLkqz3lqrEa63FLCgRQmh+JIt7QBpH3PF+6/UeNBLRSNx1OLC4im
 /DzCFjx+4p0BgIQ/uL9MQ==
UI-OutboundReport: notjunk:1;M01:P0:oGO8qTXslSc=;KgIzvs8iTMtn/C8xVFSWGLQ506e
 tMhSMqw9DMtXVkrpi7eb+bV9hPe2SX2c2jb6uiW7yXbkywB1UZqCqgjDIaJiuZ2SbFZror39d
 r932n+J7JMsOCa4G3bWcjGgHS1/5ln/p4/Pni5Bk9CT1oRiqrwIqIvontRJVz13DV01PoYQMP
 Iy8sOI2WDuNO5Ei3y76oVr99yO6zPLn7eT8R5Znkh0dvN+/d1Hjy24zEwESaLJJE2eDLea2Al
 P+gq8gL21SKAjv+Zuyh2vB/RopyTt7LFZr/8JeqkvMrFSUdKS+zVZBdA0jVA++BvZNfRQ6a9L
 IKqPAvvcLz7NQ5IxaXu7YqkzMPwclLvHt+4gKzXYwitj4pjZdwXRaqt27vNCNxSh4OiD03nRQ
 oFviZeXKoqML5mTyo5FeARhCrRxfGq8ONXhGZAOnDtSp1gnY7co6IOt5/ZjmBQXyX+t5J35Q5
 Gpf++qB5ZMGexMR96QTHnVCRoexFPEXqq+Zg9VKHCEqDdyGxTLxRUiB6PMNH2wtpzZMhsk9qa
 i5PVhKXd0wsbF0uhJWfPgyEFxxjOyRtAWXuv38bc/XQas6xsPatyS/flUB2OOJQ7YmPQt+N+E
 EIWlpUfWJk5PLJhMmWPVgHGc4tM19eQBsABN9kp7MdjE4ivBmgBU+/a5uqdLadlDqs4krt0Ol
 SqPFMAuHF/rA49wiy42vs+Iyx1tJgVG1zPVMY5BTyRVyCrnvSXN/A9fnJcPfTdC2ehBe+X31i
 pXt66X7uTF3Wcdtq8pZZWFLR2TD+EbXnZOQLFQgurk7NdqMFpSfNJ5Wpd6gg39nCZcxy57XGz
 Zb5Ld7re3pv3nI/KVHCE8gorQM9E2acgDKW7u+d3GC+O2wt/0FCRhraAC2wtIHmifpQkIcTOb
 yspKaTE6856IjnWIbbPerb/k0KT7YSgc7IBWSfxaVNxRfOvN2qTu24bRIZxXOmetqgv3iIyUb
 gnSSuPhZL2M5e/ttDrLV7OZm3teQhAv2JgPa6eukrr80MlrtsjOwiLMgejMSUhZWG4E9gIwgv
 qVMeALQ0QTvlqLWe43dQByTsPwSAXYqph/Uk/3pMuDQgeUgYQ/9X7eVsWV5owehRfPg8YwiYH
 qvKepHxPbLPVRf8pJuRIVeqCzRWG6GqGh2DNShf7gA/DERyIzTabzlT788axSzlldS0FeMDab
 0a2UV35qjfL3NEaQCFIg+PxCNWAZN/uOSPW01pcZ4oMw8mf5YxG/tp11b1XPHxnWciBzoz1or
 qEWkGF8nGEnnlC4v5ziiJj6iXH5t4IWZhAVfoPgosjl1uGSmDgJ6sUQf2HFaWNGs2poUg3X0q
 jzotMLI2brmYkZbf+rlZBJE56EanAf2aD8mAZYW+CBE+wHc0mEDBtdvWbjk+FF+I38frEgDiY
 k+kjwIbW7lzdn7VRMjjRBwuagleD3JPvkKkovCIx9+ypUMlZ81eLQS1ayBNJnvOys81woN/8e
 XglLPednURsFP0wxYfHObhCZ8UdZd2njClx6klZwR4v0/0v9x5Phdj+EB+0PPyjtfQ2dHuurV
 kTw7iGOBdX65OHRUK6sIFpQwXh8tgTVFybEoJy2P7EzrawmuyO7Iyu7XDF4GXUOz0eUINlD3T
 0jz/g8g1DEQmLNTP8bNRE+uZQSIgdLJ4N61/MuZ2cSeoGmwLCT02fW/F+EfOK61Z73y9VBBxu
 niuVPerti0Zq4NOgJERr1n0NMD/nkvGOmpROK7QGifnS3ipzYIpvVtpo1zpCgrevkj9/Bzbst
 iY5NQTVD6BXRmfjoXAZSuTByXp7nJCIQijimWyZodySooPAnZmjEJAgmd05GMEMug4IJwy8Ue
 6zUOywfeIMoGEznfWSo8z8KN4FVzeq7gookmJGElewWIBtgIq6rB+WY+d5gUxnstUsl7g6Y1L
 uBJ9QUhQpT3fLh2l3phA0BdluUtNDMAVz6waO8OiPhEZEX2annuSi9kV4CfaA2vpaEeTQP6ZR
 tZsLbkvRosvd6LO6ufUrX7M4hpeofNvqLJaiipQrCW3MioCgT9s0Pl4FpvP5Ntfw4dbmABVpi
 irl4UuzSkMuK+s67D7UgX+ioEeZ+HNSv43sc0fR97YOQCkQaYWCMFU6lIhJl3JkBp04oUj8OU
 +bQEO7vBSwwfJeiN/vQYUfzTu1exI5CQxR2/EJoVPBZFadGJqB2uI83dLF6rHR9F+5e+NWJL1
 i4LhoBlebqNe/dT4zBJtGL2wf/7oRf90BC9QCbc0CVe7LVNnR93BMFtMDijxc4yF1x/npSFHi
 VB8ChCj7sutUh8i7PJLsd1Sk2kIeTcxjf1LMbwlcYlPOxQ79TaMfx0c38sb+9QpGFwsp79EZb
 bx+IlyqvvgebpnzDc7wJjOXe19n9HEz6wvOiv1cc13ENmpsr2PRePJd2mzha5kpdC/rb/XPir
 DTEi5I+oA6XJyb4/6Gyk70yqjTiAL3MF9z2OBMrQbLUxNORnNT/YLZC3Hc+kfqR/o+NaLUBIv
 Jsw+QQwydkM06GETImHFLiglQ9+p0xSZL92jTZkv0EAbuflnCCjXxvG85kWdLPz/0C2e57btl
 liD6+vhX+h6I+oQTFDQ4NfYxBbdWnTPZiQjEaCYB50+lD2jRg1WN5Mvb06zChS3DjnLXuT3TC
 S1lFfpGg31k10YZ28XesnpFAFolMnV3DJh7nEoIUyDAYLr9iHMlpj+b9MN6tSDIikRiezMpK1
 V2a8Kjsq0ohZAxPTike5lPGiAFAwmfhfFNgNPdD/eTSS8Jl3jCmrIvI0QF02qLrW2bXN3Et5v
 MkzTkpDpr0vjHY9Y8fKHRen4685NWsiRFhnHMYSd6w+GFota0q64DQ5hLjEeQ9iCcBtuepNyG
 1f0fqzxamWbw/wVo31H2Y+IylsU55KM+8bTE0ZgR5vmdzYhiF/FBee9WfiWHasyVrX4zh4Srd
 Sv7UWDn1dnVrECSiDjQYHNj2Z46yHW/R5KOYUC8acggl5lXtpNGDfZxpdA6mrY9r2q6iKPdg3
 51Lsc9oVDjrP5c2YEt+591RQpXOqwKkLNYmLbOEbBFIhX6D5FIiGQIanCH/3QrcSRpY4QQMHD
 dcnQ02WRnsw7q95fYcal66zez4/jkwLef+26QltrebMOgXb2+Uu0rtPJeN2W7H8bE6v6GNpHU
 Yf5+ezEO/yUAjOQqrAohfLwGzdj0fM2bPVBtKp50Rps/ubcjXOIO2jypHL9gqojVwpAW8gMLO
 dgOeP5rhx42iA3bmcqlJsk1ZmXrUaVDzBuzPUdgWXVqa/6tpJoJ1rasez+mnjNxOLiWIORTjZ
 cmhqrJWNrQzfiDpPHMimpaZ/Jnaf8tseizk+gZ3knJj6Hj8L09OkwlKXZtcIXOs/HpxfHAQ8/
 FTve9GwwF1SwLYhWumkHEzrksljmr6qlgnpyi60nuEUWGkDuZKhxh6qnJmd6UCCVIWOVFlUbW
 7jS6aoSPEv28N0LoriraHZbxprQ2n3R+0r+kxiltmBrV68z8EHO6dHxLv0XY7swED0zKfT55b
 YsbsVb9OyBuy9wpuqNHArvfXz0Z4EkbDoYsVVIXtgiRQyFKO463+6OrN0b1v506XjAGYO07z+
 qWoYz2eZVRyLncITBH1aObKWw8IbAAouvck9EMrVh106evHMbv0zbLuFQCGcLoQGmCE6O2GWT
 1rRw2ws9dya1s8mKfdOiI1TTpedr36u+fkdDAXWvoRQB2t+B97ucRCEhJx7VSlH9EQLP1lyHd
 lwg43Y31dR6Xuzv5m7P4Ly8tzLiKOStwSZ5tl0lHgg6MxJwV8P89rdWBXRfx3zmKM8ddry60X
 szhsMcp7hkraiBz8J5x4uSWntM5W3JG+H5/INLd0jortHPcT/2IPmWsLOh4/2qU4XhEMYBet+
 qxsqzVT21M3Zeph9uAY0p/qQvbx5vSBuWChjegmqujYcgPw116Qgjf8e04knfYv6FhbUVnmGT
 1uuRdgEP7CvM2AJ24bG8bjQsBCIJW++b6ycraokeJi7AY4/QJU3RmgkfuJjMPO1AlzwKOvxh2
 urPTU7swESD5Ug+QqcZ9/uyl8Vpwz0Z8eriYk4CCH0P43WFbv4dnCstovICxfSMCvZJkTcmBR
 2ddJ5m3A8k6LAQopgpj5shn6QxWOadPRg2/braHyDFnRew43Tpuvzc2fonPwXyirnsAObXsst
 w0+fC6tA5ajFvV6Q7lsREyK2tgNIMN9BwE9Q7nRFq0jRlZHdWezSdKiDGlKHqsljqQHCn806W
 jS02855N9YzgSsKrHUmk32IRoAAeLYTEUZQczpxCYWpWajZkmSoWZbXyQMSUzq4+vV3jrvgEY
 b5ezazVQorMeS9uB6o4yLmTEWuEq/WckHyB/dO5llcb9ywp9MzP5iOm4lvs/YuCuqkBOIxUdc
 QscYJsLowGrFdyvDwLeulOFsvoe2Nn9J2NqVFxHOGEcZL56dpw0xI5jwovAluR7DcEHmA5CEZ
 457qPZ2A5LP2NPZ74bumdtvo7Almepuop32yI1BmLePSIkDdEQXJ530jXd8B1+XDCgKJpw34P
 RQziSJVk8JmWh+GytMGEXXzjdwVuFLMzwY+KE/YT4Bugnn2A0u4feDukpZHdBPw4dASRkwqHE
 q+V2ZZa/IO5ZHY5nMjVC03vqeqBLqzj/iH9foFr5xV3ppsuBIJ1Aoo95QYHvAxxtdbFbLLGML
 Fp7QFxHWeEUyLDMRQQtiRW6OXjERxHtUyDGoY6m+8RDAVbq/1Xf28BLKwc/4rR713Snx/da3E
 RX6tb5FHPr+MgvOAxcVTjVugOch7l6OCOd5Iw1/KCWy+SudjW9cBcFGH6pIHiDXNKGcBM8vNE
 fAqavAxLeZ3FowtAkuZFwBVIFDGnEUDcD6B233XNuKCP6Dvk7/avzyA4ZYA0TWMLiAB5+PJ+X
 eOzqCmXH69sdAKbK5P2CowZ2ijP4LmcMG4HOeV6kOkPC0gF2o5EUgsIzbtZEYxscdSziInmz/
 QAHaQIY0eqgv28kfNCqcIei3BgO20zyPMsokfCBizAStYcrXS0qFjSHN/cgovLO8UHwV3Xhyj
 m+0mgutUzUfeZ0wNWnOHyyFKqB8U07L9wl9L+1NgfVGYEeuFAgbdLxNuDv13w7yj02RcqPwy2
 SZlRlhx3wWWsWXPTY2HWE8U7Q8wm/2NGUxoCx0gMm+fKbzoenup5RGcxuzzGzIwMw4NiqmFaX
 fS76REN+CQ6cPsvnvsTOP+1pfSNggxnKBFaqRZNVvNinxDbn807oaE+YN/94RpoXA1ANAkEK+
 Ed8Uweo1ApaZTYtl0pVU//lemSPgqvLHa65COxPKEEHiAeaJtHvYt0HAM/I9maBN3z11SOx3X
 ome5hJH8sjAf0uRTpLPZwmcZzlWhxS5Ct0L6TbYwu1vKelcRWDZ6ooa0dA2JgTZ13JHJ2qXw6
 c4RJq5Eu6hrqqY6ke9jdDkoORyt70GdHh8Vj/rEpncLRJfGsYKc+druPh1yG1+BoIbBjoH2GR
 u4f4VRYbncMy3Wb3y7sx08dVyaMjqDf0OWjLpHw/NVvBhRxmAXHmaxZYp1MqQtISbyu+T3akw
 Ob1xywnY+/4QUnk1bBqPO48xEW5VZ8+CdYEEjtm/OBJFuMvJUiw7GMolJ11vJ4pGGU9aly5c+
 dI4J7FSZY9v8crdCv6xvqldQedUVSeCRUoyUO7mYbZuqgysiE+wB2UmSpxLhOCi+TpFET1SB9
 dVPc/bxeRUF1PvDPMyHKTAnk2yvyL69jnvSJOeahl5Koq67lQKiqpaRYy4hp06Bou1QfnK8eF
 u056cr1i+nVZGYegjDCDpUzU6ESLznfF9eRs5cSMraJysAxVfzsI5u/LKBR1FKDsmWDJ6rTAc
 ga6RST1IeDqDLJ1ao7PA6bKjKYkzEpxIjDwUJaJZ7KN+PTLMHsW9U8dDD4ysGYCciE//19S/M
 ZSMwbpjMX3Mf+IH/renvfx9sTCxYhFLsWByLIkfFZi4tXs40aQy7v1AlQ8zsTEfbSmJGMhnlx
 6JkRxr+B/Ll+330hdIoN44ocxEjbWFRzqSGw5h7NmKTsnMpLgg7nxa6tPELq/i2tacEhS/xzj
 mzzuD9vzTEcivGnpOF0VtUNsnShIrzWrGI+IUoRQGdSlfZaOtWGWHIgEurNxcU5c0sIdF0XXb
 e7jxljceU0yRFS9D9Sgwr/M7TN9kMQLMt/RaHy9DHUUYGRiPzOurATAm3Y1ZRaPbKPtoquTJq
 /GPH/swxQzyKHNniLTjqQPTO8tTKouZUBKqN1cgKQ1gXYKAICCvgXGqB5gZ+XYFFpuhI0gGiS
 vQhMM6rbrZVY95cH0iYEDRfLRJu0gh90hldkHzpciXsAk21u0vxrSWPTGHMa6n9Oe2gIcct/O
 jcSt/X/mpIg/8uEp0Bs5kRl6Z5r4+P80KV60gBoECHam8AwX8N14f3e7/wSQvpKqwVYglf4sN
 Yyb9v6hpJSiOvW+zgI6WRpamqwr2h/2vb/vbm3hlYyoGfuBPM8zHnB1c=
Subject: [Buildroot] [PATCH v3 4/4] package/systemd: add option to build
 host systemd-measure
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

The host package already installs ukify, systemd-measure is required
if you want ukify to calculate, sign, or show expected PCR values. To
get systemd-measure, the "blkid", "openssl", and "tpm2" features must
be enabled [1].

[1] https://github.com/systemd/systemd/blob/v258.7/src/measure/meson.build

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* rephrase help and commit messages to clarify systemd-measure is not
  only needed to show expected PCR values, but to get them at all (in
  particular, to create signed PCR policies).

 package/systemd/Config.in.host | 17 +++++++++++++++--
 package/systemd/systemd.mk     | 17 ++++++++++++++---
 2 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/package/systemd/Config.in.host b/package/systemd/Config.in.host
index eff71d0d1c..1356af4173 100644
--- a/package/systemd/Config.in.host
+++ b/package/systemd/Config.in.host
@@ -1,5 +1,18 @@
-# Select this if you need host systemd tools (e.g. systemctl)
 config BR2_PACKAGE_HOST_SYSTEMD
-	bool
+	bool "host systemd"
 	depends on BR2_HOST_GCC_AT_LEAST_8
 	select BR2_PACKAGE_HOST_UTIL_LINUX
+	help
+	  Select this if you need host systemd tools (e.g. systemctl)
+
+if BR2_PACKAGE_HOST_SYSTEMD
+
+config BR2_PACKAGE_HOST_SYSTEMD_MEASURE
+	bool "systemd-measure"
+	help
+	  Build host-systemd with the systemd-measure tool. The
+	  host-systemd package installs ukify, systemd-measure is
+	  required if you want ukify to calculate, sign, or show
+	  expected PCR values.
+
+endif # BR2_PACKAGE_HOST_SYSTEMD
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 3223915d40..290c2f1307 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -902,7 +902,6 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dmode=release \
 	-Dutmp=false \
 	-Dhibernate=false \
-	-Dtpm2=disabled \
 	-Dldconfig=false \
 	-Dresolve=false \
 	-Dbootloader=disabled \
@@ -953,7 +952,6 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dhtml=disabled \
 	-Dsmack=false \
 	-Dpolkit=disabled \
-	-Dblkid=disabled \
 	-Didn=false \
 	-Dadm-group=false \
 	-Dwheel-group=false \
@@ -1000,7 +998,6 @@ HOST_SYSTEMD_CONF_OPTS = \
 	-Dlibcurl=disabled \
 	-Dgcrypt=disabled \
 	-Dgnutls=disabled \
-	-Dopenssl=disabled \
 	-Dp11kit=disabled \
 	-Dlibfido2=disabled \
 	-Dpcre2=disabled \
@@ -1018,6 +1015,20 @@ HOST_SYSTEMD_DEPENDENCIES = \
 	host-python-jinja2 \
 	host-python-pefile
 
+ifeq ($(BR2_PACKAGE_HOST_SYSTEMD_MEASURE),y)
+# host-util-linux (for blkid) is an unconditional dependency
+HOST_SYSTEMD_CONF_OPTS += \
+	-Dtpm2=enabled \
+	-Dblkid=enabled \
+	-Dopenssl=enabled
+HOST_SYSTEMD_DEPENDENCIES += host-openssl host-tpm2-tss
+else
+HOST_SYSTEMD_CONF_OPTS += \
+	-Dtpm2=disabled \
+	-Dblkid=disabled \
+	-Dopenssl=disabled
+endif
+
 HOST_SYSTEMD_NINJA_ENV = DESTDIR=$(HOST_DIR)
 
 # Fix RPATH After installation
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
