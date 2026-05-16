Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42688CD4F21
	for <buildroot@archiver.kernel.org>; Sat, 16 May 2026 08:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD9C1423CC;
	Sat, 16 May 2026 08:12:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PXsXvd9Aj33G; Sat, 16 May 2026 08:12:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8516423D2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778919168;
	bh=sd9pLoSRbUkF35+EqySAs2nCngH7smKwXCoBXsXOPe4=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Hy7rN2ZHhJA8SE5vENSmfb77vxtJxiEsZhUuxwhl58+5YXti5W6kueY9HFJxjI05/
	 9/Gtilt3NYE0DWEKW5E3AJGwOA0+GtqAwDx5diX6gUNZVEnxOkQ/5xHz7mGrdzz/Q9
	 zse3RG8JkwMLufYfV5mKovbNOVcOpeYfLU/oYV4PvSL22WMXcAv86KNwkTOLK53Pqg
	 ZoCchhlOGyObz7TrHLEuGjMJkL5fPk/sawdR4PrRNSXIKMkXnYqKVY5G0JvHvAPkWO
	 EZh/RO8UlUUah7mWr4FTEDhppV12a7z1gC1sH99Klnr5RirHiMn1HHdtv+cz08J/IV
	 LWUl7KKWZahyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8516423D2;
	Sat, 16 May 2026 08:12:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A95F845B
 for <buildroot@buildroot.org>; Sat, 16 May 2026 08:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A6FF80F4F
 for <buildroot@buildroot.org>; Sat, 16 May 2026 08:12:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q7nbjSw86O0R for <buildroot@buildroot.org>;
 Sat, 16 May 2026 08:12:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=and@gmx.li; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3E15380F4B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3E15380F4B
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3E15380F4B
 for <buildroot@buildroot.org>; Sat, 16 May 2026 08:12:45 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4zAy-1xP1cV3igW-00y434; Sat, 16
 May 2026 10:12:43 +0200
To: buildroot@buildroot.org
Cc: Pascal de Bruijn <p.debruijn@unilogic.nl>
Date: Sat, 16 May 2026 08:12:36 +0000
Message-ID: <20260516081236.7065-1-and@gmx.li>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:O8HFD924M3ia8tuUcPy24ZeIppuFbywpXTsAOkDIu3R9ppFAqn2
 T5tX6EJZkhbPqKNfKCl+ZCGnnpvgg65gUip8ifgKpE3nKETzYzoCG/5lT50XRiGmJePRufI
 DOC/Nf9LBWo7c1hME+ACSIkYA/tJGTETbK63W5rZvgi9XTincAmGNI7Un3/tucUlQ7IykWE
 2QCAX3ax74jv9yc8ybepQ==
