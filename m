Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0D2CCD8C85
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 03:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 020286EDD1;
	Tue,  9 Jun 2026 03:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3cNPo8RjRjyn; Tue,  9 Jun 2026 03:18:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7604160DBB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780975084;
	bh=Q4OFtZtulNtncu/oXVMLYbsnDMSuEObOpo8ZcusFWI8=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UDObyaqKMior0cRkL9KlA8GJxK5/6cN3kgk4HsUrN3G7ro3EYcWeNZ9lbfrKcinb5
	 e27qag93Db8EHP/HN/pEF1EaW2uBaQyR+nPbx3FD7LMV08SZAEz99TyS2IoSx1wXTD
	 SzvPjYtOf7LIqQJkJ9EYUd3NN/T+DAGtSMYQ7KOc5N8peOuJwOh2WKUF2nIiBGSO80
	 9uxnzjhUxdobiEGzOLyMOg+QzVpjy8wNYlxSmV0OE/CFOt3VlHl+/OQ0O+CudoLZoa
	 wRWY/oIDO1iTf1VmE1xsJnjpAIEdcSsuxKs3UshMLIR+XVEcop2rcgyFfjkd2pS5Kp
	 Wu/rMMuH4QIEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7604160DBB;
	Tue,  9 Jun 2026 03:18:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E5045190
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 03:18:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE47742DF9
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 03:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9VIV9LLtrBnL for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 03:18:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0546742DEB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0546742DEB
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0546742DEB
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 03:18:00 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-490bb83a3f6so41757455e9.0
 for <buildroot@buildroot.org>; Mon, 08 Jun 2026 20:18:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780975079; x=1781579879;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qoSZ++rmheZnDbUNdPiOu4aQX3J7yLgRCJmdSaCT3j0=;
 b=XGUYyYzEe0oYOyzsSNbnBegG3owt5j+W9jdzMDTlC19Gvc578hR0OhJYMpM8NumMbN
 hiQ0yRPABbYpMw4Rj4IevCX+6P+D9tFtnuny63P1kzcjCodtDPFkF7H59Kf38vxzeoJY
 X1b/rLrr0qemLXQNYfVsL+t/iI3TMXmucmcCKnBLpV8zzIv/rrAeMiUeYHJOxLMnd8Hl
 +QRa+G1yQL6XNehabCmIkELZgTngEtrJ0FwO7BPDFjP1SSR/twywCPaxn56auNnkLwbU
 CDzTb1vABrMIXUKncG0yUkhnNYHqJwkqr3TjUN0n+OveWe11j3olO+/RKfaabVPLEplK
 w9bQ==
X-Gm-Message-State: AOJu0YzFAYCnBfOqL9dsdjWTUcbVl988OswRM14i98Jp0cKftp35kLXz
 AyGCluFsn/v8xnGW+6/wqRO7cdE92SWI8aih+R03S9N6hsmdi8gm1lI1ZAV2N5ju
X-Gm-Gg: Acq92OGkMNfeIAmtV0aPCTFUw5ANHMrSnhhCTVKUjKdGd8w/p6HqTc0+GKPKnWI1RWP
 MHvEkfqD0v+ZB3EJr+ImMEJInQJhWwJ5xzS5ABo1/gpeQdT+FaINTJ9fkRn40ewt97ExhHByiv5
 d9JYfdB4QCpjpfkVL1CT3UNcoxio0KNxi7k3IUsvxmjXvCMVIKBV2j56VreNbW6A81hp/5p8aAy
 KaSR+VmWzXry8e0DDBr/AOd+HqNuO4RSI/0quxXlhVdPwAzctmIfcejFJls5I2/pELYfbvGrqdY
 TFxwQHArczmc6jYxdzkPatBOOwM8eCqJTW5p9us0nL6nOjVGyGZ6p8r2RQHLqSwyx9f4Ope5Lta
 RgGI+GaQwECngiOOXcbLMh9lQrN8orUcgL1/C0RUw1QCEDRtQk9BueEgtepgh2+mM6xlRcdHNPn
 /MvDvdthDIFQOBW5k9F6Jgk6Cyjtwsuf5lNdzB
