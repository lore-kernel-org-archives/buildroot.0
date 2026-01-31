Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59826E6BF13
	for <buildroot@archiver.kernel.org>; Sat, 31 Jan 2026 04:23:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E49083D58;
	Sat, 31 Jan 2026 04:23:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JAITVpqwyWua; Sat, 31 Jan 2026 04:23:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A753839E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769833434;
	bh=hCMJFSU9xus/iyDDCarGYMpRoQ2crT4TTu9nRcNr2e8=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=q78Gf9WGVnvZhqZneM79koo9xB/LzltrW3aCnJi2esnv+f7dB4tpt19m3pSLla6rO
	 FWSZYtsqG3PhYA8gm9wkFA9Td5P/sjjOYZSSPy4kjZ5bYmQRFN80qHjvVIzslm/a1y
	 5uDlR902/EucuPBiQQKpC4xf+nUEbsquHJM0laIvHtfHH9AUJB9FT9gaA8uXigk9U1
	 oMT6/eFDVV4b+prgtX3Aoz821/P8JZSJF91A580ET3DzuauOXGYcYK180jzkiDuEE/
	 xTb7xeANFs5xOtwuNKEuinOX4ykeHdIJtExvga/PjoVS3e2g3jsfgZq+McQZPOxVJG
	 JiDw7sMbF7O2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A753839E0;
	Sat, 31 Jan 2026 04:23:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E64225F
 for <buildroot@buildroot.org>; Sat, 31 Jan 2026 04:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8221040D28
 for <buildroot@buildroot.org>; Sat, 31 Jan 2026 04:23:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ArT2YPWoAeTo for <buildroot@buildroot.org>;
 Sat, 31 Jan 2026 04:23:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 60C8040CBC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60C8040CBC
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60C8040CBC
 for <buildroot@buildroot.org>; Sat, 31 Jan 2026 04:23:50 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4801c2fae63so20277365e9.2
 for <buildroot@buildroot.org>; Fri, 30 Jan 2026 20:23:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769833428; x=1770438228;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MH2ROqmQeepU3WKTccVpYkEdd/32zx2DEEQ9npKuAxo=;
 b=PNkGRhoZWFw+PEPIl3haBBlEqN8l3lAR/ua9ZfqG6XmOfjhiY+15sZ0JVQLHEwGbOS
 1Uq8rUjLQAX1HuTwzuSEZW75PJpKwkxLrLAi8Fw5TVoKkvO1di7nhBar1u0CQwSZ4k41
 OeP7Z/u63qBXRy49M/bo8kHqCHNszM5p77C2UnLut/XqiQehR7bzyeds7SrwqrfegplX
 1/RXkgE+0H1z20HaV3hyCrN6X/qOEuHcAPx4zazM3giMQeIrLjR6RBMp1a2zhFqIdBZk
 12rxlwxP/dVApdqSis9idk5dnWVMHKlC9J27Td/lN8XHNfJhOH7r8KixO6JL2aN8F1UY
 MZ7g==
X-Gm-Message-State: AOJu0YzHP9FqchoPfYukMKyfyjpOF/jIcC9PpM8R7n90mvCRywcMdVJI
 ENoYzZtFHOi0Q+TbTh+HquN1Bsc0SJxlLeHWvHe0w3vt4P3r1fra2sqB7KzfdA==
X-Gm-Gg: AZuq6aK1Zh0fnOV0tcV8EXSRCbkSr5InCSeYRfdzZeFdqPk0YnoT9R2divKdF/rfk/r
 YoA3q0RvUPmgH3yqYFEtE72DWqodasaBzr+bvguzwDYn8wUxwr88VedGgw9T1m2BwTkpIGTQt2j
 y8O+/qlL/ambQkGHD4fh2BbaBra4/Zez3aqmykRHsxU0nKcx5Blc5MWWXVn3dJPg9I54FmnlOaS
 hqHV1QC1pIzBB2cOK/0hqr6vP/D5t2lYvhTBk6cV+K8tK/Srfybn85YXWzqwrxMt0RWHoJfMvBs
 cPnkMdbPuYSTJWS/QiFV33fLqeRwDJpkElVdBdp8U8mUTqfI1UoPeeQUA15wkvK5+RV1eoEu/Kk
 EDucfl9bvtqng3vcqVkx/nHq7x5C1ROoU+Vrc9xf5iilknVT1uRQi9Zl3eT2BR+pitUVWtTo5ST
 D7n0Fh8ZbKYiRST6kmRQ==
