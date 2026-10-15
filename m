Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE58CA9EDE
	for <buildroot@archiver.kernel.org>; Thu, 15 Oct 2026 03:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54E62407F5;
	Thu, 15 Oct 2026 03:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ciKix5_zdFA5; Thu, 15 Oct 2026 03:32:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E8EFC406ED
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792035151;
	b=j20v3frbk+t60itJ8pOB3ZJIBKeFsSnKJUxKkzymHaQN0XuZGpMp9ETqzcoieWvRENYn
	 xsZc8mBFqPuKusBIPaN//ScTvT5STvFkMQCHlWb5p6g8usOqGKHbTM7zpHe5UYxF2VbKH
	 p4ioDEYCpJBVrPj47fkLWgg2+TWAIpWKFxOz4ig7zo91wWv0SBAEK/XVYTOv2aCcE0MXO
	 dwK+Sa9NkA/IhvXEBRUdhMoudzLCmrCICOnCNnp0P8/kFc6x8oWTgnodGQfsYB65C4qbs
	 OoGFK0cAUuLQh2Vej5GN6O46U6v5Qq1wpiM7CSPemqG/uguXp7vD3Gn0bMehYwhwJHA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792035151;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:Message-ID:MIME-Version:To:From:Date:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=4jEzpPyPf8CQR71f3mEvSMMxlWN6ZQ9vwGRBwN6Qxuw=;
	b=AS0MY4lBPLpWl3MFfX32fkKPXAt/a2RdJIAQpEks389C+UIkTdMCuvnyyUUHfMdMQ0Vm
	 QF7wCObPUwdWpv1c0AlbOyoUjZi1RLmFMFLUW/hHd7QVqNu+wO9Ow1kbEDhIi7bT6vMI2
	 JLSaDSAEnr0/ZIRukMtGvLOTilOrPxzGvsycJsq0XwQ+L+31gAr3YN/x/6j3M7AGAev9H
	 RMipWqFOdmqxX8ZkSjBng0S6HJFvQUMksjzD1jsffNBG5Tgt1ojaVzPt3RZSZFaQExVgH
	 TRBmhpHg+it7w2Lwb2j2SN96L8OqMLk/djGlkv0RlysdYHKU4f4zH31MK1ocG9+MhNA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="lYjmp/PS";
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792035151;
	bh=4jEzpPyPf8CQR71f3mEvSMMxlWN6ZQ9vwGRBwN6Qxuw=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=krZlQYzryVpUGOC8KzDitVyEjIMcMdW5fRrrkN2vx35onYSB7NqxpHln6qeH5frZC
	 yhgO8SANfatT8kw0CVcmKmfVffB8028DWeMZFu4Pn5WVgljNUQC+ebBhG2DmojzbtJ
	 rH48wEN1t5cSQyYYITjst45fUjvuu+yL8SNJICKkOh+ccBwZBd+fudsldAqAIeTPoZ
	 ZBMPCsCajuUe7ffKEL8tZiFuMHvDWR6GMYXBfrmGGkTtdrKMV1GmcvkNPEabdsOaRO
	 VV0FcHV5vbZgr+gbsHo65QNoe3dH6thaMCnC1zitlEwlriQz+IpJ/1JuuaeD+2KEdy
	 gmFWyUI/FQanw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8EFC406ED;
	Thu, 15 Oct 2026 03:32:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A46EB255
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 03:32:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 968C9406ED
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 03:32:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b22prdjdkVbP for <buildroot@buildroot.org>;
 Thu, 15 Oct 2026 03:32:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org F1D5840674
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::430"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792035147;
 b=poKGWcmyUwlEP0bumia0ku6s4S0mHQhiPrUNEIY0aWsy1QAtGeMaJlXrMpq9mtr/gYVb
 jtla+JzqgYUd2toqLlg8JQaQvAaIyumdJTYES9Ypsycvlor/pKzgZdhJOc0x3V3lnhDYk
 zxZXuHo+35OsO1S9MgNFPQ1HiaTwbzvAkg2LjjfNj7xU11ShaP0TZK9xCX+PgGEbWzDOC
 LpZz3OJzilcXvrZ/rw7+SC/fmZ+54mtfUI/pZD/30AgI6wx3WrAPxIXz35giYd12QYLJc
 eDzG6nds22nNC+n4xqtGclCkERTpR6/qbEzZ71VEbD6wGAtzRxySe03cFMQnUEHBVJA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792035147;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
 Content-Type:MIME-Version:Content-Transfer-Encoding:Subject:To:From:
 Date; bh=GSmR8mYPuksPX62YVoFn/PNTbeoZLFaT2WNpgq5TeS8=;
 b=WKOsRc58zE+l7jm9Kgu0TfXGIsFB3LY7+C7I8HBxzzG32HYJs4Zm3RGwIoNPTcJNVWzb
 4VPS+xb+AqDQPZw+BZ8pHemnptzr/1OPHdRXzeR0rPiy8GeWkwum9a6DMhIzGyCWd1foz
 XTeaqz0nV7uZnMryZXoJ8DsJeCFiUI4IpbKwMdcf+/g23yURCqZuV8hws1Fc4+mvsMFT3
 pRjlCSbL/dDMpRjDJ8/n0iiDk+n9LNdHxQeB4Vqfr6WJHryJSjCs2IHNh33lK+mcoj7kM
 ehD87BWILAmwNbv++lJRHjTp4b57Ub95xutglXSexpk/kwXEF/E38Dd/ThXg7up4Faw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="lYjmp/PS"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::430"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=lYjmp/PS
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F1D5840674
 for <buildroot@buildroot.org>; Thu, 15 Oct 2026 03:32:26 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-48b0584ad71so2846697f8f.0
 for <buildroot@buildroot.org>; Wed, 14 Oct 2026 20:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792035144; x=1792639944; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=GSmR8mYPuksPX62YVoFn/PNTbeoZLFaT2WNpgq5TeS8=;
 b=lYjmp/PSPekWvGpSwAPDsgBO8DEk9CKeLj/PaNXnABrXlZyIhUmw4ron9+/hI6lnXE
 /wv+FlC2Xulf5XLieLIjkNoll88+cDSCs2zYRcwKumz/cdaPeli+Op6TEf5s8yOufbbu
 h1oreGE0QIP2Zi+a8mKVW0hCm/5ZdR7DQwd0n3crUjtcqXWci3zY6h5Vvm+0Wz4i78ot
 PlQSeOpiRPWuZIlBa4tmezFT60w1QjCYdNvIQQc0cWA+C64E+hOCoAJwN+RoDonHS7il
 UKxOACgbWKOYbjSjjbB0dexPDsVcLd8GqmMLB0O8eOhPGGvOio/jyjkzQMFHCcVAAyD8
 Qw5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792035144; x=1792639944;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :content-type:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=GSmR8mYPuksPX62YVoFn/PNTbeoZLFaT2WNpgq5TeS8=;
 b=0Zs1Zgk0JDbUyORuufQJwWfjJYYfApiGYg3lYSfTcducDo4AQL4HOuALTOHuHmhtGj
 gTuVYWPSTn5asu45Z5odlRSHPFSdEQkGquy2NQs239DO2XvsxaxR8WfKeAu7NKxcQuSz
 ezkdOauoXCjAgu4ngmfpYelvSamqbmB1GAl3xOJ2LD+DrDcvig7dYHMX1ll0z6yLnLh9
 AKIGIeEdScTfyb7lUJDxO3JNO5nYx21Ct077iXGgcX8XjmTFU5gGqfI22p7heGo1CoZp
 L3VqZjheJ93CjUYFS9dRyHgC6NrB7i340hNfERloLqIvk1zl9UcucjOtib6tVpNEheCc
 3EGg==
