Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29ACCD5BB8
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 15:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 614F1811A3;
	Sat, 23 May 2026 15:19:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6KR1xl5-Wt7P; Sat, 23 May 2026 15:19:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9CEAA811A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779549582;
	bh=JYAQZ6R7SsWJQs6I9Ymw4i9HiXazOBNG8fHacJYHGz8=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=Ptg/79z09aHCeIbDBVcJrFcs2SBWKhGELQMtBP+YdlROK7I5DHYzTnt1mpDGxarq3
	 OfWFf9qG0PyqaXWUs1Vwqaebz+1bw8jyPpZbjqKjfNUSIsa7K3CniLBrlOj56FgrfR
	 kmTDpsxWic1EAVqDor8xHu6jP+jx3n5trn7UYRAkv+guMPZFqbtUqEULbwrutSSTYF
	 5Z5YHqvS0B0D19h/Wua/UZZJKvqbwUjeQhASOn4joTfcymeriRFtLomR3ylftz+n9m
	 u3XOfBMvM9aoJoLzwUcMPmYOrmaplL9t+5sP6WMdSXfoo0mMScZl5uh/B3aFl+QLXD
	 CPyyK2eJQxSJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CEAA811A6;
	Sat, 23 May 2026 15:19:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 90F703B9
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7748A4048B
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AzW3n95HuAUa for <buildroot@buildroot.org>;
 Sat, 23 May 2026 15:19:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=and@gmx.li; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F062E4017C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F062E4017C
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F062E4017C
 for <buildroot@buildroot.org>; Sat, 23 May 2026 15:19:36 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9FjR-1wNnT01yXn-00B2Kk; Sat, 23
 May 2026 17:19:33 +0200
To: buildroot@buildroot.org
Date: Sat, 23 May 2026 15:19:07 +0000
Message-ID: <20260523151911.10285-5-and@gmx.li>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260523151911.10285-1-and@gmx.li>
References: <20260523151911.10285-1-and@gmx.li>
MIME-Version: 1.0
X-Provags-ID: V03:K1:O11s5PWpq73SN3Nn6LsPqDEyxEiO89maxgiax4ppH4icwlX/qOc
 uWQGI7JuqKxFHFwgdwq3BVKXRKkmVXcFvnPG5mxyAPPIK7UBi/49o2H5eu7wGNV+6BV95E3
 SNZG7+4Y8Hwd7oz3sYcRWKx+wqE3p4pxMoyGqYvu3JjH5d+Qezz+hdrvOL5oBjbpP6n9Q6i
 VQz9agqIaH6wKVHJhYtYA==