X-Received: by 2002:a05:600c:8b88:b0:490:b58b:a4a5 with SMTP id
 5b1f17b1804b1-490d723772cmr4862445e9.31.1780975078641; 
 Mon, 08 Jun 2026 20:17:58 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490bda4fd52sm428667465e9.0.2026.06.08.20.17.58
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jun 2026 20:17:58 -0700 (PDT)
Message-ID: <6a2785e6.5dfca4bd.ce6a0.e3ad@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 09 Jun 2026 03:17:58 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780975079; x=1781579879; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=qoSZ++rmheZnDbUNdPiOu4aQX3J7yLgRCJmdSaCT3j0=;
 b=bvFp50vtpAnDNMoONx4AkzcDeQzY92/QQ6hrKmnU+f6jXgmjb7df3Vh9mOY2iHJ40M
 D0PUoxGthdqp++uOjWzysbO55xaPP/ORO6LqIGpC8aHVOYBm723R6216cvR1Yp5Shn6M
 YRRMD7JOEbCXC4OG4GY58SNBdNt2Niov7lwQ8fozqc2HjgkZv0h9WXG8LfzIRsK6PBnD
 RJMjVsT1tM+GjvhXss1Z2rFl1vcYofjOqj2i+kVoYfJJBTpC8fKIFXc0uMJndQmb9Afd
 4M5GEeAClkknLtAK9DXcJLnLaaguwrdxtZVMgegRjDuC3uLiZNoQCMLkiyuhGeZYCv+s
 vieg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=bvFp50vt
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-06-08
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

Autobuild statistics for 2026-06-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  8  | 20  |  0  | 28  |
  2026.02.x  |  7  |  8  |  0  | 15  |
    master   | 53  | 103 |  4  | 160 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 7 
                 gnupg2-2.5.20 | 4 
                  linux-7.0.11 | 3 
                   perl-5.42.2 | 3 
                  bcusdk-0.0.5 | 2 
               catatonit-0.2.1 | 2 
                   dante-1.4.4 | 2 
  gobject-introspection-1.84.0 | 2 
    host-mender-artifact-4.2.0 | 2 
            igd2-for-linux-2.2 | 2 
           janus-gateway-1.4.1 | 2 
libfutils-c326ce0cc2a735438... | 2 
          linux-5.10.254-cip72 | 2 
                 linux-headers | 2 
        ltp-testsuite-20260130 | 2 
                   qemu-10.2.0 | 2 
                 rtl_433-25.02 | 2 
               tcf-agent-1.8.0 | 2 
           uboot-tools-2026.04 | 2 
uhttpd-15346de8d3ba42200249... | 2 
amazon-ecr-credential-helpe... | 1 
                  clamav-1.5.2 | 1 
           crucible-2025.05.28 | 1 
             dahdi-linux-3.3.0 | 1 
                  delve-1.22.1 | 1 
             docker-cli-28.3.3 | 1 
                enscript-1.6.6 | 1 
                  ffmpeg-6.1.5 | 1 
                flashrom-1.7.0 | 1 
            gdk-pixbuf-2.42.12 | 1 
                   guile-3.0.9 | 1 
host-am335x-pru-package-5f3... | 1 
       host-gcc-initial-15.2.0 | 1 
                 host-gdb-15.2 | 1 
            host-mfgtools-0.02 | 1 
                      host-php | 1 
          host-xfsprogs-6.19.0 | 1 
                   i2pd-2.59.0 | 1 
                   iotools-1.8 | 1 
                  iozone-3.508 | 1 
                  janet-1.41.2 | 1 
            jpeg-turbo-3.1.4.1 | 1 
                     kbd-2.9.0 | 1 
           libmicrohttpd-1.0.5 | 1 
                libmpeg2-0.5.1 | 1 
                  libnfs-6.0.2 | 1 
              libopenssl-3.6.2 | 1 
                librsvg-2.50.9 | 1 
                  libsepol-3.9 | 1 
           libsoundtouch-2.4.1 | 1 
             libstrophe-0.14.0 | 1 
             libucontext-1.3.3 | 1 
                 lowdown-1.4.0 | 1 
             matchbox-lib-1.14 | 1 
                 mdevd-0.1.6.5 | 1 
                       memtool | 1 
                  ntp-4.2.8p18 | 1 
                     nut-2.8.4 | 1 
               open-isns-0.102 | 1 
             openjdk-17.0.12+7 | 1 
              openjdk-21.0.4+7 | 1 
            optee-client-4.9.0 | 1 
package/python-scipy/python... | 1 
      passt-2025_06_11.0293c6f | 1 
        perl-xml-libxml-2.0134 | 1 
                     php-8.5.7 | 1 
python-remi-2022.7.27-37-g1... | 1 
          python-tinyrpc-1.1.7 | 1 
