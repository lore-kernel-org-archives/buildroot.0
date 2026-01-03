Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4576FC6171
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 06:07:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97B4580C29;
	Sat,  3 Jan 2026 06:07:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C_LuRblYlDpS; Sat,  3 Jan 2026 06:07:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B73E680C09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767420422;
	bh=ykVjJ7xGZcytJnl7g3r5WYEQPaljaWB7qLHVma/gz7s=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DocO/m81oxTZdYDEAavkC7c9o9RyE2S+EXxdYaruVVJnL4OnzV33HB2y5RsH77dXI
	 2G8EtxgyNpYTa2hsodaeZg/KjuMRu/hcJxZa+dEq3D+shQysYvhQjKdTmXN5JjG3gC
	 LHw0Pi8pJaODPLUhS6YUnHzmB8zIFKCh9LufrWqFNMTJJnCr/6USSJthdH9gvJbzN2
	 losznpOx/a8DZZFvNyxFtEEjz9F99M9KXF9PjLNf2xkJ+AI+9gHMFf5abKzbu+8/BZ
	 vNyERIIFTuQupuXoDYqDD6MMV2rfDHK27UJHfO0vGm5RAJodBTSl3iJCsMth0hFth3
	 COHLDW5wtQZkg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B73E680C09;
	Sat,  3 Jan 2026 06:07:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1A456351
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 06:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C99D40582
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 06:07:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XXZQcOMNq6Ss for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 06:06:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org DD1AB4057F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD1AB4057F
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DD1AB4057F
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 06:06:58 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-430fbb6012bso10541963f8f.1
 for <buildroot@buildroot.org>; Fri, 02 Jan 2026 22:06:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767420417; x=1768025217;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xf6Z/woz+bxzr05bAu+0pS+Nb7OYrRjwcK0y9h3a/GM=;
 b=CDdwgSq9RFsbnL9H0QJyJyH9DozK2sKhz28LpVbhgQEUzAHeTniDn5pt1FlYm1q/pi
 dpx7KYLXkfiZMwfL+CgpIg5fYHxCRci+G7jcmYMucaIOYnB/Z1CTB+cfG46dRWe3A4ZJ
 jf0KYLoPBFqb9iNHR3I4Q0MS3gPwliguxqtL+N7guAOPPrNbr+z9Gar6ibCKwvHq9Iig
 vzrROStIIkKyes73IseTvBmBdUCfkRBUKggxZuvjLtYD+IZzUWu31qHWLoXIxsgy0JRc
 JXcxYQn7E7ArwUpmzE+cUJN/JvU8tD4lwID2lvUb0mDt1iJEPvLaYlvPycRHhgtXCXbu
 xE7A==
X-Gm-Message-State: AOJu0YxQ5p+45Azg/hxd4mP8Z/SVvSPU2jUMso/ccQsWbBwOyti+nMhk
 FxeRzjEXIUJacrp7UsAm2CcrZDAbmSVDQQRdnWbS45wPUfm8+Z6G/qG549Om2Q==
X-Gm-Gg: AY/fxX6UaFeCOnvq9yB2TYlGWwYUmPkSawGdyy4vj59phQ1DJy265mpiMebj7SImWw+
 /FT8s3Hpp5rbppk6N8gZaxekfCMeGdw88OTmUvxhnimOPkLkJ4sWHpL8O6ktn5k7SeAEKMdT8PC
 JqCFnG93ue14Av+CadAscXjdfMhZ2Ky1OnG93rjikvD2IDO5K6WgiTuYYP3vrUlM6xLjbgTg3yX
 jcDNTvGG1u/7NoKY1iAJRLYt6wjkzcrglPsbaCn4HAI6FrLM21S1pio64rdfkMs+UuqNxeCtrRj
 iyhoxPrS2w8vIBAeiLovrv4yCdDugAtW10GXhbqZKMawN4LJ04fCsIfB6/bVcRmZvZ/NZZnkkYC
 Droixu1uRqiCkKwD+pSjXiGknmiH8cKjNESjlTKPzhtlt92VvsLnil2Qiv/GVu9oYTrMi5QC9ow
 kd3zUte9tUkN0SLh0zGw==