X-Gm-Message-State: AFq9FYJ0Ui/nS3+OZk2HGjWMxJ81awDrEXBE+fCrPDF7p3OZ4RPOM/9M
 wLFNTTXQdoA7NsuqdLEv+TdckJYJMOT3rIq9OnBqdL3GVZSwuGIpXaWTzrYj61+r
X-Gm-Gg: AYBFou0EuF4eL3wf+FZ6wgJBUqBooGMfpa9RPoZ1sxtALWA0fr4jPk5xlsjIPdP6wDF
 zaN4WIikRscWM0BxKcMihBde2fuEn0uk0sufPZKs/IKmG+eWSRCgZk3J0VdpuPmoN+JcsDAOCt7
 Fclyl1Yfa/ky1sRfhbaWcR3Ma/J9+Sjwqz9wEaFiJQbAQs97OtHCSyKQH69kRSlDl0mL7Cc+hku
 iyZPBLAsz6MIt89l766tLYpb9uAY2Y4PRujr0RpGd5X6gEj+iH9Qk9v2Y+qD40KBW0Qh8Y7uHxM
 QfQ4EUKskYXTnh5ThcYJGpXVtgemXi2Z+PBZzUFKTTEkh/Ui5+UcF7ADr9kmk0lMUIrXegXqJx5
 YmLOIsZ1+fRK5rjzKJEnBgJNnWe5OViZ6UJdcN2hpb7jRLp7vK0mFh6OgsOTpW6qCM+imSLYPX8
 HUwb64JCKX3pOXNZNC6vt7eaQiCeL80tsY1TQd0WAOBxFC8E7PV/u9UMI97AkEFRRSQuhgvHQSN
 0CU7E99FK+b
X-Received: by 2002:a05:6000:3102:b0:48d:ca32:e90f with SMTP id
 ffacd0b85a97d-48dca32e9b5mr26620350f8f.55.1792035143895; 
 Wed, 14 Oct 2026 20:32:23 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48de0aaaaebsm16095854f8f.14.2026.10.14.20.32.23
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2026 20:32:23 -0700 (PDT)
Message-ID: <6ad04947.373903ba.1ef52b.31f4@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 15 Oct 2026 03:32:23 -0000
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-10-14
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

Autobuild statistics for 2026-10-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  | 17  |  0  | 23  |
  2026.05.x  |  3  |  8  |  0  | 11  |
  2026.08.x  |  5  |  9  |  0  | 14  |
    master   | 77  | 183 |  0  | 260 |

Classification of failures by reason for master
-----------------------------------------------

              libmodbus-3.1.12 | 21
