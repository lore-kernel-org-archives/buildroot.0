Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7919FCCF9E5
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 04:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D450481173;
	Thu, 30 Oct 2025 04:24:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D-lavD_LPcGP; Thu, 30 Oct 2025 04:24:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94DBD8111D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94DBD8111D;
	Thu, 30 Oct 2025 04:24:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 63F01707
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 04:24:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 49B1C410CF
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 04:24:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D1YQO79B2n0a for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 04:24:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 84F2141078
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84F2141078
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84F2141078
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 04:24:28 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3f2cf786abeso357924f8f.3
 for <buildroot@buildroot.org>; Wed, 29 Oct 2025 21:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761798266; x=1762403066;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o1vBwByQEcZ6SITbUBpLAXQ3Tc9DIVTdMOJAeyTHIRk=;
 b=GSAt13D0DMN7X3/zlcoFg7j9IIXrrprIg9hQYh9nJVVX84tcF8FZ05goKI0YnegbrO
 H419oH1r/FWt6WXswRdm58j0TNh/+vLG/KIeYb8cjqE61MA4a/TOmzOtqVNqPLAEKDLg
 1woVm4xRfxh2uI7fhs1U2UTVNvv8QXaokWlY/Hi8Wzl3NPSyO+gjprnUdFu2YDFJ2Lp3
 vBwpWHdCTz6zfJQ9R2/pjaxvi7lGAWrXKGYxjM9KJ9nbSmzyA/Kg0L+yMVsBKWcKJN92
 fIgIcGw1dFX3rkegdRbLnTOqaoqYhfNk7OONmZhZMHXb9VoiHJJ0phxGdZtUscTMqFnY
 allg==
X-Gm-Message-State: AOJu0YxSdh+wfDmB3wd3zrS8DHIYhuZ8DJTArdfKXkG0lxQ/rHpvu1HV
 FLRbREJAB5IxJFe0G+4Cy/t+30BeJq4N7eM5JmW4OjPJ8EJ8+9QSn8WE0jfBpw==
X-Gm-Gg: ASbGncsCougEzmneoTPJu3WgGRPiEYoUjN3266mDOxRPfoBfooEUHlmay2evKfkEX2x
 ucWhas18Td9otbMqV13pMnVv34+HYCrNi9DWQBRlk/TATonrvDGX70XXTHijjsKyRAHE3RSYpQq
 /mR8hUGkQUqiaizJCTqVbAWH6JasPC7YUTYMaSMuH1gcGbBTFFMuwoNVBSwhoaT2PEcnYE02jao
 NBhmW9GM3mVL1ardiRrsC5oXHfBbUfkjiebeG+OiQm9jpDI+Gx2Zx4vZsPrxGxmVi+woZLHm9kx
 KRSzVnbQQjedkbiudv/D4ivHGO35KeS04dNM+WmAmtUMGDXh+pf/vEN+LW/DmH5U89jpi2IzIsB
 OC3bbVpwOiSn3TIKaqKhcH9/GibvNZLjgonlIUz9mS185Te0LjchJTrP2etRIJmoBinDipInpN2
 lYepMW2x/Aj3TSS1GkWA==
X-Google-Smtp-Source: AGHT+IHmF4bgFPJc6zplueA39GAlQWePnn1ZLJ1aCxe+ZOyS+WpJ1SF2Tsh4wjZQAcDDdfJAMjIONA==
X-Received: by 2002:a05:6000:40da:b0:429:94c3:77c with SMTP id
 ffacd0b85a97d-429b4c9dcfbmr1289547f8f.50.1761798265953; 
 Wed, 29 Oct 2025 21:24:25 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952df6b9sm30607395f8f.44.2025.10.29.21.24.25
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Oct 2025 21:24:25 -0700 (PDT)
Message-ID: <6902e879.050a0220.33f76a.18ef@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 30 Oct 2025 04:24:25 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761798266; x=1762403066; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=o1vBwByQEcZ6SITbUBpLAXQ3Tc9DIVTdMOJAeyTHIRk=;
 b=Q1NzKaCKjo+etpQ7hQwQWCLmOE+zQ9dXIfokDXtZX2aa2ymnVbjrImnZwL93g1cua7
 nBpvko6e0T1rplgYkhxEgLKmHnkgn5IP7IZ0SZx+nV6QJ9VZLlAenqAcjGnJKYp2CMPI
 ISJkd+j42OyrML3oncfz/GHFkFxnSAgBp/t6ivh8RYDYE2KDfikeSQySCxO/9TvjnFil
 nwMOhwIzKHWCp2TlMVhXqazz3rdJSQviAOdEOq6E0h2mkrUEJdkGjusPE2i93n35dQCV
 h2c/XqgyFhnxBTzwSnKoxnKa7i/rqeME9DfsZrEH/Yy1tfroztVG28/I0hynyJEqpMqe
 RyOQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Q1NzKaCK
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-10-29
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

