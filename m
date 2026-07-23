Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FF5AC4452B
	for <buildroot@archiver.kernel.org>; Thu, 23 Jul 2026 03:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B0E4140A0E;
	Thu, 23 Jul 2026 03:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EonwfPccTC-b; Thu, 23 Jul 2026 03:30:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A56A840A04
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784777424;
	bh=r7girkIh+dUAou2Iwk9Xnfv2/GD/JlBZB1GEBpq1fWE=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=jkRvOxUCBYWmeDiHVJ5KYYMpGAG9KZsi9AxMYm14WAIzcUvZ1eT0OX5GRlUI5cRHP
	 69Dd9NpfAzPauj3aBj6jm22aQfJtr9v2bphIMfiOFHpY20OWL5sGGzeoTrE22erCf2
	 9q5/GfAauhN7JJLIZdxf3e8XrFP5db58zu5hTi7eTrAcSkOwKV8MEMoiyLsnhpPFAv
	 iaplyBtQUg/WMzNlf6ungm+cD9NmF3tOS3BSgHqXBqPnvwKUxflV9G476RwBjNx5S8
	 TBU3Mz9AQK7D/kVCwkT0iLa2VVboydxLT+AXWeye9p2SPgQRW3PFmaqMaQ6TouC+KL
	 oCMpJ2upqToGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A56A840A04;
	Thu, 23 Jul 2026 03:30:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B5EAE4BF
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 03:30:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DC2640243
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 03:30:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BWqfTndQ8sUI for <buildroot@buildroot.org>;
 Thu, 23 Jul 2026 03:30:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 36E3F40026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36E3F40026
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36E3F40026
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 03:30:21 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4954df200ddso948515e9.0
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784777419; x=1785382219;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=mZ4dUUW+CK+EZ7VByM8JsyIAXT5sR92kIuNbxdE1S08=;
 b=QgsGwT5JeMWHr8u0Zi0ZipTQO9Dtau4aUAGRq7lfz4eIieaOijyij+1MkVcQ2M1uMN
 KwvfsPBrN41c9f2MRz7eqJzlz7FfDMDmHNEbzSUNAbTdd5BkGfrtlBM/selAD02SGM4y
 R5k+fvm7bEYiBm8RFt6ou4Iy7fzYgwUcqJatVxsxLBn34+RLmOm48DcJgh7V1NgjfXFF
 +shktU01QaPHXUOBeXxPpA6m0dxnxH7O9KNEfxGrL5ieEf+Sawc7qtFZrjPTmV6vTol+
 vyU8IXrYRIGGCbNY2ctc6aYR5sNlB2yZ2I0DmrByAoet5Or0jrus4xz6yfL3EG/pMBOf
 qlkw==
X-Gm-Message-State: AOJu0YwbKyME8jfd5fXrMg2yfB7krQPku57j+evonkHTMqUovLrHxckF
 50nliT2V1AxwAX+sR9hXdxtdhgztcnBCvqHVPVjZJMMonDcNpyerGg1ii4SMZQDb
X-Gm-Gg: AR+sD11z70JZUqcB+txPNQbR6a+m67V6gbCrOmQrJvgXuQUKsGfq4vuQ3NkphDtBs7o
 6RzyFBwtp6aYoYQq9VklgD54xERiyMrZBZM7bi2GzhaZmFc5goH+T1h6Wm56NUiBXI9Wu3Ut9xs
 6qJTkWXTyeuaOWfGFSDAvzKSiPgd0T7zGWEA5qY4V+g2VQOl//qOTDp1BE1WIE/z5tUc+Gelaxq
 HynxcNbLBvy1FeAtdWCZfBZYLLwbrTTJyXTmx3o2MKB6yVD3p4b4CjmVobn6VVT53YuY2cA+4sG
 E0rYlvjpnH4+w1kUtlACpRUAJmI39bp8Z66v6+EnuxztBNVsxtwh1GzhyAvKjr1gmyrwP92holv
 mgA4rA/CZPIXlUOpbexcP4WOyF3FMIHHlE4C6R+BFPkWnUdSv28LiSTvTSlUaODxyN2kzmOc0ma
 pWYOBh
