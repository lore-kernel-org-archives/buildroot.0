Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C9EDC5DF81
	for <buildroot@archiver.kernel.org>; Tue, 25 Aug 2026 03:26:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4878040608;
	Tue, 25 Aug 2026 03:26:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vodRjiBM3WUC; Tue, 25 Aug 2026 03:26:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787628378;
	bh=XYLJtnmyVGtl3SmZ+DoflGkDuMBv8fynO7/mAM4yoxA=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H+DZ2KHYG2pSvEeoIVWhzJ+QffCCDvdu1Ja250R4h6FwMoSfKOQVXwcr2PVzyNKGG
	 ZxVm1TuARZJ4sdQtTNtgZdM4oOy/lGvCCA47jBhNMpceXzStNgTn6kfkK1qVXYyRWN
	 XdnGknInYxCHqyVveJ9iyAxw9DZmWi9hMVsCZ/wdqz8LCEXqKsj1aZrd28imM8WbYl
	 gRZk9WXBL1H10gmfvuXh0ld9wfaKeBZyTMB4fC31otve3joH7LWxNgfKLQO3AANtmB
	 fFxII1+SUcVD5YKApevYYJjW0Ik6ZQn47NpA/8ZWOJUM5NRqECCxqgZYkZOCWyvHlm
	 N8TlyGAaspwEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8ADD6405F6;
	Tue, 25 Aug 2026 03:26:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2AD7035E
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 03:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1168160672
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 03:26:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G6g0ttuJaQib for <buildroot@buildroot.org>;
 Tue, 25 Aug 2026 03:26:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::636; helo=mail-ej1-x636.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=O3XGRMWi
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07E3360667
 for <buildroot@buildroot.org>; Tue, 25 Aug 2026 03:26:14 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-c15f020a223so626066566b.1
 for <buildroot@buildroot.org>; Mon, 24 Aug 2026 20:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787628372; x=1788233172; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=c9g/dXdhJsbg2FVKSs15I7YILfTNjZas3HDG1GRJVQY=;
 b=O3XGRMWivIbh0B/GsaM4r4fSkWgdv8YhGiu974aiqsP7lc0Kw+H32szSPxfpzQUy3H
 yoHGrLkeTApPZDe2mKKVawrXOO1/vejiLh9Lk8MVBHOyXAug1VO2tZ0Q0sLHzmCIQK2X
 FoAa4DasBJkIpKghdjf/IkCc1+pK7hiq2vUiptvr+XbcgtGGy6Yc6z6mgdxvUO8MwhdF
 HXvmIusJERHb97D4XnQTAx9YW8jw1gCulPCilucaYId27x63BcZ6mHk8CBNr4ogm4Ios
 Q3I/lA1fCLwU+1llttmvMwtT/xti2K5Lg2fIcC9tWBCDxuXwOOWOLELvebTpYeqxq/vX
 yXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787628372; x=1788233172;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=c9g/dXdhJsbg2FVKSs15I7YILfTNjZas3HDG1GRJVQY=;
 b=GsoOL5BKpRiVMUvfVjjuUsGOy0ICGh0zh8BgF+J7B5vicHyeFo+jAzvaFwtdNGYoRI
 yoGZiQ8pkYdDfeGmHDqOSp4CNTm0ToMRRblzTRv/6n2wt/bTlTUgsUgw4kUfVaPxAn/+
 HCaINAK4woQzAPZXfZhjHVIl8eCmPtfU0xECfmo/fEBrYnLx3rwQzPQtgpmH3EVrEeax
 AQgnVyNJcuIFLccCSvNxqQe5WFLi8erkr2/MG1BlPve9PCIy8PliTlwCeLLh9Z5FXqdo
 3AJCk6V0z7clZa3c+w3Pqcfpg/UYK0IwVwY4GmFblaU3gmeSa7AOtAlbE2kkQJ3p7NU9
 0XLA==
X-Gm-Message-State: AFuF++l4nTuDWx415yzHqhnTxytNYAL21CsyTPtZpx5ziD98sYhoYaEo
 N4G6NLH1CrI63zRLdRPjNvc0e4E3zS/APgC93LaVlXnlhDJ7PkBSXwJL5e00gOhs
