Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF6DCC5AD5A
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 03:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC80F81354;
	Sat, 15 Aug 2026 03:28:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zcgcqJTKS-4z; Sat, 15 Aug 2026 03:28:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A373C81349
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786764502;
	bh=cu9BlLt91Qk3JJtQugJpawmvVd+wka3QxKDPN2EtgEc=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eZf2wPPlxhX3Dah0lqroYpDc3GhcZtNLRlzJntl7/SN3S0wZdCVAPjf3eoMLGAsNI
	 Ial0quKXagl1jILylpzrkmsJR8cgRafrjRXpxlCaR3aYy7govjRXZlpxq0ZTaGXog+
	 9BRoroI/OhI1SvA8NtQyksHuMOu+7OEN7kf5HP1DEOoGsp0LmSegwUxN6gfopKTVp3
	 SX/s+uIbBEZzztrjkoFuwSJxDwnO9FJZkgAySonmIxNY1fKKrSjwnNbXEegv8pOd+R
	 TmSMISiD3dsm1oNia7ilgCcQsc1uG70Gkm/FXeYlPSDnYvRAnMyxScgBXi6ozxdyGo
	 8sR1GQ7ue5tvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A373C81349;
	Sat, 15 Aug 2026 03:28:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4185C2BB
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 03:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1FB4D40C3E
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 03:28:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CctYM7-VI6ra for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 03:28:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::336; helo=mail-wm1-x336.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CEF7D40C35
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEF7D40C35
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=lCWVgDq6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CEF7D40C35
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 03:28:17 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-4954a32cf1eso8519685e9.3
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 20:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786764496; x=1787369296; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=nplraH0pHeg3jgaspVsI/Hug73mBs41UQHElwX+ycjw=;
 b=lCWVgDq6V8ChhaWydU2v1KVWqjXnrUGTh92QkRZUeHVLfYvevlGGPSN1DjWKi4BQgI
 Ks/7+SOVN3t4TZ+iasPRfZzPSb+AGpuowbB1WP7QsXYYauQqBqVcturjzyk2CMezT9aZ
 BpEB6bwMcGAs88tfuslNshRNvHEXZQPAzxnx2Q8djC4u8uEFIKMsINGZ6w6L5M25RL89
 XgHKb9jlx1Cok3nAeqHugGp+sbH4xCDHzq0ZMeH+yU3Km7JegSdnQbGqElpyQzloqUvD
 0/vV4ZJx2Wr5doGlDUWUd4D0sid/tcO4+tfHipwZ5my1kI4fpEuC45tIYC1HSBmi729O
 AEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786764496; x=1787369296;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=nplraH0pHeg3jgaspVsI/Hug73mBs41UQHElwX+ycjw=;
 b=rNI8YIlnSwmtl5DJTyUjw9RK/xe19ofnbTtUhVyyvS2r81gbmLLmjWbvYfRSMCwWKC
 e9DoEZDn54SFNhpMWJtQoMV4Cfi06tGuwbKREVhECI1rFZ5hJqRNOnidI/4fJyZjXjUD
 5+smhACZuPinjicdxB4Cx18FGWkgzHe1jFkLfYS2RgAyrDMXuXL5qzyo5PIY7wixvfeJ
 TnMPZx2P3IbJ95KSn/l+PWm8PeucF0+56RbjLjUD5r+N1VDNXGfOjVnttyFk5ImTJNwQ
 tKXQKBfvR132xDW9EulKlFFDE+eIgUzEMpPpffhepVg6DRS6g0FH5L17BCGThYUgc1K1
 xCow==
X-Gm-Message-State: AOJu0YxLH8WSJwa71f9ppCxQmGB4syjLLQWOeBWGcZtDTd7cdCEliHhN
 fuGtD28+Cryc65b44ZyWZSYAQdazN/6tlZGf6TOVQtyWHZwVAqQr92mH9m52lJRf
