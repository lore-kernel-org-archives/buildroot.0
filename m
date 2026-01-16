Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26303D4A605
	for <buildroot@archiver.kernel.org>; Fri, 16 Jan 2026 06:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A02038550E;
	Fri, 16 Jan 2026 06:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h8k19jTP8hHO; Fri, 16 Jan 2026 06:09:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8534085516
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768543747;
	bh=EmLes6RVR35uwWL8vz46A11RA5kxm4pMp+ekqK66/e8=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tHinQ+06GIU2v4AeIAtGnpW9IH0hghmKMM+EzeWyNj9eQO4NEVQgfAOtuDPopatsc
	 IyEmg2H8dOZo0oiOWsEzqQQM+3x5bOWIq9caTc/lEidxSYLz9RCHMMuma6UIYopQJ8
	 t3E6Ww4p2q7BRXHnbPIg9k5u8NQ0SWxS1ENvGb1XstXb3xqTJn+naz7/neQBVvz9fR
	 eTNDake13wxAtlmqEulLDm6DUzoBK85S6oAq6N26G5ytBFFVNm7A8bsQx3wNMoexsI
	 Ffp7e68AN3eGopC0/5mXmzmF44QiiumJ4SK9b67Tn65jFKoQGQLkkvJmrp+mA1GBbJ
	 et89RjB8mn1iQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8534085516;
	Fri, 16 Jan 2026 06:09:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 384A5160
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 06:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29E026F6B0
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 06:09:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4DALVEyaow1F for <buildroot@buildroot.org>;
 Fri, 16 Jan 2026 06:09:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 07AF96F6AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07AF96F6AF
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 07AF96F6AF
 for <buildroot@buildroot.org>; Fri, 16 Jan 2026 06:09:03 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-64b83949fdaso2479600a12.2
 for <buildroot@buildroot.org>; Thu, 15 Jan 2026 22:09:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768543742; x=1769148542;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HUpdD9RPtkzIiIlpfd5+U7OtZEZfwq0zG1HJpP9TB0o=;
 b=KZQIWmEAK3IXSAqqAGSXrKQnYT0QPh6FlWmUko0Tl9nc7dGnxeRSPI111eHRkwI3SK
 j1d3+5q4OeitZufSzORoJn5KDaL+kYTZWuffhXGu30wMHCeDV3M4HJ+DecGBpbuzScA+
 Ctb7MwY/YteqB/sGpNsBlNxO/b6xq68tmilDWSf9ZTSdrASAt31vk3GCZtAuvKKhAibG
 Ubk9T5YBItimQzo9nCT/asfEiY0nHPn942bwebiFGTKl8ZkzVbZzpBsPhgniNG/edOgy
 S7GY2VGyVDH/E/5DfW6zqwKxgLqZcLVzeZZW1bmHu8RzoB6KfHTZZKvSva2olH3LS1YY
 JQSw==
X-Gm-Message-State: AOJu0YyMxTf5FkI8x4WqLyi+3y7avl3vVOpRmD73fgsW61WJnv5cWeLk
 lbcEJkQNC7n4iIdHlSjOPbBvB8T14/7GpTR29dQiBlEfB1ymUDKuwwfDRorYPQ==
X-Gm-Gg: AY/fxX6iaJTKcdcsiVYSrO6UktEZVT0Rna6x9Ld4YyoVSkS7R0cNj8jV6YFjsp8jsW7
 WsmEdAj1hZ/fv+hwq7CRTVaKVHD7Hro4E7vMs8qoie70pcpKs6HVhYzD6GOPp2F7H8FA5LGMIDY
 uzxFCKqyd89NkKQXybXRsGU7bYPjvJRiiENmHhVP7xUhPm1F+rDJFv7wMUQAFZVr0tUDUF8GPLt
 /bbYDDE9QlD5A3I2itzhnmcLqBKQrGSj+Ve1ZowZ2Um5neJEgJ+wBzCdxkplY1v+DOqIOUxBC2t
 YIJWp2xuyVB0kxiWIfoY4bHrRZ+DHe/Ijt/imW6l//Pr630sy48vXMEnviAnWCSlkg9YOdsICTH
 Q9f6g5EAn+MGHJp63k3OLUnLVtVYhA+21JKGQHEKumGFwabTXYXOTZ5HgVYjIvJv4Wl68HU96Er
 PFOVfX47IyQ9wbIuhlRQ==
