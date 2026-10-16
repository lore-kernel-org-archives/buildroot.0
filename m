Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10C19CC6B38
	for <buildroot@archiver.kernel.org>; Fri, 16 Oct 2026 03:48:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 825194090B;
	Fri, 16 Oct 2026 03:48:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UgVqywQ7Rgnb; Fri, 16 Oct 2026 03:48:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 82A8240911
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792122530;
	b=NLUw5LWmFked1AUmJ7O7AKrIVdhbVKWp15BkQAGbm2abdy3cF+dxA8YhN2e5275ZgcmR
	 UF9b1RJ2YG+zgqC3UkQZjGHgRP/Ha6O7OTUTUFp0o4UyPG0/prZx17ypTJYbA59KvWCU6
	 ViEIJsGISmJ+lbydONujftlLnMh5QdJQgmEap2S3JAih8QxXnVoTPRr88anJxP1gdRbSd
	 X3K1aqyMi0xFe2jCAGFABaAy9RCpe8FT0rUTXdrLs0++gWkg24xyxPuItiWFxyO/6WlkN
	 oaK3rFrUbo/kRESEqcb2wq/bLkVmlracWynUIBn03pQGoVhLqarW3V4bDTlvEAw4KEA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792122530;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=f5YFHDX9s0TAfFVapV+oybYw5qiY4R6V7D7DhkBfIOM=;
	b=HjIuh06oNF2TZJJQq4VrY75GGHKeaRaLxLjNwtVAT6a120QUBADgEYjP30ZD2d+t7+Mv
	 RR0pBHxA6CnXD2fxBRz74q0HNfbIY539//rd4L3Ft7FkJZVf845lbNw3VMSlFPmfsm07q
	 M3Dr7uEvHFl6DoZLnqjD3u//yxStNYhA9BqhF+GJZLLPAz1cFPpdjIa2GP7IpG8tSPwyl
	 c4g0CmH9JsIslvfa6k0XDjAXAMT6STvvaYRZJcpTeVePfyYEsJEyQYxuOhAyLaHHfdhtM
	 dQr9JJqOj31Y31v8FCG4FQ6lxNNs4uzEbrz4Udv+6AOyLrul0J1fhz7UnCzorUIwdyA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=mmAYRaOO;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792122530;
	bh=f5YFHDX9s0TAfFVapV+oybYw5qiY4R6V7D7DhkBfIOM=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OqHVP7nruJqEVS+4X4AtIfIpEw7nOcq3XME12N056ZxG9ZvBRsgH3hGUb3EXRb1py
	 aLBY+uPmXdBtXESI7kPWAH8K3QhzwUuTcqjqprXMlazmiUIhsuZ72KDlcGJxmUKREA
	 4xDWSyH0rrzLGLP9xjUpKMCkewZ1tiFLiw3A0yUcWhDVJVGX/M//VqmXtQ90Kiez5y
	 u8SfaX0sxJSFC98VqrX08sCJWNSBAzTDSBitUYJGbtAlap4oGVit9MgyfmkMtdO1G8
	 bFXK63yUeGz4p+ks8UTwpmlqq+x6R0T5FM1EZCBeHOPOr2MjbVPKFPkmOJttBd1gb7
	 /9Cj6v+49zS6g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82A8240911;
	Fri, 16 Oct 2026 03:48:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D0B601AB
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 03:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B61ED40911
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 03:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QkTvPqkeiur7 for <buildroot@buildroot.org>;
 Fri, 16 Oct 2026 03:48:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6B1F54090B
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792122527;
 b=UAMUvcD1wVDbRKK7Xz62ux0OJl02+v/LMlxuVd9bY6lSXc1GiZl/uDW//2t7Ot7YuUVs
 hxIWpWmjQC1MMHpoVPP+AJdWM4yb7Qqki7xIeTVC6zZWlxxSCHBFzXabMZWx839ECxLrS
 HxybsDHQV4FtGStgo6Pe0OyGO2aJHzJeqkDOuvx/UDhUds6zkTPWnEmGBX0ivxw+uEcHC
 oSbsVm9I+y424ynh54pB4rkMfKDyWN9C5aDD6GBfblYrawGDs4Z3+lrcTie+EHAhgM7kC
 z6hqhGy2unIb3VIKTTpUSmkDncddNV8vJ4EO/FQRtpi6FLCsu+Ib3yo3qdWrv0lFHpA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792122527;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=/E7E0fjYYbhmFDtUdoSWzGN/s0qNPuL1qn+7Xl0wPpI=;
 b=Zd9rELPUSbREAUm1OCNSR1j8LCflrwEQFpwQe8HtJlaXKpPazAHV4Acq28xzU26RSQEY
 EeasiZu8oU7AgjiyHVL0mDuXZYfLZlkeWGe1GQNNzZw3jeGph1JRxRtxz8nlgOFQJnwf6
 GvaStVSCZTW55zhGSpfva4P8ahqAQLi+1dmanq5ZJAJnS79SDZp6RuIZlyjlxfZ+pfNhM
 RFYPw9+ELzpCFtlpMPpMiNa27kc9fgVqOWEHow2o8yj0kk+lOIhCb9SNIEi/2y1KZrg5I
 f7X+JdSn38hOLU2Zt8KoRn7cTKziwG4ulmSu16bhf9sJFb9D1eRXruLWvEH5x5WoRFA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=mmAYRaOO; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=mmAYRaOO
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6B1F54090B
 for <buildroot@buildroot.org>; Fri, 16 Oct 2026 03:48:46 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a172eb31f0so52721755e9.1
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 20:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792122524; x=1792727324; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=/E7E0fjYYbhmFDtUdoSWzGN/s0qNPuL1qn+7Xl0wPpI=;
 b=mmAYRaOOOCdEOiM/kMmMMIHRf7AgQ08kmnmqC+PAECeMb2Am7IJds3yBVZK+nC+oVy
 HRXpDCD5MRiJGuvVmlBuhFXorVCrlBdKbRwl4O9cGfG6eisFNyVoLiQm8NVSi9Vf29sB
 A64JRVoYLF8qdbIV38D6CEyZaSWcHIV2A1G2mNBZ12eE8XRpYp+s7quotZ9kF2vL/NDi
 buseJik/xvmY26m9jHT4bcUHNKDAY4FLhrkMxxrfHPx92spbjy5L4cZwojipS0hEsoL1
 ZHYJmOuY4lHu29/h948jPxdRTZSzScJ/xOau3gmX9cfVL95d6HAW3o+0zNoFC+E7r20T
 XnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792122524; x=1792727324;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=/E7E0fjYYbhmFDtUdoSWzGN/s0qNPuL1qn+7Xl0wPpI=;
 b=jT4ocwhkXqdERBQpfNHKndaHI3seX38qBv7PbHJMk+D52nX6ANNSZN3CtaF8Bu0dhh
 O1kBOdEPrro9kLQefEnb2AXwRFt7w5qN+mvkCJ0i3sQHG8wL/tlW5OxywMUXEsjSCkcp
 jw1HQajPxQhsJSOEpgCJp1rb2GXWViG2+tMNcl7HJ9yBrq/JvA2LGqtwzTSxo5v2ceH2
 yAdQxF5o/lUk5zqQUf6LnZ+A8J5Cf82q0aYZhVKkjxFHcP1XJXgNKs+PX9JDDN++MQY7
 nVQSY/EchBO9C969d7mTVJIRUw0hs6Ddd0Laa/ngGXc4+vpdQnDS1oo4ofLEmy70hmNi
 Zr9Q==