X-Google-Smtp-Source: AGHT+IFfaEbdIWIyg4g1XGf9zdcK6XIzeBb/OJELpfr1tQEWhMqg+BtEWyrg3/GNDrUrgXuklzFK7g==
X-Received: by 2002:a05:6000:200f:b0:431:7a0:dbc3 with SMTP id
 ffacd0b85a97d-4324e5061ccmr58069618f8f.29.1767413949611; 
 Fri, 02 Jan 2026 20:19:09 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea226d1sm89835357f8f.13.2026.01.02.20.19.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jan 2026 20:19:09 -0800 (PST)
Message-ID: <695898bd.050a0220.323a85.7452@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sat, 03 Jan 2026 04:19:09 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767420417; x=1768025217; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=Xf6Z/woz+bxzr05bAu+0pS+Nb7OYrRjwcK0y9h3a/GM=;
 b=ZK7h1c9PD8XQDU8MJAxkOgR9d6ucIJxghCK7co1eKiO+PzctFmlturSPkZXV4gTTLf
 jO5+W3c55UiDjPK9HUhaye0ThD30eAEn5oqC5Dp3yfsdF/L75RG3wjoH8hv+e97JGggX
 qHVhKiAOhu0OXw68s2OAwTlP2IGbdP/aYgeGcA6sQGO88ybSNOm3h2ggSl7iHkCcZ92s
 OHlig3Vf3HsWsn6XmXxDs7dHGkynJuyVGyQZyFt17ZiBIurUxYO6qcFSRJfwVYtURZqQ
 t23E/d8xqmn5LY+lyx7X74XJT48eT49rO9gPjpuTL52sX0yhlExa7j8jnVIuPfpuD+9W
 Owkw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ZK7h1c9P
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-01-02
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

Autobuild statistics for 2026-01-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  7  | 47  |  0  | 54  |
  2025.11.x  |  7  | 14  |  0  | 21  |
    master   | 58  | 137 |  0  | 195 |

Classification of failures by reason for master
-----------------------------------------------

                   dash-0.5.13 | 10
                 jasper-2.0.33 | 9 
                       cfm-0.3 | 8 
                   cvs-1.12.13 | 6 
               asterisk-22.5.2 | 3 
                    brltty-6.8 | 3 
             dahdi-linux-3.3.0 | 3 
glibc-2.42-3-gbc13db7393773... | 3 
libcorrect-f5a28c74fba7a997... | 3 
                   perl-5.42.0 | 3 
                       unknown | 3 
                  brotli-1.2.0 | 2 
                 c-icap-0.5.10 | 2 
cegui-e7a03afc70c6182a091ff... | 2 
freerdp-2.11.7-18-g0ee17e2f... | 2 
               iproute2-6.17.0 | 2 
                libnss-3.119.1 | 2 
     libphidget-2.1.9.20190409 | 2 
          linux-5.10.162-cip24 | 2 
     linux-5.10.162-cip24-rt10 | 2 
               linux-pam-1.6.1 | 2 
                   linux-tools | 2 
                    mpir-3.0.0 | 2 
      spandsp-3.0.0-6ec23e5a7e | 2 
aer-inject-9bd5e2c7886fca72... | 1 
azmq-v1.0.3-54-g819b24035cf... | 1 
             babeltrace2-2.1.2 | 1 
             berkeleydb-5.3.28 | 1 
                  boinc-7.20.2 | 1 
                bpftool-v7.5.0 | 1 
                  cairo-1.18.4 | 1 
                   ccrypt-1.11 | 1 
                   dante-1.4.4 | 1 
                 dmidecode-3.7 | 1 
              e2fsprogs-1.47.3 | 1 
                easydbus-0.1.0 | 1 
        edk2-edk2-stable202508 | 1 
                    fcft-3.3.2 | 1 
                      fio-3.41 | 1 
  gobject-introspection-1.84.0 | 1 
               harfbuzz-12.3.0 | 1 
              host-guile-3.0.9 | 1 
    host-mender-artifact-4.2.0 | 1 
              host-rust-1.88.0 | 1 
                   i2pd-2.58.0 | 1 
            igd2-for-linux-2.2 | 1 
             igt-gpu-tools-2.3 | 1 
               libcgroup-2.0.3 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
                    libev-4.33 | 1 
              libopenssl-3.6.0 | 1 
              libsndfile-1.2.2 | 1 
              libsodium-1.0.20 | 1 
                  libsvg-0.1.4 | 1 
                  linuxptp-4.4 | 1 
               llama-cpp-b7271 | 1 
                   lsof-4.99.4 | 1 
        ltp-testsuite-20250930 | 1 
              mariadb-10.11.15 | 1 
                memtest86-7.20 | 1 
                netdata-1.37.1 | 1 
                   oatpp-1.3.1 | 1 