Autobuild statistics for 2025-10-29
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  6  |  8  |  0  | 14  |
  2025.05.x  |  4  |  2  |  0  |  6  |
  2025.08.x  |  0  |  6  |  0  |  6  |
    master   | 41  | 83  |  0  | 124 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 7 
                   cvs-1.12.13 | 5 
                   libiio-0.26 | 5 
                openocd-0.12.0 | 4 
                      fio-3.41 | 3 
  gobject-introspection-1.84.0 | 3 
           host-openocd-0.12.0 | 3 
glibc-2.42-3-gbc13db7393773... | 2 
                 host-gdb-15.2 | 2 
            igd2-for-linux-2.2 | 2 
                  linux-6.17.5 | 2 
                    mpir-3.0.0 | 2 
                openswan-3.0.0 | 2 
                apr-util-1.6.3 | 1 
             batman-adv-2024.4 | 1 
               bctoolbox-4.4.8 | 1 
                 c-icap-0.5.10 | 1 
                  cairo-1.18.4 | 1 
            cppcms-2.0.0-beta2 | 1 
cpuinfo-8a1772a0c5c447df2d1... | 1 
                     crun-1.22 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                 dc3dd-7.2.641 | 1 
           dmraid-1.0.0.rc16-3 | 1 
             docker-cli-28.3.2 | 1 
                    dust-1.2.3 | 1 
                    gawk-5.3.2 | 1 
            gdk-pixbuf-2.42.12 | 1 
           ghostscript-10.06.0 | 1 
                   gssdp-1.6.4 | 1 
         host-gcc-final-14.3.0 | 1 
    host-llvm-libunwind-20.1.8 | 1 
    host-mender-artifact-4.1.0 | 1 
               host-runc-1.3.0 | 1 
              host-rust-1.88.0 | 1 
             libargtable2-2.13 | 1 
   libcdio-paranoia-10.2+2.0.1 | 1 
libesmtp-v1.1.0-14-g335ee8d... | 1 
libfutils-c326ce0cc2a735438... | 1 
               libglib2-2.86.1 | 1 
              libmhash-0.9.9.9 | 1 
           libmicrohttpd-1.0.2 | 1 
                  libnss-3.117 | 1 
              libopenssl-3.6.0 | 1 
     libphidget-2.1.9.20190409 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                     nvme-2.15 | 1 
           oath-toolkit-2.6.12 | 1 
               openblas-0.3.30 | 1 
               pcsc-lite-2.1.0 | 1 
rtl8822cs-0ef9ddd619d2a386d... | 1 
         s6-networking-2.7.0.4 | 1 
       sp-oops-extract-0.0.7-1 | 1 
                systemd-257.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/51fe66ed847e2092ccd1eb6662a16fda2d7e5a63 |     
 aarch64_be  |       batman-adv-2024.4        | NOK | https://autobuild.buildroot.org/results/7ce1a870ef0173000970cee532142658c7f4e274 |     
 microblaze  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/e353dd806309b2731b15fabba18a83f4e0f51557 | ORPH
   sh4eb     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/e46b2a44cdee6b02aa494aac543b553782bb7d53 | ORPH
 aarch64_be  |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/51401d2a1062c3dec50f87f2cf4377d4f3e4b24d |     
 powerpc64   |       cppcms-2.0.0-beta2       | NOK | https://autobuild.buildroot.org/results/f5483bd240215b5cbac5d0195f4bcb1990d1f5ba | ORPH
    arm      | cpuinfo-8a1772a0c5c447df2d1... | NOK | https://autobuild.buildroot.org/results/9425e2dfc77c53a858b9dfff900a02273e6e0933 |     
