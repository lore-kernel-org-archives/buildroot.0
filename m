Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABA41CF2564
	for <buildroot@archiver.kernel.org>; Fri, 21 Nov 2025 04:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01A87427BB;
	Fri, 21 Nov 2025 04:21:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ECy-ZXwu1RAI; Fri, 21 Nov 2025 04:21:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D4A641EC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D4A641EC7;
	Fri, 21 Nov 2025 04:21:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 39E38344
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 04:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CABD41EBD
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 04:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g46fqjwaiUfs for <buildroot@buildroot.org>;
 Fri, 21 Nov 2025 04:21:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 503D541EA3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 503D541EA3
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 503D541EA3
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 04:21:05 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4777771ed1aso10516745e9.2
 for <buildroot@buildroot.org>; Thu, 20 Nov 2025 20:21:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763698863; x=1764303663;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6ApSaGF5RM2wu7PwN5A+85m2ug8I4QtKRqLEav1rXNU=;
 b=u8Wh/H3S5zmFk5Izxi9XaOoGuotN1mLncYyRd6LeWJsCb9mTlOPVWwIngjrBygMOoa
 GReP+EBEYnYqstuEGnE3zORyEj5cX2/8zCYVg/CJ5hFKSeJeKwt/sg5B9vo8MwRVqmNi
 Tc3WWnDtj5UXAW+3mF4ht+Lqq2fbBGQadtq51kVyQX4nvRFAhm3xGrwVoR8eGhaj4tFs
 NFhjSskG0c87MqQBdHYFC1TuKeBOJmPkJ2MmUZFB9RW7upeL01Pm06mKu7waHZ2M37hn
 cCSrQJTBVd6OLfzgSEmOtPCCkJod2XqD0g3AZsKdl5QVxO3KD0uO7foS2hT1tUm7otEv
 cCHQ==
X-Gm-Message-State: AOJu0YwxQ8DRMyxwG4+j7zciMr1urzUp9SNuX53CpMKMpVkQE25QEb22
 NdR92Bs17PsRVoJTjufFD1IYU3rJe8An9VjGrMBfZ6q7i1LlfJGCgFn6PnD5Zw==
X-Gm-Gg: ASbGnct5sPJa8rEq0QyhPCJnOlQt7KbVR6b7b8FXuoH+byKXVJSlXeIhWTL9lco6Aj2
 CcHP2eqfgpRdSmVCcDdJaY099wXchpbPR2m4AE4KTk96sIRMMAmH2e/xHCahxXurXiBnoxPH0bv
 Rh5LDWJpBtOEEvxaRe+VqbZgtWijnovDMoqt5q3LCmpVKwQQuWEqInuJ5KwRDmzo8XzlNZqbFgU
 Z1cSSm5FIQ/Jxk7n+IwhchTotUwxnhKczdstYQD9XVmPzAnJjKmiCDiPoxWxF/ZUagF+yQUFtEr
 pldHXDqfNdQ6bvRkPTZ6FJWdibEDXLn+I5FD+f6cb5srt3R593FYZenOk/m/YXAB04n3veKGyof
 POpcUVLy6Wxb3c9atc+UpYetlj8nm70+oBRzJ4ELP1BP+vsFvo5WGiBE0kRwLhJm+8tZ+bEiT1e
 pVuCWPLqDXXCPuX9u3AQ==
X-Google-Smtp-Source: AGHT+IHPevrCnRovXZqzX84Nbz2O+It20rrzguCm4ovI6xaboQyyq4zgnPsfmTU1VjFrFsE0ld2dqQ==
X-Received: by 2002:a05:600c:4684:b0:477:9c73:2680 with SMTP id
 5b1f17b1804b1-477c01bf658mr8725945e9.23.1763698862562; 
 Thu, 20 Nov 2025 20:21:02 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf36d1fasm20515305e9.7.2025.11.20.20.21.02
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Nov 2025 20:21:02 -0800 (PST)
Message-ID: <691fe8ae.050a0220.17832e.637a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 21 Nov 2025 04:21:02 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763698863; x=1764303663; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=6ApSaGF5RM2wu7PwN5A+85m2ug8I4QtKRqLEav1rXNU=;
 b=DIygwFs6QAFpZ0+rI3TadPovLTr43RPU3NkpHodNuifq2WuibxRorGojX+uLafaiG9
 c8WvBQBXwcstIxq87e+Vyt8GYC+FtHx/qWRkB9P3mwRLYXzU+wVfe3/QJ5sxYAR31qGr
 Zm1w9WU3eE7OtLcihS2ftn/4CIFG77CWiTv3wcKUSrI2cbUlFwiLMvLTVP3UsjkqWrXZ
 ArsAf1QUlfIEromFFYW7py1oUOVViDQg+7l/oo73xKy6HDRhBp9I9+pIK7peuYZAVaaL
 bOhMYI2c3WyNDdFpTC9OZ/mBQxJ45MmnGdPKn7qOCiADCgnGWIHanJ6oaTuS4j6rn2YE
 LXnA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=DIygwFs6
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-11-20
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

