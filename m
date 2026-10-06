Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 781DBCA5FED
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 04:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C815280998;
	Tue,  6 Oct 2026 04:25:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BUpyOujtP_Z4; Tue,  6 Oct 2026 04:25:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 90C33809AD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791260728;
	b=j9qQ170cFFbcxxqNOj4zIwOQu758/k+9oyJ7oGUdK38TADxVh/B6Z+bMHy6CjpG4XJyq
	 F4OJ/VLvjqfMZl8fJ/aag3GlMXa1pOU5lcw+9N8x5VTYxjQ+Kpo0aKgxOTm1SWOFkf3BZ
	 cGGjAGipBkkJyO1+4rNKd+Vfg2FxETmo5Ou1w8HFOjrvX+ooImRV58uEfOXT6mfFZjnqp
	 Oj/sdqZzLcA1DMXL94fVk/IP/dMS8tGFYJHOcGJyLH44l4pQh+s5as+7qWskt5WD69FUY
	 gqpOvrDWPwVBxSn9+9YuwSWQ2/61yCPYDDTWaeZNBMdN36qnawwXQplEOQyVgoYekjw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791260728;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=7F4y5ep4jYDVDHsI9NR7T78pA1IKgXFWocMrrdklUY4=;
	b=aLhcT9smjweXEVgZ8Zt9vIHZiu0WV8rMvf4k0Jq95o69av+OUlBc6X6DZKMCG9AGLe/L
	 0z/UybJ1osEqzmzwMNJOpUtaKwvtN5nc0HVsyDxLXT2/tR1u2wmDBU0nNxq7vJ+aqwwVe
	 azrP2f4M7t1YhrgAMkTTfx8U3/NyCv/8wgvUfJPeFMPdukCT62kPqQES3C4MU4g1CZnXL
	 5b56QgUqz8evC1ZyyotpPyOk6+nRCZjNtLVpm/LFzPGow5w//C8zCgNSRXQKvqmRWC9h2
	 8E46q1NW3Zaky8CAWcUbV8tz7ofgOyek8ftOVksZTvxCwiT6//8HSf/0xWpvGY91RcQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791260728;
	bh=7F4y5ep4jYDVDHsI9NR7T78pA1IKgXFWocMrrdklUY4=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DRQm2XxmqyM7uPquBDg3jdbc5/48FWELcAe9z7+CXQBEZRnuGBz4x+jaMXuzvWwY5
	 4C2Kie5/9XPqSlrkZZxnAZWMtsWeKfItJO289Ph4Dxfi4HbHkJTqxW3F3GuPFBI7fB
	 KREhC/rKDCnGrpEt1CcH2QlwOqGy3kYxkB4pX+rj0nGtr5ON91cV0RVtoBA29QP89e
	 7gX6q2Nk5vko4c8rQigRF6+nbaiU+QqNgMXq7O7/Wo321rxqNEPlifDjXl7mHNtb84
	 eq9iutozLHZIb69rSnUcFeiSemryWBMUVvkJNphtfECPoUNgJ6Ap0Waqsj+l204twj
	 6pGIIqMlwBnYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90C33809AD;
	Tue,  6 Oct 2026 04:25:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2071E1D2
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 03:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12036400D6
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 03:33:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mD6jqieHoMlL for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 03:33:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org CF2834009D
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791257587;
 b=n3BzE+PxdsGH6GSVZDh/yXNS3v+Z2qbwUWEEhXMreKsfnO2uv3+UhE+6LvBJhkoXDYi0
 GZEFe8arE/+pCFBXjdxVnC2a24zfijHgEXwugJLLsLJ7s8JhI7kRipMpb7+yDkuaDfiqS
 RHN4nLPymwtItEES154eBK26dEfWpUaK/xmGtV+XDNOUa28l2vfu5YpCcC5RFC37zmj6R
 IISUfczAEPzOph2Hg3r9u1MN4ntKl6pX5nnP8eNmbbuWrQOqQnraAHm0Hh865CHxvxzoe
 mASfYyktRJWXKXXjXFxXqoeDxiYsbjmNLGp8u1qbfunKUOs6bezoTRuHf/vQ5y567eA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791257587;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=Nzy7NaKn3FK/l8nh7jMaeOtJX+y9X2d0hDQLx9Lrp+w=;
 b=DMKSnLcER/LWsQbL2mOIQhvphLpPkBO3Cy0+9uDyb/nDFUl5+kjeIy6ymik4zYevXVLC
 9Lv8dQxY9ctkXPkTTCQ1ZLwfjcq70vfq9jokI0V6cWvyF8Czlrp9s7kWI1XC1NochVleI
 AuHRR1Vc5+56m3h7ONVyUf5UQs/W9/WYf0YBfuspf4AhcfU/ZRfPRSbwYm8InYXFwBdoz
 H/jD3MP1Rc7nvrqlQo5+aIIADvTlKuJ6SBwmkBpr+gYWwS2RPkHaM2+XhUMiM14TtLr7X
 xz0HFLLBG/ayaPyiJ5eEhbjANlHn6ldOVKZnVA/DPkJsyc9+9OQe92HG39+AEhpFLug==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=n+oirxYI; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::432"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=n+oirxYI
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CF2834009D
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 03:33:06 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-48c4649b35bso2397525f8f.3
 for <buildroot@buildroot.org>; Mon, 05 Oct 2026 20:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791257584; x=1791862384; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Nzy7NaKn3FK/l8nh7jMaeOtJX+y9X2d0hDQLx9Lrp+w=;
 b=n+oirxYIMSENYqjPZUY+AamCSzeeNHqobb55eodjtkUTy+kjc2ote7pn9ORc+syNXz
 54DKTOGQ+6ZzxGsxfXclhKiXx4gGViomUlYfSLp9ql2cPcCyLhKzfGDqJ+1TkhpvMjHM
 YAPoPs0hoZyUzxy2AkQEg4bOgBKcIrXBUtagAhL05ZX0eCd6vSlBOk3X0XaRzh3Wkavk
 TQB8zzLcBAldMn1g1BiVtAetb3ws/qxwqjlwBCiXs5ysmnNWbGNcsedSFh8RcgFY67z4
 A3iuaCAZ/SxK9Jll8rb7AHHf3mIWUiaKfzt+iiD/ZGEpY+o4eG1kS0q+ncJdxcusXal5
 HzSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791257584; x=1791862384;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Nzy7NaKn3FK/l8nh7jMaeOtJX+y9X2d0hDQLx9Lrp+w=;
 b=qQvIfbF6qXmlBnDP1Qn29VQiUxMGJaabI1FtTD1G76rQqNuOJzTA776MbNlEqi8zPf
 SlZKP55enMNrelWxE85kmkNI4yrTfaEWueR7FxUFXeAQ5mShOCMHqyX1tCW7l0Gq1rnH
 kcMkCzfGV/99RHmQR9hCteZZ/lodU34kB42oG9IH8aqoR/3kvY5YYDet42N2qbUWXefZ
 fGJct84GZl6R3Da5ZloG7jTWpxs3NOBmuGbs49uCTtPAerGf5OetVuGoSgCtgLIU0aGR
 bwIDKasQ8TiCuytBt3bkYCimBqzJYO+QkVMRR1wfJeb/iNa/pEvd8W1U3jE4xU1ONvVU
 1YYA==