X-Gm-Gg: AR+sD13sjrbMnxc31TskmO4hNAgZz2tXbO7/EIZ0WCkEeEv7vgEPfYxVTlLzFuAyLd/
 dYtBh95HWIyZ2lBmWn2xCAn7sDgxfncqUh5AcR05MNk2D+pP2tLtzLgMg1Aoe8f2rvJkdpePFrR
 SpeEkypTv/IDAWY7Rmovoy1pdYbK9bZhaVUd/J7rPoC6H//5QzYv17cf3WNCKcFUn1bsNG/iW6b
 RYPK52neITDLCWaeZDOZQLmB22zKAAJPu2up/Zqe0Kv71ou+wlhotJ317A5pGf72PavsYSGPNjw
 cRCosqcfzPWjP8Bz5YT3wPH9GMdeZgaS+ltCWUGiYJluo6PkA+VGnsVbZxfUIcjmJPlOn5MF9Lp
 5j6oOhG0i3qyUxBp7SoilKhDS8RNllIVgpP0DHW0GSFn+1C6bX2kr/OzeEOWT6wgOeA8lXBetOT
 tx9+5zxph3YaGCv3GP1qAgafgqtakh3qubV2HpSyQ7l29zGdTbVHFwz9SyjHVlNEq1KEBonv/6
X-Received: by 2002:a17:907:7283:b0:c24:b11a:470f with SMTP id
 a640c23a62f3a-c24b11a493emr1629361566b.0.1787628372005; 
 Mon, 24 Aug 2026 20:26:12 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c2496734bfcsm1704099166b.43.2026.08.24.20.26.11
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2026 20:26:11 -0700 (PDT)
Message-ID: <6a8d0b53.ac46da05.e8fc4.70e0@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 25 Aug 2026 03:26:11 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-08-24
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

Autobuild statistics for 2026-08-24
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  9  | 30  |  0  | 39  |
  2026.05.x  |  4  | 18  |  0  | 22  |
    master   | 37  | 75  |  0  | 112 |
     next    |  2  |  3  |  0  |  5  |

Classification of failures by reason for master
-----------------------------------------------

                   perl-5.42.3 | 4 
  gobject-introspection-1.86.0 | 3 
                       unknown | 3 
              e2fsprogs-1.47.4 | 2 
              host-rust-1.97.1 | 2 
            igd2-for-linux-2.2 | 2 
               libepoxy-1.5.10 | 2 
libfutils-c326ce0cc2a735438... | 2 
                   linux-7.1.9 | 2 
               pulseaudio-17.0 | 2 
                 aichat-0.30.0 | 1 
                 avro-c-1.12.1 | 1 
             dahdi-linux-3.3.0 | 1 
                     ed-1.22.5 | 1 
edid-decode-6f117a8f8c0e76e... | 1 
        edk2-edk2-stable202602 | 1 
                    emlog-0.70 | 1 
              erlang-26.2.5.15 | 1 
                   exim-4.99.5 | 1 
                    flex-2.6.4 | 1 
              fluidsynth-2.5.7 | 1 
                     grep-3.12 | 1 
            gstreamer1-1.24.13 | 1 
                   gvfs-1.57.2 | 1 
                     gzip-1.14 | 1 
       host-gcc-initial-15.3.0 | 1 
         host-xcb-proto-1.17.0 | 1 
          host-xfsprogs-6.19.0 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
                libaio-0.3.113 | 1 
                libdrm-2.4.134 | 1 
               libevdev-1.13.5 | 1 
                libglvnd-1.7.0 | 1 
             libpciaccess-0.19 | 1 
     linux-5.10.254-cip72-rt32 | 1 
       linux-firmware-20260810 | 1 
         linux-headers-6.1.183 | 1 
               linux-pam-1.7.2 | 1 
                   linux-tools | 1 
        ltp-testsuite-20260529 | 1 
                    lua-ev-1.5 | 1 
               madplay-0.15.2b | 1 
                 mdevd-0.1.6.5 | 1 
                  newt-0.52.25 | 1 
                openocd-0.12.0 | 1 
            optee-client-4.9.0 | 1 
package/vim/vim.mk:87: vim-... | 1 
          pkcs11-helper-1.31.0 | 1 
                   qemu-11.0.0 | 1 
                  readline-8.3 | 1 
                 rtptools-1.22 | 1 
     s6-portable-utils-2.3.0.4 | 1 
              skalibs-2.14.3.0 | 1 
             sofia-sip-1.13.18 | 1 
               tcf-agent-1.8.0 | 1 
               tipidee-0.0.5.1 | 1 
                 uclibc-1.0.59 | 1 
               valgrind-3.26.0 | 1 
           virglrenderer-1.3.0 | 1 