odhcp6c-f19dd37fb467c9cf10c... | 1 
                    olsr-0.9.8 | 1 
                openobex-1.7.2 | 1 
                openssh-10.2p1 | 1 
                openswan-3.0.0 | 1 
                  pdmenu-1.3.6 | 1 
                     pigpio-79 | 1 
               postgresql-18.1 | 1 
               pulseaudio-17.0 | 1 
               rasdaemon-0.8.4 | 1 
                  rp-pppoe-4.0 | 1 
                 rtl_433-25.02 | 1 
          sane-airscan-0.99.33 | 1 
          sphinxbase-5prealpha | 1 
               tcf-agent-1.8.0 | 1 
                tpm2-tss-4.1.3 | 1 
uhttpd-15346de8d3ba42200249... | 1 
ustream-ssl-5a81c108d20e247... | 1 
                  vsftpd-3.0.5 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  | aer-inject-9bd5e2c7886fca72... | NOK | https://autobuild.buildroot.org/results/7d3c644332e15fe7c994ff636f57440b0c535439 | ORPH
    or1k     |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/4df8cedcdaac24c5c57308d22de39ef1644bfc98 |     
powerpc64le  |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/10523473604b7b72dda07bfd5adfae4e37698f44 |     
loongarch64  |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/db7215d8fb8bf0ed28432ff26903945a7951e379 |     
   x86_64    | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/4a525be566ae7daf9105a6c3a461bdea7cfbed2d |     
    arm      |       babeltrace2-2.1.2        | NOK | https://autobuild.buildroot.org/results/0176aa13e0cf59e05b0744757ba54c0b26d4e615 |     
  aarch64    |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/4c70bba3930e5163384efac8cf4b1a5e79ec8032 | ORPH
 microblaze  |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/b19e58fb8bbca8167510720035d5e621d5c1be15 |     
  aarch64    |         bpftool-v7.5.0         | NOK | https://autobuild.buildroot.org/results/15bd28dbcd80dd2180910ba4ed27c067888c1835 |     
 microblaze  |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/17e44ace1a321d3b1f0b6da8e59663e22277fe09 |     
microblazeel |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/da5f8129f574a0ff3b3abbdf8a16935eb18ab726 |     
  powerpc    |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/76d18437241d1281566b76ed1cec2ba99c3532da |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/0bae4be9c2a840f5b67225bb4240bdd5b670fd35 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/056f6691bff7a0d9850df671da200b618ff975c9 |     
   s390x     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/a8ba40e735b897c2b61e0abb15dfa44afbf50dc3 | ORPH
    arm      |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/134e0e3ff4ca46f1276d4e265881dbe22ea54ed2 | ORPH
    arm      |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/96769d764b9455a21d108143654825eeac6c4af9 |     
powerpc64le  |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/f7999716eec41876ac2418872d4773da36813a21 | ORPH
 microblaze  | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/6b0380fbc5900a87fe3f6bc68762126324f11105 | ORPH
  riscv64    | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/ca1dab562172215891c4aac4e6ba46b8a14b278f | ORPH
 microblaze  |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/ac31865679f19cb3e0b1e741aa187fdab4c75614 |     
   s390x     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/3fabc61c8bfdfa94c1e49c5902176011f02f88f6 |     
  aarch64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/8f9fb41bf06da25d30e285b7f652edd5e07619d9 |     
  aarch64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/6d0f35923339e366d8d10cdb137bc7603d1c322e |     
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/8ac909dc063b805781738cb4aaddfe081e55294a |     
   sparc     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/9133965088778be9d0c8fb3f798d5954070c997b |     
   mips64    |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/59b65033ceb689337d54092e5f2f558b24f45a81 |     
    i686     |            cfm-0.3             | NOK | https://autobuild.buildroot.org/results/bdfdb3a6c7d075fd5c94a4c3c5b3d017ab9026d9 |     
    mips     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/12cc6f6d19cf19bfeadf46442542e02b2464ff20 | ORPH
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/34957b070e58661cc039af996c06e3b0cbe23e95 | ORPH
  aarch64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/af5fd8944f9bb853aaf76060ea192a7c555f1db5 | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/6e944642a670156c7174d7600dae8d5105998d96 | ORPH
