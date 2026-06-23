Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13419CDB466
	for <buildroot@archiver.kernel.org>; Tue, 23 Jun 2026 00:01:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B0EF40583;
	Tue, 23 Jun 2026 00:01:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FFLlzd94ROon; Tue, 23 Jun 2026 00:01:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9C222405D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782172890;
	bh=KBT5M7qC/oMPZwjYuHV6gTqNyebMYiXrb4rnsGmVf1k=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Fj+o0ZXKM5MOYlVIT4jxkliwf4yvQJROXSguNCw5GDhoxbq2FQXr+nlWcJiOfsIUJ
	 IQcP2B/nbzJEPeH6I+lB7wAoMO2n/xQH3HhJQfpaUM+uT2pOqDCwa76x+RhsM6eF9u
	 ac1UOCokNHRIFZgEg0jKafV6Z0tlIKGSmXLXSHFqVCp9NHBevRPddhgCeNJQqCJX50
	 sDaSFolN9Ky1w63witWtjBBwO+z4RzGaf/M+EKJ9pxIcu4Z1zGlL5JUrbmjiIPLM8h
	 7PTaMSYjM9dkC5y7R7OFUBUdMAKi2seaXDOZbd2oPf+Z2ywJPWwilOa2QB7KydXwGs
	 a+sWY/Zeq4Piw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C222405D6;
	Tue, 23 Jun 2026 00:01:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CBE0A157
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 00:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD30F60715
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 00:01:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cXFa3-aHJnh9 for <buildroot@buildroot.org>;
 Tue, 23 Jun 2026 00:01:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B1ADE60679
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1ADE60679
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B1ADE60679
 for <buildroot@buildroot.org>; Tue, 23 Jun 2026 00:01:26 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M4JqV-1wbXb13qkb-003miG; Tue, 23
 Jun 2026 02:01:23 +0200
Message-ID: <eece827d-4371-4fbc-8807-6a2cf1eac9d3@gmx.de>
Date: Tue, 23 Jun 2026 02:01:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, buildroot@buildroot.org
Cc: ju.o@free.fr, dowan.gullient@smile.fr
References: <20260621164634.2423931-1-romain.naour@smile.fr>
 <20260621164634.2423931-2-romain.naour@smile.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260621164634.2423931-2-romain.naour@smile.fr>
X-Provags-ID: V03:K1:Fwyx7OERDJL3/QS8hpWJawU8HjP+eW93l86gd0q4muUlENRp53I
 1JFgnzCCiXKdwdHXE9Z0SC0KAN9+HuoWbB+I3tPBedk/ulO7FS6hScKLjc8v11NEttkdz02
 B3m5ziL5tIF5RUDcaiLnOLfnWF259hc/GmxRWS9OAacrHDUAWPUX6lqkQ+3dJ4Fuj/THoA6
 52bF9GuuRuYK7zecyxq/w==
