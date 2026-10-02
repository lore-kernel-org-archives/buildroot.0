Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AFACA5FD4
	for <buildroot@archiver.kernel.org>; Fri,  2 Oct 2026 14:02:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7FD68121D;
	Fri,  2 Oct 2026 14:02:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s1Bm1hZrLSoK; Fri,  2 Oct 2026 14:02:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 171C2811FD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790949748;
	b=bwUb4jiMV02i9yA7M3wYCthnJAnMbXqrFbVCdS+nTrFykjhR7qu1mO/p6Gxtsuu2+QOj
	 cYOfC3dJtG0ErNvELeMzqoyjNgm7b1keaVXV1mAh94c/lb4fGRhRiLpWA7mT+IvgjtrAP
	 p2+ml8pz0gBe+Inmx9TdaQXx5Xfqw7PR+6Rst+l9dBu+OrsODwCiMijto52ytKflP1LNp
	 xslXMSBKO9R3uTsQPiK3xhO9SqIk/JgraiZkU2sPkFimrEgE5jqqFGJfEl4BNnr/U0yb3
	 y+TLLqPkmZMLmzdn/XCtFc9ntHFNrdPTAVVfhQe3Knqbx3C1Sd/xwuCqv0nDhMzIO+g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790949748;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Ubo1z6LNsWJ9ndFyy+IwcDshN3NM3mH+tV/yZ1lZEbw=;
	b=qHCuJk1Qt1BynrR/CQ1CzyrGSUXQFLP2mK3aAPy59dX6rrmBJyvSnUJz6xr8dsOBuyYt
	 ALiCyiRIuESbm8L2Jy378bKP+Skcjv2hocXQvU02CFH+9yOeAEZZ0kggR54eeUsNzRBhi
	 V0C3RkJdtiux+gtfA0wY5ZPwwwQIUd5GtGlOckcjgv6/NtOyo1WHN6QPbH48GkEkY/wQV
	 1GOKYvCOwrfBD/FM7vPYDNr0H9bbSyV32mWAKL5MxFHBEZlwtCleQx2fyKtHGec3MAXcC
	 V/e9StKBdLn4VUjQtmosCXg4IaCjRZH5uxqBN3tV5SwZGfEyBZ8wQaf6rljCcj+LRhA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790949748;
	bh=Ubo1z6LNsWJ9ndFyy+IwcDshN3NM3mH+tV/yZ1lZEbw=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=Y84n17aJsKkyYk10twtA/jhpL9pFumRM+sPs7gE7SVsAQ2uFKv7gIc420hikAHbtg
	 wWvHI0iMxvasC+AXIo8fx3QuUuHxyxr0uCYk8T/8ER2UaM9yLI8Ha42kfZRE0VcWnF
	 GbHV9qNMCLpzv1ga52yepATu6fDvMmqCsb7q41RlDfiwQ7CP6JbsL0Gp1RKmltEzZu
	 IcCzNu4EaeYYHasNCe/P/CRWl9N9P3lMD45TPz2FdnQgFwPnRnY8s4Lb9jJaryXICR
	 lBGAKf+jueBS+RrjWhbS5y+kMu2kV1vIm6DpbLl4wZhewwF4B48biVa65+h3loEN0i
	 mYcHp5C9X4gTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 171C2811FD;
	Fri,  2 Oct 2026 14:02:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E566A34D
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 14:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86BD981062
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 14:02:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cm16XuPMbCcV for <buildroot@buildroot.org>;
 Fri,  2 Oct 2026 14:02:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 1D32E80F8C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790949744;
 b=ZK05qs0HQXm3NMn5DUzKwcr54P4nc+c55h6cM0X3oA2f7j9gh37hipJSXqMMQicLSIDu
 sEIKn6Xq93O9JAPbyLDosijFWNksjS96Mnug6Wt9rCWsHtLkp8PjaQYTNy4hZalVKVKud
 OOL+teX8lkJsJiULqMRAPm1nrcgHVN2Ci1hEaMvqpvWXpGqDMUS4eoO+Qb0Oipa2E8aOT
 c+FeDxd0mcfyTmcvfVi+5AM0wIIM7vLZURj5IksE2vU+EjjdNyxnsMThylJJ6XpBeTKx4
 itMvv3X7ql3ve9ec9naPdbG1CzLOoLpLkYV0nfjb5uHrE5M1gjwCLAOyQ5jO5By5R/A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790949744;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=+oMlvkyr7iL8Gdx5FLPkPGjQNvTFaNa0GVEtGOy6rTg=;
 b=E2025uzzHo3jImyx1GXnAjBP28IzVzkJfrNbLW2sxEJwUjMqluFAbEUY0Z8jDxUZNPGg
 IbWRUED2JSHT7dRHhY06zNsOLrVpaiR88BDKc8cZlesFkVhaBzdGSXda7+jxHk2QHxOE8
 eZrBbfqVDBu08TVaKzlok/TwMkbV52bgVvAUuFT/xNP/357r2FeX8/6L8RuJlOVZ7RI7k
 4OpqXP9j87kSB8lsIwo0Rzup3WoE7jzmALjcs65hIyCE5QoT2g+/YljwQrOB4SoYmvzCo
 sGYaQmntheB71d4UinK0/qhRG/BTG5KmiP5Wzw0MEjPgdZylJa2INbkcVaScCLCEQhg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmx.net; 
 dkim=pass header.d=gmx.net header.i=ps.report@gmx.net header.a=rsa-sha256
 header.s=s31663417 header.b=B+2TfpyA; 
 arc=none smtp.remote-ip=212.227.17.20
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1D32E80F8C
 for <buildroot@buildroot.org>; Fri,  2 Oct 2026 14:02:22 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLQxX-1xTU8V3nyF-00TKpv; Fri, 02
 Oct 2026 16:02:20 +0200
