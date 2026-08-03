Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10701C55182
	for <buildroot@archiver.kernel.org>; Mon,  3 Aug 2026 23:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BB5780BED;
	Mon,  3 Aug 2026 23:14:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SYC3mnxONNDl; Mon,  3 Aug 2026 23:14:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88AD180BF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785798848;
	bh=arnyDVyb21vDopcBizWsla6Dn9lXVGYUTwpq5+RQn7o=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=g4xiID5t5ECvm7ST/+I4kOdFGykCwro5fYakyUUuOyt940uFKbqQ90qTndRnqd4MA
	 wLUYBwHIWBmh/aTf+/+c2QekgZyKvKmk+LeoG+jaVwe+VgHV9qpscKRjpDWkbhjZ9s
	 ypyfV3B5P/byzvIJiI3CmtpXCC/vy6gKnq2w83Yd+Oh87g5cdnarCe8hAmR6H/aMgD
	 NXqM5ktl9fkuDURB4mDhLD1iELlItY1uW5sr2jTt52MBrkS6h+31ItWOXonH7p4c5i
	 mum8SqWlPnLghtptqQfoABOWrzX9ymxVbK3ZmXdrZUEaSFQyQBFAEbcR4OYcoC97OJ
	 NOOqJ6Lr3od8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88AD180BF5;
	Mon,  3 Aug 2026 23:14:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CEB6123F
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 23:14:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4962606AE
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 23:14:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oAnvCg4UwWa0 for <buildroot@buildroot.org>;
 Mon,  3 Aug 2026 23:14:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 844FB606A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 844FB606A8
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 844FB606A8
 for <buildroot@buildroot.org>; Mon,  3 Aug 2026 23:14:02 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MI5UD-1wfC8t2PvL-005ldO; Tue, 04
 Aug 2026 01:14:00 +0200
Message-ID: <fda65c4f-1ad7-4381-8e07-592ad61d2665@gmx.de>
Date: Tue, 4 Aug 2026 01:13:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20260726092508.48248-1-bernd@kuhls.net>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260726092508.48248-1-bernd@kuhls.net>
X-Provags-ID: V03:K1:GCyfG2yvqgU3OzEmUZTLCSW1emYZHcyhRTzTAZ4uliIR37OmmFz
 GakKQtax0o2nvlvAs6Rw76jypiEzUPpM0Nz3eWhNWudwvcjWaY75nthROpTpr85Xtgeu9wl
 3hUAWAXw0RYRJ20aVL7WOSbjHKJ2ztHrmX9MU+XjQHySYQgCYE0lSKFU9BB4I9eN3zgrMFy
 zqdCBkIJkWBV4dRqTDJgg==
