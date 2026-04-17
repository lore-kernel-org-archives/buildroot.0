Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C29EF8E4A1
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 03:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9E7640CAD;
	Fri, 17 Apr 2026 03:24:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0GhuI1D8CtlR; Fri, 17 Apr 2026 03:24:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 656EF40CA6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776396281;
	bh=PsjOD6wuixofKordOmwSYktqboLb0YyIBbjoKYvZKO4=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GbIuQn9kMn7RVifdObzkk3XKqukjRO7vbc04HGyeA8R1/zPHlKMYYvIIUozXrGVPA
	 AsKXJwgaPGsv8DIzFoNt09BDqr8k/wdrrOWB50f4RM16HO0lMda+tWHjiWQlLPQvV3
	 DYnnJeV+VFxHtSV6NK/nXSstbsQNOnEGkvRt2j0GSROl79fXh1YNxUcnXUhZxDjYWT
	 PoTXF4xyLqKwg/abuKhOihx0zAq3150Jrymay1RT2Tu+LCZtoiyGZegZe2r4q+v7g/
	 2uWN4GcMKr9BeKzR733zVmO3icvzW7UgUL6z7gU5vclYZzil630yqdSy5pqCLLAtsQ
	 2Gq389Djxp0vw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 656EF40CA6;
	Fri, 17 Apr 2026 03:24:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id DCB55270
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 03:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE2B68131C
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 03:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9EHG2_xGJWuK for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 03:24:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 84D978131B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84D978131B
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84D978131B
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 03:24:39 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48897fd88ebso1958595e9.2
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 20:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776396277; x=1777001077;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sfo3JFROpauaChwvvwNmQc3y7u7IrELTc5ej5ksn5+k=;
 b=WFx9XEd12+vYWIM38EWO2lpHGKfai0AepYsKQeggyvd8VPSs5pgY6mkeSh+W+md2nK
 oDSi0E/Md+633jDVFI8cd1KbS1h927GwOIeu996Q1EpMMDev5/Dqsw26z1Gf7/BSrpfZ
 ydRymjTyKYJL9IFyPVrtvn2VR8wt5+Uqqb0go9Bkl2Ngudqioppetjd0gvqqojTTrUKG
 X9oAXnKqBt1aNNON8tV8KQHSq+tmZS8480XtyHEp00Y7eAXqhYAe0y6M7URET++Z6o4d
 hAKHLwAxBDTIqxj1UYvqYeisJ0U5JZapjlYeDmPyOulAk7RCe+mDpSuH6jVHHlVomWUk
 CtfA==
X-Gm-Message-State: AOJu0Ywwf32jF2xVNSeppyRb/pvGZzxzK/DfrkKqqi+allcYYChQzh/x
 Vt+W2dNyjwqd5NZBCfyzuFSK6vpQabqFhNwSuHtDeO0pLu5a8+hEHZgjfUh5qtXB
X-Gm-Gg: AeBDies5+HWSRM6YjI9xsUYzEzpN9eQ4opfSvLLWPjO4lwDFEgvExUZdstMr18uyLHE
 psI+I4K9ZyuMEkVC6rxzT6ju2uLCW6iAjKOPcIUTnfG5AglEk1Vl8ShvXAiS7XpOThYHNor9Q23
 faock25UHyYQKzc4Okv3g82Mvz9354HoctSHF8QjEt0hukhsSPlTLNxCW/liWHjzNiRhbwEAe+b
 +74IxwKz5l58pEsDveVTDvEitR+qWQ+eR5DeCm73pZf79feKYUFMuHph1t0gCTeRcSarWXMiRb6
 AYP6N1N2CB2PqddDVskGWpbIH7Nymt1Udmh25HBPpSP0Q2nJudz/TfMe6BNzrKqquFUIJYlbUu9
 wv4RIs0a4JKzY4i/JI6ton+jkT7tS/gRDR4GwgrcuLBWYJVgZls2Bo/14a/MxF4ETfvsCPR82oe
 BXw5q6PkEaWShA/E1N2bwA8plIGPPIhGuFYTmUMfEI