loongarch64  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/df0fa35cffed0cf90eee327d5e77e2904f46bcbe | ORPH
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/22a1052e4ae165476c4b307b2563f90b8bd50f0d | ORPH
   sparc     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/668d5239dd6e402acdb98d4044b24fb5494c5c8f | ORPH
    m68k     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7fccb2db33e3a536c548307e7bdc958a8f3e0442 | ORPH
microblazeel |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/bffabcabee1f77c25eb4abaf0289c94b4f886e0a | ORPH
    or1k     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/2237b8ec053bfae62c916d5c7f0dd851bd5d89a3 | ORPH
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/3a88c038447a077c59b12938c9adfbd94879b815 |     
   xtensa    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/77a0559c3f7a64411dbe4355cfdefdf3721fbe76 |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/a882e218f4313bf50eb665acc9666bd3c2e7883e |     
   xtensa    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/1ed7df95727c1cec57af7aa2cf91b07ac125fb38 |     
   xtensa    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/3cc24a13b83f78563919e7986d8065cb04daeab0 |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/85328da37dd7e6f1a70ba9b6616e62aa3796845d |     
    mips     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/8346736a91c1aa00622fb5ef70ecf7934ab8d312 |     
 microblaze  |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/bb0db343fab6018a128ea5666725a21b005fe644 |     
  mips64el   |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/f4ba991be16bf7a0d2cd057962c73f7cd65c500b |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/7b316f95109ca6fad64b7c27d47b9c5d52c0704f |     
    i686     |         dmidecode-3.7          | NOK | https://autobuild.buildroot.org/results/3d350d52b34f44aabb5159fe8961a646a8729b1c |     
   x86_64    |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/007c6c2154122335c1dd47321f99b8e58aee2d36 | ORPH
powerpc64le  |         easydbus-0.1.0         | NOK | https://autobuild.buildroot.org/results/1deeb7371b6813436b287663d6ac75ef0cea438e |     
    i686     |     edk2-edk2-stable202508     | NOK | https://autobuild.buildroot.org/results/4481029f47f0062fe7ae6b451d63f479a2b455b9 |     
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/fd407cccbf0ac521f4078b6c4ae251a88e3b4db4 | ORPH
   mipsel    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/a5314faa134f1a0416b2c40377b92dcf0ad49875 |     
    or1k     | freerdp-2.11.7-18-g0ee17e2f... | NOK | https://autobuild.buildroot.org/results/e273a138b3fd1027cb51e2ee5230744962693269 | ORPH
 microblaze  | freerdp-2.11.7-18-g0ee17e2f... | NOK | https://autobuild.buildroot.org/results/4fb64914806c7328331c37c3730c4e00ccd6b543 | ORPH
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/bd2a09725b8ccdb6715eb5f47e89a660bfed576d |     
  mips64el   | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/7ffb9fdc6d0186d87ab9af3feeebdb80d3e136fb |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/6b938fa3b6733fc6513ce5417f7a34729a8b7fed |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/3253928eaee24eed95e00519d3e7e5d1d6582ec7 | ORPH
    or1k     |        harfbuzz-12.3.0         | NOK | https://autobuild.buildroot.org/results/72fd51d742198c323c698d9fdb040f105ddf32f3 |     
  powerpc    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/af9e55d7685f07e1058f415344f20f3fe7066886 |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/e2693656e4d538906fc41a761e990e3ffe55f16f |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/97b6c4a3adcb6b621b116834140189324fc9ad09 |     
