Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD50FC5CFCF
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 03:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8157C6065E;
	Fri, 14 Aug 2026 03:30:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nF7M2SG2wUqd; Fri, 14 Aug 2026 03:30:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5B8360670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786678226;
	bh=JCERmpYtzQmP2fZ4u51UcTVHYEl2FRpaqGmU8zdvvaQ=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gKdPTxkUP+6bTWUdKKGv3eOBy7/58P1DwoMM5oeaH2V2XeUnmRM8ODSAoycCFI2Az
	 WXtP76jto+JUyV0Wp868Dr4jy8JkdecfrQEuqKWbolDuddTfQNVaSEa6MJmxeS4QqC
	 7qw+MXmhIgG25OJ36XfffOIogg+O06/fe13SaV8kmYzgVCtqJFyB2PzcyOvZnzgd9L
	 Nek8WERmyjCA0fbClpqtf8XzUfSJSp6TrCPM5PyfOpmCl7Ak4bl81MueCMAQXAwRdN
	 AW5qP0pO1BZkHeXn4OC5FQ9f1ErAsUt1Juglah7MWg+PTKRT5rOkU200Wuk4BBRwJ8
	 VZHHj9oBmNwMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5B8360670;
	Fri, 14 Aug 2026 03:30:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E90E139B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 03:30:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 747CB40817
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 03:30:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZNYZKHL6kvC for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 03:30:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A821B40816
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A821B40816
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=qYivfInu
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A821B40816
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 03:30:23 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-493b966dd74so3536775e9.3
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 20:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786678221; x=1787283021; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=337SWCX/PtsgyVznkls1Na8LUhKXXW2HvrZ8EDzGsVQ=;
 b=qYivfInulswXVAFu+6SIeesrE4ZZBEjk6xpqvgro8HP1+b4KKNxp6l9ZMUQ42fiYPK
 c+jgmW9KKQr6Pbqg6xv0rUDM8nXHMmNA84DnWWF+6EbynlOkjX3dbRtQWN7FlIW0Bwpe
 5IK9DGt5H2jfz5q407YPjHwdwbfdewB6RePnrY3kGwtAm2oVYBTStQmghqYNp9bt4hZK
 GH84E/7JP4HdK2qebgifWQ07KEbGkEXu0uLV67fi1EjR6M5Sca3tvRUGCfrYVMiFhGER
 utJbbZHsKpApYepqWXv43a93pNB2ZZJFDeNOaspwuwN4M/dBN8qHPEzKQAdPJ8pz7ICh
 zRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786678221; x=1787283021;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=337SWCX/PtsgyVznkls1Na8LUhKXXW2HvrZ8EDzGsVQ=;
 b=qFG6MfwOxQaSOjgYVpDIA1vhNVQUX4JIS0sdhd8LBE2wD1ONOw28aihK/06+mZ2q1C
 POjUxvPGzpZaPaRdfnDedvvCctq0s9o+L3O/zQORVIPeZe4jgDRn2/TMbgeoEoTXuAb6
 vInnaOACe0gIGyV+8FLk+gj2SzEezxZjD5loeFMcFjEPHmaAZCcQjtnPtnICMM2SvRl7
 R1LpHODv0g46Mjn+d6Hhrb5uImoymz0PRbz8DsjBgf4Bx6kvivhvciVhFbKe42iu/UDt
 5nc9Xo/5I9WKBJYeRo9IEW+DBmUcgJeE6ZZYfno258rJqcmZh0O1FRVjceyWB1SjW7MU
 7Nvg==
X-Gm-Message-State: AOJu0Yz5t1y+JuGtPpXl8Ea3v5d+uVz+8IaglGPlJHj35gWbu/9B2R3R
 20GJPGGu2WXHobsBga/+w7/2k3FhLXkWhbIo+rqps9bg89EYWJbf8fil5nskIhOo
