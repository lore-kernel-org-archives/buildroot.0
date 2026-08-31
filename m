Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C56EC624C9
	for <buildroot@archiver.kernel.org>; Mon, 31 Aug 2026 12:51:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 332B1605D2;
	Mon, 31 Aug 2026 12:51:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2o5v6wBEeDT1; Mon, 31 Aug 2026 12:51:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788180687;
	bh=bzXdi9rA8wWWobecDZyksoYRp+GXbVWFuLvVlwAXnkI=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=BRxRNYBIcMo+1RUK1HHWo8f0NCxj9H6akii6AqyWh0dGvflhHPAJt1VA7HBV30a14
	 rIIejS1Im5SsverSrXCYt88HcKvKB3LDSRZPQbl1lgsnBYCij90j09W1MkK372HCwu
	 jbXco8DlQ+xXTA0cMr/w9zzZasHTnBN9GxS3FpfsuTCKKoOwIH8IC3F/rnIlCjHfqj
	 0PpnNYUuUcj+tg5ixBusYpH6S1Cz0PUp9oC9pdOTEZe/CbUNmuKUNkUc7MPb2K6evN
	 Ia1AVOy0VxGOTP91/7IT9WIrw9Rgnr+V6+c+xe/3BiIi4qUQLTAIeHi5xFHiibR7b+
	 9PsgpH35d6H+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FDD060608;
	Mon, 31 Aug 2026 12:51:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3C0CE23E
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 12:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2266440595
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 12:51:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qfKbgID2soR1 for <buildroot@buildroot.org>;
 Mon, 31 Aug 2026 12:51:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C886C405AA
 for <buildroot@buildroot.org>; Mon, 31 Aug 2026 12:51:23 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6ll8-1wyFnT0Cj8-00C15u; Mon, 31
 Aug 2026 14:51:21 +0200
To: buildroot@buildroot.org
Cc: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Mon, 31 Aug 2026 14:51:03 +0200
Message-ID: <20260831125103.841338-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831125103.841338-1-fiona.klute@gmx.de>
References: <20260831125103.841338-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:WkE6vql5R/v0qCLx/kd0jc9Y3gMeKZwh9nvqewT4mtVQSbeiY3n
 ZADfkLER+pIVWKuxZz/1X0Sr6wOWaYv/br3ZtPbtpr6SB0hx8OV1c+GJkdy7YfBwy2ZeW16
 h0VMK3k6gjRMMPjflZxtoqyrf/z9Oqp73JQ9wrLEAcOa5/vyOA6t35/W9CtbQpFgrI+iXJ8
 iscj362HfzrKsc1MELKiA==