X-Received: by 2002:a05:600c:5254:b0:488:8bdd:cfcc with SMTP id
 5b1f17b1804b1-488fb6e62a8mr15315175e9.0.1776396277031; 
 Thu, 16 Apr 2026 20:24:37 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fc14104dsm9725625e9.13.2026.04.16.20.24.36
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2026 20:24:36 -0700 (PDT)
Message-ID: <69e1a7f4.7b0a0220.49db8.f826@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 17 Apr 2026 03:24:36 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776396277; x=1777001077; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=sfo3JFROpauaChwvvwNmQc3y7u7IrELTc5ej5ksn5+k=;
 b=kUqVUEcMWV8x0QJk8GxRdGe0U/COAwmhT9H1spzoseElPx7dVFCkTTfU5PexqHd4pv
 ZBHgf1evbRU4mpQ/bwCTrya0jPgPOjHTkTQg5O+o6xXGY9KrSaTCIJms4zw8IXHxhRSX
 jCwvICj85f8cYDenI/TlfM5pWlxlNWo8fPNco3XOqZ0TeSdTh7wOllx60avY6EIAcdQr
 XQMzyI0al6dioBkJ3T8HRJB29FsujP48LWN3A5h3SwPRv6vvOyCfWTyrlkLarNzzjbIT
 fcB0CUibdu8yu2nRr2u0jPoQVEFhA9C0jfo7ZJWpjwB2RyArEys1yo9AflH/HUZDEtAD
 ifFQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=kUqVUEcM
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-04-16
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

Autobuild statistics for 2026-04-16
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  6  |  0  |  8  |
  2025.11.x  |  1  |  3  |  0  |  4  |
    master   | 29  | 51  |  2  | 82  |

Classification of failures by reason for master
-----------------------------------------------

odhcp6c-f19dd37fb467c9cf10c... | 3 
amazon-ecr-credential-helpe... | 2 
                   ccrypt-1.11 | 2 
                 gnupg2-2.5.18 | 2 
  gobject-introspection-1.84.0 | 2 
            jpeg-turbo-3.1.4.1 | 2 
                   perl-5.42.2 | 2 
phidgetwebservice-2.1.9.201... | 2 
           alsa-utils-1.2.15.2 | 1 
                apr-util-1.6.3 | 1 
             batman-adv-2025.4 | 1 
                   bird-2.15.1 | 1 
                easydbus-0.1.0 | 1 
                   flann-1.9.2 | 1 
                flashrom-1.7.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
           ghostscript-10.06.0 | 1 
            host-protobuf-34.1 | 1 
          host-xfsprogs-6.18.0 | 1 
                    kibi-0.3.3 | 1 
     kvm-unit-tests-2025-06-05 | 1 
            libargon2-20190702 | 1 
libfutils-c326ce0cc2a735438... | 1 
         libhdhomerun-20210624 | 1 
                  libnfc-1.8.0 | 1 
                  libnfs-6.0.2 | 1 
              libopenssl-3.6.2 | 1 
libuci-f3fc0b76040685829191... | 1 
          linux-5.10.246-cip66 | 1 
                     linux-7.0 | 1 
                linux-firmware | 1 
                 linux-headers | 1 
                   linux-tools | 1 
            minizip-zlib-1.3.1 | 1 
                openssh-10.3p1 | 1 
            optee-client-4.9.0 | 1 
          pkcs11-helper-1.30.0 | 1 
           python-html5lib-1.1 | 1 