Autobuild statistics for 2025-11-20
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 11  | 22  |  0  | 33  |
  2025.05.x  |  2  |  9  |  0  | 11  |
  2025.08.x  |  2  |  9  |  0  | 11  |
    master   | 40  | 84  |  1  | 125 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 5 
                     kbd-2.9.0 | 4 
                  linux-6.17.8 | 4 
             berkeleydb-5.3.28 | 3 
                   cvs-1.12.13 | 3 
             dahdi-linux-3.3.0 | 2 
           dmraid-1.0.0.rc16-3 | 2 
                 host-gdb-14.2 | 2 
                    mpir-3.0.0 | 2 
                netdata-1.37.1 | 2 
                openssh-10.2p1 | 2 
                   perl-5.40.2 | 2 
          aardvark-dns-v1.17.0 | 1 
                 apache-2.4.65 | 1 
               asterisk-22.5.2 | 1 
              bats-core-1.12.0 | 1 
                 c-icap-0.5.10 | 1 
                     criu-3.19 | 1 
                   dante-1.4.4 | 1 
 docker-credential-gcr-v2.1.30 | 1 
             drbd-utils-9.21.4 | 1 
            erofs-utils-1.8.10 | 1 
                  ffmpeg-6.1.3 | 1 
                      fio-3.41 | 1 
firmware-utils-86739f2b3ae9... | 1 
               freetype-2.14.1 | 1 
                   gssdp-1.6.4 | 1 
                heirloom-mailx | 1 
               host-attr-2.5.2 | 1 
         host-e2fsprogs-1.47.3 | 1 
                host-gperf-3.3 | 1 
              host-guile-3.0.9 | 1 
            host-libtool-2.4.6 | 1 
                host-mpc-1.3.1 | 1 
              host-pcre2-10.47 | 1 
                   i2pd-2.58.0 | 1 
            igd2-for-linux-2.2 | 1 
            igh-ethercat-1.6.3 | 1 
kismet-52bcb902e36b2df1562c... | 1 
                  libbpf-1.6.2 | 1 
                 libbsd-0.12.2 | 1 
                   libcap-2.77 | 1 
                  libnids-1.26 | 1 
                  libsvg-0.1.4 | 1 
libuci-f3fc0b76040685829191... | 1 
               libunwind-1.8.1 | 1 
                  liburing-2.6 | 1 
                 lockdev-1.0.3 | 1 
                 netsnmp-5.9.4 | 1 
                     nvme-2.15 | 1 
                openocd-0.12.0 | 1 
                parprouted-0.7 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 
                  readline-8.3 | 1 
                   rubix-1.0.6 | 1 
                    sdl-1.2.15 | 1 
      softether-4.30-9700-beta | 1 
          sphinxbase-5prealpha | 1 
               syslog-ng-4.8.3 | 1 
                systemd-257.10 | 1 
              tailscale-1.78.1 | 1 
           uboot-tools-2025.10 | 1 
                unbound-1.21.1 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/f8827790c4256f1741bb9db98ef49674de06339c | ORPH
