Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E8ACC5DF82
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 03:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD1BD80C27;
	Thu, 20 Aug 2026 03:28:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yu4FWf9vI_m2; Thu, 20 Aug 2026 03:28:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787196510;
	bh=VH/ZQv1TdjYPcd7fq/Ht3SzK3guT1exlZXz3TzntNXI=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qKSn1PD/YiDdBPWZMlV4witXMfwDiFLwHaWa/GiyK7XvlnciURygKMQgXXB4Qj2wl
	 zGPH+/Qo7i8aMb+AGZoIH561jT9eAQbnm/x2/j/MoaFcuYWZQtXo7WsBA6bfMu0FIn
	 v7w/+8E0iHhhjruwhLEJ8PB4wTBAPwWjm9IWWxdV9IvqIdfN99926DsfxNfv+iPhGz
	 w/fcpNifOxKigIX6YcUdeYITdBhLZxgNtQg7P/PtmkVGyIlnR5KWWGoCACmYGs6l6i
	 3VXHHGRJQsYN00JJd7zMtuTFFS8sYkR80iTBzNF1F5onLCUU1QQdoqaN75hzbD7bcn
	 +Q91dRDvHmGug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5463780C12;
	Thu, 20 Aug 2026 03:28:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A76DC334
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 03:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9930D40249
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 03:28:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q8AFUK3pbifx for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 03:28:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=JH49tUr/
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE7E240064
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 03:28:26 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-499ac87c92bso11366535e9.1
 for <buildroot@buildroot.org>; Wed, 19 Aug 2026 20:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787196504; x=1787801304; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=DnWpy6I6B9+B8SUNLg9nrd+WVtBSzPVeSUg88Jr71Wg=;
 b=JH49tUr/3qbBRoZJr240Q8en5VPt9iTMk0qcdTsxdlIK/eAjGmyFW+ML2l7UGHQIjR
 IRboaIQJjlLgr52GJ62eymQPB5zYj9IXFH3RLOxxWGsigocEAzqi9AklVT27tTL93Y1L
 z8QUI9DSd0y983BZwkTI8m8Z4q4KjofqtB8iMnoI8cDCNqjJ8Mbmj4Oy1hSyp2bjuSha
 44J5wcqOlH2r2IdbgR2z/LAwtlnnbYVzw8feehp04SAnf4/lr79MbaGgkT1V0xWFp159
 iCn80p8EAWMTKv8SVq7QnSgy6OlKSvQ14WNck8QXp9s3Es61gRyEATLZohufaXbfBi2b
 k03Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787196504; x=1787801304;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=DnWpy6I6B9+B8SUNLg9nrd+WVtBSzPVeSUg88Jr71Wg=;
 b=nNU28Oo4YpdMa6EhnDcyjpET0p5/Er6BUDPlNHhs2c5IcOd5PwUsysl3hCbf7p6cT+
 8/kNzO6fRtRmTHynq5ivNPBTH1oIf3Pn0klT0Rg8xtzSrCvPOtA+HdK0/TpJ9nKbg/tQ
 vrUjwMxbxMhqQAs0d7hENIxxUaP6O2hH/tsht2VR9nvGAY1Qq3Kkx8JMmdbZtELNxtgZ
 aWMVZzzZ5WiA2xv3u0ovM7bPuYsD8d/sljJRtRIM2cAiDBCsk/XMfak9q437vl4hnUtC
 yZgAGubh0VnuPjBsIHnPZHL5GP3TwX6mDF8z7SgcbXMnBZ83b/mndXLlsQWzXwsob3qb
 WdUg==
X-Gm-Message-State: AOJu0YyBFJa80ew6STZRGWK++NSXWArxEmQ1z9X2CwoqGUAws/nPK+Iz
 eiBsBEJy3EqLI2iUCZMpoLy62asN8csksVbTCvc89ECNfIOYAF+o1YFpfxwxTM7+
