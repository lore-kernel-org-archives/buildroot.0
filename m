Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAAAC54FCD
	for <buildroot@archiver.kernel.org>; Thu, 30 Jul 2026 03:23:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CDA460689;
	Thu, 30 Jul 2026 03:23:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tw7sEFTgn14s; Thu, 30 Jul 2026 03:23:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 354C160778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785381815;
	bh=hitQAreuRcpn3SXj3jM/gE/TT7t3ZCxDs8uaZOrVgKg=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JX/EiFxMfS67bSdyBentVauJ1LE7XqX3Szw213XnRyobBwSJ4VTkMlcp8ztJdS0eZ
	 yTu25I0mAx9lhMtrzeqxJaxtGijlbvGzaj4KahoirAbYpQP4V4wJKqgf6zrQSbYeVY
	 Hl5+7ena0K8KgwfvwjNkgondnCe7c2VNAF5JAiAvGlvxRlkYmnPmFySSDVLEKBgixP
	 0Xh6F4hDhxt19pNPmuVVh/iXHaxnx/D05qPK0BVnHQhURdbANNxmMk1mCoOJHRcOwF
	 fri3AQTffpczUV8zOVNj/rCmAWThUXSHlP5MhhhGVI2rmjbaEN6Lk4nipHpt191BXm
	 mZDqVhibbv1jQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 354C160778;
	Thu, 30 Jul 2026 03:23:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D22EA350
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 03:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3F6160778
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 03:23:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cbJECtPr204D for <buildroot@buildroot.org>;
 Thu, 30 Jul 2026 03:23:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4A51860689
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A51860689
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4A51860689
 for <buildroot@buildroot.org>; Thu, 30 Jul 2026 03:23:31 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4954c0833b4so10630655e9.1
 for <buildroot@buildroot.org>; Wed, 29 Jul 2026 20:23:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785381810; x=1785986610;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=jyruXGRPrJwi9Kx4Wgow3bpShy8Jc70TCJPi6rABuxg=;
 b=OhfwGAQOeli1utA7i+bU+Tpw36PbEi8rKm5GnkGbk0kpoNHsHhUpIYlPx5int2eQdm
 eaWOuBMT3CB3j9EFWb0YXEwAjn9OeHTl8h/BY/l/bNWYGW971LvSdoLQNg/R/BRodsJq
 L3BRZeggkThonsylfR8AMaQo1ebfLGnySpMaVaUQ+HgcQJYCA507BnCczWxJBfsoEDoa
 RgTEJ9dP7RkmXYhRcNkWztCgTnyqCh0WH1H7DJzc4mGF28vLQe+pDhjrvdZ/KrOROdC2
 92f6DsvqhtAqUBOt8Hkq83Oa/wXmyVUzSLGwv4Y3zF0REzmkterDNHI+A+Ocp/meCfZl
 On5g==
X-Gm-Message-State: AOJu0YxtZRfFLOjohjdEtgJqVPAZdPygC6kGdR7htgH6iqIe0NVVQHx8
 +2iH+JDXT7qCPOvfmO0S/jqzCyqQHj/WQSu12gaHYBL68B1E1Rpf6As0UK4D8MlG
X-Gm-Gg: AR+sD10OSdxO4d5Q2lrzARzElJvuWffjz0v4ZRY9w+56iIkScWPNOujKHQBNegnGCPA
 fOpZe/OjT9pfmBwBZbvXeCftkYawNEYo1q+NiCWd1Ppyn8kmSPAvDN5mVzXv3s/Ax3YRqHK+MFt
 DWDGOIgMTSpVM+4Fv6Xx6JuEFVeh4IwsatB1x06OzrAvjrxxyszzUfsrlJyL9BIHUuOejIkVZ5w
 vvEHP1si2P8AtzyNaMiPvBmHJYOdf/tMh0F8NgvnvCFauexG0EHp08V6mob3Xfnss9S3ORJXUtt
 CRQcjmoOPFqXjsWj4Ypdy7hqTz2MXT9WQNrhpBYRrs8SDT+NYjWUZbKbntagMghHlA8uGrxKMei
 rqg7N1QmypMVyY5izI9dEGhsi/fsXXtSK5n5XaGDppB0Ame65+KtgwaJdpkY9RqByCPzLyNs8uN
 DPTdsz5kMHoepWwLTWsab2BdD8HlJ+q2eP8eDkD7m/4j59b3Ww3eP2j3xjvtTP0Zo=