loongarch64  |         apache-2.4.65          | NOK | https://autobuild.buildroot.org/results/006297176b00e7e6014141ee4bb4170d05a050d6 |     
   armeb     |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/a0a7945b0813ca422b9dd2687117344e03cd1623 |     
  aarch64    |        bats-core-1.12.0        | NOK | https://autobuild.buildroot.org/results/095c21467da35c6ce6745a2c4e55e086162150e7 |     
  aarch64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/fb8e798c13666628ab6dcbaece20378e8cd8bce4 | ORPH
   xtensa    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/ba445f8ffad03c108f6f80338289cf5d65b78d39 | ORPH
   x86_64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/331aa887ca4d76a9cd96630873bbc5bf800f4021 | ORPH
   s390x     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/3aaa38d46e01e0d216773ceefa9d9a02c876d4ba | ORPH
  aarch64    |           criu-3.19            | NOK | https://autobuild.buildroot.org/results/0ad2c1e4536db95169557dafc1a15386a5026a04 |     
   arceb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/c693cba08f37e9316c8da91786dc573c91c5cbdd | ORPH
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/5534102484d41f101320e417260fa894c2a75976 | ORPH
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/04655fd576a76e14c769cb209b298eb61e2346ca | ORPH
  aarch64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0ff807a1512eb240a8d9eaba47569e7c5080cf8f | ORPH
    arc      |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/3da5c9b814af4a34b62f037ce06241e7e6b733f8 | ORPH
 microblaze  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/289d644ba446e1505c19836480af92d3b89e6603 | ORPH
    or1k     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/b7a34ea4356b2a3a10dc209146ab7cac7b51da89 | ORPH
microblazeel |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/cbe3b6d5763c52adf183dd942d3c7d748c5df733 | ORPH
  riscv64    | docker-credential-gcr-v2.1.30  | NOK | https://autobuild.buildroot.org/results/c2b00c69079cd87307e63a9f6419811c3571e125 | ORPH
 microblaze  |       drbd-utils-9.21.4        | NOK | https://autobuild.buildroot.org/results/e2238d7dc7f2aad3ba8b98ddff943af713747d91 |     
    m68k     |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/9c8d39ff22e543e022e95fcd50306dd5c9c33c3c |     
    arc      |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/154fef27143c421dba599a51f0e503c0ccb59183 |     
   mipsel    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/c74529b5a3800af269b6819af3cc742ba348d5fe |     
   arceb     | firmware-utils-86739f2b3ae9... | NOK | https://autobuild.buildroot.org/results/94d5fdadbb0c6c0f2944ea5e0f593d1ac16c1fac |     
   s390x     |        freetype-2.14.1         | NOK | https://autobuild.buildroot.org/results/7902a1e20757cf87fd01a6eb3b87919cfbec0373 |     
    or1k     |          gssdp-1.6.4           | NOK | https://autobuild.buildroot.org/results/f8eb12079e73cdbb6f5c342c6df28523c2b723d9 |     
   armeb     |         heirloom-mailx         | TIM | https://autobuild.buildroot.org/results/e23e58326d202aa5e9d018f1e29ba3333b8d9b0e |     
powerpc64le  |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/8b14f39c0e08fde378b29b960eba183820318f2a |     
powerpc64le  |     host-e2fsprogs-1.47.3      | NOK | https://autobuild.buildroot.org/results/643fe5a2d95dd511537e0e2357d4b3a00fd23c10 | ORPH
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/2805f6b2cb8a0134d3defb3d2cc2c8686a0f18d5 | ORPH
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/c2ce6aa95876796d675377c6a3fa02a58135cf90 | ORPH
microblazeel |         host-gperf-3.3         | NOK | https://autobuild.buildroot.org/results/e2be3526c479a6b55aaa3dfe8e007ce334d44e52 | ORPH
  mips64el   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/b59b03ae495f16e6d7c81302c16ab870a1b4dd28 |     
    i686     |       host-libtool-2.4.6       | NOK | https://autobuild.buildroot.org/results/77d34e0fddf8ccfe7ecd7aa3ee1e3d21af83e358 | ORPH
