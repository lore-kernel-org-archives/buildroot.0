Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F91C55184
	for <buildroot@archiver.kernel.org>; Tue,  4 Aug 2026 13:04:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5690B80562;
	Tue,  4 Aug 2026 13:04:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xi09lCR36PDW; Tue,  4 Aug 2026 13:04:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A5CD80B1B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785848658;
	bh=Rtw0i0BFI5gCAYnS183zg1ScWN+MAHgoCxZRiSMbk+Y=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=jtaFZi7rV03UI1UFLLsnt3iH2/7gnyL2DKKbcdFKDIo0ZPfRwmquOwueeEyk3M+MW
	 qjH+1UOulT5LfWZ9ESDJ+QzbqrDOjy0XrhEfs3+Sz85jiRsZ7rVcKKFmgAZKMAwl10
	 wCs4Gju/bPZsuPj8oPvImF9iQXOaxmD9/Gv5W0npKdJvqJ+R1eoMCwdeUJt3sl0BMb
	 NY7I/Ei1z6SSH1AV7yKeDBRQ80P4iIttO4mLroKi69+1Cwyc9Ql6rUGD0bU638xQn1
	 x5HZ663QhC+y5CdtV2ZyALnRZaaRYeuhqLkEsqvubgLxT08tY45R5oyTyJItmSzWDp
	 Ov9la20Ty0xZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A5CD80B1B;
	Tue,  4 Aug 2026 13:04:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B351A26C
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 13:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A591F80B1B
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 13:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P-Df6cSYJHic for <buildroot@buildroot.org>;
 Tue,  4 Aug 2026 13:04:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 14B2E80ADE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14B2E80ADE
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 14B2E80ADE
 for <buildroot@buildroot.org>; Tue,  4 Aug 2026 13:04:14 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MYNNy-1wMty441ty-00X4aR; Tue, 04
 Aug 2026 15:04:11 +0200
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Date: Tue,  4 Aug 2026 15:03:56 +0200
Message-ID: <20260804130356.1101294-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:mjwHrQmOI8iTBP0/ZmhY3I1ZJgbYZaGdm44w6JaCHfyHD+Z+Qmz
 NGVXUpliIW4Tm4a633frx23qEVOllkhdpavn8PDOU53XjoRQf/juPhNnBxubHnVTXMPmFZa
 dW3dCtKM68AywPOoeEjSqSJLKH8cGH3Zbqm0u+y1hp/BX8OMyXcLIRI32GB7qvZV8S91Tgc
 m+Ci8Ap3612gTzSg3Aqog==