host-gobject-introspection-... | 17
                host-odb-2.4.0 | 9 
                 libclc-23.1.3 | 6 
            host-gauche-0.9.12 | 5 
                       unknown | 5 
                   linux-tools | 4 
               pulseaudio-17.0 | 4 
               tcf-agent-1.8.0 | 4 
                 haproxy-3.4.4 | 3 
            host-go-src-1.27.2 | 3 
host-google-breakpad-f49c2f... | 3 
               linux-pam-1.7.2 | 3 
   openvmtools-13.1.0-25218885 | 3 
                rdma-core-62.0 | 3 
            18xx-ti-utils-R8.8 | 2 
             alsa-lib-1.2.16.1 | 2 
                    ccid-1.5.2 | 2 
                   ccrypt-1.11 | 2 
                   dante-1.4.4 | 2 
              erlang-26.2.5.21 | 2 
host-am335x-pru-package-5f3... | 2 
                 host-gdb-15.2 | 2 
              host-rust-1.98.1 | 2 
            igd2-for-linux-2.2 | 2 
                libaio-0.3.113 | 2 
                    lua-ev-1.5 | 2 
               openblas-0.3.34 | 2 
                   perl-5.42.3 | 2 
                  prboom-2.5.0 | 2 
   azure-iot-sdk-c-LTS_03_2025 | 1 
             batman-adv-2025.4 | 1 
                  bcusdk-0.0.5 | 1 
                   bird-2.15.1 | 1 
                  boinc-8.2.11 | 1 
                  boost-1.83.0 | 1 
                  botan-3.11.1 | 1 
                    btop-1.4.7 | 1 
             dahdi-linux-3.3.0 | 1 
                   dbus-1.16.2 | 1 
                 dovecot-2.4.5 | 1 
                   duma-2.5.21 | 1 
        edk2-edk2-stable202602 | 1 
                  ffmpeg-6.1.5 | 1 
                flannel-0.26.0 | 1 
fs/erofs/erofs.mk:69: /home... | 1 
             fswebcam-20200725 | 1 
            gdk-pixbuf-2.42.12 | 1 
         host-gcc-final-15.3.0 | 1 
host-mxsldr-2793a657ab7a224... | 1 
           host-qt6base-6.11.2 | 1 
          host-xfsprogs-6.19.0 | 1 
                 lcdproc-0.5.9 | 1 
libdill-32d0e8b733416208e04... | 1 
               libecoli-0.11.3 | 1 
               libepoxy-1.5.10 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
libfutils-c326ce0cc2a735438... | 1 
          libmicrohttpd-1.0.10 | 1 
                libupnpp-1.0.3 | 1 
             lirc-tools-0.10.2 | 1 
        ltp-testsuite-20260529 | 1 
               madplay-0.15.2b | 1 
              mariadb-10.11.18 | 1 
                 openmpi-4.1.8 | 1 
            optee-client-4.9.0 | 1 
               osm2pgsql-2.3.1 | 1 
      passt-2026_07_28.f8df3f1 | 1 
               pax-utils-1.3.7 | 1 
        python-autobahn-26.7.1 | 1 
       python-dbus-fast-5.0.14 | 1 
        python-ml-dtypes-0.5.4 | 1 
python-remi-2022.7.27-37-g1... | 1 
python-types-python-dateuti... | 1 
            resiprocate-1.14.0 | 1 
                      rtai-5.3 | 1 
rtmpdump-6f6bb1353fc84f4cc3... | 1 
                    sbctl-0.18 | 1 
              shellinabox-2.20 | 1 
              skalibs-2.14.3.0 | 1 
                 skopeo-1.24.1 | 1 
              tailscale-1.78.1 | 1 
                tpm2-tss-4.1.3 | 1 
                 uclibc-1.0.59 | 1 
uclibc-ng-test-132c6134d691... | 1 
                upmpdcli-1.9.7 | 1 
           virglrenderer-1.3.0 | 1 
                    which-2.23 | 1 
        wireless_tools-30.pre9 | 1 
          xlib_libXfixes-6.0.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/2e466f0a67d25279e262bf4f18f85c99b8373f0f |     
    i686     |       18xx-ti-utils-R8.8       | NOK | https://autobuild.buildroot.org/results/296b63d63179a10371ec3fa71853fc530fc91076 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/ca329ca0d6c1ad3a61127b97d2109069a1ef0721 |     
    i686     |       alsa-lib-1.2.16.1        | NOK | https://autobuild.buildroot.org/results/0022e9101ca0f458cab1738d1f691f6e17649356 |     
