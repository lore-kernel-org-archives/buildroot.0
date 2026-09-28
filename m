Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A5C5CA5FA2
	for <buildroot@archiver.kernel.org>; Mon, 28 Sep 2026 19:38:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A51228098B;
	Mon, 28 Sep 2026 19:38:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Q2BdsK5GGCI; Mon, 28 Sep 2026 19:38:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AEB42809BD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=3; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790624326;
	b=srhgohnxy4jvLnbFmysVqIFbam+m1g8DYx7zwRJF6jH7TjHdZ2e/EOH5Vsuqft7uY5fG
	 NNpdTaGD25TEevTjDZ4+dnhFXr5GyXmBMbyfEVxE6ZCraIWjkHH+OJuHOkl1i/uA0wlLL
	 kz8oyutCFnGKZVmSy5r4JrCI6MQbUd2sMvHSJ2ryBbmWIv9Al7OZ/5oE4rEz7eHruTxkg
	 zrTffPSiVA0q5oA1299H9/kB+4MZRUOKL2CCQGvjNJi5n7Oa/JkiuypgrRqtpb9OH48P+
	 J6q6JsmTMjQd/jS4b2NFEEkOyCzWtHzKGnpHy1o7TJZ/jjSrMGVCNlQhon2DQcB88bg==
ARC-Message-Signature: i=3; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790624326;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:MIME-Version:References:In-Reply-To:Date:
	 X-Gm-Features:Message-ID:To:Cc:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Type:Errors-To:Sender;
	bh=fpt5GlT1CmL8S7UhMMHnEftZ0vMkm1w7K9lw3R1aucM=;
	b=C/7bJTXd0Rc4blKw4L2W8pFjmkAlRVNttzZ8FRNJGjVa2zforRnpI/6hQ9EjwjRD0wVn
	 MX8rbnhWBCHihoslAQyus4G1pBq0T48d8N3BtbpbJA8HCeYArSzZRivAgg3R5x60VMfZL
	 AtGgxp1uR3rTHuRmMdi2Q7xUsoyxO8gW3yKKfDpzfo60qNhrur2kCZZw9ncb7ruEEkhsB
	 T7MVZfiA14WEprlSi+jaHjDmgLkGnifLXV6NjIdQ5H+wdQ2edooZD+yficDnBGre4dIAI
	 oJ50hSF7ZYQsJdu7r01vhfHRa/kLzQ30W1jhMzXscPPvZf2DiGu8lxqtwBLFRM3W3aA==
ARC-Authentication-Results: i=3; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790624326;
	bh=fpt5GlT1CmL8S7UhMMHnEftZ0vMkm1w7K9lw3R1aucM=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Ap21xFnUwMfGQLYBkF/XTVLt5LofiYfkk4HtkNh8F7bWrWrPsJEyiIfD8A+cxzGak
	 OdJ1PLZHXcZiFB5B2j29wxy75yEl9wAnZ3udvioN+8TXE9pieBiF7UnCGByP6qM1YS
	 J7EZsWXVA7T8qMXL+H6Z1UuH5qAKH4Yoo1aYJyqHYl05V1NqVEya2cpRQviwO5DbMb
	 eMy/fxvQmh2rGq3VgUxCk+9sa9hvF9RjnwvgM4S9f/Ulu+D2A+XYQXN9FkT3G5clVU
	 8HP5Gxg0ONsvsdpsoICFVfwUkbFDnQfxZcKpbF8hxANUtJulrsqh+SNH3P/LroOEX2
	 IflfvFSJRQpJA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AEB42809BD;
	Mon, 28 Sep 2026 19:38:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 702B6147
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 19:38:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55522401E1
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 19:38:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZpaykU_Ax92q for <buildroot@buildroot.org>;
 Mon, 28 Sep 2026 19:38:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org E43C3400B4
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=pass; t=1790624324;
 b=LLARcotHuWsF5UM7TF+RtWh19Eqt6pjKzNVk0yRH73zLBJEzGwsRxr/GaInrRVeoN0XP
 B3x6A62VNy4YvVEYfzyer+h7Cu2Ul71A9PVNTO0uFap4l+pXE+LyJHvBeXwU/kxi9VmH7
 vJUyqxAcwgTEuB5UPoe3Tzh3bM1Pt6Q4pq68IaHFtmenUCTDz9DKGfS51EgevGiwwlHrK
 +sK4k+ogGXxiQcFRkrleyDqy9JmRy7MSldOhiHnXHQwLTKsXgykKVyRN30FtYk09aWBag
 95DpJAoZoD9LXTez+/9v8OYuyvaudo6kb7z6jRlVWjiGyV+qNf4l/K7r/FgxOt8nQLA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790624324;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
 Message-ID:Subject:To:Cc:Content-Type;
 bh=63mbgPzRaKgx/8pMZlVnMoE/aBgVHuzo5YKwkwWq7lc=;
 b=WbD2pQ+Kj3NbQsBmgQWYu/A9z/utWaVaLcIZo1CLlW4OIiTFe4BItlRzmp8ggf6cXS4C
 HBrzYdqZHOTtVYOvgVTIjW1WT3XBCg4+yfVWgdYzm1qg1S6CHanGaob1JKwTs6j2vAvCQ
 j5ArMyG+I8tUXUQhfyOG3UgAQ2kjgOPnLj77A+oV4Q+P03wfbb0ZiM2X2O+c+2d7tNai3
 COaa1Rzw//ztzlI1f3GqEKwuvW/KywasbhGZwFBkb3pLpC69YSEmNpvHLfauH6umSf1NL
 iM5icR5vpQ852K9PWNMAzmtGpvPbEPxV72X82jFzN3Qke4+zfPvRw6z9Y/YqfY07Htw==