X-Gm-Message-State: AFq9FYJtT0xc8t181lsAx/J+aC11arydB1PueapvwltkVxqyMvmLjcjB
 UKzshUlmizJgYDLs4xZwsp341lY0iH51gSuPnb3YbZax4fdNkdtpZalamF9gpGR+
X-Gm-Gg: AYBFou0Aqunnv1T72v4fDaMZGJpZiRYyu4HkmwDV/Ps68zGJ4Nq4ZM6W49f6ykgqg41
 Q+kWYlMU2fHHqtcu1bUV31OQ1iFTCW2r0H40q2WHj3gaZyx+uO+qqavaRmnPIN8B5bKTghobqGg
 i7gbco1yMWtoRkT/LJiQZR9eGARj2W7XKQ0B2qdlpxpXM8ZsS+qL8817lTphr/spRO0C4i1si9N
 fYe3/eB0F7rNF1jAQFKSo56MTY6NAyq2BTVHQzy2y6k0jZM5GwaEJ7cbEkQ7qBRexcsORtwebiL
 BgXlKgg19LIp5Iiimwns047QiECTghZmCL9YEAEAC7fAfocLdQC79Rqp/PdpvzsZq35nszVGwDI
 lB8Y+Woa3f/1MDEkhuVQQjPteAnivF+UqFLeb+eCms5qFyNcwc9uwPYGboGZnVO1Kc+BfFIpYmw
 X6lzR2Ph+HCPatbrp298BXhq9viqKf1jUUOmC6/uKeAolgVjfkO2eEo99gAs+SZBfybTsvd0K14
 w==