X-Gm-Message-State: AFq9FYJgNDjTSqbAJNZFVFWLDAUI3aqbyMDHXq55oTIa20vbE55LcSVk
 LuAXEa7J84Up3iOAgxm6GAVxSXB1k4BQbl49gzinpQo1hxioViF6MR2zAPT6GkZR
X-Gm-Gg: AYBFou3q63ZyoQdTq6tGGl8oNsllAzSg2ZqdPQYM+Jjrly788nUo2OWGsWfphPe96Ay
 mxTj+kz0p9JHWIvt7Hh+E+rymvQDmkpH5qyw4nteWhMVidBji62XLBtA4hK7src1ijvvjVUa713
 V6nY8Iy1dmiDTskyMIAEXZ8FIFji1RWhpnPNsOLgfcpCsXxVWHDERs8hgSuItZw3QN1Wne5xA9l
 ZTJ39L1mV51kMMXr/FA0XqSnNu9XJu+ZeZwTJct6YkByNjYydnzACrcywplueTdMqzGSXiyTmHx
 iDOXwPkLzVFkBmzHba07XrsCPC9BGoWebaI7WPbZxdzvDjVxwyRLtq2aaAxDrAliI5klqwHoMNj
 B7WNrQHViCoU4n5iT6QxqRRW3iTggyek2C9FvDHIhi7vTfm1cc9i14+Y034TrV3LJQfEKaZrAvg
 kxjK4WKbVVkQmWGOJ6em767/cVM9lMdu4Hs4DTX+8N7JZA8TL8FkJ/3qo8txUQY0bohAMFQpigu
 a5NF1xUi3Dk