UI-OutboundReport: notjunk:1;M01:P0:/PHLu2LuPAg=;GjG1InPmst4xAzjTW89wwgiiQFJ
 Vdq+6ADI8h0kHKk6k0zi/d2+b2Ts+Y6nvGMJUjYeFpvxhX9oQYs2rJL4p5YoTxnz63KalqdpK
 WUX4LvSskfSHWlSL0rPXqqO6G8i653N0i/Z0NZsqhh/XihgdNV4Nh7c/Px3cBA6udpp+KF1cj
 0+4AhEz0Ao3azpG52lg1uy1KV7U4sfaYt0ng1Ch33rdoTzZ1C/Pd9UcqX6uZcN9m5HZmt8Hpi
 WCUcrfRS7i3UDQ675MQQ95VRZ8ZyV77URKBvZg+DnKz49MiVABSBRXAsw+T4ja8lLtuu34lp5
 ckIwcXQNapU5DwgfwT02t29C2BlGT3wfbvUeiVlWdQKhB15wQl7jFayne6teiD9VU9e6yls8k
 d1VL9eSE5154pbjw00wC3jKJ4P6BiXKWg3tWlBfF5LANWmh93waDdPrpw7DeDqm+bFZHbkZ7p
 HajFk9vr/rk78swM9A70xPGGQBXTMr8QqKZiE4cPVViLA2uCc0GZZek8JFudQqFq8u6rimxJ+
 fZkDguxulhWK5ZWFKxGF7XYzmb8pvRCUrHPj6tFImJjg+K4X1STAvAIHIOPWHL/4As19ffRzk
 f2EXJBudkkHnM0qMuAKTWWVWt8EPbtbS+xVihJzwOiel4guloeeKGH9PfPSupueno+j4xXomF
 3ZpCGHLJnCFC9FXfgZtn2XsXNTxqZPLMzF8xX+iXASiE5XgMg6a6rKs46purlyKLBkdUyjCCJ
 kLCe13XrkKci3IhtHCqT6JrypbD4q8Cr+nGZK62E5f35rwIdWwsL7UZMUF9vjL18/Wnt3pAWZ
 R79MwTTYfN7zvdyZ2dIchxCfhJcuj5CX7m5WeYET/u8HR3ucZfgvRq3p01SGrWQ9GoBkw/wFJ
 EUfDmm1WvvzaTOsSCqEkBoqhw2hOMdas1IjlLRVEBBMenodiaLQCZnFELURLud4AdveNLWh5E
 MDp+TG/Jk49okKCdG89ZKjDKzkDGllZQsQ3IzbVNJxFcVvvqcncbukfqjWHL0BKgAS6kiBDZ4
 9pWqba/wbG3R3WnGpBMeF4IraVxGxuhWdYiMW6CmpSKyJSydLcDA++8hTTHciOxciL2jmhT7s
 BrV4zl2LtLFvqCAUxiVeJL5UpuXsqakxnCP6SgbS0+HaDCM0ISJtfw5OUqPMnIk1qYQQBY6Mb
 V5QjWm9IUIz7bcx6LRio3m7Cz+j76Fazrae33aH9u7meH2r27B16umG/7f9Arnvco7ez6/0af
 /AkNw6K40F5Ek/xADOxNJPb7Ms4yj7Fpf1p/f6tmVxh9gDnQZfWq9x4xt1L8ov+k+9O3gQAPF
 xFcuK6ajx2HL48GgX8XPHeK/HbEaw8xU2e8isqQmNAcdNTR5YKdIch2Tb183MRiN+C0L9IPqt
 Kxlrjx2FSTWsSD6AofE1AFqje8wyLZbvVs4O4p4CNx74aHy5K9LRBawS9kzeyHrCyL5E/aHb1
 PPkJEjJhY1I4AremB7xWeDT0IBi9xptllJymv6Yzg7M+ju87oceyNRGSZwqFpWmVkoy6M5Ode
 xLHnllVobjJd+A4ZZ3EMQrlFSDq8snK4tMjDS+6JD1v/g3P2prH97xNV9FTmi2br3brI8cglH
 4mZsYF321hGj9OBG7U27a0FdpEWsLjeik2CPNZ3srHB7SjaGADLXEhUkiz7led5G6yfyYvshh
 pLUWO2OM78DmtI+EpIZMuyQ+rkXSshGZAVZWAVFkSbS2tiuxdA1z2/VVrDeIoNKK0XIzJqoML
 de1sPKKpSz4KylRoENZMnRcXO9cFmHqvF5PmrZiZOeSleRA2NlmWGX/H7QF4QGYJFfanABb2B
 Lapsql1JMMNlC4+1/+JCnmt3+TD8lsTh8oGolwSgL4Ek1Q/pY/IWdK4nPgYlGJsfoaKfs6LJa
 7KhGe3nR7l/HoAcdjPB2XWnWL0FwLZ1lsttj+y+5qTeVaOGHnW3/Br/F1vRZZdt95jiUCYl57
 x0UwMjCd9U5abODfhWX1+8q7q7xTyQyNqL3ObGGO1//NKmuyytsxKZuZyZmy34eBmVrRXebFn
 rw5Pvrjc+PC8SpSLoGYE1tl2jIGMD1jsOBO3uVjjJl4FvhlAQfTxWdFfjh7HzjgIk5DJDJUQ1
 54jOUNJ1BwBYCe60nqmkLaudR2tHKj7LAHl40P9JHX1aXlj/sqgE6U8Xy25I+WwMZtO+4GNPx
 2wg1G6kZa2p6hotuaPIG8NkJROEbUkU8vO5JLLFPPENP4hhygX0Q7f4coWgJlWPHnGujChp8r
 Eo91+AJrtOb7/VDsLghb/CxONwRvGQncVkqRtiyTPuQqZhz6q1A5S94Yx9J9xtrUmRHKkIdtv
 8Ussf+l9uczSuoGDqHTYqur+eBVyWYCBSByOzh1AsPBNhQyzZstx7muiflZevxel9fqYTxG4u
 fCBVFxvtOS/V+z0oi7GvYnNeNXVrLFywD3EfOKtYdw9PQ6UxvZMqCJGcKjpbifJaaRVHAIg8Y
 cRlLBdkFtRwxBLOnvzq4Py4ehKhCL7WosL0cwKQ2buTBpZuq9lasQU+FLPGxIVKJGjNTtd2+W
 b9o0ihe3okGGCYM/5l9I58mOq+1ZyN5xpfO31Ts5kREqD9+LOd/e4KJEHL8sTpStdapfAmf1D
 L42GO7a/xmnRnDzvflzhx3uIK5T2YaIdlE03PCMZqJcxjYf/4j0U7PSwGWc2it7s1ILpkzh6t
 sAT6Kp37+d38I2RvsV5r0qVyp4ymCwbLGv0s9Ap/325x082tGgHf+vXP/0EvFTIxcL+7JLaWQ
 jAdzADKDcXY7bbxhmIT+Qj+O6gcd8R0gjVqUao0PjGdCqqUxFd2M28KtmUkdyaHcAGcrBq5ba
 tRKEJTI3VwVnUCQQqkeTn9kwdVXmqVh71Pla3gmN4XprFpmUYmrPHkBRnC5tQarZGWecm3B2f
 GPfTQzt6ZMs6oLL/ebqEmewfoWkKIRqwNk2mPpGue+8tjJ6Y0fuffLgWY9/Ch8BYk+Sn1J+Mg
 2ExB63a0VCDKtA/tv/BtTvo/SEnwBHgb0th3ocyotAb2JCyS+j4TJxPZRuqaqM/76pJzfhzvm
 G7LIZm3qGRrxzadb58+IexqZKBo8uB8GHfYgOHZVPr59Kf3Yex1YHSorpNBSovU7jx1IwQ/T3
 MHb4j5na5g+Tvq3ia8hCWBS7leviXAHaS4bP8qXYS0fjFMhyZUbTFtAcqrZ7GcJlJ7ByqK5PD
 JqU9xc6LTqkwmup7Mbl5CG9m10iuyep0cnqNXqblmRb0RIM/NAPE+ahtmaopWW/WmPd61TWoX
 dsprmESGt3LTsMUCDNXYvFZsKfoJUV8a/GYlBZZMCFzwnY/x41/Qy9JIuAlVYbHBzsQyAx+Aw
 bYLq3HIKQbaQqdJ+NqTlilaUmkLjiTx+ZXZeccJ1qICOT7JZ1VTh1NGMwJACUzPwLYqiN+lRA
 YF7tiye0ra7Dn0RUkxDZtJR1Os+HLmCtZTF5KUP6Gpbr2zyAks5+stsZyyp2zd4lFE89CiYBf
 X91cQLuDxMT/WDsNpQXbBLXSQakEXI3p9DB6AG2L+B6uDo2TlAbI9iHwqhoxwoXmf4wEqGlcE
 6wcd8A23hmyMNdJN0pPjTEGwlLleEOO5dJdfbSQRcgcjZH5sOERCVCPGxsyKQNDyqu9YViXUT
 0/4ARzFXorz797OlE1Wn8E4ddsGq1hdujaIlsEr8dMnvPmJAEk3rXD45LcdgnsPFEW0zWQNaM
 P+gxrY64A+F8UD6Ztf0MqUx2gdiOkyAaIJMk5PJVsEoA5GxUK0lDtVsLgBUHKWyrSZM2GRJ7+
 06VHFLekGg95LIgYzDBimzJZ0pAw/H/NGCgKNgyKZuYukj3rOAIkYcBeRVooxbROnciQE/EwI
 2KrCf7Y/jnkwUnwxovaNA2meBhYlASFd1MEh2aqK30dGE+0t4y39kxKXSdscuU25hCqxhaJYS
 RQ00v0q4sv2CcPPXkj5xcqlbbFYqNAdStu3DWKqShG1eYxFWaUFxf5q7+NJgpP3K16GKW0LSY
 LqURgZZPsCEIcHTIBv0obI10UWXKjC/CVAJGbLQD82hKm54RpVsfJ/tyYfxyUqyCNBMQ7CGLF
 gyVwz8ujBcV1RtfVid+/Qt9JCsHSnc2McpbXXU9pnTUFZBNKX9FVFv7uAH+Llcfa8jeLJQ/nC
 iG1MTusxlt7iBphK3HapkVVXdk5gwNNNM2tnJwgwDXAjuiXFi+4BwY4bYmZSEyy5goy4zNtQF
 M1SKLwwr04CiSwdfS287hpxlx1dfh/k1AdHe2Oxpmw5GBq6LbfJgzj5/GQOZbyWNkCzfDSni5
 Juaf0OoEje4gQBMNzFAI/914ulovkKmIQ7GLD/xNUd/ViKkaY7GMSThRFWUTdljHRXx4csoja
 KvEnjY+PjsUWG4oozj71d8ga1rJBYA2J6hEOa2CLFHb8Efg4qRR9o7RiYD0uddHyqTQk4dr7j
 83EPOT2YOIUa5NBhcdJRQLg0YL/S6+R1AwNQ40pTuU2Geqhu2D1gPUZeCOeRUK2TZvrTFQiTG
 YCImgTVIaSkBjlJKPmU5jWWMKT/nUexcF0UXLGufozYlAQ72iylAMnDRN1FSNzNfDFVazyVNa
 W9OUjlk7zRUzB+WkzWOHKH9Mw6u1N5mw5LWkcP9NETJIR/KXGrWTKLsCDFvrUDH2LYESvgolz
 QwUmc+DYOPLdzePiyhVF2MaohMBMhUm7Sv01aJWnI24MGq+tVqFyem+jj/5TLd9AA1YajwblH
 vmLGSwNa7Ob/1ZGh6VzOKG89JgOxY9xhqhTkZXk93jyEF5drXbNfC9X/wjERuHuGwuZ1ymwEv
 edbu0+tgGp3TYh9SVsysYeiOdLpymtiUdWsZ2umUpZxQLNuzdHyPXQs2HyfQru50ULjLAXtFK
 UO0f4Nq+Gaz9hWJ4B65jHj5YeNJzPKXDs/ifGadEQq8hW1tnckoQjA2kCEAeSPa+az2ZmX5sv
 pgw2Svy1sLTeEQPpFprY/VJ6jNDprLHlQ6dixR/MvRvr6dRxd0qjVzR5eoKBkBppN7KXKuc71
 Z3RrsOBSMFOrQNOiO/sSCC8Y0OLCQ3O0sqiWSl5ozqO2RL1CXrivsNxEDX2r5KlsxHMZrZEbP
 H66mEfO65kI9jngLAEIiqNCzF3orozLd+ti68x4rMyHPgH9RtZvT7ge2oJBwerFuiID9Xn5CC
 HaxbytK5oEO0lO15bZBHO0Vafe1Qy0mXVt0hVRc82fkKHCtZNfOclIiLpThAb9NxznOjQ1YVa
 LajcUJxR6PNQPcgxPfKa8ymyw3VezGZV9XlZiSIUu3D4OTpiuOxC4gtjzAD/TAUlLOT6Ap+bY
 M7uhRo7uK1iSnVRKLsX3hysiTyTDQW5BYxKUMXr+EPLCEMUeAnHwziiaKiMiCFBGy6g/ydPVf
 tc5+UuFlLAC6KOK38OO5B9dQGFB8eSe2oc5RmkaZEmAGizw8D22SV/nktPI9hrDwkkijkzFCa
 Ua5NaXoWVU7G0jIw1G3eloLwm8Bpv/u7k5wG6dKv2rYMxBES6AgkyxsvKFihDKSLHVp7hWh5h
 gEb8MvdSoqPqjD3gydQZPkZnXlbOQpxosSuGNp/ymKhcbxVH5X/6ZcmwbPedyzQ4AMRhUMmge
 FiPiEAEapnP/3AtqP6Jp0XYGdn+UmK5EyW5GyZPTdApyptCBgf7asnVOgPJ/2FWc3Tg/32OLF
 fQIphn0pBIQ88An/bDH07EmyuMGoAKjePOE6STvTLe6FCfKO4rQGG21zAEOY0Cr6C2OofQVJE
 P9w85MIl+oc2grW6qQpDzAYUK/V5aw3LkzMFHguQPvyu4IndFufMCX+JCcPF7Gmk/INvbZ3dy
 8OLhm4K+BAy6TiQ9MLEBUGyWvjsEsrs/WwECo+lee4jJtni1+bAvCXNjZt/bHiTr5BUwz53Pk
 DMqWX+uc6CgY3E7Rg+F1RGi32PblGd1a2Zbf5SMd+6NsncynVHzd5dCf9KxKQ4saqQrya5l+x
 nyTE8HYjy+XeogaOciGpJPUEb9JYKey7jXGQbDUrJWT/gAsnUXyBCQ1/pOScu3BfQUE
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1785848651; x=1786453451; i=fiona.klute@gmx.de;
 bh=b7KGY8GPqkLU5pH7O587gRE/aGfpyt0dRZQYeGLjkT0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Dnyn32jKN6xAzgSe4agmkgkxX3eq46hzoORKZvKbQEoR0XfTKi6i9FANjFuiBV4H
 R2rtNmuA5n2RIeruvKXLxFzokOjSk08bi6xc2ADD27QPcTaPGRr2pR3/lTlbmJuJI
 7kQka5HmnvdwEeUcE9meqCeQk+LzeXFyuBkIj9smbQyhpl5ZhXkW3kQzrrruFM+in
 Bu9lMfvyob7JVup+kUvbtETFqe4+8yYA+pE0O96DpCQuuvK849Or3kkbOGDmUXcbO
 CeumWDMVX6SPAlIrkrXJeyi2RZ3HKsA7gWTYeftSQ2+HuXtkmkYNOtpOcNG2o4VYL
 F28LmXUC4BP8YtO5XQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Dnyn32jK
Subject: [Buildroot] [PATCH 1/1] package/librsvg: update project URL
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

wiki.gnome.org has a big deprecation warning saying "All information
on this site is out of date and should not be used." Point at the
librsvg project on gitlab.gnome.org instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/librsvg/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index d74359dfc9..9f5c2f388e 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -19,7 +19,7 @@ config BR2_PACKAGE_LIBRSVG
 	  The rsvg library is an efficient renderer for Scalable
 	  Vector Graphics (SVG) pictures.
 
-	  https://wiki.gnome.org/Projects/LibRsvg
+	  https://gitlab.gnome.org/GNOME/librsvg
 
 comment "librsvg needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
