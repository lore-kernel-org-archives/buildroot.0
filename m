Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBABCEACEF
	for <buildroot@archiver.kernel.org>; Sun, 16 Nov 2025 04:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FA3F40486;
	Sun, 16 Nov 2025 04:21:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bC5Dbp7rImGc; Sun, 16 Nov 2025 04:21:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96257403C6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96257403C6;
	Sun, 16 Nov 2025 04:21:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4328A223
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 04:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 412DD405F4
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 04:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z6PTi35qJlpH for <buildroot@buildroot.org>;
 Sun, 16 Nov 2025 04:21:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6C2E2401E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C2E2401E1
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6C2E2401E1
 for <buildroot@buildroot.org>; Sun, 16 Nov 2025 04:21:05 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so8392745e9.1
 for <buildroot@buildroot.org>; Sat, 15 Nov 2025 20:21:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763266863; x=1763871663;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7gWIlyFy7m8fL7zrhGRJPgaKVRYrPiCa/FzYNmnmu3Y=;
 b=sZtKcKYdfbRZWumj1Jb0dYs8Hf3GRv9HK9VV+rLPinQz68FDVZsJjnPpe1UyXntdXy
 Soo5hyYc50r18PQkIQDw2Kwj8cbw9Z0LIKa8NCA4JomQmvtMc2NLGKhtSc2rv1nH9EUK
 I0fye8vWjKgCREyuj+4/MCSuIyLss3R5Nu3ltiaSl1e8ULR8A8D6gGnHT0gl9fNVGCU8
 SMY+Hi5trXyGmUmV+ll2AOGvPf1qxcgYSJ2rtOprIk+2IF3ZQRRcRxB20BxPpAcmM8oB
 0TiS0V6z3h8vUZAk0q3rmdXOeWwwIoE+rN+jm+HWweyTzFGOky81ahkszg101/ppy+VC
 OeXg==
X-Gm-Message-State: AOJu0YxyLa9SedeW7aiTU1M7xyvCBJjoW+mVfLvI3B5jTR0PkIgCOHgd
 VnU43dU71MtDBgE+SLtmL3tx92C3ciB99hAs/dI8croyRXg9KLCBojgG2sWoIg==
X-Gm-Gg: ASbGncthN2nCCIwtUiBFVzIR+ftvgc2KXIAtwqTtsBxkP1hujl0pymgNEC6kmbMqA4P
 SfrcbfnpJBdZOkx8DHGz/HhnPcAwUk+EAQxD9UOjRjCHQiqrrt5dXEugl9EQCn2rlMEN2j6lElN
 M8fLvd2fIDU4HPAnG+YSHx7DWWFjX+3p8bQBNpNHEnF/1f5F8FPUaxap83Xu13uDf/wmnPytE9w
 dR9jNimY1s34vPZbViq8/j1ZLlarqrD2qkUaYnCTb33xORsZJzPqxhGIYPxUoE3mOvrmYURbD3h
 oT2BgImiih3WYJnUzkY5BxuC8JehgHMzbE6nv7LRD6veOnPHNAeScZCh6Q6dg5uAVX5Yrxi8uVq
 P85aKC//JsCD/Lhn2l55gUsiNCPB6yp9kfTGOwxdOo5dfUsbE305vq7vNkYMc0H1Loc134p9rO1
 O2pjwfDz5FO0UuOrWXknHAQ9Qz76jZNaOu6QhmcVY=
X-Google-Smtp-Source: AGHT+IHrVQ7dEIcOHZm4/NNmZvUWS6BhshN8vzI/tFlAABprqxieNHVFsGvOcuo+ABsZG5Ij4uIvVQ==
X-Received: by 2002:a05:600c:8b21:b0:471:13dd:bae7 with SMTP id
 5b1f17b1804b1-4778fe883e3mr85028395e9.30.1763266863088; 
 Sat, 15 Nov 2025 20:21:03 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f206aasm19206406f8f.40.2025.11.15.20.21.02
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Nov 2025 20:21:02 -0800 (PST)
Message-ID: <6919512e.df0a0220.2d28f.9e71@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 16 Nov 2025 04:21:02 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763266863; x=1763871663; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=7gWIlyFy7m8fL7zrhGRJPgaKVRYrPiCa/FzYNmnmu3Y=;
 b=cnlaEuFtSMhUfCyqysBzCW4E83xlwNovj4+bJkN/TIFBa37NpUDkBBKp+c7syhNSFG
 Oy2KzXMlvZdKdzxWq96VliydzdwWGCtys03964ZBtds+mpAXlivZd2Y5D74rq+5pv7Ml
 09drN8K8pSuIRVLTHwc+JJUEXdVAWD6xmkw4KUdsdBNmfv3qwVohqJzTq8X6M5cTU2mo
 w+W32p3N3RXYTpLvQG5FcdDu7kJEdtIM6KGCElNKK8bYWXe1yyE2oVA5AdiyEBYL+BZN
 3dl9VnGJJlKjB/sHj3xEtvmlccDQ2uGEPKIIuGV5sFGc/J3fc9WWLWcnVBeerSoZqZKC
 RNoQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=cnlaEuFt
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-11-15
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