X-Received: by 2002:a05:600d:1b:b0:4a1:9661:14b7 with SMTP id
 5b1f17b1804b1-4a196611b9amr308448545e9.32.1792122523618; 
 Thu, 15 Oct 2026 20:48:43 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a1cbedb6f7sm21359735e9.2.2026.10.15.20.48.43
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Oct 2026 20:48:43 -0700 (PDT)
Message-ID: <6ad19e9b.2bb6edcb.6bbd4.6a03@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 16 Oct 2026 03:48:43 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-15
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

Autobuild statistics for 2026-10-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  5  |  7  |  0  | 12  |
  2026.05.x  |  1  |  4  |  0  |  5  |
  2026.08.x  |  2  |  3  |  0  |  5  |
    master   | 47  | 161 |  1  | 209 |

Classification of failures by reason for master
-----------------------------------------------

              libmodbus-3.1.12 | 15
host-gobject-introspection-... | 12
             dahdi-linux-3.3.0 | 8 
                 libclc-23.1.3 | 8 
            host-gauche-0.9.12 | 6 
                host-odb-2.4.0 | 4 
        ltp-testsuite-20260529 | 4 
                       unknown | 4 
        edk2-edk2-stable202602 | 3 
            gdk-pixbuf-2.42.12 | 3 
            host-go-src-1.27.2 | 3 
libfutils-c326ce0cc2a735438... | 3 
   openvmtools-13.1.0-25218885 | 3 
                   perl-5.42.3 | 3 
rtmpdump-6f6bb1353fc84f4cc3... | 3 
                 systemd-258.7 | 3 
                    attr-2.6.0 | 2 
             batman-adv-2025.4 | 2 
                   bird-2.15.1 | 2 
                cryptopp-8.9.0 | 2 
                   dante-1.4.4 | 2 
              erlang-26.2.5.21 | 2 
host-am335x-pru-package-5f3... | 2 
host-google-breakpad-f49c2f... | 2 
               libepoxy-1.5.10 | 2 
                  newt-0.52.25 | 2 
      passt-2026_07_28.f8df3f1 | 2 
                    sbctl-0.18 | 2 
              tailscale-1.78.1 | 2 
               tcf-agent-1.8.0 | 2 
            18xx-ti-utils-R8.8 | 1 
             alsa-lib-1.2.16.1 | 1 
                   ccrypt-1.11 | 1 
                   dbus-1.16.2 | 1 
  distribution-registry-v3.1.1 | 1 
      docker-cli-buildx-0.25.0 | 1 
                 dovecot-2.4.5 | 1 
                  dpdk-25.11.2 | 1 
                    emlog-0.70 | 1 
                  ffmpeg-6.1.5 | 1 
                      fio-3.42 | 1 
firmware-utils-c42a3bc53da8... | 1 
google-breakpad-f49c2f1a202... | 1 
         gst1-devtools-1.24.13 | 1 
           host-cryptopp-8.9.0 | 1 
    host-mender-artifact-4.4.1 | 1 
host-python-types-psutil-7.... | 1 
 ibm-sw-tpm2-rev183-2026-08-26 | 1 
            igd2-for-linux-2.2 | 1 
                   iperf3-3.22 | 1 
      libabseil-cpp-20260817.0 | 1 