rtl8822cs-55971663534233fd8... | 1 
        s6-linux-utils-2.6.2.1 | 1 
                 s6-rc-0.5.5.0 | 1 
                 sqlite-3.53.2 | 1 
                 systemd-258.7 | 1 
              tailscale-1.78.1 | 1 
                tpm2-tss-4.1.3 | 1 
          usb_modeswitch-2.6.2 | 1 
             util-linux-2.41.4 | 1 
        wireless_tools-30.pre9 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/fc2bef5514aaa3d1dae8e982c127f63fbd24b3d7 | ORPH
  aarch64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/b3e5271bda2b0b52a3a4acbf3bdf06626f057a62 |     
   x86_64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/93ec7f9c1fd9807341f768ee68140691d1d06398 |     
powerpc64le  |        catatonit-0.2.1         | NOK | https://autobuild.buildroot.org/results/8cf425d0eed91e400fa9cd436751e082ad321943 |     
  riscv64    |        catatonit-0.2.1         | NOK | https://autobuild.buildroot.org/results/cb0e0808b6df5e250af7ffee2842151c7a1aa60d |     
    i686     |          clamav-1.5.2          | NOK | https://autobuild.buildroot.org/results/3ebdc93dbeaae5195670fd1ec5b77db6253465f4 |     
    i686     |      crucible-2025.05.28       | NOK | https://autobuild.buildroot.org/results/3c765baad27df98f47111508fcee6914cea15550 |     
  aarch64    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/78efe80163677101868449139739808edf53f4f3 | ORPH
    or1k     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/dd38437b0c9eb4b0ce1fe573f34447c3ce6cd93a | ORPH
  aarch64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/5f1057e6f36b683b54004ca822f43b08d214c038 | ORPH
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/33b4cd878546a2424b0ba3b9cfc6c7c4b7750ce9 |     
    i686     |       docker-cli-28.3.3        | NOK | https://autobuild.buildroot.org/results/e9122e68524756ad630d5c81e7b5607baed767de |     
    i686     |         enscript-1.6.6         | NOK | https://autobuild.buildroot.org/results/7520473fc41a66d50cc294edf0a4680672548d94 | ORPH
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/118434a0eacb37d767914c737a58f2c2070a7494 |     
    arm      |         flashrom-1.7.0         | NOK | https://autobuild.buildroot.org/results/dbd58de91ce4c1c41befb1f3748d4243d322438f |     
    arm      |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/1f40f1eb78dd615b40be25f66362be019e890bbf | ORPH
    i686     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/fbc5f6b5c7d5ca61cd009256d936197335bd6cd2 |     
    i686     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/bd35d0ed8dc6424a380cde5d80f813802ff25efb |     
    i686     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/86690d37dd0b827f97028a323f36393cf8af3b85 |     
    i686     |         gnupg2-2.5.20          | NOK | https://autobuild.buildroot.org/results/9a30145695a898df20c1b5e67b41cff66fb56be9 |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/a082632af8b186fa8250d7163f9dc5b1f01a58e3 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/a4f3a7729674530939ed4fcc7f05730331857aaa | ORPH
    i686     |          guile-3.0.9           | NOK | https://autobuild.buildroot.org/results/fda84a9138c3e7f48bf3ff8cfa31fc6f2ff5fd60 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/c5c25d7a5b9d18e98fa8202b6fe2030cd264a8ce |     
    i686     |    host-gcc-initial-15.2.0     | NOK | https://autobuild.buildroot.org/results/b556277552a94ef2858ca147b42284470be0062e |     
    arm      |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/56c6b92d77523ec61dd0c775e8de7721863e3e47 | ORPH
    i686     |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/72725dc0d4f916ae75cb2c6986b0edb7da7ec497 |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/09c11feeccb0d325c81cd0bb3dfc558892275f86 |     
    arm      |       host-mfgtools-0.02       | NOK | https://autobuild.buildroot.org/results/9da5f356e08af6c73a29557f2c50e534c040cb01 |     
   x86_64    |            host-php            | TIM | https://autobuild.buildroot.org/results/62dd0eacc1feaea614bb59c2cb13481759da443d |     
loongarch64  |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/cac2357ea9d6767d42f9bb55107818175a76b296 | ORPH
    i686     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/d08d8ecbec2757675415cf91ccaa89b1d016f8b6 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/04222c25840140998a1b680fff8b27f0f6b29cfb |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/61d3a3d1e615b8b58c996301248ccf1abd3b8143 |     