UI-OutboundReport: notjunk:1;M01:P0:w9/q+XbAWag=;UTiUeRh38T102obwLnonT1U5udB
 KRLJkNd1UXPZsEjHPwVPFiZRVMcc9KccABapOUMQ39EZaMqFcHwxC01lAmIh0zXr4sO88o1yS
 99uRftXBmMA38TvqYCjF0vuIXZ7QVed1gREQDLvn4tSkzvrb6rlxZEuyK0kgOfYHADnErcHfT
 HH9GFKR1CGYsIDzq3EqK4quk2R5vC3jdAfCy+FJho3VwazO278iQrLehz3fxYtb14Q5vBaDql
 d1hxWv9nM/Uw2DhGHT6AVOin2G6mzI9A0iPYF3RV5+bVzyGDLdPvS86lRlwJ1dXSovlGyjMdJ
 WXbTsyHxBSWXrd1c/FKLqQiyT+WA8AbdxqKv5ux3CRADEoxLSgUBvzbrzDUA//lMGTT3ljs4g
 qNRgHs2LZsuiVxjKzTUt/BeTQnbKwQny1S43z0owuZ2PnmLL812SBgmlv2y6156uxEKZWlelJ
 y8wO7P88uBhK8+cD1cZ/9cQsStJY6sKTwmCKjjGkPKDifCPZxpru1CewH8L4tSNDERIkiTxoX
 x6CaAlgf2drI9dZnz/FWhtGCXgD/9Vbf7EwV+vDkvxlxXvHWZH2R4IqkGg/yrq8kxRVnZUn75
 BuUP8JPaCOqrtcM9jLvbz8In2JFXh42mKOB7cWJTavZs7vbyZ4ttdiaT58dmHTxSIx/IFWZIw
 a26pN73mENlOy8DlZMO1WMuvhyDXO31ppeWO2VQ2J80CKYVl2bfgj9HOGLTHgGj6ZXMc1lV7K
 BVm89ki6EGYMBWInMzpHS93dwpboe9iu4z17vUoe/ukPwQt6a6saMjy1BOUqnognODOIgGPlt
 eAKoDk7fXnRGJcgnQve3dALa66kd9YZBTCi3oWjjjSU6/YfLqtRiVLR7bFU0lA5Q/l9voMjj2
 mQjfQLCtYbS2uMVhl097ToEpWCQEDRJsL0ykweMgYmxBaC0f+S/GJxUIhfSTYdZCuPXSQ5ljl
 h7SakpTNAlR00tY8uhbebnzazTQWeJOmSS8L9/iWOZBR9jD3awFvVQV5k5oxzclxWyGDQeqIr
 BKRo6HgF6jXAZ0f6Uny2OiiTDeA0/N0o2bYRR6qV5kfw7M0BPkB2qSDu/iARMSY7tUv/oG1Lf
 UXB02LKz+/8tpoaINLbVdB5HYtIgJIeuivvlhX39B5TpUa5qEqo8UuaMGADTEab5pRlQg7ixf
 bsWwJH3c8MnJpCFymgbKVrJ9L/iKPHgUPQe66jy5tGjVYkWlleLSupm6gI6/1dxwbhK9COdFM
 KyGAuGxW5sHlf70H7nNxPB1apKcRsCMVCLIgIrJ0LCHKKbnZAlUjBic4mSUunUu3f4vmr5way
 ooc9cq/U37yZwYtoaCkQklfIPKNCeWiATTgMwhFFG2dD0AxERs4IoOEnXT3ifSAisS2CfeAEU
 +1zwWspqmCn8IKDhER4ZnVYKevSrtFmoddIHTYee+bOIFD8lL5KXGIbuexLBByYb7Jw52US2J
 gzSbF7iJn++Wbni9TeaP41hGbNgErsaClkRAajMIh59YvyW8omcQDI7vmxa0xO0ybm2gxRD8v
 PpV4tQIx45xBtVjWPfDczk98g15cCMGKZnn+JHTsn3G+cNtspRangdElIczJ5ok4zryFhOyaw
 Y9XlJUrnRy2BkRhdjBqSkGuj55nUkG4zojVvsi9AtwBCSMslq06ynpLM9qOYvaTYrziqCnicM
 /OS8MJQWDoBmuet6dy6wy3ftPyaK21tGyOm0VBleppltKi26XnSU01KoRW5/bv7K1PRADDpef
 ZdLQbNXNWduB5b7X8TYxwn4GK7SxZXxyd4Ow5i75fBpc++gvPnJd83YwJd2yP2JQw96++DLw6
 0d+LUNHK7y7NqTVlaRpQq++FQBFeIg8jm6AUmr94imnF1tezoJrPqukv6aUSousW+99IN0UOC
 G8OZaasqxGVlV7JGe/YWA2+4ptMb6J2/QivsORanWS0mERVGTpiDw0vZyli4qJt1MPOBR+jdb
 uMhyang7pv4pIfohtQV0TEc0WVssl5Z3P33jwTj4/iOorIbt90kdFzl2WHLHXNk92bdiQifnl
 Or0tgLXtJigISCkdtLg6TvW7Ol2/vm/z3FLxP5uOOF2xCfYjvUGib+2rkBqqAc35YxgBMEagS
 HAqGvnRiX/OjKR02suheUERmwlH5cVtwgN4K3U8P1M6HKQAeZ9KOUbnwpgpIMcWwqgD56BVf1
 ACOmxKPcdrnKC1uthL5r1VWltc903uSxf2ceLRoEQhtC4HKdBCMlts1+0IBPU/66pXvbcoKe3
 VtJqMB+0WXKIeu2DW9EJ64EczdbHmXWc7rLOrbFGiRgYvVtcMhxpVEmEdyyHovR9uTySTLBl8
 suVg7ZHnWiF0wAjx1r2GtC+hcXfD5mg7lLa37DsvpgNTL2igxqHoCK+Ze/tRtPf9WGRNizvYK
 5JDOYkI3lX1QXOne7xv3IoYim5nQU/xHp8q3JuVdD9eO89mx0sQm2CW3um7Xiytu1KpKSEp55
 Zw4btH8hS96LgdiRkyGeNkeexM3p2xmu1ZansqMHuzT7lmZtS6JQIkPOSyEq1Funa1ZDKYaDY
 x0aqia55QLpxrw1Bk0uZa5kd+DKqa7Uwj0p+UkIMzK5C6Gov6tr+lBKLKirIohMMi3cAMKexT
 ZTqZaAxgk1TeaKGnsmMHWBt+TaFhZf88Q4b3ENpqyLlFDJd64MWgEjm64Hd2eIfY0ZtkgoZ+o
 2q1bKEELyJB9G/OFgTYfbjyj1oDtgg100J41ZwGasSo+8ufVcOav94ysOYPLuqTJP9W+xlqIC
 8vzQ1MQ8bFoyCWHaHJuFHayTN7NqNyUI/FEwvjqosGq4eRWbNY7h1nRsn9SJz7I7dbbG0UILo
 I/tBnsaJZkERZczIOnUcGjQvs0Kz3ap5dhePw54nC+u6BQO9aOVO5KmPz+MtfQ8JmwT9vZer1
 LQ1b2e61/6tDTN2ZmlDRvR05eSzUaSzd9sqZp777Yuhqjuw/mRsqWOIDttd/h7VHw+ZJwVUr8
 9qCDZ+/bLtqXUTeTtgoGemtJDobNhtyyOMSwg26ztcAgiy1N9NolPZCV0d8daZtPfm1fIW4AZ
 8KIVKpuJnLZEMogQlhF2ytq+6LQmNOMa2ygu13A7ClDlYALUkIFwG8Yd0SRJhWosgRX/ZXqGV
 /Q+pJfqQIIJC7CEevVG5fiFC3oI4R9q3oykHyHVfAhdTV8482RuHCryzNujJ7a7xLYyYNU8wP
 7vL+Ur6ddx/CcZleJeNkumLtzRGagdDGe2CrDNpy04XiiRtqXkfzQ3R2CY8/0XKAm/N4xwjLB
 2+7n802WBA6EOjroIuRWisfJaKKqqThP6sj777ITOWCEVNB/Bhy5enBhiavlWeAWD0SkzLoRr
 VbjWjwg9tq6ihSxpUUkIlr+JV+pKqqWdFtN5mPBE6X7MOr4iStRRog8NUu+nPopPTFhuOB6bD
 h2Wu+M/zmgJvH/1XGvNKuOJSIcZUu1fFjI8y6Vv4Wiw4Pn1TPR4wr+lP+IBU3yuO3ZwCY1Tbn
 te+/VB9DLrP7vKn5tGVYcHgIfy+GiWKYOfG22NixG116Sn1JiUP6wYi1KqoSu1N1nb5lMHtSD
 rV1HVwximawkzYcryeCzbI2l6jXRwTMdUZQNylhCbRdtQRsCFmXxRRAsWb8LFYAWLFqI6nBYM
 dUPSEX+SQ0K5BRu31O8PAPe7qB03apSPHr5WwxaVsPSvZA2naKmz6cciCewDsmj59AWy3i+kk
 0fHg2Q+XmamDAZjgEj+07HixoDV6C8PhEUBXHAYT2t7pnNwtX+weh84sqsLsQKzRRvmzuW4lN
 8IqUETKZdcc/NjyFhTBOJNu4DGDBLFoyYYJ4Sb0dXTPkSkSTwf95ENQe+UgOxFqPgzaaJ7i1t
 qrq9N/v4OBDomkwa+/nO7O5ugbXom2cCUZfhsSGuoLCi1ksiuLim6X8u+KP3XPiwJP0GIloAB
 2KphSE2adE0x6xnISzAyKGhg/CYUL6aXpbDxv1LBFKLWWS4jHvkX3dvzTXu+yfGKvTUyTcw9i
 2dez3sxCtJGgEq4mQZgvXZsqm9nvvNwxnQlUIQ/rtJh1pofqFfbp86PSYextT/F1zH/78fQKi
 3aOm4fSjJFrdgkELDe8nHl26CFTsbp+dsa8fTWQnZFDhSL86DeGFViyfvV0HGEcBM7ZwkG1zg
 Hp8+Xw/yNVeHaQoZhSOoX5+cQR6XuTexQ5+5CmOdUTtsydXhtKeWj6pghr3gHptzE/eb5W7ag
 BCYeS7eL7CZ0oVsRAOfCqHyfu6Cx+5sNmH7MtKOpbHNXHhrF/QK9EL3AJ6NULeefB817YM7OC
 o07rfNR1h9DT1EFSOYll4xWGW96pLdDNPoaYGMvkSOMu9/NtirzvWW9V7q/6kwF1U1pkNe3TL
 CsWHohbdVMCPKJErLT5LbNDD40tfXFOuMvlg/jFwYbiCK2iebiCoGd6JG0nqOwy3JT6Oed2tS
 bk3BOOrB8Owp1dK2UY5pHu+JbP43Z9SdSWaUyZo9EZedSlEd+WqTaQ9iG3UqK4TYTx4otq3M6
 6YlfitI4NH30Z2Fn9xxFuxQ8pA+CSMjUUbSbE+PWgHF7P36IYwun80fpST9Zz5vn3q9HtNCHg
 mW6asGS5c01gO8p8HrVDuNv74av22eYk9m7rK3vCWVu0JeJWOzNYie1BmHef9n4lWeO3qzVLn
 dmvfPV8CMnek00HIT0+uvLRXU4chgMxkvxtayCaFgYdEIIkJx4S9wvRt6LyK8DrRz8Ma7EnDO
 ylNzTyZaP9Dr4TappjRAJPA/5YQf50mHPT5s3cy77xbukb+mdk5KUVlMlUSvVd022OIv89URm
 IKAdQogpJNc0iFuTdIEbYwDXiYSgojz4mT9c2j8KP7653vvgeycjMIk7fX1r1zxW1zJjsGt1M
 h4mzH3i7SkJZ7p23uF26yNsWZ03f6qEAZj6BTFBma8mW8AVHP2klR5DkagaZng6UVQ3WKqrQd
 Rt/NthOGm121S/Vb0Z50kAyac42uKpoVDFzKeTluNDzTogOm+1c7zqgoM2KYkc1M+1rAZkw6A
 y0z9zFW9mrKsNGu+6BOF0W3f+yG9PWN21Yr1QCMt0DnPwQ5WU0D5PnHq0IccJ7ikdyzw3Tgcs
 nMnuEmrHMh19kUYeW3A4GdqG2ov4jw84XrCHn7nJ/yQS9vEk4A0NHcmSUxz0zjCZhLBXWx/VL
 VZTI2ZQvgLw3Y3BZzYKGTXekR7F1whY3SXikGN/5acN1homDb3COtM3FlHLNPzzdGQvOFZSVq
 DrSOREjOiOxN0PD4+gVY6agSvpibcuF4viuazAKMYPsqYy1Mr0Xv+npXFezZTv6d2jGErMAaw
 MB++Y9J+pt32J412geVgD1gotpDQVDYmVVtfI8pKHFXy0LZc0iczlhdAmfyqwaILp2GHDAwdK
 in1JbK8g8bh/Repc5TnmeV4bTQ6ZaC/qn+ZYFtL4fstalYDJb3G4/1dE6ryK00lvUNyUUsHt0
 +MwOHgo7XgftG83H8CIQX1N5mPVkpo1lclIyjHVpFU7c4Rki2ibMbX8PdiBsid+zPw8hXj0jm
 ybWfI2lBkOqC6ZQnVccjma4NjgpJR0bHKFSWsKN/KLdMzlaBv0VmPveuOnJqO1FhT9OHoG1TI
 JjRvvG2sMoF9O2y2yhBVh0KTWiNQIRPEvVj5iXYuDeOzsK+7R5AHBZh2ryUPSi3adSvzrOwa5
 PaYE4rjUWKTyEpNkiW5qaV8Z5eTWRTGayJwYr7hgBtwWuxavcRBOjgoje+Utp+/fiuWvZfrha
 C2lPTBNuMdab2IiKMSKswy4eC4/Olv97VhMrwCbjC+2BclNP7Tgaub3nJyIwKKSaIuKEAkm5E
 t922yyUkah/QM7ZyVusU+yz8hALe0nG5LXMCgHHdxqY+cNPBqVDt+hj0LVE5rbiLS2c0/nVvG
 GrZqURT4MK1KlxDRJrt47DvJ3cejsYDRi/PKRKzr+1mWYpCCbLqhlpqO2DXLbfKFc/6wlD25q
 IP1O5pjmAjj+hytLmV5BBVXcQXds3xyuysa/yyERkdwlWYZo4FlZIfawhycRkYD4C0i1vuVOd
 aJyoDErArJvy5tDN2yeDWJw0UaLnj45yFrhvvlofBpDHbjHLpAz9O/3Gdm4rwAeaomDeSQy7Y
 phf94IA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1785798840; x=1786403640; i=fiona.klute@gmx.de;
 bh=HX/96wRe80OS9P7iNhRWLHoK0Pu8hntLtGnsWcJV3tg=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=Urg+dmdVhfMVJBwzqkdRXNjCEoJNX4SosiO0m5reej72ovaIo9g1KhXdqLm6MPWX
 vlo5Ul7QOebIWMGCeuA9t87bixDxu725Cq7XLJaACozAPJSMIN8od6+gracX7pWv6
 NQ6yJ9aYORwJdpY0SsnzE1lC5UxZEDyD0i/Gmvc8QNQsmINnn50XsXXBW9zHKePAL
 Yn3lVsDB6XghqMKNpJZQrDszVRQCAdY1HNMBmNRVKyzF1V/JjAX09RpnGusafeoQi
 NpcVmmYZeNm5RgWUraXSve0u+jdPgu90ALVranFlXzf7W2jA1i89oVhzS4ewsm0qs
 SaVNHt3N9lPDvIil2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=Urg+dmdV