X-Received: by 2002:a05:6000:22c6:b0:488:83b1:16a1 with SMTP id
 ffacd0b85a97d-48c6d0f47a2mr123118f8f.7.1791257583987; 
 Mon, 05 Oct 2026 20:33:03 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48c62299461sm7460338f8f.28.2026.10.05.20.33.03
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Oct 2026 20:33:03 -0700 (PDT)
Message-ID: <6ac46bef.f8441ae9.d4b2c.4b03@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 06 Oct 2026 03:33:03 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-05
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

Autobuild statistics for 2026-10-05
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  8  |  3  |  0  | 11  |
  2026.05.x  |  1  |  1  |  0  |  2  |
  2026.08.x  |  0  |  2  |  0  |  2  |
    master   | 50  | 168 |  3  | 221 |

Classification of failures by reason for master
-----------------------------------------------

host-gobject-introspection-... | 15
                 libclc-23.1.2 | 13
                       unknown | 6 
            host-gauche-0.9.12 | 5 
                host-odb-2.4.0 | 5 
            18xx-ti-utils-R8.8 | 4 
                    attr-2.6.0 | 4 
        edk2-edk2-stable202602 | 4 
        ltp-testsuite-20260529 | 4 
   openvmtools-11.3.5-18557794 | 4 
am33x-cm3-fb484c5e54f2e31cf... | 3 
                   atop-2.13.0 | 3 
              cryptsetup-2.8.8 | 3 
                   dante-1.4.4 | 3 
                host-gzip-1.15 | 3 
host-python-types-psutil-7.... | 3 
                     host-rust | 3 
                rdma-core-62.0 | 3 
                 systemd-258.7 | 3 
             alsa-lib-1.2.16.1 | 2 
                   bird-2.15.1 | 2 
      docker-cli-buildx-0.25.0 | 2 
                 dovecot-2.4.5 | 2 
            dt-utils-2023.11.0 | 2 
      freeradius-server-3.2.10 | 2 
host-am335x-pru-package-5f3... | 2 
            igd2-for-linux-2.2 | 2 
libfutils-c326ce0cc2a735438... | 2 
       python-dbus-fast-5.0.14 | 2 
                 s6-rc-0.5.5.0 | 2 
               tcf-agent-1.8.0 | 2 
                 binutils-2.47 | 1 
                  boinc-8.2.11 | 1 
                  botan-3.11.1 | 1 
                   ccrypt-1.11 | 1 
                cryptopp-8.9.0 | 1 
             dahdi-linux-3.3.0 | 1 
                  delve-1.22.1 | 1 
                  dpdk-25.11.2 | 1 
                   duma-2.5.21 | 1 
              erlang-26.2.5.21 | 1 
                  ffmpeg-6.1.5 | 1 
              fftw-quad-3.3.10 | 1 
fs/cpio/cpio.mk:128: /home/... | 1 
fs/erofs/erofs.mk:69: /home... | 1 
fs/yaffs2/yaffs2.mk:32: /ho... | 1 
                     gzip-1.15 | 1 
                 haproxy-3.4.4 | 1 
                 host-gdb-15.2 | 1 
            host-go-src-1.27.0 | 1 
host-google-breakpad-f49c2f... | 1 
              host-rust-1.98.1 | 1 
         host-ti-cgt-pru-2.3.3 | 1 
          host-xfsprogs-6.19.0 | 1 
               libecoli-0.11.3 | 1 
               libepoxy-1.5.10 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
