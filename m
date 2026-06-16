Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B7CACD98D2
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 03:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DADDF84CBA;
	Tue, 16 Jun 2026 03:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GqohAcwsb5P3; Tue, 16 Jun 2026 03:25:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D85CD84CC3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781580318;
	bh=4c8Qu/49qQt7MI7oG0gBoIj0Dcs/oT+0LlyFNXwV9yY=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PBNXHWnigpcCyS15KbQ/rwM7qK4Du9huID8cSR8Ek5h+jaTlCEjCI6ZnbB3lVc7BC
	 89Y6BW0662MeSbYzRXLznsHLb7hf/zw5Jf6f2gnKqS1nokTMU+HrGVXzdoNJObjXlj
	 Mre+TYyEEUJKsc4GYIW62i3vVYpJ1ai7iQN+b3AHh7mjA4D8PzI6j7y3pZRrtUh4vB
	 8pco44Tl/s6zEeHpG1hRWf3hDrxLPMet+ZfOGqlgJcfqa8BOHy1yO6ICA6MrzaVXoq
	 cXYvwWikniHzDCZfff312nJdg3cZyX4AgDm6MnIat56K46EomnYRfaeiOs6+xl2deD
	 kjeA0xh/qHuPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D85CD84CC3;
	Tue, 16 Jun 2026 03:25:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 46C5A2B8
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 03:25:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7B6E428F4
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 03:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yt5SzQwC3EIA for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 03:25:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C0969428F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0969428F1
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C0969428F1
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 03:25:14 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4905529b933so40708855e9.0
 for <buildroot@buildroot.org>; Mon, 15 Jun 2026 20:25:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781580313; x=1782185113;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=A+WQfqeb5UMxpSjFNlB7oxqD89j830herkdRbPndd3A=;
 b=G5pQvBsNWStYuIs5o0nXF59adr/HiLjBY4YIjAqdOwa7gtezElFSqbFMAqyj76MtKj
 776RreBw4ZrUN32ileQYAvrW9a2UErA1QwBPaDRMX8/uvkRSaxA7EN14MVrB6TyLEzkq
 GItlzXXxOFgOgGG2g9vo6whVr9o5QE+oioNn5mMIuduNvx5T4pXcCpxiJJgr7/BycQb+
 g8Ppl5w3p+gLTtR4GePS4J4LtzKaRV6ikJF0ibrmCJXmewjVHxiLBDc6rgolBd0WD0Fk
 lhMpIG9K3k3B8T37nvriq52+RkgXYGXMre7rv0a54mfluGg2fhy/aFzXMJd6ZINvH8dt
 1hxg==
X-Gm-Message-State: AOJu0YyQ3dCh0HEGPrxL1l8tVvSz0lOOHzaTN1ZlGYd7pdIPdJxLjR6P
 2Ri7oZK1z9p3syhFPz9E+u0hr/JIYtVkBWcAAJed4cKq8JlEEiY39PTtNzVjt94A
X-Gm-Gg: Acq92OFNBIN4lPDfE2T/WQ42jR2mBpgt2DjyhW1naewpzGd4qIBsBtIVJ5S3UEWOSaz
 wGZSEvHsyPY6VyD1y0hnRuolcija00VdjAREGNgWjnv5HhhTZvkLJTb8+DQ88/1HwH66o6nuQfX
 +DpFFzNgAXU96T5uNGs5uKPiFBSwKPQrSr8FDKINxpdVwy8wKS4wcRdQYsB5O1fbsFXvmb/IB/Q
 Pa7vlJ2tTCCfe0Kcm+hd9gJVHBB3xfLHwNELRSpvvC8zNg6UPeQeUX1Qj8EwAjGJYnoMpHizB7e
 uKl67Vz6LByM75PJoFZzgnNyAvB/rYuuQDHKRcqrZjNxjink/JDA21kMBJ6wQ/WgstCP6hjGvfF
 L2Ctz2N3pxHh3OhAbRH+ZhC1WuJvFExmaWcMfVgjd6EbZjRb+qWdHtOUBHmOvP29PT3P7v42NsT
 Y70PYLHUhV6Y9LMDnvtJrc8NARzI4oK6XlNmsA