x264-baee400fa9ced6f5481a72... | 1 
      xutil_util-macros-1.20.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/f5eaa99c2ee525b0d77a1468bacea6519b1061c4 |     
powerpc64le  |         avro-c-1.12.1          | NOK | https://autobuild.buildroot.org/results/8f9e2556af5a50a474feb328bc13a4723122e05e |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/900705b64e666e98b15262ea656f48a9f4d7edad | ORPH
    i686     |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/f28288b1fdd7906d56d1cc05a3bab3002846f1d1 | ORPH
    i686     |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/7da37f205f2ced52d6f03988a98b3b06488b2e88 | ORPH
   xtensa    |           ed-1.22.5            | NOK | https://autobuild.buildroot.org/results/c2abc297a23758cf52501c58fe80039db07cc12e | ORPH
    i686     | edid-decode-6f117a8f8c0e76e... | NOK | https://autobuild.buildroot.org/results/3dc20a53dfd929cbe8cdc3e0596c9db045e37b18 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/d607b4e00eca51920f233c48603c04c1f85dc770 |     
    i686     |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/7c4b9c2935bfe79237ddffd636eb1bfd4638c2ab |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/520b598e1ac582de2f98391e81779f38973cd06d |     
    i686     |          exim-4.99.5           | NOK | https://autobuild.buildroot.org/results/e5e14393db2b13a62e71e750bf20ab0f05fd737b |     
    i686     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/d86b8485041c0c774dce37a4861102f7ef10275f | ORPH
    i686     |        fluidsynth-2.5.7        | NOK | https://autobuild.buildroot.org/results/96c753b854ccd96ce748b26f3d537a4c83661a8c |     
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/b4bd5ed985239ae011b28a0f47c79d0edc6e8bec | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/e13c0561fbb284f8939c0061bc2914998d962836 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/7ce477df460a1cf61837e66a8167979821a24d55 | ORPH
    i686     |           grep-3.12            | NOK | https://autobuild.buildroot.org/results/f0be49989584be1dbe462091760a12fc6790ae70 |     
    i686     |       gstreamer1-1.24.13       | NOK | https://autobuild.buildroot.org/results/1267c8db5fc3e19ef0bea6841dd94faea622c2d7 | ORPH
    i686     |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/e00d5ca613aa519ad2da50a4c285971492915ece | ORPH
    i686     |           gzip-1.14            | NOK | https://autobuild.buildroot.org/results/a48c6537b25d0bcaa61b4a20d8d109dade10ab3e | ORPH
    i686     |    host-gcc-initial-15.3.0     | NOK | https://autobuild.buildroot.org/results/1e5cb9f13f75c5e72238a945c6d3defc2ec969bd |     
   x86_64    |        host-rust-1.97.1        | NOK | https://autobuild.buildroot.org/results/1884900f0dff012b0511228a0446707cceedb384 |     
  aarch64    |        host-rust-1.97.1        | NOK | https://autobuild.buildroot.org/results/f8cba333e602a4964dd57f00c7c144624219a4e5 |     
  riscv64    |     host-xcb-proto-1.17.0      | NOK | https://autobuild.buildroot.org/results/ccd70e5825c9ada6a3042f15f7aec8e005f81733 | ORPH
powerpc64le  |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/a44965386bf0cac0bed2e5143ea511080506b71a | ORPH
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/b45c1f2001a038f4783963b57ce3e250d849e0b8 |     
  mips64el   |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/1258c0c0b2eb17e633457180088c32e0a5486c16 |     
    mips     | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/d96617558cb6039988f65885e098cc809085316f | ORPH
   mips64    |         libaio-0.3.113         | NOK | https://autobuild.buildroot.org/results/3d89cbc84f267b2690aa0dd86628780b828702f1 | ORPH
    arm      |         libdrm-2.4.134         | NOK | https://autobuild.buildroot.org/results/4c8f9c7af72face56aa42ef82cb9bdcb4bc9c708 |     
    arm      |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/6087c0d60c375da4b82a17a2a08758db283e4a63 |     
    i686     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/f708b001821f02024e7b7c4190e3827e343b83c3 |     
    i686     |        libevdev-1.13.5         | NOK | https://autobuild.buildroot.org/results/86699e6214a8dfb856fe878d1e5cfc850db7d3b2 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/168484b2be55150c4da999f5a35440688d96cc9e |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/565f91127a7b63a6dd367c86ded8a77cbb9bdf56 |     
    arm      |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/aa3710c8b2336f49ee3709de908518a96d062d41 | ORPH
    i686     |       libpciaccess-0.19        | NOK | https://autobuild.buildroot.org/results/364a64aa51454691b8e285baa2a8d04f18e887a8 |     
    i686     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/6cf0b2443207ffa95850afb206d2b6a444c1edbf | ORPH