microblazeel |  azure-iot-sdk-c-LTS_03_2025   | NOK | https://autobuild.buildroot.org/results/ff5c694ae0829e58c4357324e376bd422b593403 |     
powerpc64le  |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/fe80dc58feffbf628fea01a2727d832cb0cbe9af |     
    i686     |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/dbe5d2755de09650de255b70ac6fda363127ca92 |     
    i686     |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/f7fc0106edf8e28bdb13f35b14a95ab1c9a00ffa |     
  aarch64    |          boinc-8.2.11          | NOK | https://autobuild.buildroot.org/results/a531d298f9033ca71dc1ebde7b3733a792524fb6 |     
  riscv64    |          boost-1.83.0          | NOK | https://autobuild.buildroot.org/results/082655142c2aae726f0af13699423f406b6cb0d6 |     
    i686     |          botan-3.11.1          | NOK | https://autobuild.buildroot.org/results/07e7925e246f99c9bc46c857ae8b64b36f3e35e4 | ORPH
    arm      |           btop-1.4.7           | NOK | https://autobuild.buildroot.org/results/573e0fc3178f8c9a0583bf86a678caa775410ef2 |     
    arm      |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/8f52338e576d30c5d2150189c3447c9a70796b9c | ORPH
  aarch64    |           ccid-1.5.2           | NOK | https://autobuild.buildroot.org/results/e33b033bd6f99e2f941c6e7a6b1c8509c2acd67a | ORPH
  aarch64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/9f21af205072e57d3fb0da42efa55a8eb8feb8c2 | ORPH
  aarch64    |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/51acc31e809262fe344c583ce04f72aeca75cef4 | ORPH
    i686     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/2a79a8599e527e81ca61e5b38c2e475da325fd5c | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/29426fe08d0a8b7771279a9621a6265eb0fa0b76 | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/f74a0d91bb1ff680b26311de07b60b694dd0686e | ORPH
    arm      |          dbus-1.16.2           | NOK | https://autobuild.buildroot.org/results/cb58ebd6d967c8325b4283e32e6ba24f8a5368c6 | ORPH
 powerpc64   |         dovecot-2.4.5          | NOK | https://autobuild.buildroot.org/results/41331b229fa03c0ad74cc0f1cc81040e722192e4 |     
   x86_64    |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/5b83f4b4e92c748f39383498c5a9758fa1c61c42 | ORPH
    i686     |     edk2-edk2-stable202602     | NOK | https://autobuild.buildroot.org/results/ee48046a598dc831f8633a0227d13d304541e8e9 |     
    i686     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/293d273306ab0f6ae364b8ac873db13beecbc94a |     
    i586     |        erlang-26.2.5.21        | NOK | https://autobuild.buildroot.org/results/2414e402e6f6693f2092517671a4d9dbcf033f2a |     
    i686     |          ffmpeg-6.1.5          | NOK | https://autobuild.buildroot.org/results/bb006c4bdc9573a09a267d875f87e5dfcc7e07b0 |     
    i686     |         flannel-0.26.0         | NOK | https://autobuild.buildroot.org/results/1542872578d66876316d5e469dabea78acbea0e0 |     
    i686     | fs/erofs/erofs.mk:69: /home... | NOK | https://autobuild.buildroot.org/results/6d2f6043c307fdd6529902715b74dcaf8943bfbb |     
    i686     |       fswebcam-20200725        | NOK | https://autobuild.buildroot.org/results/5ce952bcfcd550dc19fc7d79655b7e0cde13cfed |     
    i686     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/ab721608014a1a154750ab7089a4679b287ce1a3 | ORPH
    mips     |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/0b4fc3523ad9f45a937a355b343efb9bb30adbe6 |     
    i686     |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/15563d06b80432760df74eb734e8b924f0f95bf1 |     
    i686     |         haproxy-3.4.4          | NOK | https://autobuild.buildroot.org/results/a71e942b0f7b31c4c480799c22569904c1092509 |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/3fd69ea78ead403b2acee36fbef28e4b972d274f |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/523ec96d1d3e336bee3668961fb69823cf8904e3 |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/69bd6a2dd6c71e78135884bfc2168655f02f94fa |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/2812e99d842a2107f972fdd2904f74ce61e83349 |     
    arm      |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/2efa1f82b18604a5a2b6a9bd066c7b0d19bfb41e |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/8b38b9d32c80a986f0bfdb4189cb69cf268cef67 |     
    i686     |       host-gauche-0.9.12       | NOK | https://autobuild.buildroot.org/results/84dd50bc273dacc777dff1f3ebdbc9e01f4619da |     