X-Received: by 2002:a05:600c:8a1b:20b0:492:25a0:1730 with SMTP id
 5b1f17b1804b1-4922ffa41b6mr18963575e9.32.1781580312333; 
 Mon, 15 Jun 2026 20:25:12 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4922fa510e7sm48454385e9.7.2026.06.15.20.25.11
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jun 2026 20:25:11 -0700 (PDT)
Message-ID: <6a30c217.a485311c.182bde.3f45@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 16 Jun 2026 03:25:11 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1781580313; x=1782185113; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=A+WQfqeb5UMxpSjFNlB7oxqD89j830herkdRbPndd3A=;
 b=SLJMHcBHJyjJdV1isVTGZoSK3lp9aQifG950rpjMxTzxMmI8vcwnlgnLA1Ko/zqHs1
 Z+qaKQh7FlVeROdF9a4ZhNyKGWwP6ERCh/om7MG4cjvq1Er4OXZi7b2FhyqZ71oaVpmG
 zGMYWoCh3hmAeJhH0p1Ve1s6lGb6wvsLUzU+Z0eWhuF7A8ISPLPFIMeMvXfANxffVMCs
 Zbvwn7y4a8blVNw5Q3nJuoQWNsaIfUlkxkLEqd6SCCfuznq0F/wC94fImzwfKCbTOT0B
 C7oxZNbAv/wDiOUmklKNua3liI70Ggf1dsPguyVzR23Cby97aqpmW+CMsc5L0xUSi+LC
 zgOA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=SLJMHcBH
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-06-15
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

Autobuild statistics for 2026-06-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 17  | 16  |  0  | 33  |
  2026.02.x  |  4  | 11  |  0  | 15  |
  2026.05.x  |  6  |  9  |  0  | 15  |
    master   | 51  | 206 |  1  | 258 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 12
                host-odb-2.4.0 | 6 
                   perl-5.42.2 | 6 
            18xx-ti-utils-R8.8 | 5 
               host-dracut-110 | 5 
              host-pahole-1.28 | 5 
                    olsr-0.9.8 | 5 
                       unknown | 5 
uhttpd-15346de8d3ba42200249... | 4 
                 aichat-0.30.0 | 3 
              erlang-26.2.5.15 | 3 
                  ffmpeg-6.1.5 | 3 
                 gnupg2-2.5.20 | 3 
                   guile-3.0.9 | 3 
          host-binutils-2.45.1 | 3 
       host-gcc-initial-15.2.0 | 3 
host-google-breakpad-f49c2f... | 3 
libfutils-c326ce0cc2a735438... | 3 
   openvmtools-11.3.5-18557794 | 3 
                 systemd-258.7 | 3 
                 uclibc-1.0.58 | 3 
          usb_modeswitch-2.6.2 | 3 
             dahdi-linux-3.3.0 | 2 
                   dante-1.4.4 | 2 
docker-credential-acr-env-0... | 2 
glibc-2.43-27-g4070d808bea1... | 2 
              host-guile-3.0.9 | 2 
                   i2pd-2.59.0 | 2 
                  libva-2.23.0 | 2 
        ltp-testsuite-20260529 | 2 
           lttng-libust-2.14.0 | 2 
          lua-lunix-20220331-1 | 2 
                  ntp-4.2.8p18 | 2 
                 rtl_433-25.02 | 2 
                     shim-16.1 | 2 
              tailscale-1.78.1 | 2 
               tcf-agent-1.8.0 | 2 
                 zabbix-7.2.13 | 2 
               alsa-lib-1.2.16 | 1 
amazon-ecr-credential-helpe... | 1 
                     apr-1.7.6 | 1 
                  bind-9.18.49 | 1 
               binutils-2.45.1 | 1 
               binutils-2.46.0 | 1 
                   bird-2.15.1 | 1 
               bpftrace-0.24.2 | 1 
                   ccrypt-1.11 | 1 
          cloudflared-2025.8.1 | 1 
                     cpio-2.15 | 1 
                   dbus-1.16.2 | 1 
      docker-cli-buildx-0.25.0 | 1 
              e2fsprogs-1.47.4 | 1 
                easydbus-0.1.0 | 1 
                enscript-1.6.6 | 1 
firmware-utils-c42a3bc53da8... | 1 
                    flex-2.6.4 | 1 
                    frr-10.5.4 | 1 
            gdk-pixbuf-2.42.12 | 1 
  gobject-introspection-1.84.0 | 1 
                    grub2-2.14 | 1 
                haproxy-2.6.27 | 1 
                haveged-1.9.21 | 1 
host-am335x-pru-package-5f3... | 1 
          host-automake-1.16.5 | 1 
       host-gcc-initial-16.1.0 | 1 
                 host-gdb-14.2 | 1 
            host-go-src-1.26.3 | 1 
    host-mender-artifact-4.2.0 | 1 
            host-mtools-4.0.48 | 1 
              host-rust-1.96.0 | 1 
host-vboot-utils-7dfa482d6a... | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
                iproute2-7.0.0 | 1 
                     kbd-2.9.0 | 1 