X-Received: by 2002:a05:600c:1385:b0:480:1b1a:551d with SMTP id
 5b1f17b1804b1-4801e33c18cmr20288045e9.18.1768537213564; 
 Thu, 15 Jan 2026 20:20:13 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4801e8c0499sm22511575e9.9.2026.01.15.20.20.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 20:20:13 -0800 (PST)
Message-ID: <6969bc7d.050a0220.3afef.6ab0@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 16 Jan 2026 04:20:13 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768543742; x=1769148542; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=HUpdD9RPtkzIiIlpfd5+U7OtZEZfwq0zG1HJpP9TB0o=;
 b=k8KvGlRnzS+8EtpFsCiIt7LjleHD9caMGNg2NQWHjWkw4weNO12aZg102aBhiLYwZz
 AhsiRiLHQhT+WvNpj+wsMDmlFJdLjjkFd3FUhPVFCTctuXUc19eT6ysIirfnEAO8lsym
 PuzB3sd4V3cIaNfrXQUaMamR9WsWGLR+D6EwdnBX+3IQZvO8EjW7U2tiZE8iVnx96mGW
 8BV4cIdJDdhTxtfrKP3f6lYwh0GR4OMTOiIYzdLi4FpWQSxRzh/XsRSeOnTazATtTaJi
 SdaTElK1/Cl/lOjkPzN9RXZkJSnhA4o/DxlE3OK9z8T9HbFowqNzN+1p7C6uvMaG8yr/
 3rRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=k8KvGlRn
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-01-15
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

Autobuild statistics for 2026-01-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 10  | 30  |  0  | 40  |
  2025.11.x  |  7  |  8  |  0  | 15  |
    master   | 60  | 113 |  1  | 174 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 8 
                   dash-0.5.13 | 7 
  gobject-introspection-1.84.0 | 5 
azmq-v1.0.3-54-g819b24035cf... | 4 
                   cvs-1.12.13 | 3 
                 jasper-2.0.33 | 3 
             libgphoto2-2.5.33 | 3 
     libphidget-2.1.9.20190409 | 3 
                    mpir-3.0.0 | 3 
                  brotli-1.2.0 | 2 
                   dante-1.4.4 | 2 
glibc-2.42-3-gbc13db7393773... | 2 
              libcamera-v0.6.0 | 2 
libdill-32d0e8b733416208e04... | 2 
libftdi1-v1.5-62-g5e67403c4... | 2 
                    lua-ev-1.5 | 2 
                openobex-1.7.2 | 2 
                   perl-5.42.0 | 2 
uhttpd-15346de8d3ba42200249... | 2 
          aardvark-dns-v1.17.0 | 1 
             berkeleydb-5.3.28 | 1 
                   bird-2.15.1 | 1 
                    brltty-6.8 | 1 
                  cairo-1.18.4 | 1 
                   ccrypt-1.11 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
             dahdi-linux-3.3.0 | 1 
dbus-triggerd-ba3dbec805cb7... | 1 
                 dc3dd-7.2.641 | 1 
                   duma-2.5.21 | 1 
                  ffmpeg-6.1.4 | 1 
                   fwupd-2.0.4 | 1 
            gdk-pixbuf-2.42.12 | 1 
                           gmp | 1 
               graphene-1.10.8 | 1 
                 host-gdb-15.2 | 1 
            host-go-src-1.25.5 | 1 
              host-guile-3.0.9 | 1 
    host-mender-artifact-4.2.0 | 1 
            igd2-for-linux-2.2 | 1 
                  kexec-2.0.32 | 1 
                 lcdproc-0.5.9 | 1 
                 libcddb-1.3.2 | 1 
                libgpiod-1.6.5 | 1 
                  libsvg-0.1.4 | 1 