X-Gm-Gg: AR+sD1269In95IKMSdhqSqfIAK/8R6h4Hvvcmmkvucewjdh7Inzk4uw7oQE8KR6l3af
 LDsRxbXGeNYQSuBPtCXaGp1rFcGt8ZswqWVzUIPiXfFRTykId4A7W0SmObhdoPWZQE7csVt7raZ
 TuEIQ9GFPQhtWw/yxTzVAF65mFS9b0+/MCcr7KHYvV3+Y0Tl2K504P1BK80Dki8fWtngORLDE+q
 8aQWn1SYCxuFqxvIT08vKr4mZ2CUA9uhmZp9h/8MZFo+Bp/xSsh30TAaskSgZ/9CrSj+lCn1HRg
 aQmeEtPVbyT7hKh/4XeKw6UJFsyTIgJAife9fVAOUDMpKUErj8WO/tb5YVkV5pt0TdOAFzi8FYh
 SuJKvSkslOzbl93IgUabAfWMdo8j740fy3yyHbwZmG2LvLAL/EAyLQS+EFaUpqwM/qMYDVXwJ0I
 JWTQMW0UWwoO7b/kQ5DLScJ/nvqAeaEGhpEJuHe9JDeHrQvTSxGv1P2qohRkDTjQR0QngyMDmIO
 w==
X-Received: by 2002:a05:600c:3b1d:b0:499:79b9:e226 with SMTP id
 5b1f17b1804b1-49988057986mr20321555e9.0.1786678221194; 
 Thu, 13 Aug 2026 20:30:21 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49988af6d9fsm15877495e9.11.2026.08.13.20.30.20
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2026 20:30:20 -0700 (PDT)
Message-ID: <6a7e8bcc.9003f183.9ff12.2e6a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 14 Aug 2026 03:30:20 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-08-13
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

Autobuild statistics for 2026-08-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  | 22  |  0  | 27  |
  2026.02.x  |  3  |  9  |  0  | 12  |
  2026.05.x  |  3  | 10  |  0  | 13  |
    master   | 37  | 67  |  0  | 104 |

Classification of failures by reason for master
-----------------------------------------------

   openvmtools-11.3.5-18557794 | 4 
        edk2-edk2-stable202602 | 3 
    host-mender-artifact-4.4.1 | 3 
                    attr-2.6.0 | 2 
            host-mtools-4.0.48 | 2 
                    olsr-0.9.8 | 2 
               pulseaudio-17.0 | 2 
              skalibs-2.14.3.0 | 2 
                    szip-2.1.1 | 2 
uhttpd-15346de8d3ba42200249... | 2 
android-tools-4.2.2+git2013... | 1 
                   atop-2.13.0 | 1 
                  bind-9.20.26 | 1 
             dahdi-linux-3.3.0 | 1 
                drogon-v1.9.13 | 1 
                      fio-3.42 | 1 
            gdk-pixbuf-2.42.12 | 1 
               gst1-imx-0.13.1 | 1 
                haproxy-2.6.27 | 1 
            host-binutils-2.44 | 1 
       host-gcc-initial-16.2.0 | 1 
            host-go-src-1.26.5 | 1 
host-google-breakpad-f49c2f... | 1 
                 host-tar-1.35 | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
                jemalloc-5.3.1 | 1 
              jpeg-turbo-3.2.0 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
                 lcdproc-0.5.9 | 1 
                libosip2-5.3.1 | 1 
               libtasn1-4.21.0 | 1 
                   lmdb-0.9.35 | 1 
                    lua-ev-1.5 | 1 
                 mdevd-0.1.6.5 | 1 
                    ncmpc-0.52 | 1 
                 netcalc-2.1.7 | 1 
                  ntp-4.2.8p18 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                opencv4-4.13.0 | 1 
                openssh-10.4p1 | 1 
package/vim/vim.mk:88: host... | 1 
      passt-2025_06_11.0293c6f | 1 
                  pdmenu-1.3.6 | 1 