X-Gm-Gg: AR+sD111MrGQmnZfVBI/3WHZrhm89lLXzR68vcumNflLEHXTG+4NqCOl/xQXyBZT6X6
 LUUIAUVzFpnYFnj21ybbTzUHsqkZcDUZw/H3zZg7pfx2M+IXp17oMVaqIg/pz6tHIk/Hc4TviTP
 KhK4AdcP03rKeX3KFo8Gjonpss8jIadRpismbMO4+688WaWkAmHmJ+ZO8FtW8+nY1zCWUTabYyl
 rekxFFIoaIqu06/R1rbl28ekEOlMcy/07yJD9bizHpqFkPveWCieG4nAhXKm9cRRfZ33Nrtts7G
 LIxOHxZaovyxYl8DyPCsX9T5iCgJtz5XcwlOwvHkfrcL4XmsfmtjRb3EgSOef2vbrbLfH/1YG+s
 zppNe374xfNvSqrjdw5cwxORh+XUMH7aGYEeDhnCNy2vH7EdKt8xVLDxuh4JXYhbntx7T26Q+zs
 WpXgFY1MQpv6sg7No8qf+9S2RPKly0/REJmNfgRZkyD62j7nR4l0N7jhCThKWKDJQ=
X-Received: by 2002:a05:600c:3596:b0:495:4749:16a7 with SMTP id
 5b1f17b1804b1-499aa1e269emr158461215e9.14.1787196504175; 
 Wed, 19 Aug 2026 20:28:24 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa175d0fsm108796525e9.9.2026.08.19.20.28.23
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Aug 2026 20:28:23 -0700 (PDT)
Message-ID: <6a867457.ba918990.388371.1ced@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 20 Aug 2026 03:28:23 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-08-19
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

Autobuild statistics for 2026-08-19
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  7  | 17  |  0  | 24  |
  2026.05.x  |  4  | 15  |  0  | 19  |
    master   | 40  | 84  |  0  | 124 |
     next    |  3  |  7  |  0  | 10  |

Classification of failures by reason for master
-----------------------------------------------

uhttpd-15346de8d3ba42200249... | 5 
  gobject-introspection-1.86.0 | 3 
              jpeg-turbo-3.2.0 | 3 
                   perl-5.42.3 | 3 
                       unknown | 3 
                   atop-2.13.0 | 2 
                 avro-c-1.12.1 | 2 
                   bird-2.15.1 | 2 
                           gdb | 2 
                 lcdproc-0.5.9 | 2 
                   linux-7.1.8 | 2 
               linux-pam-1.7.2 | 2 
                  ntp-4.2.8p18 | 2 
                    olsr-0.9.8 | 2 
      passt-2025_06_11.0293c6f | 2 
             alsa-lib-1.2.16.1 | 1 
                    attr-2.6.0 | 1 
             batman-adv-2025.4 | 1 
                    ccid-1.5.2 | 1 
                cryptopp-8.9.0 | 1 
             dahdi-linux-3.3.0 | 1 
dtv-scan-tables-15661aabc34... | 1 
edid-decode-6f117a8f8c0e76e... | 1 
              erlang-26.2.5.15 | 1 
                    fcft-3.3.2 | 1 
firmware-utils-c42a3bc53da8... | 1 
                    flex-2.6.4 | 1 
                haproxy-2.6.32 | 1 
       host-gettext-tiny-0.3.3 | 1 
            host-go-src-1.26.6 | 1 
              host-rust-1.97.1 | 1 
                host-wine-11.0 | 1 
                  hwloc-2.12.2 | 1 
            igd2-for-linux-2.2 | 1 
             igt-gpu-tools-2.5 | 1 
                 imlib2-1.12.5 | 1 
                  iozone-3.508 | 1 
                     kbd-2.9.0 | 1 
                libglvnd-1.7.0 | 1 
               libgpiod2-2.3.1 | 1 
          libmicrohttpd-1.0.10 | 1 
            libunistring-1.4.2 | 1 
     linux-5.10.254-cip72-rt32 | 1 
                  mender-3.5.3 | 1 
                   neon-0.37.1 | 1 
            nodejs-src-22.22.0 | 1 
           oath-toolkit-2.6.14 | 1 
                openntpd-6.8p1 | 1 
                openocd-0.12.0 | 1 
                 opensc-0.27.1 | 1 