libuci-f3fc0b76040685829191... | 1 
libyuv-4825d9b29eea4dac2460... | 1 
           libzenoh-pico-1.2.1 | 1 
          linux-5.10.246-cip66 | 1 
     linux-5.10.246-cip66-rt29 | 1 
               linux-pam-1.6.1 | 1 
                   linux-tools | 1 
                  linuxptp-4.4 | 1 
                   lsof-4.99.4 | 1 
              luabitop-1.0.2-1 | 1 
                   lzlib-0.4.3 | 1 
                    make-4.4.1 | 1 
                 mdevd-0.1.6.5 | 1 
                netdata-1.37.1 | 1 
               nushell-0.108.0 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                    olsr-0.9.8 | 1 
                opencv4-4.13.0 | 1 
                openntpd-6.8p1 | 1 
                      opus-1.6 | 1 
      passt-2025_06_11.0293c6f | 1 
                pipewire-1.2.8 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
                  sysprof-49.0 | 1 
toolchain-external-bootlin-... | 1 
               trousers-0.3.15 | 1 
uclibc-ng-test-132c6134d691... | 1 
ustream-ssl-5a81c108d20e247... | 1 
                     wine-10.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/164db616537595bbfc7aecf1b39c24097a87d55b | ORPH
    sh4      | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/c574b9ed61ccc62f4149e28858689d89f51e89d8 |     
  mips64el   | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/993d62165ff251804b2df5d04969338e298825d8 |     
    i686     | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/60131450bb16d162005b239e9bdfb547330aa020 |     
   x86_64    | azmq-v1.0.3-54-g819b24035cf... | NOK | https://autobuild.buildroot.org/results/c91d5a6d048bde7fa9d1ce8a935df9a02e41ed9a |     
    arm      |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/65947a53cc83c9a46239eab9acc1b411264a5978 | ORPH
loongarch64  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/ad6899929bb27df179da29197b5a89943919a861 |     
 microblaze  |           brltty-6.8           | NOK | https://autobuild.buildroot.org/results/320de5e4516f47d957047aaeced00a62f59e7a35 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/3ab582520b05b806d06b36a584deb8a60cf32a42 |     
loongarch64  |          brotli-1.2.0          | NOK | https://autobuild.buildroot.org/results/11c1b77749870d52611fdcfe3739df1fde3d7600 |     
  mips64el   |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/627f030f8fb37337f74390a142a82340e347c078 |     