libftdi1-v1.6rc1-2-g92d657b... | 1 
               libunwind-1.8.3 | 1 
               linux-pam-1.7.2 | 1 
                   linux-tools | 1 
                    lua-ev-1.5 | 1 
               madplay-0.15.2b | 1 
                    musl-1.2.6 | 1 
                  ndisc6-1.0.7 | 1 
           oath-toolkit-2.6.14 | 1 
              openconnect-9.21 | 1 
                openntpd-6.8p1 | 1 
                openssh-10.5p1 | 1 
            optee-client-4.9.0 | 1 
      passt-2026_07_28.f8df3f1 | 1 
                   perl-5.42.3 | 1 
                  prboom-2.5.0 | 1 
               pulseaudio-17.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
                 rtl_433-25.02 | 1 
                 rtptools-1.22 | 1 
     s6-portable-utils-2.3.0.4 | 1 
             superiotool-24.05 | 1 
                    szip-2.1.1 | 1 
               trousers-0.3.15 | 1 
uclibc-ng-test-132c6134d691... | 1 
          usb_modeswitch-2.6.2 | 1 
ustream-ssl-5a81c108d20e247... | 1 
             util-linux-2.41.5 | 1 
               valgrind-3.27.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/27ab28e9315798e638897ff1165c44a5b569189e |     
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/109516d69536cacdb2e67a2c960577c9472c5613 |     
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/06ee550daaf150f6c53bb63dee6444349e345848 |     
  riscv64    |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/2b162e75fd7359ca0625e85fca7b4b4917ee9257 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/47596d2b9e876d7284e3c4deb19912abf5de76b5 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/6cb9883eac731b86cb7ab7d9342265dbb8757813 |     
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/009dfcd4ca2c36f3ab9d8c7922c0064165e795d6 | ORPH
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/fb037c4968b1e13688844ef7b193e82a55377898 | ORPH
    arm      | am33x-cm3-fb484c5e54f2e31cf... | NOK | https://autobuild.buildroot.org/results/ef58730243a16fa6c1504c232f467380b80e5a94 | ORPH
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/5b9750f6ecf074576750cea411ad56a7e3bde52c |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/b11d791fea75c178a2d274c2be6af09ba7ace4c9 |     
    i686     |          atop-2.13.0           | NOK | https://autobuild.buildroot.org/results/38a1db5b2130091fe85ade1a55df8ad9505f7159 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/e34f065d35e4691ed529ebab902f1fed0e278029 |     
 aarch64_be  |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/d88666a23ebbca32343b2ffad9ad20948dd269d0 |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/9d18bf3b94cc223992f64595ba68a742fd953d06 |     
   s390x     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/f9599d3c28f865aeeb720d30fdcdea8d68c63ba2 |     
    i686     |         binutils-2.47          | NOK | https://autobuild.buildroot.org/results/5bcbd0478a49c2cc343e7d4a5c03af1fcc416fc6 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/a9c9847bbbc85aa88781191c78082e7ec7edb0c2 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/ac81cf8b0cf3a162c96ef9e5c0b9056f8e134a30 |     
    i686     |          boinc-8.2.11          | NOK | https://autobuild.buildroot.org/results/a67f95f22c9ddbaf84037c222bdfe659528c556c |     
   sh4eb     |          botan-3.11.1          | NOK | https://autobuild.buildroot.org/results/abafc91d3fc40859eb97ec7f814d53b6c7d91229 | ORPH
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/113dbfb2071ec8b630f447e892c6ae45b67528ad | ORPH
    i686     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/305f6d786a0172a3da38f274fbb5b16715aeeff1 |     
  aarch64    |        cryptsetup-2.8.8        | NOK | https://autobuild.buildroot.org/results/10efbfb5c61afa1018f46d71874e052608954e07 |     
    i686     |        cryptsetup-2.8.8        | NOK | https://autobuild.buildroot.org/results/48370a81addb63b4537af060ffd0783e800e2481 |     
   x86_64    |        cryptsetup-2.8.8        | NOK | https://autobuild.buildroot.org/results/bc2977614c72a598961a6b36641255450f71fd57 |     
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/37b5475cbdb2777f1d772a42f4fe8b338e291051 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/0719ac544acbad99a25e8b25425d6fa8b8d6051a | ORPH
 aarch64_be  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/b984637a813a6d1aa0498dca853466dfc2e162cb | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/f8046d4a2a57baa296050315fb5cee368d248ff1 | ORPH
    i686     |          delve-1.22.1          | NOK | https://autobuild.buildroot.org/results/80dd4f2871bd6d126f5fdb2d7b577d02c78e3bf4 |     
  riscv64    |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/5f0265f11e270bacae2848030584e997317b72bb | ORPH
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/9797539964b5b71b517662f669c96f9c365126c1 | ORPH
    i686     |         dovecot-2.4.5          | NOK | https://autobuild.buildroot.org/results/2160759eeead62fa065ed0cc7377c844f1f64ce1 |     
    i686     |         dovecot-2.4.5          | NOK | https://autobuild.buildroot.org/results/a32c02e74fa3cfada5fe24d00afcc3485bc9ca7d |     
   x86_64    |          dpdk-25.11.2          | NOK | https://autobuild.buildroot.org/results/5acfbca35460a3f9a672da84858930d00c6d6d8a |     
    i686     |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/ae60e08f720cdac0f52f49091e8202b8a82c17ff |     
    i686     |       dt-utils-2023.11.0       | NOK | https://autobuild.buildroot.org/results/b70becec5627131aeb7fef32baa868932439ed4b |     
    i686     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/d663fc19e9e2f796cbd39197d10d9dfbd7ab9597 | ORPH
    i586     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/483d304d337876a02920b336eb35b2bedbe90a4d |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/74c3f6b9e885a989048dd6b3ea1adb4af64db20b |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/a79f68890300ea4568fa5d83eb45b84a0b1b30be |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/4618588f96def8d4523c3240802b7ba22b6db607 |     
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/f3c2ed7e9ec7ef44c95f7383d6b3688d7a2d8892 |     
powerpc64le  |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/a107d481b423a5fa66752cf4278d3044fc808714 |     
powerpc64le  |        fftw-quad-3.3.10        | NOK | https://autobuild.buildroot.org/results/8f06b7c9d78716e21ab6e41914697ecaee63c5bb | ORPH
    i686     |    freeradius-server-3.2.10    | NOK | https://autobuild.buildroot.org/results/0b314e844534d3ccb40c58542f2da25badbce49d |     
  mips64el   |    freeradius-server-3.2.10    | NOK | https://autobuild.buildroot.org/results/269163d6b813d69341e92aafa847a8b68fa6f5ff |     
    i686     | fs/cpio/cpio.mk:128: /home/... | NOK | https://autobuild.buildroot.org/results/69358b33168dbc8e4b29930a1d531bcd6fdfb48a |     
    arm      | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/dde8d31367a5d9c97cc159d6e857f0d6c3e61b50 |     
    i686     | fs/yaffs2/yaffs2.mk:32: /ho... | NOK | https://autobuild.buildroot.org/results/fa636d3ba2d01f81b221d2ac0b788f3ee4ef556c |     
  aarch64    |           gzip-1.15            | NOK | https://autobuild.buildroot.org/results/3795b23407021e9fbaaf44c9319085c30d7511c1 | ORPH
    i686     |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/25888c0ee81c15cf35670a9efb919232123cc97f |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/f18893b000bef8ff93fe9f26d61720a884eb62ae |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/00e7c766d7092737de07464d87e6f15534f9bf10 |     