package/mender-update-modul... | 1 
package/vim/vim.mk:88: host... | 1 
          pkcs11-helper-1.31.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
                   qemu-11.0.0 | 1 
                 rtptools-1.22 | 1 
                   s6-2.13.1.0 | 1 
               tcf-agent-1.8.0 | 1 
                tpm2-tss-4.1.3 | 1 
                   wget-1.25.0 | 1 
x264-baee400fa9ced6f5481a72... | 1 
                 xenomai-3.2.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/fd84c0616c524931141efd6ef6a287217c231d5c |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/7125cecab68274d0fcc2251a4bcdbfa7e4e5e2ff |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/9026b1a84f3d5fb2b6f4423e1fc668ab467a244a |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/d9f0393f243185016309ecd5381957668a5176a7 |     
    arm      |         avro-c-1.12.1          | NOK | https://autobuild.buildroot.org/results/053f359aa56b8a90c1bba9b182b016f6d0022bcb |     
    i686     |         avro-c-1.12.1          | NOK | https://autobuild.buildroot.org/results/b690f8297f9b7310d7678e71de478c1a0277250b |     
   xtensa    |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/e3ec2291b1764f4022cd2884f4a274bdaff73d60 |     
    arm      |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/8ff830f55bf5f69f1190a3e57159375a455c9059 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/671c30360d11b411933826f4042f0290648ee616 |     
    i686     |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/00cdbd2b858eeae20882dfa3c1fb8a004abfc3f1 | ORPH
    i686     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/f53d9b063c70b567aa44a5e7bedb5cc64f8bae06 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/b67416f87b7c3c98cbeaa36dca352cd609032ff8 | ORPH
   x86_64    | dtv-scan-tables-15661aabc34... | NOK | https://autobuild.buildroot.org/results/4693151cbafcfa5b59d7c190ce329d63ee2f20c7 |     
    i686     | edid-decode-6f117a8f8c0e76e... | NOK | https://autobuild.buildroot.org/results/22d196dc04a315d8b46a4870368963a445d89a6f | ORPH
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/aa3944b690ebbaf0e9c74332b4a3eca7ed85a0e0 |     
    i686     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/f7af374ad2d20b5c8a5337850d4971d8cae2c019 | ORPH
  aarch64    | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/e4c9c00e558d27cd9c120c913ca7e08e22312db0 |     
   x86_64    |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/2e008f5d2691e27984ee100830cc88fc8cb87cca | ORPH
  aarch64    |              gdb               | NOK | https://autobuild.buildroot.org/results/dac0196d19fa491fcaf3db778b375428eadb0db3 |     
 aarch64_be  |              gdb               | NOK | https://autobuild.buildroot.org/results/ab52f6d538bda53a810390e2684c76c5ba1d40a3 |     
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/61137d547fd665a7952577fbd7831e3ac097b7da | ORPH
  aarch64    |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/b6298eae60525b23def2c1b51517223d44d84272 | ORPH
    i686     |  gobject-introspection-1.86.0  | NOK | https://autobuild.buildroot.org/results/6076a7db3cbd1ffd3135a00fd7371accbb7d2231 | ORPH
    i686     |         haproxy-2.6.32         | NOK | https://autobuild.buildroot.org/results/3c404d3b277d8782f34fe73d81f823c0472d6fd6 |     
    i686     |    host-gettext-tiny-0.3.3     | NOK | https://autobuild.buildroot.org/results/5c5ffe75bfb65f7c91ade0f593505d802fb34b31 |     
    i686     |       host-go-src-1.26.6       | NOK | https://autobuild.buildroot.org/results/2f952f7d1b1205dfd64cac960eba749603eccec1 |     
    i686     |        host-rust-1.97.1        | NOK | https://autobuild.buildroot.org/results/b03088e35fa541b4b2d43b4368fe0f6d2838b59d |     
    i686     |         host-wine-11.0         | NOK | https://autobuild.buildroot.org/results/993c7454ef7ec9e5d7ed7848c7fce0614b4e8a82 |     
   x86_64    |          hwloc-2.12.2          | NOK | https://autobuild.buildroot.org/results/374e954c07445f363e7014a70b3a90f4b41cf50f |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/b0b23746ab2531736aaf9ff61f1ec63f2a4183f6 |     
    i686     |       igt-gpu-tools-2.5        | NOK | https://autobuild.buildroot.org/results/e668ffca51ceb77860f383579d8f2297746839e2 |     
    i686     |         imlib2-1.12.5          | NOK | https://autobuild.buildroot.org/results/52e09a5d3dcf5876379c3b28ebe30587e9060115 |     
   x86_64    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/c98a4fbddc69417bd5325448b4889f0be31c88a3 |     