microblazeel |          i2pd-2.58.0           | NOK | https://autobuild.buildroot.org/results/1c124b8bc804c37d693971adf6f4f212c99a63a9 |     
    mips     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/33f36d7a8bdb98e01cf9727426bb74bb5f1f9276 |     
  mips64el   |       igt-gpu-tools-2.3        | NOK | https://autobuild.buildroot.org/results/42a6e9d9652c1eb97c8c49aed75d210bf2afc066 |     
   mipsel    |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/1440b4aea4b6a29f4bd849ae6577426ef968bacd |     
    arc      |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/00bf111c0db91277612db3d790fc82c86110641c |     
    sh4a     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/8d0cbb5f392eafb70209a33791ca5645572f2488 |     
   s390x     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/2b06c66f3e52dcd5b1ee65216b964cb2d5e956b6 |     
   s390x     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/1b2f9b7ad279ad94426f780f20669a6b1b97952c |     
   s390x     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/59f31de0944962a7c014b5b4930c506e5b5ad8ab |     
    arm      |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/2b1fae398ca803d8562ff90e1aa8bdc1914031fa |     
 powerpc64   |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/ec89c78b069d190961f48e9dd4b956e1134e227c |     
   armeb     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/7388aa4763ea8cf94adf8ddfa17605d74dd9ecd6 |     
    i686     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/276b075a322e401ce04f2641e0166275684f2d47 |     
   armeb     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/bce98a34e80eceea452e4ef9523a10324d6287a8 |     
   sh4eb     |        libcgroup-2.0.3         | NOK | https://autobuild.buildroot.org/results/a86a887f0385635d77143846060f0070e0de4ba6 |     
 microblaze  | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/11db6fdd5f78f7993e20b42e1547e6d4117f0013 |     
  aarch64    | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/47c93f1ad91199aa5446b364b2a0895f5837ee5a |     
 microblaze  | libcorrect-f5a28c74fba7a997... | NOK | https://autobuild.buildroot.org/results/44b881a3455ff6a77f29532f25c12c40c34ceac4 |     
  aarch64    | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/9a74d2a162b34a9c7671e0cf169e4e1f59753dd1 | ORPH
   mips64    |           libev-4.33           | NOK | https://autobuild.buildroot.org/results/f8d8bec31cbae7bb7658e6de8d8478cb4be40667 | ORPH
   s390x     |         libnss-3.119.1         | NOK | https://autobuild.buildroot.org/results/2cad971a35a1fb01a8fd6fc61b5dceef717240b1 |     
   s390x     |         libnss-3.119.1         | NOK | https://autobuild.buildroot.org/results/68d4907b98558c99ae0a407fe41bd67b647c5639 |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/f6bac69ad85b8569912eeae0081405d33c7f74f0 | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/6c7df78cf08ab653365b88eea7ca2efc022a3813 |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/45ed77e53bedf4188135e1abdecc899a9c55a96a |     
   mipsel    |        libsndfile-1.2.2        | NOK | https://autobuild.buildroot.org/results/4edf1029f26f669e3d2bac391bac514598a1dd50 |     
    mips     |        libsodium-1.0.20        | NOK | https://autobuild.buildroot.org/results/9a45a23161e8ab091908e3f36d5526d36512b7cf |     
   xtensa    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/e4b4599136e79a99ab21575d75165280d2507f4b |     
 aarch64_be  |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/bbc35632715724f810d49f5c88eb30ec727f3686 | ORPH
   mips64    |      linux-5.10.162-cip24      | NOK | https://autobuild.buildroot.org/results/1d5d3cf009ed05e386d588b549ab535d2505e1c7 | ORPH
 aarch64_be  |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/1fee414c64e4a6805e755ac48bf13afe0bba6399 | ORPH
    m68k     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/92190e134a8cab3b91c7801316d0e6b879cd47d9 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/72406fe1867b212b70069541dffb79b0c6cd5863 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/0853fbec335e854ae52f8e26e09b666a41f773b4 | ORPH
   mips64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/65c16d6f51ac34d39e3143429237dd6537f436bd | ORPH
  mips64el   |          linux-tools           | NOK | https://autobuild.buildroot.org/results/4006306c4f47c1520dded319e6924fded2bd529b | ORPH
  riscv32    |          linuxptp-4.4          | NOK | https://autobuild.buildroot.org/results/5190e98306d64f67fe1338a2e7f926aef55576dd |     
    or1k     |        llama-cpp-b7271         | NOK | https://autobuild.buildroot.org/results/2bc422362fac01a36585f58c6ddd59b0226bdc91 |     
   mips64    |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/13c555abe73b03c0374d3b3d4d31c9ee1a0eb700 | ORPH
