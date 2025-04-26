Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB47C369C2
	for <buildroot@archiver.kernel.org>; Sat, 26 Apr 2025 03:09:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5603041E58;
	Sat, 26 Apr 2025 03:09:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QCzVqnsIly_Q; Sat, 26 Apr 2025 03:09:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58AF241E5A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58AF241E5A;
	Sat, 26 Apr 2025 03:09:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 14B5715A
 for <buildroot@buildroot.org>; Sat, 26 Apr 2025 03:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE50982C9C
 for <buildroot@buildroot.org>; Sat, 26 Apr 2025 03:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X2Hm9oBVtopU for <buildroot@buildroot.org>;
 Sat, 26 Apr 2025 03:09:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E7230820E8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7230820E8
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7230820E8
 for <buildroot@buildroot.org>; Sat, 26 Apr 2025 03:09:40 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cf05f0c3eso19486815e9.0
 for <buildroot@buildroot.org>; Fri, 25 Apr 2025 20:09:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745636979; x=1746241779;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sdzE5Kno4XQJ6udJ7i/IcqMZjJ+e7dEp4rVK2DQuJts=;
 b=UfhSwnwzjNSaDVlFxvdv4ciaUYhJFyQqzsOS12QBZTY3Vt3nsZr3qf+x1W2W9KTgQm
 me3btGudCd7CL0fyBYt3w287RszYlU/O/7WGo38KiHabXVW354hnkfDNJKpY5DlVHRAw
 XKFGV9Ilvre23HHoSZrJwo6Ee1oXmAuVhjlIIpuj1JQxB5/3wEHZw3j9NHj99ex46m6h
 LbuKMDVpErW+4S461Pr10hIukRjC+0OHg1pH50AK1lCVxsb6+6cpjUSZVj+bgTzUBCVU
 8AdsPJZ19l7tWoY3LtXFq3Khjo0haj2bupYJEYOlDBVqTxtmHIhSeZUhntRnuUOduY6J
 ZFcw==
X-Gm-Message-State: AOJu0YzzxQflsmse6G/uDqG9RJcjwf2KibGzPghCGQx467SUgnv5FMvr
 5fTwsJUFRSefilWj2bFZfiCzcSXW5pq7AZzYbeMKv58h/GZd2qunYVBm7Q==
X-Gm-Gg: ASbGncvce6xwM+9rCWjvRyeW+nbb9tHydTX0ceR7WI+qqJVYV+tPQ0cg5sDp6v7ACDC
 kpNT2VvDsMjMWv7IDZX9CnYejndEgVJHpJj1cs8FIMngU+aQLVs/57gpCysKNIk1vs3DVOqNh5W
 NwvJTIoqg/htQj2WzVXMaKpzuEGRZn8Vl28PRasTNvJVsxVj61HyWZ1/SXFZXuz+E+VHsc/Yj2R
 8uiurVGyFTDSV8o6kqbEFtmK2RwUYy07kQVqjIxxRkiVOJt6swh/eV96G0odkt3DhaxCnycu5x1
 k5jxESgdNxKQxMJi0Owcyzpg2LLTRR4Q5rMMFrXseQJe
X-Google-Smtp-Source: AGHT+IH+pHyxcQJbzBG3+bgeh/gnLzXTheSHr/HdNbxzsQFenA0sG8voSnQbSQ7VUBdD65MHDhoMig==
X-Received: by 2002:a05:600c:1e1c:b0:434:fa55:eb56 with SMTP id
 5b1f17b1804b1-440a65b6faemr37731255e9.7.1745636978687; 
 Fri, 25 Apr 2025 20:09:38 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073c8d633sm4164262f8f.16.2025.04.25.20.09.38
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Apr 2025 20:09:38 -0700 (PDT)
Message-ID: <680c4e72.050a0220.23d4e5.e27a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 26 Apr 2025 03:09:38 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745636979; x=1746241779; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=sdzE5Kno4XQJ6udJ7i/IcqMZjJ+e7dEp4rVK2DQuJts=;
 b=aLXsq6GG2LzeSGQDEPMMuFJyWOX6q2EbBryKKsR1uS1aX1QtEm30KyOddKmyZI4Ibv
 dcgPSaLlOq/iG2CAFvsiTwmOe99/GU55fC+hTrsUFSfUUb2OP7ODchRd4wkizui4aQ1S
 jMYyAhCE7k/Ty5J3537amsLijtHQeephfjIIKkNkNYBN33jKEyO3NsfiyaXCGbkApu/6
 EMTq4VMr3abrFqWU6RRhwJkbDLNdoG51NmhA1EAaIvGxn2SNyN3VEnRW1x/Hr4S/9nET
 xWisha2UiTLJ0lHNVH7d9Ox7IgX1bijsHU88WRduE907mW9/t7namhpKeGns9Qayussr
 /4sw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=aLXsq6GG
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-04-25
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

Autobuild statistics for 2025-04-25
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  6  |  0  | 10  |
    master   | 22  | 24  |  0  | 46  |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 5 
                   bird-2.15.1 | 1 
             bmap-writer-1.0.2 | 1 
                elfutils-0.192 | 1 