loongarch64  |           crun-1.22            | NOK | https://autobuild.buildroot.org/results/31a1b8bf22bc5508874539a966263ade9f01f2cc |     
    m68k     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/2d69d70ae9e06532c48356654c3d1b8bee62e245 | ORPH
 aarch64_be  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f9c2839a449b88fb23d555d5e15cd9fa608c7c7b | ORPH
   x86_64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/7e712851ac16a70f19704beeadac3b58e3703e1c | ORPH
powerpc64le  |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/8c318a53751b1d6c76100e2ee057253d6c3132cc | ORPH
   x86_64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/a4a4faeecacedab3d25b39c8d8b3907361300cca | ORPH
    arm      | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/b188832b4a51d9cb0d73db3fc4c9c9a8fb8c8e16 | ORPH
  sparc64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/e5c1d2b43a5e50080b2e460dd0eb67d9c59f0de2 | ORPH
    i686     |      dmraid-1.0.0.rc16-3       | NOK | https://autobuild.buildroot.org/results/eec75bf20c74245ecac86dfe75ebc953f3c4d22d | ORPH
   s390x     |       docker-cli-28.3.2        | NOK | https://autobuild.buildroot.org/results/6656c400687e64d349109e661415665f604f0142 |     
   armeb     |           dust-1.2.3           | NOK | https://autobuild.buildroot.org/results/24a0e0acb8d063d1f4bbdf0c3ac9643dad55e0a9 | ORPH
    m68k     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/8264c628c20a6d394f2af05961eef0a467fa195f |     
microblazeel |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/6ef536d98de568e4dd2b14590fd3838fbdfea474 |     
  powerpc    |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/157ed0d1cc8b8f23c4826508248fab91f5ccb11f |     
loongarch64  |           gawk-5.3.2           | NOK | https://autobuild.buildroot.org/results/d29d49a998248dc119f7ac727e1875c37f98a242 | ORPH
    i586     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/1d9fa9f504065159120b683afa2bfec4c13e880a | ORPH
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/98da1710d42636b0402e46e8242f922270298260 |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/f5a8bb6214fb9fc739ae56d860995096dcb6d6da |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/d4e8ffce30580b399a8e63f3dfe0453b4d5ebdb8 |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/2cb3dfcbec27120638cf3857ec4e1bd23d4fd2bd | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/658b7ece29806fb7bb745d8a2229d6065f3e1151 | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/1a62878665512064c6f7f6e51c76ffc755a174a1 | ORPH
loongarch64  |          gssdp-1.6.4           | NOK | https://autobuild.buildroot.org/results/de8b896f8441bffd0546485381cf872246dd6813 |     
    i686     |     host-gcc-final-14.3.0      | NOK | https://autobuild.buildroot.org/results/d8365e6979506663aa52875cf14c5040e0cf800c |     
   mipsel    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/51de8d5c04759891a2722860e815285fd3b4ef1c | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/487670cfc6867b71fe18fab6314b0e5921d498d5 | ORPH
    i686     |   host-llvm-libunwind-20.1.8   | NOK | https://autobuild.buildroot.org/results/f38eb9338129f6c0b191bf6438239c141768f8a5 |     
   mips64    |   host-mender-artifact-4.1.0   | NOK | https://autobuild.buildroot.org/results/ae50a7e0d7c20cf4594b3067fe5f59a8d88596f4 |     
 aarch64_be  |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/7e85767cf6195c2150b53a54dca578ac91ae5a0e | ORPH
   s390x     |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/cd0d1254512967d9ea7d5ff0e953b47fde89af0b | ORPH
   arceb     |      host-openocd-0.12.0       | NOK | https://autobuild.buildroot.org/results/63de871e87ada77df38baa5a64153b33bf3e31ea | ORPH
 aarch64_be  |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/a26818e9b1394121c8ca27f5d7326560291e5046 |     
   armeb     |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/fc4c28098e914f964ac724fe4c569530b375da37 |     
   armeb     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/028c574c35cf7f4f17a9be6c274cc9ebfeaef103 |     
 microblaze  |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/9188ee944f86320b9ae1b130537f62c098d1f6e0 |     