powerpc64le  |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/44490e12eb331c0a3a1ebe570046aa5153f93111 |     
   sparc     |        mariadb-10.11.15        | NOK | https://autobuild.buildroot.org/results/437e11b62ddeac3ed9461c257ea59c78f1458264 | ORPH
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/cee2b881089b031c9ac667ae30eb4cd776a34f10 |     
   x86_64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/d07acc408aedae97c88b530899884f70acdcb555 |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/8583b61aa08ca2aa838404b26f5e45542f48d764 |     
microblazeel |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/6a535919334997511a724e16022cedb1dfbf47b1 |     
 microblaze  |          oatpp-1.3.1           | NOK | https://autobuild.buildroot.org/results/e321fb3dab0570d1dcef81fd6e4fbbfac83fc04e |     
    mips     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/828e0fa6e98431209e56db6e8ea97342b059c639 |     
   sparc     |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/cc1eed58e1d826165de4cef7e84cf6823ad7d6a1 | ORPH
    mips     |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/ac33a8f8fa64941dfac412b9f0a17e5f1a363ed6 | ORPH
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/8fb36cb8fe84977f954e6c43f13f3f343f5438cb | ORPH
    or1k     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/0d6bae47d17c9697a622d45a0b00c4a7813d40da | ORPH
  aarch64    |          pdmenu-1.3.6          | NOK | https://autobuild.buildroot.org/results/34fe12e8325bc2a6d39a7de2f6ddf829fce6ca61 |     
   xtensa    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/5bd44110047cfd38f1db21e1fc55ca617a4ec904 |     
    sh4a     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/89b2db6e913b231c575ef8feda0e693bbba69d39 |     
   sparc     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/094ec0831933a6cc3fb1740f1c72b14ad09a8d66 |     
    arm      |           pigpio-79            | NOK | https://autobuild.buildroot.org/results/888724496f0bea7994571a51ef53ce5435c04f0a |     
    m68k     |        postgresql-18.1         | NOK | https://autobuild.buildroot.org/results/4b2ca009798313e5f1962a3460b9dbc960af3a35 |     
    or1k     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/b3e56ed3d238269b92bd9976080bc2677b5b1dc9 | ORPH
powerpc64le  |        rasdaemon-0.8.4         | NOK | https://autobuild.buildroot.org/results/3d974af3195321780bc87e76043afa26d47d64ae |     
loongarch64  |          rp-pppoe-4.0          | NOK | https://autobuild.buildroot.org/results/8bbd49a6444a95f33710a816174bc957cdddaa43 | ORPH
  sparc64    |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/096eb946e7e627f946eee474ceefce8aca7c7cbb |     
loongarch64  |      sane-airscan-0.99.33      | NOK | https://autobuild.buildroot.org/results/deb15d70bacf5416185c421e35920783621e600b |     
    mips     |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/d597730335c32fc782f36354a130dd9aabb7cc3f |     
    arm      |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/ff0925f6dd53dd4f8d401672e884c0ee31a7fe5d |     
    i586     |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/b529710b6e92108413906da07914d7e0400e0c28 |     
microblazeel |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/1d39ac6762530eeb1b65b271932b68b8f80e0e05 |     
   armeb     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/a6d81e291ffc04101636c0a757d40e0a7a454816 | ORPH
    sh4a     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/4cc71a6ce55ebbb7746fe0e75739b7683ae617fa | ORPH
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/125a1a5ed7fed0480048e75f63c6de619c815d3b |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/cc65c44f8ab61a28f990a7d9462eed8739797e4e |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/97b588d4e0017c049ee506c84612f16f51ea9e9e |     
    sh4a     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/2a2bff45993cde3a39a89d844986814474032899 | ORPH
    i686     |          vsftpd-3.0.5          | NOK | https://autobuild.buildroot.org/results/fd170f76e30f87991b3e66b4ed1dfad647927193 | ORPH


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                  brotli-1.2.0 | 1 
                   cvs-1.12.13 | 1 
           dmraid-1.0.0.rc16-3 | 1 
