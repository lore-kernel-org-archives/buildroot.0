Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B35C369D8
	for <buildroot@archiver.kernel.org>; Sun, 27 Apr 2025 03:10:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4225440C55;
	Sun, 27 Apr 2025 03:10:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CQS-VJStqJES; Sun, 27 Apr 2025 03:10:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D83B40B55
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D83B40B55;
	Sun, 27 Apr 2025 03:10:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C69191C4
 for <buildroot@buildroot.org>; Sun, 27 Apr 2025 03:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B8B14404FE
 for <buildroot@buildroot.org>; Sun, 27 Apr 2025 03:10:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K1Gs4epH9u05 for <buildroot@buildroot.org>;
 Sun, 27 Apr 2025 03:10:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A970F400D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A970F400D0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A970F400D0
 for <buildroot@buildroot.org>; Sun, 27 Apr 2025 03:10:41 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-acb5ec407b1so592258666b.1
 for <buildroot@buildroot.org>; Sat, 26 Apr 2025 20:10:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745723440; x=1746328240;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5DJ3yXDh29AJBGsxHO0YNIVAtyxiSbCb4lMPEkVoqVM=;
 b=kbFcVhy+GzngufKviQ+mEvejx5/zmMl2UDJrSSGrbPtgGI1eceQeAgcD4fcasxyElD
 NHjivm6ZqZcXBqNYllDDZy6KM7ridJTopd+5FWj5lRevlaqg0MMbrFrZpW9MsCx4EqZD
 zu3fnyKLK4kxcljUMwsZg+ybjblWnTKyFMtgMKNiM/KFodw4jYaDtCher5+L4mT7nk+N
 b+/ShtS32Mn1BsKY2QkBUe2H83YEbVVc6fSmDR7AJzC9pfR982E1LaAjCHCWIqHRh+Go
 ixV3leePgcIlABEiU4Udi4gFxgKn+CF1PU0GveswegiXk4PBNdlGsIizFLzjGcLTBsj1
 rBPg==
X-Gm-Message-State: AOJu0YwCtvZ4RzYwyNdnarUeGj0wWdLgUGV2r9b7u8YzgoS9i14VmhA/
 LVKq0+40k5OaCVPVHFlN4xtuswFaT+1JRyFTayjG50DysfLLxDb4QFa2Ow==
X-Gm-Gg: ASbGncuLQGgaDZS7befAUB5P9kzJwtJoWsNONtl1I9Cv/PKva+MV5zd5hyEnNWyyA5/
 +/fpItsXc9Psz2GGyhIoWbkNVY4Bp/MNUXbbN7NDrNcDE6VuXdshRSYQifqAa57FnI65UChdQnW
 pXYaS5I/ZNoAKS94loJRTPzR3YnrfBEjpOwUGSCwz98FsmzwJt6DU8KG260HzblMxZjYr02r3wJ
 FxWERV/NsE/goZlakn5SoY91P3diEaW536X3cKU6Y7EMwsMqwKzOFGLvESX+Yz1zkvott4GfpqA
 vumSh+/DO2nq6amuzY6JUyUD+NfcpVrrzmZkdMId25BU
X-Google-Smtp-Source: AGHT+IELcLITJV8hWGcpQ3oMdzvTYnsielHpDmwDcdtWSSXct9g9srWwvdqVFKWMtwzqfhTUzlBraw==
X-Received: by 2002:a17:907:3dac:b0:ac7:ecfc:e5fa with SMTP id
 a640c23a62f3a-ace84af6a61mr458081666b.54.1745723439370; 
 Sat, 26 Apr 2025 20:10:39 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6ed704bdsm379729566b.148.2025.04.26.20.10.39
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Apr 2025 20:10:39 -0700 (PDT)
Message-ID: <680da02f.170a0220.2512cd.ae73@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 27 Apr 2025 03:10:39 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745723440; x=1746328240; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=5DJ3yXDh29AJBGsxHO0YNIVAtyxiSbCb4lMPEkVoqVM=;
 b=AYA9sDMNlMsoDBe0yd7VZ93LbgbfIIyYbpOjwDMGifLxVt4JyjiLYnF4Hh9I9sppCe
 h7DbtFwAM98PlaZMJPQnI6ytcMKRlTO8DEgRPFWyMQhje9UH2FHUIbk+52vWb22kRmKO
 0cXebdr0dsk/itYVLy2QO1Lt5kwTRR+zQZ6sjNCR1qL/P5ebhQK5tsvc66R6CTIfkGqe
 Eb5ujWnXqP13UxC9g1FqQb8HV3nqkBhkNJia28fgcOd0cHhbOybKb+Z0nyyKPTo9O51M
 GXaDWw+HbpKUa8hYEEz+DOxFSVNJQMA4xfHNnt0aP9yGY6UkMaE0sLM5iok76BtIPjKC
 clrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AYA9sDMN
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-04-26
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