powerpc64le  |          iotools-1.8           | NOK | https://autobuild.buildroot.org/results/aa1179840601e578ed5f3acbf9c98e1f73b75d98 |     
  mips64el   |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/9b34ef01d37a49a49b0a6213592b0943c9a3edbe |     
   xtensa    |          janet-1.41.2          | NOK | https://autobuild.buildroot.org/results/dc586c35c0dd658eee1e297a4a745ee15e07166a |     
   mips64    |      janus-gateway-1.4.1       | NOK | https://autobuild.buildroot.org/results/baf09856317ed0861a21f640717059b13b869c13 |     
    or1k     |      janus-gateway-1.4.1       | NOK | https://autobuild.buildroot.org/results/d0abdc899dc484fd68dc8a0ce43e523f6266be6a |     
 aarch64_be  |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/70529ae01eec9e8633c86eccb3aae24712759348 |     
microblazeel |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/fe79dea27ba9d5231dab70f3202999bc89aa5764 | ORPH
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/2cb15cc633f52d47be2e5118e9dc10d336f35626 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/a063ab9c8bbd222d8e3bae435143bc58efeb2799 |     
 aarch64_be  |      libmicrohttpd-1.0.5       | NOK | https://autobuild.buildroot.org/results/1982e66e9615df4a4a8c9b24a5856df76d08ea8a |     
    i686     |         libmpeg2-0.5.1         | NOK | https://autobuild.buildroot.org/results/81fa07a41ea7ea15aaa57809f138f05cb2b197e8 | ORPH
    arm      |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/39087b4e80aaf6f7e7e3f5720532235d2f0ac130 | ORPH
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/9ae0aa6ad538668431d5f974bde1f1bc5292acbf | ORPH
    i686     |         librsvg-2.50.9         | NOK | https://autobuild.buildroot.org/results/7809147a1aef5f20eb8b193e79f6bb8b96cee614 |     
   xtensa    |          libsepol-3.9          | NOK | https://autobuild.buildroot.org/results/361f36db46b63945db3d98aeb48be5da78203468 |     
   mips64    |      libsoundtouch-2.4.1       | NOK | https://autobuild.buildroot.org/results/c93e7cbb4e01e86a0d577cc261f79f99e418282d |     
    i686     |       libstrophe-0.14.0        | NOK | https://autobuild.buildroot.org/results/ab7f9115f626b3a90ed16275fa70f185fb0b1ff2 |     
    i686     |       libucontext-1.3.3        | NOK | https://autobuild.buildroot.org/results/2b1b23c07dab3a34132bff43be128ef7559af348 |     
    hppa     |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/d069872686e9eb19dc480c76b05dcaceb4a668eb | ORPH
powerpc64le  |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/32990ca668948c1694e65024a8df528fbc684354 | ORPH
    i686     |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/bfaa466947f9fbc99388c38933a4c9dd2d6be6fd | ORPH
    arm      |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/09788f87555c1de1472bd114170edf9741e2f5e9 | ORPH
  powerpc    |          linux-7.0.11          | NOK | https://autobuild.buildroot.org/results/59e64619af5e70c4b5f2606d3b43b9bc181d9569 | ORPH
    hppa     |         linux-headers          | TIM | https://autobuild.buildroot.org/results/cf7ea1512ca46720668fb05fd0ff8ff1125cc8a4 |     
   mipsel    |         linux-headers          | TIM | https://autobuild.buildroot.org/results/9304b4087c3442d255d74cd8f491eb857d465ddb |     
  powerpc    |         lowdown-1.4.0          | NOK | https://autobuild.buildroot.org/results/f9adcea75bf7438025e859fa370182de260db54e |     
  mips64el   |     ltp-testsuite-20260130     | NOK | https://autobuild.buildroot.org/results/650bcff30e837285a05660b50d2cfdd2ae5f02e5 |     
  powerpc    |     ltp-testsuite-20260130     | NOK | https://autobuild.buildroot.org/results/c5ee76be7ecdcf84431cfd6a4fb5dd2618f84df6 |     
   s390x     |       matchbox-lib-1.14        | NOK | https://autobuild.buildroot.org/results/a7ed3b6fdc98464b7a119f8b9f49bd75f692dd5c | ORPH
    mips     |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/c36c51a7c7df4bfc1b2fd379992c5668670b318a |     
   armeb     |            memtool             | TIM | https://autobuild.buildroot.org/results/124fb8ba064344405a46a1b18fb155b1fa02d07d |     
    arm      |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/f7b3de5a15f2d27bc6eaf166d1720c9a39afa636 |     