UI-OutboundReport: notjunk:1;M01:P0:GaGpzdExjcM=;1qFQTfvcIXerG2tCCcRH1Mzcq5s
 iee5R1Ofp8XU+BA6LkJqS6ngEytW6IXGN/OBXU4wZRIO3H8VhsIipGfcBA4F4I3Gugsp+i34F
 eGTG7q5XJDXQPCklvSqYjKaK5SS20V7eVTPK850BcKHS6vYO6dvq0BrnDUFziZfJkoYnp1TA0
 KBCar4MA/5HyWSpiMV6QUDdovSSpCuNywfaiUrSaOhDV1LGGheSwr3n/+UA3Nh4XrM245j70A
 dXAzwZFZYyqeXJgqBVHNj0bT9Mv869HuoQGjMfS+6rZfyP9p4/J967urNiYx00eeGtDzVOZd7
 8NS3LewEUWUB9W3VVCBXDvEdFgBYFwKPi8LX0gmaLX5RkVqGYWf5lE/gaCzXce0gG6z6gO8AL
 ZIaZSdm6hVrnG8JqdEQOrhFa3rfxM6NzFBS9QPJAKJ3QNYYmvNSGAb9hBc7JxTWG1WCZ/6wE+
 oaA5RJjpEasaYwjou1g75km1EnHgAuoXS6lk/5TB7BQoZ81pPX/t02sMU6nEHVeJY2PGqWIMQ
 0I8L9ChOfs/o5zKQTJ8QeTE5M2FGmsW5aPBoACH6ND5Zsq2skRtqJ4VTnvjOwdGkybM1SsAFK
 X3wNQGWaQAarbsLOwZ6w4bhkhPYbwRs4jcVGsr/B0ZBc2QLLsxvz/p8B8U0qLM3YGpiogb/wB
 m373MBL5IOSR3APQObzz+kaZFYgyRdJ/N15wmzUqgqk7ge/MenHadRMKT0xbSnjca0A9tUNt5
 Q6pddSiOfymxYa3mdAlIbemt+J0Ay/BTlnMJHWapHZzMz/69XXn85EBNQCNWkb1Bq8KgF7nSk
 VFam63yNb5x+e2ALTW6bLbOorYLQqUAXsXGqE9yXhQWK6DNlLEVd6ne8AZq8BlcGHyXuGEplA
 f5SkSK6dS2luzXFzae/g8GCwPkd4Y5/3LgEIY4tIib0KbYgs/y6S8f4TA9dOqUpXlUdMBPOWC
 7LW/3fvMNpl2sfO5Fd1tSlSuR7V2WIFR+VnDspciYmxdNtCKfbcYx5KcYSPppSzfM9WmlhtfV
 tFyLacsWd1SWRuYxY0MGh5wJb4i1/6moSTfiKVOzaR7FagjXG1wWSI9THgFP1DZMdRsCcwFrB
 aAwgV3mqACzUfKyipubNm4nYOCIkCqvq46Kmz6qHX8ySedpTcB0F6VUMm8v8YJeL0gwSHZJ1F
 TxYEQHXLel8Bppb5Y3u/KKL1Yio7GhraK8NVB3pyy7IwPnnnHNMy4LyZgoharGt1Wx9MGlvWp
 /K54+PDYTl2x/yluZUBpE6u9GrWMZvfz9tMGZ83lX3z/IQzr2n/xLOOtxJw0yoUmhsD+QWTQ/
 i0fVrMKIYmlYYvM+mVFz+uVoW7LslH9FDa6YxcV17ux/AdnqnApy2qxH8i4lkxZfm1ehTi2Va
 EC+0iQTW1ciLw66fVxzYjeUfp7rbSyUqYvEF9tGvGGbdmNqqz6v8wRJckk3oP/2hqwxgAC/aG
 dvy3aWZi1TUf7utt0YCRTivG1vjI1KJZcZ4dnqjvmkQy0JMSPRwc24tkzkt6BBGj/z8cMVlkO
 NPkfUPIxvMVInDGQzDPbJrWZtAr9sTw1LWCIYm+EjQadaSgpjpOk4/ghlwTRRNWjKT+I38Jnw
 GFlCDkIr04mUG0L7H62RB4plodlRfojVWznZ62dDLmDKWv28rR993GMzIl9+ROkCtyodPAc38
 cKwMa//pblo9rM6WeYk4LLqpp0h3m5Zm7Fok2iGBe9UCbn9o80C0WeIn8Bj1BTxtJ6iln8cdp
 FkSsrEfXir5Ga3KaNp5RlXe5qyt27H1eicNt4kpZ0sucb+WVJX/iao2bL/XB2rFlN7cZYFAj9
 OOXQR8R3FyeXz8QeCGCW/4d9hBxB7v9Rrg27k9qpXP4ivAYC5KkpNEcCk3PP78O/Iwlf2y8VF
 9LxXB10rpZ9jPB3SG/rzSTvZZnTOZ8rp/h3WuwqUn2dpnRJJhUJGDVMTdNu702EiLrPSeMpj2
 9akJWpdp7gLJpvepesZ7hD1Df1sJrIRwgPXX/+vSPsxg4MBn4hG2eKZLZdT4piy+ljWBAcpkt
 1uw49OcyOC6st6P6IChXndadox5z9Oefs8vbk9yzJ6v7Sp2mmVfFObx19VeBF+gmgUUlQ0QaT
 PVp253Udho/ItnB9Ih3AyNbfMOiLc2TW9w4NZ43+6MorXEZe2Gv8Pkz3IbA/cRN5cr9BaePty
 JUbeDshtJbyYAnUXvsuunaohQZWfhIo6uZJiQ6M+PWD6xL9XnVNqPIh3kUNZ66rtWiKc4OiGE
 tyIRYp3WjYhjP45iyx4ViO4ThwK0+FPunyIfVkRlEFMbLvNLUnCpOje0HEsH/YMxTUFbHvT5w
 ArVd6Y1yoSJ+nTFR4aFeDvvmzVAK7c/nEFI3cSzRDD2zL4DMt9lCez3ra0BDcmlyAkpW7Pape
 hVYUPKBvh8EBmccctHvkXKpfcS3I416EWvp4mFMHroV1uMV2fhsAHAXOydCOLTI0qhX23WIlj
 Rig7YSamC4gJ3ATPKD+wwtqIYwGX4IrylTzpnC6g/eYEReWAxab4yXKHEkW24VCt9o37QU5Re
 ft3NTt9GxCd2WDUBPuQalLu+TScbgnsbeJlgjIEisbBLI3Nv3Cg/1o+w7O+7Lwy9Ho8Ma5x3f
 IOMambrrxBfqKfj4ZcxUWQ62c0G4xcV04wHQu5Z77g0f+fc/Gf5wPWfg7f1OH0qusH/KHEpTM
 X+qKSmre1oduMMaWpMmMXyUS7EOmC5ugBY0lF+7CrfJVvAixHKC+5zJufSJTTWJX5DEe/P8K7
 X3nV49U+PHbi6GpVrjrGK2QhAGrompybP79TgrBjDumITfR9Kj8A5w1TLz/t3zRbRUI0YozxK
 gmmUSzzLYjcNrHeyyQULOCj40wNoy7wqh8T4NXpcTSYj0H2cscbXedRLarWgMdId0tH5qcBp0
 HMvH7Wqd0ygY8hkjIrtt5ALxrjG/HTMpzo2QMjhnQPuKxvqjaElOL3vEgv60zoHkqeM3X2D1S
 BS0xHNcOHY/yWpWK+btyPdmNTP1R466qW6vb09fXdneUGyJt3tRe7LAl92dItJcH+iwPYIzpg
 dVLW9xs2V1BZDctqjqOoq+Q3nyUWp85FJ4zWnLWpKsabw9shHkNGx+s6nDAHEUFDg8pory8oi
 h6H85TefRkcERsK9ckG3hv6s2dcb3jqWs5SPmfmnhRHcnke2mUGj7VrUhzWz1P3H8TwuCM2vP
 YWX3vD/nQCoPXUtoM9Y9d15YScACim3Duv03XrGr76ww7oeg7p4NkysRAY3xxOB9gHxzeej9E
 vUprX959i8PeXWM7jyIZLPtiqBSEYepSUulAWy77wKzcn36DyGyBOjL3Uvocd2wwyycOl/Ac2
 3ntSCYksFKmTFdppk/tSPT8OGDvf/KYHtKmE15agA8PKc5LMPR7DpS+BAlJRO6Pe7OPAWftOQ
 hEX8nfvbDYyW5/C3mFKzJmX8NW/WdQwETSnrcI464ecrPxAQ3ac1+aEp6FZjUTONJ6Ic6x3u3
 QxS9akhNzIgnWORJUXgLyGGmxT139XXqjILnNq4sJ+vuB5z/Yn2fMju87O7tSv5pHv7LcMUV/
 AFv6BXg3+tdYhXV3JX/S4Hqh6vzv2a47c5MqNZrvCaVsEM1F9zJ9ZTXCroapy6QZB/XpnzAv3
 Tj+rjOdP3N0AWRXYUfOBe+mzJJbi1ezROKLHAVtO3VPwnbjeorOFJY75z00So5UOWMBfdponC
 0G733L49jjtuZg82ZdcaBcV8Z5InlMF8KSuwj/bmcjgpCSp129b6jXbkP4Q10lED55bOPx06m
 K9lekkMgkeU9O0BVWP8uDE8uTbgCDPC4E/ymLV3h/a2oKTwUOX3mHdum0NmoXXK0i/aut6CmP
 gT3xrE8c7U2c+V0KX0JJG3nKBoPpn975S4qFFx57RWljy2TrT/xVwa6Y/Ik9griosACZALt0V
 HTcNRR+WHB2F2aK/4nZvsHLLj2CjOT3WaxbBHJGmJQupSOQbw46Rl10PxdnoAhS/p9ogf9kdu
 TjRrwjpibI+T8XC4Gzd7VAGUFGGbRZ74z1fzdziEKTk2TsL0eTDqiM9VjcKgq+vp7DAT//IUo
 ZiYlbWXn7eEAziOMftnsF5eWcxM6ijMVfS6Ohm5XoAhB3sMaZ3CUM4DEc0TkTAsTSwvbFRJRQ
 tEBBpCMaexnV4b3q+S73M1jvaJEb6H858ERaQ8QpZRlUJsGsNEJmRwi/Gn970bPdXGwHtb7LE
 hKycMcN3Jt+dEu+RaJQF/SuO877BiGjmWQENjXFLDB8UQslycHINS6T0YiTk/80a9gva9VsFq
 0xlJlTmcvOvDbQ2lk8tnpRsv4ftCXugamPrwYlNypOIvUfuUEiGYAajczmzlwbRU6bLmR++Zg
 lUS/kGsnflOmVMDvAgC6OfKB3rT5iuvAvnG407dVbMnbV5RgLXwJGqPynlkD+S+tFwFQdTXqa
 Znt6eE8W1/tiui9l3XDQs39ljpc4jLYfng7xT//wlYNRoIvoiuoGSTwAnwsDiSfKUaWTMB4sM
 qJ7VfGSsEHysAS3TUomKC/soJd07ZoCrAXMAr/PDzDl0/+6tK2JgnBDxHxuAEnfQ0R6fq3evq
 9VdLxRrR9Fa4ADqqQf4vkxA8d1fJh1+ra8fIe1k+JTMKNvf3yodZ/VIfzbvRgdC08/ytlNYLh
 FkePPJlxvA2F90pmjFovXOOrghk3//nfa+sGaoD5d01qizGnjEBHa/V05ZMZJHGnSqSZBe3Z4
 0vYwcdDponY1J1IbKJCIEmK4DAMekHpbew6/FmL4delRZfGNzxoWH+7ukulQyd9gRrd5YA5ZU
 vOgrclTjN1AUJ+Uf45l9cnReXWOhAyXJlO2EfNO4hXupIv4BG98vmZjMDqw3j/V5f7gxFuugJ
 6UFxnBuA9aeEE84u5/F83rBqO3ORXAhK/zQyJuOyumglh8dkYB93Dd9/7namPnuJGK+DJjRGr
 hj+P+4heh4kYdkxyLWBlGLKTqTCWIZ0KNMT6oQ96KS9b6IOEe7EZ/hUmG6zCie5+pySs52uyB
 LYAbPOvlMxgUhiUAL/VRwA7aQoWFl1TdvJ7dV1oAttadjA9IpseOcr2rYGXduBsWH+tVxVWvj
 rcArTUwlJNgcS/NU3DfkNu6CXUFVTIPPjpJGHYIVUFbqIzvaoHo9pRz+CJ4ETj5aZtCq93F8m
 oyjd/GglGZ7gxnzd7Ij5D9xsZtw3w/Hhv50tLIf15dlvU3L4tGiDaEAAZu8m2XiLdWk5dcTNT
 dHl+pGsMs5vFDFVe9gVFAxk/Y2aa4qpJDXXXOl97jEINoTbJC3vAomAzBBtvSnqEoCP09BLXi
 wHMc6sDZhq8Wi/hLDHc08huJSQCAguHhHxx85GqliGA7ufLu3qtfLlrq7LGr0CXLsTxQhGev6
 HHV3o/lZyM9brpG+FNxF8r/4Lp4a2gk/3ApuVTOrkHJPrBG0FmavI8A3hId7A+RS9inmmGEqp
 kxi10YeQBpuLX8zGoX6z1OjjlF3+UgcMIdsnVYYjh3Iilz4/pJ85t3f3tT9hv1hbjEMyODosj
 a790AceyYqzlo9P9Xm19lwE1UH3zWWGCk9tKJ3UL9c5nC25Qq9YPQOoMy5p7ldRfJ7ntBgwNQ
 JNDAT7gi507Mu6ILNkqXG9e/WZAmxta8lEoWcF0rzvHnANEYWwBJsZPjpjF3bV0Oiw3ZOYBHO
 vqyze49aqZO5jYAMPPi5vvtJRRSxSCu6UN81EbADCMtyFDkyyvPs/+xHW4Hhh2XrYUf9yeA12
 YIcTQMrw4Mfg7j1q43wnCSH3o0RXx/cYqHL3lGnSxNSOM/3Dmmiza3YPGRuXXOsRbX2S4INe8
 PPiKGpID1am5/Cm5a1ZHu5dQsfB/3eiqX5a0AYsRCOJ7UCpwxoD937YJPr8KSKYNeILxMF1IY
 +vk9vhxlcpAN1FUd6iz+LWqbV7skzTnXRxZY+AcRvco7QLzK4y2/jUDcEA9R2as6df62j0Idj
 YYa5qltInHNY2QWzywz4/oNl8K9lb02LZxVKmqQpd8KN3g5Ds8BTDACwm9J9jd+YMgQZ0uX8j
 7qEx42Zzb7wM60NY0gVptIy2wF44Yf1A/1FBRl/GrqNIsisMRqOOcnpykS3OI7BTRkm8MzNFh
 ti1acvVbko16kXONyPtB42kcO4rnAVrsm1LTLIz+aneasW5D4wefVnyiy9dTzrx/oFrugegko
 gChLSd7Y3rxey/S784BpF/UicJl5sdK2s0j6RZga+k3puKntoO7IB3VKQVtME1lRgA6gC28yd
 o+BRX21m8v186K+EaczMUvkevX75t/Sw5CXGN4Twr4xSnVQpCBa/pu8efKiE9YvhQM/a6Ef88
 UnLokiJK9+csTrW01zmhwsMo298+UEiD/xoEZHg6RNyiXvcnJ042+ooi7pdsPsS8PqgNJzHbx
 hFJoRMyZjZObgBk1KzNDOEIQj2rprzbNOYY2f4aCTs2jFQ1lVMUCatLO5oMsTf5wfzEwhM4BM
 rg6PcmgbRS+zzBYlon0U7e1P1JJ2zH5OvD8Eu+Ew++CDNkJr8XSXQMOZWUvOw7znACa1r+6kO
 a6aCNI2C86hQTq2PyGvgfUBJZ4x2BQdkXVK62nu5pwIHsngqzD+83w9oq6FTP20hFySG8+waJ
 Amb4QDbx1wPlNaLnXxOWsrTgSu49bDSpyYXTj2wBXD42h3E7TOHe3oxHNvc+iujfQza3xHW7l
 51xQan8Fvi8nfn3deC3sR1yXohluLMU9vBM1U1o6kkI4iFjeOZNVHaCx4X6jTVMt6wPyYp9gz
 aP/FdXRq8c8X4Gf/NGaxRG+UqTa1ME3Dhk/X8noFOaYpWRD37zr7n+kYxjzVAow+hPBD0Dq1Y
 PUxqlzn4Y7txzgTDQZ2nz+df/YptAx25mqgOVZbTC0YXSBcAmapwMaGoh4/aKcPsAe4Io90py
 k/b2p4A2wW15Us