X-Gm-Gg: AR+sD13KRTj7TKmCf8RKHXAIQdNG1dQVj/QsmDqdJndZmHmk21C0YJLbgFOOFzljh0F
 dSgEeFmAALGO32ysbDU4W65q20wBIaiO3KlMFsHyh0ayHaSoILUwsGl2/cIYaI64NZ45FAKC1R6
 vLZSNCqho4RjeTBV/IFLAhiAvRvfZW5qlnHmDm5wTOelUF8Jc6G4k98wZ5YvmU5xD9U+TOkbf6v
 m04SEijMw7mtMRS4SkAJKPpt7JllW5YeGaPXFvH+59jKnXXs4pCo/NuuwOLVS2DZOb4A12iRAe0
 dKixj6A+qc9gcEQe9QLc4o/CcAG44HTgf4HfqVxyQ5AY5lGcvpTVKxSyfGlFHu0fcUeljmUhwvG
 SUeMOcKc4h3+Kovova7Ni0Hxa8BoZdZK4D4JYIBShE4Jk9wr1AHfekFwr8YwOPM5KR6rw+Awe/g
 GfmzREQE/kWau+CvKvd+WgolkZHsyr0D2z1R6gRPgDSG9ClPT0BKID/VXIcO2xTLZQddWBYZle3
 bY=
X-Received: by 2002:a05:600c:9a2:b0:493:a966:d5b5 with SMTP id
 5b1f17b1804b1-49987937932mr96980695e9.2.1786764495078; 
 Fri, 14 Aug 2026 20:28:15 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499906aaf1dsm6361625e9.4.2026.08.14.20.28.14
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Aug 2026 20:28:14 -0700 (PDT)
Message-ID: <6a7fdcce.56ad6a90.1248c9.e98d@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 15 Aug 2026 03:28:14 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-08-14
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

Autobuild statistics for 2026-08-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  8  | 21  |  0  | 29  |
  2026.02.x  |  0  |  8  |  0  |  8  |
  2026.05.x  |  3  | 14  |  0  | 17  |
    master   | 33  | 92  |  0  | 125 |

Classification of failures by reason for master
-----------------------------------------------

  gobject-introspection-1.86.0 | 4 
              jpeg-turbo-3.2.0 | 4 
package/vim/vim.mk:88: host... | 4 
          cloudflared-2026.6.1 | 3 
             dahdi-linux-3.3.0 | 3 
                   linux-7.1.8 | 3 
                 systemd-258.7 | 3 
                    attr-2.6.0 | 2 
           crucible-2025.05.28 | 2 
    host-gcc-bare-metal-16.2.0 | 2 
          host-intltool-0.51.0 | 2 
                  iozone-3.508 | 2 
                    olsr-0.9.8 | 2 
      passt-2025_06_11.0293c6f | 2 
uhttpd-15346de8d3ba42200249... | 2 
                       unknown | 2 
                 aichat-0.30.0 | 1 
am33x-cm3-fb484c5e54f2e31cf... | 1 
                    basu-0.2.1 | 1 
                  bind-9.20.26 | 1 
                  cairo-1.18.4 | 1 
               collectd-5.12.0 | 1 
              containerd-2.0.7 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
  distribution-registry-v3.0.0 | 1 
        edk2-edk2-stable202602 | 1 
                enscript-1.6.6 | 1 
                  ffmpeg-6.1.5 | 1 
              fftw-quad-3.3.10 | 1 
                           gdb | 1 
                  gnupg-1.4.23 | 1 
               gocryptfs-2.3.2 | 1 
          host-binutils-2.45.1 | 1 
       host-gcc-initial-14.4.0 | 1 
       host-gcc-initial-16.2.0 | 1 
                 host-gdb-17.1 | 1 
            host-go-src-1.26.5 | 1 
        host-libgpg-error-1.61 | 1 
    host-mender-artifact-4.4.1 | 1 
            host-mfgtools-0.02 | 1 
      host-uboot-tools-2026.07 | 1 
                 lapack-3.12.1 | 1 
               libepoxy-1.5.10 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
          libmicrohttpd-1.0.10 | 1 
                 libv4l-1.32.0 | 1 
               linux-pam-1.7.2 | 1 
                   linux-tools | 1 
        ltp-testsuite-20260529 | 1 
          lua-lunix-20220331-1 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
           oath-toolkit-2.6.14 | 1 
                 octave-11.1.0 | 1 
                opencv4-4.13.0 | 1 
                openocd-0.12.0 | 1 
                   perl-5.42.3 | 1 