microblazeel |           nut-2.8.4            | NOK | https://autobuild.buildroot.org/results/44ff9caa0ca18d6241a3a8965e156d51b1211e45 |     
powerpc64le  |        open-isns-0.102         | NOK | https://autobuild.buildroot.org/results/5109987ee197346de7232d40db0f626d1a1c40d3 |     
  aarch64    |       openjdk-17.0.12+7        | NOK | https://autobuild.buildroot.org/results/367ed1540562fb0cf940940d63806d9faaeeca51 |     
    i686     |        openjdk-21.0.4+7        | NOK | https://autobuild.buildroot.org/results/45a30e401a4999ddf245b15d112ab372aec8caec |     
    arm      |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/f6e742f636a0f93152f633086a03550296355970 |     
    i686     | package/python-scipy/python... | NOK | https://autobuild.buildroot.org/results/1311c20c8a4c2ad9fc3763f50c2ec00042a27b66 |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/bd5a6fb4cf8a9d8a6274b88be83584289dc1ead9 | ORPH
    i586     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/dfcac6e08eaa1a8736706d8de429e95b40aeafc9 |     
    i686     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/b059f8ff4ab081be70d69a7c9f57726355bacec4 |     
powerpc64le  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/e1146473be5a3a28166003442d19984081b9e86c |     
    i686     |     perl-xml-libxml-2.0134     | NOK | https://autobuild.buildroot.org/results/58a2dcf84a7ef01d03d38e55d04fea5f0f127457 |     
    sh4      |           php-8.5.7            | NOK | https://autobuild.buildroot.org/results/a3482373bd416f60c2331c7e48de478e65f7aa42 |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/b2d73d4f20a57c3b7ad3f039b1a4715129eef0aa |     
    i686     |      python-tinyrpc-1.1.7      | NOK | https://autobuild.buildroot.org/results/eda69dd62834323b4136aa18eacf22e3dbb66a5b |     
    i686     |          qemu-10.2.0           | NOK | https://autobuild.buildroot.org/results/cff4ebb0bc950ae25a42ce9a6424236911dfdfe8 |     
    i686     |          qemu-10.2.0           | NOK | https://autobuild.buildroot.org/results/de966528912b3a3af7eef93ccf53bd869bf1ad50 |     
   x86_64    | rtl8822cs-55971663534233fd8... | NOK | https://autobuild.buildroot.org/results/ac9a649cca03bb7bfcea79ff5cbcf9dfdd761d46 |     
  sparc64    |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/51a6c589128bb48ff1d62de133ad2e36911da4f8 |     
  mips64el   |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/61fb106f380579763724e4748230fda8e00366c6 |     
microblazeel |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/cbc554b8be6c8a8579bb2cc6aa873aac9e95b272 |     
    hppa     |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/9d67e04202f30cd03c358f05b1134a2ea07de403 |     
    m68k     |         sqlite-3.53.2          | NOK | https://autobuild.buildroot.org/results/c0e36ccda28df3ae984f51971744baae4cf8d53d |     
   mipsel    |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/c347b51b45fa9aacf21bfc7646a7e407566abc48 |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/8230996d6ac17cb5832a14b0dc2fab7d1dd92240 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/168411fb98a548272018e440ddd905886d974582 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/7aec6f27a8ea4038a2341fa3af6b7c952e752fc7 |     
   armeb     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/f8ce1ca17807aca43aff2261f6d983f429529808 | ORPH
 powerpc64   |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/530696956410b94af1927476a0fb1fe225495a4a | ORPH
    i686     |      uboot-tools-2026.04       | NOK | https://autobuild.buildroot.org/results/df063f67e4df34b09e9a533d3b1e89651a54ed2b | ORPH
    i686     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/048dd9eb4d4f38ef2ebc88b5b39ef2a005cac5e0 | ORPH
  riscv64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/bf9a8749e1fd0aa35c73c18eddb2e5b3639f64f6 | ORPH
   sh4eb     |            unknown             | NOK | https://autobuild.buildroot.org/results/155c76619d4b9e4daab4e38fe3233545b4f5d118 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/74b05f6e4890c3710572d817fadd12d7ed7fcd1f |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/e71e547b3171e65d661ee13f2a078982db54b26f |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/af95217d3ba4843a6f698cf4d030f7c44a8f4c23 |     
 microblaze  |            unknown             | NOK | https://autobuild.buildroot.org/results/f336c8ab2cce754afcb201752278613b3adf453c |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/e2576aaec7fc65622ffbc494593a768b2323c989 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/c74c9792c6a39395d8a90f4cc5e99ce8aaa8c81c |     
    mips     |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/b0aec114caaf47a2ea4482c7092dfacda5657c6b | ORPH
  riscv32    |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/1c70e4f54c87373f9d623310e78bfddb8e5ff5fa |     
    i686     |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/0fb8e17ac1b86b78d521edf03a67b3f271a865d0 |     