microblazeel |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/ae8699f254d02a8cdbf41d7770ea1d46f25a2d8a | ORPH
 aarch64_be  | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/e24c8a72a1427e33bc67dcadf0076d00abd9f185 | ORPH
   mipsel    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/2c88750c7dba08b30e63a1025b5a9fdad6051116 | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/08e56a0b8b6506b9e84d7eaafeb668ee0aaa576c | ORPH
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/dc1c9355fa18486385e75d126212a1cb6adf9019 | ORPH
   sh4eb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/7cc0464f4f0d408460baf28dded8a1abb24beba8 | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/9a72c50113de463669fdffdb0d9367d40252c9f9 | ORPH
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/394819eb496e08863ea6492661d51f0dc59ea0ee | ORPH
    arc      |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/a1b8d7dabcedf0ee198b4e9baf54b53a4f0884be |     
  mips64el   |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/85f25fb13cffad567bcf662f5d52245abab844d9 |     
   xtensa    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/7b7aedbb48c8b6f5c30c890da786b7e906bd3f05 |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/932fdb31227c3ba049536ff224730509462e1e55 |     
   armeb     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/222757294f21988a7ae0c2c33b42b1d9bfe72d86 |     
   sparc     |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/893c9171f63d95782b204efdc726377cff92d0ea |     
   x86_64    |          dash-0.5.13           | NOK | https://autobuild.buildroot.org/results/bfe8a94a97fd4d145d9d34ac0791b9397393c1b8 |     
    or1k     | dbus-triggerd-ba3dbec805cb7... | NOK | https://autobuild.buildroot.org/results/6c147ae338b8468cd26c7c485d96e209caff7c23 | ORPH
   s390x     |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/fca2705829f0c272c1f176479cb59a86eebebebe | ORPH
   s390x     |          duma-2.5.21           | NOK | https://autobuild.buildroot.org/results/233ebaedc1bc037d8ee08b3bcb4529558e18a6ec | ORPH
    i686     |          ffmpeg-6.1.4          | NOK | https://autobuild.buildroot.org/results/625d3b2003f99d8b025de49a8a95293efac12470 |     
  powerpc    |          fwupd-2.0.4           | NOK | https://autobuild.buildroot.org/results/36094fae85df8ed35eea9a19e2160954ada84ed1 |     
   armeb     |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/dc1b118f4c4900b7a2801ab1f2ee46c5f072b482 | ORPH
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/12d7fea5441b399f0522358b14ed8d9142b020ba |     
   x86_64    | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/8cf83fd715bb0fa6e2e6af41a5f426b10e02f674 |     
   mips64    |              gmp               | TIM | https://autobuild.buildroot.org/results/e38d58ea96af82f10a7046f1b4036bd363bd62d0 |     
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/186d4d592f02eb41df322814f34d396003ad2bc9 | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/e35549fcb44f39e1c946c6532b26b2ba1110fa19 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/e6f6b1b03f233bd00b7625db88fb21a51ef407f7 | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/4577d4fab9a99a4ee89c44dec97e029405c2538e | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/b6f66b35a61881eaf63fa122ebf360d7dd7fa12b | ORPH
    or1k     |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/9b9388500d3e9d5b82ad8fe1b5cfc0e84e258b18 | ORPH
  mips64el   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/afafcabd11949f71c853bca894c9f856438649c8 | ORPH
    i686     |       host-go-src-1.25.5       | NOK | https://autobuild.buildroot.org/results/dfef133710dad78be773b9f0f37937dc0345b2b0 |     
  riscv32    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/aa3a4234d13d8a326127551dcfc65347fa206264 |     
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/cf5d5945352408d3f463a6a3c25daac8f80c3d16 |     
    mips     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/d286b49f91b8f79012ec4df5491a160f01691463 |     
    i686     |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/6a00a5670ba75cd8cbd6eb07d1942dc1cd1f13bd |     
  sparc64    |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/966fdd79cc75f65f3fe0bd0f6f5524284f61b172 |     
microblazeel |         jasper-2.0.33          | NOK | https://autobuild.buildroot.org/results/6085beec19955c55fcc8f7ccf3ed13fee1c531b1 |     
  riscv32    |          kexec-2.0.32          | NOK | https://autobuild.buildroot.org/results/eb8dd9bd05f8632cc77c0cfdb3a70dbf809dd827 |     
    mips     |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/23cf1af70a038fec7c921f5948026a67e2d2252b | ORPH
    sh4      |        libcamera-v0.6.0        | NOK | https://autobuild.buildroot.org/results/fb4d1d1642ac461d7a02effaf67c771a117e3452 |     
  sparc64    |        libcamera-v0.6.0        | NOK | https://autobuild.buildroot.org/results/905f644c369bccef9b0ddabb8ac592090a371d9a |     
    mips     |         libcddb-1.3.2          | NOK | https://autobuild.buildroot.org/results/537e9d147e67f6b3f1ade8f1e658ff47500edb9d |     
    i586     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/76daba1a3498d2ac06a0d691e39f56d749816c50 |     
loongarch64  | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/72b491393ca061389c5143ff8729c287edd9daa4 |     
  mips64el   | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/b9fca8c5f3e9f343349b7299e9f3cd84eccdef20 |     
   sparc     | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/b90fa078a4aeece764dc5ee12ec591ef98a1b855 |     
   xtensa    |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/043c122d6916783dbe90b67d66e308563635fd4a |     
   sparc     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/b97c58857c294f6a72eea53ff43cf9c519b8b37d |     
    arc      |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/da2f05a2ee77d84d0f314d327487007815cc17ae |     