X-Received: by 2002:a05:600c:1d29:b0:495:699:84ca with SMTP id
 5b1f17b1804b1-49573d142bamr11688035e9.28.1784777418617; 
 Wed, 22 Jul 2026 20:30:18 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4956a4aae16sm111935915e9.0.2026.07.22.20.30.17
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2026 20:30:18 -0700 (PDT)
Message-ID: <6a618aca.5dfca4bd.1e3695.5276@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 23 Jul 2026 03:30:17 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1784777419; x=1785382219; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=mZ4dUUW+CK+EZ7VByM8JsyIAXT5sR92kIuNbxdE1S08=;
 b=QkUPTxHYaG8eKGDfXVg06YHvba93QJGcWPKpFjzOdDXu5gNf2R7JP4hsKbcxf2KHMz
 8OcCIv+S/ssmv+HEddCbxXxUf/ZWWJkDG3zDoHhj16rs3OhijCiwgOJHYvlGqcPgpp/+
 5TFSGo2J1ReMt81NXoJkjZSgtSIR0QzCdTvVkwxp/QcvUvppgTqtP+B4ztB1pxYCOVKt
 C0qz57fA8Hd5Wp+cFUe9IUP/eaATV0cyaHmI1GKBhQrPl0juosNA3DkoG3wVDqnh9SU8
 to4NtNxU8xeYA3rSAyLhVjmYM7C4z20xiwM6QBX4ip06hUWGtE1Aew0xwn/IL2u+fMZe
 ytTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=QkUPTxHY
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-07-22
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

Autobuild statistics for 2026-07-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  4  |  2  |  0  |  6  |
  2026.02.x  |  0  |  3  |  0  |  3  |
  2026.05.x  |  2  |  3  |  0  |  5  |
    master   | 48  | 212 |  0  | 260 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 24
               host-dracut-111 | 7 
                    olsr-0.9.8 | 7 
                   perl-5.42.2 | 7 
          host-binutils-2.45.1 | 6 
                       unknown | 6 
uhttpd-15346de8d3ba42200249... | 5 
                  bcusdk-0.0.5 | 4 
              jpeg-turbo-3.2.0 | 4 
      libabseil-cpp-20260107.1 | 4 
               linux-pam-1.7.2 | 4 
   openvmtools-11.3.5-18557794 | 4 
                   ccrypt-1.11 | 3 
            host-go-src-1.26.5 | 3 
               libecoli-0.11.3 | 3 
                   linux-7.1.4 | 3 
       sp-oops-extract-0.0.7-1 | 3 
             dahdi-linux-3.3.0 | 2 
        edk2-edk2-stable202602 | 2 
                      fio-3.42 | 2 
glibc-2.43-45-gdae425b55420... | 2 
  gobject-introspection-1.84.0 | 2 
                     gzip-1.14 | 2 
    host-mender-artifact-4.2.0 | 2 
                host-odb-2.4.0 | 2 
                  ifplugd-0.28 | 2 
                  iozone-3.508 | 2 
libfutils-c326ce0cc2a735438... | 2 
                libgsasl-2.2.4 | 2 
                    ncmpc-0.52 | 2 
                  ntp-4.2.8p18 | 2 
               tcf-agent-1.8.0 | 2 
               tcpreplay-4.5.2 | 2 
               valgrind-3.26.0 | 2 
            18xx-ti-utils-R8.8 | 1 
                acpitool-0.5.1 | 1 
             alsa-lib-1.2.16.1 | 1 
              armadillo-15.4.1 | 1 
              asterisk-22.10.1 | 1 
                   aumix-2.9.1 | 1 
                 binutils-2.44 | 1 
                   bird-2.15.1 | 1 
                    ccid-1.5.2 | 1 
          cloudflared-2026.6.1 | 1 
             cni-plugins-1.7.1 | 1 
                  delve-1.22.1 | 1 
             docker-cli-28.3.3 | 1 
              e2fsprogs-1.47.4 | 1 
                espeak-1.48.04 | 1 
                  ffmpeg-6.1.5 | 1 
                    frr-10.5.4 | 1 
fs/btrfs/btrfs.mk:55: /home... | 1 
fs/erofs/erofs.mk:69: /home... | 1 
fs/ubifs/ubifs.mk:49: /home... | 1 
            gnuradio-3.10.12.0 | 1 
               gocryptfs-2.3.2 | 1 
                     grep-3.12 | 1 
host-am335x-pru-package-5f3... | 1 
            host-binutils-2.44 | 1 
          host-binutils-2.46.1 | 1 
               host-gawk-5.4.0 | 1 
                 host-gdb-14.2 | 1 
host-google-breakpad-f49c2f... | 1 
             host-guile-3.0.11 | 1 
                host-wine-11.0 | 1 
                   i2pd-2.59.0 | 1 
                  iodine-0.8.0 | 1 
                       joe-4.6 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
                  lcms2-2.19.1 | 1 