python-remi-2022.7.27-37-g1... | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
rtl8821au-bb26b6b06c47b79c1... | 1 
                s6-dns-2.4.0.0 | 1 
                    szip-2.1.1 | 1 
          usb_modeswitch-2.6.2 | 1 
           virglrenderer-1.3.0 | 1 
            vorbis-tools-1.4.3 | 1 
                    which-2.23 | 1 
                 zabbix-7.2.13 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/64ddb8722e803fa1ddbac1d68b5a69be0dde6f11 |     
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/745b63a3cc43d2b3c596950008de4428722c8cc5 | ORPH
    i586     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/e92d0e4327518f85fccf0a37c4b25f2f5609e127 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/695698b793d7c3e0ffd4f3b15bde820fd2f15cff |     
    i686     |           basu-0.2.1           | NOK | https://autobuild.buildroot.org/results/3766957a46df51f24b2abf62ace5636a94a065d9 |     
    i586     |          bind-9.20.26          | NOK | https://autobuild.buildroot.org/results/13e07755101b7cae2f84eef173ef752f92842e71 |     
    hppa     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/a5ee815bd49784cc522e76e49a2a021a151a9e57 |     
    i686     |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/a2f565203315876043c04b33b0748cb9779ec9d6 |     
powerpc64le  |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/98875e28006b79e4296d1270ee0829da27256424 |     
    i686     |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/84f193385dc65a535a4f303df998e1dff65e339a |     
    i686     |        collectd-5.12.0         | NOK | https://autobuild.buildroot.org/results/59be0303844c3fbc08497c0cea99cedfec2e9b6a | ORPH
    i686     |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/bc1e0d14536eccd66d75bd24447edeb3c022cee2 |     
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/93b85c25ac456857b452f28a9512520684745e5e |     
  riscv64    |      crucible-2025.05.28       | NOK | https://autobuild.buildroot.org/results/4644257abc76538085ecb7ca6a266841f436496b |     
    i686     |      crucible-2025.05.28       | NOK | https://autobuild.buildroot.org/results/01414bccbb2e5abce669ab0bd769dd1e56a9ec65 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/590760f91983af7ce6728ce2555e5c74b585baf2 | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/93921e24fe9fafe51de26e396004f60a79308c85 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d808ee2191aa070be081670d89d62df4f7763b06 | ORPH
    i686     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/1f94d8aecf874fa7f517ae14b98808eb58fb7ba8 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/526987d2ac2f629236c430cf504e373c102ec354 |     
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/6d81437d000735a0d5d70ec250905e83f2e9d4b7 | ORPH
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/ca05d766d99264262727127bfeff044fc9c396fe |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/70bd043aa4fb4d47b56cc048b410f3b1d1fb90a4 | ORPH
    i686     |              gdb               | NOK | https://autobuild.buildroot.org/results/700b3bd88f21cc7d7617ebe8d1ec31660917a77b |     
    i686     |          gnupg-1.4.23          | NOK | https://autobuild.buildroot.org/results/260fc87a3ef2ad4972cac1b9cdf821f67f32e9b5 | ORPH
powerpc64le  |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/f92ae74d15277e59f5a961e3a020c9ed3a6a6253 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/35175bd29a44f74d0f641686ac924c9e045df230 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/a15f77a7eaca4568ece1e755abd0aafa4e3aa7d7 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/add6841e17d27bbcd7d23b0e0b029468b8bf9f47 | ORPH
    arm      |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/909b0a29c581c60b0fc28c68730bc0f728e2f578 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/1496017e63055bac315956cb5691907a7abacb1f |     
    i686     |   host-gcc-bare-metal-16.2.0   | NOK | https://autobuild.buildroot.org/results/3d6235b2f7e0746a7061873abbec01222c480178 |     
    i686     |   host-gcc-bare-metal-16.2.0   | NOK | https://autobuild.buildroot.org/results/9fb9ade6daf1aba270115d3deb5e5c851589692b |     
    i586     |    host-gcc-initial-14.4.0     | NOK | https://autobuild.buildroot.org/results/acc8ef4ac8019b7552962d05409d853daaab761c |     
   x86_64    |    host-gcc-initial-16.2.0     | NOK | https://autobuild.buildroot.org/results/d35cf15b8a9a93b9335f9ce2556ac9031c2ebf8c |     
    i686     |         host-gdb-17.1          | NOK | https://autobuild.buildroot.org/results/a51bb172bdbfebb4cf017b29a5c29eb54fe27830 | ORPH
    i686     |       host-go-src-1.26.5       | NOK | https://autobuild.buildroot.org/results/29c29b9cd092d4701b2afd0bb1dc91109e4bd899 |     
  mips64el   |      host-intltool-0.51.0      | NOK | https://autobuild.buildroot.org/results/e536c92abb9a7a096e3723e158b925113e9d0fd2 |     
 powerpc64   |      host-intltool-0.51.0      | NOK | https://autobuild.buildroot.org/results/b321284b108ca8f6e8aacd47fbe273a4501e0d51 |     
  aarch64    |     host-libgpg-error-1.61     | NOK | https://autobuild.buildroot.org/results/4691d0507776ed4aefd278dd95cc0752844a3d4d | ORPH
    i686     |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/5245493f7b39eabf5114ed7ee3b6913da934376f |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/43e61b520df2a4e8b0bef05c2d5b1ecbeb7c1e94 |     
