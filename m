Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4F8106F30F
	for <buildroot@archiver.kernel.org>; Thu, 26 Mar 2026 09:38:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 415A260AEF;
	Thu, 26 Mar 2026 09:38:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Lq2ArAQ9E1FO; Thu, 26 Mar 2026 09:38:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3523260ADB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774517909;
	bh=2ud6cIhplR8ZffdX4R+YZcYxvgC/RfhTLt2m3zHyEG0=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=EtHs20dmA4P0rmkmkjHc6iDRsxeCoa73qbCA2DDespCBx/os6V4j1lQD1poMEi9df
	 nsKpFqAsA66qQJMjv9Y73rwJ+mDARd1XUjxkzwQEmX2Eww3ob6ALizVzHmxoVdJVan
	 2QirBb1VaeraldRjPeNpIC/4v5uBxDaSaCsVrGwqFt5w9i4QYhpr4OiccSN8KWBe7m
	 N2wDa4+wRjVB3GUkBbHjL81dNKm06NJ9vD4BurE3vjKhZCJfvD/jMnxiBZsWelFr2M
	 pgjzF8BCnCUiLryMVJI9s6NQ/ym68bYaV2KhVjVS3ETwmAo0oTEqYQlEjK5qgJYKux
	 2sJyO1dpc9ePg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3523260ADB;
	Thu, 26 Mar 2026 09:38:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 68C2D353
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 09:38:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AA2540B2C
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 09:38:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFFghH0znuTQ for <buildroot@buildroot.org>;
 Thu, 26 Mar 2026 09:38:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BE44A40B29
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE44A40B29
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BE44A40B29
 for <buildroot@buildroot.org>; Thu, 26 Mar 2026 09:38:25 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MAwXr-1wGvaI10HJ-00DeYq; Thu, 26
 Mar 2026 10:38:15 +0100
Message-ID: <87838493-8642-449a-ad67-052cd05db7e1@gmx.de>
Date: Thu, 26 Mar 2026 11:38:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Titouan Christophe <titouan.christophe@mind.be>, buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Thomas Perale
 <thomas.perale@mind.be>, Marcus Hoffmann <bubu@bubu1.eu>
References: <20260326081422.945900-1-titouan.christophe@mind.be>
 <20260326081422.945900-3-titouan.christophe@mind.be>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260326081422.945900-3-titouan.christophe@mind.be>
X-Provags-ID: V03:K1:TQEpsQWhlxVUjmONC1o8wFLFRQtQ5QMdXU0pR8xNIoCww8m/SHw
 VoNJzGI6VKYmnYe4NlEQyd2jmHKlxdP8BNDeEWQFzxpwk1wSglj7Jn87+ZucdOiTyAEI8ed
 TEAkY/JEgBWsV1GVBK3D8FEtZMUiodP1pr2KCD14c9krPikiH1JCfz5Fwc6hHQb9N5db4Ds
 kOqis/KXIyDJ1sbKWEmPg==
