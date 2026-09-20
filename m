Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC655C982CC
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 03:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 354A340B54;
	Sun, 20 Sep 2026 03:30:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DltBYg-UTMtH; Sun, 20 Sep 2026 03:30:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 30B8D40B47
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789875047;
	b=KVxotBR6NYpDIb6tiOl3gw4MZOBcUIrk4YAOqOW822Mvo+wKxzaEJyjFtz8DCC/peNDC
	 ekKtcjtYtuAVIaVDuXJ91f8FQP21tmJ2tpYoHQovgBuY0dnhF6sRemZWZZiFnfzlwfDpO
	 ABU38+9VozkIghqqtRljELfKXor29EnucJ49uS6e5iY2NKVqLEPnKQDv5uJZ9jkEaX5fE
	 bTK6cPoSKmMc7ZKx+8RXfNxmpgQAdL6m9fG2SyXJjFUSiOjzNIYAVKlB2IEhpLrRwZ6sY
	 oiYms0w8PfyRWex2mFfrKhiDHFOvTWyXbffh30q4GdUE95/Xawr5chJTZMkkZTjRA7g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789875047;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=uW/T06mIbm56hPp41NoU0syJfBtLagta3sIWgTiVJR0=;
	b=DY7gbAmpKqAVD3nO2NmLOOX+LaOR/OSOSIwikWc5j4P4FPXPy2ezMbQL6lN8dFls2fBO
	 D0nQyWFQ29p+xyp++p2Jjbi0PObSYtxu3lCNW87JCNP2DY9rP89IoP1Vz4GC4MaVP8h7u
	 r2ShX8N21qP/eKqnjyRTjyMKlQ808MG03V8adQQ3mJHRUQn/QUbuRDdQDSbuTxPzwoIKW
	 +n7CbKGF7Cfyc10Fu6bl3CFs03AxcyEyTrOlbNvZqwA0lFVg13IqY2yWZqKsNwTniB32Z
	 5NcNzUgEVXR6hODo1HfaK+b1OOe8t+yNCBm8GK0+CmWcyW6UnHmzG9EzDmUA7S/Ig0g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789875047;
	bh=uW/T06mIbm56hPp41NoU0syJfBtLagta3sIWgTiVJR0=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fOtn6TKanilkKKguKQ0dQZIxwMx8zGAEQbllt4CxBWyWaSxu517ZY5gcWRHXySbho
	 lzpADMC/xtU17x+RckuwEYmOC9UB/Z0puAdN/gtYebVYqxA0osD6AmA/TxBZFGKtoB
	 rO88TTEi15U4eGS3Ougtef6AmZwxImI0F8FDhIDJbiPzYVzlXBYlQZ+d4pLx9TGh8a
	 6Y6Ej35czq1Bvic3lJSSun5bh6ItTCQN9SMFNTZkDSvNTMm6mm7TmaHH7Y+/mY/aaA
	 ValEZk25nvRnZnb020mblTvZVRSncTsMjXosekJL7uXGjWZPHdZd/V4Se5PGs0/JaI
	 R+XY38jvFgVcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30B8D40B47;
	Sun, 20 Sep 2026 03:30:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5ADC4392
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 03:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3FB4340098
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 03:30:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yyYwGVodyxby for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 03:30:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 0C16040062
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789875044;
 b=kEQunKU+dYEgEf0ZrunkIRqosLDOLhzA3FOix8YoY4dEzq5/S875GC+eeh4kgmf7aj3b
 z1Qs2ShzfYjtzTfVssO9uJ6teUVD+BMSZ+PR+IOt3x1fbqPDen6e94GFsc9HY5IQUE/yQ
 peudO/b0+7B5flpLyou6LKdx1vKUXJTWT+pCaCpqER0dHGIgNrrLLMYYheQRmOiEcNFsT
 YGFJGX0nedvhqCon1PvArqN37MlK94Mp5knGgh5FperIpyXPLxMOiIrml0hSr2Y9/tMAY
 lUuZ39622HvbhOL4PaizFCt5BCEbcEZkMXoDk/CsbaR/g8BuPItBuhbEwNigcm12mFw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789875044;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=3zlZLjvHsNz2yTTotPWKyCDfhCaKtP+t2cD4ZOwWs60=;
 b=msk2puQcMmzf1ifmeECSJo8oQF8OahmY+Q+pu/zaUd3ewV4IMc8nGpm87eCCNKYqgTcw
 TFC+i7CVOSrTmPKZ26oYM/OFj8Kx54iIJUz1or8KndwwCf3skp5WmfsispRIZN8sLHUq3
 aRh3fc3uipuiUc+5gIhCsop2odiRunfNi2aup+foEQGZWU1vV2FjsBEdUZwXhRZXhy01W
 1P8OUrRsl2nqPINyH+tBRw3dUFUfY1JfzAHjsKuyqDQaCt8gMLU8vVVxa5iO4PBMZdkW9
 Yrw2+BYRdaCdyb6anKm+AWMi7D1kBQ7S7REhlhr4wQG2/Fby7gBgWtFZrANd4UJwOZA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=OfQ1yB8T; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=OfQ1yB8T
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0C16040062
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 03:30:43 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-4843378fb37so848481f8f.3
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 20:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789875041; x=1790479841; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=3zlZLjvHsNz2yTTotPWKyCDfhCaKtP+t2cD4ZOwWs60=;
 b=OfQ1yB8TcNNCi53c+Ylgewj/dbdpaj4M9fRMIHTpSJuKqCd0yULdQxI9swh2vkkE+O
 l24jEm2rK5/9cv+CPpKXtl0GeYlktke5zhfgMNqIaQPddGa2lcFyaV5FsAD2h3zXo90C
 cKzGhhGdceWgG7UaNtattZA6R/qsRSSypmqQMR1GZ+/L7erCMDA7Jo8+UprMNkGjhsCV
 agnWjSEEQVKSxx9MTA/L6/fKqvwnDxPt2TUIYH0UxQi1yAs2UyePZx3syVQUJbDCGb1w
 w929TxKygMSwmoOh/24NNSVH2mrk11+O6EwZ9KLIwXF2/r+CUyaDoRVm+x0l83PUJVbT
 qOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789875041; x=1790479841;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=3zlZLjvHsNz2yTTotPWKyCDfhCaKtP+t2cD4ZOwWs60=;
 b=1MLCMdTO8QuL4OxVdIYaLc9/X+7OzhadNpObwxB/NkbnilFwZIJUXtPWPfZr5jzdZw
 OfvObxqbzoOdhzxHglSVcAKUb8ms7uCRoME0gpF9vIWV7nbr5kZOvi/sz4jJc58XtW9H
 2iKs6J3fy0VTgBHNOetODSFlqwyob/eOr4cCQUFG1qcpxHOzXOPaRFqJkMzdpzz9jOw9
 KcfJcbaN+mVPLLPHgdcHTs2WQPmXd/moRVM/Ri+kl6wr+ddhSU182+NYjrnQxnWfoOh1
 tdaN5Nm5qH90GM0VnnekUGWzovXg9NQLP0vRoHpSWlgCbnxpVxNmHQUbZv4DOlc1OOGM
 aRGA==