UI-OutboundReport: notjunk:1;M01:P0:VigQIcgq9p4=;ZBlxJNY6+cpQ9wajQl/re0l1L3h
 mHSxa/f3OuaRkrsebP8fxa+AWfH6EAHl96Lch8ECmcrAKHEVsiFHUyjFwj+DtHw9gsel7Vtq0
 OpcSjGDlU67jQpcK6JvkT/QZwnYB7N/19WntrxCb3zHmT/9seq0O4HCM9d2yL7C+EPOcRe4iP
 CF8ELGtIeFED2H5EtYsBn04wvU6R8wpmQPxR6Gjj8v9okLPCkWun9LKbC3i1zZw/n6AKAikGS
 nnm+y195NtD6YsWHpvorxr3TvBsWxStvapaFN/Pv/kh3kShT3Hem/XysxVLkye0FEfC7Y++1+
 rSd1fSmj33jSYIDUb8uUhBF8cz01Utt1lyfLIJOoI/Pepf/a5kFu/T4DoAFw7x4pubCos7X8c
 Y9oCKuPXPNS67pgTb4L8jDdeH+xlRcyH+Fx9lHXfSKL9uuxu7MzFI1kk3PLV3mVg7Vp8ynXNe
 OzligV5qdsJhgBFIGdCqWFpfDLXcrAnEwmwGXLo6ETe6RIKMhQ3Thzqqz1yG6kj22EaspA1F0
 Mp4DgIjMy46poQ/9Is/Kj7qqm01oLuCjugfvlWD/0KPtNUc7M5hCAsWSfYGm6hTxQbu0JjIvZ
 4ulnes8LJdXtcFBQSbk8heXSfFmjrby+XKWqODo5hjqcGS7iYcwom9HaqeeMARYGfV9vvDb+t
 heuHPRe9+c57y+k/c+jJjph5g12idC02L4YRLDaRkkhsFH0+Nx6eFvhtJU6Q49RWUtkJQ1juz
 5PjdMGjSotx64JZKETNYwIblQoT+iHbdBfwS8eRI2nt9LnnTfaHwZSwb1wHoj4AUL3YToBLrm
 wtlMvT5hj7V2c9Hz1e6xYU3cRalFx08zi69Eo489ayMv8mIOI52RGP+2Ou0FHMwuPffR8mhe4
 KSnfqfybpMSvJ4cwhG8/QJnOrCRv4fGsZqstkeuPts1i6z4m7+Fm5EexVKS3+2/n2ed11MzZ7
 QI3uWHBwlJ0XqWHdkhqSZWnG4CMoGWfsQxeQ6JtSfJ1pWUKVMndtTf2kTZjyt6hlCfBlMqGeX
 Eiu28j/r0uV8sg3CEYYPTRInryQ9qvHJVXmej5Jz7U9xHvvQSOPUHeEvk3B6Ry85eZks13EJy
 SSdbfbSSWMUQagGliNrC0X48RkjHbQrKkW/n96zfVdzgMwNnC0fQkO5lXsnu5jwdhUnMu3hUz
 u8evFp+QE8jS2PRw//8n3UiAqybc0bYwvhPo6G/8GKS7MJIxRjhmKVYzJ6WV4EbGhnB4WgXDH
 jcm6WZMSLN98C5fSc1VMpkARKf41IwQvwBlSB43/YyWuUw0kgvGcfhPfFLf7yOfZtzt1v+Drx
 IXWZpp+jEb0SqT4EiPNQZg2mgDnJ1j5wHdggcUcwa53R7lbClzdjhK6wHBnREg1LkDBo4PRy1
 isPo0PmZHo9qdZskdqslD0n6aoPgvTmgtCQjGzUocnxlCJqJyFbKBKUz6ELtJ57mbODIEbn3i
 kaVJ8H4GihDMX8i1T4ocUCz8NhJ75c2Z/KE1SY5aOfe28XWlGQjFyVywnXLR7aCzm5a9VMAcp
 X4qQhjkphHCp7jNCjww1vGQvmSLCwDQromHcrBu3VDb5ffw/NR5cQlVeKlIpWa20iDlaGj0l+
 W22/nuZ/neMH7WeE9F7iAYMCkGYLltdtti6Q/43L36kfvLGmDYTlAnwPm5fEU5e0v71RbSY7X
 PxBZ0THSDsETDoTP3E12qujB/l/vl5gcP/SsQ/PB99Pw4iZChCnKU9WshkPemduSejqQ//8Ro
 yDXCn0gUooSs7q0rQao4ooBnPxM7A6B9iNB82t38TYRKzCImIwv8z02Bm/2hYvrXOWjG3/gvk
 l8nU/4Meic7/GwQ6icRKsYWBXuYGBF9zTdGX5yWzdzP79l5Kt2iGjpA8By1m/99L46DqxxFVf
 wmQUxYfG3tp91ZZ3xtFR/TD7OcnAITj6m4pubGpY1YGYD8xPomY6ut/gPTVLhFNLE10sfpmP2
 8uAu20plckqk6yF1HpNGkEh9DpkDscb1/13GKtLW1oVF3DDGYLLg7847oZYtEsctACbG3B/Qg
 rIoLDbCQ/yoGzF6bkGrecyP1xpV7CYkBefzssCUkfQHl1B4GAGLjQmxbqWTiP52R3WLZ8+hpd
 KWY7w/HnkpyyUPx9bxJHx+g/qUaWGY7jPDNyJfZwUeaazcqOnSvamQNJ3T7dr2BmDkoOLAlCA
 sGCt9/QufC5rq5an+hXwgVxAWAYMbfvGXgjmWV28Qsv4VlG30fkHQ574XC5Zod2sXIt5tFlww
 20iRTnwRpCEuZb+ft+CccD9epPVt3ImA68txZrnox7H+wcIlDYTRauxnUd/n/wnboyBjd87wa
 c4xZC9UvaOYcXrKOSzJodxjhL5kg1rk2DIem/hTe0saOSBAjip8C8mr/1y32lL0S65iTMtjQd
 WGRVVudMb5I4Mzl4UiKQPqbec0p0qVMpdq8b2yBsoW5rQlraxm2N7bXQSrBARX2yIieb9zHiK
 MfXHEnjKL0UEQP+Se7uFfMDA1iTvO97TP3jCPwBnQGcTdd1jTybzLaIWcy4yuxMm3ul2WMTqd
 /OgOe6nHh8oV6E+t5ZQGfsZcIksF0FAPCV1KeclnIW8hTfxelQs4ejJ/1KTFG+wjmuCDZqE2/
 1kPcQ+HniZi83Xtf+0M1PIr/m4EyjZ8+pH25VuSVEVDryFp5U+O7n7Gc+5/7O01rcuSUCRcvJ
 eomWwFZQ1351NIiW23xjBLWJ4kTyAe5aYF8O2L+ibdmU0D2lcJ6If3GOd55tXOq6lnfm19MXs
 qVmzFdqKhZ8SsmX9ORvYoPOig0Z/S/WklaQ4nVSfo2kMcZl0fo97ArFnX+X8LEFDl7u9vUOyz
 EYIx6xNP+FkwB1Jzhmu4uCbjEFAN/mO43iKeNIKYNveWT9cRgPRIyCAroRLEAqryQeUv7hD8Q
 vZXOwR6how8SegvgDfs43Z+ocfGTRZWlGe5veen7cFhkF46l409Xf8hufwOFmLijtEO/Jq/y9
 K84/3Wv3/QAzpWYM0qq9FrR/t/+Kabn8Ap8IpZGY/HBUvDJy4EK/cru5qVsLlp/dSvWIsizRf
 nweHYNt5qR/xGhPogTAuSau+rslltnsOGlp3zK8CpCvHkJQP3mlXW5wl2JQTfRPy6jqCrISmo
 SsGxqx5uVe4iFVsnSkKN2a/B3ROriCRgQFASbRe3AGcgYUSwIvcBYzotur+V/XYfreZ5U+Ie5
 J+48YkmDIGAfhCZa2g4UymUyDu1CEaP50b7h5EvgsvwUQbOzBWPkWACjtDq2sRuuDQDnc/Kt1
 4IIxnYQ7NokK0EKSvUbHrNJGCmp4WQtYWRdb0Is0F8mWTl3wbbkgJALYq60syrj9oMZF6XBMg
 PoaBtDgqfKGQckXjRdBLrnKq5Pn2YiBBIfqefcnS5Ki5EjakDJl3H0t3nH+083CUVSwFPwfEA
 LzeHtgaJ8IDJ3/3MasdN1BGiicgl5Ke7WzB6d/Gkt83dH0SXV7xSoXh6e3kXarQ1o+KiLe4DM
 0K/hOfj4elXzig7BiJEq5Z5oN7O2Pc7ZH+H3jFASkiR7iOvUeFQJBi795BjvGHUiI+sp3vJ3f
 VYpvKqOPrDTluZJNIS30KCJHGI5t21Toz4icUZdCFZcT+Tks+0kWlU1ZRcVpXLjWOqP+cRAOK
 rhpQf/nEe2jtFGuqnRCx05+qAOKEp18K8/FY0FpBGSVAlk7hAcD//54+PA8SQyVaQdsO9gyhH
 qc8jFoYoadYoBkgC0VhhBrIXWqkKfTUS7/cR5DuO/KTXNTQ5AzTf4Vh8JKIp7uOouXh1kHdNH
 /tU3Rn26g0UjgXUwYdy+NywQlJlnN19bqUzWsgJQOdv2eZuhEb7xo36TnO9WIHqT01roy72WL
 gn+RmJkhPhcmGjMRczMPQGIjbvfBiCmpiXSt28/5+kJ54HsOMp5BEaLQ3W6ko74x/XHYIEwmO
 8jgJuw+vOEgXZ5t6zVX1DopP4vUwfWauaKai4w/oA4XTJEOM4kz8ef5SpR5uA4jCy5jajLdZm
 rRh+W3TasH4elAIN/7Xj1mbpdxkRxFg3+XJCrPcAt7My+jdzHhDXSQz0RTfjXCZVK9XB6tLkF
 eXOLycQ7H+/LWhvPIuoP1ebzDET0ZWybtdEXS+DziJIyTJnd9lvn8/WipyR3voK2L3MO8YRJ/
 uNabP3Nwr2ITHJHOkxmo71V92IQKbXrQPXyhafqg/KOlRbySaSlmTYGmwI+e6NHl8Ehe6QKdH
 gBQQkrri6f3For3f6/6NOiJ4XtKs5kdWzWg1Ox2wi/9Vd0MJXsD0FhoVx8A/rVmflPQEj1fPU
 nypmv/EJrf4E+Lgs3u6tp2OJxwAW8bCFLZNGyy7zspM169NMJk1CIvV2dr2Xn0oIXmSJeYfU8
 /yvmF61U42PGRObOSbOpLn8L/F7oDySDmgWuakkRFmTNbtxZMNYdR+G9ibR3jywnJT20aU1Sd
 BfrLlyRtZbU3lFL1t2zBedqqerkR/1sMtHIoOkuEobRUbhJCwwoB+ntssEXVt0ONA80gggsUM
 idLuG7khC3ZE556P1gVBPv5/DpHrjUUEUjdPlozqjvBVnp9C3Ylsvf8Xa8baxkito7+o5hdSN
 mnvhocp99Q96MZA1NrbLChUej/0EV0Zjy4I0ymomKjOUSZIO6d591Ii0gtsm9+K16ILtT8/ID
 0lHwhecBc8i02g9Be6Kvo6gSSipxAJtxicVeDCpvfEZE1wfmrfbPE1LQ7MycpNNzlwkY/bSjP
 AmclYASKqDrxQrg0vdgbP8IBH7syIiPP9up/E2QVtzodX2vUZNrsm/lcd+4Ul1TZor49w3xGc
 3KJCEq9Z4ozzwusltnvZ3PqGXqLn7JRPWiqEBGkAJhRQST2hWGPOdGNtKJPVVFpNYoLb90sIP
 3Zn/+99bIcJlVWONWjcDeXQJb/yaa2RvjxnIa/1hsup552heKN5PBwTKVbU1IfciKrkzBwpBx
 OZdKqGJdOuSPyIqSXVrh0p8hVCX9SrO8w2EwwSuZBQEajmPKUApHE3HGqag5Hl20F2CLXgb2Q
 zly4/Cq9fuGzLNQ7/0ewT3S7Ld4c90UO2eLXVwJAyvRET8XsnSRUOiHTCZ4+9iEadbXiqHE+W
 /ou7/BQCPzZyas5eizWXfeQjmQqlFbGxaQIytnT3vVEirl7NY+J/uB1D5OFbwhhG/dWVTH9RW
 bRxHEYPZnJiIO0kD+XOKUK7agjpgs8Z3pRsaVPngxZexSaDrlJDhiYQI+47bqPlZZXrb/qgN6
 Fbq5z0xCtvzzPyKSwxjTDdgtNJOTIQxO4U+qriDRJ27CtAv/nk2t09NOeTdXZiPQS60GiysN0
 vt7det9ozytfQvOjjvtzvAPxhNx+zTSfjW6+yc4CUhXOBJJ1y01oUeeXtSoP7ov1GQB7hDYn3
 sBZGDRhGu5VnvG7hDvDIL/EQjbqPHHxKeIADahUW113LhOpf9eYT3ujUuq1grF1ohyy7EiTKT
 02luSfCloTNeZWXATSZlpt1Lcr1GaDDNqNAdB3o+Hzgn4lOqo/nJfUhjjnebIt6395vLyGb4m
 SvPDiGlj88S7MD8OKoUGWxQP45kViH9oY4FlZV5wd57lEbvfS3PDDpH721q/YIoEyeWCS7zwY
 VpoXxA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.li; 
 s=s31663417; t=1778919164; x=1779523964; i=and@gmx.li;
 bh=LfR6KUiTLIUFsZPFBn7wnF1dY/UQgmJklpDGbb7zB6Y=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=tNZxc7iu3EoBs4PtkRsCoBy0xsyTvxzL7VGjQQvzH3HwKUdkqfEjvsKaM2WOTBzI
 5VIOcwt3UExQ6TGyD4Ogz9co7bgsEir5KqqDGBscSXmi6HaxoXn/qEn5kphQktoR2
 RQHfgTH0+qBf19POetXnnwNJc/RpyulKJHCne5/xDtuINv3Sig4ZUGh9iX0EH9vjS
 D72RwtatW5TUaGjLD/n8rkGyCchapFlr16bUhku0JHhyrQZHno2NeJt7otegLqvz3
 WfJ33ULWPp5z2U53QMOLANUGhHHu/g387yjlnL2qdMhiPBVqaW48ZbPb4EzZTxRnE
 GC2J7hqmExHbA8JvVA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.li
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.li header.i=and@gmx.li header.a=rsa-sha256
 header.s=s31663417 header.b=tNZxc7iu