microblazeel |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/8657657dc20dd9bf6f66b01fa372e26b053ebda1 |     
  riscv64    |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/417659316045dfde91f481b8a95ecfc72552da65 |     
    hppa     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/71191ea378b7336d7c16c5a81cbca203562df486 |     
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/362d8e52250e8d839aafeb1f1bae3a1bc0c2da2f | ORPH
    i686     |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/3326145bb365f60b26956a3ceab68ba6fed6a16f | ORPH
    i686     |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/abfc6862bcf9dc1ebd14ff0e335022b18db54cdb | ORPH
    i686     |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/4990c852396fb49e0ddbc8f2cbfc82ca8cc3f706 | ORPH
    i686     |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/4b379a71e795c12c389461338c10e9b42a64536c |     
    i686     |      libmicrohttpd-1.0.10      | NOK | https://autobuild.buildroot.org/results/368ac561dc924b4cc0c7ea815a9cec340099ef3f |     
    i686     |       libunistring-1.4.2       | NOK | https://autobuild.buildroot.org/results/60ee1480fde109f0d88f60f5e9b198a07cef2371 |     
  mips64el   |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/97307f7489971c3616344562c54eebefa4acdf96 | ORPH
    i686     |          linux-7.1.8           | NOK | https://autobuild.buildroot.org/results/5f1233b17a8b99644f74c8da299fab8d038261fd | ORPH
    i686     |          linux-7.1.8           | NOK | https://autobuild.buildroot.org/results/062f6428679f5d87ad7dd3b102e0336cc391d209 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/d3a940ff4b84699f54c463d4780ffb7ddc63a978 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/7306d0e16b0cb4beffcb5d093615ac8248ba2ed8 | ORPH
    i686     |          mender-3.5.3          | NOK | https://autobuild.buildroot.org/results/423481e9a68a785878631a543cc75d64380f679d |     
    i686     |          neon-0.37.1           | NOK | https://autobuild.buildroot.org/results/d522de70dd2953256020bab9de7f4f618b2e0edd | ORPH
    i686     |       nodejs-src-22.22.0       | NOK | https://autobuild.buildroot.org/results/f041148e659598f5357127a3fa6beec36e33d0d5 |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/989a71fe0b1affa46b221c013a09621eeb7d3e79 |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/a3d94e9601eed494cad4ed7424873514144fa73d |     
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/ec7dedc4bd579845260b7997198f7a0c24a769be |     
  aarch64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/96054138a5f4c65e4aa3874f943b682745ab6656 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/7754d4145c6625050c62a8578469b495f77d59c7 | ORPH
    i686     |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/623f70268d0d696d4fb311a771e51b783df495ad | ORPH
  riscv64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/a26b2bcf3af9a78351d0a97131b28182b27cc674 | ORPH
    i686     |         opensc-0.27.1          | NOK | https://autobuild.buildroot.org/results/bc0c1dfc00be0c04e864f484f68f31cd13637946 | ORPH
   x86_64    | package/mender-update-modul... | NOK | https://autobuild.buildroot.org/results/9cd82ae1ba924e707ad5721fdf8938b838c142e7 |     
    i586     | package/vim/vim.mk:88: host... | NOK | https://autobuild.buildroot.org/results/94405826c745b67fb81d2f1902447cf275544f9b |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/ef99e87cac06aabc665ca238ee4628314ee7f659 | ORPH
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/e6856c2acc30a02d5f3d5460824489ae896f4f23 | ORPH
   x86_64    |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/dc1bedc77500e3dfd157a2b04a1b2b894c104ea0 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/9ec8133b8ca918cc990fdf8c55f89e2a4d5089e8 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/c9c4736b3cc7b644b917febda66b15cf7fe5322e |     
    i686     |      pkcs11-helper-1.31.0      | NOK | https://autobuild.buildroot.org/results/b6348c995aab71b2620493b672f5fa6ea580bcc9 | ORPH
  sparc64    | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/dfc80b144cfb9d874f7fbeaf77d3bfbf04fe895a |     