python-remi-2022.7.27-37-g1... | 1 
rtl8723ds-122a574f780da32bb... | 1 
                 rtptools-1.22 | 1 
         s6-linux-init-1.1.2.1 | 1 
        s6-linux-utils-2.6.2.1 | 1 
           sane-backends-1.4.0 | 1 
               tcf-agent-1.8.0 | 1 
                       unknown | 1 
                wtfutil-0.47.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/5f0a6610a07c311fc6d4ac6f388d0251bfdf4846 |     
   x86_64    |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/09b59d70cc6028f21fd9b79c98e6c142f55e1564 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/923c9adf2620cde16ac0e69d0f4e480d91568a71 |     
  aarch64    |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/bf7558f4d757d0f2c982b61a39d38429849c6192 |     
  riscv64    |          bind-9.20.26          | NOK | https://autobuild.buildroot.org/results/79e4cd0618ce4f6d6927f25edc467542086b5353 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/bd8173e42310dc766d4e3c2c45b08635e503f18c | ORPH
    i686     |         drogon-v1.9.13         | NOK | https://autobuild.buildroot.org/results/278781aa17e58720c1df87671422dc656a808324 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/55250acc0541cc131bdb7fb9c8f28ff149977ee9 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/f104669474daa4d4fc2aa8598f1cffe2d31de0d0 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/3abcd2b8da20fcd36327cc8fc75e335c14024dad |     
    i686     |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/92d4d254a5d7a6d939100ccb133be5194b658507 |     
    arm      |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/414acee302a3fd3e8e37cc81fa4ee22767747ef2 | ORPH
    arm      |        gst1-imx-0.13.1         | NOK | https://autobuild.buildroot.org/results/a150b2e1b04b1f05b96ea6dfc803a3c5208b40ec |     
    i686     |         haproxy-2.6.27         | NOK | https://autobuild.buildroot.org/results/45d2211cfe65e5d4242ab9063847488810f5f4d2 |     
  riscv64    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/724be8401baf4e3a98207d5dd30207f5aba2dbab |     
    i686     |    host-gcc-initial-16.2.0     | NOK | https://autobuild.buildroot.org/results/61900cfa45f08fdf6b2ff0b1e14ff46f304b9f57 |     
    i686     |       host-go-src-1.26.5       | NOK | https://autobuild.buildroot.org/results/cf321ad52ffecc9ed7ef3de0d8b9814989513670 |     
  aarch64    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/dd0281fc5ad8484ddc2c667504efc94eee979f52 |     
    i686     |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/f3068705104d3923a8c796fd057105e8e30b3cc3 |     
  aarch64    |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/d335178685699791b1ae09c78f061f4d59cbe554 |     
   mips64    |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/133437fadc0a2185f98b8a0dc0418e14d58bb1a8 |     
  riscv64    |       host-mtools-4.0.48       | NOK | https://autobuild.buildroot.org/results/3c77a6a44b7b4d8377726315ead98e29730c20f7 | ORPH
  mips64el   |       host-mtools-4.0.48       | NOK | https://autobuild.buildroot.org/results/8050f057eb25ca21a5aa08ecaf4f4bc791f03e2e | ORPH
    i686     |         host-tar-1.35          | NOK | https://autobuild.buildroot.org/results/cb7e751f2be1fb4e0179a9c3c241360d1fe4aeb3 | ORPH
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/4436ba85cf2ea6bdb7c27b7fa461e6812f8b35b8 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/afb7ebb1c1ebafcb8b0fa392327f68ce30a3ab68 |     
  riscv64    |         jemalloc-5.3.1         | NOK | https://autobuild.buildroot.org/results/432e932d08c6ce7deb7de657db34ffdabf1a6015 |     
  riscv64    |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/1ec4c657bf3d634c648550cec71e9606fad43f6d |     
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/b90f3ce5f14b185636fbc6b7f9950e9c0741b103 | ORPH
 microblaze  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/7780ceb9d5e4ce1144cd2d8b4246c6614f4f2ad3 | ORPH
    i586     |         libosip2-5.3.1         | NOK | https://autobuild.buildroot.org/results/11a5c0d1e90651f1b2e301080c855d160b65af93 |     
    i686     |        libtasn1-4.21.0         | NOK | https://autobuild.buildroot.org/results/72aa2c7b89b788226119f5359135b34edf3a9a4b | ORPH
   x86_64    |          lmdb-0.9.35           | NOK | https://autobuild.buildroot.org/results/7399f7cb0737236e8a968494b9aad5f624449ad0 | ORPH
   x86_64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/ae4c9bfaa6f2779c3de6d41eb5e1408e4555562f |     
    i686     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/909652da9c632ddf69e044e8c94fccd743474bb8 |     
    i686     |           ncmpc-0.52           | NOK | https://autobuild.buildroot.org/results/1565c9dfd47375563c0dabcbd55c5edb8f2a7f9b |     
    i686     |         netcalc-2.1.7          | NOK | https://autobuild.buildroot.org/results/15656499801fb6494136aa8920acd745a0010c39 |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/81297036d95e921d2e78c73d710faf174f8284bb |     
powerpc64le  |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/aa9960667d52c48b0a7b8b2166e9266c19c2e8a3 |     
  riscv64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/3d6d33e8d3a6a149f2d0cbb9ad302016d16b756f | ORPH