powerpc64le  |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/6f7b9f8aa84e6841e0eefbfeadae0e4e5e2ba9ea |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/eb10b53ad679a794ddc554cf6ccc16cef68712e5 |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/b0f0dbcd31e60336f93b4cd64263eaae00820798 |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/5383be68eeee667e7e1a300fc8737062bfcec257 |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/d8d62feda59a6e8c54e92ffe00b625e4181a749f |     
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/1333a05263b1a67b822a5fd968443063d44b6040 | ORPH
    i686     |       host-go-src-1.27.0       | NOK | https://autobuild.buildroot.org/results/e10012108f5a0c2f6932f922d225f2d70c8575d7 |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/96496895872bab97221eb459f81979941dbad0a3 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/f80d7a6e0d2a2102f9da080b5aefa23993226ac1 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e2a90ea0c9260d6b9e0ba38923f418c1d55cafc7 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/96d75441809d1704344fde4827e56ded55350fc8 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/eff4a0ae3abe843955ceede2a8462959fc563209 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bd4d457bfd76301961344ea6a310ce8fabcd310c | ORPH
   x86_64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/3c51676d1274d0ec6748e63af1fdce85592a7c6d | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/808908ae9efc9925d6dc3af3f6fae60bfeacc4ac | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/a863aa4f051c376bac3d93ffe0f213e2e9cd216e | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/80c53d19bcb283ca8bb96dd0fe3274753d2a61c4 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c8e75b8a87fb82b0380ea28927ee37d65bbd0e8c | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/488c6a35e832ab530aaf0fb416630930d34b7df8 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7dafcd7137bb495633fe5790e855d6c7dbaf90d7 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/eccb1d405e8b3f4dddb4fdee0b446eae2ad60c13 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/222e93623cd2762a8f12e76ccfe8f6d91d8b35fe | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/45e77b60c1b96e65936f308da037954b298b3122 |     
    i686     |         host-gzip-1.15         | NOK | https://autobuild.buildroot.org/results/5b86955d250d76981b547ac50c9a30551401d767 | ORPH
  mips64el   |         host-gzip-1.15         | NOK | https://autobuild.buildroot.org/results/0ce8639781e2c4fe80ee822b4181d8c83b0c4573 | ORPH
    i686     |         host-gzip-1.15         | NOK | https://autobuild.buildroot.org/results/8aa5d8a92f53c7a1e7613ca3008309f888b680d3 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/56053740ff50e665b7b0afbc67a9ccb224c011c5 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/3a6d2ead4f5a142f94439d4525064bbc1da5faa9 | ORPH