kismet-52bcb902e36b2df1562c... | 1 
libdill-32d0e8b733416208e04... | 1 
              libopenssl-3.6.3 | 1 
                 libpjsip-2.17 | 1 
                      libsepol | 1 
              libsndfile-1.2.2 | 1 
              libsodium-1.0.22 | 1 
           libsoundtouch-2.4.1 | 1 
            libunistring-1.4.2 | 1 
                 libv4l-1.32.0 | 1 
          linux-5.10.254-cip72 | 1 
     linux-5.10.254-cip72-rt32 | 1 
                  linux-7.0.11 | 1 
        linux-headers-5.10.258 | 1 
                   linux-tools | 1 
               llama-cpp-b8117 | 1 
                    lua-ev-1.5 | 1 
              luabitop-1.0.2-1 | 1 
               madplay-0.15.2b | 1 
             matchbox-lib-1.14 | 1 
            minizip-zlib-1.3.1 | 1 
            nodejs-src-22.22.0 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                openocd-0.12.0 | 1 
      passt-2025_06_11.0293c6f | 1 
                  pdmenu-1.3.6 | 1 
       python-autobahn-25.12.2 | 1 
            python-iwlib-1.7.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
                   qemu-11.0.0 | 1 
                   redis-8.8.0 | 1 
            resiprocate-1.13.2 | 1 
rtl8188eu-cca7c28087db740d7... | 1 
                 s6-rc-0.5.5.0 | 1 
           sane-backends-1.4.0 | 1 
                    sbctl-0.18 | 1 
                  swipl-10.0.2 | 1 
                    szip-2.1.1 | 1 
toolchain-external-bootlin-... | 1 
                tpm2-tss-4.1.3 | 1 
               trousers-0.3.15 | 1 