powerpc64le  |     host-gcc-final-15.3.0      | NOK | https://autobuild.buildroot.org/results/a11aaca273a5a196b8796ff5aca963763220e307 |     
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/0b7b8e9b982f990a6797ce86da0a7840acd2149c | ORPH
  riscv64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/f9f56101c72ab01667906747d4a8fa509a37e128 | ORPH
    i686     |       host-go-src-1.27.2       | NOK | https://autobuild.buildroot.org/results/59dc905f0265b0d883e4b32c7f3a19714cbecae1 |     
    i686     |       host-go-src-1.27.2       | NOK | https://autobuild.buildroot.org/results/13eabbd560ccfd9986a4fea932e2ab11b0cd7f44 |     
    i686     |       host-go-src-1.27.2       | NOK | https://autobuild.buildroot.org/results/a185478543f84a61106b5eebaf9cf218d519c4d4 |     
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9a62f87998e2fd0aa5f7dfee69270f5a31b93e5e | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/261fdf6e21b680bc5e4b7825b4837d1c302c6675 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/aa1455e979f7f387bb8d46b9da9a4c8a76a74cb1 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/84225e619be4a6a65244b9101ee559beadfc74f5 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/1ce84eb7b368f1d346091b38c93dccf3874cf425 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/c7251243f260e9e01728af2fd995860f6e435bee | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/912c482d851952696f1bd03eb8ae67191865c9b2 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e61bb752ef9bf7012fb370d71179805bd8340920 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/45f6d8462dd2a976291b5000208c63948f953fe3 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/d93f0ade3dfc20f7b0f4035ed3452832661d04ae | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/2fd32c25edc906a5ff277b9e33f588e879b0f9f2 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/bb41e2a0c3b0d3c9b7709bb1adb28db05df9b8d7 | ORPH
powerpc64le  | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/802fa31f22f8cee8405dc3d9a867136b40c1539c | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/9a6ddd9715f446d650d05dddec8618844bfb600a | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/14d88451c58ad23a652110cb3b0d70113edec98e | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/484f30e6714eae009347733f53017a3c0ade54c2 | ORPH
    i686     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/4605f5b25bf8cb9b82bc44e26a3c34e211d383b8 | ORPH
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/26bd7c7aa16d8c606d67067705e2d7f937b7d67e |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/754c3eb5bcf6b069590553c8ffde406582a98e2a |     
    i686     | host-google-breakpad-f49c2f... | NOK | https://autobuild.buildroot.org/results/f5b1ee38349203df20b02aecec59beda6fb0b5ac |     
    arm      | host-mxsldr-2793a657ab7a224... | NOK | https://autobuild.buildroot.org/results/258baa4e150043715e927234b6021bc6a8cc9e84 |     
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/1162efdf24c5527d0c6e21aaa9a5f2a8d1fa5687 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/4bf1de3f35b299667ba8493f0552aa7d39e50289 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/313f5c420d42337961b793298e345553dce29ebc | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/25f3860d11d21bba03f8e3b6416901368edad62a | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/2612d7638dbeda081f8eec96274c13793b66f6df | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/dcf9a7c4d2a2dc65df92686c486ea6cc4537dff9 | ORPH
  mips64el   |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/cd8e8ba6db0e32fd9b8a5ccfdb008f5a3f716d8a | ORPH
   mips64    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/ea9fc45958e8ccf238e6fa1e7ca54359fe89e031 | ORPH
    i686     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/c36fc31e58948e9723cd53e760b4d09ef8e0e91f | ORPH
    i686     |      host-qt6base-6.11.2       | NOK | https://autobuild.buildroot.org/results/c2459dffb184885a21448a8f2bfca9bf4b2f30bd |     
  riscv64    |        host-rust-1.98.1        | NOK | https://autobuild.buildroot.org/results/931b014091d3289b04c57a525bab427765c9d16e |     
   x86_64    |        host-rust-1.98.1        | NOK | https://autobuild.buildroot.org/results/09ccb9be0650e313cec414e2c8bb4f453a7be5b3 |     
   mipsel    |      host-xfsprogs-6.19.0      | NOK | https://autobuild.buildroot.org/results/5d3a92c3fc291ba6d9d16ea945466daf56086d01 | ORPH
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/1514da3feb2d0cc4903ea4cde6f6f7d5b48d1898 |     
    arc      |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/d8d5d525810c2229afa29c14ad0a713cd631ed76 |     
  riscv64    |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/1dde89aeb2fd8db85937a10670ccf4a970559933 | ORPH
  riscv64    |         libaio-0.3.113         | NOK | https://autobuild.buildroot.org/results/cae5b465f81c34f168426e637146741e8508a31d | ORPH
  sparc64    |         libaio-0.3.113         | NOK | https://autobuild.buildroot.org/results/2729e53599f3697d7160d7bfab082862ceeef76f | ORPH
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/560706484a4fcf52a0080ed728721a4b07a2e4c0 |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/c0e577ccfd0bce17711bfee48a7dafcc9541bb7f |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/861d4aaeabf993d0fe3d64eefb661d48e8b09e18 |     
    i686     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/664f5f2c0f7c761abfa2f70601b8b65fd6cfc336 |     
    i586     |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/5c6d7bef57ddf797ffc6ed6e03d67b9cdad80864 |     
   x86_64    |         libclc-23.1.3          | NOK | https://autobuild.buildroot.org/results/94818a5154075ca628ec22d24485a73c9d5526ec |     
    i686     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/3da24c43567fdf6acda2a34d5894feff832213de |     
microblazeel |        libecoli-0.11.3         | NOK | https://autobuild.buildroot.org/results/7d01b6a8350801775d23cd00971f1bac3167b0e2 |     
   x86_64    |        libepoxy-1.5.10         | NOK | https://autobuild.buildroot.org/results/ca99e3bde885e79a804cefc78212e3c2aef20ea5 |     
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/a58d7eaef3d41000ede2cd80577fa19392d46c9e | ORPH
    i686     | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/53d29e1cf741e0194b98be2f79369507ad52c97d |     
   armeb     |      libmicrohttpd-1.0.10      | NOK | https://autobuild.buildroot.org/results/d7cee58aff220983a2b361fd68734ff883780113 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/28f9422d84f182c21e8ecbb715ed137771c25eef |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/479b285d198de6c055ce2f82ca058d12aa070dd7 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/387e46124e5b2ce62e7c62278d4fb528ac5aa3cd |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/a98c1d1c3dccb832a1321963fbe0d168df8c2734 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/14b8da082ffd51e450fce26d2f84b8930427cd14 |     
  aarch64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/3e1e4f86aebcd39f636eacc978b093f5c657e677 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/6b18fb784a806ab7dea03c90728ae6ba86c29e61 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/95dbc20c7c82efbb902e253e50155d0ba2d1ad61 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/577e7de45489bcec439562701f833ab5241a0ea0 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/72966d6a44a9cbcf5f4527b5237ad274fafc1615 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/6477739f2259d1f07d8706663783c41cefd543e8 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/ec3cba77a09cb648bd834564f21851dfcd435b41 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/875eeddc2c7a93f1780ef1b35effc4f6bfe3b79f |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/52f731d7f5b04445c7e3f090d03f23b321dc0fb5 |     