X-Gm-Message-State: AFuF++kD+a7mqVpwfmu0/BgJ1A3goA57qDOKeKKH6WRHQ8UUdTl1PTBJ
 so55ues+hvfsM1Oer4x1sbvjcd2uBZ9HP3vFyQw6Bu7eGDC+eSirmfuHSS/Zx9UbF8k=
X-Gm-Gg: AYBFou1HahJqWKsl0D/7y0/ekPNeab0YsKmcTt2t//WPNOoRUEgHFWuyoYYgV77x7FN
 ODpkJ2NOVQeBMJatxgokNIqtgt+fd/ZNEAwWKVzjiJhXQA2G7vWitNMlhPtPQWvQFE7Vs2x0bPP
 2efsPipdctV4PrnasSPMO6fkevYj7qmJQ7KH4lvhBdJpionpmfLvDuorZvX3T3rKTwOY6uhel3S
 p+SOiHr6c7yf8Z3L8NBqIT6pA/0OFvTuSdPTFPjLvLl+egcAaLp2nCytGIScRHdae9GigOumxmV
 PA92nhsMWrBcMO+eQ/M4i9Rcp5nrliVE7uTkWYi9n7jn5yZxEYT6Oq7eEhO47k5O+/KjH5oPish
 p07o2VlWHS1hyQgv7qJphMVuAOnHXQizNAstHUZ8hrsln4dCryYqd1x2Ft6VdRiNC4LKr0+SNs8
 SZVkqyq5+sUI2NXB+TH0OC1UZrZWR3BHxSJ++11esDSMeQooCMBQChRZtP4bMzo2E0vQ3TJife6
 A==
X-Received: by 2002:a05:6000:2909:b0:486:f9ea:796f with SMTP id
 ffacd0b85a97d-4871e36ba6dmr10059933f8f.41.1789875041253; 
 Sat, 19 Sep 2026 20:30:41 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48724593bbfsm10259537f8f.27.2026.09.19.20.30.40
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2026 20:30:40 -0700 (PDT)
Message-ID: <6aaf5360.aec4f0e4.2953ba.84a2@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 20 Sep 2026 03:30:40 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-09-19
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