loongarch64  |    host-uboot-tools-2026.07    | NOK | https://autobuild.buildroot.org/results/51512e95889130924e00600dd941972769c11ec9 | ORPH
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/308455cabe63f2013aa68fb1adcd355d02fdbac4 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/9e76865c061239e33913b1884c420be7520a29da |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/776e10a98bd4f0a8c648f065adf00a2b3354e5f0 |     
  aarch64    |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/40f91ea77f9271595048e9bb7db1ca709ce9cff0 |     
  powerpc    |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/82dba188db70d31d05183228fd0ac2c7641f9544 |     
    arm      |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/60e2db5601f994bbd156339e377283d78af5c4ac |     
   xtensa    |         lapack-3.12.1          | NOK | https://autobuild.buildroot.org/results/89821470fcf58c2f86e7625bd06b64436c9acf0c |     
  mips64el   |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/bfd17ad3684e62ff5a5d2ff28efdd5e6f2e2c1c6 |     
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/85f9472139cb7e5af1e8c3ad8ccd9ec1fac5e346 | ORPH
    i686     |      libmicrohttpd-1.0.10      | NOK | https://autobuild.buildroot.org/results/6ac0b4eef447d4dc3dfa5248300a7b37ee397bf5 |     
    i686     |         libv4l-1.32.0          | NOK | https://autobuild.buildroot.org/results/2fcb0bd71298b4d6e17010b623b27620d1730d40 |     
    i686     |          linux-7.1.8           | NOK | https://autobuild.buildroot.org/results/a25de803f1de4f5c93e2a11ab54b90b42b3a3347 | ORPH
    i686     |          linux-7.1.8           | NOK | https://autobuild.buildroot.org/results/7b8615a442df34101b6acac1b5a8d00ffabb4da0 | ORPH
    i686     |          linux-7.1.8           | NOK | https://autobuild.buildroot.org/results/b0472b605f6f42581a9c2ee714a21a9a78afb3c7 | ORPH
    mips     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/334928476a235054aca30758efd46a9162672bfd | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/b1e0a2130dd87dbcb1e4ba545d0444ef4f30f8cc | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/eed06d4ba33aa7a330760fb2a5a5292841397341 |     
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/3ad7dd4a3806f621d85f85693a8edbfc4068e16e |     
    mips     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/cc301f38696ba65d4e0b1b54269ec1ea08fbe46f |     
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/3f3bf7180c182925d8214fd321cb2e12348afa6e |     
    i686     |         octave-11.1.0          | NOK | https://autobuild.buildroot.org/results/34012786e67fe6cfc414e9fea4cfd1968f53faf7 |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/af6100aa5f959d033d1e2e2d611a265a11a1021b | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/a3dfa7779c15a6df4993ed44809b63d346d0f7c1 | ORPH
    i686     |         opencv4-4.13.0         | NOK | https://autobuild.buildroot.org/results/be28f04d42936a6dc3ee817a4e539af2838025e0 |     
  aarch64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/75e8e1cccf1364d72ae8a39d906ad604b438cbf9 | ORPH
    i586     | package/vim/vim.mk:88: host... | NOK | https://autobuild.buildroot.org/results/6f9e3f7c4e9eea1a469ba92e3ebc36cd9668b2af |     
 aarch64_be  | package/vim/vim.mk:88: host... | NOK | https://autobuild.buildroot.org/results/3b8cba65c14c32260b635f01da59608d5985d5ba |     