powerpc64le  |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/dc7738c668abc7abba2a607be393bed115306415 |     
  aarch64    |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/bcf50bf477e4c275403ce9f8aae739b7761678bf |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/8782deae9383c8f13fd612c1fd0d0c188dadef05 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/9874566c51e6f1231e0b9030a6e519772a53c8a5 |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/a1de2e5ac88f9bd09bf28b51573ac52413d3956b |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/c7a05aa761caf5e1ddf89041b363e2ac1f33efef |     
    i686     |        libmodbus-3.1.12        | NOK | https://autobuild.buildroot.org/results/92fd4715c8988eae68f2bcf4f74425e405fc868e |     
    i686     |         libupnpp-1.0.3         | NOK | https://autobuild.buildroot.org/results/4394c5d325c509674e5e2d51a86a90458ebdcc40 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/20e93438f69eb13a9035e98fa49b1585cc7248c9 | ORPH
    i586     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/f72ac64e88f10934ac59a6533b326995c2d3dd46 | ORPH
    i686     |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/a038074d18f837657a798aab4958814ac6e48ef0 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/d0c6aacac16ceea54319a5759b27504b1eaa743b | ORPH
  riscv64    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/b62f3ff7f8e2cf82bd28cf5b696aa2d81fe2a841 | ORPH
    i686     |          linux-tools           | NOK | https://autobuild.buildroot.org/results/a3e59c1eed648ee18831d83bfb57d66a60cb434f | ORPH
powerpc64le  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/cc7096e8c6c2c10192d2073b1e56e7fa4c30c7c7 | ORPH
    i686     |       lirc-tools-0.10.2        | NOK | https://autobuild.buildroot.org/results/4da45a9cd55f7ef735a0a514185f8419520d73d9 | ORPH
    i686     |     ltp-testsuite-20260529     | NOK | https://autobuild.buildroot.org/results/31784d36d9b388492f4bff36aecda0ceaf17474a |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/58e0426d13c918f1c8bc146bb3745f99e29aa270 |     
    i686     |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/8f36edf8f2cf748c7aedbb01041e8f81c1090af1 |     
    i686     |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/2382cbf819944faf138a71eecc192cb2844b9934 | ORPH
    i586     |        mariadb-10.11.18        | NOK | https://autobuild.buildroot.org/results/8f26699ce53f13fe197d91e5f20d2f8d88d75af2 |     
    i686     |        openblas-0.3.34         | NOK | https://autobuild.buildroot.org/results/cdcfe92247c609129345e0685740ceda424f56a7 |     
  riscv64    |        openblas-0.3.34         | NOK | https://autobuild.buildroot.org/results/3eb4a7887932f1c116510be26434a72cfb96ea04 |     
    i686     |         openmpi-4.1.8          | NOK | https://autobuild.buildroot.org/results/bc45c5164d263bdd068a1eada700c51a6d3dca9c |     
    i686     |  openvmtools-13.1.0-25218885   | NOK | https://autobuild.buildroot.org/results/592dcce9ed1f4394bc37458ab57e613501b18cfe |     
    i686     |  openvmtools-13.1.0-25218885   | NOK | https://autobuild.buildroot.org/results/341de93c3786d5ab5d2f3571fd273c1e3eebf353 |     
    i686     |  openvmtools-13.1.0-25218885   | NOK | https://autobuild.buildroot.org/results/4b1bd609fa820773bb3c68503f431a55808163c0 |     
    i686     |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/ccddca12da963815e7e4555e5f733c0cbd819f9d |     
  mips64el   |        osm2pgsql-2.3.1         | NOK | https://autobuild.buildroot.org/results/7c2ad2894fb4e24ac114e479ca8dca8315e604ef |     
    i686     |    passt-2026_07_28.f8df3f1    | NOK | https://autobuild.buildroot.org/results/c956e81451678e3e7324db7772d26ebd0fba34aa | ORPH
    i686     |        pax-utils-1.3.7         | NOK | https://autobuild.buildroot.org/results/9f20ac16feceb423e0226318069ac0a0afb1dd71 | ORPH
  mips64el   |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/bec11bf851d9d6fd7617ca903a3cb827c35287e5 |     
    i686     |          perl-5.42.3           | NOK | https://autobuild.buildroot.org/results/464cd374e4d49bd2d7f27f6ad73677943b27a94c |     