Autobuild statistics for 2026-09-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  6  |  0  |  7  |
  2026.08.x  |  3  |  2  |  0  |  5  |
    master   | 18  | 22  |  0  | 40  |

Classification of failures by reason for master
-----------------------------------------------

host-am335x-pru-package-5f3... | 2 
                     kbd-2.9.0 | 2 
        ltp-testsuite-20260529 | 2 
                rdma-core-62.0 | 2 
             alsa-lib-1.2.16.1 | 1 
                     bc-1.08.2 | 1 
                bpftool-v7.5.0 | 1 
              cryptsetup-2.8.8 | 1 
             dahdi-linux-3.3.0 | 1 
            host-mtools-4.0.49 | 1 
                host-wine-11.0 | 1 
          host-xfsprogs-6.19.0 | 1 
              lbreakout2-2.6.5 | 1 
                   linux-tools | 1 
                openocd-0.12.0 | 1 
               tcf-agent-1.8.0 | 1 
               valgrind-3.26.0 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/047682c7dddc9ea8fa5b335fe5659c5c591cbdf2 |     
    i686     |           bc-1.08.2            | NOK | https://autobuild.buildroot.org/results/828e7e824b9dc6c8fb0d99cd3776ae7c7dc062c0 |     
  aarch64    |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/57d3e70cc22e24e875d98fc707cdfc00c54ea70d |     
    i686     |        cryptsetup-2.8.8        | NOK | https://autobuild.buildroot.org/results/4fe83d7a4f1529e942ab8837308acaf81ebf006f |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f33d283df8a055d8cefc38ed54017d5b0d7cb4bb | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/c9de218e5d0ff813938e1303c9faffc36bb7adc4 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/d4fad606efb659948aaacb2c75053c48e1aaa939 |     
    i686     |       host-mtools-4.0.49       | NOK | https://autobuild.buildroot.org/results/cc9f861a669e6878bddf64040249ea6e68fdf263 | ORPH
    i686     |         host-wine-11.0         | NOK | https://autobuild.buildroot.org/results/1ed2cd111c03952319c1ee04b527d26c56936cf4 |     
    i686     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/5b3ef414ab8c6801be0acb8066ec85daea3ffea6 | ORPH
   x86_64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/056b5fe4ca230989041a1ed166c1b509f8bb0908 | ORPH
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/872d12bf869717ae8aec9a2ed6295cf8f7e8b098 | ORPH
    arm      |        lbreakout2-2.6.5        | NOK | https://autobuild.buildroot.org/results/ac90563afdacef77096ddd58904a9bcdbe2bcf00 |     
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/990c1809b5cefb898b7b21b00fffaa576fc3650a | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/915bc52e3b0e2fe5de8a5292b5c6cb3524052c0e |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/172265f9fb803dd31f77bf5b8281a9f2338cf06d |     
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/9c2f40933762d5c036022a578f04fc48d702de27 | ORPH
    i686     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/695d6655f52173fb11c04e2fdabddebd832634b9 |     
    i686     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/cdce6bbe178d2d7810d5dce77107c9d041c20690 |     
    arm      |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/253f59daf3bc36fd470e36b947b63bcab9fb9a62 |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/d28fa0d20ac46b781c16558a2f5b432e90e71722 | ORPH
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/5caf040d555afafab0391909cc590c26e68fb3d1 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

                  boinc-8.2.11 | 1 
libfutils-c326ce0cc2a735438... | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          boinc-8.2.11          | NOK | https://autobuild.buildroot.org/results/ccd02cb5592c9a2b0097330b3aeeca848e367874 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/7580a867cf8b538d5edc7fd5be9de0f89f6d518b |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        host-python-lxml-5.3.0 | 2 
                   dante-1.4.4 | 1 
                  exiv2-0.28.9 | 1 
                  ffmpeg-6.1.5 | 1 
                    gcr-3.40.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/cf96e64c3e9eb1c9235844ec116a9832dabffcf5 | ORPH
   sparc     |          exiv2-0.28.9          | NOK | https://autobuild.buildroot.org/results/39061742a31ba08208d65b5f2dcfae132d93dee5 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/777cfea36ee137ba256bfc450fd85da7bc5275d3 |     
    i686     |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/572ece65226de34430608bca23ff3f349334f509 | ORPH
  riscv64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/43a7de47366eca6c832015e3726ea86d3e85c56c |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/ca021c8dd7751c220ad24459474b18bc0ff336e9 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