powerpc64le  |         libgpiod-1.6.5         | NOK | https://autobuild.buildroot.org/results/91d75a768e1ca57b2c1951940dc6a540a8774bd4 | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/b41f5ed9f46c292cf9dc41aa647fff7e99e629ae |     
  mips64el   |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/4b3bba9150a629d3199cb4f3815bef433057d860 |     
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/d860b1c6db14112c8dac81493206e7cfe21ca441 |     
   sparc     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/bedcb2f32d7336d4769924f5bd10e03f51dfef17 |     
   s390x     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/993ca75a1e8a9c1be2d3c6598b97f3671fc0bd00 |     
   armeb     | libyuv-4825d9b29eea4dac2460... | NOK | https://autobuild.buildroot.org/results/68b3681016de9b075deb1a6ddef5ef8dd9423cb9 |     
   armeb     |      libzenoh-pico-1.2.1       | NOK | https://autobuild.buildroot.org/results/c02190176b1e2f18a1d6a0685432a1864eefab13 |     
   armeb     |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/b106a12973122d0f5219102b0b4ea29d70e4acf7 | ORPH
  riscv64    |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/0299c7b2365c258365eed2f1b26d6b3a49f46b43 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/ed4fdfa15bbe95127166cd301bc31befdf93267d | ORPH
   mipsel    |          linux-tools           | NOK | https://autobuild.buildroot.org/results/16c3e4914a6f1915e798132bc750b1e36b959bce | ORPH
powerpc64le  |          linuxptp-4.4          | NOK | https://autobuild.buildroot.org/results/2ea9e4581d4d918fc5b729ee1b43f69d724b826e |     
    arc      |          lsof-4.99.4           | NOK | https://autobuild.buildroot.org/results/59e0cc2692a8a7d587f5a4da90ec268237141dab | ORPH
  powerpc    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/b91b5da4884e7b646a9760470d7af7a60f4ece6d |     
   x86_64    |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/19fc295fadad5f97a8a2b88e1b34a5086d556925 |     
   mipsel    |        luabitop-1.0.2-1        | NOK | https://autobuild.buildroot.org/results/ed41036f7db8bd152ba3966fb1a2e03f9ece6375 |     
  sparc64    |          lzlib-0.4.3           | NOK | https://autobuild.buildroot.org/results/f812a0da4a47fe1cadf3cf69c1e2b6348fbb0654 |     
  mips64el   |           make-4.4.1           | NOK | https://autobuild.buildroot.org/results/d67d13db17b8ab24348b5b5352f3c3b27f04ff6b | ORPH
 powerpc64   |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/2c59b1235ad4b06fd92d2e955310481503556f52 |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/2fe38bec760cf9c825dda01d593152872b3e59a2 |     
powerpc64le  |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/f754aed32506d2738dc3c044419cb86e5d9ee554 |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/3c0da0c96e5113d2f0740480dae5c3ee3e447bcc |     
  sparc64    |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/e1934ee71353e1d5ce614d976c7f5c25a0c70153 |     
   s390x     |        nushell-0.108.0         | NOK | https://autobuild.buildroot.org/results/edfa682abe4b42f3936e38629047afdf95687215 | ORPH
loongarch64  |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/d964e49e30a9d8e4e44d4c423b56e8885c9de422 |     
 powerpc64   |           olsr-0.9.8           | NOK | https://autobuild.buildroot.org/results/08e5f439d5b276bd9b0e4d1368104650d182027f | ORPH
   x86_64    |         opencv4-4.13.0         | NOK | https://autobuild.buildroot.org/results/b299ae1450f4a2b7c5b3c7bd06c96b870644a4ae |     
    arm      |         openntpd-6.8p1         | NOK | https://autobuild.buildroot.org/results/fc119ae443f632fefb32af9011383e78c9cb0932 | ORPH