python-remi-2022.7.27-37-g1... | 1 
              python-xlib-0.33 | 1 
              tailscale-1.78.1 | 1 
               tcf-agent-1.8.0 | 1 
                       unknown | 1 
             util-linux-2.41.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |      alsa-utils-1.2.15.2       | NOK | https://autobuild.buildroot.org/results/ac4fc8537cc90f5e4ad62fa74ecffe2e1a33390e |     
    i586     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/bf665e74713776c14f38ee044fd354215c048a27 | ORPH
  riscv64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/a125bfe8c2cd868a25e3e68ddbb107b0ea96e552 | ORPH
    arc      |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/4c0d8884482c8e65bdb2e382bfe09d80a5c916bb |     
  powerpc    |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/2722aac17989850e9139334b3b963d168a3d84ec |     
loongarch64  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/e0a455f5cc55e917938319505fa3569d8d37f725 |     
   x86_64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/e36c415bbaa546aca577d1f0ebd89482a708f894 | ORPH
    or1k     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/a62e9ad8f992d3e703ad414eabe5f55e50b97a13 | ORPH
    i686     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/f61b5eb3a7db6248824895d1f835b470694fe31e |     
  mips64el   |          flann-1.9.2           | NOK | https://autobuild.buildroot.org/results/f090f338cf53077d07c58d88eec36f4cb6d57ffb |     
    mips     |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/70d4b8ccccf367cdf4c787d91c452e8db0e7ec83 |     
   mipsel    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/aec004eae9178ea05bfc08b095c36a8e2a39862b | ORPH
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/c908c1b1340b5323ee7d41cb63e79ff575e994a9 |     
  riscv64    |         gnupg2-2.5.18          | NOK | https://autobuild.buildroot.org/results/ba1284faaa2b97b1d226c27b9632ae85f48a929b |     
powerpc64le  |         gnupg2-2.5.18          | NOK | https://autobuild.buildroot.org/results/564d95054008779ac1129c0cabe57c8dee676e1a |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/c345b1e839dad83b4c3332a6b4f94572b5ed6fdc | ORPH
   sh4aeb    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/33beb6f7329870e36a2e4c1872e054ad45e021ef | ORPH
   x86_64    |       host-protobuf-34.1       | NOK | https://autobuild.buildroot.org/results/a14362301287ac31eb48cdc653c0a49166436fd5 |     
    arc      |      host-xfsprogs-6.18.0      | NOK | https://autobuild.buildroot.org/results/4d70622892bc195a4645063e36dc7cd5296948c4 | ORPH
 aarch64_be  |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/28bc6ec0ad151efa1b5f38f29df18806504fb23e |     
 aarch64_be  |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/26377d02f2ed76ed96d59123a38fc95c68a7a3d7 |     
   armeb     |           kibi-0.3.3           | NOK | https://autobuild.buildroot.org/results/d93cf37a2037186e1ec1824b3796ad8a3825a6c2 |     
  riscv64    |   kvm-unit-tests-2025-06-05    | NOK | https://autobuild.buildroot.org/results/54663840729965e2f6b16a14aad5d0ff79ab6fc7 |     
loongarch64  |       libargon2-20190702       | NOK | https://autobuild.buildroot.org/results/85ac7c7432988f04a453f6ad9d31e122da0d8cf2 |     
  aarch64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/86f31815885f4479e38f62b4f8f85514401ecaa7 |     
   armeb     |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/e4ffcb6423c5bcc5d17acc9ef2693c03d5b68f52 |     
    or1k     |          libnfc-1.8.0          | NOK | https://autobuild.buildroot.org/results/ca3d9aff75a0b5970ba6b6195003a1899bcfdd4a |     
 microblaze  |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/d7c0bc5861afdf9bc26906e9abd217bef898fc48 | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/5fbd51970902bd24263395d15d2e7e2f8206a33f | ORPH
   s390x     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/12630c0015046d3fd2acc06c5ffb959edea4f532 |     
  aarch64    |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/7781be6b87cc0b00258359aa8664616d52ccfbcb | ORPH
    i586     |           linux-7.0            | NOK | https://autobuild.buildroot.org/results/82f669947665795c93963a0d77791edeea506b5e | ORPH
 microblaze  |         linux-firmware         | TIM | https://autobuild.buildroot.org/results/585adea93c3626d7290457ca5e68a3854380691b |     
   mipsel    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/c119f238610c711a9545171e77ca54a36db5aec0 |     
 aarch64_be  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/857f8ec93a9c84779a2b46573453cbdc712b60b7 | ORPH