powerpc64le  |          qemu-11.0.0           | NOK | https://autobuild.buildroot.org/results/fff0380eec37666986b73c38d571a05e575ed227 |     
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/4b12918c42d85547580f3e1f64a183a6ece4ebb3 | ORPH
    i686     |          s6-2.13.1.0           | NOK | https://autobuild.buildroot.org/results/47244d28aff289c33bdc4d17db5af3d1e6bff6bd |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/06de757227ba2f237cd198946f8723a9086ac840 |     
  riscv64    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/852a9e15ef8b283501d5892c4dd55bba5c203a78 | ORPH
powerpc64le  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/0b74e84b45c4e7fdfb892270ca0281ccace67207 | ORPH
    arm      | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/eb7f30d24ee34bb65093e1be1409f1b6b1e17487 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/bc99eba784b6d6a36fd1f43426dee4c439a92596 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/131d06b5e87c8cd5af006b8c64724b81329c8916 | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/5297623cb307d8f120394c6308f2152bad362db1 | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/715d4a8ee3c46ac55d93db44a35c569b9bb81075 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/b925064681b803637b9a3732e8ba7629596288e9 |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/981ab786609c70a18ce26143968b7f0f7f4580b5 |     
powerpc64le  |          wget-1.25.0           | NOK | https://autobuild.buildroot.org/results/94be0ba6f1a8ddb39e203dc28b030b901a58471b |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/1e64de56fd777b8ac9ecb34d36812ce751011631 |     
  mips64el   |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/29d17e447435bf899c21854354a51f469d59ace0 |     


Classification of failures by reason for next
---------------------------------------------

  distribution-registry-v3.0.0 | 1 
        edk2-edk2-stable202602 | 1 
              erlang-26.2.5.15 | 1 
              jpeg-turbo-3.2.0 | 1 
                    olsr-0.9.8 | 1 
rtmpdump-6f6bb1353fc84f4cc3... | 1 
                 rtptools-1.22 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/9395500a8baee6c6142f96d7bc97e81725c2e754 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/9dff07be07f496628d7717a5d920c5650b0e9ff2 |     
    i586     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/1947d89f703aa7c0378ec0aa700a4875268f5b28 |     
    i686     |        jpeg-turbo-3.2.0        | NOK | https://autobuild.buildroot.org/results/392b9dfdd836b4f412a28f189fd6ed741dbda5bc |     
  riscv64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/43fb192b8cb72896417e0bbc52bca92f763816a5 | ORPH
  riscv64    | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/78050fad4689c0f010cee808efd1cfff9b05147a |     
  mips64el   |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/07f64b66040da8ed747ea88a14ae71af90e9cc3d | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

  gobject-introspection-1.84.0 | 2 
   openvmtools-11.3.5-18557794 | 2 
           gumbo-parser-0.13.2 | 1 
            host-go-src-1.26.5 | 1 
              host-rust-1.96.1 | 1 
                   i2pd-2.59.0 | 1 
      libabseil-cpp-20260107.1 | 1 
libfutils-c326ce0cc2a735438... | 1 
                  libsepol-3.9 | 1 
            minizip-zlib-1.3.1 | 1 
            nodejs-src-22.22.0 | 1 
                    olsr-0.9.8 | 1 
                  zeromq-4.3.5 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/70fb8c9b323639be893710d8e46d969a8ec396a1 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/294264a42a6e9f39fd9c29026bad877d769c2724 | ORPH
    sh4      |      gumbo-parser-0.13.2       | NOK | https://autobuild.buildroot.org/results/7863465d2ab6dea2e7c481608a56e9f29d3afb98 |     
    i686     |       host-go-src-1.26.5       | NOK | https://autobuild.buildroot.org/results/0230516109cd6e48ee8e9fff888a8273dd820f06 |     
   x86_64    |        host-rust-1.96.1        | NOK | https://autobuild.buildroot.org/results/129df82b60684eb5c75e6adf8b03c41a0c052a06 |     
    i686     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/b2a8cfa3ec435a3dfce2eebb7728a8bcddcf4673 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/ad416ddc11398e5af93aa4af4290f5179bc4315f |     
   x86_64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/7d7c03fb629ade675adc3805908e8fd96225395d |     