UI-OutboundReport: notjunk:1;M01:P0:hG0dwBmvwU8=;7UpEwFjyQywWTMt2ouvgITqC70p
 OLTrhQXjZLdcMC60HZu6ehEUYfRRxkBocgQJOSCVIDpbJMEk1O1To6OOrXmELm+SADG8aAXOF
 6POkYfKRtv7S1Fp1k5zf7gvKoE695GfrIywq2pZEUkfTxV0DE3F7H9GWM/ylU1AbuaxPIya2J
 0vcRWpvq73+aOtVHtAjcMV3ZMPg+DeWh98wOR9DyRpZG+URtSN76KniYUOnUWD3Dcx5tCEE/r
 4CzYgyAfI7ZZIrDfkcN/7MV9JXnQeaQSvOihSIKENXTH1zk1sOj3UDS1/CG7zTtDFPZlLqqF3
 +NSSK9kTIM5VEE4b9xZL3r0XqYPcRDYNIJ8S09uB4gxcCylaWCSfIdKkvE16XeyGQ7K2qeNh1
 I1/Ui1Nm6CuPI7WWS2V2yl5b17ejcAjh9znc1Aa0fgy7IxDRAm4xdigGvSvwZQ81APuloJfIO
 r6ldNB3AaTf25Alh5mGiCJMUYpcQcso+5pBqYtWOA3UXHAo1gi6TAfH2/4s2i/unufA8wmRys
 bM+FM3w3ug0tyBTeGD4AIqUty90z0m2JA+4h2YHINQMhR31xkAD5/4SD1nw8I2sUm8K8a6BGW
 KxVhyeBLMCW3NBvaQvIxgWKGQM1Bpj3EmxTEZwYlKWEcgE9SAFUC6X5WcsWQV3GTSKlK1GFmY
 GiWZTkpDNmUJYqGvjXCBq3KU6V32/BTxDikdw73tKehfNhrJMvQ+usW9vg6ciSdCxw9PVeGxE
 QOG7q5r4h59WKhJ7ouij455qNyxvESRtXcvtqP+7ItWmTs79syAkKjqtjjUn0TKHEN/fxghzL
 /d3/6+2UaE0I5tYC9FNMfY5iLJC7+STakBBV18VLRdr8tx2Qpt2sd6HRfe1JU72W2U56FSLV4
 YuPzVGgF8GgTie/Ogwy8nlzR1vzj3zd/H9lRgqwvcWRxWKGqA1Y0woKweu8ZnTezOAT7BsVuf
 kzxO6P9k89nbR8o64RAUMJfuSPHkWUzQEetKGzuKhBk7VDDJTEwLEzwlRO79h2X2HkVb3pwyk
 kAB8Iwl8E61lBF14PTiz9skKnHJgE2VCtQgXxCAngGmsqy6w0xvI0AJQJqrto9lqXe5b0CwYu
 pSb4KjyQSzoSRBSrfgaSrzT/K4iAv58YxkoV+B6sp3qDYYYulsftVXzC92iU3N/eXWN8AvNiC
 jvX/Di9Z7LYA19GPHHElZ/vtzkV59VkE3YXYzgthm405tvEYWRvau84luHG8WOEv+xuKjGjFI
 pXY8b2JThDa+HW4J6TRe250nj8SlRDzQJovkn3zs3b2ksrxH+c1/HPyeCJdJ/+lz/kK7Ukywl
 Kus2wmiTf/kJS0baO5iMA/c3dMcnrc70dNG8QOC1jLgVW8a7Ejo+/3rYlTQt0uD146GTIf0Uo
 Xk5pBHjvzYmaCapcbVUUamyP+KrDyotmoCViPB8Q6rf6/KRnM6PHxFjTNBOz1FEigPNCUXDTD
 PSr+jKPCY1+PZlye9g0T83WkiUM8TMbz5yVGAylfkXCJxMvjgk/6qWZm0t58yiIhJEHh5JkMl
 JzDixFLWCMCTvDYOctfPWXGpPV+zCfvfymNEh0rBaf1QOgUY06tudgiboVrjlGpEnV0LoehBo
 amVTKp+H+5WOBjA/Xh086yqIjhCZ0AShptLSs8WZyrELRRdiybJ3aIy+j7g0l8WezWu8xQ9+X
 KnxrXpGHzPTwMpemuJ6hQHB7R184fAjW9ZJvXrG+f+6LZNjppVpK+tlLk3boFcUEZZBNjEMGy
 swWHotUIX9bqvwMtPcwKVxIbu1R/zt8rXGX03g5C2q2McxiqCfhB6S4bjStniw6xSkZBMYNRu
 k8XIXUCudSDt2CkeizWZNz1Q6L+wK8AT7QxTGP102qr8GJp2c0dZjv/eEaUke7zC38uljhyb4
 /9XGgO4AorODxcOcN++9E9iujYs++k8ys0npsB+yCl/VgHtfoPBcjGp3YC9pjL11234c9JYBi
 h5Ll1VaX3kL8ukfkh90sHa4jZnhfXWqSGgQhqUYl7ew4wpcTrD+gY8oqTOH5WXw/m5g3X6za0
 w8k5XPluRaWAz0wXSaYxyHrPJhZMZuvIGESiGX6UE34eR7Cl9dUw9l47RgApKsKpJxLAQTWfT
 yuANQr926g+yYg6M/uDOW1NAVO2V6F6LdqyjwP4QSyC9CyHFCeT44MvBaLIlq1816a42Mnraa
 WXkRzL/nVyRYejzxFVbHqqFIPQncRU7+aZ83GtegdV6Oel9/gpA9CkHhOect0+CWgnIopK3zy
 RdChf41fvx3+o+tXE5lf0qM0qqxa6pKYWa8m4mRKReMW2YsavAJmk01f+o9TJ98giT8P3GaQM
 Tf7soUW4e2mkYNm+BYUPUmKk+X0NESkKKHDPmHgOlDHJzqpxUk0QcUe1ZG4TkAxz+FNI1HcAC
 B5QM1QHINHSLoBfbQAByoa4LxHg9nxL04rTRcga2KJnvW9Q7t4rv6i7LZpZcvP/3tb2C0WrFN
 On35JBZ/ERe/kRvRHLGSrqUOs4P0eM04mSIUmUAuc4GjaoQZAc+Fn/JPFXZbzgXWEvBIT6nlB
 P3nJJNdgFlBgueyHhUwk4oCf9DYi2EGI/Xe6F3UzglqbR1+F5Rm794bV+4SIJkw7pVc6iSr7d
 Ji9PlUX/Emk1b/drHtlJchyFx17Zzd8aFE3wGEgiJ7LJFQK61mV9pl1Mahjflw+M5AKDaRpO8
 CAmtl7AX63BiaxMkfY8TYbCP5rqOtCdFn5XN57JoL/ELJsk3Cvf+G/XBf0DSovzGpVssYeL0s
 j6AHeS44GPTfNSctIw3izI0At6VqNIPxLqzfRdKBxm091tlBc8GBiz92lHWFEAJOXX+MLTAEh
 wJcafttN55ZWJxNw9Pqk9UXDQAMS0RDouVgvdcnip7bmENpFWni2TLqzc2tFc/UGnwnszcxYh
 s9EOmFCAGt6Bbs0JdIeNWbK/db4gDeCkSviPKq0PYzFTi7J+VQApgxmZUdK46JMwOhMK351IC
 gGKSYZRLQyxuoa+ml1Kkub7II04gSx97wcBVUlUQKCTsdZVT58zqOYCvbYz0UCaagbGjLvjhH
 MILX6Oq9tHT0udewf8qSe1yrXe0f7fMuIQQ1U2GoBWpVNAmGvvhnM3ZVLXMzDPk/FnXTdx+WJ
 txQVCDwUWzdULBY8Qf/Qs2gWLKz73E4gZAbn4+jg4bKLo2LcAxixKNNBMgaIL1DsK8tnYBVDu
 VTsKj20KngDBlLS07PVzWEOUUHjtz89bM85OXZ6FCVL4ZXTyyD+c6GjGx/CuhszeDi2fZPcfD
 w2yKbsZgxMU+yhe7qZxZNreRv6SEpNuyY1eF0SfBTb7INwB4xKRjj0kHRw3kVSZacOyrv+3Pt
 GCPuRsfEh10H7Gic7wK3TTF+VOMvpg0nEvXruPj1OCsvyzF+Qes3w1v4X8bqEqUVfJy2sLXVE
 gmrr70oQcv0mpXYqpibYV6Y5dIrfYOcEPo1xYmayoydQEH/KpiFkAKj6tBMLb9VNQLRuRkeRj
 P7lmmL9j4xTXB//HzpTaiDIFWLCU5cdBbIirBIYDmFqHUQHDIbFde7+dYDap7QWNeaQijZp3r
 MsOmQKAljfuzHOhZdPG3+zyZwdl5hIp7tecEFmSRy6rsorMvnjEMcLRleh+DvDLIajZXkzR51
 VnNVp0vjo1C7qtnVLKSC4Yd/asXXQAsxvBzh3TFY1nTXdurY+ZvDxn0KCupW7ZeiUIDAFYYfr
 ccD78O26b82E2EniPxq02SrDR/hNqsQ1okasFatzB1hyaih2OBuN5eZqe9IaE/33dDEYZ6WA3
 /S4g01kp78fLeyskkmMpNbxWW2MeOBW2+wAcNvzzOzQuU2CgMXXvC+25zdccFSYh1u01/TpXt
 otdFASdGCabp3hdFrQF5udvHL/nWYbmpIXyF+fCxSc2RfxbLoGjtf+z9a34uyB3UR2zKiV6hK
 43nSSE+Si4Yw6tjSyTvNPSIBMJn+P/l+qkSWLmoUYrC6IIVl+3c8Hg393vx31tuhQG5Xnk0a1
 +/QyVpLVLN89aJEnn5miD0DoJgI0ssRoSYw+yWfy14ogrAXFCZKEayVHVhiRcbClvhnNI19wZ
 +gUpGx//fKUsszN1LV+nyGoyvJSDM7LREg0sz495G1k/Iii3/C3E3VTgyM5FfeeJKiup//lul
 9W94SF6at273/SHcTX0Kcfkn7lk0TlpYxVB37xpOG++lDiInhZX6BgscFnXlk81ufKJnENtvl
 IbUeGnEkkwm0/J+WNi6FtN4J58yIPeO8Vn2siJA9uNzbp3PnobyAK2wbdcvdF8lmg3WSsbXj8
 S9/kqsE1cU14z/y/SEgCWPdd/T7iJcOB+yswMf6zTMpW9pwbkB/uOW3s/DdQ+/Idl0C6KZmhW
 wA26cmUzZ8yH1QBf0YUcaUXVOplUVhDQsjga5DiYpLYy6HYBibT6CR8G8dajcXPmgQ/aKU3Wa
 FkRJ0k7ptJHlIQYzUDyMQUeoDSgk7sCPGuPHSfzu2efgsr9dFfB8mX7QyEsMrKMisl/zhiL7b
 YLHMzBSuLlG+epg2zg1/Qtt4nbB8E4SsJuY2NgbysaMHsxBzfP5D5ypw4xnVifMCoE/t5l50j
 8ML9l+SJAK4+rcjQ38kbMuoZNjACsWhMxSngv0DdDMvObyrKMiZ85b5bV7N14KAhINsM6Jn0W
 c7S6RZ0+d8D/3ZhthatGeCkweobr7tjbOO5T+N2G2WCNuuR4hr5BUTv+ZgbgcbKz7ENn6MZgi
 xXjnfoMu4J7wjvs0MlENrbkVqvP8Yb4XghpA1aHKVDwhbSytHjkAwtMHC3dTn3AZW1DHfmJt5
 riW7Yl7BCm0ZCODHoFKHx08mKKh4D7hRj4ln8Q8Zl6slHJiqgUxpOAscw0iukS6/ueRFYYKx8
 USzwdzMDL78f+DzOAKMXvL49Qg8CNAloAyeo3ttHId3Dr+e2bfyxZn0Qv0eWIaBEbGYeBLr4G
 hduh0kJqD1UmGs3hs1VXzEoyNb6KmM0AgsNtFa38pGtLtYoLX1FrboHV69Aor/5IrVRB1vpZd
 6kfRuOf7skeliz0ROglQLKHwgi4NWCDVW+YNca7DfkgBEzd7Bhwq0iyOscA0JkgMvcvve4Qd1
 8rI5GNjPVXnP+khcgMAcyZLdm85bL+4yXRwnTvHtHbkGfp4tbFLW1PBkd93S7vDTr1q+e34Gt
 2xi3N1ggP/Tn5OmR6feE67rNwzPRQccEZpRnyNUkbHa5I0yWoiQkETzQahaM8z+V8bQJ98qAt
 p8FELgMsSmYzAo2etiEi+41UNn+BPRcWPtuJJogofybbsc7zhxIxk/sMKjj0SvqSQvIorKgm8
 aPkxSw1+Y2s9Zh4TZQW+pb7jL1nJORJYJR5+o6iNjQN7ouhX7ScdyzESg4u4h6U=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1774517895; x=1775122695; i=fiona.klute@gmx.de;
 bh=MgUcaFXSti3a/K5DpiFL7JWYLCsSw1hXh7/E/6Bd9OE=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=aBj4MiYPxndurpkYuQs0L2eloAMCpa1Gv/UbvpuWqXTDl5Oeg5Ou6IinVPXxAJRT
 niD0jz0t7YJPuP9sQ2hdJ19+7/MoRUoPnUm7HpaqG9Wm3YLTIDLy2XL74a0HrxvBW
 1rqeQQyv5cxRN34kDdoz+ruf9146pRN0CCKgbf0f52I8uMWpQCg1jfRQdaQNMF3pa
 eA/7mdmSZX4j9NUXmYYcBgq/9GZmZvOKnn6TSotM2mDDUn/Zr+fTmwRwMawfiVDKN
 S5XjmNnTC9Ntl0L5Z/uaaZZi4+UcKiiY1UGtNEIHLbZC8xTibaw77bKjsJG8rwy8u
 8+3Biwi3gs621NjLOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=aBj4MiYP