libdill-32d0e8b733416208e04... | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
               libgpiod2-2.3.1 | 1 
               liboping-1.10.0 | 1 
          linux-5.10.254-cip72 | 1 
                linux-5.15.222 | 1 
                linux-6.12.112 | 1 
         linux-headers-6.6.158 | 1 
                   linux-tools | 1 
                    lua-ev-1.5 | 1 
               madplay-0.15.2b | 1 
                          musl | 1 
        network-manager-1.58.1 | 1 
               pulseaudio-17.0 | 1 
       python-dbus-fast-5.0.14 | 1 
        python-pymupdf-1.23.22 | 1 
python-remi-2022.7.27-37-g1... | 1 
 qcom-db410c-firmware-1034.2.1 | 1 
            qpid-proton-0.40.0 | 1 
                 rtl_433-25.02 | 1 
           uboot-tools-2026.07 | 1 
        udev-gentoo-scripts-33 | 1 
                  unifdef-2.12 | 1 
x264-baee400fa9ced6f5481a72... | 1 
        xcb-util-keysyms-0.4.1 | 1 
            xlib_libXau-1.0.12 | 1 
        xlib_libXrender-0.9.12 | 1 
             xlib_libXv-1.0.13 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/b168533e33aad5ea574d818d10b6476c4593eb6e |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/0fde275e275f22c0de407605922799f87e43fead |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/6df2c0251dc3fc3b6a8301e1b777b3e387b1cabc |     
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/4217d43107b0a749d835dcff59bb00c056bf24e8 |     
    i686     |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/60cce2184b0d05da84539222e5ac0dd08de06952 |     
    i686     |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/eae0e422683723ff0796a7922302e885bcaecec7 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/e1f12ed84af6a4cd27621aaad038053f29d61ee2 |     
    i586     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/8d8902fd7b3bef9e88210846e73ef64a1bfaf96a |     
    i686     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/2acfcc8bb35388b1086dcd4e9cb2d39b994e5f6e | ORPH
    i686     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/19dad0e3555c709447c5c548217ced63771168a2 |     
    i686     |         cryptopp-8.9.0         | NOK | https://autobuild.buildroot.org/results/2e2add403f6b0f85185c2b1eef11d06330e02cb9 |     
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7d2b3fca556e929604a0e131ef24bed5551e27ae | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2154eaf751d66ad852635fb63e1453d840157ad0 | ORPH
  mips64el   |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/277359b81b4a1f0dd8702fa454486e615f7bbe16 | ORPH
   mipsel    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7cfe5acbf3a02269997c0532b7b99637d9a73b65 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/0b095d9f56bdc221c1b8171cb90ce023aaeacb07 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/63ad1c39c84125d11a7d19b1d746e499d910711d | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2e648ce63ecc22400946fb2f928c5c2aaecf4227 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/44626901232a8d2eb7c24d2bb42e387d889fbbac | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/4be719e131f87e47df59f338d4317c350cbe8765 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/c7f4cacdd9aebdc84decefba942f20bc1e198a41 | ORPH
    i686     |          dbus-1.16.2           | NOK | https://autobuild.buildroot.org/results/b6aff86500e746d145606afaf68bdd0a55fb99a0 | ORPH
    arm      |  distribution-registry-v3.1.1  | NOK | https://autobuild.buildroot.org/results/7534211959577546c3777939d11e411d8a417baa |     
    i686     |    docker-cli-buildx-0.25.0    | NOK | https://autobuild.buildroot.org/results/7df43e9717bde575d7ee87d4264d45e56d8b4085 | ORPH
    i686     |         dovecot-2.4.5          | NOK | https://autobuild.buildroot.org/results/a3b7dca6aa9c44857d1fabd8f3608b842173739b |     
  aarch64    |          dpdk-25.11.2          | NOK | https://autobuild.buildroot.org/results/6d5093fd578234169747b8f68a4875ba3b0410b9 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/e7da9becdd3f65f9dc89ba476d9e11d1de8fc9c3 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/18f135fcff8ddf448f428017abc1ddca016c0c10 |     
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/b411b5e0a01db7b9193b1254479ccc18657243be |     
   x86_64    |           emlog-0.70           | NOK | https://autobuild.buildroot.org/results/4ee65bf0b1235b308197a08595783a9b178a21ef |     
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/633010bc9429341d167ba08b00ab1f9375f940c7 |     
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/1b12dc0f25467af5821a34f48cc817aa93bd86be |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/3bb17faab6ab9a4095594af268ce5519ec07d5b4 |     
    i686     |            fio-3.42            | NOK | https://autobuild.buildroot.org/results/cf735cb9be3f2f9f2c9e00ed76ead77efb93bccb |     
  mips64el   | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/65f795a6615bdcccde76ec6079608b418f049cf7 |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/77a078b8210ebbeeed085504b6f141b843e177ba | ORPH
    i586     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/fa6bdb9394348f02f097879390f2a8ff25b057b1 | ORPH
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/64fc65999e6fdb029a9086929215b1d008cfa9b7 | ORPH
    i686     | google-breakpad-f49c2f1a202... | NOK | https://autobuild.buildroot.org/results/9dc4324797f1d668d6c36676a65ebd6db99033c6 |     
    i686     |     gst1-devtools-1.24.13      | NOK | https://autobuild.buildroot.org/results/96e55b2f28678dc82ff85ca12bc339bcf91510a2 | ORPH
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/cea0912d106c4aee8280c7e9904f92774034f074 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/104d38558e880829acde929268d4caec36dc800c |     
    arm      |      host-cryptopp-8.9.0       | NOK | https://autobuild.buildroot.org/results/ab5a70f8d0092c9e5c59d418eb68659481150849 |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/1cf2d060f5e7a7b72c772fedaa4102820735f99d |     
    i586     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/b0e6cd78c92abbdab87622dc9e7541f56ac09a01 |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/7e0e3da2d260b14efa581011ed23ee7f8b0e3ae6 |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/7704c116f5bc8c0a7897de98d2a5ca7ee4e3a026 |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/161e793ed6b877dc1d9051a4b328c4480ec3d349 |     
   x86_64    |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/7e857b0784c2b6c98f767978f511b47b7bd11fda |     
    i686     |       host-go-src-1.27.2       | NOK | https://autobuild.buildroot.org/results/9a7b44b597fa7a1be9b816ec04fb2a9fb9c8dd2a |     
    i686     |       host-go-src-1.27.2       | NOK | https://autobuild.buildroot.org/results/23b073cde4cd52160515dff66926e6e96b39155c |     
    i686     |       host-go-src-1.27.2       | NOK | https://autobuild.buildroot.org/results/3459f232270df1ab0a83a83f02ff93eb543bd1f9 |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/ef2edb357c6c96bd591532f4b0c86a7c2161d626 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9e041d265b75862838ef28a9f89572d803f53cc1 | ORPH
    i586     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d700c691d22571eb32539353ee05b993e95083bd | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/24d444be600ed1c75cfe9f0aba6e8543d4f73004 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/822b0a2926dd0b9995b41fc98514db2cc5d721a9 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/69c8a64b32a425994072efadfa3b91c4bc3519f5 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/6a891a4e714d4709c68db56900005471be1694d0 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/b52ff2c0c8958f4a97f6e1527e74af41f1ef78f8 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/923f089a8bcf962b93fd9806499996afc44a5bf4 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/21016addfe90754025c8c5189175bd2dabd3bd6c | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/7b71fb532f8c654987c53b5a03fe3c6455a27ae4 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/15af9436e366033c8b586b0a3ccd245275ecddd4 | ORPH
   mipsel    | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/ab1468d9cbf493a2e385219469b52b728ae5363d |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/be0b05265eacaf5a9e7a2d703b776d5ccff22f4f |     
    i686     |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/5b229c7684ce2cf5cb81c82c888330d8c1bfecf9 |     
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/b7a4eeb12e6f81a8a907361c96fd76a81dc68502 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/7fe3d05a27600fd3c940a85642f621f586b9b25b | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/db08d5e3362b0e1340a8ca2ba6762142f76c314e | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/1bea59709ff088401a246b1411349c0575c510c6 | ORPH
    i686     | host-python-types-psutil-7.... | NOK | https://autobuild.buildroot.org/results/84c00b70c7a29cde780bd6a8318aca84599ad05f |     
    i686     | ibm-sw-tpm2-rev183-2026-08-26  | NOK | https://autobuild.buildroot.org/results/c2c79717a30f5df50b5f4bf0ccdff3c698a20d4e |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/c64f040fff5a90b25aa443fa7a8dcffc20d29686 |     
    i686     |          iperf3-3.22           | NOK | https://autobuild.buildroot.org/results/a4838f5ff640692ae9db43192bad6c7a219b62e2 | ORPH
    i686     |    libabseil-cpp-20260817.0    | NOK | https://autobuild.buildroot.org/results/bc351d1f58e9110389523e75f96ea749703e8473 |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/5909413ef95deb0bb912b9998feda3414c071e73 |     
    arm      |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/4d1504942ca139936c876a75f668ebe8eb47fdb4 |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/111361fccabc8403ce3ce4be7dfd1d56aef7b480 |     
  riscv64    |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/ef97709480c9280e5efaeccb1e40a3c4486bd1e3 |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/1feaa67d5a4ef3c7f3a1d2381ac869522a49a143 |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/d6fc0e496175a1c7696d726ef704bd30ffb483f6 |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/72c3cdd0f90227258b5a72bbf0bd0bd774581a93 |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/782561d5e3cecf9bc54f42861b24d83a8bda6ef1 |     
    i686     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/7daab9704e0773448ffdd83c56f6b081181d816d |     
   armeb     |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/a7da4cb058f9b0fbe5be618524fb375e61f5b0ef |     
   xtensa    |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/ea3d10cd7ca21bd8653e7f209cfa5ccd2888806a |     
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/5e7995470aed607b3dfba9d3c006deac0e002815 | ORPH
  riscv64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/a07b5577ad0b47510250f216255867a2be17aaa3 |     