powerpc64le  |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/5dc92b95dbc39d927a5bbb7c6494adb29cef4b2e | ORPH
    i686     |          prboom-2.5.0          | NOK | https://autobuild.buildroot.org/results/ab36d0893e3a528d06640c8186491aa26ee953ac | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/f452fdf42509d56555b31b148edbc2bde2624af3 | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/211a7faf5374e72597174c860c5a1dc399a85b49 | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/263f61a214a92026a1fe15a4b3024dd701607026 | ORPH
    i686     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/e670f55e1534bab8997a1f51c16a764db0fc9ee3 | ORPH
   x86_64    |     python-autobahn-26.7.1     | NOK | https://autobuild.buildroot.org/results/eb1568a44e5d772ebd7421fc5cae670701272f91 |     
    i686     |    python-dbus-fast-5.0.14     | NOK | https://autobuild.buildroot.org/results/43bf68b9375d30c939e38f9cac64a62edf6a320d |     
    i686     |     python-ml-dtypes-0.5.4     | NOK | https://autobuild.buildroot.org/results/1046c2df4ea0b18d34d88ffe1f28cc9637aeafbf |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/4a3b3f73c1eab300b10d5079618c6a354c137c47 |     
    i686     | python-types-python-dateuti... | NOK | https://autobuild.buildroot.org/results/7f96301c1afc60314d5e4d91231e88f98e266feb |     
    i686     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/fac9919f2ab0f40b2a1b447ba34b59d2fbd3052c |     
    i586     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/8665fc4dfafa0e73565cf71e40cc5d29014ccc9e |     
    i686     |         rdma-core-62.0         | NOK | https://autobuild.buildroot.org/results/2c882a8484a1c90b32269df64ccfe8702670a028 |     
    i686     |       resiprocate-1.14.0       | NOK | https://autobuild.buildroot.org/results/4633255545d91790be32a393995e5440067463d7 | ORPH
    i686     |            rtai-5.3            | NOK | https://autobuild.buildroot.org/results/f643908809a1aa7505af83247dff8ceca68bf477 | ORPH
powerpc64le  | rtmpdump-6f6bb1353fc84f4cc3... | NOK | https://autobuild.buildroot.org/results/34a5721519f2b9b2de251d4ea8eb88a829cb4e74 |     
    i686     |           sbctl-0.18           | NOK | https://autobuild.buildroot.org/results/91a3de3dc3a6da3f0aad1fef5fa7bb32da84289b | ORPH
  riscv64    |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/65a188384ce2355aebba7908fbdeae986dd381d3 |     
    i686     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/c8584ff4ddcac112cf098dd04b322b48d2fcb2ab |     
  riscv64    |         skopeo-1.24.1          | NOK | https://autobuild.buildroot.org/results/3234ba297f30da37150ed78412260c3671609dc2 |     
  aarch64    |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/26c516e838a50f645a161018e9db98fe4f7e697d |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/b67360cd520662c2749d3d0f10211d0b79d55c71 |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/4c79cadc9803a649f29d5e525208119d945d5eab |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/99db18f628fc45b4ef3593cb0c370207eeed961f |     
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/1a1373d98f8f0b5fe61cd88fc53b77a25fee7ad2 |     
    i686     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/08b035825564063e18b4558a3047cf4acc3a28cc | ORPH
    arc      |         uclibc-1.0.59          | NOK | https://autobuild.buildroot.org/results/6a81125ea73916ad115500201a6de1cc55dc331c |     
    i686     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/fbb054871903dd6862974de90f3e2af770e4212a |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/a664f0d2361c5037a7a73b51d49d2ba04fb33403 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/e5249207366233e7f9aaed5f475ca028e9694784 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/fff716881d54e0bad08df17cf49fab816ae6e201 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/271539a652e52e4ed09bb93dff4c93a0f2ee5909 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/a0bf7150fd79088bc9a8958d82d3202e71f59caa |     
powerpc64le  |         upmpdcli-1.9.7         | NOK | https://autobuild.buildroot.org/results/e645c3cf345b805cff63b39f8b6cfb33a1a075d8 | ORPH
    i686     |      virglrenderer-1.3.0       | NOK | https://autobuild.buildroot.org/results/193830b5a359a24c904fc5f196a9627784dffc53 |     
    i686     |           which-2.23           | NOK | https://autobuild.buildroot.org/results/1b63b13ba7d017b46c0ac58c096ebffdd6af2649 | ORPH
loongarch64  |     wireless_tools-30.pre9     | NOK | https://autobuild.buildroot.org/results/c791e1cb2a467a3be077d8b3def62b32d2769ad7 |     
powerpc64le  |      xlib_libXfixes-6.0.2      | NOK | https://autobuild.buildroot.org/results/b85820644e3dbf2cb5bcad54bb0e942d6c1cd7a7 | ORPH


Classification of failures by reason for 2026.08.x
--------------------------------------------------

                    attr-2.6.0 | 1 
    host-mender-artifact-4.4.1 | 1 
            igd2-for-linux-2.2 | 1 
      libabseil-cpp-20260107.1 | 1 
                libaio-0.3.113 | 1 
             openjdk-25.0.2+10 | 1 
   openvmtools-11.3.5-18557794 | 1 
python-remi-2022.7.27-37-g1... | 1 
                 sudo-1.9.17p2 | 1 