lensfun-268821c02495c0ffff8... | 1 
              libatasmart-0.19 | 1 
                libdaemon-0.14 | 1 
               libepoxy-1.5.10 | 1 
               libglib2-2.86.5 | 1 
           libmicrohttpd-1.0.6 | 1 
                libmpeg2-0.5.1 | 1 
                  libnfs-6.0.2 | 1 
              libopenssl-3.6.3 | 1 
             libtorrent-0.15.3 | 1 
     linux-5.10.254-cip72-rt32 | 1 
          lua-lunix-20220331-1 | 1 
                 mpg123-1.33.6 | 1 
                      nmon-16p | 1 
            nss-myhostname-0.3 | 1 
           oath-toolkit-2.6.14 | 1 
               openblas-0.3.33 | 1 
                opencv4-4.13.0 | 1 
                openocd-0.12.0 | 1 
            optee-client-4.9.0 | 1 
               pcsc-lite-2.1.0 | 1 
          pkcs11-helper-1.31.0 | 1 
               procps-ng-4.0.6 | 1 
               pulseaudio-17.0 | 1 
        python-ml-dtypes-0.5.4 | 1 
python-remi-2022.7.27-37-g1... | 1 
                 rpcbind-1.2.9 | 1 
rtl8821au-bb26b6b06c47b79c1... | 1 
        s6-linux-utils-2.6.2.1 | 1 
           sane-backends-1.4.0 | 1 
              shellinabox-2.20 | 1 
             sigsum-go-v0.14.1 | 1 
                 sqlite-3.53.3 | 1 
                stm32flash-0.7 | 1 
                  stunnel-5.78 | 1 
             superiotool-24.05 | 1 
                  swipl-10.0.2 | 1 
                 systemd-258.7 | 1 
                    szip-2.1.1 | 1 
               tipidee-0.0.5.1 | 1 
             tpm-tools-1.3.9.1 | 1 
                tpm2-tss-4.1.3 | 1 
               trousers-0.3.15 | 1 
                    wipe-2.3.1 | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/3c9efe0e6fac1320b078fdd88e77787de5c328e3 |     
   x86_64    |         acpitool-0.5.1         | NOK | https://autobuild.buildroot.org/results/f595a880506cc410db6e2f5dbe6d7d4149efbc26 | ORPH
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/e3f05ef1ba8805332c857a8096995dba12a45dcf |     
 aarch64_be  |        armadillo-15.4.1        | NOK | https://autobuild.buildroot.org/results/35bc50b0e0fe0e0d0fde4c29b580e1d1f66f40b3 |     
  aarch64    |        asterisk-22.10.1        | NOK | https://autobuild.buildroot.org/results/400e53158f11926446c11d22681eb8a9430caf1d |     
    i686     |          aumix-2.9.1           | NOK | https://autobuild.buildroot.org/results/16ed630385d9c02aa5b62d4f0e03c52d44c7bdb2 | ORPH
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/84e8d262c407008422d9e2e9361a520e54a823a6 |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/0baf50ddad0503303384fe2c3fe9732dd3a0ea8d |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/bc61340242f6c8dc8bdc11d765d7386799e073e7 |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/a22cee7a4e747eb4169ec1586b74f330af85f5be |     
    i686     |         binutils-2.44          | NOK | https://autobuild.buildroot.org/results/32fed7868fbb23ead935d83615011417b08c25ba |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/4b5da9bf73f3d3c11e432a78e7b14504d1ebd9b8 |     
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/87ef34b299bf81a6b28b71b980eebb4dc21923f6 | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/e0c9f3dae842ba3b84996a0f66268a1fb32a56be | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/03e1008b96c2821935ca49b7f6c7a0c6163f60d4 | ORPH
   armeb     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/803b1ae9d18d1aa07ebc3f2920a7af8779884f51 | ORPH
   x86_64    |      cloudflared-2026.6.1      | NOK | https://autobuild.buildroot.org/results/9a87fd9d8b8f2ba94ab1fb5260222e652a68b48c |     
    arm      |       cni-plugins-1.7.1        | NOK | https://autobuild.buildroot.org/results/6add5eec3effbd574934f4fa67dcda90151ebf94 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e17f7868be42d33b90cefd41cab16095e6496c88 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/f2e00b73c1fde2b4719bc3961cc16c1009454afe | ORPH
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/6235bf6a0cfc304a42b917cec8a3ac77953ae359 |     
    i686     |       docker-cli-28.3.3        | NOK | https://autobuild.buildroot.org/results/54a1f9f0a85e43c1bd22334b76c5e11aab82a3d8 |     
    i686     |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/e11422b575c68db451ea3e0a6ce53bef500d7338 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/21f9f56b3bbb2b765c72fe94fd059ce366ab5218 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/f2ee0679285fecf87843c08f037d11bbb1b33bb5 |     
    i686     |         espeak-1.48.04         | NOK | https://autobuild.buildroot.org/results/f8286e2f73cac125978a823066fad9ec696d9dd6 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/b28028a329244c33c91f0303d72860c6b61b5782 |     
  aarch64    |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/37982ed5b55dd25382be9bbf0c608f51f5f71b41 |     
    arm      |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/69b27af4a43b69198786a31a916fa0dcf6cdb730 |     
    i686     |           frr-10.5.4           | NOK | https://autobuild.buildroot.org/results/a5a459918c45249645b0d729a76dd6b980888784 |     
    i686     | fs/btrfs/btrfs.mk:55: /home... | NOK | https://autobuild.buildroot.org/results/add1e25746fbe24322000b7a52eedf2748b459f1 |     
    i686     | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/38c0af971622a623a5f26b1ea59286fc022db8ab |     
    i686     | fs/ubifs/ubifs.mk:49: /home... | NOK | https://autobuild.buildroot.org/results/d5c98a4d3a85cda746a73a3ece0e86fd47b3858a |     
  mips64el   | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/51fc9747dced9781714a97a54f957e43de6e376e |     