powerpc64le  |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/5a2fb6f2ce42e204b47974bd3c6c7a2e40955f8a | ORPH
 powerpc64   |         openobex-1.7.2         | NOK | https://autobuild.buildroot.org/results/d11ce184c221dac4dbe2176853e076e971e78149 | ORPH
    arm      |            opus-1.6            | NOK | https://autobuild.buildroot.org/results/bd93042beffcbc924c4c718e69d7db03986fc2c5 |     
 microblaze  |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/f1a26e5a0e6a8209cb714c42a28c8c28fd3676a4 | ORPH
   sparc     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/1aef2a88534abda0b22c00c2e803bc1e783f6f2a |     
   sh4eb     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/212fe40fef6c794954f042f10ac43a41e9d6f5ad |     
    arc      |         pipewire-1.2.8         | NOK | https://autobuild.buildroot.org/results/49d05249095e6fdeda17f974f1d7cc19a245a8c4 |     
    arm      |    spandsp-3.0.0-6ec23e5a7e    | NOK | https://autobuild.buildroot.org/results/8077f06544a35a0326602fcd029e8df8860bbe00 |     
    mips     |          sysprof-49.0          | NOK | https://autobuild.buildroot.org/results/92d370074c80dbc9b77d7ad993b457b756818338 |     
    arm      | toolchain-external-bootlin-... | NOK | https://autobuild.buildroot.org/results/e14994b474668b026508ed6adf7328e902378ce9 | ORPH
   mips64    |        trousers-0.3.15         | NOK | https://autobuild.buildroot.org/results/0d4e9560bd05cd1fcb1d0098ecb4b9466bd2c857 |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/28a5cbdad41a1105cca979391d74f73cdb165024 |     
    or1k     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/4f3c61f2f9502491d0394fc951018322a53a0704 | ORPH
  sparc64    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/2d2badceb927667a18e5de8427080015f0f2f926 | ORPH
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/b428adfca93377c79b9762d12baa984647be124c |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/b317d7f4488810bd4636fb66831bf759c3737368 |     
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/9619406cc8cbc46bff46ffc036979b09af215c43 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3d275066813d9a8c54ee7e3a3ffe106cb3d908ba |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/c82e9116c2f452562e2a7418c76eaf33c5afee66 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/9aa65da45ac3af66d2859c1dc0e5dca952197db0 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/044d3162987068f7c968df71a0b69b600f2878b8 |     
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/c986236f0fde99373c7213a4d158ed6002e0c85f |     
    i686     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/09c2af103b170c81c9974fc11e4169e5050fd093 | ORPH
    i686     |           wine-10.0            | NOK | https://autobuild.buildroot.org/results/020c02887bf14965e2399358dfdf12e440efd493 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

                   dante-1.4.4 | 1 
                 dc3dd-7.2.641 | 1 
  gobject-introspection-1.84.0 | 1 
    host-mender-artifact-4.2.0 | 1 
            host-mtools-4.0.48 | 1 
                  libite-2.6.1 | 1 
            lttng-tools-2.13.8 | 1 
                       unknown | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/9362c4da8e8e96e31e29aeffc187b0267966a101 | ORPH
  sparc64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/969e93b74fee2c3019330820e81121df2d69854b | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/ca98de26c707fe325d234e74801dd9224c4f83a1 | ORPH
  mips64el   |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/c99b33f331fff1673978683c0401ddd089594981 |     
loongarch64  |       host-mtools-4.0.48       | NOK | https://autobuild.buildroot.org/results/e361685637f28b28fbfe3af90c589d84fc35516a | ORPH
  riscv64    |          libite-2.6.1          | NOK | https://autobuild.buildroot.org/results/33029da7172d5524cf4d7098a35ba68392f88bae |     
   s390x     |       lttng-tools-2.13.8       | NOK | https://autobuild.buildroot.org/results/7b705f088cdeaf0ca830126673f40d66b48d5830 |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/433d2f735e5769e8e6a0e365a4279a8858241043 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                libselinux-3.7 | 9 
           host-libselinux-3.7 | 5 
                  libsvg-0.1.4 | 2 
               asterisk-22.5.2 | 1 
                  ffmpeg-6.1.3 | 1 
  gobject-introspection-1.82.0 | 1 
                   i2pd-2.50.2 | 1 
                 libgee-0.20.6 | 1 
                   libks-2.0.5 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
        ltp-testsuite-20250130 | 1 