powerpc64le  |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/090784d893ee9e868b32c0c055e6e80784bcc5c1 |     
   x86_64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/69de3c3fc1626e83714c170f50544363f459e7dc |     
    sh4a     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/2387b826ba6a8e12e8d0063dd5b1bcbdd6052cc1 |     
  sparc64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/05faa97f12e75f19303ccacc57a85421f51439f2 |     
powerpc64le  |         openssh-10.3p1         | NOK | https://autobuild.buildroot.org/results/b9271feba9623aec3b197dfd3f5fc4c21f0ae665 | ORPH
    arc      |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/a685fae527872bd870c939c4b66f14c4ab3e1dae |     
   sparc     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/07ecd27bcb9fe2d63976d30f2123435ae2480675 |     
microblazeel |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/0637781865ba689e6224f85f35a7a69b3bbe66e4 |     
   mips64    | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/6e34cdf78e46cc58a4ac3e292f519fb7fe0ddaf5 |     
    i686     | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/9a256c63ef437d554575d43ab932c34afa367191 |     
   mips64    |      pkcs11-helper-1.30.0      | NOK | https://autobuild.buildroot.org/results/115c5c0324869463ed3e666d8fecfe27b57afae0 | ORPH
   s390x     |      python-html5lib-1.1       | NOK | https://autobuild.buildroot.org/results/f05b23e9d328658f9e31e9c55603ad8d0ccf7ad6 |     
  sparc64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/c6a3f12c95ec94a927c79bfa77e9005b16fee4ff |     
   mipsel    |        python-xlib-0.33        | NOK | https://autobuild.buildroot.org/results/0f4947d60d0c3970bab79796711750e8deefb6cf |     
  mips64el   |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/3975e6de732bec6f45815a4557f0bd564edb80dd |     
 microblaze  |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/76e096cc32df41cbc3ba71a26ffa1682d321adfa |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/eb4f7026ab0b0e1438cdbc5398457312b8416d85 |     
    mips     |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/e39b9ca1b7b5a39af56d77dcb78bb3df659f1522 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

          aardvark-dns-v1.17.0 | 1 
             dahdi-linux-3.3.0 | 1 
             libgphoto2-2.5.33 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/ff321ef350e051515da4d65ed9f8bf526f7b7e0b | ORPH
    arc      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b94bcf1fa295647ad72b742c609fd10a7dcb5a48 | ORPH
microblazeel |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/d7d35a3cf0f1108e8708f4c4967afc90ef998202 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                    gdal-3.8.2 | 1 
        ltp-testsuite-20250130 | 1 
package/linux-headers/linux... | 1 
                 protobuf-29.3 | 1 
            resiprocate-1.12.0 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |           gdal-3.8.2           | NOK | https://autobuild.buildroot.org/results/ebcf1f95b28eccd0778c8117b005f514c870ef24 |     
    arm      |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/46005b4b18b22114169c6464c0919eb1d94210bf |     
 powerpc64   | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/8e3eb17a6d469f90ddd2381db8dc4acd6c518582 |     
    m68k     |         protobuf-29.3          | NOK | https://autobuild.buildroot.org/results/f853fc672d16bdf965084e7a8c30bb66e0ec07ae |     
 microblaze  |       resiprocate-1.12.0       | NOK | https://autobuild.buildroot.org/results/b1f27d7e44e3852415c2981bbc21d3797a8a0850 | ORPH
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/48fc46410f57e3cfb548b2527280c119d36d9b34 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