X-Received: by 2002:a05:600c:4750:b0:471:14af:c715 with SMTP id
 5b1f17b1804b1-482db447b7emr60303215e9.3.1769833428123; 
 Fri, 30 Jan 2026 20:23:48 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c428basm317429805e9.12.2026.01.30.20.23.47
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jan 2026 20:23:47 -0800 (PST)
Message-ID: <697d83d3.050a0220.1e073f.ae44@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 31 Jan 2026 04:23:47 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769833428; x=1770438228; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=MH2ROqmQeepU3WKTccVpYkEdd/32zx2DEEQ9npKuAxo=;
 b=l8ZFMAd2taN3CvW7G0Pnv68T4vwgshi3BNqyP2jn8ng5bwNCK7Ihk4JA61X5lnWvFF
 X4kid6oUOCjHuEVB1ftxy3ha9FwslppQa0JDLz0OCE0ZbGPd5C0l/jEVjId/9RgVhP+K
 QX3gqBWjxtKcHeRQaIRNhopXwe7oZVXV/vHVz0serJ4Ox4zrJ9rYAYx1tuGrl+YLKEAL
 fSEZ6uiz+xp7HL+sbargw3coDojAdmjIJuGS22q9FNd+bJ1QiWrAds8/Nrj0a78TfYAi
 oyhSc7VA2O+8EZyrbTklrR9pY4/Zr7mED5UHPNQXeAQmkhZ23W53Tp5z/11aaJU5Y3FN
 d+zg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=l8ZFMAd2
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-01-30
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

Autobuild statistics for 2026-01-30
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  9  |  0  | 14  |
  2025.11.x  |  3  |  2  |  0  |  5  |
    master   | 14  | 27  |  0  | 41  |

Classification of failures by reason for master
-----------------------------------------------

              libopenssl-3.6.1 | 4 
                       unknown | 2 
amazon-ecr-credential-helpe... | 1 
                 c-icap-0.5.10 | 1 
                   dash-0.5.13 | 1 
                 dc3dd-7.2.641 | 1 
                   fwupd-2.0.4 | 1 
  gobject-introspection-1.84.0 | 1 
                 host-gdb-14.2 | 1 
       host-nodejs-src-22.15.1 | 1 
libfutils-c326ce0cc2a735438... | 1 
     libphidget-2.1.9.20190409 | 1 
                  linux-6.18.7 | 1 
                    mpir-3.0.0 | 1 
                       mrp-1.2 | 1 
                netdata-1.37.1 | 1 
                opencv4-4.13.0 | 1 
                   perl-5.42.0 | 1 
               pulseaudio-17.0 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
             stress-ng-0.20.00 | 1 
uhttpd-15346de8d3ba42200249... | 1 
ustream-ssl-5a81c108d20e247... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/e335c0cac5591f62287786d45056a4615f670799 | ORPH
    arm      |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/5671c59c1726eb60ec7664ea154df8da8be6deba | ORPH
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/47347e52b9737ce5bd4505885774e5c922388ba4 |     
    i686     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/5bedf3f0b4f0e2ab1f8bfa04dab02a7c3ee321ba | ORPH
    or1k     |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/6b1b4e35ccba939bfd0e72407e8925e42bf51722 |     