UI-OutboundReport: notjunk:1;M01:P0:J44iB3sSMhc=;iy8r+94u3OpCJSKIz2f2bYvTfXw
 Taz/utxjMHiLJFMFJwDXtmd1aOzR23zGRTGDu2S3SRVeCgy457FYxUB1PGVMLPsYDEvtMkiF9
 PIGNNwTOYyzfp1TimDIsKto19gjUvzlKezpx1LV+rKhQAagJg1ELx2iXAquvJv8GreRd0ZkUK
 A9oFTYAjyT5Uatcbi59uq5upBbaykFU065J9UGUvZfFub+XzRMiW1Xkga/T9JpOIj8Xk16FlO
 fu6wlb3j6PrqXmTksv9eoo+kOY6Ij2W8Ndu+l/I/C42m8yy0Adk/4iui1a27OnmzHl3VLgqgP
 2yEmO0a7RLVRp9KTFEMnJnvtmnl69PdGW6DDCWXoc5livN8kCp8WwZE1lRgX8QhdIJTroqTtH
 MblsrQo8MzAQtO+sJq5F1FW9a2A3xN4Qvl0lCs7TOFAmlIDPaJzPE1wS9UxShiPwmJf6rDrni
 qn5xpMY1iKNlRQ6GFJ/VnA4QYY3oliYWexhQBCWCHlM+sfAuShW8Fm69ZO2psP63O9HdQYajC
 1rRIzwActi2CtyV1v3OdCl2dBIGB0NbLj7Igx7t9nppZpg1n2oywN+Y1tfdoX1CjKHN5J7MhJ
 dOrCxuwnzpAKBBQSlQ3HIkGGWDpyEALXrZWNNTxxwGluI9bctcIZhPKuJv1IFYD2I7EbKTw48
 dCAUspU97If2cWTXW3faHGtgEsfSbCLcsX3FgCAH5u6MRkndA6r99LgLVnPWFBL5GmIuZfI62
 8qu4QP4zhb7yL37h0qzkmkPyoGKMtnUXdKIuZhvGQtFORW6dHZFiq5UKq8WJxsDrM7/4jFopn
 VG/ER8XtvOkrvQBgmSwLI+UyQ4s1oZs/8YuyaBRzji1XQkmevSINGMRN6gZ3a8GcZXF7UqZPM
 sqnGQavv6EE8oG+BZLDvAViHOv/zpIy7Vj7sFDc57Ya/bmYJNqz0RU7gQMoQDiYdAZAzooj5+
 gCfoMsTPI4iKUS5fVBfjibS5XPJ0occnAdnwjO8EfCih19xrwUS+0LkWO41s5/TsMjZhV+Q0N
 geHx4nWeAPUK2ghPVXQ81byeyu3PIEkcWOYNBvXdf6klCDblH4g/L9wGbHgkghb2JAF2+g6BY
 W8mcU1hoo+Ya3azP2NgGYhoiA1CRD5PVmqy32Fo0Uaq9yph6M/+u+eTTHcNy/BZAWxab9LErw
 mR1KzUPGJQvVBLcBar2gAb6mc3ahCoOQGdigwtfhBM4Th+UjbRZ7SSxlxlYyptiay8Jvof07x
 QZRfXhyTjamHgr3WLSokf3sxkvQDAtHwDN7c+90gxa8kr625wQuEp6pBVX7IsdWr9eWzLNvAn
 T2xCuSMxAuouGJHFlD4OcrYmz0XvLHPVbLT9KL/kzbLJ7NYwIt4yNLrcLra+aMl0UmxWwRaL1
 NJzxK59s5Y0r+IWgCUwgTgsfWqjWwcL4JhdzphiX/hCopJA37FlVxh32x5Ds4BxzdHKTeL4np
 3haMuN3mlESlMPyXJqSbMYnICylexv9JULm+94NOS9RT6Fg7oDJZAUlaDLITE6l1LF8rRRjFK
 tbPwT60O8tPhESYdB88LEK/NVZS+WFinErTDVq+tlZ6nfrd06Tb/jqQr8dqhOlaDWUD0HH54W
 buBN6Zh0WaUjmotWGk4vzhzBxkzJlt/SWjTBHM7Cd+04+yTWeyzUyCGWAV64fwYoQ/8SV44fc
 6J0X4uLSXmT0jVp7g29/Ww9e5c9B2owqR0tFhjv0CIDvoyDFbH//HTbF+QE/k7FL+LyARnW56
 jQMe21WEB6tA04kz++IJ/bgYrhO7Q+bg7i/LSEPvQCSgVemqg/qS0cYTmNyyvO7bZL/cAKOAl
 htb6nh/GHdaxOgdKrOn0coGXjZHmogT73nXwKYZe+8Khn7Wum/gAML1w1LOcW79bOriQEdKX6
 irnO1KRpSleE8dyWMiPoYtr6L6AcI79qnqnl28O1QuIZDATHI8tCkfZnVNOvvJkpfrbfZSTzr
 WK1gJNn/qsGYzcE6oT6QulCsBhKBqBvITK+nk1a7ZdxvBiXue4q9hEFL8F5rDrj4jk3j/STgx
 JDzDBvGSJXsPwrJbckQzJaEeaJdHry9kDX/16n9uR461nC0UUlaQFcKgCK60nuWZmIxB2FdwH
 sPYhhWYYIsvvoI1VUuNqZ5BirStKtIb8wwS0sHChPhhWN/eXSpoouUcNkPCG00I1FPp85Yq+7
 uIltqwus2xplX0rxN8s/WZqs65kmjOn3EtQE2tCFCuO4vKoHNOG230oUEM3yF2N8fw1quUkGE
 eMIppRGe4X/BW+Y8miNOCPdWUXYtUHbLx0MaQZSUABjNju14HkMkLG5FXJ9KRo2+pWZrT70vQ
 UcVzA4rT9W3lnOQLFG4lSPGWM384XwXi+/ca+R1t77/VnX3pTcG8PwkVzOG2HKHRsvPLZoVCe
 bBzxhcUaoZ1MwL9DBHa/mBOPP4SgPuFYJoUfkmFkzPLxiWNMMn2r1+2+N/l0WfhcxhryRjLMB
 tdrGg/vIPKrYmUhbBAbguy5Uy89x0vG0DAFNdwmYwg0Mh+/pM4NsWlyxmh1zTAfyUVKb9BeUY
 2ta/EW9fp1HcxWSTdPq6PGiSPhdNv6jobrET9Si5WxZHB5fZ7E/lXAcRgJrJXsEYWNUibulUH
 VlaUT3Hd5L4OqRhQKRocsGVBO88DHAhHCTb2UC4Ev02u5A0n6RH6DAtb+BZXG2pa3BQI5wFU7
 HQuCmfObLKcDBW65ib0Ux3G42SAr4yQbbw1CCGr/6/ocSMQFcoojk2lS20Y1R+4faKoaFxQRS
 XekFYuBaO7sXc33Q27hN1AFQZM+QgLC0gbd3xZO7XznGGY5/NXxDKWc/NqIP7mLMMtcULyOfJ
 jnBdLWPgDPofCvpSkXBuXZTSw9qemZn2PMZTL9dnc7XQ5JhDiX+VbxLX5Qp/sdWeQo9+vPlYi
 LEbkC/DjwKRZyeH+a82S5BYuiGJqgfIIgPeGtyWXCqzuIrxj/U2aZZk7fEewsJ9BQ9N5M+Xju
 9TmDeokG4Ax+3NmmdmhkFyLfD2eyPaTJv6QtJ2oatajyZLdKyN9pjyrZk01In4Ugq4wsrJ87M
 /WWuLMzgdFPn+5z0zmKe2bHpo8JwFd7thHH9LZb0krvkk1fpBNcx28LZ9gocyNNePKJ/dDgUi
 i7MmuGvuKGhb52TfAAvb3VQpWXvUDxDzMtos8ee3Uue3/gSHdtV0Iu4D6u2aSXdfH5vhMl5vl
 3tD8O4lW1maFdxy8lnOwqLl52mobbrlIaBG7Ixh9aI6V3z3xtVJSpBYFvP3HcQxVxvE0qB+5Q
 In90/zOV/Fhq7YfJqVpha1fjHGdIA7TwsiLPZ/e7RFYtveYyeX3UCbstc+8RIuKB6yXQU6lNJ
 O8eZzwL0UL86uD7A9GrkCjQKUetHfLZbY+9n6j0WnzbN7ke9N+7wdmQVA/2is6aDj3jlA7ScJ
 2yysFJrq7w8uWkOWDiFVP3AriGNo+DHlcXZKeC+vb+h+t7DAsXFIDMLf25ERo304tzPGGRleZ
 OwLQxtoV36uUKH7AzvkkL6I+5a9DHLoz+3JnYuNLhgfw0dtO4VA+Cuc4ot/zv/7GhASaf8M9C
 n8PgMdi9j6dxKpJFcvgGI5PfMsFLhcygc7QaLOha7HeI99bnre5FfWBMuHpqGeILdXs9n3VcN
 R3KA9ltZWQSPu9zZ9Hj6qFzp8XiyxEqcIRfAwCYHkKu3IS4VaiTpKmEKGzpVoFaKX0ZJJbUiT
 6CiA9CUzxqVkhx97/4d6uRI/BZ23oBi++k0FQST8OqLUVYUrTXoIA5Wg2bqMP++Ap12pz+09t
 vBby4iBdgHk5V7DO+3AEBCYZj5w6x67jPhiXndIcQA2Zd1ae8Pqm032gQyALmBYhectcoW37F
 t/1j0K+FBGdQBoFdyHx9/OmmB2Z/RStFUSAFFhaGv8429sECQNeWGI3Tuc/RT/8CO0mCL1XCQ
 UNkvG5KCYlePX9udQQbYsfhjIYqEtrMqkNi3JTFOwOyyRX0j0BTlstxFWpEH5yxIfh+8GHVSU
 71kdjoqgU9pJwf3aeVMcTSbR756LipActX5tXarEitUneNkqRj3mIBtfCAMQ1AU6V8KENs1SC
 nr+xDn5XzIYnRKAOmU15wR7r0uOiJ5eaVxpFTSxSS+Uze2qx3eUFsnkBd8XJC18hJWVeTIy0A
 fDfFR0UHq1CNfyC/sfuTlmH3xyv0bLAaNtQYaQnGarSv2w2bv7wcD1fXKzSOsVkj+SXPuLMFG
 TPJrhWj/yHugDgE6Dq+QN83ocB0ypInnh54HNTaqscwQw0m0SdzXXNgat+T0r0cEX2p3Aq+0G
 5Cwn4Kpl8POl19RjSkKc3O3cbd98qEO99CxSklApV/Fby7iDQZWUNuQKOh0b8Yi/efE23EEzz
 Y1c4UmUwDaqq8AH6tAIPsjV5b3gvehDdtu3agsDLwl/awJJABOl61GZVQTx4Nj/SON3NnCZZo
 VBPTsSj0gHxQNM9emC4aGLrhOSO58WU9eScaQxYBWFKVosylv5lItj7b26uToFBREme4pMcaO
 iGNovo+luLWwdtibY83GlXXGvenrAokIbEHU88OWfTun0AJbm7a6CVOt/sdCtInKNBBd81AYk
 w7yO0hBD6Zb0voiAQHuhK/oOXv4EP+nk0zh/3z4/o4/1XPka5b7C94OhuBbaKV8X5wutJYPFl
 mLhvPNV0Pl2G8okWfVs17hUHIMDiLLYgAOXu2JkwTcGk1KVHIWTCx+8C5MHLwAjGIo0PdzcBg
 xbbGvpfUOTfZMceSkfQwgwJMwK2MzVBFwpEAxx3fPNwHUDDdQe0rp1QQqeCv6p03lRJxNfidk
 hNCQW5ilq4z1QH3a9lX+s863mU+WCsSpa55JtMB9lcF2iMZjj5UL7vBSktiAUtS5oyJW7QJH6
 lIU3ngqPkA67Z+d7mLsXHn/gWMMFti1FdCzZabaJ6Luy9Rxqj10FzyoB7idT7t1TceXCFloOz
 3da/yCI1iXOzZlOTu5LBwzyFfPx50S7jXG7CGgORauy3R0uiQ4O06q0tp0owBe/ir+tu8aGoo
 uvO/9Lht0SF63ctMHY+3/51Zl7uI8mIWIMuNjFnLohQvaSCCTDLUJsdhXVrDN4brLLMzw4/X+
 /hiBJkV7Qc6zcCFe7R6yWDrZNbMQqJ4r3A1IykJSclN/eH1ELFnMxqKfyrSi28KFUMhogYuY8
 DFua5zuWr2svqeB6VxeKVtDCzW/iCx/+QlQtwnbjxIgVb4L5dZ+imXk13+2m5JNHermCho/rP
 7qiP6dfev/lgdoibRyFQhqlARapP0/c3XkApayAISukvzyn2V7d0Unmi0LwQxCbC+GMBOeEEX
 rQ+f5L9bZfo2HYaDsfaUPtOZMEd/Ez8YsFoQoAZ0kgMFCoFYEeFcsz40YesdFm0+d8+YN1rJS
 rM7g1SqEyLd2aiDQCxiL+Aa5ksW6wyHZFB1tqGZ4bunz/bXSVmuWkLAykriiEqNECmcfCJvKC
 2D4j2x0T00ZffZkvdm0v7AbZSFa9wmRdeZG4JlNLIo0ukJN6RvEaQKhDPpgTZinl5OpIfc9Iy
 tCEJfbu7S/JtwU75MQPkMd7bIqrAqeYzG2dWmkNKX3O1lfinkgd8ulypBhlnbk9HgO7dNiMV4
 1B6kAT0dmlSY0OECvCCJI+clTRVBOekIFQtvvu1pah3w8xZvv0bR9hpx39rhjNNAQdY89pD06
 vkIJUW0uDJtHasG2Fw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782172883; x=1782777683; i=fiona.klute@gmx.de;
 bh=nPr2wbaPWB07jXcO05BrtrL6xIBDbarGWvJi4xmyYLk=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=dHfoCI0i+T4EEoL3u6HDi26XsjrwNFIgxQ9VQ4L2jepph/lZmHmhEiew2SSVJxhd
 7O5cqrEokBCdNGDh9ygYqPrn0nLGaP/+eWqVvuJvCj2oYjKKOkB/lxE3ik/kt+1bC
 PcvdzA0ubRbbgw6Tik6BOq+lz4GGkw6hf73pAh1y2sSQxYnHKQzXBu9sWg8zi+E75
 J3IeWBR9K3Q0EKUPwgPmc0YVAHDIaak1uuuHYOEB4urari9drukGh8tGKSbLXzPw1
 TnuIcnYO8kp2O3HXbakOMJiPpvXbgOkW1meGyz2lKXxBYPw+HImN0uBcEq/8plgG6
 NDHrkeUAmehpdcaEhw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=dHfoCI0i