loongarch64  | glibc-2.43-45-gdae425b55420... | NOK | https://autobuild.buildroot.org/results/61b5423b0df26d2e3b23e9b36635bd3e9e3bd893 |     
    i686     |       gnuradio-3.10.12.0       | NOK | https://autobuild.buildroot.org/results/ae9f583a17459ca4b4324a6857b626e89cc584f0 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/4eed839c6d60386ff4401f76d4882255ccb0afc6 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d4f45507638a5cacaf1e495f0e7f19816d585cdc | ORPH
    i586     |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/820366a330550578dc72498b875f46b8dcc540ee |     
    i686     |           grep-3.12            | NOK | https://autobuild.buildroot.org/results/e83c6d72d9abbfa3c61d4bbf6b4d8e5b71dae158 |     
    i686     |           gzip-1.14            | NOK | https://autobuild.buildroot.org/results/48645198aa05c05880cc1022098e2f8624378f59 | ORPH
    i686     |           gzip-1.14            | NOK | https://autobuild.buildroot.org/results/9b4d01f67d52e93a51d3f3baaf4bf78505f0513c | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/8c942de3668e0025d8a74fa97ef513af0f3469e2 |     
  riscv64    |       host-binutils-2.44       | NOK | https://autobuild.buildroot.org/results/4e8359c2e845436bf2f3fddf32053a22427f469b |     
  riscv64    |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/3df9d32e905c1192f3a7c8bc8a35691e62f71204 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/b5ddb9f7f04ace575680ce452a5551eeafb9676c |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/16f5afb5bd4cc8a202999b962f35ec3254cbd2a0 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/1dd4ec9ea0088ade08dc420be1efc257fccdb969 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/0038cf32a700e5886ef61915fe76485b38b4fba4 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/38dde10b744fa1585c33d97f39f7da4f23fcbcea |     
    i686     |      host-binutils-2.46.1      | NOK | https://autobuild.buildroot.org/results/87bd62b4214939c72845700b135c2582f02d674d |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/a4ca66e6b3e82b988e94876982a9a38717a43d73 |     
   x86_64    |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/2b4d5e3b25df405c375b38a1c3cf1ff8e195ddec |     