Classification of failures by reason for 2026.02.x
--------------------------------------------------

                 aichat-0.30.0 | 1 
amazon-ecr-credential-helpe... | 1 
 docker-credential-gcr-v2.1.30 | 1 
  gobject-introspection-1.84.0 | 1 
                  iozone-3.508 | 1 
     linux-5.10.246-cip66-rt29 | 1 
        ltp-testsuite-20250930 | 1 
                       unknown | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/c2efcd4b28574075914ed482e3c53755469546cb |     
    i686     | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/d8c025d6f7c70751957cc9827ef6dbe6b488f25f | ORPH
    i686     | docker-credential-gcr-v2.1.30  | NOK | https://autobuild.buildroot.org/results/f72a5b52a5832e0262a7a01ff93ec38ea52db9a8 | ORPH
    i686     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/68920c6c7b0926bd3a4ef29b8429f33e485e423c | ORPH
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/7c4d8feb59bc46a910487a499a2bdfa70fdab6b2 |     
   sparc     |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/4fab490392080f6c7d36573f437a24c051005ff6 | ORPH
    i686     |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/da155fcc7a75137c3a504972f906ffcf663e3b9e |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/ab997629dbbcebe43bc6e4c764a8cd683d4f7747 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

  gobject-introspection-1.82.0 | 3 
                freerdp-2.11.8 | 2 
                 xenomai-3.2.5 | 2 
            gdk-pixbuf-2.42.12 | 1 
      libabseil-cpp-20250127.0 | 1 
         libhdhomerun-20210624 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
             libtorrent-0.13.8 | 1 
        ltp-testsuite-20250130 | 1 
                memtest86-7.20 | 1 
               openblas-0.3.30 | 1 
                   openrc-0.56 | 1 
package/linux-headers/linux... | 1 
                    polkit-125 | 1 
python-remi-2022.7.27-37-g1... | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/cde8176b272e815142f8df83dbd9fbdd4eb6baa0 | ORPH
    i686     |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/6db31f97a36fd11aea0e296099a625e8d715c173 | ORPH
powerpc64le  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/cfd196b05889ce49ec93068d0e3e7dfabfbe64d9 | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/f2fd9fb3bae860c4e7e198399d70d686ff353e34 | ORPH
   x86_64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/66a523da16a75706dd7baec2d42d2347bedf546f | ORPH
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/da9a2f223bf0e210c95e86810ab941a9f3c3bbeb | ORPH
  mips64el   |    libabseil-cpp-20250127.0    | NOK | https://autobuild.buildroot.org/results/32e8b171857e21233a02d8e04ca6a5de58ceb2ee |     
    i686     |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/f376dfcbf07c782e5f413860a3c8bf1d2f18a5a1 |     
    i586     | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/9a75e633d43ca80d55348dba2738df2dda1d9e15 |     
    i686     |       libtorrent-0.13.8        | NOK | https://autobuild.buildroot.org/results/88b3ead9a2b0f716f32f4de66838795c20380b13 | ORPH
powerpc64le  |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/2f2a029f0b9439cf14e44d0ac3814f62610d4300 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/fad8dab47338cf432b8a6d36918a3ac8d80f089e |     
  riscv64    |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/8cdc867db453378f7984d10f08fd1f89c7875959 |     
    i686     |          openrc-0.56           | NOK | https://autobuild.buildroot.org/results/d6e3d22643de120efada4a42e8705b65882fa760 |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/6c028f57755ad34b407944a40107ae52633dda9d |     
    i686     |           polkit-125           | NOK | https://autobuild.buildroot.org/results/d80c027493666c3c0480221ad602bd5aa150870a |     
 aarch64_be  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/a5f6e6c5aa0056d41bc19c52e88844bb0c526b09 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/bdde8efae381c712b47e73c8221b87e7bd151896 |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/00702a1e5d0fd4a7be60967b411eeada787d9157 |     
    i686     |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/165bb08af6d9d092bd797fca190d48dce54708a5 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