powerpc64le  | package/vim/vim.mk:88: host... | NOK | https://autobuild.buildroot.org/results/ea5967af7a289cd45d04bc3d64f5fa8d78939727 |     
    i686     | package/vim/vim.mk:88: host... | NOK | https://autobuild.buildroot.org/results/f654d5c44db67139bff0607241f3baf9e9673fe7 |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/46b8b8c6bc4215cdc08cfe0d2c0a0b9d5f79d6fc | ORPH
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/4f9908c5fcafb583d3995a8668c4021d3dd17b58 | ORPH
    or1k     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/6d726f0e5ffd0813911f14be38146167e398fecf |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/800dd17add9045877aec1df4657eecd5410abc08 |     
    i686     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/24ddf69a7fa36de34954f1e82eac15604c480305 |     
  riscv64    | rtl8821au-bb26b6b06c47b79c1... | NOK | https://autobuild.buildroot.org/results/2f227e7426426a193ec21060934766b0e70f39c3 |     
    i686     |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/c6d76a2a49bdcd2704512f84b14b90f756b2c6fc |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/ebbc96f43f5586e3d582b75ac2941e156372455a |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/146d311db602c24d519b688ff305f0b9869acca8 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/b4387b4dcef6d8626781547e84d931085f647a31 |     
    arm      |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/fdca6b02fecd80086e116ccd44812e57f1b4665e |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/0b2bfe06127afd64cec879e65cd0c5db3f2dccfd | ORPH
  mips64el   | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/d208e5789d8beded0250c0fec68cdabdc5b0b4cc | ORPH
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/adef84265f8f79ff77622f3a09e6e63d6112ab0f |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/d7054157d48035f1b2b61472e668926d82684df9 |     
    i686     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/5accc0e00e05d65bbabe85cf0d6bfa4dd5a3203e | ORPH
    mips     |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/580435c1d68abb885cb25a424b6ef6e93c308fcd |     
    i686     |       vorbis-tools-1.4.3       | NOK | https://autobuild.buildroot.org/results/dda9e20f43368898b913bf2b00a8491ba089643f | ORPH
powerpc64le  |           which-2.23           | NOK | https://autobuild.buildroot.org/results/b517f440296ba40d4bf08fe4841d185b40901775 | ORPH
    i686     |         zabbix-7.2.13          | NOK | https://autobuild.buildroot.org/results/cf3eac75bdb6be1817c97d352de7553aa4195246 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

               pulseaudio-17.0 | 2 
                  bcusdk-0.0.5 | 1 
                   ccrypt-1.11 | 1 
                     fd-10.3.0 | 1 
firmware-utils-c42a3bc53da8... | 1 
  gobject-introspection-1.84.0 | 1 
                haproxy-2.6.27 | 1 
          host-intltool-0.51.0 | 1 
                      icu-78.2 | 1 
                 libssh-0.11.5 | 1 
            minizip-zlib-1.3.1 | 1 
                 sudo-1.9.17p2 | 1 
x264-baee400fa9ced6f5481a72... | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/46a1320ca2eb52c0613753a205c52e12c89870a5 |     
   x86_64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/6b01a4e181ac9d016d2de535a615be7874cc81f3 | ORPH
   x86_64    |           fd-10.3.0            | NOK | https://autobuild.buildroot.org/results/c342848ef8be8f5c2914a7a7c91fe7b3780fba4c |     
  aarch64    | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/cc942615ffba59a1b2af7105b85979bd2f79c7e2 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/85687b151837ddc80546f6da58180a77da97a594 | ORPH
    i686     |         haproxy-2.6.27         | NOK | https://autobuild.buildroot.org/results/52475d17031010b4528333a67113815329f76d1a |     
   x86_64    |      host-intltool-0.51.0      | NOK | https://autobuild.buildroot.org/results/b1ea39f202363bbe647846ac684905c3e68af440 |     
    i686     |            icu-78.2            | NOK | https://autobuild.buildroot.org/results/6bfe472e8606637adf8de3eaa1f9010acffa429d | ORPH
    i686     |         libssh-0.11.5          | NOK | https://autobuild.buildroot.org/results/f93fa3c98aa1871932d2248dd915f9819c937349 | ORPH
    i686     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/454efdc588028d5bd47cfd20703b6068f6a530a3 |     
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/bb48d79f75d6881ed4d47f2ef4321296fdaa8faf | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/a6fae66f76b55eda4d719227906b342b8d0b762d | ORPH
    i686     |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/40646554d51b7d6b6bc830f50500675f8d3fecb0 | ORPH
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/15d48c5e11dec8805d56be2cad84e6e10f54b068 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                   bird-2.15.1 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
          cloudflared-2025.8.1 | 1 
                  ffmpeg-6.1.5 | 1 