microblazeel | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/e603eabc5f0600721be20bb76e8f12572bc0469c |     
   x86_64    | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/4a59954e12ac305b5d32b84ec7a0213aec333bc9 |     
    i686     |        libgpiod2-2.3.1         | NOK | https://autobuild.buildroot.org/results/2d0a7a9316381b977f2c98da177a2f0f31ca16a8 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/b2ee780f8ac26063842b2a8a8205feac54c18772 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/c51f8ccccdd07bcc32c5b0a6b21759540f340cbe |     
loongarch64  |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/8b49b7bf33da4ccb644fbd689cc9f0e8993f960f |     
  mips64el   |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/ddca12dfa6030e044b791cb5ea36e8f00cd8060b |     
   x86_64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/2357eabd72879ae657c137ea51c33a0e2b5a7d4e |     
    i586     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/3dafa95d40854296943f7f4327e73e8cbbec6e7f |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/1afcb324879f5e206d174ac4cbf3bcb5d6caebb3 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/6a41b4eef17c33cafc2fe72abf334e0ca6b56cb0 |     
  riscv64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/d019bb198c3af9ddef6d2f47006f98eb4ae7978c |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/aa6bf3fc5caaf1fad8a8ac35c99638baea8ee4e8 |     
   x86_64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/4b49fdabda768c977dbd87fffb417bbc6e517258 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/11f3c460407c816d9829f101f0ee55e4b03965cd |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/9c8cdb75728bdc1343eb1cc3431de1ccd4d46701 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/ab1b20085793218c1a6b4cb8f68dabbdd3ff5b47 |     
  riscv64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/42e2fbbfc021a3eebe935e0ae60d2086e9b64bdb |     
    arm      |        liboping-1.10.0         | NOK | https://autobuild.buildroot.org/results/628ebf8180766b151a400a2324101e42b1dd3b4c |     