loongarch64  |         host-mpc-1.3.1         | NOK | https://autobuild.buildroot.org/results/d4f3a86cf4df09a3ae49d4b1258756e3ff40d048 | ORPH
   sh4eb     |        host-pcre2-10.47        | NOK | https://autobuild.buildroot.org/results/3a9a8c975bf5ba9c8c322fe682a3518c87c3acc2 | ORPH
 microblaze  |          i2pd-2.58.0           | NOK | https://autobuild.buildroot.org/results/e83be246d2036937f64a70d30d4754c50804a9cf |     
    m68k     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/ee582e7444c07fe0bb790efb93ca0601edc2192c |     
   x86_64    |       igh-ethercat-1.6.3       | NOK | https://autobuild.buildroot.org/results/02aa65f2ed5a153056b49ef2abf846da88fcdaf2 |     
 powerpc64   |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/b243846809c740aa6c5860e697d32fe3dd4e7dde | ORPH
   x86_64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/1f2e818a9e2e2aadcfcbaee4211ddc1739c70ec2 | ORPH
  powerpc    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/79e712f0cae0935121703754a952750df8356a37 | ORPH
   mipsel    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/98ad68f0a27f812df59c20002266e1a8673bc85f | ORPH
 aarch64_be  | kismet-52bcb902e36b2df1562c... | NOK | https://autobuild.buildroot.org/results/543fb0dd04bd3ed04a906a99cc50b0c37bcb89d2 | ORPH
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/414432be5054010eaf9257e11e056435356525f5 |     
   arceb     |         libbsd-0.12.2          | NOK | https://autobuild.buildroot.org/results/bc63e38cb687b8a3cbb8fd0de5ad96059916474e | ORPH
   armeb     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/abe03ec588100dbee1439d1d6ca676c321e3ff96 |     
  powerpc    |          libnids-1.26          | NOK | https://autobuild.buildroot.org/results/487f9922b694ecd8a38f3ebf8981f5f49a791f5e |     
  sparc64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/21cd317ff16efef2635424a6c7cc8a7a998b346f |     
   sparc     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/2c0dabcce23c0abb7a87023315ae0752ca7ad58e |     
   mips64    |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/56a1c67a469089b72d238ed874fb3160cab69924 | ORPH
    sh4a     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/509f835d654d594181f8fd3773eb6026bae6ab2e |     
   xtensa    |          linux-6.17.8          | NOK | https://autobuild.buildroot.org/results/7cb711c8ed0a8d265141269d535a4c7a423793d8 | ORPH
   x86_64    |          linux-6.17.8          | NOK | https://autobuild.buildroot.org/results/e945444273096a50c949985ed07852892288cf57 | ORPH
  mips64el   |          linux-6.17.8          | NOK | https://autobuild.buildroot.org/results/d1f474c7f5ed5f99f6b1fc4e19ac5afa606e7ee1 | ORPH
powerpc64le  |          linux-6.17.8          | NOK | https://autobuild.buildroot.org/results/6923b1aaad2ae3f8c742ff1b4faab93648269227 | ORPH
   s390x     |         lockdev-1.0.3          | NOK | https://autobuild.buildroot.org/results/dc4cf8a11b2a580753879bd9abae09639912b3d4 | ORPH
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/6727fbb22c2566a74f1de5468d230e94a16b2047 |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/010d271565dfbc48cf5ba10a9ff8db9f6d2fa52d |     
 powerpc64   |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/180db90f4074a433a610e5aa74a7343431cb3740 |     
  aarch64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/7b764485f1c23f4957f72ddf376753cf220a60be |     
 microblaze  |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/692616c60d97f7582e43c384f6b4d740399d86ea | ORPH
 microblaze  |           nvme-2.15            | NOK | https://autobuild.buildroot.org/results/2d1f55e23e7094732deb51828e60925d34bbb198 | ORPH
   arceb     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/70096932d50aeb644d4683a68f84198efd0eebf7 | ORPH
   mipsel    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/2806e3247e4f2caddae743d4d1cbccb243c5d0c9 | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/ac6f786a6ca1e54bf2c6fd23ba6600e7ccd5e273 | ORPH
loongarch64  |         parprouted-0.7         | NOK | https://autobuild.buildroot.org/results/31237616a517b339a64b3c70395b86437ad718bf | ORPH
   xtensa    |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/fc76af0f370d3b43514d5921cddc19112a53a2fb |     
loongarch64  |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/92e0218c77099c261e9f0ab4e3f1f07721d1fcf0 |     
 microblaze  | pistache-3ec9d7c4f8b828fdd3... | NOK | https://autobuild.buildroot.org/results/4a0b374ced605786f0f667066a3e839c057b9e4a | ORPH
   s390x     |          readline-8.3          | NOK | https://autobuild.buildroot.org/results/936a5b40f93500f534b4b0612239ded8adf77f07 | ORPH
    m68k     |          rubix-1.0.6           | NOK | https://autobuild.buildroot.org/results/0a86f131afa72ca1be73a10635c95ca7974b49f8 | ORPH
   s390x     |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/6194f8202dccb3be869827f88dfc977459b0a567 | ORPH
  mips64el   |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/2139e3bf25b4017a4ec6d18fe91a81f1dfb917a4 | ORPH