powerpc64le  |          linux-7.1.9           | NOK | https://autobuild.buildroot.org/results/3727b1f15ea10f984a6449cff2f6fd6947ad7594 | ORPH
    i686     |          linux-7.1.9           | NOK | https://autobuild.buildroot.org/results/2bef70fc2cb8dabdae0d4468c26c4dd17545f458 | ORPH
    i686     |    linux-firmware-20260810     | NOK | https://autobuild.buildroot.org/results/b1aad7d9c856e4474f11b09d3d71b1f567862e92 |     
    arm      |     linux-headers-6.1.183      | NOK | https://autobuild.buildroot.org/results/54f738ede9fc8813f67b2aa211a348b377f29f62 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/5aa9bc68b2e403e0b70c0d2c7b1c5f7c50c511eb | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/e14dd387ce0100ce4b0df0b953a86ba2191581af | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/9a1b0e46279e01c6ee3207a71e79177f83f5bddf |     
  mips64el   |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/fcbdb22ffabf632096c66bca41b68331157bec2d |     
  riscv64    |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/c48b2d2818f35191acdf848e453d518d7524cecb | ORPH
  powerpc    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/9a2a728b8bc5e14a60273481e70994355d1197b5 |     
    i686     |          newt-0.52.25          | NOK | https://autobuild.buildroot.org/results/f2fc033bd84851a4c8d967d369fce630d76b0a37 | ORPH
    i586     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/fe8c4a025281e2a3bdb7b69a30eff7373e393b90 | ORPH
  mips64el   |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/8d4e9613d89bf4dd4008ec80da16f541cf96a787 |     
    i686     | package/vim/vim.mk:87: vim-... | NOK | https://autobuild.buildroot.org/results/98461fc2fdd053f95f396cb7e92b3de42128d2db |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/f8125850007004bd10aff36f3e4066e79e70ce2a |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/0780d50bcfe49b0d38308220c546495a87f8dccc |     
   x86_64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/16b888df7d1b12c3afed5710934bc89961eee2f4 |     
  riscv64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/0a07ddf5309e46cdaf975fea369e64981f7bf66b |     
  riscv64    |      pkcs11-helper-1.31.0      | NOK | https://autobuild.buildroot.org/results/0d6ef35c6e88758a0eb2949b7adcc67f6247b2fe | ORPH
  riscv64    |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/2c0ce730b60dff3fc52d79054ec383f7cf65a729 | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/e027cdd61d544db4e4e3d9dc6aa783843d4be3b8 | ORPH
powerpc64le  |          qemu-11.0.0           | NOK | https://autobuild.buildroot.org/results/f6807079d8cf1fb972f1b07f99f1ca217abf4d1b |     
    i686     |          readline-8.3          | NOK | https://autobuild.buildroot.org/results/822be7d1499269a054694c57bedc74d9a5316932 | ORPH
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/56e62ae0b38ab9fad98927a94b4640f46a7c8174 | ORPH
    i586     |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/550582a14da1bc6e89395de46e9cf5d208a39cb6 |     
   x86_64    |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/6aca88b38a9ccce0b3cb55890a3d997f59ecc0e4 |     
    i686     |       sofia-sip-1.13.18        | NOK | https://autobuild.buildroot.org/results/c2974f2c7b3f359bcbdb3a85315011eff76d3ce4 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/88f4c13ff07a64d4a89dd0bbfcbde68b0495adb3 |     
  mips64el   |        tipidee-0.0.5.1         | NOK | https://autobuild.buildroot.org/results/0fd23946fee11e492610382277383fe038e46d78 |     
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/6d1713bb93f7eba94156d211428c29b995d1ba20 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/8ec455dd60cb60855d4ab9440f3e0e7f1f6b3f41 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/37265d3771b9b0c3500683d7a6a2c8a06d9c1912 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/cdf2a97ce9d2b03ea6744954fc9bd82e3298dafc |     
  mips64el   |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/521f7dab3f04feb95137d0faf4caa4927f098fa0 | ORPH
    i686     |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/3e65376a3f1f0288c807a2e0d6b541d64d532287 |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/86a00cbd6568d816a6b19e8d23de8e49899484f6 |     
   x86_64    |    xutil_util-macros-1.20.2    | NOK | https://autobuild.buildroot.org/results/cd0183546bb9323ac74c00851807fcbeb551e4a2 | ORPH