Autobuild statistics for 2025-11-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  3  |  8  |  0  | 11  |
  2025.05.x  |  1  |  1  |  0  |  2  |
  2025.08.x  |  2  |  3  |  0  |  5  |
    master   | 35  | 70  |  1  | 106 |

Classification of failures by reason for master
-----------------------------------------------

                openocd-0.12.0 | 6 
                   cvs-1.12.13 | 5 
                       unknown | 3 
                   dante-1.4.4 | 2 
              host-guile-3.0.9 | 2 
                     kbd-2.9.0 | 2 
                    mpir-3.0.0 | 2 
                   perl-5.40.2 | 2 
           sane-backends-1.1.1 | 2 
               asterisk-22.5.2 | 1 
             batman-adv-2024.4 | 1 
                  broot-1.52.0 | 1 
                   ccrypt-1.11 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                 dc3dd-7.2.641 | 1 
  distribution-registry-v3.0.0 | 1 
                elfutils-0.194 | 1 
          esp-hosted-1.0.4.0.0 | 1 
                flashrom-1.5.1 | 1 
               freeipmi-1.6.16 | 1 
fs/jffs2/jffs2.mk:71: /home... | 1 
  gobject-introspection-1.84.0 | 1 
           googlefontdirectory | 1 
                 host-gdb-14.2 | 1 
    host-mender-artifact-4.1.0 | 1 
               host-ola-0.10.9 | 1 
           host-openocd-0.12.0 | 1 
              hyperfine-1.19.0 | 1 
              iputils-20250605 | 1 
                 lcdproc-0.5.9 | 1 
                   libcap-2.77 | 1 
                libnice-0.1.21 | 1 
              libopenssl-3.6.0 | 1 
     libphidget-2.1.9.20190409 | 1 
                  libsvg-0.1.4 | 1 
               libunwind-1.8.1 | 1 
                  liburing-2.6 | 1 
               linknx-0.0.1.38 | 1 
                  linux-6.17.8 | 1 
                   linux-tools | 1 
        ltp-testsuite-20250530 | 1 
                  mender-3.5.3 | 1 
                 netsnmp-5.9.4 | 1 
                openssh-10.2p1 | 1 
                openswan-3.0.0 | 1 
      passt-2025_06_11.0293c6f | 1 
          perl-net-ssleay-1.94 | 1 
                python3-3.13.9 | 1 
          sane-airscan-0.99.33 | 1 
               syslog-ng-4.8.3 | 1 
               trousers-0.3.15 | 1 
                     unzip-6.0 | 1 
             util-linux-2.41.1 | 1 
               zxing-cpp-2.3.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/9aa54dc47c1eb02ccb8c40aadeb93e0740ed1bc7 |     
   mips64    |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/91ae563b011814c76ec6da2a0f08f1f546c71a61 |     
  sparc64    |          broot-1.52.0          | NOK | https://autobuild.buildroot.org/results/f3edbbdcef700b8ef1361c83f3497fe6fb0db1a9 |     
  mips64el   |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/5c16559a5566237bd008fd3047044f0e1099b7d7 | ORPH
    arm      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/c06f448da57377a8c9b89a100ce8a20f0d1690ec | ORPH
  mips64el   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/146169b69b6248a00abbdb595ba61ac36308c20d | ORPH
    sh4      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/9f344c4ef64c287d35c01f83489b540513b986ee | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/6075a78fa4f91830fbc4d1171cd4522cc8ea52cc | ORPH
