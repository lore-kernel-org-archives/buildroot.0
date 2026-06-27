Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66185C43458
	for <buildroot@archiver.kernel.org>; Sat, 27 Jun 2026 11:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E35D640EC1;
	Sat, 27 Jun 2026 11:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BUstIulWTwiR; Sat, 27 Jun 2026 11:34:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 020EC40ED0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782560074;
	bh=rcLqW7IaAx7N5FSYlNGbeg4KF1ykbepLsizPQWvwsvM=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=i6VyjYlLJeh4jq7PBi23Oq6GcEb9syKJYvpeEkdHgqhYHuH+in7tAWmbS56w47PAG
	 G1FH+2JFZA03brIJbr72dBgh08jeXuiCXEwSZF2q4nEdua/pkRM+QBSR9eU+B8UuCJ
	 kVT83N07y7oSHNw7HFHOD5Ij0IBbRbd7OLbQH5EdsxHzNQdk0Dv8NAS5PT9zaEnRTW
	 9MbiazzOZNxpNoNQiS/l5QnM2oyxxom2QowKWHcL0bI1r2LIVX3M7xkjDDPcNy9/j3
	 o8BoUwo+F0wiF1i/b3hBgDsabuPDZiVf8dDi4iHrvCyi3dbiK1RdsY/ElQwKSXHKPT
	 GvywJZjOEeLvw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 020EC40ED0;
	Sat, 27 Jun 2026 11:34:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C6912F3
 for <buildroot@buildroot.org>; Sat, 27 Jun 2026 11:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85B4B81FEA
 for <buildroot@buildroot.org>; Sat, 27 Jun 2026 11:34:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pUr9v2QhNBHF for <buildroot@buildroot.org>;
 Sat, 27 Jun 2026 11:34:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3B7BF81FAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B7BF81FAB
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3B7BF81FAB
 for <buildroot@buildroot.org>; Sat, 27 Jun 2026 11:34:30 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mt79F-1xRhTX2kbh-00uaiy; Sat, 27
 Jun 2026 13:34:26 +0200
To: buildroot@buildroot.org
Cc: Fiona Klute <fiona.klute@gmx.de>
Date: Sat, 27 Jun 2026 13:34:09 +0200
Message-ID: <20260627113409.777671-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:k5x5+Jvoe6tI8BhI5jKETKFBwrEfQ0In32DSlXDIxF+WjR4/JpU
 ZyMYvRKDiQEJK7UtA6GnH1Oa8Lbafnr0MX53b4rrIQQjB/6lEuf3y/CrLzDo5Pnmq45fihB
 9OfAfP1P2HMIUwQDoUNM4GBDAHknMnkG5OyJu9bayDN31OWqzs3lJgKsmtNzk7ptENQ2UUq
 bRGfI+DgCD1//zjxEwoQg==