microblazeel |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/1b4aeb9197dbc5ecdd1ed138ec33e1c71c7c89c8 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/979c31030cbed7a69a0a0619def7e352c32226d7 |     
  mips64el   |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/007353dddfaa336a5dc214e3d3b813936a5d19d4 |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/b3f6ca926237308769a81658d634a7b784abb63b |     
    i686     |        host-dracut-111         | NOK | https://autobuild.buildroot.org/results/f8ca564f7a6100beb63980ec963f38a63c6c3098 |     
    i586     |        host-gawk-5.4.0         | NOK | https://autobuild.buildroot.org/results/08a8c743bbcfbb0739415e85a46357fe2e1ba654 | ORPH
    i686     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/49dea1022420dfea8a81bef4bac1c088ea166870 | ORPH
    i686     |       host-go-src-1.26.5       | NOK | https://autobuild.buildroot.org/results/0cddc297acf912b1d27e61a7e720e2f9b2b6291e |     
    i686     |       host-go-src-1.26.5       | NOK | https://autobuild.buildroot.org/results/c9b48fac73722630e1dd0a5f59a32b068397ec56 |     
    i686     |       host-go-src-1.26.5       | NOK | https://autobuild.buildroot.org/results/a2015cc66af1abeaa921bdfa00165fb87fe000b6 |     
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b19ce84464f47eb0a5fe17f8b836b17477e70938 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/22ef5916dd3d929df8a462a19d5b67a7d5d7b1bf | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3b7c9e498a8a8a2c32dbf2707a71f37b508292aa | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1394fc06b1f7175718f01cfb28d62e1320884f28 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2e6bbf4076a91a40a9ea54baa5de4870cf650483 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/78f96ae241e843d831b227a1c6b8982ca7cfa5a6 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/0de8bdced52753170e9143b034d21427c955967f | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6de604e14ef44bec02a1d0efe09f9583139bf231 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c50400f6241dd3b66cfdf26cd9eccd5d66c06ac8 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c356ff20474e0402123f9422df073bda85e47e43 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a84272fc42588d7d0d96397d4394a41a7709611f | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/51741d0c43265b80caf94452ffd1bd7eb0c9817f | ORPH
    i586     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fa44bd9f2f4a768576829b051241f084483d8b7a | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b3479f66fa1c6a420f34dba083db4382e2a7fcbf | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1fe99980d7e832b38ee9d6b15f50e07403877a23 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/266e2ef4a0d070f9d590866c3490d168d579ac52 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/5185b6410ef836756749b1cdc43ea6f77c5f0037 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a284a5ad3b7c0ee9d6604af81fb4cff0d5d0f17c | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/67194aeca277a73fb95a2768ad36dd00be0e2519 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a1b8b5c9a44d19ca2a532888fec591b7ec9383ca | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3b7f293f90b9f0cc7bfb558946af6701445f603a | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1aa0992cc73209f717333b09e160565114e4e082 | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e0c08df96c9c5570de651863c0fd2dbf4acb780e | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/dbee7bc3b754cb38e613b1c3fb41c302e8f71759 | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/906cfc955eb4341ef4528ca20860ff60cd9bee92 |     
    i586     |       host-guile-3.0.11        | NOK | https://autobuild.buildroot.org/results/980ef33305c44c676bc5814a24a951b08be18ce2 |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/a9703492bfee879661a3cff2273c90d84f52e41d |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/12e3349402813a501be720adcbb5cf8f833931fc |     
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/501cbbdd225136d810826c64864b7f08590de7cc | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/75c7791422c57251621752ec2cbd55aaa2ed9557 | ORPH
    i586     |         host-wine-11.0         | NOK | https://autobuild.buildroot.org/results/b0bb31781250717e5fc98fa0c57708187136c34f |     
    i686     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/97cbd67633c2b028e0952b1f8719b7cc576748b1 |     
    i686     |          ifplugd-0.28          | NOK | https://autobuild.buildroot.org/results/fb4c24b04f8a7e96634c7ae2d061f0b753f788e0 | ORPH
    i686     |          ifplugd-0.28          | NOK | https://autobuild.buildroot.org/results/390a0c6d17e9fed34f9a38e5fcb636d7815d90c9 | ORPH
    i586     |          iodine-0.8.0          | NOK | https://autobuild.buildroot.org/results/75e89f74487088087c1deb3ffdefb745a6301e17 | ORPH
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/7b505abbaf235fdd50b2fa77f7041b7058e117d3 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/2dbc755365015552834ae8125a5df7422f3529ea |     
    i686     |            joe-4.6             | NOK | https://autobuild.buildroot.org/results/309fe643419930d7d9c85dfb4ffeadb0fdd4f53d | ORPH
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/037b44258929982ef68dba16b8c1731bdcfd88d3 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/220384c50d765a31a3ba3696247cd899d580605a |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/e33a6819dd4da8a32032ccf99e3856ef7381b172 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/6918d81c173220e1cd1858552a56cceaed2246e8 |     
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/26f6c51479991682a4797381f33a40259fe8e9a1 | ORPH
  mips64el   |          lcms2-2.19.1          | NOK | https://autobuild.buildroot.org/results/d7488f4bfa340fe14db20ed0cb7ff048cdef7a9f |     
    i686     | lensfun-268821c02495c0ffff8... | NOK | https://autobuild.buildroot.org/results/a0614a39906b010ae75d5632f78aae4c770ae5eb |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/c4db983ffbfe150bfc49df2c830a1c2bc7aa2a16 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/9a2c91c8ef558cf475bbdb0307c9f563a9e4e5d1 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/e7652e9b8cf2359c01197cf133254a1cad17df96 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/dbc0bc333ab41217082e8736919b4e6d67b5022c |     
    i686     |        libatasmart-0.19        | NOK | https://autobuild.buildroot.org/results/91861d6f50841d595cbed0f4a370f80f7948a7e8 |     
    arm      |         libdaemon-0.14         | NOK | https://autobuild.buildroot.org/results/0dcce897876478832bd0cef986ba06d237385e58 | ORPH
    i686     |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/3e26582fe73d8ee3e883d795b3d505a1717f7626 |     
    i686     |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/bfe38043b86eb883534a2dce3f8e7f5ffcbdf20e |     
    i686     |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/ab2863792182b033ed0c9ef1c5c56a5cfc35d32f |     
  aarch64    |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/5fe03cab08c6c4f1a7341fbaf3994ced7c205740 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/6b9457cceb29a17cf7fcba2c97cee61a358ac041 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/6678865a3b66dbd646421a4b7945127b8d760ce7 |     
    m68k     |        libglib2-2.86.5         | NOK | https://autobuild.buildroot.org/results/30878154eed4c5d727b17a69113965b361599252 |     
  mips64el   |         libgsasl-2.2.4         | NOK | https://autobuild.buildroot.org/results/ae573cdd155ab3d7d5a2da29d2a997e32539a3c7 | ORPH
    arm      |         libgsasl-2.2.4         | NOK | https://autobuild.buildroot.org/results/27adaa24c8bf3dc651f9f6c6caed686d67054ace | ORPH
  mips64el   |      libmicrohttpd-1.0.6       | NOK | https://autobuild.buildroot.org/results/80c08d8fa069ec1b26a0d86f4896a139d68ba73c |     
    i686     |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/48e4dfab75bf0f977795d3c74fdd451d8907cad7 | ORPH
   mipsel    |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/2891972256d02d16aa7827a9fc31880172b7eecb | ORPH
  riscv64    |        libopenssl-3.6.3        | NOK | https://autobuild.buildroot.org/results/e2b6c4c60e88ca974fc840964e6c1e2af39029d1 | ORPH
    i686     |       libtorrent-0.15.3        | NOK | https://autobuild.buildroot.org/results/b3d7f0bd0aa8eeb16ef93ebd644555adb06afc51 | ORPH
  mips64el   |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/69b14988ac33e94c898547c71d0fe6a8176f5faf | ORPH
    m68k     |          linux-7.1.4           | NOK | https://autobuild.buildroot.org/results/aebe1287893e7e97666bd88bb7f8c7c76da209c5 | ORPH
    i686     |          linux-7.1.4           | NOK | https://autobuild.buildroot.org/results/96b6c12dc2e632c579abd6e3a49b91d149363a70 | ORPH
    i686     |          linux-7.1.4           | NOK | https://autobuild.buildroot.org/results/7daa86909999c66db5f22e44a3551046dcc24835 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/5954f28a0148571e71b402d6c44593128f7948e4 | ORPH
