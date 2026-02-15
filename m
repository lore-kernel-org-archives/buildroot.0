Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580C5E63F19
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 21:39:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A7CB80F80;
	Sun, 15 Feb 2026 21:39:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LsJOrwM0qMeQ; Sun, 15 Feb 2026 21:39:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42A5780EFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771191585;
	bh=8h6sAo9ZwrH5EUHkX2rm0pDjqtqvN8C7KOHVP/UU63M=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=o9/b65yiStuomu6IARSwBz0KxxkGAFStsSz6KlySulHgPPr9rOhvPzHEpRu+nPqor
	 jLkx++0ctx3DK40y3uSYDyE3/AEk5K660MU7yU+zIl5OlZqdbRLY26Rmg67dCEiKuK
	 ZnVC9NbqKvytoTzK/GUMVinVFjq1WksMqP++ePqNrfOn8kjBlZlH2oDxOAavmQdnBL
	 bkY3eT/nH/XSk0VWbfAAsILt+NCaNcrgR7cbesqjlaNfK8c9qcPEPljh6lavlB3KZF
	 1Px7nu9a5s6MMfe8n569HOyHBYkXBVDQxG8rv1/p98AE5M7i98vwQr2Tgvs30hLoae
	 wWDJH4BHPn9JA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42A5780EFB;
	Sun, 15 Feb 2026 21:39:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ECD11EB
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 21:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 92E2380F0E
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 21:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7vRuTutrWc_W for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 21:39:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2199980EEC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2199980EEC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2199980EEC
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 21:39:39 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.18.229]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mkpf3-1vUSNq3Kxj-00pdOR; Sun, 15
 Feb 2026 22:39:37 +0100
To: buildroot@buildroot.org
Date: Sun, 15 Feb 2026 22:39:12 +0100
Message-ID: <20260215213913.713705-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260215213913.713705-1-fiona.klute@gmx.de>
References: <20260215213913.713705-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:6v9FjPuR4MLcLGh4Z9mQ3mOzJ2jq8Z64fpultRyS5J3CYq2u6hu
 9jv291ftbWvmcb/9g/oZbFZE2LHhVfoYHlkuwSXc2Cgpc4vuA3DC074A58pq8IqHkqcFEJ4
 XMX39z2EhzUeE2ctwUTLYru0njbhmmukkeYOE9zbA/TxrXW05Qb9MF5GErkIb2VM1q2jUsd
 hTxax/LTD7L5kvZOHVQfg==