X-Received: by 2002:a05:600c:548c:b0:495:3eb2:b763 with SMTP id
 5b1f17b1804b1-49800ea023bmr10041105e9.21.1785381809472; 
 Wed, 29 Jul 2026 20:23:29 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49800e1f083sm15525625e9.0.2026.07.29.20.23.28
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2026 20:23:29 -0700 (PDT)
Message-ID: <6a6ac3b0.1c04d3ff.14eb17.7ea4@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 30 Jul 2026 03:23:28 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1785381810; x=1785986610; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=jyruXGRPrJwi9Kx4Wgow3bpShy8Jc70TCJPi6rABuxg=;
 b=RUQOtVZ1VtOVvzPaqULvVQjUAlJyErbbq28vG88ijez+JybHV6vAer6spvDle+czAy
 V7SGiEOsuhXUfIOjGT9tUZmKavVdTc5haddVisVeIZ4TSYfOIDU4IvlQ3ACu8bnJMGZc
 SnUCNykXTYxfMRz9RTypfm5zxwAPiInLWY2ZSS+uQhbnJicQNGzJuy7pe6I0spo4h4kW
 Gte/8P6YVl2+l9rUMJj/MgW5XanKNudWaQxCWHOYCriL3Dl5w/2os62rYJb5zz51FVKU
 Z4HKdKKex7+PXdyCyZ4L7jO8guxphQfUeRP84BUbZKSBz61Ih7oqOTMuXSv8UkCI5sev
 WDxA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=RUQOtVZ1
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-29
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

Autobuild statistics for 2026-07-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  |  7  |  0  | 13  |
  2026.02.x  |  1  |  4  |  0  |  5  |
  2026.05.x  |  0  |  1  |  0  |  1  |
    master   | 24  | 51  |  0  | 75  |

Classification of failures by reason for master
-----------------------------------------------

                    attr-2.6.0 | 5 
            host-binutils-2.44 | 3 
                       unknown | 3 
        edk2-edk2-stable202602 | 2 
  gobject-introspection-1.84.0 | 2 
                    grub2-2.14 | 2 
              jpeg-turbo-3.2.0 | 2 
                   linux-7.1.5 | 2 
amazon-ecr-credential-helpe... | 1 
                  broot-1.58.0 | 1 
                   ccrypt-1.11 | 1 
          cloudflared-2026.6.1 | 1 
             dahdi-linux-3.3.0 | 1 
firmware-utils-c42a3bc53da8... | 1 
                    frr-10.7.0 | 1 
glibc-2.43-45-gdae425b55420... | 1 
                haproxy-2.6.27 | 1 
          host-binutils-2.45.1 | 1 