Subject: Re: [Buildroot] [PATCH 2/3] support/testing: TestIptables: check
 for netfilter legacy tables enabled
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

Am 21.06.26 um 18:46 schrieb Romain Naour via buildroot:
> TestIptables expect netfilter legacy tables enabled in the kernel.
> 
> Make sure we use iptables-legacy:
> 
>    iptables --version
>    iptables v1.8.11 (legacy)
> 
> The test would fail if nftables compat (iptables-nft) is enabled.
> 
>    iptables --version
>    iptables v1.8.11 (nf_tables)
> 
> Add the following configuration fragment to enable iptables-nft:
> 
>    BR2_PACKAGE_IPTABLES_NFTABLES=y
>    BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT=y
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Acked-by: Fiona Klute <fiona.klute@gmx.de>
Tested-by: Fiona Klute <fiona.klute@gmx.de>

> ---
> TestIptables should be extended to test with iptables-nft by adding
> a new TestIptablesNftables test case.

I have a simple patch for that, will send once this series is ready. :-)

Best regards,
Fiona

> ---
>   support/testing/tests/package/test_iptables.py | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/support/testing/tests/package/test_iptables.py b/support/testing/tests/package/test_iptables.py
> index 72f2dd71a4..eeb4ccb5dd 100644
> --- a/support/testing/tests/package/test_iptables.py
> +++ b/support/testing/tests/package/test_iptables.py
> @@ -38,7 +38,10 @@ class TestIptables(infra.basetest.BRTest):
>           self.emulator.login()
>   
>           # We check the program can execute.
> -        self.assertRunOk("iptables --version")
> +        cmd = "iptables --version"
> +        output, exit_code = self.emulator.run(cmd)
> +        self.assertEqual(exit_code, 0)
> +        self.assertTrue(output[0].endswith("(legacy)"))
>   
>           # We delete all rules in all chains. We also set default
>           # policies to ACCEPT for INPUT and OUTPUT chains. This should

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