powerpc64le  |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/7b8cea3113946cd8fea77528918c312423226b8a | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/903970d7dfa8a1af89ef64cc8921bf5bc704281c | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/cbe48589e31f25af585402c0c627f5bef8b5c886 | ORPH
    i686     | host-python-types-psutil-7.... | NOK | https://autobuild.buildroot.org/results/7737736dba88181fafd3ce01ebbcf25cc6aef11d |     
powerpc64le  | host-python-types-psutil-7.... | NOK | https://autobuild.buildroot.org/results/78d4c6e7ae4b6c11556a535106430780c605ef37 |     
    i686     | host-python-types-psutil-7.... | NOK | https://autobuild.buildroot.org/results/8ddb6e072b5bda71eefe82fab726dd5ff14131a4 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/bd90e40cbdf1bd5189cf3cafdd5b863ec79620c1 |     
    i686     |           host-rust            | TIM | https://autobuild.buildroot.org/results/de65aeafe4f3fb21f7da3139a1cb8b7bef70655b |     
   x86_64    |           host-rust            | TIM | https://autobuild.buildroot.org/results/86ce2577587979a4dfc1f0477a0d9f96220db99d |     
  aarch64    |        host-rust-1.98.1        | NOK | https://autobuild.buildroot.org/results/90526d5b1161680238c850a521702c65dc0d8679 |     
    arm      |     host-ti-cgt-pru-2.3.3      | NOK | https://autobuild.buildroot.org/results/c6a91fe910d852e3d945e6f0147b962c2abd2733 |     
    i686     |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/83ff440c9e418d9733956d6a19392ebe8816e5c4 | ORPH
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/2d0141a53dee27c9169e8f8182c2e940ae7832e4 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/0854ad111479edfed186d38b81d5a4db75046173 |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/012e4376492381861ec2b99faa805909745902c3 |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/7058097b30c46a9aefc9ac9b21f45cbe2676bc30 |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/35e85114ad01b43cad184fba157ad0b4aab756f6 |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/b0e220ee45fac62dc4604d1feb2802dc1e2eb1f0 |     
   x86_64    |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/998adf8d2906b1bdd6de289d3c77d6a29adc1e77 |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/588f99bd16cacbee54026defea788cbbd9d42a28 |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/346254bd14ad19519292cfee6870ce1f617eb2cb |     
  riscv64    |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/bd9ea22a1dccf94890ff9fb8eb2f657660502272 |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/80c973870326754df278beb7eea4e9782f4fce6d |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/c31c259919d58b976b7e588ac611fb4ee0598dad |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/8472dc770f4325e2168a5d2e6c2a2f31ca558e1f |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/ddddc9f3469ef3cef3855f6691b2ec06db06ab0f |     
    i686     |         libclc-23.1.2          | NOK | https://autobuild.buildroot.org/results/ed88ec0b61953a99daa4f12e702db629fdcbf689 |     