host-google-breakpad-f49c2f... | 1 
             host-guile-3.0.11 | 1 
    host-mender-artifact-4.2.0 | 1 
          host-xfsprogs-6.19.0 | 1 
                  iozone-3.508 | 1 
                iproute2-7.1.0 | 1 
               linux-pam-1.7.2 | 1 
                    lua-ev-1.5 | 1 
                openntpd-6.8p1 | 1 
                openocd-0.12.0 | 1 
        perl-xml-libxml-2.0134 | 1 
                    proj-9.8.0 | 1 
               pulseaudio-17.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
                 rtl_433-25.02 | 1 
         s6-networking-2.7.0.4 | 1 
     s6-portable-utils-2.3.0.4 | 1 
               tcf-agent-1.8.0 | 1 
                 watchdog-5.16 | 1 
                wtfutil-0.47.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/b9c560db2cb03a65edfe7b8e1e3e426957772529 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/a35e954c4d69c91e1f192acfb3680076239d4489 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/19cec71732be45055c2692e7bfa5b4ee4e69d892 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/f081908764cd5eaa9772d38d76c5b15e22776aae |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/189b10c1277f8a2ed6917e0cf98b3b4ec97cfaca |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/22b50639d1790b16738d2b673d1bc775111f0013 |     
    i586     |          broot-1.58.0          | NOK | https://autobuild.buildroot.org/results/59a7681c5d86f56708d3dbdf8c9dc9df6e48c181 |     
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/91eaa03da41563cbd741ec6c30c60821e0d63330 | ORPH
    i686     |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/7050314268abbf0b099abd91b1e2cfdb497feeab |     
   s390x     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f5352e32c1b23dd7a7641372fe6c420937bf6235 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/b8d64b92146bf80138ebd768093494704382d070 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/a5f352a227c333067ba1aeb49aa6f5b5bff8443b |     
  mips64el   | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/be47e22c24eb934f95e0222633eb0b3202cfcec1 |     
   xtensa    |           frr-10.7.0           | NOK | https://autobuild.buildroot.org/results/9fd05bedff10a285efec0ce10af5a34cd5b5d66c |     
  mips64el   | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/0b7613957429c7c681c40f95ab836cd4be8432cb |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/4dc14206990a167c66ac4640da14589f47ae66aa | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/a5e94ca31a9f02ac130b519e220648e1b8a00f96 | ORPH
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/f29d03be64058cee9769888cd13ff6fed4a375ad |     
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/15ee292bce384a3a74a1509f497d5cc43ea5bdd1 |     
    i686     |         haproxy-2.6.27         | NOK | https://autobuild.buildroot.org/results/f8c39c2eeb90cc1d8a29a10bc77a6dc2c7cb1d45 |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/b6371a70a9ea80d73501a729505bd9b95c2f90e7 |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/ea24757f36ce15e46190343e921a6075fd1512be |     
    i686     |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/f37c8a3869d3edbd25b82e588dda29f5a98e4daa |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/408195dc936f2077a8a78cdd7bdb179c2562f4b9 |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/8601adb7a35e386adce04011eac1771ff482d529 |     
   x86_64    |       host-guile-3.0.11        | NOK | https://autobuild.buildroot.org/results/5d70a5af6ea04e39b5513ffddaf95dec7daa4e50 |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/3e2d7a75bd0e08c3c0340461b2cdbee22d214665 |     
    hppa     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/d2b1a6bebb2252d634e8e852ea9836b595e416f5 | ORPH
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/0a0fb15a991127df0ee058a9d895bf73cf2af7cf |     
  aarch64    |         iproute2-7.1.0         | NOK | https://autobuild.buildroot.org/results/d9884b54375b03c9f66ee6618661219191c7a686 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/6c5510f818641a87c71f83cd4c9b974ca3d7f2e0 |     
  riscv64    |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/7d4b55e3ed787105ac489bd0637b51a724faf928 |     
    i686     |          linux-7.1.5           | NOK | https://autobuild.buildroot.org/results/a794a8dda8158285ce5dfffee770c3c76c2c6139 | ORPH
    i686     |          linux-7.1.5           | NOK | https://autobuild.buildroot.org/results/6e49db4a619c925c2056c0af4a3ece38582fdc9a | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/4ee2acc535fa747ee751e4dfbe51457f16a51add | ORPH
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/d8d961fbdcd1e938fc92c4441419d80801dd53a0 |     
  aarch64    |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/8f523e5103b2b576141ece432bfa681acf9379da | ORPH
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/8d87c089bed82e41b6679406e47b6942e4643a38 | ORPH
   x86_64    |     perl-xml-libxml-2.0134     | NOK | https://autobuild.buildroot.org/results/9253dfa61141b506e4f566b9eee24ab5582b3de6 |     
    i686     |           proj-9.8.0           | NOK | https://autobuild.buildroot.org/results/ec6c3e26ced7fb6a9f940668d06c85ce211bbcbe |     
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/dfd76b4540020871306702a84a8b198f7c830483 | ORPH
  aarch64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/43b15944cf166f7e4b4741f0263d7c97c6cc2e8e |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/270fd3c9d4d75f84ee314589503c8fe68ad4277e |     
  riscv64    |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/6ef15d939fa09c6e89fae8231e7654eb1a327d86 |     
    i686     |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/038a564aabd4b408ad1875698a7cb01295403bc8 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/12386daf01a6bb5f7d834a77aee9617aca6731d6 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/b46d94a02b9d5392406711226bcbf9021a8815d4 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/c6e013a15fe474b14f845b6165cd3a74c927e159 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/82be020c4beaa1054a50944a81269427dfc13e94 |     
    i686     |         watchdog-5.16          | NOK | https://autobuild.buildroot.org/results/654f3e2c8f3bbc6e8d32d21104199b290a1ba9f9 |     
    i686     |         wtfutil-0.47.1         | NOK | https://autobuild.buildroot.org/results/89ed24544588d401adbf1d8721f757835181e9b1 | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                       unknown | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/8139daa49a56bdc94d57dff2382c57e82daad6df |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

            ecryptfs-utils-111 | 1 
            host-go-src-1.26.3 | 1 
                memtest86-7.20 | 1 
                openswan-3.0.0 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       ecryptfs-utils-111       | NOK | https://autobuild.buildroot.org/results/eede17775082c291378606af69e2df652caa0330 |     
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/58cd1b423ffb302e5e16908694e224713a755690 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/6cacf8972e16bb4439b841d3ab4b9ee565c11ddd |     
    i686     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/198657fbb716cca3b01888a4c7bc6f6d77b19cf4 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

    host-gcc-bare-metal-14.3.0 | 2 
            host-go-src-1.26.3 | 1 
            lttng-tools-2.13.8 | 1 
                   perl-5.40.4 | 1 
                pipewire-1.2.8 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/83d6f9c5d2c74eb8d7a084c5b89611a5e418e5fa |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/0aba6e7bd9addc76ef8288023328950962584beb |     
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/807da270328f7bfdd7eec794d6194da67d8267bf |     
    i686     |       lttng-tools-2.13.8       | NOK | https://autobuild.buildroot.org/results/63e4c385d10e302124a302f13d82bcd72c256056 |     
    i586     |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/97b1a588322975dc0e29639065cd627fdd1db5b1 |     
   arceb     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/eae554f35bcec1a49d974cec600f8a8369aaefe9 |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/b72a6b76cffbb3e10bd4d884447de012962a6e38 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