freerdp-2.11.7-18-g0ee17e2f... | 1 
            gdk-pixbuf-2.42.12 | 1 
                   guile-3.0.9 | 1 
                  iozone-3.508 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
                  libnids-1.26 | 1 
                  libsvg-0.1.4 | 1 
                    linux-6.18 | 1 
                    mpir-3.0.0 | 1 
                netdata-1.37.1 | 1 
pistache-3ec9d7c4f8b828fdd3... | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/dc9722742a55461b7d080ed2a93a8cccba341603 |     
    or1k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/42eebc20b0974e80aa0dea79f0fe671546e305b4 | ORPH
powerpc64le  |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/25f641150acf454a880c54ff8e3c5495ed230ce4 |     
    i686     | freerdp-2.11.7-18-g0ee17e2f... | NOK | https://autobuild.buildroot.org/results/de082d56fe62c5df493b59237c61158205f21892 | ORPH
 microblaze  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/c3797c8cb7551c0702167ec78b0f498ca9aab87e | ORPH
    i686     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/c4109c8cfe0915db99902a8e5acfb02262ad24ae |     
   xtensa    |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/ea9cb3eedb72ec030504f754a4ec808e51ecbbfc |     
    m68k     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/00f8ac2ea074d7f19968dfee693b63d0a7feeaec |     
  riscv64    |          libnids-1.26          | NOK | https://autobuild.buildroot.org/results/16f7ed999cdd487379c0f89d35965c7bcf25efcd |     
   sh4aeb    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/5eed58f7922cc96768b23f4d4b6ab3f4f5050532 |     
 powerpc64   |           linux-6.18           | NOK | https://autobuild.buildroot.org/results/4d7c0ad7f5e2e10e71c1a5dc2457ba7c9e408243 | ORPH
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/a2b9aced466551b105c319f07389b25b77380e2e |     
 microblaze  |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/81713599a2c82cf8c012e503c893ced8bda633d6 |     
    m68k     | pistache-3ec9d7c4f8b828fdd3... | NOK | https://autobuild.buildroot.org/results/eb038b48a00095b66bec2f87e2da52dc18b7d3ab | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-libxslt-1.1.45 | 11
                libxslt-1.1.45 | 9 
                       unknown | 6 
                   perl-5.40.3 | 2 
               arp-scan-1.10.0 | 1 
               dvdrw-tools-7.1 | 1 
            gettext-gnu-0.22.4 | 1 
               graphene-1.10.8 | 1 
host-go-bootstrap-stage2-1.... | 1 
                  iozone-3.508 | 1 
                 libgee-0.20.6 | 1 
                  libnss-3.108 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                  liburing-2.6 | 1 
     linux-5.10.162-cip24-rt10 | 1 
        ltp-testsuite-20250130 | 1 
                    mpir-3.0.0 | 1 
                     nvme-1.12 | 1 
                 openssh-9.9p2 | 1 
               procps-ng-4.0.5 | 1 
                  rp-pppoe-4.0 | 1 
                systemd-256.17 | 1 
toolchain-external-bootlin-... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        arp-scan-1.10.0         | NOK | https://autobuild.buildroot.org/results/c77594ad9468e9385646baf25d2a884978a514a2 |     
    or1k     |        dvdrw-tools-7.1         | NOK | https://autobuild.buildroot.org/results/8376426db3d89fe56547eb1cc1abc7931e72a3b6 |     
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/80c53553e5b70d378eb37d14fafc229aa320429a | ORPH
   sh4aeb    |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/2042b0d18f0d757001f9307ae836c540b8532797 |     
   mips64    | host-go-bootstrap-stage2-1.... | NOK | https://autobuild.buildroot.org/results/2fccfd6569510c640c5f9d659740683a4b51cb87 |     
 microblaze  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/860fce7f81c1ac2f7ece0a08631a29a62443d4aa |     