powerpc64le  |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/ce399c6dafd677814e9975488f9e437c309e9e8f |     
    arm      |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/a89fe0d70a3eb35d1584dafaea9f92f80f4089ca |     
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/04c67248ba36c9f8dfcc13717aa1a81f87b31026 | ORPH
    i686     | libftdi1-v1.6rc1-2-g92d657b... | NOK | https://autobuild.buildroot.org/results/1ef77400e96c48f6eaf2e15a1b9f52f8508fd4e7 |     
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/630145915744e8590c78e34c089b2ad12cea4ea9 |     
  mips64el   | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/6291b04e240bc144dedf2b33d3f4a4f31c27e350 |     
    arm      |        libunwind-1.8.3         | NOK | https://autobuild.buildroot.org/results/deaa247f6e20775ae09932c41d06f8a41c8cc442 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/1b60aa66945118814ac870137226485de8c90a66 | ORPH
    i586     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/00a18a4532c44eb6dabf1ae96b58a513cf1161f7 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/66c176cb4815759fb7b09a7ff8777e276530f897 |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/af15e7513186c79805397560dbeef168d28c10da |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/598cb6d7d2a8df7d5f1d5f902830ab69dcd5e2fa |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/ab9d571c2f4b9b8d70c419754e99ed508295bccd |     
 aarch64_be  |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/fba936d34f582ba6aa1f2ef24b3a4c6c02afe8e4 |     
    i686     |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/3bd9edd25620481a6c004ae14122a983c11c0960 | ORPH
powerpc64le  |           musl-1.2.6           | NOK | https://autobuild.buildroot.org/results/a1953a8b75ac69a343422a2f9148bee8acfa9fa0 |     
    i586     |          ndisc6-1.0.7          | NOK | https://autobuild.buildroot.org/results/e1ddb9470265c35c6234994e775e3dfd9eb6cc5b | ORPH
    i686     |      oath-toolkit-2.6.14       | NOK | https://autobuild.buildroot.org/results/1732fb5979c57b51f8e546f9fe58c8f43c8a4272 |     
    i686     |        openconnect-9.21        | NOK | https://autobuild.buildroot.org/results/5f81bf35bbf8b268daef3094e5e8693fb8b7f198 |     
powerpc64le  |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/34bd50ed8d82bef9f173d6ba3f3271398bdb2003 | ORPH
   mips64    |         openssh-10.5p1         | NOK | https://autobuild.buildroot.org/results/80e09e106182f0edd2751f80db1d6838c8f7072c | ORPH
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/dd71d12f2490e1a24a51c9f7c40ee6cb86f3befb |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/7a5d588303ea9bd289531ac20fd7f7df24810693 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/f3c61903f4ff2c69ace9a1abfcb9f12cfa1e2af2 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/ae5f6909c2934074b0012c68aa9604e56e00caed |     
    i686     |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/dfef6ba06a89eae1334c8e9d6b1bb1dc52a77b69 |     
    i686     |    passt-2026_07_28.f8df3f1    | NOK | https://autobuild.buildroot.org/results/e9c1d47bf970dc4a260a62a3417b0a4a82e3967a | ORPH
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/27dae2c8844c5004e6c51228a2bcf26090a6cda5 |     
    i686     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/45f809c64c65ef5c810aaea9777de300e511460c | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/c2b4cdab96c65e77df88645929e0b381e2f8eab4 | ORPH
    i686     |    python-dbus-fast-5.0.14     | NOK | https://autobuild.buildroot.org/results/1793fa0b58e39283db69cca0676a0338bb0feb28 |     
  mips64el   |    python-dbus-fast-5.0.14     | NOK | https://autobuild.buildroot.org/results/bcfe2b87b434c8cb666b06212fd353fe6fafc336 |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/0438c79f1ebd849cecde4dc53d42fe7f8de873aa |     
    i686     | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/b71a05c93c0a3910c89282cc69175b707eae09ae |     
    i686     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/dd62ded513699e6b587f2fa27273134db0ad4b7f |     
    i686     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/ab1632ebc3e88d822dc002a9620a79c98033156d |     
    i686     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/9fbdad21f07763ff211a8233aed2ebad8e6115b1 |     
