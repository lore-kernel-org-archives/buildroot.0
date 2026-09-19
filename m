Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 373F7C982DE
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 03:23:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CE4281237;
	Sat, 19 Sep 2026 03:23:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FfTFEAg4LSla; Sat, 19 Sep 2026 03:23:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5075181230
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789788221;
	b=APtby1VHP34XDqyknSkSENLgmIO2f8gGDtomlfJkmNiL80fL7M6+c7E0EWBNwlCtnQxi
	 GjxL9iZcSBxMQafEVVlxKZ5TLTbRFj0ABEEGYBy7INjQf/mU7AEkCXyXK5/7/sROIIu6q
	 26zav+bltoFdqUaSDX8LY6y718ubKZun+AnLwJCt9371s2I9x79i+KAkwr7zMtph3jIjh
	 9nNgS6kj0T+iAy7C+4UkhtVr0VkWqRrnXpBe9Uiu4o43heyJdSEiLjj8qX1ydKGeuCCrB
	 oXs/jYYVtsqk3ifQdO5sWts3r8VfCLNdec+3bdt63cd8SwVBwpgFkJuGtGMd7DlRuQA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789788221;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Dzeqgs9hSEEmwm8Fl0n1DFJ6VB/uxOD3b9R6JGtM1eY=;
	b=AfRQpTLYgaOOd7Q4TZvGtS62rX+f87W3Tzx6aJjj5WANK00PeqkgLYlxcEF3NlzaWUj7
	 tNIhEwPrai9LzIUbREinYUBtV/eGWbri4odb7cL3LlS9wk1OzyUf0WvnjmAbmTYgxT/76
	 o8FdTkPKmxJCQAjKErUI8p31t2VeKTkftmUl8bvJQqcKHcs41IbieezjUJ0pSgNJKX4h5
	 l9u3u3MiuFmhWzZ0NIXROTHz4H1uMfTYQOelayAWSxrmsxA7KwkNco0WhGIDnU+ctiCfS
	 XHItUen+xQzdt9CSWprGWeqPixPAOw00uPTjsYot3uv55OVQWfBMhVE204CcMZtEzDA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789788221;
	bh=Dzeqgs9hSEEmwm8Fl0n1DFJ6VB/uxOD3b9R6JGtM1eY=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CCOox3cxOjc2GoNWY7jXMfOfw1KOzo7t8NmGwLyWbkO30YivNJvv+qaRi3VfTnkzH
	 GmYhloZD0WHI/lqtA27QZGGvwHFZuoKUmzLy1xhQFcnW250mi8cD49tXmyS/zD1dzj
	 DmmVMEvW5G0X2VGeT25GBf7Q/8RrRz8xv//ePOX3d1n4ERMOtFwHddzB8/1dF5830S
	 w+sUZ7j17oF/HBFzbk3dNElR+grhw5Y5jCcaIzJIEL7Och/JeZyULDpuIji4ehYiNi
	 REt2NeiwWuOBRjfUQgt5NpAIjHyWbUjcq2RIpwa9vPOX2HjDwO+mjsEYXNTBQD1rSV
	 BWdgGQHCQzFLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5075181230;
	Sat, 19 Sep 2026 03:23:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CD15C362
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 03:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B35FB40BC5
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 03:23:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jbJBtMbEpE65 for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 03:23:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 3B3FC40BC1
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789788218;
 b=D8lhK4MjDsVKSeV8H6CzayEJ7ST0lmxVFRPzcCeMofMtHWZwucyHEh8vLbGbQ7oPb12H
 G8S58s/lPkdImARfjLTl53heSZ824wKr3Hh7Fpb7bUnQH/aqqFQu8AY6EvNEacDldOF8D
 gjRQ9ix0nF+7gX6udEnr8ziZO/+EAbRpiWTzTnUpj4Zv9/CSV4bDBr14S1rbigDxf9edI
 M4k4o6o8NEP0Sfae7eWXJam2WIXUChEzsWpDVxV0VvIm8+kjJLaw0Ja58xVe7uBND0/9E
 PXGzWSpIsPhMzZt/MXH+dkYL615OltFt67v7JDPS+09Cx9NMjsxtjqAdPH+zEgUca9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789788218;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=PVIHVxKDvrKTZgKjxay9s4zmrP9N+vOX5WJvPgOphY4=;
 b=OmkOeMDaA7ybEdxtqFu+Q7wWbo493bDALuj9s1118QmYx9uNrNgfJ2tnzsWBCy1sNK2L
 T4gfzQrJd/DkPM68A41AQkyRTXRx3tgBQ6/Sn1StLYwoOtla/qxZCe+S7sUvede/lx7OG
 JvF+Nv3K8Nqx8ZardBb0s8WJKAViV3WeDKQymMzxGYzXXvA3vBXJCbTfNjpM8a5kFioln
 7sH3dvwUKk39WLhCvfuymE+6T4cHsWAOTGowlbnFWWUiB+z25OIkHBmLxndvwQOvZqT8V
 E5HLrcpcAFp7GH6/N+bwD0eIsoqZyzoPF0GCjtxSd63wauSfiFpqTxyryxcrEag4oiA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=DwNV20A2; 
 arc=none smtp.remote-ip="2a00:1450:4864:30::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:30::10; helo=mail-wr2-x10.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=DwNV20A2