powerpc64le  |      linux-5.10.254-cip72      | NOK | https://autobuild.buildroot.org/results/482e8d53747c17c64e5aad5899a06387f4958293 | ORPH
    m68k     |         linux-5.15.222         | NOK | https://autobuild.buildroot.org/results/bb11029dc8d2cd6bb6d40770a31c0d88d37262e7 | ORPH
   sparc     |         linux-6.12.112         | NOK | https://autobuild.buildroot.org/results/975f3aa00ff27eab9afd1308375d53d0f900a9f1 | ORPH
    i686     |     linux-headers-6.6.158      | NOK | https://autobuild.buildroot.org/results/a36c10f5c6e86bec2c21b38d27e4a9416111f381 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/271f6be4feba3c85bebd86e8110c2fd0c59f2ace | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/f183096a4c4bc8d39faa10905aea40f83088fa52 |     
    mips     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/66c89c98e3157eba54982d0371d2527b6dcb1a5a |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/068c2bab1a9c773b433551e17a2d5819467ba35d |     
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/aef0704d37c756a3dd6f05eff17fb7d555a9f5c9 |     
  mips64el   |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/0b2f9b9e992f9532430e9a096a17cfc8a104179b |     
    i686     |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/31b788fa73d75717c8b5723f34a6778902760bf9 | ORPH
  mips64el   |              musl              | TIM | https://autobuild.buildroot.org/results/5e4915838d1ea312e51dfb49523ca28bb07a0825 |     
  riscv64    |     network-manager-1.58.1     | NOK | https://autobuild.buildroot.org/results/c99eae62d2caefbcd71659d0c6abb4b3c3b07390 | ORPH
    i686     |          newt-0.52.25          | NOK | https://autobuild.buildroot.org/results/bee678304eb818b8638a91370f62959b86cdc945 | ORPH
    i686     |          newt-0.52.25          | NOK | https://autobuild.buildroot.org/results/6d9a787de82aa606f66afd5fcda4890bb98ec58a | ORPH
    i686     |  openvmtools-13.1.0-25218885   | NOK | https://autobuild.buildroot.org/results/f3f44922b4a57cdc22b8737e3af0a44981c9f1f1 |     
    i686     |  openvmtools-13.1.0-25218885   | NOK | https://autobuild.buildroot.org/results/7f6ef233437849daa309dad5d2351425224b5837 |     
    i686     |  openvmtools-13.1.0-25218885   | NOK | https://autobuild.buildroot.org/results/625dacae508bdb0dabe9f7ef20084b25cb264270 |     
    i686     |    passt-2026_07_28.f8df3f1    | NOK | https://autobuild.buildroot.org/results/08b2f466c43a106cfffe50f090da0abdba7c2eaa | ORPH
    i686     |    passt-2026_07_28.f8df3f1    | NOK | https://autobuild.buildroot.org/results/52ffabb9e0b875a490fd085d0263120f1d3dd171 | ORPH
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/583087b41db26f3a8aabf9e06fb2977f5ac123e4 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/efe90c2a79686688a207deab0c9eba8e4f288b20 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/d785925283045244774ec4b92e7a97c9fdd7b579 |     
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/a96fe2435be507a03343c5f41a93b18a8899324c | ORPH
    i686     |    python-dbus-fast-5.0.14     | NOK | https://autobuild.buildroot.org/results/acafbc3a71789a1d864be6684a360dd8ea9cdb60 |     
  mips64el   |     python-pymupdf-1.23.22     | NOK | https://autobuild.buildroot.org/results/dda25174c57b5faa6837e9b073b8d2d121f57726 |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/2d2dc0b9f6ea3aafd5e4e0636f49e95cf736274b |     