powerpc64le  |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/8459c8eded1e944075151be12c6fcd2cd6706016 |     
  mips64el   |         rtptools-1.22          | NOK | https://autobuild.buildroot.org/results/72f5caac4b345d9be2d5b2d31782052e4e8c632c | ORPH
    i686     |   s6-portable-utils-2.3.0.4    | NOK | https://autobuild.buildroot.org/results/754f0fdfee15579d082997abc2fb1f7469abd1cc |     
   mipsel    |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/24b0b70eb582284ce0f7b25e2becef5fa94f0ed5 |     
   mipsel    |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/0884221f02129ec8940323d4be61ca0d9e9b1c64 |     
    i686     |       superiotool-24.05        | NOK | https://autobuild.buildroot.org/results/57441fd02b7d4e2a4fe9f83f7c399411726017ea |     
powerpc64le  |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/4d615386b3cb80a6aca935bcb54c7fc6f5f625e6 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/c356e20c400d7acc66094c863a8c2c54c76b80a5 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/e2fb4a2b0618f380a5b281f2ae4a44607ce06215 |     
  mips64el   |           szip-2.1.1           | NOK | https://autobuild.buildroot.org/results/5e400d0e13480c58e8b1b0178bf7e5537dd31751 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/ccabc1cdd2e2308c23c128268821f6b195b62155 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/8076c8d08d8f7901eab1ebfd161713774009d3bc |     
    i686     |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/a80dc752287e6335c4f8be90ba519f3d92a47cec |     
    i686     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/479cca493112e5ee0d084a07bda9003644c34758 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/66689237b52cdc2927a29ebf9702a7b380cbb847 |     
    arm      |            unknown             | NOK | https://autobuild.buildroot.org/results/3e1cd2e17e5e27acbd91c35b480f3f94e3ff8dae |     
    i586     |            unknown             | NOK | https://autobuild.buildroot.org/results/f50a29cd6d84e2760282574f27511a947176c4ce |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/73fb626b7332cd7efd78336fae93c83516f2dbf2 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/2474bacceda86687ef61d647a82a5d397bdaa305 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/6c605e0d3b775d1367436fb294ea8d0cdc34fc1b |     
    arm      |      usb_modeswitch-2.6.2      | NOK | https://autobuild.buildroot.org/results/8c4e855c53b3aa989a7d990e46b7c9b5b6f868d7 | ORPH
    i686     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/5bea472971a9fd461c95c021bd2118276251d834 | ORPH
    i686     |       util-linux-2.41.5        | NOK | https://autobuild.buildroot.org/results/42e02ab75b8751b98a424bb879673a6ab0f642df |     
    i686     |        valgrind-3.27.1         | NOK | https://autobuild.buildroot.org/results/92dcc05b679fd93a7393b62dfecf6f13f0487ae7 | ORPH


Classification of failures by reason for 2026.08.x
--------------------------------------------------

        edk2-edk2-stable202602 | 1 
      passt-2025_06_11.0293c6f | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/435051d315efe513fa62e4f37fbab7ffcdbf3bd5 |     
    i686     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/7bfadb5b5db2e5b6f8fd642da5234fd645dcdb25 | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/e2053ec958ff37ed1980f1231b455127cfbc697b |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                  ffmpeg-6.1.5 | 1 
              libgcrypt-1.11.1 | 1 
               valgrind-3.24.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/05644963cde529ca4e22206b9baf636e187e6363 |     
  riscv64    |        libgcrypt-1.11.1        | NOK | https://autobuild.buildroot.org/results/ab12a796a8c333bdeac5da7d83e8afd84ad06e5a | ORPH
    i686     |        valgrind-3.24.0         | NOK | https://autobuild.buildroot.org/results/06b0d2c3ad872ab2c72f85b8eacae7de0a2e1bcb | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