Received: from mail-wr2-x10.google.com (mail-wr2-x10.google.com
 [IPv6:2a00:1450:4864:30::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3B3FC40BC1
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 03:23:37 +0000 (UTC)
Received: by mail-wr2-x10.google.com with SMTP id
 ffacd0b85a97d-482f635552aso1088664f8f.2
 for <buildroot@buildroot.org>; Fri, 18 Sep 2026 20:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789788216; x=1790393016; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=PVIHVxKDvrKTZgKjxay9s4zmrP9N+vOX5WJvPgOphY4=;
 b=DwNV20A2rQqUYgTJUTPLUL4334tIdSetAYgysD504fzNxu5TnXShY4DnKPhu3yq7ZV
 jgDlig2KjKoOAFVrvO3KpYaJzLOeUzR2QMsWxuhvb/xR17ijPkMWXKh4nck8iMLof/Ri
 M5mQ8Pw9n5hAqeGJMfPhuP6vaNSk015qo+BLcbzo1/t7CDWexIMDFdNVCU8JxDfAdgdL
 J3c2IQviPDZp435GAwweNkSU8opNBix3qySj/Gno+a1VUbWH6zUB8/VTC511dgLmyTlu
 CpKvMCEkodNrCTvgOBozkWPqXMCb6TZDPIYszVw8Q8qkzTbp4pebby+NrZlYEdLNYCTP
 RN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789788216; x=1790393016;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=PVIHVxKDvrKTZgKjxay9s4zmrP9N+vOX5WJvPgOphY4=;
 b=KBcPcT7/judK0WY5FGLAIiXn4tP+e6VzkVE+cT+8Z9/kg43Y4TD2YT4qkudDPdQnTP
 UiD/R2AQtWxh0AlRaLXM2w7S79o2g1fAdYuqpsC7uigg+YiOGXm5gQzJlJmgTcVutQvv
 rW8xn5tabJt15i5hs/7mhNMv8ZK2KZa6FU69sheVYdzeRCUhpRN0mYeQh4K/iPei6Kx4
 DjRTn47peOmjcu4/o+SLqoEf+xYBRD6PaRl1aHLtphC8d2g4EL6hdJbbHBoxAbShLqSQ
 ohNcRBdtc44GzmFBQKNd8uRAjWLSFngdrxyCAlSv+FDGssNq1WInU1opDLtcVjy7gT82
 RdYg==
X-Gm-Message-State: AFuF++muqaDTge2Z3oTkueu/CWWpqTggXboy7k2c93sXCHA4aSKxzM/L
 YpI/NX1HKGUctqR5JjORTHtEHi7cv7w0Qd4iRXSFIWD8/Wt5gZ5JSg5/fSs6wRp0
X-Gm-Gg: AYBFou3qmTVBv8cx8xPU/ZoMqYn46GsJ8SLsjHO0mRNPO4oUTWY7tgdpUSLfUs+AuDn
 X2rtVIpt3P5ipf9ZAt6f9rHqlKDNYYNFj8qUUflCNwJIjVP12uBDZJodZy5gasGV64BBrg6CwSK
 0CeGdVugYzy2YBRWtv7ejNVr5Gqv/lMRskMXGdXh8O7yv4KzHwNl59gMKMRMz9XmmAJTC2RGUe4
 pz9T5M6BhoD1CCkudQnzNJGev3sV+mOuab7dm8/GshUxf7njK0t8dGXuJAeWUNO38Dj3dj8yzvo
 9NLRiDHcu4pMByW2J4Jh6eyvJtprVVf/bBJCJZ4kuY03vT7sD2GKMUeYcROdujscd0brRPFx7iy
 9ZBkGKApJ9XBItqBAiNye6/BxOt4bVcEIy5S4Jk+72bVly9nuOiKJEhDwkxuMwHj9m0FQsmUsDh
 uhXMuHyLNSFzUlg1mtzdbvP0AcUlKQhlcv/U7cAw2oHHsfoUwTvvlrsqD0eufj78bOF2k77p4yp
 w==
X-Received: by 2002:a05:6000:24c5:b0:486:f980:2361 with SMTP id
 ffacd0b85a97d-4871e3b20e1mr6415340f8f.45.1789788215480; 
 Fri, 18 Sep 2026 20:23:35 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-487245645cbsm5078704f8f.20.2026.09.18.20.23.34
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2026 20:23:35 -0700 (PDT)
Message-ID: <6aae0037.63ed6291.2d654.12b8@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 19 Sep 2026 03:23:34 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-09-18
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

Autobuild statistics for 2026-09-18
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  4  |  0  |  6  |
  2026.05.x  |  0  |  3  |  0  |  3  |
  2026.08.x  |  0  |  1  |  0  |  1  |
    master   | 22  | 30  |  0  | 52  |

Classification of failures by reason for master
-----------------------------------------------

                    attr-2.6.0 | 2 
              cryptsetup-2.8.8 | 2 
    host-mender-artifact-4.4.1 | 2 
                   perl-5.42.3 | 2 
rtmpdump-6f6bb1353fc84f4cc3... | 2 
                       unknown | 2 
                   ccrypt-1.11 | 1 
             dahdi-linux-3.3.0 | 1 
              e2fsprogs-1.47.4 | 1 
        edk2-edk2-stable202602 | 1 
glibc-2.44-40-g30950ce64dbc... | 1 
host-google-breakpad-f49c2f... | 1 
libfutils-c326ce0cc2a735438... | 1 
              llama-cpp-b10702 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                openntpd-6.8p1 | 1 
             parsec-tool-0.7.0 | 1 
rtl8723bu-ac3d2f564bdf6816f... | 1 
                 rtl_433-25.02 | 1 
                 s6-rc-0.5.5.0 | 1 
              skalibs-2.14.3.0 | 1 
                 systemd-258.7 | 1 
               tcf-agent-1.8.0 | 1 
                 wolfssl-5.9.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/af8c1fda84b40a5afb39bec65457e2c348ae8be5 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/aaaa1d9c6fa83bf3b9122b77436527b6b58c9046 |     
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/d7a43cbb82a10e57b58f7fa26a5e269ec1c5c4d7 | ORPH
    i686     |        cryptsetup-2.8.8        | NOK | https://autobuild.buildroot.org/results/0607cea4a2dd61eb8eb78cc1909d3dafbff260da |     
    i686     |        cryptsetup-2.8.8        | NOK | https://autobuild.buildroot.org/results/6a21ba7c00efd1e7da4e9cb265c657f73468613a |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/c3430f2499191e6b7eb792aeeef731860be62130 | ORPH
    i686     |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/abf2ba46aebaabc0e040d61d2685cb4db5c58e22 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/7e25f9f08028d400d92d4fa2273129bdc3bbb4f5 |     
    hppa     | glibc-2.44-40-g30950ce64dbc... | NOK | https://autobuild.buildroot.org/results/304ae78dde16ac30cb2839b24d44b67464635170 |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/51943f9395930a13467577ff609ad91a9d5de4ce |     
  mips64el   |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/80af29e801779d243d039f666bce822c2c07f704 |     
   x86_64    |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/11c4c352f132059866899e7a44e9148061ffa750 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/e83682248f5142b86a4e51db682e84af401fd42f |     
    i686     |        llama-cpp-b10702        | NOK | https://autobuild.buildroot.org/results/310d99420eb02462593f6f4894fa1acad7c3cc73 |     
    i686     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/2b1cac00c892c0312c00f035397a637d4a1e0bb4 |     
   s390x     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/47219cca04235760ac18067a8c768a57837c35f4 | ORPH
   armeb     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/bb35a9b477d06ed69e16f4754a0cb3108e6117cb |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/1715d041d79b4e20a77a4b2203f01854e04636bc |     
   xtensa    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/03555dfc94ae949fdb360801b959a5145651775e |     
    i686     | rtl8723bu-ac3d2f564bdf6816f... | NOK | https://autobuild.buildroot.org/results/3a63bda71e8ecbabf5668b4df9157606f0693e3f |     
    arm      |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/e5d44d1fef8e6f60c70f34617a2f699670c877c9 |     
    i686     | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/e64f97c91501ebecda85ee880afe344567b88aa5 |     
  mips64el   | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/70c54f0627d59fc5516b2917958056ce0d822db3 |     
    i686     |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/0df9cd4e93d9326942645f07001ff93980f1878f |     
powerpc64le  |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/619482f460cdf5d610ed76866d4f0f371da49b41 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/9b3e180329452a4cbb131ab0bf2cd201b4808e08 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/14ae1ba6202a8182d0999d2f5b96b68876e39cad |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/5d20ee23033143e7014a81eec0f2e65f6581adfa |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/a24a17f48ae8c19e3ff242609d8aadb3336a550f |     
  mips64el   |         wolfssl-5.9.2          | NOK | https://autobuild.buildroot.org/results/0f791f5ac0adc6c9bf71b2d08130fdd795bf8e74 |     


Classification of failures by reason for 2026.08.x
--------------------------------------------------

  gobject-introspection-1.86.0 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/196aeb31ad6638a28d8ae5bcd8275648fcde917b | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 2 
                       unknown | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/14a5678e6913b271dfbc7ebc136b982a9e6cde5c |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/8fff1174b0bca5a1426af1916a82fe37d5031346 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/924e33580a75e34204d80aeb12dbaa23ac7fd7eb |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  libnl-3.11.0 | 1 
        ltp-testsuite-20250130 | 1 
rtl8188eu-f42fc9c45d2086c41... | 1 
rtmpdump-6f6bb1353fc84f4cc3... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |          libnl-3.11.0          | NOK | https://autobuild.buildroot.org/results/9fa7fa923e532b45dd6fe508a8b51fddfc9f1431 | ORPH
    sh4      |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/3d674eeff8b208efeb08c8aa63688fdb064cf645 |     
powerpc64le  | rtl8188eu-f42fc9c45d2086c41... | NOK | https://autobuild.buildroot.org/results/7b87a4343de240d41f69851a2d7f2e2779ade1b1 |     
   s390x     | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/fa54f8b6b1b4502c84c63bb230ee7a00d5466973 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