To: buildroot@buildroot.org
Cc: Peter Seiderer <ps.report@gmx.net>
Date: Fri,  2 Oct 2026 16:02:18 +0200
Message-ID: <20261002140218.356782-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:5TWOYDsEru9tQKCKVkOmTMix6hJvSK7UEG/0G3qrQBHXiBXax+e
 UcMauWhHhjcSjpuBTDtKdmf0zu5vncAfDNFmdhOMOQQhojrjHU6+YC1cU/RrziRuNumEPEc
 AO6yBCCycg5xKZ4Vj+cdjNVmnd+y+YzQGMyCUHP9xy9zDcQBkyhGjKBd9Uif9rEHs+7Lo0O
 mOsaIRPGgG1VXhSWSgx7g==
UI-OutboundReport: notjunk:1;M01:P0:N5IhUtYFTjg=;sLOi+us5woCl4HaEJVRObi6ToPH
 1R59vBWzhsOU4sQso/j3bx7xNOG0SHj8tTS3Cb4USCfXq1EoBwACQ21LJyi+6ZjvY6W1x1w3K
 W6h4hs476ALkAYuRJpmAigbxNmuX8FAAIJfBBw3pxPRHF9h9iqmkrxrdDxGn7hny27Db4IEDp
 d4BthRgZvpWmJE3l1zyxAEYBHaA0NwPmgleyopeVVfELo2sM8m6/x0GGIYiyKRGnZ3a5Uvhm7
 ERrBxIKHObClMexTp4dW9vISTkb5n2LE5IX6zZUymdxrIhYbOhpEAL+zHbK+JE3nTBBNAL/bZ
 d9amCAIVqM2tXEA8Hs+cM1rfa59pttBhMiNlTBoNNQegqltsvgXo/5/vYHCF1vFD/BxR0NH2f
 Iat7+4iKEapaB3lJa0ehSsXQH+ZI1FRFlj0Tc9+vvAtFqhz6I6pHKcoAmvQqxuv/Rfa+s4Pkg
 AlLZkeB2r55JTvSfTOj+EE48UCM3Rrb3+DJ6qw1zn74CZTnBOCNVLDpgssD7ti3gj9157GiYp
 kbpXRCeRa8hXc/bWSAeg2k6VJ/KRQG9av0k59iE0Ipd3mlEtLhqaejFI2ubFsR3EQ3NQRoeeZ
 KWzn6pb1SsmOu+UGjJapmJLGKCAz2WD7VoDlM2WbYCmQ84qhstHeUDM619Or9SzLlcth2XBLW
 Gign4wCjwxYOHpc+DcRANf5NHDsKPWSD8vHm/zBxJd1nIGmKU37evwsm9NRtolpliKfVdarFt
 yT6nrn6GYx3KBh1HcPh4YLsqRiTKgIbmL6dbRO8NkfcCkfbYZEr5ZzZ2Mu7l1BUeT76T9/Xsp
 prcjFVtWhv4DL8OUSEf9YMwp9tIvZPNHJs7zF3bOM+BMtzPPnQ/qDhJDSM7OM5nOXH07cUogv
 UcQu3RbuLdXY8vtr2UZRRIyshmTJbEBrkprpJF1Zp45O3AzIqMyPtSmCPEG1Jv1AVSBIpvnZW
 SrdzqGJtlktyUh0Lq55zEcTqudwi0o+K1XdQYa52ywhCbnWxNLZy6pLFDyA2eNr+O0KeSod6v
 TAQNyRj4pFAf3E5Ky1bm+o2+JafMYWum2jD37Po6pzkO7VjqsFS5ltUhD+juNFT78POenpbDo
 +1dXP+c1tq3d6Gm6r41049X9BOQlCl1JQ9ec3oKsk1nrNYNVzRp8w/wuG/lpQf3WLkkPOSUdC
 WjsnIkaDS3Z1MPKxGDwJhUkLiuNpYs/nrEgac5l0L7cPsRS4911OAA59JJ/+2388Foz0dJNzm
 OtIcaJDR8o/MwVKoNq9VZTEmzfaVo8kAeIiqxuS2IB2lDU54Lg3RslgEZgFtYSZu9RvqQMJi0
 FY4RLhKOGDKmUhaD/SJx3IZMQve/ZnznLLTxF9HDRSEedj/M0T2m2Tg2c+P/632OUy3M8ewBX
 yfRFlnuygeYItfr1iG26lDH5FKKbOx9fhg53dAf66kRpoMBReotG2RihQjuorkGW6IOQ+H9YX
 q6k6iMsIyBwfAWDQFxR+gqspPXCltRy0z8GWVKvQY1+/o7bnCwGiGCFNtLkUe5Plzt22R4Mtg
 W8KH6pb1iVbTLw9Ktds47yQjMNRBnPz/ZdVtD6JmGzvpj8VEvSA4QzOZieznTvyXIn5wA2vDc
 9DlIJqN3G7CRceyjtkNiezMFB1RZmrBqwpkhqqBgJKKK4TL7GpARBAyhn0XiauIyeVrCEVTbL
 jaxwkMtUhU2txvFI/RS91NmEnLSSLK673tyrhxo3y1UsA+kHZbOrsYg9G8nu0qHliYCzQyeva
 jAYVjj7lRfiums+jNGHh/fojghybw9G82xTL6cFdrGO8KqTrMtuO1Tsx856WekU71tqC5uYZ9
 PeJUUNm6VQKqsNCibIyzzONyGDYFSKYN9wU6JQUlOxmQacbENavN1zySO+Rr+Q6bgtF9slT3B
 7gxPhtAB43vA2ewLESLmC1lfcsXa9mZTdh425sRkAaiTAmUy/YhgmkE8j2GHUJfQTnIoGxP4L
 32jiTdjHcPfKBz4MLqNrymmrNFMU715fDP3JovBa2j3AxWxMl/jjpcZ+ciMyCX2TRH/uRgK7g
 uObkoFpSngwIJNe8WmTJWW8OiZMwlymOA0+tmpZVZ0gTPSOhsEdKYJ7SAlq90ig2SJG+I1ai9
 5bFeDfjkIgA72VfzrQmnhxIaxtYgBVTVDEQ1EiF5HkD4N8l2Zj22KkcTAYyQjuA8msLLgunt3
 zLy/9stNmCoFQGX2OKigjrrj20+Vd0GQtb0Y9e5++PFC+cC5gSSbOdPSACydwUaG2nMdJzQpt
 ml8jVINCcVmvF2cHUYK1AxBXlPOxriKWi3UN8FVwhI90HSJWaOAq4TlXemeJQBwXf3LvjAEzr
 Q+RJewKlL2XlpCQQgOouYbkNHoa5Npx9m9H/5d7ncbOc/1wYOg04LcnM3b73ZJOj/QjMpH4qZ
 1tSydE1kj5dlQJRS/gPyU2p9U/5CRbdAODnJiLGDC5lRs/m24Kzg52SLIvu//vEwjoWDaCeV3
 wETVyD/z62g8Sby1yDrERXlVUNmDT0qd0MTRyw49gb+x2iMLZ5PP05yn8gQ5o1jMgdu4CjXRO
 BmPxM9YxGPokcUvhoSe7v7EoYBUjE2/d1VO0m4LNTGGqpNycfEErpKQGkiQR7X0mxGs+EV1Uq
 V1dZVoCa3cTEN7ziY1TtFtLoqJglOEqauREyKTAgj2FGFpYSzykVwSZvYA9KMl70bQxNwyElL
 H6INPH7LqvCqBBi9ugbsxR3hXeUWI39NaU5NnpTLRhg4nmuFpmW4hYabNTwaRNscg8WURSR3W
 N9f70aByh1Pm2yvvVd61xvtdPbN9w1NWlqiJrliiPyYibSRa2/1uMvJfYk+HGHNj+YHIjLDKQ
 crJuK/2jB3ywhi8Qv2wP7ko3+eNUp4dOn6x14sGfQFxvX1aYr5nYbhZHgtjaorFwzKtNLcv/2
 hvJ91iU2lx26QRkZtVpcYXoAsI7eiVH/vpyZz2krCIwxJERjctorkW5dn855Up78nIk3GbGxs
 n+MebwWZyymjNVI9TNPj5vCVF+xuECMMCi5RCphFwJBJQpWhSQkRS8vzDmfC9AxSUW7h0RCK0
 A2ZHK8evxPwPY6E13Xcmu8s9LKPgxckOGYK3UqvgYM1GrvbrUGPEzGmk6V0hEvW4V+bapv65+
 q4dCQb6D3pyEbKkW8GZfpsGy0KY4cCwSfF3JveQokl8emVBVgQnR3mo1HdtDXdBtJhsR3VMbs
 4c4moLPBVy45U6gGX66c1sXajhRyDyhQqD7lLNBcIo73OnDymQV1SSw+8X6ZoHRgZut3EEnZ0
 jMQzIg78rwZsaCbAotgE34zr0L+1nC0wOCpslDS1q2dObN7jzxEwg6lL43eVpGJWWOtJMGghR
 m2dooCH+sxQt1xOOJUfQCkV4FU8bm8U7fhCNB9B6TmG1VokqrXl7NWvKn4T9RU8SwmLQx94sb
 9et0mzyO6fPpib7755lLOQbXMGrquZ3bGzNZLkOQUkcAf/cD1ikIo/4Eintlie7+g8tIgDtRr
 WeXfrfiPsAK9zNxJKB7FpdXWQ+lz4e60X4mbpHaFwnab9KQOXwLmPP/lOtwTnP0CglFOltMmE
 A/1ZVquWisiaYB5F/BVL2pEh7oYYZK5LiAES9Q3FRZ3cQorUwRroPhSxwX9mFeIHPtUPwW7az
 92C2kmlzipljV8F7crJxZZrn4TLM8gGQKGUn9l/ypKCL/PfYYilhOhNgZZ5pa+cpHG+86x+8W
 cbImayAGPQWZT+sjCww15FR14tjiV1uvV60e0H1X+r6llvgWfsiaTQDbHqtJEEpbf2mnuG/sB
 uQqp/JHKwY+BoufZtbUEFRvUkYqUCDxk4pu0/z7DwOcvuiXe9v4Y+ZsN+Op24U1eusCwyvKqk
 +OMrJbbwkoXzAxwov2+NjteIssF5wtfF+s8A53PwPbgJHZoEgTKxwQY/RIzyq+YcM2jTdhBnX
 JL2fZi5MuWbXUTyFTVFUr44D8nrkXGHb7xx/C5axWV+G5a2kl7eTZ0itAjy2O0J3eBzwXWezf
 R7DCbrBD/6fyN9yLgRaPJUZkYJWMoOc193NS1vDOo7kVvaITnYeqyNuGfpiWv5rCawUaZutFP
 B9v+W1NNpUpVD65vGAM1v7s6nCBgxYb9dIMf/ujiN0q/BqC6EI3T97POdtfT3nrDO7Nm1XSai
 fC4Q4fTeD3FZewtH1eBGOIhRfpAglvlKW2XYhEgLRwkeabQ3Ok6v/a1Kdt5+x7KJ4ThQ6a4n8
 Qd7DoLNaJWPqKFCVewktSFfCt3joS6o3wMhy9XQr2ZRw+gYxBsBUGxnnRE0k5rIQoJfp+HTBt
 RY+u0D128a2FzDLq/EP2zYwYueVasg8CvkHFCsuE1q/cLghOMVhEjygs2z0K9SO1d+gunJubD
 PDNVE1qRBkdoYCMscBI0ygF6WMmbl2lqXpQ/FazmUbLGXJbO0viFbDqtiCSrt2ODZERAzE2jq
 UAbSmZuVouvYTxXbfd3Yx75KLqL1UroybmBpnhceddjZXOvm2yDPmZdnJ0sOjCRq8e7QQOvq+
 OsnzyP6O9nywA3PXtssR/L5A1ol0/XLEOUAwTZ+X8h9Gn6b8RnuorB8E8lS9qvZ2oGOESGViv
 0xzLsIk/sz1+TWOHsNddVoL2R9f8xFfsP+AYTzm+lGqbscaggCSXDyUrOXu7P7Dnmbvu9I8bt
 pmpcyIozxkQq2jXy7i0XGeweHGdd0CW3VuIEMMS3YvSifSucirD5nGAIYRihgAgqxrm6SDY0c
 jlU80gbRPX5rsMbIuC2g4r/c0/I3ij0LC+eESSxNnP80AvjqCQpg9qKAUb2a1jr3zWDobBlcR
 pJr/D9dkTjQDTQy834PD7ow5PXt0YYf0CFNGF6rLBSTnTAOORX58ZVaGuftyvF3F6vkDU+xRS
 Pf+fUZQ+en6p3Y5ZAVdlAjHxX9lGeWBtFvBegguhBOmYl0ZXtNxFVstIbrg9jcS5UJKHE5ZWe
 gJcYW9Uu4cn/iq8RGoqrD5hzTzJ36QbWsf+EqxU18P6JJCh0RwSTIlwBCtZOyyoyRtFNS+Th7
 +R+eoBBqTqrBd4C02h3LURBjnfVtm6d/xtbARmlY8hCbmiUgJZoDTkijAVV0X9t9PWeZVo5QX
 7hGHDha6GPIlG2KamPlLXWSYeYjCfGHhRdoqNA3BuKxJ1LKvthj8H3pmG2bBs/9YVd8Rk/Ql8
 nfJ5xN3n+lynVcd9HD5XGcD7UO1smX0u/NLIIUKCGAUJze7EBBz+QdJMsG8jy7Nkr0RlYMFRc
 R/pPrydnLGnsGAcvMpae6jRP4a+iRA1guwalPR2LfdiWBXpHwR731JlgsdAvTTFq9O7uX3mLN
 Cw5X0cgtVd/cONSIwnfdyfsFd52AI/5J2HPdQwowJAC7lyIT92MIi5VJupQVUeDlkf3eRTTk+
 aQlT/xipNIFAkidsX7uojFFEEKTUtsIEVWLZiYyxr69Wz+K1/rqNaqiKWHBUJZWPRVUp6aQVe
 W3vp45M4v7s65Jbp9Rhh2a/y0OEME3zvFTi7m9WBKO7GApqsZxoW9MGGHBQq3xCuR/if84cPe
 4e9BGu94IeSvfAtl2g9Uzg+zmKYxhYT1xnAKXPFSi2C94MSu2fhKT+GiIck2PAklJs3/mn104
 qWlNYqYdmwa/ZY+USUM9Vdlzenu1iAiH5DPFA5lLXzetVIt1YyjrgQHTDlIdTXFRMG3l2GJzB
 j86bxgVbV6pkpsfcqbw6HZohCNGa5hTb3PxGr46HIQ5nsIZycO7GelTCELN77WvGc8Xsi+mcG
 ABEBAWous5TYwIT3zq2yl7deYYGOKKwnqxQ686YqJNa72xc/DzbJzFXvjK/glhTgjVz18CmSW
 SGKWMv2+kWRMumJ/OF3W3wIr1+vmRruMsae5y5HTGKPq8nf0jizeHmYVdEp+pYtB0i41ZUFs2
 UVD0G/DOkJozsbAFwGll80DFnoHW9optNp7GHzbRyZ8F45QAwkIOx2ZtYDHHCSaxe0W6jORpH
 d9D4JQui2SIHcR8w1ZKggbL+hMvFS+64mFe2UlnJQdg7VfSzKtp+iaeBq12hSI9dj0GASMdSY
 2B5SsATaadeDHyFpPyeH9wK977Cu5CffmJFlMsSm3k709aWEwYuHKxZiwvdxUTNmUGeKSWaw5
 qHNZ7W9UxF6VwojC4KLToMv77yXiVRyuVu8Yg34IcGZOhaL+45CluvA3/yUaf2pLMaMuoQJqu
 FAha2/c5Swiv2p9mn0ok6ZKljTZDRk9mmlO4IjqAcmGrV+5tUezFajBkjmTBEgeFoZ3ITuTxC
 p6XwHebpNvK3RQOoNud4V9Jt/NVr+fnUTWt1gcbxJLFeYzGkiFBx8dj7/zSPIoy79vZbvEYWK
 UwC5Kwens19hNzuQf1sNqwD1STPotDROzykevHGCNc6rBQ7ptCefBw6TghZoC/4wPZlj3QGSv
 5cnF9n2JKLO6DudXPADqJBjaFBlfn1dxC3g==