loongarch64  |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/0077e274d805a3a386f89d9c3a2184deddf52003 |     
    m68k     |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/7a1328e59d21842257e51d54bda45d5b51d3d0d9 |     
   mipsel    |         systemd-257.10         | NOK | https://autobuild.buildroot.org/results/97614aca9d8e511330a6f1cfd16cd8f8bd9d8ef1 |     
   x86_64    |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/a7a731ca68f5b5306ce8cdd51daf56787f385cf6 |     
    m68k     |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/98d8887fff61475ae38e9a404fbe14f6444663b1 | ORPH
 aarch64_be  |         unbound-1.21.1         | NOK | https://autobuild.buildroot.org/results/d3d6b84ba667e3e2586b7cfdaddcd160232eddfd |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/b78fe99ba736f55bd820e07decfa4bd2dd1267fd |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/b80bbd80ff87899462c5b5125c168dac62ff3856 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/11c5df08abab1972e13a4cb699e334f45857df9b |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/e622f6169e391e959f359da16732412a39302f39 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/884783e3f3de3bf0abc2aa5c4242271487515850 |     
    arm      |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/3c7e5463fc240558dea3e741c1ede4b543bbf377 |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
 host-binutils-bare-metal-2.44 | 1 
               iptables-1.8.11 | 1 
                 libbson-1.9.5 | 1 
                libroxml-3.0.2 | 1 
            libxkbcommon-1.9.2 | 1 
                 linux-6.16.12 | 1 
               mongrel2-1.13.0 | 1 
                    sdl-1.2.15 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    sh4a     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/a869c860849805fc9c4acfe4b6e887d25ea4bc4b |     
    i686     | host-binutils-bare-metal-2.44  | NOK | https://autobuild.buildroot.org/results/58c14a24fba039dd03d891fd51b12399d5ef8db3 |     
loongarch64  |        iptables-1.8.11         | NOK | https://autobuild.buildroot.org/results/2f0514544de7c603f7837e3645c74cd4296b064e | ORPH
    or1k     |         libbson-1.9.5          | NOK | https://autobuild.buildroot.org/results/3590a4f3db58c4407cf614c8b50084e5b14b831c |     
    i686     |         libroxml-3.0.2         | NOK | https://autobuild.buildroot.org/results/f502e5b895289705bb2f9604e84e2d4d51f557c0 |     
  riscv32    |       libxkbcommon-1.9.2       | NOK | https://autobuild.buildroot.org/results/4674288e1299d60fff74b16954a8c6844cadcdd0 |     
  mips64el   |         linux-6.16.12          | NOK | https://autobuild.buildroot.org/results/f696dd94024e1af8f0ba8257097fc0b391a2c08f | ORPH
  aarch64    |        mongrel2-1.13.0         | NOK | https://autobuild.buildroot.org/results/99c6b87f2224c88e385d561a17699032d85e483a |     
loongarch64  |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/30ff073d5dec72d909c055213aa30f9b50c3d18d | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

             18xx-ti-utils-8.8 | 2 
               bctoolbox-4.4.8 | 1 
                busybox-1.37.0 | 1 
               collectd-5.12.0 | 1 
                  dlib-19.24.9 | 1 
                  ffmpeg-6.1.3 | 1 
                   fwupd-2.0.4 | 1 
               host-attr-2.5.2 | 1 
            host-libtool-2.4.6 | 1 
        host-sentry-cli-2.20.3 | 1 
              host-swipl-9.2.8 | 1 
                 libmbus-0.8.0 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                 linux-6.12.58 | 1 
                   linux-tools | 1 
                 openssh-9.9p2 | 1 
                   perl-5.40.2 | 1 
           python-zlmdb-23.1.1 | 1 
                  readline-8.2 | 1 
                  rp-pppoe-4.0 | 1 
uhttpd-15346de8d3ba42200249... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/c1c5ef187d8079f964e26fa6dfd2ce76d69670c7 |     
  mips64el   |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/2b8038c22497565d4dfedffa51a7dda3f1d5dcfb |     
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/9caec2de444be11e0f5f8d8b1a216cdb4c33ec49 |     
   sparc     |         busybox-1.37.0         | NOK | https://autobuild.buildroot.org/results/f02b332cca31d2086b19bf7b43de7e58c5dbc44c | ORPH
   sparc     |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/f3d1752431a772ea43bd8b874c515b89f27186c9 | ORPH