loongarch64  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/aa5212dc993b34568e077e347eff9980713e8cf9 | ORPH
  powerpc    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/2f261c677740039eeab6cb27728225cf4227f3ed | ORPH
  aarch64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/d0721fad504179953f33c8ddb3ae60f71b47000f | ORPH
    i686     | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/0865a2101405da3f18a42e6d74547388d456a317 | ORPH
   s390x     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/7a3378838c51e04a1dc258c1cd4e3a79b5d3cdf7 | ORPH
    i686     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/0a561de7efa6af3a50233130d438b5f38b1a51fc | ORPH
   xtensa    |         elfutils-0.194         | NOK | https://autobuild.buildroot.org/results/95ed953986211cd3471d19dc944fdce209dd83f6 | ORPH
  riscv64    |      esp-hosted-1.0.4.0.0      | NOK | https://autobuild.buildroot.org/results/3162854de08bdb047c10302cfe7e9b23334c768d |     
    arc      |         flashrom-1.5.1         | NOK | https://autobuild.buildroot.org/results/b428aebad83006899a26cc18bf51d91d9dd7dbde |     
  powerpc    |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/4a0124438fe6b43b9d45813cd1d0e6335fcbd188 |     
   mipsel    | fs/jffs2/jffs2.mk:71: /home... | NOK | https://autobuild.buildroot.org/results/27c80833456d88f8f6d1473f6ac5800ff2b65c47 |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/c7734e51ff91f3e411dd1e87361aa974a8b02ef1 | ORPH
   sparc     |      googlefontdirectory       | TIM | https://autobuild.buildroot.org/results/95ad3279921bf596b2217ff81379cc4a773ca49c |     
   mips64    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/d726e4c5a76b476d9f1600e7277e1327f7da0c29 | ORPH
 powerpc64   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/0afd89310ceb1dd52db26f1e4059b2d8e2f64752 |     
  powerpc    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/bad2fbd8c6184431c4375f7156431980e635fadc |     
   mips64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/a3450ea1797789cf822e585cc820802db32b48e2 |     
   x86_64    |        host-ola-0.10.9         | NOK | https://autobuild.buildroot.org/results/fbbfef6e3715c0ac195537ab88ebb2e0e6c90c2f |     
   mips64    |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/d337e404c4470c6020a92457647628046ca1219e | ORPH
  aarch64    |        hyperfine-1.19.0        | NOK | https://autobuild.buildroot.org/results/6b520c51341fa814a5f850b5423db32b697e0dc4 | ORPH
    mips     |        iputils-20250605        | NOK | https://autobuild.buildroot.org/results/daeebb090f6d11d77840dd61add9bc422c6bc2fa |     
 microblaze  |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/ac1f2eb5b1c2d86717f7fddbd32049e95097510c | ORPH
powerpc64le  |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/4585dfa3aef5d43daf8ce4bdb6f9ec16340fc80d | ORPH
    mips     |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/0c71bdb6f237c687b3f87a7d67c502b55e52086b | ORPH
   sparc     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/870f6f129ca67eb710f052d8f938bcc8223e9448 |     
  aarch64    |         libnice-0.1.21         | NOK | https://autobuild.buildroot.org/results/d77f16c3db28e66d083ad3fe2d15a57dfe760504 |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/b41e2bc7ed1bed9b7530b750acd2d68904d31b77 | ORPH
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/3ebec9c9dfc1ba26d575d0e6ca906ead475c69ef |     
  mips64el   |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/46a23c6fecb49173d781c58a0f603097431a2f6d |     
    m68k     |        libunwind-1.8.1         | NOK | https://autobuild.buildroot.org/results/2cf31b49792bb9855a184188d9bf9355c9eb7636 | ORPH
 powerpc64   |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/ddfd0bb8f5623a1ce7aa4168c5759b2c54a933da |     
  mips64el   |        linknx-0.0.1.38         | NOK | https://autobuild.buildroot.org/results/526f29a78ca855479353aedcd52a3f4945c3cedc | ORPH
microblazeel |          linux-6.17.8          | NOK | https://autobuild.buildroot.org/results/b3fc35a5dcd8dffb28004b6a83c2213369094e4a | ORPH
   s390x     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/b726f908ddce59b753759836e9d6f405745062a6 | ORPH
    arc      |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/54dbd44ee1a15ccf0e5e317949f4d444744a4368 |     
    arm      |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/931898bdef68b756b95d55a3928be9f20d47a7c0 |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/eb2d3677917964f73d7537959546bac2dc796de3 |     
   sparc     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/eb5910fc8619aefdebda3dfd0a407d04cff04422 |     
loongarch64  |         netsnmp-5.9.4          | NOK | https://autobuild.buildroot.org/results/88bd01536e30c7547216ac6c9bb3ce0c9e7cddbb | ORPH
  sparc64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/bda6ba7e4029a5ea9a46d121ccf750824e9be131 | ORPH