UI-OutboundReport: notjunk:1;M01:P0:ptqROFSRhT0=;DYkNBmeK4kRDj5XrypZR9tJCVCa
 m66plbPK8c6WsYmln3gf852UfH6yHlpAhhaxf8GZNxMe7vmLCLB+s18V8FJ5A51m1uvlBWZ2r
 C0qXQMl8kjyd9bCID3T6gyjzpi9vjqXQxJ0Ba4JpZzvfQwfcwU2a7y/spVhsy/0Ta3y0dQCAz
 R2catgZgUIxZcNKlP+hokaT/Hk4Q8PwYkpQSs3G/51LWGd4uXlk/99Ij9NT4ebGK9Qf2k/+Q2
 fJVXqEA7jwje0mSZZyvuOs6ysGOnU8n9e56EskwjRH7jZyO/4ZC+wm2gL6ZIwQjQl4Z2KfWSK
 rm4yZaRApvkdSTrgyRipLDZGPeqYu1Q9BdQgXM8Bd52tcezoNADlxIpFOxfgbP0WZKC/Vh7F6
 d4EesZHcInRjjR3esInzB97j57EJA2YM0fY3RfHNibjl2KYVj0JEP7dbxdTEn6eYLR8Bbk1B5
 G8SvPwdvu49/rCbmCsbeWb3e7CL/3Kbjcki/M1lgdIJ9x9QS3/srQFf65EbH9rdSvr+5AfoP2
 4Z2HIBPkRv41EskBV+p89hVDpHxHsIa64owcYzjHE1eU1f1IaurC5IZsI0Vq+R1F4iX1xPlQp
 RU+qhzTspkQDAOppf7HuQmceSQsYR5zokBBYCY8hDNDoFDkirF90oFWalZkcw6MjoQjP4VEoW
 RmRJVsL1/M6jBVweOl5GceyVjF162JZApe7iQyHc2d+0X4ETDBra1Pn8yT3SHkkwFg3AtW/l1
 7hdbASrcHe+2AltFJfZB4zX2X80151uq7Ym3LebxuEDyuhifQB9ufBfF1JDfZQ1M0/vIo47P8
 5ZULf+cP+bbxM+vgusk69yLo+88+VHYgq25SJbwFL8/GXR6u9D7iR3S7VAtEpR4gFUS95xjji
 pL51S9/9z8Wy2+Rn1S20tilMlvYi0yVvQE9cQ0vE6tek1dWoP1w5R2J7prTWpp0pWd5ccwfH4
 KmRkadRqFhv9FdcnoHZr9EJBxBH3kUoBpAgY1cjz0miPyVCBzy2xy9nTXsMfGUCdI+h2SZvRM
 qg9YORYePkcQIr+hDKFaqvr5ZbWN/ZLfMCqausx7Vqp70Zqjv/7wAFAzyy3hjPifanHhICset
 x7/+gISfkPtDx61kojQaJfNVoaDFsUJ93HU4Aoq50jwBV6Z/svcr/thxGo80J4+Rxb6ilsF5p
 eGrjQNZYP6lHxfhrkKUK7bCfl5Ke7BXsI7BbjnQNmVVtmrWbpIUJyb1DoagxkxlOnY0p4WVxw
 LoWISRvfvrBBWvZnS2QJdo/aZQ56SfQFoC/DTDIDc5KfPjcqXNMzkDMI75oqP70Tft3o7D66z
 osbdk6/ClOBNGZGOPX49bRLx+QTg+PsKJPWpxW8M6bclwrH/ALEtZ5do7kVBVdXjOoCvpLOuZ
 LtspYKIVX7YmkRmyUOjJLiFvHjtHgws8NsLcEKQ+W6tw0QanoAwokBN/M4a4DXRleQSchISoI
 FiR0muejwVD1jRSKD0a1g7irM4eWRZbO5/D0nPj7L6PrBVBA+qmudsKc8zml4yUm/Kp7Vke6o
 KE4LW644HPJy/MjpZrgdmVs+yjWcDeJcS5ONHvUH1nAJCH6ZQWD22o/L3Zkn5y88EaE/42smw
 Gvl1xP8go2O+NfNT1c283CB10sOZ70dKTxvkrUFLV9EHjdmuz7TUK9O8gdv4f3iMx31C4q1//
 WeBTRCal/oJRDnKUHQ5wB8fp/jxkawx4wKcLFkuO8n1XuLHE+VtLh9BvmjtJD9jK1OIzI4uB/
 9pILJvlU7lHq73he8uPKI/5cWg5S+gRoV6ODZoiQUnqMxKgJPGgxbz3fzSHGEUL1WqeN0yoWa
 cenn77214x20icYooo5LDIRqPiCgV1l4GaFJ6Y4a09UuJB0F0XrZiwG43wllsUmCNltxPeMhn
 iYOjVgHqPb4OzcR9RLTDs++hjCb0oBP3AD0RCWSoP6BO/nStROdyG4ByRO0siFxHUyNUCCIC6
 JYjGSjZYmUrh4pytYOsyXVCAeAvkaDS5FcUqzwZ+FEAx+iftSbpth5NVub0OQJ6T6sP5wEFnA
 LlCRoOnvc+dGGnhRMAGzlP50AX1CioCITBiyUj9hZvkTuYDaFrV+NvQ2n6iC22D11a45lNosh
 RNlc4hZar5UUY6mjm1ZyN9MMFhYQSLimeA/QwgNpXbQKAACevtZu+pfMnXzp8ZOlsuRQZMg3R
 vJ8QAQ+zJzzgVAkAa3mHnk5rV3SjPQ5rdQdw5Hgxe8+c5TatLz7NFZnk1oiDMxwlgBwRCjl63
 wbqfA2RXvtsV5ruZGHZatGjmRaTLimtJP0eL1lvWLStbLmZ2G83qj6+3rfVLuOk9M4wf1gt8d
 EUlk4X+nclIfx7Rvyqyfu7E4j/bHGLh57nrhsqlk8foDjqgLDjWeNHFcQnMkF764CeN8ko/+B
 xmDQfJrJ8yYySF2lwFTqTv6d+5umBt2uM9KYKNoSbu2bUjuSOEh7xaShhLw4z0iWddeS6j9G2
 EKU+GTm/o45V0p9RFadtJS4q68AnpWbgNarYz3Mq4/p6hBTRQF2CXzhabLtkj3suW6bNTCnq8
 MPQjCVZqYXuBbgOAVzoMgJEB5d9mIfzsjk9dH1lbvWT2iHkwarSmDg+L5Cbdc3Xp0sYorqqnJ
 pTrb7RU0lrQjcJeLzk3bgr0EokedxcnZOjdsXTQ8DpEVMuTnK8bLZd7pRuSQjbt5sHl+k2MlN
 /m54lGWUvHfC73ImPzZVnywCShP7Gj7IXV5rDNxus9ePkrI3235G8d8K1xwHQMLyKINsyyVvi
 9gQM/KZn3m0Z57BSUAlJuAXXbt77e1lfebl02Uy/j2/T+qcV9jlIxKeuq9BlTSQSSXKfW1FoU
 1UDXXv8UGQ8oukFXM+YNRGhxnAPKMyNc55JD8XtC3oSQy6usBw63nwzId3JDDW88KO7Agjjff
 nKEtJ9lsIz52DA/OaRDYil52xg3ICL2X+bF/L1SPNLzd+JRLbgjRijrYusP7ge7zyblmiTc6e
 Tu/EmHgFhS3VduRb0RuJ1tMJcWgSNlbAb7xW/7MsdPYioi0/HwlFNja5sRXr9H4bMM3Rbh8oJ
 1mVKyal9TAs8DjErh83F1kp7OTg/2OC/qIjKZ1LqNd1TLBNO3/ezjq6a7Rg6QoaOTLAgnF9Sw
 MsKrHG1IJM9eJM1gyMdHnKyMZB/vnb7CTYv3kIB/S5GzwjZM/wgvY7lHitjcQEKVb2+Ynkp0/
 oPj+PiCqro9MMdobKngam4wFM/qbmyWo3L5XNoKp31HFHAjTdRpGcgPDgyaUymCJoogwkbtrJ
 FZ2/KWEq2ydQ24m/Q+WRsEmGjsrRhQ/x8XAo89qIHi7wRQ3rra6koYRu0CoSldHrj5iF03HbH
 eZ044dJKrmJzRJjBT23elHh4zS8ER7ytOV+sCK/wEwlgfK35JawJpJqTk5ez5L16Jespk3mUj
 +31YO8Ud4hy6XhrcvMZmDrySRQG+yDQQV7iTbocbsVczQ+hhsVTcXKaSmTFm/jnIb+52TqGhf
 PcyzSAOAn/soB4t5hcW75qr92JWg3lcTH6EDSwyUBdr3vOtg/MEQGpuR5IP3m01B00YIfHrar
 ehi6dlYeCn9o8Q1X21oq9mOyyhMMG9wi24uNXDAnmkpF3eOk7M5XxCRhJ+OxrlehpT9x59skc
 omPC3tf3UBP2ybNn6D1bZH5XsTU57tJWjTv5w4LvGMuSu4PVDp5ErhYr2arKrn766qGLMq+C4
 1QfiT19bUDT3GLkiHbskpuqE3kVK4AqboDnyySG+vxN1n38GUa06zLpYLdX87ZX3npJk/9QkU
 ee5ceawPeAqNQaOLZGLGLKYtGilpvRfRFmehyl2VioL2O0i0LSjU98ISZmi9xrgmuO/Puk463
 JBxS2kSxrw0bRmAj2X7EoNJNAI1eEXCYlknn4RmXj3LgmgzoJzCT1vaPQerRohZ4nhC8Hj2W2
 jfrfFpAku3Hi69UZge4BD6eOYS3K7KMAMoXD9H3rCVi0CwLPGAgqFxEW5KRNVaovf35PKXxwR
 jG4secLzm3kyEPKdbx5Uyuc7dEovxzyrypORJtiGv+kPvtYNndUhBvZA85/E7lfXV4XIURjVD
 KzitOskh5zYJU+ZVRDyMjlieHz2SHYyhC8iSTLtHAZVMNhvhlE/LwcIInelk5ZX4Lj60DJXQl
 yXBm/XOU2ywqA0MWiUQJeNzlPTer2Pe308d41fb7UaLRhFnW76myCe6RfYOCV+WaraTwr8Urk
 +5yodxb3O8zL8xvW3TCeyv4BUQxBFYIsQ3JxoVMLmrh9G3gumfH3mkw7yGTxKbPanrlQLmWpm
 8sh9uJwf6a6bWhIPrt5diA0G76Ep2dApNBRQe8me1prFN26cy8mSifmtf8ysUMjCKLo/s6B6Y
 07ZdoYmmdBPnKAEi7gziTz8IuVLHnEqdfDGiPvoYGFLJO0KO1RKEXEPJMVT/VpnAcwM0vpO/n
 UK4M5k8vpE7+MovwpMbwIG+UWlpr0qHx0XDYqpLA5whV7xrv39pZu8OGOZAEdv0Z+JXblz9PF
 WHfPXseFyOUlgXkObUfXQQ8u+84l6jYtMFg1OrBujITZZZufUYebE0L0sYKt9SjOMbxYrmUwE
 B67koQWiSFz5BkqmG5KMiLJF8d6L419MnJUIc9d0deCYJwOSBVLNOiFomRD4dyuG30WyMZbao
 N5bWALiwNQ0jpJp6HUGTh3WdDg+3wsumPbqUEaKd3HQH8nDopDThVNwP7nG0DmNojxT2LblC4
 jgA1SHd25Lx4pPRkW8392ZkVmsO6PWZahpLmozzMoczeKYWKobW40kB0fdmY9gZY34xiNpzl9
 JZ22kb+uvEQkSNXMrA3I5c/owdgvyAumCFteCNSdQd0nVht5EHxDjcYqFVY0rOjSs4cC60Hhx
 zTYow9ndWvcpU00KKDZzICKSR5YDoMy24Q4P7PR6a8JgNJoW8w6FMMw/KcRFuS23FLF86nWYp
 dA5owO99s5ckDDA+uKmm5CpTbAJOj/SAem/scEXSuM1U1jICoadumOBWGSg3HUs1RyvAqmz67
 8E8nQpk0vXqbK+ecSVnAaHHhzntpjPM531TwwtQarBApPsCZlbKqg/SmCebmO/E5ZNaYyL1Iv
 1BpJow5lwYTh9T/svRGGFxdyaBIo6aJHWPI06V94fhzboTI5ZlB6nIOZp4OcxUvvPzAp4oMOE
 xUmGMJeuhXy2bQm1UHJkzqrh6cw3tvU1gEBL84bwJgwtqLCdao54HCLmgYcgYWaR1SDhXtw5/
 GrHdfF1EBK/3wf4YydFpIqcumBZOI
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1771191578; x=1771796378; i=fiona.klute@gmx.de;
 bh=zZtK1cGq1Z1GpzbwEzBQ2cJnN7pBko/P7Cb+zG/EeN0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=kybPBUIecsYDQXp0hMRwE09rs83/Zc3n5D2d5cFEOm9j/Alti+C7hgVPIu8PB8I0
 tm71FIjGKOZgX0W6sj3adHlRBy9t8OhhucyAqI8kpeMTmr208v+mMbzClDu0ozA0Q
 vp3lCsiD/YKExgJchA5xdZKg7NCe2vKNeNaIsT2faGCe+kbjFH+GNzArpgZ6FHHzG
 C3mc+DPbpbFHCwPTbF+EqvV9kQR2TlftIdv7+/ce+jf+0s3KHObeeiEmKDjHGDEll
 oJ+l1TZRYXZH5ZqTcYSu0Ysx6WxJLeMcvZeFMztUFAfpslbxjI9Mak3p4eW2TwmkV
 dLgDoZEliyEqfh16Yg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=kybPBUIe