ulog-0389d243352255f6182326... | 1 
             util-linux-2.41.4 | 1 
               valgrind-3.26.0 | 1 
                      x265-4.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/8af60580a82861b8d37d111d6c0359b693376dd7 |     
  mips64el   |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/e22b6869e8ec8e932ff1b2ff240767e9c81b9389 |     
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/42d6e20851956ef10b1d98699682cb923e7a0112 |     
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/b8b9c4675c90ebc52fbd1223180921042da3efd5 |     
  riscv64    |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/47ac93df51fd70570a35df0c6944909e07e56b23 |     
    i586     |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/c38a21c80490d5012c5b7bd926e778b406b5f26a |     
    i586     |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/a1da525f8271e818d9984272ef23d694ccec0b64 |     
    i586     |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/2bbef42e2a8008537778d3c5be5042f52408f842 |     
    i686     |        alsa-lib-1.2.16         | NOK | https://autobuild.buildroot.org/results/d5227ce1b4ffe2b5320b3356d82ef55a2fb3eea3 |     
    arm      | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/d969ce3b694336469a41df3c93ddd77738f35634 | ORPH
  aarch64    |           apr-1.7.6            | NOK | https://autobuild.buildroot.org/results/03412ebf3d920194c92b989b1a7fb00fa0e7f4f3 |     
    i686     |          bind-9.18.49          | NOK | https://autobuild.buildroot.org/results/185434355bffcd8a95fecbe90604d146833eaa25 |     
    i686     |        binutils-2.45.1         | NOK | https://autobuild.buildroot.org/results/6641276d90995f500d094f24d00b6bd5298a9570 |     
    i686     |        binutils-2.46.0         | NOK | https://autobuild.buildroot.org/results/12641404e00bd484d139bc8e4b539ccf00192dbf |     
    arm      |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/e075d853f83e18a6c4e222a719554e941275ccba |     
   x86_64    |        bpftrace-0.24.2         | NOK | https://autobuild.buildroot.org/results/b14d306056990d748cf119ca06d24a603e17adc6 |     
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/30fe58aa5462d6c9976a214ac5d0fdcf430c24df | ORPH
   x86_64    |      cloudflared-2025.8.1      | NOK | https://autobuild.buildroot.org/results/db66d6a8b8201cea0d359f9cbce6e333dd9e54c7 |     
    i686     |           cpio-2.15            | NOK | https://autobuild.buildroot.org/results/b81732810ed1f1b55c2dc78937d9a803e51d5447 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/910cd7772d22560b5fb5a2086e05c23beccd5ca7 | ORPH
  aarch64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/e8b36d264d33f690c9bdfdcf77f92e38cdc409f8 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/6189a5cb93c3c3d0145109964aef81bffd6e7e23 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/8d86cde66331668a3b4eb644d184eeb522788ec4 | ORPH
   sparc     |          dbus-1.16.2           | NOK | https://autobuild.buildroot.org/results/6dadf37eb3d1e765bafbfb57abfdf788619b22e6 | ORPH
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/53244acb1c3a5572e32aa52e9f87de3ab87506c5 | ORPH
    i686     | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/2171c0306b45bf39c96eed31331950fb22251c07 | ORPH
    i686     | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/4b4541c072cb67afb8819c69686bda0f278eebc5 | ORPH
    arm      |        e2fsprogs-1.47.4        | NOK | https://autobuild.buildroot.org/results/ced8b2fa4899571d507ed69b400c3b47c4ddf245 | ORPH
    i686     |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/d42fc489e48bd834a7f7cc4d9c7680291878cc0e |     
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/ec0bc6ba4634ca94eb39445f4fffe2a53531344a | ORPH
    i586     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/b892e5b20a0897352e5798dce574d5173801e854 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/4d11359b9342965a61dd91e87a52f4fd34f36b90 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/e291d43a01e839669ae2232086e5d7c71e391906 |     
    i586     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/8860813f11d3903eaa3c7ffb681af17957f8134c |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/813376bff90caa4d1ae6ac409624a83b14bdc1a9 |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/3f23bec8160f33e04a6cf092fd314f79eb375d48 |     
  mips64el   | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/cc56b4598fe9fd3a16662b0499ebc73670875c86 |     
    i686     |           flex-2.6.4           | NOK | https://autobuild.buildroot.org/results/dd001829c8190f77f830cce4728510b2094d5d07 | ORPH
    i686     |           frr-10.5.4           | NOK | https://autobuild.buildroot.org/results/406ac949279fe9cd73a491953a431cfc3808aa63 |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/51cfb63c17d2a5e2e1348a5aba5add036b792607 | ORPH
   mipsel    | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/63a6e91c284eea60983b576e237d7d73b63d4f6e |     
  mips64el   | glibc-2.43-27-g4070d808bea1... | NOK | https://autobuild.buildroot.org/results/7a3e66cc58995ccfa143ba8f1841cf62a83c4918 |     
  mips64el   |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/acb60e61a0aa2383452fcdb32a96309c8cb425bd |     
  riscv64    |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/0316ef27a949fc13d69dc02887257e3d8237ee2e |     
    i686     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/8da59039ee2577f0536e7bd33819d9c11b2a3490 |     
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/f74192ea73b349d198665d1cd13da2cbfd1e7667 | ORPH
    i686     |           grub2-2.14           | NOK | https://autobuild.buildroot.org/results/f6e454f39652ecf486fcb458fe1d90ade18f5b3e |     
    i686     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/6cb1bbddb38648e0277c5e58f449cece3deff358 |     
    i686     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/665a21c2b2084b5233ec35ff6b793d820d54b010 |     
    i686     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/faf0bc08d7a713711b31390218e868d7cc2ed3a9 |     
    i686     |         haproxy-2.6.27         | NOK | https://autobuild.buildroot.org/results/cf1938e4b972f64a3639c4a9a5b2c344c0d9f7e1 |     
    i586     |         haveged-1.9.21         | NOK | https://autobuild.buildroot.org/results/842f3cd94d8cb852108d307eccbda9bba0882395 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/e87d5da8f1390a2e65a40d46f3ae4c056b89d9c3 |     
   x86_64    |      host-automake-1.16.5      | NOK | https://autobuild.buildroot.org/results/e42710bb4f086d4d3c84cccd752bf25210b82859 | ORPH
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/bc9cdbcb30e60a4df21a4c9e911dc22f06f40bf0 |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/70feaee734018662932199634c411fa048ebf1ca |     
    i686     |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/b49a182417d197377fdcedeb92fa75119111d265 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/a3381f0502550f264d05f40fffd3a336fdebac6e |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/6af108f407aad620e70b7ec7f3e4cdd246d344b0 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/0940a932b5853da5f79b1c864122ed83c38c6007 |     
    i686     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/6b8ec2b06fcb887d9ecffec1c2c0545ffbd13cd5 |     
    hppa     |        host-dracut-110         | NOK | https://autobuild.buildroot.org/results/18d2b61f99e8c6f8e6f67915348556b7c754bfd8 |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/333d13c9fd758b2ca2496c45780305187270d9cb |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/914f58667962fbdcab1c7f3dc788428be703c575 |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/7c46442788282751e44368a4b89e520280f80e6f |     
    i686     |    host-gcc-initial-16.1.0     | NOK | https://autobuild.buildroot.org/results/86573b0d5b0882b727cd3e05637e003fb23d26a3 |     
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/7635d2c69ada63cb6692241780ce3944a3b168df | ORPH
    i686     |       host-go-src-1.26.3       | NOK | https://autobuild.buildroot.org/results/03b8eceea2cc40e808e82a1f9e087864acd2b92a |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e3325b81c89c49573ebaa0df3cd0adc8c86352ff | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/825696ed7a166c02f8bfc99ca1e735ef636a5e76 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/12f1137958db26f694d00551b610d9d87a72251d | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b5cc977bcab57df07f2eb7374e0db4c0773cfe9b | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d1c09d76be8daa34edf29d09487c4ac9e4f4fd45 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/db15d2b57feb7f391d2266f7907c27e9253c24e7 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/15f2d6ea64c20241d78d7de03e1c2851356ed46d | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bdaa3da8f225c238e7533624f7ac2b8feea5079c | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a6fc364260db5b21fb588a22b46810b48c11b073 | ORPH
    arm      | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d116c5ca45bf332579faf2415a8f5d119d5a253a | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/65322b1265d22153aa7f8b766197d61e299cfde2 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/28039d300d09282adb26a45496cb894c3da8b468 | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/d13c33f0eba8dcce40f72d31b52eb87c7c5f3a22 |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/9af3eb7f988160cfcecff8fe97cab71b24dd3a9b |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/cbd418a22b67b8202b275c46ab0d1d3c8b219f3e |     
    i686     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/969edc76053ac6ac16397c1cbff42c22af2cbf4c |     
    mips     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/8e421ea5f65dd0b3576cda84adb8d64b272b9167 |     
    i686     |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/691fc3bf38b972f9c890e45f77b125af58bf0fdf |     
    i686     |       host-mtools-4.0.48       | NOK | https://autobuild.buildroot.org/results/60169c67433b7e029529510a86795020d1a14309 | ORPH
    i586     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/898d85f717518504538502a443f12930a667ab98 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/60bd92f5ca06a6f074a105ebf7fef0c766820b4d | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/dd687d8101ba3464eba2b5b1c1333f39a89aac92 | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/adad64cfa2b9fdd0aa904ba1f711ca89ddba1500 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/c74dfe47c38ffec965fe9fa35c4a965e2768af5a | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/58943b6d8af4650b61c65b426d18c4c7546ae886 | ORPH
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/64c1cd19fb1f26d215ec37f74fb248527f8e063c |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/c91ed366f902d115824e03e1988ed21ae14c81b7 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/06609cc6837272990b784181a594d207cc404583 |     
    i686     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/2336d2ee051055a49e0a5af2c045d7f031c90de3 |     
 aarch64_be  |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/322b8ad662a3089ea72110782320557702859f49 |     
   x86_64    |        host-rust-1.96.0        | NOK | https://autobuild.buildroot.org/results/e636ecc1b8210fd8eb9a01fe7047324b79fdb1b2 |     