loongarch64  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/1b4c5a306e1c5f9b49a5d1723a4558693b94f9ab | ORPH
microblazeel |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/a4a8b11e831f098a20069b84f830f483b46fe655 | ORPH
 aarch64_be  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/93696eb0ecd40e8f03a0d6693950051049cf73f0 | ORPH
 microblaze  |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/c0ff5b9b997ed67b67c5cfabcdf98c0240138aef | ORPH
   mipsel    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/60785c4ce9aba803e410935051d1a43732b38429 | ORPH
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/99e95efff335d2a23964154796749da1af6a8d80 | ORPH
   arceb     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/8ab9c53e3f6b63990f7a64859c13f4b27688558e | ORPH
    arc      |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/26a6ccfdc7574dece9b981a6daf7da1645fbd3c6 | ORPH
   armeb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/498c9e7ff539cacd412acb05568069359ec0c434 |     
   s390x     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/be3df1f65949a32e62ab43887582de1c8f56c832 |     
  mips64el   |      perl-net-ssleay-1.94      | NOK | https://autobuild.buildroot.org/results/953210ed672559e63a96da729182af00ca02c011 |     
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/e124a8ba1d13b4e3242cc5f9ce396dfb82088baf |     
   s390x     |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/41a2a4a39740d8d46d9524dfe55ef1a3534c7144 |     
   mipsel    |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/daa2affd4d6b448375f490130e09abeea2e6157e |     
 microblaze  |      sane-backends-1.1.1       | NOK | https://autobuild.buildroot.org/results/971e61cf2ef6bb84a34db6dfaccf9b97015e5a11 |     
  powerpc    |        syslog-ng-4.8.3         | NOK | https://autobuild.buildroot.org/results/46bb148d69ef87c2f26f505e906853c316c7a820 |     
loongarch64  |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/13086ee19246705d52d6bdb78b93729e36e74dd2 |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/aede81d30c0adc7e490d79458349e17becfcc8c1 |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/c3de6c7bfdc18ec6fc1e8ed4d722c734924efff1 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/ca236b9fafaf12e0c9954511edeba9760b974aa3 |     
microblazeel |           unzip-6.0            | NOK | https://autobuild.buildroot.org/results/caddeb856563226ee99d968302d6346861e37ddb |     
  riscv32    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/55eae4d8e768be4ca08c3ac5fa8a8ea7322a8d35 | ORPH
   mips64    |        zxing-cpp-2.3.0         | NOK | https://autobuild.buildroot.org/results/3afcd2ffc171440bdcdd1f1d50c726b44bf6c400 |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

libftdi1-v1.5-62-g5e67403c4... | 1 
                 libgee-0.20.6 | 1 
     libphidget-2.1.9.20190409 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sh4eb     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/b35db42242031555eb142e88bccb56b74d7c5784 |     
powerpc64le  |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/e81c73bc9f4461f4986907bbf438b6474ad70a58 |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/58e4a96e4f63994ed25ee1a036e0ac2f1241a955 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

        ltp-testsuite-20250130 | 2 
          cloudflared-2025.1.0 | 1 
                     fd-10.2.0 | 1 
               host-runc-1.2.4 | 1 
                 mdevd-0.1.6.4 | 1 
                netdata-1.37.1 | 1 
                   trinity-1.9 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      cloudflared-2025.1.0      | NOK | https://autobuild.buildroot.org/results/21018c769f3454f3c9aee0cdf65cb66097568ff4 |     
   x86_64    |           fd-10.2.0            | NOK | https://autobuild.buildroot.org/results/c8bca1cbf6b3e97c7e338d84b966433bfba5003a |     
microblazeel |        host-runc-1.2.4         | NOK | https://autobuild.buildroot.org/results/1f26ac22e26a0464f8f555c3d9c0383d4da57472 |     
   arceb     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/31089f0835757c5ec7d44ef9ba8298d7f2d10858 |     
   sh4eb     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/3afce1a9f60688d7d7d3b67dd06e1e27c264221f |     
    mips     |         mdevd-0.1.6.4          | NOK | https://autobuild.buildroot.org/results/ff187062cb1cebdaf759a20e5f7c118400018107 |     
powerpc64le  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/f0fbf0c3b7aa653df2511d319ea8ce7831a06c53 |     
    arm      |          trinity-1.9           | NOK | https://autobuild.buildroot.org/results/3ee529d4296ba2d7dd00a9d7ff99f4b8bb62af1a | ORPH


Classification of failures by reason for 2025.05.x
--------------------------------------------------

  gobject-introspection-1.82.0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/4c00a66f9dcbdbf268efcdadda9af560676bda07 | ORPH


Gitlab CI results for 2025-11-15
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                bananapi_m2_berry | https://gitlab.com/buildroot.org/buildroot/-/jobs/12068854162 |      
              freescale_imx93frdm | https://gitlab.com/buildroot.org/buildroot/-/jobs/12068854228 |      
                    pine64_star64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/12084131855 |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/12084135486 |      
                           rock5b | https://gitlab.com/buildroot.org/buildroot/-/jobs/12084136098 |      
              stm32f429_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/12097913280 |      
               stm32f469_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/12097913316 |      
              stm32f469_disco_xip | https://gitlab.com/buildroot.org/buildroot/-/jobs/12097913339 |      
               stm32f746_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/12097913430 |      
               stm32f769_disco_sd | https://gitlab.com/buildroot.org/buildroot/-/jobs/12097913536 |      
                           ts4900 | https://gitlab.com/buildroot.org/buildroot/-/jobs/12097914843 | ORPH 



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
