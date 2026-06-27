Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F61EC43458
	for <buildroot@archiver.kernel.org>; Sat, 27 Jun 2026 03:25:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6A1C82105;
	Sat, 27 Jun 2026 03:25:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0K_SPSMMEezB; Sat, 27 Jun 2026 03:25:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C7CC8210C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782530741;
	bh=LTlV6mldPEs0dZaNRVcX7Qsj4C8y6hGrMF2Javjt34U=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HUsCfkyOLFxvOljm3i6PmHL/cw1f/CumWnJHFRDmtijGY8SXTNGvYiUoS5AlZl6Gp
	 3dBpset7ctwvbCFtbxTfONTUrvKJ+4L7/9rc5NJfAmCIZNvvUoVRVNi7BPGGqZfVs/
	 +hJQbUd4wwpeKOJlEKlWT8KXZZU0QElcwf3Vs2GSWDzVuSj04KmzVFueaVcYN1K+By
	 D2ZZdsguWrVRmHvn6IakjBOVWf0aoFHjeRwkVg409dS5zjub+pZXCF6W4L9ARDHIef
	 4rGF7WxO384rKlNEpnryNhXrleOuaAVRc3N1WfzT7bzmvRMyRb/5QyT5veZIoA7Tao
	 e25QoenvPTbng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C7CC8210C;
	Sat, 27 Jun 2026 03:25:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D3A2CD
 for <buildroot@buildroot.org>; Sat, 27 Jun 2026 03:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02DFC6079D
 for <buildroot@buildroot.org>; Sat, 27 Jun 2026 03:25:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 97sKU_xBxQZc for <buildroot@buildroot.org>;
 Sat, 27 Jun 2026 03:25:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A347B6065A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A347B6065A
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A347B6065A
 for <buildroot@buildroot.org>; Sat, 27 Jun 2026 03:25:38 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4924593f45dso20001685e9.1
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 20:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782530736; x=1783135536;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tbm7vW9QhmGECPMaJdzDfxS3kSVtNO+h0FPdK5jlwls=;
 b=BmSAC4nCdncheK5AE691f/TUAMSidC4/y8ZMwN6dmnS+KZzn+oEIqPa/q4HR33VW+N
 ArsDSv42IL0AyMgQSsKgg8SrpescX6kiJ48WwPVNDX2Pe45qP3hgwi9kddSLD7syc/v7
 qskHB8hlNeEEVfmB4uWkyRcqtORZYSa7nUPi1XY4MyepkVCdHp/IAsc17SgZiXmDCXQE
 WANwoAL6VW0hzAkonHryV9pBfbEfWr87hX3CCOoEl3rgv4fxqtTi1zDIZZzxb/0jjP2+
 IvkJTg3wJqV21AlTL1VxQwlLHahcoHJh8Gh5MYo1wQQ+hqKLabSHLIOpr4FYlVT7P2YZ
 1MOw==
X-Gm-Message-State: AOJu0Yzv12ebKNOUCUjaTpOwisRoZEo8TlS9D+rlOlSkoqmH1Iz9xfPd
 YJAzSHBJ0kDxW+GxTTSPbwRib60jq+1Jo0mw0K6pFvQQ4ThcsbdDMX/6evlSqCgf
X-Gm-Gg: AfdE7cmupAXQ4gfQkRKoe8oDebdsrQfMx3A9OmpaW4NV1SoQpAbuUcxSaD0LqO9aPfF
 VNfKhWPOot6ruuFe6eBb/e7+3ztuQBQSkeTbexc2Zyebz95jucsLKiAUJhn8L/MoAce6anMHIGz
 Uoh7876CR/+dv5Vjvd9JPeWOcBHhSJF+3SCGb0K3MIVj196qFweIhiTgorqauYHtlzkHlCZRU72
 IAerlFo7CMcNJfuAJxMVUT2gWqjPZ4wVBQoS+qwvKvgpHXlbHng+DRJnB2g2ToixLsVvPhXVrFR
 sU8u88mNlgKLoDdbd+gdv+6ofppRVJElMY98IHpaVe+fvQDKDOt/KYpF9B4qY1O6EgpHotRi7EK
 tqGavbNZyXueXvYrVm9Zw3N3xUeJDeAK4GDZC+7JW2YOadV9NMQkVrAeLS+T8rB4gGr1ZHRkIPZ
 MjHFKDo3IQsdNcKZA=