powerpc64le  | host-vboot-utils-7dfa482d6a... | NOK | https://autobuild.buildroot.org/results/44f89904be8b5fb8fae15f032071541a147c5db2 |     
microblazeel |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/31adf8ab1e42a68f7dbd42ae62dcd3a3305ce21a |     
    i686     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/e8945f400956729259aba641a8fb1dfa2539fe8a |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/142d62b69b7a955184e91031a0f4d3cad4a0db12 |     
    i686     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/cdde6ab917d7ad1d3cd062ef8f6a4253285f45ec |     
   x86_64    |         iproute2-7.0.0         | NOK | https://autobuild.buildroot.org/results/b49c4ed2a3b727a705531e58aa07e3236ff8e34c |     
  mips64el   |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/e01f12803c21ac07b92b640126051fb70c7624d7 | ORPH
    i686     | kismet-52bcb902e36b2df1562c... | NOK | https://autobuild.buildroot.org/results/ab87bf29f4f1afe191c52fe1bccb734af0171553 | ORPH
    i686     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/9f6974cf10567d468f2cca68f3d88a7524b99030 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/6d12e5b293166d7c5cc91b059efb5001e1162f7f |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/f70a85d69bf0bc3b459f27f37fdcd1cc17a01817 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/df834f8c9eac1ea2a5ed0896914bf5b4b837dfc1 |     
  riscv64    |        libopenssl-3.6.3        | NOK | https://autobuild.buildroot.org/results/06fc863692a6e385c13daafa5c5ca7435034fbf8 | ORPH
    i686     |         libpjsip-2.17          | NOK | https://autobuild.buildroot.org/results/d1f9f4a2a7fea51a8463028e68f8780e1d9fa53f |     
  mips64el   |            libsepol            | TIM | https://autobuild.buildroot.org/results/e461853e9af7fc6699861032153df58f7b4d402d |     
   x86_64    |        libsndfile-1.2.2        | NOK | https://autobuild.buildroot.org/results/f0de22e740f7aea4f9b3e1268d42617f97b628ed |     
  mips64el   |        libsodium-1.0.22        | NOK | https://autobuild.buildroot.org/results/3d6aeccd071703ba956200744e8403fda0d2cc70 |     
  aarch64    |      libsoundtouch-2.4.1       | NOK | https://autobuild.buildroot.org/results/0fe8adb7ce49ec05162ca4616f2e7a5cec424bd3 |     
    i686     |       libunistring-1.4.2       | NOK | https://autobuild.buildroot.org/results/71df97a4ab11d66e93da36e4519d1228fd717855 |     
microblazeel |         libv4l-1.32.0          | NOK | https://autobuild.buildroot.org/results/a32c75f5fd1fa66454d7a1ff069a58cb33b9acd2 |     
  mips64el   |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/e89bb20808631444c6935d2f6af701a2653dd2b7 |     
  riscv64    |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/977326d22260724588ebbe9e5f071a57c144de8b |     
    i686     |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/81cadcdafd08daf58eac7f9bfe9ce4d9e66a4747 | ORPH
    i686     |   linux-5.10.254-cip72-rt32    | NOK | https://autobuild.buildroot.org/results/60893c08332a11c0a0dc8239421681f21ae0d0db | ORPH
    i686     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/2c1883deca4a5bcf02d676713a06f8654cacfac5 | ORPH
    i686     |     linux-headers-5.10.258     | NOK | https://autobuild.buildroot.org/results/89f9fd0a2291b3146ecda34d236c9f92f0eada36 | ORPH