Classification of failures by reason for next
---------------------------------------------

         host-xcb-proto-1.17.0 | 1 
                   linux-7.1.8 | 1 
          lua-lunix-20220331-1 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |     host-xcb-proto-1.17.0      | NOK | https://autobuild.buildroot.org/results/0a3d928c6b2021f9dd1e51c0346427306d2e6679 | ORPH
    i686     |          linux-7.1.8           | NOK | https://autobuild.buildroot.org/results/929c531558bd4c95ea635f1437a1e97defe766ee | ORPH
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/20ab433808aa71d21c3e9048b912388f0f8da1d2 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

                   perl-5.42.3 | 2 
                       unknown | 2 
                cryptopp-8.9.0 | 1 
             dahdi-linux-3.3.0 | 1 
        edk2-edk2-stable202602 | 1 
  gobject-introspection-1.84.0 | 1 
               host-make-4.4.1 | 1 
                 imlib2-1.12.5 | 1 
                  iozone-3.508 | 1 
          linux-5.10.254-cip72 | 1 
                   linux-tools | 1 
                 opensc-0.27.1 | 1 
                   qemu-10.2.0 | 1 
              skalibs-2.14.3.0 | 1 
                      tar-1.35 | 1 
uhttpd-15346de8d3ba42200249... | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/2653681fe8e1b8fdafe381ba41786665eaabc8b3 |     
    or1k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/397541fadcce459f8967470180068b5f1ae1b820 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/ed8cbd0266448f4611d786fee3913b8fbbef7c6b |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/946137c09d41ba27a7d95e059668dc9ed2c3b538 | ORPH
  mips64el   |        host-make-4.4.1         | NOK | https://autobuild.buildroot.org/results/1ed28bd85ce8c72d3cfbd18a510fa16c98661af8 | ORPH
    i686     |         imlib2-1.12.5          | NOK | https://autobuild.buildroot.org/results/4e05404c353ef985d74757d0b1ec3eda2cdff523 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/ed0dad3ae4a00862a25165d442185772d708b3d4 |     
    i586     |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/7ca82e07a8581b36e2dce211b10ba643e679d7b1 | ORPH
powerpc64le  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/e5bb884c8d3ea3267a0d9d38e48b91e548f26866 | ORPH
    i686     |         opensc-0.27.1          | NOK | https://autobuild.buildroot.org/results/75f6d2cddf6374ccfd227cacf6d548b944a557d0 | ORPH
powerpc64le  |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/059fafd1cace721e83b32be72da8f21b067438c1 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/f2b04b8befa49efd2ea2733f1df19bef7b7114c7 |     
    i686     |          qemu-10.2.0           | NOK | https://autobuild.buildroot.org/results/9cbfb113b56a8d769b17e7bf533d77c0f0476e26 |     
 powerpc64   |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/5d23f0f0523a3bd1d009754901f1f0c2a06b6015 |     
    i686     |            tar-1.35            | NOK | https://autobuild.buildroot.org/results/931924f198e464bf5c28691cd49181008f5205fc | ORPH
   x86_64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/bd0956956f9e99126cfb5762026269dc79a050d5 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/365a04957c160453df9549122e7665288b879115 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/69cd37a714d3418f4c3f85507215bafb9a69c826 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

    host-gcc-bare-metal-14.3.0 | 5 
            host-autoconf-2.72 | 2 
              libmodbus-3.1.11 | 2 
                 avro-c-1.12.0 | 1 
                  bcusdk-0.0.5 | 1 
             containerd-2.0.11 | 1 
             dahdi-linux-3.3.0 | 1 
            dt-utils-2023.11.0 | 1 
              erlang-26.2.5.15 | 1 
                   exim-4.99.5 | 1 
                    fcft-3.1.8 | 1 
              fftw-quad-3.3.10 | 1 
  gobject-introspection-1.82.0 | 1 
               gocryptfs-2.3.2 | 1 
       host-gcc-initial-12.5.0 | 1 