X-Received: by 2002:a05:600c:a016:b0:492:e5a5:5a46 with SMTP id
 5b1f17b1804b1-492e5a55a84mr10992335e9.35.1782530735634; 
 Fri, 26 Jun 2026 20:25:35 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-492690a1a85sm216461435e9.15.2026.06.26.20.25.35
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2026 20:25:35 -0700 (PDT)
Message-ID: <6a3f42af.6161eb1e.3441bb.1dbd@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 27 Jun 2026 03:25:35 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782530736; x=1783135536; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Tbm7vW9QhmGECPMaJdzDfxS3kSVtNO+h0FPdK5jlwls=;
 b=hbPUmW5Om0CPCJjZG5/G8mZaLLttrwOtCfAuu2svodgoO75bn6KTBGjof5HEXhMMX+
 VwqkfFKUeYwpCkCfdeBVpGuFCSD2ZaH7W9cyEwzJZsOsnZNlDG0irJJi38IpdjDtqSRt
 FcjvEq0zktDXnYyBTUKRqZbDCDBdgiFOoHCO8bH01XNDO2vuL6xfGSsgpBk207KpzSfp
 dDngWmae0KW80lAwfWJ2MSty2cV7y2OnaIDGrQ/Sq8paOrKytT01DbCpi5644CAHRrDK
 Zi1zf5RtOQn2u7CloFZDlHvA8Yv6NEOVuDKooCBCcuLFi8QoB4ZiO/9Tkp7ioCoF2bKp
 z+0Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=hbPUmW5O
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-06-26
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

Autobuild statistics for 2026-06-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  3  |  0  |  4  |
  2026.02.x  |  0  |  2  |  0  |  2  |
    master   | 28  | 50  |  0  | 78  |

Classification of failures by reason for master
-----------------------------------------------

              host-pahole-1.28 | 5 
          host-binutils-2.45.1 | 3 
       host-gcc-initial-15.2.0 | 3 
                   perl-5.42.2 | 3 
uhttpd-15346de8d3ba42200249... | 3 
      docker-cli-buildx-0.25.0 | 2 
              host-guile-3.0.9 | 2 
                   linux-7.1.1 | 2 
               linux-pam-1.7.2 | 2 
                       unknown | 2 
am33x-cm3-fb484c5e54f2e31cf... | 1 
                   bird-2.15.1 | 1 
                  boinc-8.2.11 | 1 
                   botan-3.5.0 | 1 
             cni-plugins-1.7.1 | 1 
             dahdi-linux-3.3.0 | 1 
                 dhcp-4.4.3-P1 | 1 
docker-credential-acr-env-0... | 1 
        edk2-edk2-stable202602 | 1 
              erlang-26.2.5.15 | 1 
               freetype-2.14.3 | 1 
  gobject-introspection-1.84.0 | 1 
         host-opkg-utils-0.7.0 | 1 
host-vboot-utils-7dfa482d6a... | 1 
            igd2-for-linux-2.2 | 1 
              libopenssl-3.6.3 | 1 
           oath-toolkit-2.6.14 | 1 
                    olsr-0.9.8 | 1 
                openocd-0.12.0 | 1 
                   redis-8.8.0 | 1 
           sane-backends-1.4.0 | 1 
                    szip-2.1.1 | 1 
               tcf-agent-1.8.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/61a0a065cd7808bab4633e54b7cd7817c4df2e22 | ORPH
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/02f96354ff2541174688fa67c8a952ac8198e033 |     
  mips64el   |          boinc-8.2.11          | NOK | https://autobuild.buildroot.org/results/5628c8865a2972bcf936ddf54510dc31189e6b6d |     
    i686     |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/8f060a7121336e2fbbd9f3e10ff3e9900ff74f9c | ORPH
  riscv64    |       cni-plugins-1.7.1        | NOK | https://autobuild.buildroot.org/results/f226eb36745926f73becd985b1b275755d7d68de |     