microblazeel |          dlib-19.24.9          | NOK | https://autobuild.buildroot.org/results/ee31ff680b7f6d43859bd79d01dadd88b8f82664 |     
   arceb     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/eeb4c535424599091c300a03f198a594727662c5 |     
   s390x     |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/df84b1a403ababc09eb21e7fa8f7ac97a9fe96d7 |     
  powerpc    |        host-attr-2.5.2         | NOK | https://autobuild.buildroot.org/results/3f573d672e9febf230080d6c6b39624b7a18d109 |     
 microblaze  |       host-libtool-2.4.6       | NOK | https://autobuild.buildroot.org/results/44839e56d715f667e6cbaa7c78d5bf217a5c7944 | ORPH
  sparc64    |     host-sentry-cli-2.20.3     | NOK | https://autobuild.buildroot.org/results/beb3c262c8b7a15872beeddac2f8dff207042780 |     
 aarch64_be  |        host-swipl-9.2.8        | NOK | https://autobuild.buildroot.org/results/f8870a0be4625000bced3bdd866ce3a49a21b8de |     
 microblaze  |         libmbus-0.8.0          | NOK | https://autobuild.buildroot.org/results/daf32343a337e379f8d0e421ae2a1a98d17ac17c | ORPH
 powerpc64   | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/2dce159ea92a5283dce549fd3b007a26eb7e825b |     
 powerpc64   |         linux-6.12.58          | NOK | https://autobuild.buildroot.org/results/8df40882f154f0c27ccb3b38ac6eb01bb3f8c5f1 | ORPH
    or1k     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/7f9d804bded826ed7eaa66e3e30e946a36fe771c | ORPH
    i686     |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/eca626ab727debca94f8de6bce9405144221077f | ORPH
   sparc     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/800adbce661fdc82fec8455cf9738648c6e501d7 |     
  aarch64    |      python-zlmdb-23.1.1       | NOK | https://autobuild.buildroot.org/results/ddb5004db38c212240e1b35f06511815e311a9ba |     
   mipsel    |          readline-8.2          | NOK | https://autobuild.buildroot.org/results/18b2bb3ab1e6e24af2e62f055d92776debb9bce0 | ORPH
  sparc64    |          rp-pppoe-4.0          | NOK | https://autobuild.buildroot.org/results/a31f405acca743092d4ab991f5623763d072c0b0 | ORPH
  powerpc    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/41b7615d74119e2a9f49a70f16c48fb73ed3eb1b | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

              host-rust-1.86.0 | 2 
             18xx-ti-utils-8.8 | 1 
                    brltty-6.6 | 1 
  gobject-introspection-1.82.0 | 1 
                host-gperf-3.1 | 1 
                     nvme-1.12 | 1 
pixiewps-9e5bdc6c86c8487b2a... | 1 
                  readline-8.2 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |       18xx-ti-utils-8.8        | NOK | https://autobuild.buildroot.org/results/e26417598cb4e6dccd87fbc4fef22228b4f53a2a |     
powerpc64le  |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/98997174f8f543994bd3bf2840bca53805234014 |     
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/75d0c1cf7aa0cbe5d95cb01fb8e5c7184ae54b89 | ORPH
  aarch64    |         host-gperf-3.1         | NOK | https://autobuild.buildroot.org/results/318f46c0e9191655826962d5acbf86f15b94ec2d | ORPH
   x86_64    |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/4c80a48103305f92e8fe4c6b9aa399c8877f31b8 |     
   s390x     |        host-rust-1.86.0        | NOK | https://autobuild.buildroot.org/results/d6d11ce35d706ea11234987e66c9ac2b0ecec587 |     
    m68k     |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/73c3236047c7d1682fb37ecc84a9dc3cd4b2075d | ORPH
  powerpc    | pixiewps-9e5bdc6c86c8487b2a... | NOK | https://autobuild.buildroot.org/results/4b7a0a7b189b3ff8a64083b75b525b4f87349704 |     
  aarch64    |          readline-8.2          | NOK | https://autobuild.buildroot.org/results/018aef2f2b7440796538b45f0393dfbc7a02f61b | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