host-netsurf-buildsystem-75... | 1 
         libhdhomerun-20210624 | 1 
           libpciaccess-0.18.1 | 1 
  linux-headers-5.10.246-cip66 | 1 
package/linux-headers/linux... | 1 
                pipewire-1.2.8 | 1 
python-remi-2022.7.27-37-g1... | 1 
rtl8188eu-f42fc9c45d2086c41... | 1 
rtl8192eu-6755ce9c15bbcb5dc... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         avro-c-1.12.0          | NOK | https://autobuild.buildroot.org/results/f205709d88e0a0a14e4cc83fe812bcad6b85a4d5 |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/4df1622834037e85b95f29a1cc7fc840761ad32a |     
    i686     |       containerd-2.0.11        | NOK | https://autobuild.buildroot.org/results/4494f0adcd37fd2005d78be312eb57331e6b8e35 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e60ef260611f0eda6204197142b42154dfb46eb3 | ORPH
    arm      |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/9e68edd44f429fbd7036ad65ebc8b6ef5a82e99e |     
    i586     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/24b2436b58e40f59f1067c76f4f3fe5e2ff105a8 |     
    i686     |          exim-4.99.5           | NOK | https://autobuild.buildroot.org/results/0dd8d27d63c5d26442049440dd48b820f4f48746 |     
    i686     |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/5af01f7f1989348d767d661f4700349d62a9218f | ORPH
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/08bd33947c4366821ebfe3b031c26b9101cbcdfa | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/038acc20e1e7924ee0cc200333138360922f0cbd | ORPH
    i586     |        gocryptfs-2.3.2         | NOK | https://autobuild.buildroot.org/results/113f4b7d1529ba3b2dfaee6aae024969b2f1d680 |     
  sparc64    |       host-autoconf-2.72       | NOK | https://autobuild.buildroot.org/results/d0f02ad85e71ac76aada928eb95386ec5692bcc6 | ORPH
    i686     |       host-autoconf-2.72       | NOK | https://autobuild.buildroot.org/results/cdfa8b55347646c2680044c875074a2ebd4e1a33 | ORPH
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/0ac2656751806dfc864f47fd7e2cfa3786dad4ee |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/8c0ad76d9d4244869976e93321a70154684a97e1 |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/312b8913c5480add0e8838578a3e70d2a705f021 |     
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/d04d5393072614937ba0c7d1370653ad2b0de871 |     
   x86_64    |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/0dc8a8c224594ac685f86f9442295c4b6a58d662 |     
  mips64el   |    host-gcc-initial-12.5.0     | NOK | https://autobuild.buildroot.org/results/2ef280fc27a916d13a041c64f1e3cee043608182 |     
   sparc     | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/499eeedab81e30384bb449a8a1ad1f57fe07cf6f | ORPH
   arceb     |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/13662ca72f44746c272becea47462cd5c77fa5a5 |     
    i586     |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/ea5cab5c16b2886338b71d3a980b51d17e1fe64f |     
    i686     |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/abaea322c31080f6e97e7dc2a8d986d9e050d83a |     
    i686     |      libpciaccess-0.18.1       | NOK | https://autobuild.buildroot.org/results/967f653d3ee44878d1358b417df7c1914741e2ea |     
    i686     |  linux-headers-5.10.246-cip66  | NOK | https://autobuild.buildroot.org/results/d87e4c5243cf75431a2b4ea3ea4550afb48b2200 | ORPH
   x86_64    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/8585e6ac884afb61caabc06bb78658c0fe9a5ffb |     
    i586     |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/3e2463d58edc56fc7d6ca7a6d61a741d0721c8ae |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/82a184bfb3c5fc374ff92716cd067db8a08d44ad |     
    i686     | rtl8188eu-f42fc9c45d2086c41... | NOK | https://autobuild.buildroot.org/results/e19351ff11982e7eeabce22f5857d0ca900aac6c |     
   x86_64    | rtl8192eu-6755ce9c15bbcb5dc... | NOK | https://autobuild.buildroot.org/results/351bb9bf239073ddefa04088eb84a6285030f28e |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