UI-OutboundReport: notjunk:1;M01:P0:7yYL+UbbSSg=;5mPA4ue+mwmjmoj04o2rWniVpT9
 VWIVYlW/fATzj7Cu+7tECCTzVpHWEiEyao38sQn7cNFzOd4excwwpDebnbry5QAoFppV7ml7p
 PxUqEQNs0kSKlPEjD7hA4zwkuFadbUQsh2/naUqkaT52O3NGU+C5eh0oLZ15QN2AYtwucSG3g
 wqk3t48/Q8U1b7rSMyGzMQxIUt/NiMhtca6PFKooeQ0HKIZJGPmKovbeSaLZs+URN2QFYVb6n
 m+KunBqQjDN/0ofIpn+O2Ctwarr9H0/bf9sr5w2feHbVmyGBgIUXjU2Xyek6A8/m4jR9p8L05
 vPeRRq7XixvocNierGULJU9iH3KGEVGu/dT65/Fy9/cDjCR30zT5BmlckwdnC+ExxDpQk9l9j
 8DLW07rTSlLqLoI7rtbzqbS9bZQwOtHy3dD71h98YW7s4FQyO1f8TyQuKieves4b0Nd4pFQC/
 hUL8Gh/+g1ZtuSOmNz+sWNyjDlTgM2JzkeYihD0mcJ3EPdH6S7Lrm1R1IeL6EBJMPUeAg6YIt
 t5lyfxt/jfvZZtB1W8M93w1XUK7EO/0xt2T2s20ajgsKm+Uy0UiCa7TEHd6U4neoYrNxrEA5X
 3nArl6Ebh6EBJqv9pMPgcMsLMWrkRqJvaaPhxdSFYfUqQYJTSnUC+Caqwa9SzfQZfhcBq3qfi
 T3tlwT3qcoW2mf0kQgDEPraRBI8i6u93CZT1dLHTB0lVhPkVNmxqczk9buQibGDwWtm5zcmek
 p3IRiDc6Fs9Vp9LME/SMQDCuzaj/qn0OJKvOxmH8ay238YC54gN/MdofNHhTD64/k/GHCHzgp
 WB8vvBuyEm5IzSrMJt7M/neyxpWRAH6CjrcDRi2tRnHvF2qkkvjd3ROok7ZleWswnCnXen4yT
 TuihALNPBJz51Ra8XXNoNhYZOTyxmFe/cq9GlMFi8cZR1+uYpfqEMMZn2u+Azaxozo2xFVsDe
 2AOOOwRUhrPul5ibZXOtml/Pe3VqtOlK4FpNx2isFdSTaia58eMSaLygZW/et2P3eaCU1R1y9
 hNRojQXlQKhtV9+4VizX0+aACdOts6FbZSNn9kl3fr3eSdjkmLrSHOTM+WnTYwRksBuZBV9ap
 AdEkyNOr85W0piAsdBsYvG3ZYlpt2T273YhanFRpCXdauEQltdzdknU1enq/Mn3/A9plK9IXD
 mc7Wb57mmnzTeTwMlL9QG1PnACLYdloP4OVcEHwSkuXYRaE4hSPNApcJUK3B3S0YaZarVsC4W
 F7s8NG5hNpgviMt0E8caieO8qVwvJk1Pv9btSurWVzgYMkb5WyMa1LdUx6m1JJf+JsNSlq1Ye
 hWqhXolX3ucuROya46uAxBVLw0s6zo99smGFwssYve3kh/V5IQd2GS3IZU6bmxclDlvyiQ4Ko
 KN3heJocuvl/5cjVCYEjfB7mbnjSjPmoG4TDse/sPtzyvslXFokexb19uWwHTdo2yp07RaNAg
 t0gk8dIUyI7nwUEe9HupMmys7IqFSGHDd+P/Hi6/cco0eurV1qC45JoLCt5twtziQuIAX5+Go
 P0gQ3VPk99ZS2PExjcUCvEGPYgkMzVY4gN2lIYi0jVkuh2xDKfx6KBZzHGdW+6KWC85x4eRCy
 AWfudeRVhDD0yiZDv+1gxQ9QiCOQo/K0vCqTTDigzKxcp5u2VJETs09uDuLziZdaupEHR993t
 BbL20l11Jw01qMm9/FKPitWIB4wiJZfZKiDsArKb3rlKoX1MyrymfgDLxCpPXKvRAIKbRgNSf
 6C8ZBQEzxWTBClLp/BOusDSBlBZqJ6Nav1gb7h9u3omP41VI82PzKFG8Mm+UXKYHSFIneW0VR
 HBh1YAclc8ogglZvlc08JZsiNV8+uEaBEp69l2gpgO0lBxXf2VLVv8KV79c0Qxv6cd4HX1ooz
 baqw7zvYrXV3+apGNMLGrm8AbSTRhmpmeYyLdoijI8DrUKs/RmMQf5RDTJ1TXfRSO7OBmNPHm
 br1kgz9hstqOBBidmSeFXGcT4mQSYLd5dnziN+zn/vnZ+GTXBGq7smmE8ChZRqoWHt0p/u1NH
 Rnk7egT2HxL7MYpnA6+r0frK3QSe8EWk+NlCw+XHci5Wh78ffTes2EVLbv5dANOIPO7HMEmhX
 D3NEajEeApw/bZ7R6Yb+g0EWwBSojMsbF3tvBBRrj+7tFeYhBX2PV+GN2rWdyM6NKTYgglLpN
 Kzj9B7uYtrsU15kY1iml9puTLyektD9m1B9Au0P269nt3I74E2TbJlNT1T0YOUP0ZVzvlzBpS
 Y7sC4tKdG6nJl6fj9cd3+kSHNCU/pzp1z5dEuHozdn5hkBM/wuimmwhjZIZN89zQU7DuSYyF3
 QdOHBCms7UjoWKr1RZbf+lbOZgU+rCRmDTKFn6iRTXimRX40hPblcI988omms7JSZYrQafWSR
 ataqTWWvpIVwfJbAXZ9Ker76RFQmzfPHzcVhksOUV0KNitgWwxLJt6E5nq6Gb0Q+UJfdbOivD
 tZDDbHdoJYhkCJkDjZxeZNk6f//2AtdVIB5SaswsB3Cg1eWHskFc8C19dPFWfne9THPotddGO
 SF6OgcvkZXtwXmV3BcIokbKIT7jRILrvBnzAfamcIaWnqy0iumLlOmsVyQRy3rkBjqMZo0Ebx
 7B7+JY+1iSRptLrWwk5sSM+eRTFMGwFNlo+unoTVEz54KdC98iafBiF7TS5UToT4gCANYcfDf
 6bkaTRKCh9RYzX5Cje6G9IEdg2F3yT6DKIRs62qZL33KVd6xpLjj0liH4b4HNklronHINVlU+
 yAK7QovlfeYaJgxWvmNC6OEmXmQqCU4wWwTO9nPF/8GbWBL/ajMLiJYZ4BjuLtsqE/RRwKpcH
 BKObhA/MIkOqw+eoIfvsr6YiyOGx612l7sRHiCnP5UTSukf1R9KGZfQMxhGuUyTXLRT3GZX2t
 JyYL5D3NHoJa+5EyV9j3287EGHUQAyJB5FDiXLzdAvbGC76PgReima61SHu48Sj0/M3NA9RUh
 +uMjyccMIvhMVrRcnPL+DNlPaN936aDASFTn4pmC83K4M216M3TXhuf282iwDjG5Je9mCY5/6
 vYMvsIJz3Ztzvc/mr3TAa6D3dYlm0cBvIeTMd15yHi3BCyfXC6IDPGaE83lmBy43Z3rLPMlff
 SfVrS9M3W8ImRO8Zi9M61iJalGZlfn8u4JZpw/CCHsdlcLbq2SwsjvHA+HkmSmqr/v9cvH9RC
 uB9vKn1HiywRiwf1O/14a57JG6UUj/a9X2mStet123HeEWs+GfSmRTly9LMsE+tOApG2L7Ylz
 DsS7L2NX/E/HnKQFcILx5C17yL72st8J1LCX39DtVuJw5ayxIMJ/nSArPUmR/pG7+8x2GpX7E
 QqL3VseN90a06RvkAKko4ONp3pZmq/0FvHrJFBHFy34T1l8OTQIq0Y7T+fF/FFZrxsKcFrt/i
 pJpvBoyKG7QmIRveP4PCkGgOFNWHKTZfkVw3DuuZc2PS75dopfRG1vtiyPYn1DwGQOz2zVNo3
 zkj2rNIgxc6C5+yFSIdoOnOPb7mwzCJPOi9Bs1lv68r7x+UiYyCh6pdGYB6Z+sOyeIpSvppxi
 v7aGXqeU8VQL0UtdRa7MZOn4t6kSWmNML+EmsU9TVGr5H+mUjlx00WWIgzH1FGBRKdYYwd4E/
 20dQZQGA7T7DCSzKQuy8M8MvvMB2ZLOPW4GV7eTuMaaST9PDJAMW+ldkwFEb0EsWDRFJ5a3cL
 LIlFo1ER4zLYGwHIN7rJK3XfYG4/X+0Wog8eg2vHiO4dxOvHgQW9PvaeoFuDOiPq+FzXVqHAt
 FEkPY88Cfo54drhxBmKT9tmAl5OWz9IUaGkhH6ZftyzPcprr+8z+v7axh0Nwmjy6BzPrpAVDO
 MFWqb6l6TLXljttYtZqXy/EfZWZKWrwQvwmOZ/y/81eFXb2n1toRTcguRex0S/CsYsokLLwdq
 GTff3Bw3d57lx94D+1joCz0O7AeaUMutcdRjeraGhhYAuF6nSqVjhAjwXUABsECvORl9YkOsz
 DOAhmA5vGuKwG2Og9kjdhNV86SRx3O0H333dn/6fcSewlVEKglUPFlphDWyIoVv4YH9HqyCG0
 8CE2zJORMWjBRG8iVE1dNT8AiYfkT29ooOaNOX0Of89m/ndprWtsuKhzFdtPogeIFnrZno/F2
 rptyyaQvo8GFV8sP/j7GpsDeq8E3Oys5DAvk4ei+4o2K42T1hGZusKtYl45kyCRA5gUP4IEtE
 l+AAlxGY7GwPYH6xd5hmzJ9r7uLCETWO2RNDcNJn2mG3kMTc+wh6UtZUTWMyUcTmRuJf7IDUv
 q1MUN5KcFwVv+VAbOqvrKug2pddtEKTnY9ibPDNNNO8AR9q7FL9lgIGNSXbipRu7Y5GXu5bgA
 Yl0P4mwo3aHNk6f0P3GbVcLxwFwniHQiLQ5dIkRBLX3eWZDmcFn0os6QkRe1MhIatR+hfiVda
 PnpiihwKO7wYcbYhFNey3c+D6yUWYWKRsOFzpuHV+/k0SkVQ0RPq4rPBBe7zmzaoQjEAQZWcL
 D19jbNIGLwlL7qIh9hmi8x8GtvyEy2MY0pJ6Nu8Chb3gtJHQfEtyNg0F9TfvtHuudCB6gjHI8
 ne2Z6UjNxhgoNWzrT7EYPRT4mHnPvKmy/CESgFYN/LRfSfgxJVf5Z1lh6dpQHtcPfjvQlhGM8
 nb8igkZta2kep5OOEGvPimkHTUiQZIj2u4f+lkTwbdBo+9pUEfL/mLba23IDOvfq6hV1bckft
 itqb94eyuc9q8392KuRbl1eEgk2maj3kvfHGnV1brzOPii1Ib6vaoaee76lOexCUEnI8rRV9F
 t9iAxzkjjAhudyGcA2VotS+/yUCx7kF+ch4zMnLOXqmWfJRALXYY7MBKtDrQqJP36SpmS02n/
 Yibow8AeI4F9G79o1OzUvUZTSK16jcwwSia7yVSKSUJJ0ZRNf49UdgxhplgdaQd/Q6kc2nzKE
 tkdLsApNYjleSlnuIN4pcK1FDafV9kHxJvIts5K/A+Kr55kBM2+K6BgN95+r7WOJnBTMbhB/O
 IsX+yZuEO5fwRFKStTw3A5h972grnDyLXBCrpN/oDX2N1ogjkSTtpTxdFcPOnaL8JE2qsEJxU
 kWb/BpWJA+yumCDRWmKys7QefAKiCWMnImmjqEMMDnb3PmxsQvcEaBOL3niz9M6F1yFiSHsPg
 y3jhWYvhypqs/B+K+gJdTjngpso8p8i/gQzpjN8RBkJOPRZC0UnYVO00XKXrjtLHT2Yf5CsB7
 48N74EeFtSu9KIkDKSyWZk4QM9HnUBb/LYXXYdGf9ol2r24zT60p5KkWik/4hCLKJ9u0yrUDg
 KPxYF6VeBZjbrJCx5TBc/FMuHekhLDxkf5FM/Dcmz3kJpRyCnUmYdlf7Ypu/eiA+0nkXYC18I
 UCzeTBysujLums6q7t6pAL6K8UMN/xq5LXpvyeBojOcIptHfU28pwW0mOdjRFYP9fiGOQFsiu
 Py9VsaLfeEwIoBHfuywbHigeTznP4HKVXDgH3QH3v9HkXFksG0ixU3WCSI87iUwnh85pu/wHk
 dMj6dCqKG64TJH0DdTP7+peQM8uWcfYXO+SpoZWC81aF/M1ls8TH3fCYd3qxhy23Sh0k6JHvO
 5q13e+23UKfxKYcEsgjksV0BMKVunyDrzOOFvB2gPMDM36H/B2xEHGwhk9NMxBbTWj9JiA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.li; 
 s=s31663417; t=1779549573; x=1780154373; i=and@gmx.li;
 bh=ia3/2icpgBzW1AdMSNwFemWrtCqgw5d02/JmIaU/LUE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=YD7La1ydjSzSnVPzSVLC130ASe4Mwz292xYxiA/R7PyDX8ZP4F94E/WmQzyf4g3o
 qsyfvPrWJ5gAfz7WFzwAyJu48ttfKiNj/01p/sD3rkgV2JsO+C1uzizUb88vQoksV
 PPil+fm7AyiVFQ/SGIqiyD1tVh3HoE4b2mIAw2wMWlw4XUXermEqv4AHWGaNbHTdm
 5i4KOwYqR2h389uMpMMnoizytywmwwAZxswT+18GoSBjhZwCXjKcGfoq39uc9uR96
 rP1s2+/Z2nBZpmnJiSGtUykSwLo3+xCeztjp2hqOZse60VFTr2PGROPd4qftmsmiL
 l9pALG5ocXO1JjF3zA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.li
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.li header.i=and@gmx.li header.a=rsa-sha256
 header.s=s31663417 header.b=YD7La1yd