powerpc64le  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/18249a3a44491c07386cb0907d103495bd6cf6eb | ORPH
powerpc64le  |         opencv4-4.13.0         | NOK | https://autobuild.buildroot.org/results/b70df532d841856186151f6e9c79ab3e61aa8392 |     
loongarch64  |         openssh-10.4p1         | NOK | https://autobuild.buildroot.org/results/71c2acb450702ebffa00478ea1af0d3ec7f6393f | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/aa0b5225115600580045e6215ab67ccb92013027 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/3beeeb6bc869189d0f0c18ccaab95186237c157b |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/d1ee2da803b955441a020efb7aac381250c48bbe |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/1007f351f3626b6e3fdf2412601b6024a22a901b |     
    i686     | package/vim/vim.mk:88: host... | NOK | https://autobuild.buildroot.org/results/34ecd262527ceed871ac5dc10a73298a1b2bc4a0 |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/277a5ae9b6e2b897d4f2b53cd3bae353474f09a7 | ORPH
    i686     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/c410c0e758f42baa1a5d2d02dba0368998e20b7d |     
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/58027b7adbfbbaeabc726582db871515eb8c86ee | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/aaca36eb36a0a1fc60bdb78b266f0210b1d10c70 | ORPH
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/91bab6aa6048beb6470819f97902edc4f90232a7 |     
    i686     | rtl8723ds-122a574f780da32bb... | NOK | https://autobuild.buildroot.org/results/ee29e041cc9645cc352ae4de598f6059d8e772a3 |     
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/78da1fe75cb56991d1762073ae37b11779112db7 | ORPH
  mips64el   |     s6-linux-init-1.1.2.1      | NOK | https://autobuild.buildroot.org/results/463f7d24b2b8b792ae362cd632480d61b6a413e7 |     
    i686     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/749c2bda7ac5e4377fb2c2d1faad1e0a4ac6f967 |     
    i686     |      sane-backends-1.4.0       | NOK | https://autobuild.buildroot.org/results/225c094ee9257223e3afce09d5b1390e0dd3eb16 |     
    i686     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/0d5edb27267542b8b5cc8d4f0f4682a04387a729 |     
    i686     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/75584a30801c616b800f19ad28a3ec24c44ef6ff |     
    i686     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/289d86544065bafafed2de2a41ce907efc6baa67 |     
   x86_64    |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/f70f2e57a50f24b5cd037ef3e3a3b1c122a49e3d |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/bea5cafe568d186814fb02b4300fdf8a13e54b7c |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/5f82ba79ef1c2a1e6dfe8ea41eaf20f69407eee0 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/e92ec7780036fdebb555a8fa53cd7a3c0488b69f | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/ba8401da4ddc2e5753dfb35f6f6c0d0559fba202 |     
    i686     |         wtfutil-0.47.1         | NOK | https://autobuild.buildroot.org/results/601dda43ded80aab5d5304d25dac66808052ff64 | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                   perl-5.42.2 | 2 
          cloudflared-2025.8.1 | 1 
  gobject-introspection-1.84.0 | 1 
       host-gcc-initial-13.4.0 | 1 
                     kbd-2.9.0 | 1 
                    lua-ev-1.5 | 1 
             superiotool-24.05 | 1 
                       unknown | 1 
               valgrind-3.26.0 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/936d224bd46306d5ee324ed27afe9f303e33ccb5 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b25af8b402a7e5e191c3257c3e2868f2085bce5b | ORPH
  riscv64    |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/66e66f92714b25d2d08b8daad265a8abed9ea4cf |     
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/89b0bd22de1423ba16497d035e7614c28d1e15d7 | ORPH
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/ed195cefa841c5681ceee40d5cce382d53725244 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/af69712c783da8552af3044d9577188cc58f73d1 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/1399fd7915011b5e8facefbb74bf2cea190534a4 |     
    i686     |       superiotool-24.05        | NOK | https://autobuild.buildroot.org/results/507bb702f562332b3425844a25eb4995bdf9d15f |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/e63dd5427275cc79adfbf64e2f813b3f488ba6d5 |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/ce40ed82f561c70064d112d1e987f81fdb615c94 | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