ARC-Authentication-Results: i=2; smtp2.osuosl.org;
 dmarc=pass header.from=outrider.ai; 
 dkim=pass header.d=outrider.ai header.i=@outrider.ai header.a=rsa-sha256
 header.s=google header.b="a/5X2Q19"; 
 arc=pass header.oldest-pass=0 smtp.remote-ip="2607:f8b0:4864:39::c"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2607:f8b0:4864:39::c;
 helo=mail-pj2-x0c.google.com; envelope-from=jkoch@outrider.ai;
 receiver=<UNKNOWN> 
Received: from mail-pj2-x0c.google.com (mail-pj2-x0c.google.com
 [IPv6:2607:f8b0:4864:39::c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E43C3400B4
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 19:38:42 +0000 (UTC)
Received: by mail-pj2-x0c.google.com with SMTP id
 98e67ed59e1d1-3a0d2c37b0bso1143094a91.0
 for <buildroot@buildroot.org>; Mon, 28 Sep 2026 12:38:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790624322; cv=none;
 d=google.com; s=arc-20260327;
 b=mfSuRMtwfBRCfbIdpf/7hwv8MROS8qrCiYXNBwwX1W2LRsjx1mHeXicoAvWFV29+Af
 /Q2h7fjVDvnbBEo3cvjnYM8PhJJqmvH8EvQ/P7BSerICITWrMB5xZz3yPp5I8hz4WZVW
 YvjEd+6zpml7PKIuC8Hj7vcRSMkrhLt8BRvDenF9it4c6zinjTFC4YQ/SYymwXNQatjJ
 gfI02LGYwaX4aEuwxvt6WGylfyg5YOhk5sPhFSpBxpgqdIBrPT6E4nYlFK+KvlrDZ2dr
 oNZx4PwuWGgfb5vBeyaGDHJGcol+VMt+MlU+n0XyGh3T+bsx4d14cfZ1Di0wbN7XnKyO
 U+2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=63mbgPzRaKgx/8pMZlVnMoE/aBgVHuzo5YKwkwWq7lc=;
 fh=r1d3x9Gm1eTjQoTskXpUnkKo6Oo5rO19wtwPdAEWb1Q=;
 b=joEtH09IpaDFLynm5JYn7KynGLpMHMbTWI8A6pSwaR4KOWn3ukzndjFz0IJg2Xlx43
 OlZav3uJx7ohIKZ2+JPJwOb9AW1Q7EKPQQ5rfWklMVruP1oTLD1M1rmv8GbfTSIbSZr6
 JMzHHgyPOMIGYgQS4UzC/Y+ajASfpiAnoLNavggIr5RUnl2vn61vAvlwRmFp2yJN4HMW
 IHwA9HktMwuintpMmXi31bQ5ls1emjA6MD7NISU3F26eY8VnFZ1cpWFvHQYoVjqaKkWB
 XFwiy0wj7JMg3f3tuOrsllm+prhYWRC+mhio/I3iM6atnbWeGUpIWhL5gQDPRr+0rnkU
 Wb+w==; darn=buildroot.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790624322; x=1791229122;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=63mbgPzRaKgx/8pMZlVnMoE/aBgVHuzo5YKwkwWq7lc=;
 b=QLC1AovD6zd+O0a1auekzcy45iHfpo9iVapSjqwpoxoVFjC6HWVtk4bSURZLKcut56
 hAVzE2dIA4x0ctMpYDSgrkDHsYsumWA7B8jRm/Z0IqbSnSysAhsifKBHKCvWsKFAMIeP
 MzqiXAbFn7qkGB6wBP/3V7LasArx6zXD0YS8LRism8382lQ9LiOj4Eu+NooIS6EaHvW6
 2y5rHMXz7lQWffl2lHCiQc124zCd/+1Hz+S1maDokMbBuc0c3crkRrksUieVfZNKD6dI
 oqyJae/A32NLwFIgzcSqTpKKsPlcQDUxa/UYuwEf/g0fKJCGqDcw9t//cD2G1jHwkd5y
 yDFA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwLjyoy2rmpB/+a/fWAqB4oMesRl7q9HXO2eHq0HKvXCNBwPzELoU/erZ6d1Lp85fQEhPzStq/qIIM=@buildroot.org
X-Gm-Message-State: AFq9FYKdY4hL9zYqhFwnvZbOh4rKac1bDZvt4mccsavE12jZkZPtuJcT
 vnoFEQXhs3/v02rEv0Da/g6hq/hNmIYJW6GSF9RnMwc58KQb9Gof40/BDFuKW0r8iiTaaZj9HCB
 EUWv/jpIQNRUSrLnRGtXKnTj++2qP1nU/7Q1zczLZwC8oKAbJ71b5Xll7
X-Gm-Gg: AYBFou3r7yd7iymu80FUdGaWSHueo0Ha+ey4vxAgAScelsNl3A1ByOpU6kr67+i4c9Z
 /kNg4f5eilgNke96J+N0XeI0MGRnySlRvwiXZcAfjYjZuiy719gRDLQae26aG3vP8ctBlm95c88
 97BCqhz4MmspR1to4pMBOf5c8bV4KxANpP+chnHVcyJMhjHu+9e/9OJO55uaeQXfG/c/OoZRKAk
 rWiAynub20bS2sKTNKeDt7azUugwr0hXDuvQ1TlmqT05R8/Bwl0RPDHMTUjcqG01N32TaT3cpuW
 0psqBnPATBglB6UNnaWvZB2UVGo2R6j9Y09iLtwyuhpye39IWh8=
X-Received: by 2002:a17:90a:1149:b0:3a0:a912:e777 with SMTP id
 98e67ed59e1d1-3a0a912eb4bmr6507560a91.66.1790624321569; Mon, 28 Sep 2026
 12:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260902195708.2168193-1-j@j-ernberg.se>
 <CAMQGCcjXAx56Jtk31ArAZJyPxc=cXU48KyrzObu-p-F19agEpQ@mail.gmail.com>
 <PH1P110MB1603534783B4E17496D192219FB1A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
 <CAMQGCch9MS-piL46iV09KS=OfTRgWaXUMqHDA0mcWEso2NX6Bw@mail.gmail.com>
 <PH1P110MB1603E9C686228F68DBA684C49F8DA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
In-Reply-To: <PH1P110MB1603E9C686228F68DBA684C49F8DA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Date: Mon, 28 Sep 2026 13:38:30 -0600
X-Gm-Features: AclHuK8FlExsYY3utIexNoCZmkb14C9mSQoFbtWfzGuVqsDZWIDc4uOTJDtu4fE
Message-ID: <CAMQGCci8VVyHS06578R+KP=m=t-fUe+7hgmgo5Gkomp-QYjuhw@mail.gmail.com>
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: "j@j-ernberg.se" <j@j-ernberg.se>, Adam Ford <aford173@gmail.com>, 
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Zach Vargas <zvargas@xes-inc.com>, 
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Subject: Re: [Buildroot] Updating nvidia-driver package
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
From: John Koch via buildroot <buildroot@buildroot.org>
Reply-To: John Koch <jkoch@outrider.ai>
Content-Type: multipart/mixed; boundary="===============2267776820368949320=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2267776820368949320==
Content-Type: multipart/alternative; boundary="0000000000009d1a65065c90367b"

--0000000000009d1a65065c90367b
Content-Type: text/plain; charset="UTF-8"

I spent some time splitting the changes into smaller, easier-to-review
commits. This is currently based on 2025.02.18. I compiled it using newer
and older Buildroot releases and Linux kernel versions as well. Happy to
make any changes or receive feedback.

https://gitlab.com/kochjr/buildroot/-/commits/feat/update-nvidia-driver?ref_type=heads

-John

--0000000000009d1a65065c90367b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I spent some time splitting the changes into smaller, easi=
er-to-review commits. This is currently based on 2025.02.18. I compiled it =
using newer and older Buildroot releases and Linux kernel versions as well.=
 Happy to make any changes or receive feedback.<div><br></div><div><a href=
=3D"https://gitlab.com/kochjr/buildroot/-/commits/feat/update-nvidia-driver=
?ref_type=3Dheads">https://gitlab.com/kochjr/buildroot/-/commits/feat/updat=
e-nvidia-driver?ref_type=3Dheads</a></div><div><br></div><div>-John</div></=
div>

--0000000000009d1a65065c90367b--

--===============2267776820368949320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2267776820368949320==--