Subject: [Buildroot] [PATCH/next v2 5/9] package/skopeo: remove lvm2
 !BR2_STATIC_LIBS entry
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
Cc: "Yann E . MORIN" <yann.morin@orange.com>,
 Laurent Vivier <laurent@vivier.eu>, Sen Hastings <sen@hastings.org>,
 Christian Stewart <christian@aperture.us>, Petr Vorel <petr.vorel@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Norbert Lange <nolange79@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove lvm2 !BR2_STATIC_LIBS dependency

(It still depends on !BR2_STATIC_LIBS by BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS)

Signed-off-by: Andreas Mohr <and@gmx.li>
---
 package/skopeo/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/skopeo/Config.in b/package/skopeo/Config.in
index b0229873..91d10d13 100644
--- a/package/skopeo/Config.in
+++ b/package/skopeo/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_SKOPEO
 	depends on BR2_USE_MMU  # btrfs-progs, libgpgme, lvm2
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS  # libgpgme
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	depends on !BR2_STATIC_LIBS  # lvm2
 	select BR2_PACKAGE_HOST_GO
 	select BR2_PACKAGE_BTRFS_PROGS
 	select BR2_PACKAGE_CONTAINERS_IMAGE_CONFIG  # runtime
@@ -17,10 +16,9 @@ config BR2_PACKAGE_SKOPEO
 
 	  https://github.com/containers/skopeo
 
-comment "skopeo needs a toolchain w/ NPTL, sahred libs"
+comment "skopeo needs a toolchain w/ NPTL"
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
-		|| BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