Autobuild statistics for 2025-04-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  8  |  9  |  0  | 17  |
    master   | 14  | 20  |  0  | 34  |

Classification of failures by reason for master
-----------------------------------------------

              asterisk-20.11.1 | 2 
          sane-airscan-0.99.33 | 2 
                   bird-2.15.1 | 1 
                  ffmpeg-6.1.2 | 1 
            gettext-gnu-0.22.4 | 1 
  gobject-introspection-1.82.0 | 1 
                 host-gdb-14.2 | 1 
              host-rust-1.82.0 | 1 
 host-softether-4.30-9700-beta | 1 
              json-glib-1.10.6 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                libressl-3.9.2 | 1 
                    mpv-0.35.1 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
      passt-2025_02_17.a1e48a0 | 1 
         python-remi-2022.7.27 | 1 
                    uftp-5.0.3 | 1 
                       unknown | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |        asterisk-20.11.1        | NOK | https://autobuild.buildroot.org/results/b2a088710d1c1aaf7f1fbfeec369c1a8d1559d5e |     
 aarch64_be  |        asterisk-20.11.1        | NOK | https://autobuild.buildroot.org/results/c07173e12ba3b861cd4e493080662c2d47e0b29f |     
  aarch64    |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/1fff248995107a69a5eff85beb610d502a94a096 |     
    arc      |          ffmpeg-6.1.2          | NOK | https://autobuild.buildroot.org/results/8763f7261d37a85fe451e662063b40de9216dbe2 |     
    arc      |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/ad60b679702a50b0035ab7df48a2424095caa354 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/7ebea5c175e83cf255311a1bd0cbee473f67428b | ORPH
   armeb     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/bc35ed292c935759f8bcc1e58543ba775da99cdd | ORPH
   s390x     |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/c291f06e23b11cdf8db8a7f1f881622417dd1f59 |     
   sh4aeb    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/f93040196bf495c4b1ebb9bd4f1636fd6f96b19c | ORPH
    or1k     |        json-glib-1.10.6        | NOK | https://autobuild.buildroot.org/results/bd2528ca42f4f18699639b10b9bb522f99f5255a | ORPH
   arceb     | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/16f8d88603e55195103bc1c938a9077a2e0e57e0 |     
    mips     |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/6c46fc536375ff5a7610a5529f5a38e6fce6b204 | ORPH
  sparc64    |           mpv-0.35.1           | NOK | https://autobuild.buildroot.org/results/6ccb9caa227e94a31d1e2012a8ba6a44df6bca9a |     
    arc      |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/3b45d7388778edd801e281ce9d7a3cdafbaeeb94 |     
   sh4eb     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/16f3d80d3b6fff82cf3e326ab3779a03a0daaa9d | ORPH
   mips64    |     python-remi-2022.7.27      | NOK | https://autobuild.buildroot.org/results/5e8a84fba078030abcc65eee8fdd635271cf5e04 |     
   armeb     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/94395060323c8c5ecc410312e98fdcc43333bee1 |     
   armeb     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/15ece6698dc2eafd12787b559ee52d9bfe59aebd |     
powerpc64le  |           uftp-5.0.3           | NOK | https://autobuild.buildroot.org/results/06553e40f4782ca3334bfdc0f5a83ca6ff5dea0c | ORPH
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/f6b2516c6062270ea9c332901bb443da31f20663 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

             bluez5_utils-5.79 | 1 
                    brltty-6.6 | 1 
                 c-ares-1.34.2 | 1 
          cloudflared-2025.1.0 | 1 
 host-softether-4.30-9700-beta | 1 
               ipmitool-1_8_19 | 1 
          linux-5.10.162-cip24 | 1 
                 openssh-9.9p2 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |       bluez5_utils-5.79        | NOK | https://autobuild.buildroot.org/results/78ed7664f3a2dd5858fd71bd63836c822c106cc0 |     
microblazeel |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/ba197991cab95d761eeed4adb7b5292fce5db4a2 |     
    mips     |         c-ares-1.34.2          | NOK | https://autobuild.buildroot.org/results/d25c0b01af8b12dbfaaa874e22d97d4ecea8d79b | ORPH
powerpc64le  |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/1764915c6065216de400d8e746ef514730911a23 |     
powerpc64le  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/3b988087d1e4635e5bcace1af2d1ab1da6646641 | ORPH
    or1k     |        ipmitool-1_8_19         | NOK | https://autobuild.buildroot.org/results/1ca0a8ab616d1ff08a60f50943ded7ba77783a1f |     
   x86_64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/96cf3daf71ab22005b83865532f289fe9ca7354a | ORPH
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/7269c10fdda1800860f31708bbdeb606bf1618d2 | ORPH
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/9dc2d7e641e23c146b87abaa5542e44f733f05b0 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