powerpc64le  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/9a39d7a7a2a6e171c339cfd1e0317d3bef56ae10 | ORPH
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/9e7308f30248af9d26a8cf543b3ebdf24a6167eb | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/179af4ddb58f2511b4b21c6ff919ef7c48bb9f9c | ORPH
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/f36e76edac7c35122149e3ce0b896f6682455adf |     
   x86_64    |         mpg123-1.33.6          | NOK | https://autobuild.buildroot.org/results/d2c1bb31f9654b0ced647031758a43d5c72256ef |     
    i686     |           ncmpc-0.52           | NOK | https://autobuild.buildroot.org/results/7fe7dbece2ddb4e5be1e46a319719bf3f9031e62 |     
    i686     |           ncmpc-0.52           | NOK | https://autobuild.buildroot.org/results/affe3031c8d75a6e80dc3f1d66a059640e66c51b |     
    i686     |            nmon-16p            | NOK | https://autobuild.buildroot.org/results/31fc4a6557affc24a69b7fbebb1f65e6aac367f9 | ORPH
    i686     |       nss-myhostname-0.3       | NOK | https://autobuild.buildroot.org/results/2e6ad0f91b345319511136a3ba1761a6219efa1b |     
  riscv64    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/69f48edfa0fb0e9b3334204587f8fd8bdb258c54 |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/cf3d87e4bb68d38029f0f9e948354a58f29ca71c |     
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/0e056a0294a3b92f2115bb50ace3705c54320537 |     
powerpc64le  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/d33b7a7187909f38d3345c202e83e2c4b06a42ee | ORPH
   x86_64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/dc1aa9a14ed45dfd52c883bda57a9db6dae86cf0 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/3b42a33a729025d23361eefc3bfa9afea373a1bb | ORPH