powerpc64le  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/9a760b5f34e84f9a9917de3d68e5d2966a5718ed | ORPH
    i686     |        llama-cpp-b8117         | NOK | https://autobuild.buildroot.org/results/3e574e04ad476720d531b4907ecbfd6cba954c65 |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/2624e9ae68e3bf091d36aa18e41fe89e0bae1ffc |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/6180d4ce1ac6505237fbdd3de09e1d129d5bdac0 |     
    i686     |      lttng-libust-2.14.0       | NOK | https://autobuild.buildroot.org/results/a45487a6b5f705c2fbaa21039404eeb7eb6703ed |     
    i686     |      lttng-libust-2.14.0       | NOK | https://autobuild.buildroot.org/results/62c1275c6d5e4399f37bd3e320c89f30c48241aa |     
    arm      |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/ba7453e83561f8a8a6f34b508bd60d12f958922f |     
   x86_64    |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/1f764b1d351b6c98c2f3c6a0d7daaf6c2f8629b8 |     
    i686     |      lua-lunix-20220331-1      | NOK | https://autobuild.buildroot.org/results/d36f2871fad4f531474c158172573943e138a687 |     
    i686     |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/cc3ad65927a784b376a4aa7e5c29ef5ff91e6a25 |     
powerpc64le  |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/6e29f3a739e9193e6a9448b54b5ffbb5b6970790 | ORPH
    i686     |       matchbox-lib-1.14        | NOK | https://autobuild.buildroot.org/results/b4955173f5097286aaeea70bd74360ebb379c686 | ORPH
  riscv64    |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/5547bdca093c7fc48f6f3e0f6165e02f600d0585 |     
    i686     |       nodejs-src-22.22.0       | NOK | https://autobuild.buildroot.org/results/a3b57ebb2b5d78120c12e16b666c086020ccf0d9 |     
  mips64el   |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/f61b854a0983dc4f2df0dd27fdb2d975fb5a08a9 |     
    i686     |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/e62141a6a40e49d4de6447ed98873592e0baa67d |     
    i686     |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/c6f86563c66a8cb064ebceffe059ba07ae995bb5 |     
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/1a383bbae7c980a0fc12b91af05050f69c487173 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/811d6aabbe41d08918aed5cec1c2c31e3d6cd734 | ORPH
  riscv64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/d48f08756d0ea02172724455c584d8d6d024e881 | ORPH
    i686     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/2cb74e77cc3325dd99984845afc42bacd1a025a5 | ORPH
  aarch64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/1d99dee054d67ccf5f5fee80ef5b5e6c99739e91 | ORPH
    i686     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/10d351f780f513f0f8e9a53785dd7950783d45eb | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/aa8fcff7ec5ee0bc471b66c5a12154e95e26f0b3 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/eb7a631addd3f09014a81f8f10e246f0c563e54b |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/ad4c0dbd811191ebddca5b70c2e4a2e2c5f69b23 |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/d306324cd53edae9b76bbac96d4ae0368798a6f1 | ORPH
    i686     |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/6ecb62bfe9bcf73439aeb152da05db012e1651ce |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/ce5959842d55d4b05fbfd2d8cc2532b65297d337 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/246abda707c0fb2a83218b7d5cfc0648853b2695 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/16ea6c8b3c953c830fa649e438908bde30463307 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/a86163d80d0c55d3c793304c16ef2ca0312cef6c |     
  mips64el   |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/5c8cf749e6bcd992b7779eb8f8fb53ba8e7e9098 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/02cd856f1d51d9d2fbcb28fd44f8acbd8cf58aa2 |     
    i686     |    python-autobahn-25.12.2     | NOK | https://autobuild.buildroot.org/results/2375e6f89de21066cd0f751f2f3b00aabfc78db1 |     
    i686     |       python-iwlib-1.7.0       | NOK | https://autobuild.buildroot.org/results/532a754d426ce75fe1667bcd26aaf17d5e640910 |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/da73ab346665d9a872d414010147affb517085b4 |     
    arm      | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/55c5b2cd3f1ad13f12dbe4604fdd3aa64af7841f |     
  aarch64    |          qemu-11.0.0           | NOK | https://autobuild.buildroot.org/results/a6e527fe866ea0c499f787a6989139dab5c35211 |     
    i686     |          redis-8.8.0           | NOK | https://autobuild.buildroot.org/results/1db6385e82cd65795d1b64b69ffffde567a8c893 |     
powerpc64le  |       resiprocate-1.13.2       | NOK | https://autobuild.buildroot.org/results/931234551e2c47c6abee3e370afa3a0721c7e5cc | ORPH
    i686     | rtl8188eu-cca7c28087db740d7... | NOK | https://autobuild.buildroot.org/results/98003dc2a576a5cb7827e3b8f15995e90639cdd4 |     
   mips64    |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/fec6ca115bf3954b7a0f6f8fc9d4083bd410ab10 |     