Subject: Re: [Buildroot] [PATCH v2 2/2] SECURITY.md: add new file
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Titouan!

Am 26.03.26 um 10:14 schrieb Titouan Christophe via buildroot:
> This is an in-tree description of Buildroot's security policies
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
> Changes v1->v2:
> - Add references to the Buildroot User Manual for vulnerability tracking
> - Add links to autobuilder pkg-stats and Buildroot security website
> - Link to CPE info for Buildroot
> - Explicitely say that security@buildroot.org is a private ML
> ---
>   SECURITY.md | 36 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
>   create mode 100644 SECURITY.md
> 
> diff --git a/SECURITY.md b/SECURITY.md
> new file mode 100644
> index 0000000000..6b21ffd2b9
> --- /dev/null
> +++ b/SECURITY.md
> @@ -0,0 +1,36 @@
> +# Security Policy
> +
> +## Security advisories
> +
> +Advisories for Buildroot security vulnerabilities are reported on the
> +developer's mailing list. A public archive can be consulted on
> +https://lists.buildroot.org/mailman/listinfo/buildroot
> +
> +Buildroot itself has a CPE to track its published vulnerabilities:
> +https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=buildroot
> +
> +The Buildroot project provides some ways for its users to track known
> +vulnerabilites in the packages included in the generated images, see:
> +- https://nightly.buildroot.org/manual.html#_details_about_packages
> +
> +In addition, detailed informations for all packages integrated with Buildroot
> +are updated daily on the following public web pages:
> +- https://security.buildroot.org/
> +- https://autobuild.buildroot.org/stats/
> +
> +## Reporting a Vulnerability
> +
> +To report a security vulnerability found in the Buildroot build system itself,
> +please send an email to [security@buildroot.org](mailto:security@buildroot.org).
> +
> +This is a private mailing list contacting the Buildroot maintainers only.
> +
> +## Vulnerabilities in packages
> +
> +Buildroot is a build system that cross-compiles packages from third-party
> +sources. The Buildroot developers are not responsible for security
> +vulnerabilities in these packages. Such vulnerabilities should be reported
> +directly to the upstream project that maintains the affected package.
> +
> +When vulnerabilities are fixed upstream, send a patch to update the affected
> +packages in Buildroot.

I'm not sure what the ideal phrasing is, but I think it is important to 
be clear here that bugfix patches (especially but not exclusively 
security ones) may be merged independently of upstream releases, though 
they should be sent upstream first. People following this ML probably 
know that, but for someone new it may be an important hint.

Best regards,
Fiona
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