make: *** Waiting for unfin... | 1 
                   perl-5.40.3 | 1 
                    sslh-2.0.1 | 1 
ulog-0389d243352255f6182326... | 1 
                 xenomai-3.2.5 | 1 
              xmlstarlet-1.6.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/4c9feb40e6300e16def7ec2b875afdba0c6cafea |     
    m68k     |          ffmpeg-6.1.3          | NOK | https://autobuild.buildroot.org/results/e9e9827d0e28daef97965b668e50debcd290cdf0 |     
    i686     |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/f00118e8906b9f3caea9eb6d4b0d0d8e5c3f72d3 | ORPH
  mips64el   |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/b768bc6c0e0be0cabf5f59bb16bbeb1694335932 |     
powerpc64le  |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/36b5628cee373f145f79cc1f977720ad135b74c9 |     
  riscv64    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/b5876d723c79b7f8b987bed0356e25b889db5b47 |     
  sparc64    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/f96cdeb9f5af1bf933ff6361d0d3dc482fe37f78 |     
   mips64    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/81bd49c8ef6534fb704e8545d315d1d2a1608110 |     
    sh4a     |          i2pd-2.50.2           | NOK | https://autobuild.buildroot.org/results/d244c3a602ed620109a1eec21b84bfa064436612 |     
   mipsel    |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/f6a2e1292fae034a7dcc52b1ca99a7fb5d76da74 |     
    or1k     |          libks-2.0.5           | NOK | https://autobuild.buildroot.org/results/ba5c0587a63c830c194d8cf73671f9a73e187da3 | ORPH
   mipsel    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/d91a61ba277aff11e12f6cd8350f74d7190a989d |     
 microblaze  |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/db807e506a161846244047477da1ed91fd6613f3 |     
    mips     |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/9118969929998e09e78efcc42d8768d016559963 |     
    arm      |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/4eaa826d3a6f4986202407fb2d31ccf0c83ea4f8 |     
 powerpc64   |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/8464efc395da30d67fc0aed760d90ff0b2490a16 |     
   x86_64    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/b0e9a3bf479c64c70977f7c3738866bd078e5831 |     
 microblaze  |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/c3c39f0d4c001fff001a77be9b729656ef0b9ef5 |     
    arm      |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/574b0abab6589349cf38844a08a1df9596f2e33a |     
    sh4      |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/5d0f09817cf20e215397f298eca32be3cf5ad80a |     
   sparc     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/8e84a503b2a2bc292062cfa867ea06006831b617 |     
 microblaze  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/45822f8e317242887e14615547031331aa90eb8f |     
  riscv64    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/4f6042cb81e36badb1a323fd5f8b6b8775ac4c6d |     
   s390x     |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/7e20f156635bb43bf318a6b305104962208d2c8b |     
  mips64el   | make: *** Waiting for unfin... | NOK | https://autobuild.buildroot.org/results/4e14703c7582eb62ecf64d7c39c82b88c451cfe7 |     
    arc      |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/39bec5eee5edae6ae5c2891cffaed7a3ee8dbf66 |     
   s390x     |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/367f699a26a711ee3b7668a47ccfdbf76c29c078 | ORPH
  mips64el   | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/1ba78cd71db17f0d6741f696d6e36c81d62a9929 |     
   x86_64    |         xenomai-3.2.5          | NOK | https://autobuild.buildroot.org/results/167fecc6b1dba0bef0ff6331a10e8d0390daead6 |     
   sparc     |        xmlstarlet-1.6.1        | NOK | https://autobuild.buildroot.org/results/594b9907a1a5fc7240b0bf3fa07fb69c78946c4b | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