Subject: [Buildroot] [PATCH v3 1/1] package/libargon2: conditionally
 shared/static lib build
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
From: Andreas Mohr via buildroot <buildroot@buildroot.org>
Reply-To: Andreas Mohr <and@gmx.li>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libargon2 build shared and static lib by default.

Add conditionally BR2_SHARED_LIBS and BR2_STATIC_LIBS support
and add version to pkg-config.

Signed-off-by: Andreas Mohr <and@gmx.li>
---
Changes in v3:
- add version to pkg-config
Changes in v2:
- add conditionally shared lib build
---
 package/libargon2/Config.in    | 5 -----
 package/libargon2/libargon2.mk | 7 +++++++
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/libargon2/Config.in b/package/libargon2/Config.in
index 6bba74cfb2..73c1e0d777 100644
--- a/package/libargon2/Config.in
+++ b/package/libargon2/Config.in
@@ -1,12 +1,7 @@
 config BR2_PACKAGE_LIBARGON2
 	bool "libargon2"
 	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
 	help
 	  A modern password hashing algorithm
 
 	  https://password-hashing.net/#argon2
-
-comment "libargon needs a toolchain w/ dynamic library"
-	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS
diff --git a/package/libargon2/libargon2.mk b/package/libargon2/libargon2.mk
index b3f6e1b216..e968aa08a3 100644
--- a/package/libargon2/libargon2.mk
+++ b/package/libargon2/libargon2.mk
@@ -11,6 +11,7 @@ LIBARGON2_LICENSE_FILES = LICENSE
 LIBARGON2_INSTALL_STAGING = YES
 
 LIBARGON2_OPTS = LIBRARY_REL=lib
+LIBARGON2_OPTS += ARGON2_VERSION=$(LIBARGON2_VERSION)
 
 # GCC_TARGET_ARCH is not defined for all architectures, but libargon2
 # only uses it to detect if some x86 optimizations can be used, and
@@ -23,6 +24,12 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
 LIBARGON2_OPTS += NO_THREADS=1
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+LIBARGON2_OPTS += LIB_SH= LINKED_LIB_SH=
+else ifeq ($(BR2_SHARED_LIBS),y)
+LIBARGON2_OPTS += LIB_ST=
+endif
+
 define LIBARGON2_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
 		$(LIBARGON2_OPTS)
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