powerpc64le  |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/f0ebbac62315b8c3b9f2282ccdaccae3611bf0b8 |     
  sparc64    |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/d3bd3c2c7edb63c7e929e166214982b04336959a |     
    i686     |      sane-backends-1.4.0       | NOK | https://autobuild.buildroot.org/results/1f0a0faf662a18b33941949bddb9fc64813e71be |     
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/f1c4e73c536b4d6966e42b41c946712c189a2a9f | ORPH
    i686     |           shim-16.1            | NOK | https://autobuild.buildroot.org/results/a3f293371f6bd0125dc7baa5afb64373e4383f4f |     
    i586     |           shim-16.1            | NOK | https://autobuild.buildroot.org/results/c6ad52a048ba030bb1adc3ee1aeb69ef880cbdad |     
    i686     |          swipl-10.0.2          | NOK | https://autobuild.buildroot.org/results/93cbc7bbc7c15e9b88c920f869b356fc1c40311d |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/8d76802b066dd41d9537eea0f12158376f46f243 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/5ecccabd0293c1d93684f5b8df16d3d6a357ffd2 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/6561c01902c6a0aa67a58a69ee2004768527011a |     
    i686     |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/1ea89b6bd30b7afa779c00f633b46b3c41aac88f |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/e58d0fc4ab9259bc7ab1ab82ef397e8fc6a0049b |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/677916645c0f3256b8b7a3ee2f0238e1970caf4d |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/90ce68d7ed7ee3f57e9cc85e2570b3ebac7cd9bd |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/4ddbbccbc36245c1609c9555129920c9550beb9d |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/351a4219c5598f9663bf318fea969dc0af808462 | ORPH
  mips64el   |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/7cd7e71dd97ee3d50ad42d8fe25a4271c944d9e9 | ORPH
  riscv64    |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/36fbbdc7b28c764f6de4242fec65a9ef7bcb3e2b |     
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/e5cb67326064a1f984fdff1b740cb18384922de6 |     
  riscv64    |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/fa316ba04e2783bdc73ee5c1f2e667a983c4344a |     
    or1k     |         uclibc-1.0.58          | NOK | https://autobuild.buildroot.org/results/6c454f2a3aec48fe82a717b9c75e747f74979f1e |     
powerpc64le  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/a75dcec9e9314be7c8c7c44c5cc41e1f1e49545c | ORPH
  aarch64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/a357c4592fef9ff6dae093d05500521c3e3816a9 | ORPH
    hppa     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/f2a32ff366ca0a3fb815e6853b3b2f8d009dbae4 | ORPH
   armeb     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/8d6bc75ee8fb6b0b783ce0ae4683438306da8148 | ORPH
    i686     | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/27257532c6def1f164b605e6dc6cea2a47bb17e6 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3ebd94e75b89b511edab0ac17b26b59f9c68a994 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/89a89ebdba6633c864a37aa81c1e96acee22a92f |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/dfc841fd2cda55ceb687b53418a3777ca9df605c |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/e83fdd847d7af24c6cacc5f8374a8da52a33e374 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/380c5e5c87df08966be73535ce03e846e22507ce |     
    i686     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/042fca49e0576ce54a3283cf9cf1b96b0b2e86aa | ORPH
    i686     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/66cefd0b2cbbe173c09bee92be9f0d266e7898a5 | ORPH
    i686     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/f3cd160d535a511928095800978bcd1e31c9df81 | ORPH
  riscv64    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/07b42b5ac59058462ee26d99d9c7ca410f19d1fd |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/7d50a367caf9eecfbd9e0fbf6e36db27d2a7b24e | ORPH
    i686     |            x265-4.1            | NOK | https://autobuild.buildroot.org/results/6ab6ce2e82a4ccd9ca58b2233a3d496eff697cdc |     
    i686     |         zabbix-7.2.13          | NOK | https://autobuild.buildroot.org/results/1cd2151eda490fde5a107267816700b1c1cb85c5 |     
  sparc64    |         zabbix-7.2.13          | NOK | https://autobuild.buildroot.org/results/cf81328156525eac94a651923a8da9cfaf9eeaf0 |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

             batman-adv-2025.4 | 1 
                     gzip-1.14 | 1 
                   i2pd-2.59.0 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                libxml2-2.15.3 | 1 
               trousers-0.3.15 | 1 
uhttpd-15346de8d3ba42200249... | 1 
                       unknown | 1 
               valgrind-3.26.0 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/3fa09fd1d813a7f229a7d356c1fcbd14dfeedd67 |     
    i686     |           gzip-1.14            | NOK | https://autobuild.buildroot.org/results/4cc86ce13d373628d6ca53d1ad27fe12bd161e4c | ORPH
    i686     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/1641cc7db30811fb5d25abb707a38c031b8e6033 |     