Subject: [Buildroot] [PATCH next 3/3]
 support/testing/tests/fs/test_squashfs.py: add test with dm-verity
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

This test uses the option added in the previous commits to build a
disk image with squashfs root and matching verity tree, and boots from
it. Building a kernel is necessary to get the required device-mapper
and squashfs support.

The test also serves to demonstrate usage of a verity image, more
complex setup may use an initramfs instead of dm-mod.create.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
 support/testing/tests/fs/test_squashfs.py     | 85 +++++++++++++++++++
 .../fs/test_squashfs/genimage-verity.cfg      | 14 +++
 .../fs/test_squashfs/linux-verity.fragment    |  8 ++
 3 files changed, 107 insertions(+)
 create mode 100644 support/testing/tests/fs/test_squashfs/genimage-verity.cfg
 create mode 100644 support/testing/tests/fs/test_squashfs/linux-verity.fragment

diff --git a/support/testing/tests/fs/test_squashfs.py b/support/testing/tests/fs/test_squashfs.py
index 0ceb4cab58..eae84fa454 100644
--- a/support/testing/tests/fs/test_squashfs.py
+++ b/support/testing/tests/fs/test_squashfs.py
@@ -1,4 +1,5 @@
 import os
+import re
 
 import infra.basetest
 
@@ -55,3 +56,87 @@ class TestSquashfsMaxBlocksize(TestSquashfs):
         # BR2_TARGET_ROOTFS_TAR is not set
         """
     expected_blocksize_in_bytes = 1024*1024
+
+
+class TestSquashfsVerity(infra.basetest.BRTest):
+    kernel_fragment = \
+        infra.filepath("tests/fs/test_squashfs/linux-verity.fragment")
+    genimage_config = \
+        infra.filepath("tests/fs/test_squashfs/genimage-verity.cfg")
+    config = \
+        f"""
+        BR2_aarch64=y
+        BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+        BR2_LINUX_KERNEL=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.18.48"
+        BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+        BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
+        BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="{kernel_fragment}"
+        BR2_TARGET_ROOTFS_SQUASHFS=y
+        BR2_TARGET_ROOTFS_SQUASHFS4_LZO=y
+        BR2_TARGET_ROOTFS_SQUASHFS_VERITY=y
+        BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+        BR2_ROOTFS_POST_SCRIPT_ARGS="-c {genimage_config}"
+        BR2_PACKAGE_CRYPTSETUP=y
+        BR2_PACKAGE_HOST_GENIMAGE=y
+        # BR2_TARGET_ROOTFS_TAR is not set
+        """
+
+    def test_run(self) -> None:
+        img = os.path.join(self.builddir, "images", "rootfs.squashfs")
+        hash_img = f"{img}.verity"
+        root_hash_file = f"{hash_img}.root-hash"
+        verify_cmd = [
+            "host/sbin/veritysetup", "verify",
+            "--root-hash-file", root_hash_file, img, hash_img
+        ]
+        infra.run_cmd_on_host(self.builddir, verify_cmd)
+
+        dump_cmd = ["host/sbin/veritysetup", "dump", hash_img]
+        out = infra.run_cmd_on_host(self.builddir, dump_cmd)
+        params = dict()
+        for line in out.splitlines():
+            m = re.match(r"^(.*):\s+(\S+)", line)
+            if m is None:
+                continue
+            params[m.group(1)] = m.group(2)
+        print(params)
+
+        data_block_size = int(params["Data block size"])
+        data_blocks = int(params["Data blocks"])
+        sector_size = 512  # default
+        data_sectors = data_blocks * data_block_size // sector_size
+        hash_algorithm = params["Hash algorithm"]
+        hash_start_block = 1  # skip header
+        hash_block_size = int(params["Hash block size"])
+        salt = params["Salt"]
+        with open(root_hash_file) as fh:
+            root_hash = fh.read()
+
+        disk_img = os.path.join(self.builddir, "images", "disk.img")
+        kern = os.path.join(self.builddir, "images", "Image")
+        self.emulator.boot(
+            arch="aarch64",
+            kernel=kern,
+            kernel_cmdline=[
+                "console=ttyAMA0",
+                "root=/dev/dm-0",
+                "rootfstype=squashfs",
+                f'dm-mod.create="verity,,,ro,0 {data_sectors} verity 1 '
+                f'/dev/vda1 /dev/vda2 {data_block_size} {hash_block_size} '
+                f'{data_blocks} {hash_start_block} {hash_algorithm} '
+                f'{root_hash} {salt}"',
+            ],
+            options=[
+                "-M", "virt", "-cpu", "cortex-a57", "-m", "256M",
+                "-drive", f"file={disk_img},if=virtio,format=raw",
+            ])
+        self.emulator.login()
+
+        self.assertRunOk("mount | grep '/dev/root on / type squashfs'")
+        out, ret = self.emulator.run("dmsetup info verity", 5)
+        self.assertEqual(ret, 0)
+        state = next(filter(lambda s: s.startswith("State:"), out))
+        self.assertRegex(state, r"^State:\s+ACTIVE \(READ-ONLY\)$")
diff --git a/support/testing/tests/fs/test_squashfs/genimage-verity.cfg b/support/testing/tests/fs/test_squashfs/genimage-verity.cfg
new file mode 100644
index 0000000000..13761dca8e
--- /dev/null
+++ b/support/testing/tests/fs/test_squashfs/genimage-verity.cfg
@@ -0,0 +1,14 @@
+image disk.img {
+	hdimage {
+	}
+
+	partition root {
+		partition-type = 0x83
+		image = "rootfs.squashfs"
+	}
+
+	partition verity {
+		partition-type = 0x83
+		image = "rootfs.squashfs.verity"
+	}
+}
diff --git a/support/testing/tests/fs/test_squashfs/linux-verity.fragment b/support/testing/tests/fs/test_squashfs/linux-verity.fragment
new file mode 100644
index 0000000000..914dc87fbc
--- /dev/null
+++ b/support/testing/tests/fs/test_squashfs/linux-verity.fragment
@@ -0,0 +1,8 @@
+CONFIG_MD=y
+CONFIG_BLK_DEV_DM=y
+CONFIG_DM_VERITY=y
+CONFIG_DM_INIT=y
+CONFIG_CRYPTO_SHA256=y
+CONFIG_MISC_FILESYSTEMS=y
+CONFIG_SQUASHFS=y
+CONFIG_SQUASHFS_LZO=y
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