cegui-e7a03afc70c6182a091ff... | 1 
 docker-credential-gcr-v2.1.30 | 1 
                  ffmpeg-6.1.5 | 1 
       host-gcc-initial-15.2.0 | 1 
        ltp-testsuite-20250930 | 1 
           oath-toolkit-2.6.13 | 1 
                opencv4-4.13.0 | 1 
           python-zlmdb-23.1.1 | 1 
                    szip-2.1.1 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/0e5b9a97e2086cb7f4434a559fb40c9163fe87be |     
    i686     | docker-credential-gcr-v2.1.30  | NOK | https://autobuild.buildroot.org/results/aa5754a547f6dea3165e598f8e22b6cbe3b38f5b |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/63ef922c72de47ec33f82bc29d9f92fd9493654b |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/a4a8b1095553ad0bbfd2e93b9654eb111636f1d3 |     
    i686     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/1be40d04c44e45f2ce3ed788bdd9fe0edc545bfe |     
  mips64el   |      oath-toolkit-2.6.13       | NOK | https://autobuild.buildroot.org/results/c792108b247148c7320389492ffd1c9c553ca58a |     
    i686     |         opencv4-4.13.0         | NOK | https://autobuild.buildroot.org/results/db4b80bb4f08123febe1f5ab6a06a26eb5257d58 |     
 aarch64_be  |      python-zlmdb-23.1.1       | NOK | https://autobuild.buildroot.org/results/022153708f4e7e91d3901e49804b11cc4028c817 |     
    mips     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/e593744a744dfa28bd745e76caa8e47bee9fdf85 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

    host-gcc-bare-metal-14.3.0 | 4 
       host-gcc-initial-13.4.0 | 2 
                memtest86-7.20 | 2 
package/linux-headers/linux... | 2 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
  gobject-introspection-1.82.0 | 1 
                 libp11-0.4.12 | 1 
                  liburing-2.6 | 1 
                   linux-tools | 1 
        ltp-testsuite-20250130 | 1 
                   perl-5.40.5 | 1 
rtl8192eu-6755ce9c15bbcb5dc... | 1 
        s6-linux-utils-2.6.2.0 | 1 
                systemd-256.17 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b1d871a14880deeccaf9b5351160ad7d58d836d1 | ORPH
    i586     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/5956c49400e4d7763fef7f6e49054cc14bb240da | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/00f9db1c05fc6b90a5091ca8627a1278784fa425 | ORPH
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/8119863e1adde003514ea7dfc27cb49a4499f177 |     
  riscv64    |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/12770679b56c8db51431a344de84da4350275155 |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/390c44a861e00f574cfb7f0fddffae090413260b |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/f6e540c9933a4ea6cabe5434fa97b4ca31da8d19 |     
    arm      |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/90a2be547a5a9b61344f123761785d007b922fdf |     
    i686     |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/f7e924e392f086ef5cb21cd563c5569fc7898587 |     
   arceb     |         libp11-0.4.12          | NOK | https://autobuild.buildroot.org/results/4fadaf0ced9cae6beedd3a36b722e95070ca8f98 | ORPH
    sh4      |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/08b80b392a89f0f54faf3801d13838eb4d5cfd7b |     
   sh4eb     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/68ccab9916bdc8c01749684f3bea116b84e649ad | ORPH
    i686     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/9b94a70ec8feec75b3754c2a98b18a298ee1d23e |     
    i586     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/5bdd7a0ca29500fe4aed15953b473e1d12a195b2 |     
    i586     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/f664d15d2ee3e16db54ec8593886ef3a71487612 |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/31a8b46a10dd9bfdddf710b3bf680d950dfbd440 |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/d1f56e88eab352e4cc0a38d4c6cf25685425b61f |     
  mips64el   |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/f0ff75f828561093ff0e6dbe626b43d66122fe9a |     
microblazeel | rtl8192eu-6755ce9c15bbcb5dc... | NOK | https://autobuild.buildroot.org/results/8cc23b02fe68076888d0d5df038b80ab3c2e9d31 |     
  mips64el   |     s6-linux-utils-2.6.2.0     | NOK | https://autobuild.buildroot.org/results/11d8172c7967778ba1d3283cb9357b12adbab343 |     
    i686     |         systemd-256.17         | NOK | https://autobuild.buildroot.org/results/6d8cc0093ed7f75067c46451fc14cd74206d2e7f |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/0451919d845c8a71279ea86b1e7620f5b263ffa7 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