powerpc64le  | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/af3e77bd27a14f617c9108a4ac33a4bfa9ffceaa | ORPH
    i686     |         libxml2-2.15.3         | NOK | https://autobuild.buildroot.org/results/0b98a9c110d6a2511b33b2befbb44675ee13cf46 |     
    i686     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/a8cc025842582f6fa248bf07e3202e9069515411 |     
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/cd62c73e62427631f770c69dadb1876df1a65d4b | ORPH
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/4eacd72bbd8e653ca4397f2e015eda32cef61f41 |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/d2ff8a33698be4646e2085dd153a1e3b163f7d3b | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

  gobject-introspection-1.84.0 | 2 
              containerd-2.0.7 | 1 
              erlang-26.2.5.15 | 1 
              host-rust-1.88.0 | 1 
                     kbd-2.9.0 | 1 
                 pixman-0.46.4 | 1 
                tpm2-tss-4.1.3 | 1 
           uboot-tools-2025.10 | 1 
ustream-ssl-5a81c108d20e247... | 1 
               valgrind-3.26.0 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |        containerd-2.0.7        | NOK | https://autobuild.buildroot.org/results/3cd982f2f8c2173057a014812738221c5bd23aa7 |     
    i686     |        erlang-26.2.5.15        | NOK | https://autobuild.buildroot.org/results/f1cc776f772dfe94a4766ec0d3b3e87b7fd64c15 |     
   x86_64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/ac7b6898e2381c4015dd47e8574941067a11eacc | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/a2a919ecf5bb73836dde3fbbf0d16b9eaaa2161a | ORPH
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/a9284df538ba47f556c759f87b4e912b406c5b36 |     
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/7925f0a55f614fa657a6ef2a1804468bba1d32c1 | ORPH
  riscv64    |         pixman-0.46.4          | NOK | https://autobuild.buildroot.org/results/c3c1eb79e1ec70d5595435a935849f259a4e3197 | ORPH
    i686     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/a7829503a386294a705cbb54ebebb2da50de7b7c | ORPH
    i686     |      uboot-tools-2025.10       | NOK | https://autobuild.buildroot.org/results/1c49987aa795e11e4039f55c9366befc277da313 | ORPH
    i686     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/aecebc5f21383608bfb085d7492dd3bb2fd1984b | ORPH
  mips64el   |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/24cfd2f5a85b7d6baf036699a6ae6122964a2e46 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                       unknown | 2 
                    fcft-3.1.8 | 1 
        host-python-lxml-5.3.0 | 1 
                   iotools-1.8 | 1 
              libmodbus-3.1.11 | 1 
                 linux-6.12.91 | 1 
                memtest86-7.20 | 1 
           oath-toolkit-2.6.12 | 1 
package/linux-headers/linux... | 1 
                   perl-5.40.4 | 1 
      softether-4.30-9700-beta | 1 
toolchain-external-bootlin-... | 1 
               valgrind-3.24.0 | 1 
                     wine-10.0 | 1 
                      x265-3.5 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           fcft-3.1.8           | NOK | https://autobuild.buildroot.org/results/26ec3737dd8d5f2fd04d8adc815fa15e820461e0 | ORPH
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/0a06983a8e23a58269a3e89fab3c6862866b8976 |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/e231ba01c85031ee190bdba1380ded30b744c98b |     
    arm      |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/f7c8a966ea83c450a69cca3da9775d207857aec8 |     
    sh4a     |         linux-6.12.91          | NOK | https://autobuild.buildroot.org/results/1dfc98724d30619eba4bb9df949bf60dd15122ca | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/679a8d9a3725685bff2e2fc5a09daff1f936f3cc |     
powerpc64le  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/2d346c69c736b568805d789784f134f61a873ea1 |     
  mips64el   | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/295441cf55153ea1ca0f8b5b184951c568df835a |     
    arm      |          perl-5.40.4           | NOK | https://autobuild.buildroot.org/results/4deb650ef5188f87a9436f16129f67eb8aa6a274 |     
    i686     |    softether-4.30-9700-beta    | NOK | https://autobuild.buildroot.org/results/9aee19f9d08cd92f09fe84aae6aebc754b23fc41 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/6f1d4ba6c58745312b8ef781364bb2ad5f06705e | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/e5751413bbfd34d7a166d2115c7e76bfe96bedc7 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/d30e69429e74aed38c7ae35d854c1ce1ea11415a |     
  mips64el   |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/35e60565292ea31ec355a812b497305f6986e0e0 | ORPH
    i686     |           wine-10.0            | NOK | https://autobuild.buildroot.org/results/16b1be4a5277be6b1aa540b306ced1a1ce4eba79 |     
    i686     |            x265-3.5            | NOK | https://autobuild.buildroot.org/results/e483b168ec9499b134681bc825b3362f052f3581 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