loongarch64  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f68c95b5d58cd5fc450c7e9b196df57a3b9146cc | ORPH
   xtensa    |         dhcp-4.4.3-P1          | NOK | https://autobuild.buildroot.org/results/0c1437b532d9dd9b612213d190bd28d658d59dbd | ORPH
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/4dad7afb1a4c7896d763a10eaa9eb25df6c104c7 | ORPH
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/2377fd7f33db3c5bab278a23748f97de5046685b | ORPH
    i686     | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/b373dcdfc783e3d69b5fe9ac019a49fb76537413 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/556e2532077d0c2505f9401e1dcdf876390d1501 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/0253d2f82b30276ba30095619fab394c7950109f |     
    or1k     |        freetype-2.14.3         | NOK | https://autobuild.buildroot.org/results/2fc14cf617b2624a69ef0fc2e10c1f323149c622 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/e6243a3a4a105cab95990116c23555e122f40e71 | ORPH
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/033651ef3f2744cf710d7922cf7224242a27d5b6 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/a20f412a0da8483657d7921f3a70593cdd2a2503 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/f635d4efc51c3d614f157ccf26084e7bc5c53003 |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/d5fc94693a394232b13da8ec532d2a26d121ace1 |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/e4347a15841720745497828ad88f2010728b3c8b |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/a1320523769d05308a19fea829839f691021393b |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/dd06f073a0fe95616b23f3357080a386e6b96241 |     
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/2994c8c3c854b364636427a77c39c2b57b73eb9f |     
    i686     |     host-opkg-utils-0.7.0      | NOK | https://autobuild.buildroot.org/results/2eb17caac9e190ddf5d44498a98ee924d1bb56ca | ORPH
   x86_64    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/8182f39d000b304c1009805b8ff4348b92c1a72e |     
    i586     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/c64cf72990d05c9a9153285b0c6fc4a1e2d3932f |     
  mips64el   |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/6231633ac25952d21785b77da4b600a16d548d32 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/3905ac510792e63b63cd353584732a821a42090e |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/ac0d7720b8d41d58c080f47d55f3e787a8f231ca |     
    i686     | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/14b8b56b8786d56b7bbb407a969c0fdda2edbe0c |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/31e16f5dc50306404adf8b1ee441d1d42924fc9e |     
  riscv64    |        libopenssl-3.6.3        | NOK | https://autobuild.buildroot.org/results/7540ee8a6294eb29c71be1e7333aa027635e52ff | ORPH
    i586     |          linux-7.1.1           | NOK | https://autobuild.buildroot.org/results/a2a5ac0a84d167de31fac8274a45377674f3555b | ORPH
    i686     |          linux-7.1.1           | NOK | https://autobuild.buildroot.org/results/7c53c16cc97306fd97872062b00a7044d64f8516 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/b01418926fa1552439ed81df6c210fcf344a1d45 | ORPH
  mips64el   |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/8b0a95c0bac488ab914e796ddcb27e0e2540da3d | ORPH
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/1376183f7a20c4a5b580e651764364b0731687a0 |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/439b96e4c595e259f84da3fd72597d35a910bd92 | ORPH
  powerpc    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/6799529e2753973871f474d48e09fcc87b074968 | ORPH
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/82011d3ceb437cfae1f087f5bf1b7ce7da956260 |     
  riscv64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/cf9a0ce331476186db601eff9284ba31d44b6fd6 |     
loongarch64  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/1f042d2af0039088537227a916841a9dd3fcb09a |     
    i686     |          redis-8.8.0           | NOK | https://autobuild.buildroot.org/results/7783e2227c762014d793fc9a24e7ea935d8599db |     
    i686     |      sane-backends-1.4.0       | NOK | https://autobuild.buildroot.org/results/2bde65877b475f8edd7dc5823388fc50f0901efe |     
  riscv64    |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/4ab9ec08586b5bc596b059eb9d8a8d53e86d1097 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/24200a8df7d69a6467b9ec66743e5bf4912bcda1 |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/a4f7da9dac06d2f9113feef5f8592ea302279270 | ORPH
    i586     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/666e471c8d12992bb467bf2dfac0dbbdf4af395a | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/0f8d1d16692fdc693f63a5318579d4104d76745f | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/9233b72c629bbeb866473b7afc6005e2d687d75a |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/68b20cdf32d3782cb1a6df09a8e5196118a71d67 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

              libmodbus-3.1.11 | 1 
                    olsr-0.9.8 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/a5071274bc729284c8c087a296076a1a40c5fa10 |     
 microblaze  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/15c1e68719529a0685ed345add5227f58cffb22f | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

host-netsurf-buildsystem-75... | 1 
                memtest86-7.20 | 1 
              udpcast-20230924 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/b36274749ccca045e92be5e9134ddbf4d293fcde | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/6ff688eda1d218e0d388fce0942f2e1a3a236afe |     
    i686     |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/6e3b2b0134f3907ead78fcc5f6267d0a7155c76f | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