UI-OutboundReport: notjunk:1;M01:P0:OqS1Z9NG7l4=;hP4zrzVPlKUT8PNk+SyWEROqpns
 wXR8QK5I6Q5sL35Xq+bZnlyGr/VLtFBBR6/3GURzpHrmtMlSQ4jF2kyVCJVnPbtnfi7qWzT8D
 ueglEP8Pdirm5bCPvMP/USVYfIquyxtrKrjZzYGMpQS1RJYt5J6Xz/eyT67qTXLltouElv3GW
 ya97KyOL99liQlcxl6SynHFyTABIKu6MQ0Z0wboTg72SDZXBYQpapn2nsid716jM8TT6kURYR
 P1rmMU4Z6yvddVaToWyJaWUV4v1sfIeupYpQQLCmmPual/9qChCMaDzDJ0sTUBITx28t9ZU4c
 gETU95/cQNZyYQc+mQTPeGTiPQyGVT/9rT19yODmsuKGHcnNMVgPkVqSVvAVktEzQ/FOQTzks
 FfbgXaOaE3JFfAszW97CGqSmHteYTpxVZxMNgVNB2Rn8Rpj0wbQEEfIt4/P1HfqwsINKHXFtI
 N45qcqF+WcL+czLql79Z6j/CsWRBhx2AEWBe/UzZUDc3GiOllDgGTAWwphEFdfLbzp24WrKwp
 wv+uJatqcKh4Kl/j8rXfuaoyaOFVnDA+rzOpWTC5j48B/MP2Yc8p7fu14HUMLlIKrg4vkjR+5
 itC/ZABvqfwQGYdm+FynW3idkK7sfB3guhUf1yFtbwMexwwXxrj7HmdzwBK2YYesmZdFj7vKW
 IS1NrRvqCEjvsA9Kv8zZjtatC8TrK/XqXId9QCv+OjNRqmz2lLdylsmQC/sLImZMfui6v6/Jl
 8iP146ftBkyM6c6uQAS5p6LCxiBfaGfEXtX4fumWaCi7lN01kx1Z35ibYNy1cuDpYVIJes+pA
 YhbawWvEYqbH3shD2mmqbPX8J+UQmIGzj4oqkMHTzUtLnfjq551woLEZg6UzYlevVbJainc4t
 N9phr216VMqF4TWmmlPXFZ7EKsY8bZr8vSIQdu80ZIvGLGcLQBDMog0caudpoMSKSdLpHk6PU
 gwrp3jO7qjbKJ11ELehcTSMi8ZfaMMFWsS/7KjVTLhI7fPYHOK/KzWNFnpoQfu/QwbTOFhKbS
 zmtv8K11l3OAxAFV78HYZIxO9L4p9xaa/n6i61OSZ6r/9lBVF7VU+FK/VOSzqAauhNdUWxEUg
 BG2NPwKzJ04cbgpIdvZwxZ/kJFIKKSM+1eZrSJQuhnDSocHyVxZz47ViVnOj4RQGUkY7GG/j4
 dXDH6b22vN95vpXAyj77IBUd+AwHLFx6m2eZHBY5evgBk38+1JxMQ0igQsAbnM+mt+KKTAxMq
 XcruWz9vxzrDaiPqgLbyEfBFIOe+YMs/JJK7yNruT/nUqSyYyW4e3ptVuuotFACVP8w1LQsF1
 PxNFNkRxKMWgxcYhcqljMSHdtBVVhh7TiUJjOO8gDgLB2ETeP5TJHQaI2LcD0USJwOXPXG9Ft
 VtXxvljEVs7/HGvsDgMyG99Ly7StuBqYr7TfkH6BNsuiNR35ym6uyfHTaZ4GlFBgGehUj18ay
 IKbdy25nAdIgY/yalRglaSLeYj/fK/3ILsTfhRkqOoZvybHTqrrBUprBQ736+3eEzvE1KTtKv
 tP0r4aBNS8zihezX/uokbqLhqn9GN2zLhjhpJcDlFEfrVbUG07dunLc+OzKMqUJROhdHQ1XWz
 oqDOVNExSC2CncEVUnr7X3ei8xwPjQ37BVqLlZkJ0gov89fbOtr/b5ZPSs88uGrgIaxsaWcw9
 Uwb0hf0ruzNvFwJ4SGoETo+cfFMJcD8ctmQwceTTGGFz93zJy0z9wQb1KPo9M1E5JF3duVEz9
 qQYI/Szr2cWkxRfQcCcHhv2JWAye3RJ+ufxVBGT/xAzKE1uTwOLCEFeE98dU+WP+PY2IIbFPM
 YdIj/u4iS7eGT/ldWqimVDdhbuW5p2bQsEOddDxi4aZioSW9185mBJfQOCs3DdkNu4lIx6STn
 bUGOk+LMwbQznoip5LCXhAw6jxpIiJ4qo8Oj7Rltufevy2gObNLpFTEppIrEJLsCjs29O7dvJ
 CMRahrF8Ou6YTGFCE/UT+DIJeV+Ns3059ZekwmZFmhpa8+yXeEbsrCPwzfXN3v/qVRrQXUk5Y
 FFUfyRk/riNVUWsPbHj4Tg1b7OTZeqMBcvAGTZr22UsRUSqxEsiCChzEtWAS3zR+3+2PYQNA2
 OWxgHSOMOVPGALdFqeMup8FHSLMsYQ8AZbwnZGxL6XJ4z4RztAohUbgYREk9ndwolI8hiE2yE
 bbkiN1K0gHngFLtsyolmusAcLH0NcXop5nIsvsyz1oVk1MG3dNhCyBHycTVWt+bqlHM2yynd6
 HfkSB7TXo6s9Hrycfv7vPrrxkNQKxlhJzAyw+WlMMlTSTrRyYlCbtdC34YA/2lAcnPSgWj1na
 s+gjXcVkM9iG7q636zEISoWP4hRkBzJtVxxuNSiEBvr9qePfwuJMgsHH6qbTrbTvencU+MyGC
 zUmNoB/emvAgOsrLIYKvz14meUN+M38TJM3fy9V9QbCxTlAmJLTY4sk61xmopTz2ExZ+el4ik
 +SIBgPQU1xu6olc/VXa7AVxLwXqi4JAL7wQ4J1sleA3O948FJHyLxWpvwx4rlzDfoYNkWpCve
 VFrlRCuAYtLhkDskXkM5NBrOvqWYZp1NQzkzPetS67ksAboBce74MJTth4pkMjQX0sEyitIDq
 gqnKkVwIc5/uHEiiR2dS+eD04OiqA8JOc6JhskgH3kgTQLtYyj9FJik5s09szBHsxZCft/ecW
 BmIcq2SHJeEUudt/hdm/rRagXhRsnl3aBOaU/uanvQpbKBwju/0HVdt2jsAkXri26Ul7ikVsN
 PZ2M6z80SSwOwYC6yCFj7qeAf18DlVv1C0aX16kFVALhcB7rXx3uPrCC61xjTD+a07dq+XTgn
 Cjo/PHBT8EcsnVI/ECFxHimHIj4E+abQozljeozNminlwMumOto1M3eFHkyD6/ytquZNeAKvH
 i3EGSJm6w1aojSgQNWYjqX8Khltbjohgmeqq0UgXGCtABtaAmBQQFZwTXh+m6IO0w8pa4bLCk
 jmLZ9baV0jOdfRCMgIES20zDNxEiokuk/gobQ7yTnHvcbCbkE9qSxawnldyq/ERLIkH0w2X30
 D7Lu30Nf5YJ5B/O0b9wVN7LubuLbU0x7aLU2aeEVAA0zeHKcVdJJi2SrJ5cdGHXfiqbjItxb1
 +6F53p4Xykuax+1ADXjWtbvt/tBvNqHE5ffWfS5nX+KZPrvl7kSj/GF8bYXiByGB4TSZn44p4
 nK3DhCI61aCnta9G02VGuroQTcDDAFhfx/UD1u3WtD9w24PoMQMEjNqI46AGdGqU2xiI+/anc
 z8R4jFLmHDbZ4Quz4LW7P2gGQZID11pYdXac6PM3B5iXUOIUf5+Rnrj2pD/+bU+FZqQMqLon8
 m1djkd9ZbIRIbXG3sdfrdgYkZfjWANiBc8lX9n3bvVRQpeYQ81ezdQ5risLgGesY5F++0IRHJ
 OjcbwTqz/3BSP1F4G5Y5YI2YjPJZEqkZqNQPqPZpXtjFzoBb7kV8kOpUIRVZQEVZb1JF8ZTAN
 /kR6pjpSm3raxsbiOzzij0vmkQXEZce0R6DO4FS3umODXjZMHb+FE4YHYd2vKcP+yXf/7Y5d6
 tkGRZI61Vt4ajZI/yWMzeR0AUHSlusFc1h3ZJJUJi3bNW0+OStbGjqWSKsPTVcLNp3IqF2C1j
 45BSWXPto5iU/lquq8W1Ac5RweuIT71XFOrwe4YXx2/GZ4ybPzg7AEIKh4gdKvyzHPby6073V
 NMYOyr1YNnION8qPPbmu/3/rOWwetl5I7w5szekESk5GLS/9/ppMcLdl+7vQrkJSZb+Vmt0jO
 KIujGbFdHx6YNZ7S6YaLuUWtnow1Z+LO/Q7YaO5VAVE7QRi6U1aBXDUtikRohHpvy+DyxhSXr
 g7cPY0Sqk7RKXieTLCMlPCjrIubG4iFPW10szyVbGKGUybPL0UCAt25QQhi1yFI9s9dFVLFLq
 xdMs0oWhE0Oh9pSRetZO99ujGzmr8t9Y+6q0FUmvpHRjMX+sW55wrFYaJwpXvf/BqKUN6/Wo5
 dgL8sULe/pW1rZ8P6GGe/zOPRIA//H+aHV7MtJLCPUWfXNZavmSwCxb9jlMI7lqANqMbQ4i/R
 pzPw8ewXg8EdcIfhChb7E7AazzfvGfbQJ57h/Ash8zWn+evyEN+Nt5oBLmrLCclj8/zyj8BYU
 V/S1cBSmSNIL/zf2mzCBvbdZYpWejO3Iqypj3etATvKCSsF+M3JaWzZwWlX7S83LOMmK75AJz
 Y5ti/dsq4hY+PfAjHIflI8hBM/eXE8eKwlJgdvR/zq1UVDg6+WFdJ/ZR0r3Z9+t5IV9cIFCEq
 ZWPif5LFCByxGaalEyWvGNGJtmPPt9gxJ1t3EdavSwKi2st8gSu1xAFN6u+ceWDw30FicKFf8
 I29hmBCPcdO6UWGaMbODjnwo4iYJUaVm+95fP/WkCFs2NG+WJIIs0Uh10QnGvWYO1eiXH8Za+
 GalAmWJjLQqPDBrmvpxu2IXewyaz7LC/DXUWj+QHgMsB+r20khHX8eZBokUun2nSP8HekPR1J
 G7Wco340CMbjaWU3aBG5vq/dpSiHV2/V+tejFqG+SP14heuAU2i3hr67eIwtW0ziHMo53zcmE
 gX1MAAr+AT+aVdXnDIFmvPqgNcEu2uYVm5X2jl5WneX1BhJoTx79zqhXQz6ClCDxvjCkpGaGW
 DTojqPGwL6hIISSVbT3nI+puSFvOawPcTfdttM1/odLUnVw3JIYMhpno+OgQ//tzcjP5G7Lsb
 v4ww/ROyYlW4QSeDz9xncc8BPUOU+nC1jM/5UA4858QDidAAh0cWCuSQmvfhRTs96Lg5ETv9/
 UbGuuLxXuKmfhajRg3/Vkq20ORv+zU0u0aUTOsKbtJIXrcDdlldivLbhyqRXFYQBlu3gj9CQv
 NjK74ql3pZ2cMhPozbrefYbWFim6Iriqdv5vg2JhiRm7B2NuJrd4nQjpq6kmIf59k5kQiADBd
 7N0ct4KcRcrjdLuo2I6H/B+FtDfbbQGVUdkb0rXK6BswCSK4ew/u29J6+dp/z+5YDv+CiUZkg
 WgZAQRKywzWOmTU8fmY3vpwLZuF+sJ1zTFzklf2pmrHF7NFrZHzg43tp059PzSNazvKX/YlY5
 pQc4obVgrjoHUMh9Oy3IqGqbCh9P3bdzUOQFLnblBJZoPZU522On2x80RBRpCPC7Tf3kah3nd
 rqORmu3Twul63TSQnH+s85vaRuQW3vC4KX7DeTe6sgJykL9ZK2GidGv4GyCdz05mION1f7R2u
 gAw6YRPHxuQebIwZSunxvs4fUmhW7gj5GkCa+i3CkkyhNizSUAw8BGB5f/V2lbdZaP75wJ6aa
 fUc7vw490sxKC043alaiU1Z+o49DIe/4wMbuJl+abUgARH+YithBSRJxhyYYrG5QMXdOG9loc
 eWzryBONrfBqB/WGT+jU7V+bTw5+Gs0QljqAls0nZCsqZ1lTMMcuVVKdaYhE4M1j9YZuA1Ylx
 WQTDCajxZ1nfu76ijyCIGVqZSYUCjNP5PvyKDRx1aYqSAbXp5xdyyzn+AB26NSWO9gaW56FCN
 s77ezcdo2KRHCFXk9kcXQKrq3MRAyMxZc8xti25dJksPgQS8I7rNcdqdgXqvWagcUsXvIZCfI
 33AUpXyeokom1WfumTjE7ut0ZYTw8+TpOYFXXeNSd4HG22XGv1J4jwe2zcKwo9rz+qg6CPehr
 EdWapf2aCtm4Q2gZ7X7io3dtupHbRntlx1luLev
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1782560066; x=1783164866; i=fiona.klute@gmx.de;
 bh=P3e/SforpWiboMGqmKmhqCQjORIRO5ua72rFH9YOsLY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ALDSONo2/IbMtfq4kshPpyQkiQYQKdqJ8Cu9yqhPDLDoYsk2cLO1/gOaMUogg8UF
 C4OfSxyWWg2Fski2Byd/LKzSJwqPjc8rHtGik+Q8O25/O+CdTGPGwyGiLYM/NLKp6
 1IH49K5A4NQNuuVy/52LTxiZVLah6yScZI9uK6ZRZZauHfWhUPkPTKeV00kN74Bie
 McxUAz7Zz7IjAGvvzddYwiZGMmYGs84JXEsKrVuf47QrrVgjvCHgG2GWnGdyWmdMq
 tnOcGIfNAK4+/ykxz1jWcJVaCyE99D1IoKewbuFy26jFV3ws6pNc3t5pxBIlPLsTm
 1puOmd9E4e0Msj5l5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=ALDSONo2
Subject: [Buildroot] [PATCH 1/1] support/testing:
 TestPythonPy3NetworkmanagerGoi: check we actually get data
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

The sample script would've passed even if the connections list was
empty. Check that there is at least one connection, and that the
sample script can read loopback device information.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 .../tests/package/sample_python_networkmanager_goi.py     | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/support/testing/tests/package/sample_python_networkmanager_goi.py b/support/testing/tests/package/sample_python_networkmanager_goi.py
index 240e8437fd..dff68e66f9 100644
--- a/support/testing/tests/package/sample_python_networkmanager_goi.py
+++ b/support/testing/tests/package/sample_python_networkmanager_goi.py
@@ -24,3 +24,11 @@ for c in connections:
     print("{}:".format(c.get_id()))
     c.for_each_setting_value(print_values, None)
     print("\n")
+print("found {} defined connections".format(len(connections)))
+assert len(connections) > 0
+
+# check that we can find the loopback device ...
+loopback = client.get_device_by_iface("lo")
+# ... and read its type and status as expected
+assert loopback.get_device_type().name == "LOOPBACK"
+assert loopback.get_state().name == "ACTIVATED"
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