loongarch64  |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/0060579c7635262999099505dc765eba59cfffda | ORPH
   sh4aeb    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/2e4e914eb136efb90ba0e92b53f2cf7664f22ac6 | ORPH
    mips     |    host-nodejs-src-22.15.1     | NOK | https://autobuild.buildroot.org/results/bf9025bfdb1d907c971c03bca844a3539b45b1c5 |     
powerpc64le  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/423026aabf6bc59b14d324b6da8f1d81f1f2dfb5 |     
 powerpc64   |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/59ab1dfbd881deb78db7f47d45020ea3360edd1d | ORPH
 powerpc64   |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/c4f52c9b0958ec10e635ca96e66b550bc8e40c34 | ORPH
 powerpc64   |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/4ef06b7f9b51197af2af6647b59c7f7efd24587d | ORPH
 powerpc64   |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/a7fdba51c84cd959778b623fcd8069fab705830d | ORPH
 aarch64_be  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/f290c02585f72c1d163ed214b8d1dbed3c1b12b5 |     
   sh4aeb    |          linux-6.18.7          | NOK | https://autobuild.buildroot.org/results/ae2ad880bfea52527cc208a5733242637f77592c | ORPH
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/f13a7ebcf10eb68066b06733e11bcc0c1184c3cd |     
    sh4      |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/09b3fded97de141f56e56548b0fdc303c26c5490 |     
   xtensa    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/c41ff10ecf1673c8e7a47083147fd70d6a02a251 |     
  aarch64    |         opencv4-4.13.0         | NOK | https://autobuild.buildroot.org/results/cb3b68c59567e87e2e8ecc46bb31026918f0c416 |     
    i686     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/e7f15c26c44fb50b5b1bf7836ae1d89f958b78fd |     
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/29418bbae309ebe6a163ef3e44105e960c4ce027 | ORPH
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/a9d0f08cd6f12963a78ee417ded62b0198dc9c49 |     
   sh4aeb    |       stress-ng-0.20.00        | NOK | https://autobuild.buildroot.org/results/5400c53c30e39f3685028508d4ffb94e0917c089 |     
    arc      | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/c21fe0928a8856dbf3bed13dcb9e41ce8e924936 | ORPH
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/3d9b3687c86974c9f4ac4b79e2486ea7d6e17f78 |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/9489c652c627fb4f3a5b0f974e7c544b37545775 |     
    arm      | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/a82c0392bda53700a804fd8b2f5e2a95d4baa5ea | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                  libva-2.22.0 | 1 
               syslog-ng-4.8.3 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/69fa4773ff18ab7536493e66ef0fe1fc0eb2e914 |     
   armeb     |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/8276a13fd9835b43ea40ac2d4c4597f196f041f7 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                libselinux-3.7 | 4 
           host-libselinux-3.7 | 2 
                   libidn-1.42 | 1 
                  libva-2.22.0 | 1 
                  readline-8.2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/fab44b3cca009ddaf3327c6cec6eb0136f82c6b3 |     
    sh4a     |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/70fc34d0e9c82e86c046f3e150ee30bc8ca20874 |     
    m68k     |          libidn-1.42           | NOK | https://autobuild.buildroot.org/results/a1641c02e86de4949bb3549f8eff7dcf3605eba2 |     
    mips     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/58d73432457d3150e5c190fbb784031e0b0166f9 |     
powerpc64le  |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/86ea5d5f884d45d0fd96f01a0dc65e7c01f133fd |     
   x86_64    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/faf8b6fdca82a58b25c0f416b845f5722ba8279d |     
  sparc64    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/06ea8a4ed861e17120ff255fbd5b64d599e0f743 |     
   mipsel    |          libva-2.22.0          | NOK | https://autobuild.buildroot.org/results/8ad1d0fb2d436899a23007fd6d16ac2c1bfac743 |     
   mipsel    |          readline-8.2          | NOK | https://autobuild.buildroot.org/results/ce780f4da34f5332b961e432fd3da738d1520bce | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