Subject: [Buildroot] [PATCH v1] package/lzip: bump version to 1.26
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- bump version to 1.26 (for details see [1])

[1] https://lists.nongnu.org/archive/html/lzip-bug/2026-03/msg00005.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/lzip/lzip.hash | 4 ++--
 package/lzip/lzip.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lzip/lzip.hash b/package/lzip/lzip.hash
index ec8a86b29f..64829c3ce7 100644
--- a/package/lzip/lzip.hash
+++ b/package/lzip/lzip.hash
@@ -1,4 +1,4 @@
-# From https://lists.nongnu.org/archive/html/lzip-bug/2025-01/msg00012.html
-sha256  09418a6d8fb83f5113f5bd856e09703df5d37bae0308c668d0f346e3d3f0a56f  lzip-1.25.tar.gz
+# From https://lists.nongnu.org/archive/html/lzip-bug/2026-03/msg00005.html
+sha256  641cf30961525cbe3b340cc883436c8854e9f5032f459f444de4782b621e6572  lzip-1.26.tar.gz
 # Locally calculated
 sha256  022e9c2e9cc1aac3622313df6f971fbb39c1d1b0cb45324c16b8a1fe231c5ea6  COPYING
diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index 9c8c54a8b1..de8cbf038f 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LZIP_VERSION = 1.25
+LZIP_VERSION = 1.26
 LZIP_SITE = http://download.savannah.gnu.org/releases/lzip
 LZIP_LICENSE = GPL-2.0+
 LZIP_LICENSE_FILES = COPYING
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