Detail of failures for 2026.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |           attr-2.6.0           | NOK | https://autobuild.buildroot.org/results/b710416f4007a1a487ed95114e5c191cca0c6994 |     
    i686     |   host-mender-artifact-4.4.1   | NOK | https://autobuild.buildroot.org/results/1fe754a6d769f3a8e32ec1c70ca7a67d6770ad53 |     
    i686     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/9e27643e898e32a739b2152e21c343d55c797f10 |     
    i686     |    libabseil-cpp-20260107.1    | NOK | https://autobuild.buildroot.org/results/400e3ba2392279f7c80d2ddaeae55e0319df3b49 |     
powerpc64le  |         libaio-0.3.113         | NOK | https://autobuild.buildroot.org/results/aa3a0750b8de33a89c2df4e14b7e4b37872d2f18 | ORPH
    i686     |       openjdk-25.0.2+10        | NOK | https://autobuild.buildroot.org/results/5f51322cf53b49084fc2dd58d991f5c205722306 |     
    i686     |  openvmtools-11.3.5-18557794   | NOK | https://autobuild.buildroot.org/results/827ee58a88d8029f0c0dbc6a8dc8919d0e835ce1 |     
    i686     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/bd7b3f20f34704b3aebf392fb006bc10911a1a0b |     
    i686     |         sudo-1.9.17p2          | NOK | https://autobuild.buildroot.org/results/154c4c9704e03c2b60c66e7bc2943e9832db5d55 | ORPH


Classification of failures by reason for 2026.05.x
--------------------------------------------------

            jpeg-turbo-3.1.4.1 | 3 
libfutils-c326ce0cc2a735438... | 1 
                libupnpp-1.0.3 | 1 
                    olsr-0.9.8 | 1 
               tcf-agent-1.8.0 | 1 
                       unknown | 1 


Detail of failures for 2026.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/92af9766e960a959a1dbb999bac733d7e3983463 |     
  riscv64    |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/7101375526df5711c58147f566fe376d0149c2e4 |     
    i686     |       jpeg-turbo-3.1.4.1       | NOK | https://autobuild.buildroot.org/results/0e2442332e22b6f82a0dfb86dc42dee62483fe95 |     
    sh4      | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/232c341113d6c1bafed0ccc48f46754c7a07a1cb |     
    i686     |         libupnpp-1.0.3         | NOK | https://autobuild.buildroot.org/results/a8545246d41030da7c613dd88c7d63c8696da2e4 | ORPH
  riscv64    |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/28e8015f1991c462e34e61db1326129a9a5a2e4e | ORPH
    i686     |        tcf-agent-1.8.0         | NOK | https://autobuild.buildroot.org/results/22eab2b5c9e27eea13da157bfc0ab296e31cd9d7 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/140a0890b9b844a8ddc9d56c0396610c4c92192a |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                memtest86-7.20 | 3 
                   dante-1.4.4 | 2 
        host-python-lxml-5.3.0 | 2 
                  bcusdk-0.0.5 | 1 
                freerdp-2.11.8 | 1 
 host-softether-4.30-9700-beta | 1 
               libevdev-1.13.1 | 1 
package/linux-headers/linux... | 1 
                   perl-5.40.5 | 1 
python-remi-2022.7.27-37-g1... | 1 
                    qemu-9.2.0 | 1 
                samba4-4.22.11 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          bcusdk-0.0.5          | NOK | https://autobuild.buildroot.org/results/33cd827edb35790037f55e143eaa686b8453c91d |     
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/3a532a88a53637779c2b7d783624d76a5b7ba3f6 | ORPH
    i686     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/0feecc499ad89401086ea13ca0dc4bc4d1bef880 | ORPH
   x86_64    |         freerdp-2.11.8         | NOK | https://autobuild.buildroot.org/results/5696bbb6363602ac740e831ae90059824e990833 | ORPH
  aarch64    |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/18530e67a5f07740347f886cfac11ec6af17b459 |     
    i686     |     host-python-lxml-5.3.0     | NOK | https://autobuild.buildroot.org/results/5850736275e18e86f5e18c97ff6819f71587a4d8 |     
    arm      | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/7c252fb48ee6ffe5c5d42f9a6c3b53cae41e46df |     
    i686     |        libevdev-1.13.1         | NOK | https://autobuild.buildroot.org/results/5cbeb35cafad8d9a663011e2cf0a876a35bc5c5d |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/c181a7dad3d4ed27d1e8df9a64c256dba4de94d7 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/0ef3c15ddd3b09b426961428aecb312a2bf6a213 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/0057effb2b94e3d8a268b28e382e2d4df91a497f |     
    i686     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/d508e41feb7a09c930ec4b32852be871a2a82f6b |     
    i686     |          perl-5.40.5           | NOK | https://autobuild.buildroot.org/results/c1a3d0c5e0e5424a2e8da2d16edbdf499e5b7b2d |     
    i586     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/8ee14b309552354a55a3b9a45baef398e8923cbb |     
    i686     |           qemu-9.2.0           | NOK | https://autobuild.buildroot.org/results/8ddf12c10a036e0e850961e40d1f90eadd88d2d2 |     
    arm      |         samba4-4.22.11         | NOK | https://autobuild.buildroot.org/results/85d5e639fbbeb888728d6193dc832cf6f7907f61 |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/9d82ab6974426a0aecbf173f56708ac8ba3c674a |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