powerpc64le  | qcom-db410c-firmware-1034.2.1  | NOK | https://autobuild.buildroot.org/results/1f5a52921f3c41bb69ec8c9abec028cfc7d73c15 |     
    i686     |       qpid-proton-0.40.0       | NOK | https://autobuild.buildroot.org/results/eaded9bf5dd475c144cebdea5340d73fa0a594a1 |     
    i686     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/d721ef6be3d6869950c90ea4000b96af1cc11c82 |     
    i686     | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/aa5508251304465f9e103043192c1a87015c8f75 |     
    i686     | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/3e78d3e95055ff143414287d20b26840dbd2651d |     
  riscv64    | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/e5538308ce29736e0e5bff40b0730103f1c56a32 |     
  mips64el   |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/1cea1f953d3adcb7e80c49c83422a6b8fdf89b16 | ORPH
  riscv64    |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/95bbb02454145dc3791f8b3742c349af315355a1 | ORPH
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/afd5b0f2a5ca9c19c08d1531fb5c39611950c8df |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/159fc841d52612826fe665bbc4fcfaebacf5d299 |     
    i686     |         systemd-258.7          | NOK | https://autobuild.buildroot.org/results/a9841795d8e79cf85892487a47824095d0702b2e |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/9c06615b2e2ba7d349b9102f31b9d8af6cbd5a95 |     
    i686     |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/89e1121595227e88cda970fda64ae40b124d4611 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/4558b8d9b867d8586fa536287b823159d843998f |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/df4b734dd67b411b017092a566a0809ca0af0fc4 |     
    i686     |      uboot-tools-2026.07       | NOK | https://autobuild.buildroot.org/results/b2b8295ca316c104433218602b6948cf7fc1a06b | ORPH
    arm      |     udev-gentoo-scripts-33     | NOK | https://autobuild.buildroot.org/results/62704aacd7af77031cc22a4af6733b4d471b5d81 | ORPH
   mips64    |          unifdef-2.12          | NOK | https://autobuild.buildroot.org/results/6668e930e1cb156349313785d7f17fb3faea4e01 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/a81647d1f47c34808555bdb9a5d29ce68c9f19db |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/ad002b5d06ec58ba4a54617f23be586fe212545f |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/4ce5d9af24f0e99a5ffc479edf26eaa2f78627cc |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/150683c9b44da3268f7e661e962c0eee4ca36423 |     
    i686     | x264-baee400fa9ced6f5481a72... | NOK | https://autobuild.buildroot.org/results/17a87e7c3633abb03fbc49e20c0e2b4ad2a51441 |     
    i686     |     xcb-util-keysyms-0.4.1     | NOK | https://autobuild.buildroot.org/results/ead4bea6214688703c80f3cafa494b3525ad58f3 | ORPH
    i686     |       xlib_libXau-1.0.12       | NOK | https://autobuild.buildroot.org/results/252a1e8ca887d68140e02eeb4105d3e67dbcb2a0 | ORPH
    i686     |     xlib_libXrender-0.9.12     | NOK | https://autobuild.buildroot.org/results/e8369d0d6e027756abbc4b921c73afb62b7031ca | ORPH
    i686     |       xlib_libXv-1.0.13        | NOK | https://autobuild.buildroot.org/results/1e2995c5d48f60ca8c2809b66bc0810a0967c169 | ORPH