powerpc64le  |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/f601751d72b0877ea3ebdf86c63e979ee1ac0c30 |     
    i686     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/e156ccbf3134e27cb2f21cc66efca9fad06eef43 |     
    i686     |       nodejs-src-22.22.0       | NOK | https://autobuild.buildroot.org/results/720a8203704446bf3ce1b58729803d659017e788 |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/40da44b8336bc41c071c8f67a6c87ca692b5982d | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/6b34894bf27577faa0d954e4870cb7fa738c5b52 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/fedb6d3b0336f4ecc3e01df86f3234917c54d756 |     
  riscv64    |          zeromq-4.3.5          | NOK | https://autobuild.buildroot.org/results/e26a26b665c3fb7f6cd5ffe8f238a3d078747501 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

             dahdi-linux-3.3.0 | 1 
                  ffmpeg-6.1.5 | 1 
               freetype-2.13.3 | 1 
            gdk-pixbuf-2.42.12 | 1 
                     gzip-1.13 | 1 
    host-gcc-bare-metal-14.3.0 | 1 
host-netsurf-buildsystem-75... | 1 
        host-python-lxml-5.3.0 | 1 
              libgcrypt-1.11.1 | 1 
            lttng-tools-2.13.8 | 1 
package/wine/wine.mk:347: w... | 1 
                   perl-5.40.5 | 1 
           python-numpy-1.25.0 | 1 
                 rtptools-1.22 | 1 
                  stunnel-5.80 | 1 
                systemd-256.17 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/94aef1a6e73ed563916c3f91cda6b28a66ca7a2d | ORPH
   arceb     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/f5fc731e3f86dfe67ddec4224837bb00daa6f206 |     
  riscv64    |        freetype-2.13.3         | NOK | https://autobuild.buildroot.org/results/272794e59249d13ff0006a7121b7593484a4a26c |     
  aarch64    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/64952ad9b8d1ddd64eca24a8427f363aafd0f3c2 | ORPH
    i686     |           gzip-1.13            | NOK | https://autobuild.buildroot.org/results/ccc30a1cef610b42ebeb4a4a80b39c53629f6ecc | ORPH
    i686     |   host-gcc-bare-metal-14.3.0   | NOK | https://autobuild.buildroot.org/results/7b07eeb4b65181312bbf9b98bf1f092d27642b56 |     
    i686     | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/def96f63ea7b5ee2b31df99f21e0c239d1e3c344 | ORPH
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/8cb53e0edd15139fb52aca112f640ccc922fe909 |     
  riscv64    |        libgcrypt-1.11.1        | NOK | https://autobuild.buildroot.org/results/6ae442f02c17ba50f92de4fc37691859801b82a5 | ORPH
    i686     |       lttng-tools-2.13.8       | NOK | https://autobuild.buildroot.org/results/21313b3f8df7aa3eae0f228b4dbdb2918292440c |     
    i586     | package/wine/wine.mk:347: w... | NOK | https://autobuild.buildroot.org/results/43f0f17e2b0f2a2c29226873cc0888a23b10c53f |     
    arm      |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/5468b8379afc3c2acc7772e39d8c6091e79ba628 |     
    i686     |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/e13f27084d6312a8fcf231b3281178363f233c6e |     
    i686     |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/9d3059251133b48ddb739f1d7c4600f3d976e6d1 | ORPH
   sparc     |          stunnel-5.80          | NOK | https://autobuild.buildroot.org/results/c3948dd8735c76c2f434de77882512b870d77361 |     
    i686     |         systemd-256.17         | NOK | https://autobuild.buildroot.org/results/96ca1474cf3e9186086fd5326422daaf7f304e42 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/dcb29985fffb55c7c05de50296f02f1a9af7fe0e |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