powerpc64le  |       libargtable2-2.13        | NOK | https://autobuild.buildroot.org/results/18d7a273635632fabe4392bae81f6ad234c3eedb | ORPH
loongarch64  |  libcdio-paranoia-10.2+2.0.1   | NOK | https://autobuild.buildroot.org/results/042185a8d32765a52986cc0060d3d296a24c662b |     
powerpc64le  | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/5f4f75458d96f283479a404b8a894279790122e0 | ORPH
 microblaze  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/292222643c8620e6c9a251715e53a16bdf8f92d7 |     
    m68k     |        libglib2-2.86.1         | NOK | https://autobuild.buildroot.org/results/cbf3e751afd71aa6106a26b5820a758a10599c9f |     
   s390x     |          libiio-0.26           | NOK | https://autobuild.buildroot.org/results/418b19c04b23a675793bf66c7e0d33ff92be7365 |     
   mips64    |          libiio-0.26           | NOK | https://autobuild.buildroot.org/results/3b157b5316eac6726d931d53e12fe88b6326c285 |     
  mips64el   |          libiio-0.26           | NOK | https://autobuild.buildroot.org/results/fde40a3d6ac58f568e49419e5176db5a62a0a4d9 |     
  mips64el   |          libiio-0.26           | NOK | https://autobuild.buildroot.org/results/98d939d0c5cc8d609f8d95a09a0df1991d9301f7 |     
  mips64el   |          libiio-0.26           | NOK | https://autobuild.buildroot.org/results/7fd361c2ceef87df4958148201d6c131df172010 |     
  powerpc    |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/996824dd13adf2c5c5f870706413479b609b7e24 | ORPH
  riscv64    |      libmicrohttpd-1.0.2       | NOK | https://autobuild.buildroot.org/results/3240265dd009b092f33079b36cc4df31b97b0654 |     
loongarch64  |          libnss-3.117          | NOK | https://autobuild.buildroot.org/results/339b3abfc3ba40315f8c3d1eb0063baa8166d3d6 |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/9a9f0a27704903c84342a5990864756ccd255016 | ORPH
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/577619bf9035ed47da889cb7cea16f8068ed2530 |     
   mips64    |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/98e2de60d82a1c6b1294bd63c0fcbdfa6699c693 | ORPH
   sh4aeb    |          linux-6.17.5          | NOK | https://autobuild.buildroot.org/results/b20cc26ce3a56b9f62c4ee15ce8ffefa20938114 | ORPH
powerpc64le  |          linux-6.17.5          | NOK | https://autobuild.buildroot.org/results/616731ed4eb08091118bbbee7fac8a9a652d258c | ORPH
  powerpc    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/b13a6eaaeb67f3d95ce5361d53c829847e5202d3 |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/e70c8be0bd8b084429e4aa978799f02a8b41eb3d |     
    sh4      |           nvme-2.15            | NOK | https://autobuild.buildroot.org/results/479f63ef0b3f3f1d1fca1cc530307f07874cf61a | ORPH
   mips64    |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/55f9ea864a6ad9648e100f5a7d9c836203f25504 |     
  mips64el   |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/39791981d97fde70b60ccad969f8358035b0dc06 |     
 powerpc64   |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/0167def2922648b3d0405b300d7fe869abd13ba3 | ORPH
   s390x     |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/0f25680d505f90c3042202ebdd0db5fd3c018a7e | ORPH