Subject: [Buildroot] [PATCH 3/4] package/python-pyasynchat: bump to version
 1.0.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/python-pyasynchat/python-pyasynchat.hash | 4 ++--
 package/python-pyasynchat/python-pyasynchat.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyasynchat/python-pyasynchat.hash b/package/python-pyasynchat/python-pyasynchat.hash
index 232f936bcc..fe911d2902 100644
--- a/package/python-pyasynchat/python-pyasynchat.hash
+++ b/package/python-pyasynchat/python-pyasynchat.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyasynchat/json
-md5  9fa7e3822f689b1236ca59c5f1b71415  pyasynchat-1.0.4.tar.gz
-sha256  3f5333df649e46c56d48c57e6a4b7163fd07f626bfd884e22ef373ab3c3a4670  pyasynchat-1.0.4.tar.gz
+md5  211b23ba9dfd0905ee83bfa26ea60659  pyasynchat-1.0.5.tar.gz
+sha256  36665473ae730dac51e6d7dad70f8295962120c830ab692f0a31efba32687e24  pyasynchat-1.0.5.tar.gz
 # Locally computed sha256 checksums
 sha256  f4f80c98161f5632004d44713b5cb95e400145b40cbc0297f1f50c27b54befdb  LICENSE
diff --git a/package/python-pyasynchat/python-pyasynchat.mk b/package/python-pyasynchat/python-pyasynchat.mk
index 2c503ea71b..55f8979805 100644
--- a/package/python-pyasynchat/python-pyasynchat.mk
+++ b/package/python-pyasynchat/python-pyasynchat.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYASYNCHAT_VERSION = 1.0.4
+PYTHON_PYASYNCHAT_VERSION = 1.0.5
 PYTHON_PYASYNCHAT_SOURCE = pyasynchat-$(PYTHON_PYASYNCHAT_VERSION).tar.gz
-PYTHON_PYASYNCHAT_SITE = https://files.pythonhosted.org/packages/8a/fd/aacc6309abcc5a388c66915829cd8175daccac583828fde40a1eea5768e4
+PYTHON_PYASYNCHAT_SITE = https://files.pythonhosted.org/packages/ec/d2/b41df9021c12ca314146abcde7bdd3d9d37d44cc01559d7f13df459ee586
 PYTHON_PYASYNCHAT_SETUP_TYPE = setuptools
 PYTHON_PYASYNCHAT_LICENSE = PSF-2.0
 PYTHON_PYASYNCHAT_LICENSE_FILES = LICENSE
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