Subject: Re: [Buildroot] [PATCH 1/1] package/gobject-introspection: bump
 version to 1.86.0
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

Am 26.07.26 um 11:25 schrieb Bernd Kuhls:
> https://download.gnome.org/sources/gobject-introspection/1.86/gobject-introspection-1.86.0.news
> 
> The hash for giscanner/scannerlexer.l changed due to small code
> additions.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Accepted into master, thank you! FYI, I have added a link to the 
upstream commit that changed giscanner/scannerlexer.l to the commit message.

Best regards,
Fiona

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/ada2907a0bb320453854d2c0abd66facc41e0ffd
> 
>   package/gobject-introspection/gobject-introspection.hash | 6 +++---
>   package/gobject-introspection/gobject-introspection.mk   | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/gobject-introspection/gobject-introspection.hash b/package/gobject-introspection/gobject-introspection.hash
> index 044216c65f..866b12c5ee 100644
> --- a/package/gobject-introspection/gobject-introspection.hash
> +++ b/package/gobject-introspection/gobject-introspection.hash
> @@ -1,5 +1,5 @@
> -# From https://download.gnome.org/sources/gobject-introspection/1.84/gobject-introspection-1.84.0.sha256sum
> -sha256  945b57da7ec262e5c266b89e091d14be800cc424277d82a02872b7d794a84779  gobject-introspection-1.84.0.tar.xz
> +# From https://download.gnome.org/sources/gobject-introspection/1.86/gobject-introspection-1.86.0.sha256sum
> +sha256  920d1a3fcedeadc32acff95c2e203b319039dd4b4a08dd1a2dfd283d19c0b9ae  gobject-introspection-1.86.0.tar.xz
>   sha256  faa2e414bd5f91d2d2c39e85c7cc3f2ccde05c3306f96b404f8ed8cf0266c279  COPYING.LGPL
>   sha256  4c1cedcbb4a12ea964f1160dbbf36099e5a59b96129a99a1a1a61f2cb09271fb  COPYING.GPL
> -sha256  60cf20b6532aa2f5622f753a55672630b789c04174acca361033e6f1ad29f8ab  giscanner/scannerlexer.l
> +sha256  2596a580b8be710642b734a4ef459b9593db5f148b204a9ce65415e2db4fc87f  giscanner/scannerlexer.l
> diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
> index dbf0ee3fa8..0e8bf11954 100644
> --- a/package/gobject-introspection/gobject-introspection.mk
> +++ b/package/gobject-introspection/gobject-introspection.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.84
> +GOBJECT_INTROSPECTION_VERSION_MAJOR = 1.86
>   GOBJECT_INTROSPECTION_VERSION = $(GOBJECT_INTROSPECTION_VERSION_MAJOR).0
>   GOBJECT_INTROSPECTION_SITE = https://download.gnome.org/sources/gobject-introspection/$(GOBJECT_INTROSPECTION_VERSION_MAJOR)
>   GOBJECT_INTROSPECTION_SOURCE = gobject-introspection-$(GOBJECT_INTROSPECTION_VERSION).tar.xz

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