microblazeel |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/fd0d7611d0ef8c995277d1ec09f6fe14860eb48d | ORPH
   mips64    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/dbc221fa648f5b055589a61dcdd89a8cae76bfda | ORPH
   x86_64    |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/aa2f04a5ed264fdaa76c2f4e464cb44315dd0a43 | ORPH
   sh4eb     |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/03c88d3662037c1240097f7363d9a6f63b0689b2 | ORPH
    arc      |        pcsc-lite-2.1.0         | NOK | https://autobuild.buildroot.org/results/bcb2f1a7424185efea20dd5b21d93f48c5bdbeac | ORPH
   mipsel    | rtl8822cs-0ef9ddd619d2a386d... | NOK | https://autobuild.buildroot.org/results/9997b0fc1600b6038af346b25af59bd0aa532f78 |     
    sh4      |     s6-networking-2.7.0.4      | NOK | https://autobuild.buildroot.org/results/2859a07b750854f4191820c19051c698e429a39a |     
   armeb     |    sp-oops-extract-0.0.7-1     | NOK | https://autobuild.buildroot.org/results/3b5ee8d7fd7f8a2af024b13a2b586ee54e3db453 |     
   x86_64    |         systemd-257.10         | NOK | https://autobuild.buildroot.org/results/390669cd881ec37b81028d2b85093acb2fad24a6 |     
microblazeel |            unknown             | NOK | https://autobuild.buildroot.org/results/9b6fa5e8d8639f288727c0385010a7fd0870501e |     
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/aaba81304d29b1d98666f035ef7a7916e97086e7 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/cd86e0d940cd7d7a9007d73ed8d2cb9b3e76877b |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/9451b61d9052cb64fb15446113ad9415ea5511dc |     
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/66e5097f596f7e8c754c3dcee14b1c9135535906 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/2235b3d8e8095d7650c6fca4d690acf90b990fe7 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b8fe613bee9a357af071a957344b5a3a717cda14 |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

            gettext-gnu-0.22.4 | 1 
                 inadyn-2.12.0 | 1 
libdbi-drivers-0bfae6c43134... | 1 
                 linux-6.16.12 | 1 
                     pound-4.8 | 1 
                    sdl-1.2.15 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/fdd1ffb933da4c262ad2a7ea35c9a42dbb40821d | ORPH
   s390x     |         inadyn-2.12.0          | NOK | https://autobuild.buildroot.org/results/431ec9c3beb063bf15be952b1fd71ff015b3cf0a |     
    arc      | libdbi-drivers-0bfae6c43134... | NOK | https://autobuild.buildroot.org/results/f4eef67abff415cfc143ce09271ab02f7f0945b8 |     
powerpc64le  |         linux-6.16.12          | NOK | https://autobuild.buildroot.org/results/4e3753a0cf8c56cac78c6f9e96b78ba3ee794181 | ORPH
  aarch64    |           pound-4.8            | NOK | https://autobuild.buildroot.org/results/5b975cc39b735059531f2ef911cfb1bbe46fdf61 | ORPH
microblazeel |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/6355d45ec6c09cb1bae6cde509075ee69d5e9739 | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
glibc-2.41-70-g1502c248d58c... | 1 
 host-softether-4.30-9700-beta | 1 
                 libgee-0.20.6 | 1 
                 linux-6.12.54 | 1 
                 openssh-9.9p2 | 1 
                openswan-3.0.0 | 1 
python-remi-2022.7.27-37-g1... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
powerpc64le  |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/d30a5302f9582567d2b0ebedd8e50cef689401e6 | ORPH
   arceb     | glibc-2.41-70-g1502c248d58c... | NOK | https://autobuild.buildroot.org/results/ccbbaf01bec476cd0a5479707b48b3215b3ea9f2 |     
  mips64el   | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/4c82970675f296b603ad9cad984f540901af4d22 | ORPH
    m68k     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/87f8a8c35f00c8fff49a9d84caf054218060aee9 |     
 powerpc64   |         linux-6.12.54          | NOK | https://autobuild.buildroot.org/results/122319dadddd9db9e60350fcdbc0223a0879c696 | ORPH
   mips64    |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/3d9f0722cc46f2d1df2152243e14b9bf21af2cf6 | ORPH
microblazeel |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/9d499426e95526ff5d31805a3a73e603c4c55bac | ORPH
 microblaze  | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/6e7b5e3cd4853b529e4790d6699cdba8b8649835 |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

        ltp-testsuite-20250130 | 1 
                    webp-1.5.0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/812a5be55b8420406ab82a7a6faebe465017674f |     
  powerpc    |           webp-1.5.0           | NOK | https://autobuild.buildroot.org/results/87adb1bdc9684bc96f034ac09a15839eb8957623 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