powerpc64le  |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/eb5f18705f6a41be3579c4f7482b8ee143c41b54 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/5280ea403a1e338a3e3fe7beca7b311c4802eb77 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/9d92746d7a4b644caeb12198d90bfd6dcce1a29e | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/f068533f0c707924ed2d0176ffea2c7b1fcf89de | ORPH
  riscv64    |        openblas-0.3.33         | NOK | https://autobuild.buildroot.org/results/acbddcfff8862c3ccbcfcbfb92bbdc4d2678afe9 |     
  aarch64    |         opencv4-4.13.0         | NOK | https://autobuild.buildroot.org/results/54e6105720abe28d4adc68700b8a8dbc4b47f57d |     
    i586     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/bd4a2148c80dfc8b7384a24e4b29b8c5b27c94ae | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/c210e4880620736f948fb5ab6808920bdaee459e |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/ea6a84903fe2374f2f413c6c875e528be67b68c4 |     
  aarch64    |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/24c6098f45e9c03af8d2aa9e59b37fc0338bd65f |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/990d1f0e22c04dc77c19ec1657f72cac87c813e4 |     
    i686     |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/39c913fe8e5261d2b5e634387a3f730e18517a90 |     
    i686     |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/46f9dc4c1ebaed0f6e7fd88906dafe20fc6494f9 | ORPH
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/bc0d11aecb284806931748ef7157e5a8bfa882f3 |     
  riscv64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/5b3162323ea24905d64f9e9b84785e5e51d43e53 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/8d974ddb75cd3915206f7cb3be008fd8e20a180a |     
  riscv64    |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/f2e54c4a63b9012ec95cf57b994f9cb1a44b1ef9 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/7bbbfefbcc3a76263b880a2135c5943517676540 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/123704c2899b4d44ce85768796a9eea2c918375b |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/4e3f0329e52451f613a49d24370b64ce7f357b5c |     
    i686     |      pkcs11-helper-1.31.0      | NOK | https://autobuild.buildroot.org/results/ba6bb9bb1da37d52b980e99119e5f74ae6fa807e | ORPH
    i686     |        procps-ng-4.0.6         | NOK | https://autobuild.buildroot.org/results/1bb4c7aa49a1879800c9dd8e1c477e4e8d347a0e | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/227715c0e55201ad35013d651f137ac4f3b5f8a9 | ORPH
    i686     |     python-ml-dtypes-0.5.4     | NOK | https://autobuild.buildroot.org/results/d3b021336a6a83d4a5321fbfd42739519cca6198 |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/f154f70e71ef8519205e1706e5fe7ec36de99eb0 |     
    i686     |         rpcbind-1.2.9          | NOK | https://autobuild.buildroot.org/results/4bb6dc8a1217acd644ca8522cc088012da62c3d2 |     
    i686     | rtl8821au-bb26b6b06c47b79c1... | NOK | https://autobuild.buildroot.org/results/e2ec97ebdf590455dc630ca7dc5492e4a4326511 |     
    i686     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/211202a5136337b810129634f7c6f731319a9151 |     
  mips64el   |      sane-backends-1.4.0       | NOK | https://autobuild.buildroot.org/results/607056880cb95d9a09c550dca9f914dd7112cf2b |     
    i686     |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/38b15c35868d2e2e11806bf17956a1841b641948 |     
    i686     |       sigsum-go-v0.14.1        | NOK | https://autobuild.buildroot.org/results/5872bd8e892dd66e7d4f540faa0f92cf142787f0 |     
    mips     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/f18dd62c7539400703617d298137d9337f792368 |     
   x86_64    |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/67fbd917fec8befa30834f22de21a603037a58e0 |     
    i686     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/1205cda0bfd000ae49ad1032219acc7241c737ad |     
    m68k     |         sqlite-3.53.3          | NOK | https://autobuild.buildroot.org/results/51f08a90bdba1a9f286f5c8e86613527a55e14d7 |     
    i686     |         stm32flash-0.7         | NOK | https://autobuild.buildroot.org/results/f4545eb7e5904f8f838aa78e876b1b7821f701a8 |     
    i686     |          stunnel-5.78          | NOK | https://autobuild.buildroot.org/results/0051c8216aac0875c60de1db65ac31dff1a371c7 |     
    i686     |       superiotool-24.05        | NOK | https://autobuild.buildroot.org/results/b086374834ded5bb9a0760dcdfacaa92fa848462 |     
    i686     |          swipl-10.0.2          | NOK | https://autobuild.buildroot.org/results/8ad7f8696d8bf6aa5076a464e1538e35affb87e0 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/f1f58ae36a14c19507bac8a88d5b6124c325ae86 |     
    i686     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/8a4270d5dcdbbba0038bdde29c1129baaebdecc1 |     
    arm      |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/3d52e6344d7eb1ba6500a1da08b839dadd096c95 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/6d905b54d29e4f1a1f8a2eb99a3e3ce337e73798 |     
  mips64el   |        tcpreplay-4.5.2         | NOK | https://autobuild.buildroot.org/results/4398c15b675494a8d2171d293f5d7657f72702de | ORPH
    i686     |        tcpreplay-4.5.2         | NOK | https://autobuild.buildroot.org/results/8b2132b9794e27a3d118aa06444dd63ac0a917bd | ORPH
    i686     |        tipidee-0.0.5.1         | NOK | https://autobuild.buildroot.org/results/d6e5bf2975ee561e2e2d45f39c01eff0a7785925 |     
  riscv64    |       tpm-tools-1.3.9.1        | NOK | https://autobuild.buildroot.org/results/878aa38fbe0b55defe3c8407ad5d5a322a770d46 |     
    i686     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/74a0d44a2c7d76e994e8262a72b74128b0ee35a2 | ORPH
    i686     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/bd4223cd0dcb35bdf8fb3a3c3be01c01a15f1c23 |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/5b31e69f7e3f62466d9ec94610440a7cfe668f20 | ORPH
   s390x     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/1029d7c2ab56714af7b14a17fe65df6795a1ae90 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/077a48987325ccc65b73fe93b0c099c5e46d7015 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/db75b552ba59cd4b42c23751021daf830e2ad033 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/13a39a1bf7b1d33836e48904cdeeaa556056e097 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/4441c106d8a2e891549b7535be99f66896908f90 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/ef99f3a9a4fea9f79f99083848bbb34295696821 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/27903c9a4517a0f5aff355d57f4010de21c442cd |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/547d3d8d5ef7b987c625569552a7aa80dfa56d93 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/880df137e2ee2e0435d3b41b0feca957716b4c62 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/91f3b107f2f4a89efaf3f2b2e4c2da51dd8ee113 |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/b297a61132af4ab9dddd579e617a1a436c98d356 | ORPH
  mips64el   |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/0719830d6d70f9e05081be3a6ca17194707bd9a3 | ORPH
    i686     |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/e4cc70efdec58efa4fdab60c0fa397d3bbab13ec | ORPH
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/c814144d82ffed2a069de6e030311a4413f265a3 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

              erlang-26.2.5.15 | 1 
           lttng-libust-2.14.0 | 1 
                openntpd-6.8p1 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/8dd0c4a7873a269f2b79b7b97800620fcc8379af |     
    i686     |      lttng-libust-2.14.0       | NOK | https://autobuild.buildroot.org/results/b450c0906275fbe2f1f2a37655e786a853893559 |     
    i686     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/51d276d3af94b9466ac7894f5d54caeae96b4fd7 | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

              erlang-26.2.5.15 | 1 
                 libssh-0.11.4 | 1 
uhttpd-15346de8d3ba42200249... | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/d5456c24e0fa6dd48ebe5326be163e278ae11043 |     
    i686     |         libssh-0.11.4          | NOK | https://autobuild.buildroot.org/results/e7e9091bd46e8f937b924d8435b316138932601a | ORPH
  riscv64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/1d1c61894070e13d2046568806212c831997aaaa | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

         libhdhomerun-20210624 | 1 
                memtest86-7.20 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/6b119ca6a03ed918304ca15457d03da1eb194da1 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/04f7bb6bcf8d3c62a61c29da1d3d44f398c911de |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