Classification of failures by reason for 2026.08.x
--------------------------------------------------

docker-credential-acr-env-0... | 1 
              host-rust-1.97.1 | 1 
            igh-ethercat-1.6.8 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/1c7ad4dbcfa04184d064f9c6e08e0fbde20411b9 |     
   x86_64    |        host-rust-1.97.1        | NOK | https://autobuild.buildroot.org/results/081039fbe70e45998c96ab85169fdebd5bd4894b |     
  riscv64    |       igh-ethercat-1.6.8       | NOK | https://autobuild.buildroot.org/results/fae86929ffc1ea46da6122c12f17d005d474599e |     


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 3 
                   perl-5.42.3 | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/7126c668717ada38c1f7f75ee705cc58a0774254 |     
  mips64el   |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/39e5036baa880ef47e5fa2550b0df139e212e6be |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/626072598e368f5f5f6c4a3fb9251d1aa8452bce |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/a303e42c78f8bb8ab57f36a3ead094a17bdceb26 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                gesftpserver-2 | 1 
            host-go-src-1.26.6 | 1 
host-netsurf-buildsystem-75... | 1 
               libevdev-1.13.1 | 1 
                memtest86-7.20 | 1 
package/wine/wine.mk:347: w... | 1 
           python-numpy-1.25.0 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |         gesftpserver-2         | NOK | https://autobuild.buildroot.org/results/dbbb03995ce9f6e12790e50fd92bc24b44aaa739 | ORPH
    arm      |       host-go-src-1.26.6       | NOK | https://autobuild.buildroot.org/results/3035e76f45e5e86bb41727faf185d33ed5cc36bd |     
    i686     | host-netsurf-buildsystem-75... | NOK | https://autobuild.buildroot.org/results/3bf60edbfafd4a1197869598fd0126cab722336c | ORPH
    i686     |        libevdev-1.13.1         | NOK | https://autobuild.buildroot.org/results/ceff9fb6b929040c01d96c0aa26fd011d6a12e29 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/fffa2f792986232f934302a73a8790c42feee055 |     
    i686     | package/wine/wine.mk:347: w... | NOK | https://autobuild.buildroot.org/results/4e1409ba515e79692903029ddfebfd7aec2dfe67 |     
    i686     |      python-numpy-1.25.0       | NOK | https://autobuild.buildroot.org/results/424624b63bf46b40ea6a114d9b63e765d1ec7cb8 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