glibc-2.42-67-g4ebd33dd77ea... | 1 
                memtest86-7.20 | 1 
            minizip-zlib-1.3.1 | 1 
                openswan-3.0.0 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/66422d16e3632842077f1c68d0c2b38fc37ec183 |     
    i686     | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/28b45d7c4a5412432100d3149c56353dfe4c2ef2 |     
    i686     |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/1704410c8bd5dd782dff30787c867b8eb5e9d63e |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/38dbddd16125a832c8c452a93cbc5ebbe0c1e99a |     
    i586     | glibc-2.42-67-g4ebd33dd77ea... | NOK | https://autobuild.buildroot.org/results/5f84bfaef62c2c294707779a76ef1051e0ef5fbb |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/60e48b3b9e3c61e96f679c39458991426acf2213 |     
  mips64el   |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/177e383b68b68fefd65473af881906b5b3f96103 |     
    i686     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/cc437f089a7fddaa6a3009b6e20d00d2ae6a0cdf |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

       host-gcc-initial-13.4.0 | 2 
                    brltty-6.6 | 1 
                cryptopp-8.9.0 | 1 
                   dante-1.4.4 | 1 
                freerdp-2.11.8 | 1 
  gobject-introspection-1.82.0 | 1 
            host-go-src-1.26.5 | 1 
                host-gperf-3.1 | 1 
             libgphoto2-2.5.27 | 1 
             libtorrent-0.13.8 | 1 
           libzenoh-pico-1.2.1 | 1 
                memtest86-7.20 | 1 
                openswan-3.0.0 | 1 
               pcsc-lite-2.1.0 | 1 
                pinentry-1.3.1 | 1 
                  readline-8.2 | 1 
rtl8188eu-f42fc9c45d2086c41... | 1 
                   taskd-1.1.0 | 1 
              udpcast-20230924 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           brltty-6.6           | NOK | https://autobuild.buildroot.org/results/ea480c816246bfcf856d3db02a8030fc3cfcff12 |     
    i686     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/8f214ead75d19e6052a63e5455883ff7054dbd90 |     
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/adc19334370ee502680de37e3e2c059c977fc334 | ORPH
    i686     |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/8bd5bb1eaa73e3c1323d59a413c4be142ec31a0c | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/b1730564ff2af12e2a9f6957f3cedff00b53e0cf | ORPH
    i686     |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/450ab81f0419b76e67cf93c7466f2c82f66badde |     
   armeb     |    host-gcc-initial-13.4.0     | NOK | https://autobuild.buildroot.org/results/3ccaaf6974eaac68ca0ea8cf5aa6da3c9e1c8af6 |     
    i686     |       host-go-src-1.26.5       | NOK | https://autobuild.buildroot.org/results/13dadfe909a44d903615f046c85f4c9c01ac0852 |     
microblazeel |         host-gperf-3.1         | NOK | https://autobuild.buildroot.org/results/b8a4da419bfbd9029e60df90d3479d9a73b68091 | ORPH
    i686     |       libgphoto2-2.5.27        | NOK | https://autobuild.buildroot.org/results/cf801d0dc1e62e62e30c8e6cd0d5d20ef24b58dd |     
    m68k     |       libtorrent-0.13.8        | NOK | https://autobuild.buildroot.org/results/dbd5dcbe4e08f68a9a479d49f9fc64edc6e89ebd | ORPH
    i686     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/cbe803004f0e1fc7e2c63c32bd98e589efa467ae |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/b95ddada692ecf86b641a6d84d7e355f09f7589b |     
    arm      |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/4224a092b27f1a4c7488971945465139b905de4c |     
    i586     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/092b3fe950716efdfe7801c4a781305028996f8a | ORPH
  sparc64    |         pinentry-1.3.1         | NOK | https://autobuild.buildroot.org/results/9cf4a89252fb7ced0e476be3197490377d78dc97 | ORPH
powerpc64le  |          readline-8.2          | NOK | https://autobuild.buildroot.org/results/8c3cff68f24a5918ead39eb84a15189ceda546bd | ORPH
   x86_64    | rtl8188eu-f42fc9c45d2086c41... | NOK | https://autobuild.buildroot.org/results/276ae27cf334099d97eaac9a52d7ca0717c5b3db |     
 microblaze  |          taskd-1.1.0           | NOK | https://autobuild.buildroot.org/results/6d9e1ad39aeed5cf2cf0e319a96b16fa290e1861 |     
    i686     |        udpcast-20230924        | NOK | https://autobuild.buildroot.org/results/a59ece78aba1bb3192071afdc316627fa2b45b60 | ORPH
   arceb     |            unknown             | NOK | https://autobuild.buildroot.org/results/4b37231293bfb90354cc9b60b40973bb4088b17d |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