fs/erofs/erofs.mk:69: /work... | 1 
            gdk-pixbuf-2.42.12 | 1 
    host-python-greenlet-3.1.1 | 1 
            igd2-for-linux-2.2 | 1 
                libglvnd-1.4.0 | 1 
              libunistring-1.3 | 1 
                  linux-6.13.8 | 1 
            makedumpfile-1.7.5 | 1 
                  ntp-4.2.8p18 | 1 
                openvpn-2.6.14 | 1 
                   perl-5.40.2 | 1 
               pulseaudio-17.0 | 1 
          sane-airscan-0.99.33 | 1 
          sphinxbase-5prealpha | 1 
                 systemd-256.7 | 1 
                   wget-1.25.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/824425c5ad7d234cffc18612b35456a7bec9d122 |     
   mipsel    |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/fed229f373997f9bfb418833f8014e293b0a7dc1 |     
 aarch64_be  |         elfutils-0.192         | NOK | https://autobuild.buildroot.org/results/fb1daf610e318f0d3e01d1893f7133cddac3c778 | ORPH
   s390x     | fs/erofs/erofs.mk:69: /work... | NOK | https://autobuild.buildroot.org/results/41906788ad6e1e230b7683f20bd9597f1df2d602 |     
  mips64el   |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/da90483dc6c2848d4acf156f9e6fd62b73d41cfe | ORPH
powerpc64le  |   host-python-greenlet-3.1.1   | NOK | https://autobuild.buildroot.org/results/cc63e1f01006f9f31da4099a5c22a966e6831992 |     
   mipsel    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/748757144cf04c5f2f61933c29309579bbab3b84 |     
    or1k     |         libglvnd-1.4.0         | NOK | https://autobuild.buildroot.org/results/f11c4a8509e20ffc79cfdd5e04ed477702064e86 | ORPH
    i686     |        libunistring-1.3        | NOK | https://autobuild.buildroot.org/results/e6ff54b48284c9a729a9880047d902e630a2edcf |     
 microblaze  |          linux-6.13.8          | NOK | https://autobuild.buildroot.org/results/6acf8dfacd949e0fe1f030e0c5b1873aca2a91a8 | ORPH
   x86_64    |       makedumpfile-1.7.5       | NOK | https://autobuild.buildroot.org/results/16fc5fb48dd789759da266f8506831ec54c1dad6 |     
   sparc     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/bb9c291e8d905d20a871e0c5202bda4fc0d04f24 |     
   mips64    |         openvpn-2.6.14         | NOK | https://autobuild.buildroot.org/results/cff55380a7da5035cd5f23d2e632d03236bcea43 |     
microblazeel |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/fb2a3dac9276052fc5de9862755aba4c9601e129 |     
   sparc     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/ffda7a3265d6acb7e10d8d1368ac944c8979c80c | ORPH
    m68k     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/abb25eee280a97d9d551a592ac6ff0aafb8fd1ff |     
    mips     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/3923cdaac666d5fc9b75102de754b966a8fba8b9 |     
    i686     |         systemd-256.7          | NOK | https://autobuild.buildroot.org/results/1f25bd2ed64f466132e402a72211696e08285a5d |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/94c61ff7a17307a15801151a269c4e3ae522241f |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/32227d26284912a26cb5b03510daabeb25185f81 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/df6b6d092b7c81ad3361ab3cc0d8ebf4301553df |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/1121f7f4119b1dceedcf2df320176dcb7f460650 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/b463cdb69a19571ab2d30d01eaa1f5a8f830ae79 |     
   s390x     |          wget-1.25.0           | NOK | https://autobuild.buildroot.org/results/5c0aac11f30bc7e8c1ed64ca0700bf8c5a44060b |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

      docker-cli-buildx-0.16.1 | 1 
                     fd-10.2.0 | 1 
                    gcr-3.40.0 | 1 
                  musepack-475 | 1 
             strongswan-5.9.14 | 1 
                 tbtools-0.5.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |    docker-cli-buildx-0.16.1    | NOK | https://autobuild.buildroot.org/results/8e906e551467cd76c4a5cc1343d922fa64829539 | ORPH
   x86_64    |           fd-10.2.0            | NOK | https://autobuild.buildroot.org/results/04b3b994af34282f969d2d5926d64b3722484d23 |     
    or1k     |           gcr-3.40.0           | NOK | https://autobuild.buildroot.org/results/8cdac16a54492350dd11340e2032f21e3928615e | ORPH
    i686     |          musepack-475          | NOK | https://autobuild.buildroot.org/results/a7b97fe7921afd6301919d127e3a176da27f8f63 | ORPH
   sparc     |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/d0e94f501ad1afd25ae4112443f9af101dfa5dea |     
   s390x     |         tbtools-0.5.0          | NOK | https://autobuild.buildroot.org/results/fc5d99a276d8f188a0de72e7f25a60abb13fb581 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