powerpc64le  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/244f84b0f55d73e2f316de82cdae9927e485f676 |     
 powerpc64   |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/b8efe4c2239769e688f76957a0b512cb7a12c149 |     
    m68k     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/d57e6599f0ba5e19b06c436931737669e8586ca7 |     
 microblaze  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/2c47a1371f9e6e3ec6d705f0b930bda248d33e09 |     
   s390x     |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/0f00e8f3448d4d4cc1e62e06d504e72d4dde85f0 |     
   mipsel    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/fb3273c7bab1da5d5675bf5685ebe3e3ff1f2f36 |     
  aarch64    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/cb89af969cdcec88b5ae403463829782b176922d |     
    arm      |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/a64745a39267f847e5e4e7ebfee4208df9a06948 |     
 microblaze  |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/3f70425d78a4c4e8d45cee54a6653ed4d4943d1f |     
  powerpc    |      host-libxslt-1.1.45       | NOK | https://autobuild.buildroot.org/results/ebc6859510bf509a78eaaa164b5259abf1a71a02 |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/93b7697dbf515f2b1ecfce412238ba4d0fd24cd3 |     
 powerpc64   |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/b7a0f11f19b67972b94cd9314f9b9492039f6f30 |     
    mips     |          libnss-3.108          | NOK | https://autobuild.buildroot.org/results/0672a0931c4e784550a3e1a774e6dfccf118cc54 |     
  mips64el   | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/084523996466caec009a830b6500ce19ae09c1d2 |     
   armeb     |          liburing-2.6          | NOK | https://autobuild.buildroot.org/results/1f04bdae873f795a0357a5b2ba1335abde7480fa |     
   armeb     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/dddb2706dd485e606171d94c6f7702d56a38fd00 |     
 aarch64_be  |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/353a431e4f2cbd8c5a5cf3830139af5d67c547ca |     
  sparc64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/93cd7d9d2ae8b2e81100d0a496dad060c2a926e4 |     
  riscv64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/d7fd28d8a6b7a22f35acd9d100b670346fdff5a2 |     
    arc      |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/965839d1b88fc13521ddedc62bd98133e71e447c |     
   armeb     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/d40dcb7258ac56676f585624e5d9cf1e7bdfb372 |     
   mips64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/626706ecfd32160ecafbe54a20eeaf6934d7fe1d |     
    mips     |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/55c0e2538aca97a41ca5e5a75ddc204830afc3c2 |     
  riscv64    |         libxslt-1.1.45         | NOK | https://autobuild.buildroot.org/results/22020f7610ad9381b3af8d6b0400559ab6dfe13a |     
   arceb     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/3dbff49631fa6c8a2187844fa34517c49a71ab2d | ORPH
 powerpc64   |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/6787e98071d00cd69c2f7ab23ed6d678d2cf69d8 |     
    i686     |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/09a607d2b0c40b7040371fc07a93507654f903ad |     
  powerpc    |           nvme-1.12            | NOK | https://autobuild.buildroot.org/results/876ab4cfeb022b5e74bcef2dd8215ba9a77a0138 | ORPH
powerpc64le  |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/9e642b94190782a58444718fa57537ba1d45c5bf | ORPH
   sparc     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/37d73e667e057993497768f5addf01f0bf1c6bb3 |     
   s390x     |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/2607b194c61190464662f1ec01eb6cbbc622f51d |     
  mips64el   |        procps-ng-4.0.5         | NOK | https://autobuild.buildroot.org/results/fc0162921412266e37799d960d299f61604f1bb2 | ORPH
   xtensa    |          rp-pppoe-4.0          | NOK | https://autobuild.buildroot.org/results/70846ba23c02663b3700bd5af5bd06af57046a3d | ORPH
    i586     |         systemd-256.17         | NOK | https://autobuild.buildroot.org/results/3184507ef740406ec2b20209c21b024f83153d5a |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/37e677e7a47f30299b4ab3f29509ca1455dffe4e | ORPH
   s390x     |            unknown             | NOK | https://autobuild.buildroot.org/results/8a4792c81d437dea5af398155b3ec70aea4d49a6 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/7a9ea5fdbe1f7c1d789427a07f7fd44330773ba7 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/71d79f8537286a729d3462e21636f8eb786d2b8d |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/fdd14856577e94ff11aca437e871c27545505f58 |     
   mips64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2dd423b4398a4bd17b125490b4d574a7ae89c51a |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/93f13e923c25279710dea80b069d405ce4f87e0e |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
