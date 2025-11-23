Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13C00CFA46B
	for <buildroot@archiver.kernel.org>; Sun, 23 Nov 2025 04:27:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82E4540F15;
	Sun, 23 Nov 2025 04:27:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w2EphbuN9tGn; Sun, 23 Nov 2025 04:27:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1601441028
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1601441028;
	Sun, 23 Nov 2025 04:27:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BAE46158
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 04:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B729440FE3
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 04:27:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2UxFEHd73XBZ for <buildroot@buildroot.org>;
 Sun, 23 Nov 2025 04:27:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org F224340F15
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F224340F15
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F224340F15
 for <buildroot@buildroot.org>; Sun, 23 Nov 2025 04:27:33 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4779a4fc95aso27122955e9.1
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 20:27:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763872052; x=1764476852;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=l1XcqbMLMNrbwfJMc5NO0bUzUqCVRafoyOvjUrDTjNU=;
 b=Hy1TGH3H6V10kvBntKUAwFh41ToA5rJjYT209H3rC0TpzpKbCitG68tLbYxpUWiO77
 8fHwv/r97ifToF3uAbBW1kj3abPR3YkbwFEzGrsub4ZQ6aAO4GchjobhlSQu1a51HnB4
 xohLXA5IhB/9sFiLVClk9JcHfM1sokDlmpCkgy35SFm63ghcHuyfO36YrKg0Hj72achL
 VnV+fMp3KcjbdqnhFiyksmE1x2CS7nSyJwuiW1CkDlKoUfMATE0xevddtD8HUU5APyl6
 WQqf6uvPAYq4CDMnRVHlWIGEu94oqRANzKnG9ZKm0xG9FjMXkoLsuLVHfZG5RnKjg5yi
 +MEQ==
X-Gm-Message-State: AOJu0YytEBDqDkrVwOKtmQKhqQjImsTnv7lRKldTTZLZtPK6lv4stBlT
 H3vOYxS+uS3d+VjF267TZjYkbhxC6b1Zkqc46Ys9+xaNAyGyuyp9oflJEyD9qg==
X-Gm-Gg: ASbGncuNirB103cIM7hxlsOQhQoswrT8rJpt9RY0PF44GHRIHsNin+95BOvp8eXmsk+
 fk3JRg6CCUwac7jTmQQys7x73ckj2e9LIOknYz0eOkFXbn0k0sheDBq3UfKiSS3L7oAnXyPf/sL
 Yt3YhWBRafQq4JdkpUJb0LHbZVdlJPb9pK+AxqGlw8tcdk/uT9SY6t1uhW2Ky3iAK4KcNXFd0NF
 EZ9EXCe3v7R6txE11a1YF6HIc718Oe1QTVUqSs3MBtsK3TggltN+Pz5oRT1UUa+dTnfiKOC+qlx
 +B6TCmKlYl97GaL8aUTak+WdUJjXo7RviaElgYJoARiCdQ/9tjHfpe4SMn4cD7RLkTCEG4e8JE/
 mR8ym6PxQzsDXwqyeCFfj8Ruv7O0qK4jE7LGIk0UkCgeFbfsiGwLuH9PpjPVooAeVd0GCIvoH20
 hQk8yveAEw/u588ZvUIw==
X-Google-Smtp-Source: AGHT+IHYYt9On1R3DXH3xhaA8crh8UQxptcsgEoEyG8vdr+sPblaPQQlQrbotqFqNGZhXtmHKPFuCQ==
X-Received: by 2002:a05:6000:2583:b0:429:cb8b:b58e with SMTP id
 ffacd0b85a97d-42cc13913a6mr9707211f8f.28.1763872051449; 
 Sat, 22 Nov 2025 20:27:31 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42cb7fa35c2sm19387389f8f.25.2025.11.22.20.27.31
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Nov 2025 20:27:31 -0800 (PST)
Message-ID: <69228d33.df0a0220.31ed84.dc5a@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 23 Nov 2025 04:27:31 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763872052; x=1764476852; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=l1XcqbMLMNrbwfJMc5NO0bUzUqCVRafoyOvjUrDTjNU=;
 b=ad1ADVJa80MbP/lIvDbWHsgIGU+1cB+ZzlxZ/PIVtwney1bM8DihfYgPPJ6sGn4ZsC
 xUf2jbu+BfeOWzS9owWeGKCgWuVHiurZnvN6POg6qIkrWJbs+ggIMCO/j4jw/lGEW4H7
 VFXTbf7d4A5969GY5egUdl1L8CtW0VKv0qNSSenLZ0FG+FCHe+kcct6bavCCXiGmzoPw
 4ipC5fi46gfCNAjnJSpFHNHeyklB13Vj+fcSNAZRCQfwT9n5I5uedi5DmOPTl2Nnzbml
 TWBOOeVMDEbcWtmqoPgBHsA7HYQMWGTut5wHBj4p3D4EjY7gQuXVriGe2YusXhSrCSwU
 Lt3Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=ad1ADVJa
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-11-22
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

Autobuild statistics for 2025-11-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  7  |  8  |  0  | 15  |
  2025.05.x  |  3  |  3  |  0  |  6  |
  2025.08.x  |  1  |  5  |  0  |  6  |
    master   | 27  | 90  |  0  | 117 |

Classification of failures by reason for master
-----------------------------------------------

                     kbd-2.9.0 | 7 
              e2fsprogs-1.47.3 | 5 
                  linux-6.17.8 | 5 
                       unknown | 5 
         host-e2fsprogs-1.47.3 | 4 
                   cvs-1.12.13 | 3 
  gobject-introspection-1.84.0 | 3 
                    mpir-3.0.0 | 3 
          aardvark-dns-v1.17.0 | 2 
        edk2-edk2-stable202508 | 2 
glibc-2.42-3-gbc13db7393773... | 2 
                     grep-3.12 | 2 
              host-guile-3.0.9 | 2 
                   libcap-2.77 | 2 
              libopenssl-3.6.0 | 2 
     libphidget-2.1.9.20190409 | 2 
                  libsvg-0.1.4 | 2 
                   perl-5.40.2 | 2 
                python3-3.13.9 | 2 
               alsa-lib-1.2.14 | 1 
               asterisk-22.5.2 | 1 
                      atf-0.23 | 1 
                   atop-2.12.1 | 1 
                   bird-2.15.1 | 1 
                   botan-3.5.0 | 1 
               bpftrace-0.23.3 | 1 
                   ccrypt-1.11 | 1 
             dahdi-linux-3.3.0 | 1 
                    fcft-3.3.2 | 1 
                      fio-3.41 | 1 
                 gerbera-2.6.1 | 1 
                haveged-1.9.19 | 1 
            host-binutils-2.42 | 1 
          host-binutils-2.43.1 | 1 
               host-make-4.4.1 | 1 
                  iozone-3.508 | 1 
           libmicrohttpd-1.0.2 | 1 
     linux-5.10.162-cip24-rt10 | 1 
               linux-pam-1.6.1 | 1 
                   linux-tools | 1 
              netavark-v1.17.0 | 1 
                nushell-0.96.1 | 1 
                 openal-1.24.3 | 1 
               openblas-0.3.30 | 1 
      passt-2025_06_11.0293c6f | 1 
        perl-xml-libxml-2.0134 | 1 
          powerpc-utils-1.3.11 | 1 
               pulseaudio-17.0 | 1 
                  readline-8.3 | 1 
                s6-dns-2.4.0.0 | 1 
        s6-linux-utils-2.6.2.1 | 1 
              tailscale-1.78.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 powerpc64   |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/d8256276355b661b79b4ef1f9de8b18ab387af5e | ORPH
   s390x     |      aardvark-dns-v1.17.0      | NOK | https://autobuild.buildroot.org/results/3948577f7bbdc70ebe86808031cd7e4aca7d6c53 | ORPH
    i686     |        alsa-lib-1.2.14         | NOK | https://autobuild.buildroot.org/results/3b606e0c6160563e410535d38a0e7bb09041f223 |     
 aarch64_be  |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/efed75e29fad45754a27f2f4e1cd18f1bbf9a114 |     
 aarch64_be  |            atf-0.23            | NOK | https://autobuild.buildroot.org/results/41b25ee8e66e34323eca011e4b5fe479ece9ed76 |     
    arc      |          atop-2.12.1           | NOK | https://autobuild.buildroot.org/results/5226bb98e4ec0659bb1c8af3e2b102d861a8fe43 |     
loongarch64  |          bird-2.15.1           | NOK | https://autobuild.buildroot.org/results/f15d43c10670afd3a8814c078d1df10c79906d8f |     
   x86_64    |          botan-3.5.0           | NOK | https://autobuild.buildroot.org/results/02bd7f5c6697eddb9aadf8cdfd8f583e8fdaa371 | ORPH
  aarch64    |        bpftrace-0.23.3         | NOK | https://autobuild.buildroot.org/results/30527d8f06cb6b3893b17382c39e3ed38cc0a720 |     
   s390x     |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/0afb3888a3f6ddfa940b858f5d5dda2f9b9ef4e8 | ORPH
   mipsel    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/e671ef96ac11019fe50b394b2ee78923e00da520 | ORPH
   armeb     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/b88e05894594d2f3f87425afc49a9f8300655715 | ORPH
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/366a5db7a460e4a384bee68858e890f0f73cda0a | ORPH
 microblaze  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/684d15773b627855fce48165fb62d973f0c67a19 | ORPH
   mipsel    |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/40b1ad161cb40fe2e0f8ffb9f0bd5b2689bc0620 | ORPH
   mipsel    |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/acf83f0643730d02b731e70ac21dea84275f55d5 | ORPH
   s390x     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/9061deda420e9b0b3effa769fa1f536ba6c91b1c | ORPH
microblazeel |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/57b1ae7ab7addc1ee8567a8fcf9be13cc02cdca5 | ORPH
   armeb     |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/84af599d23efc53b46c2b1d8fe51d1faade9221d | ORPH
    i686     |     edk2-edk2-stable202508     | NOK | https://autobuild.buildroot.org/results/0842cb3be28bad58faa7250d22ea569ecb0d03de |     
   x86_64    |     edk2-edk2-stable202508     | NOK | https://autobuild.buildroot.org/results/4fab572f8d0ccdd8ac30513e6e17fec42701267f |     
    m68k     |           fcft-3.3.2           | NOK | https://autobuild.buildroot.org/results/52275c8957bbc86058a680dafb4865ade49bd2ad | ORPH
   arceb     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/3de4b5ddfb0701600ac1d808be8d0b674cb47691 |     
powerpc64le  |         gerbera-2.6.1          | NOK | https://autobuild.buildroot.org/results/b6bd96cb9dbcaff9351ef156edaec7d1b5290b9e |     
    arc      | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/f5adde72645b8ec0b81b455f67f232e206dbdd59 |     
    mips     | glibc-2.42-3-gbc13db7393773... | NOK | https://autobuild.buildroot.org/results/3a1661e9c484d034e7cf88fc39172c7720b16969 |     
   sh4eb     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/6f0d0e5798ade0398a64b0485bf6982dfb60de2a | ORPH
  aarch64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/3ebf08c22a599a4850c4e9d0ee3a67b7a0dc293e | ORPH
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/6d0ac8d9f6f79c020ddfae5dcd8e050d98299131 | ORPH
microblazeel |           grep-3.12            | NOK | https://autobuild.buildroot.org/results/8bdaeb3d6fa2ffe3c0a82b7f48a542f748c1b44b |     
loongarch64  |           grep-3.12            | NOK | https://autobuild.buildroot.org/results/589446807888071bdaa5d389c25e29c056c4cd6a |     
    arc      |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/c4771348d7679c2d05d6e8d97438b4939bc033c8 |     
   sh4aeb    |       host-binutils-2.42       | NOK | https://autobuild.buildroot.org/results/f7ecf7c646c0214f89c51cd3d1e0fbe2d5183376 |     
   s390x     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/2337731b07f25fb516a70a83dc2a0b54db709572 |     
 aarch64_be  |     host-e2fsprogs-1.47.3      | NOK | https://autobuild.buildroot.org/results/e6d6df8b9a8200a4ddd36062a9233ada85df6be7 | ORPH
    i686     |     host-e2fsprogs-1.47.3      | NOK | https://autobuild.buildroot.org/results/08c874023ecdcdbd03ae68f8631a284eb0f9fd83 | ORPH
  sparc64    |     host-e2fsprogs-1.47.3      | NOK | https://autobuild.buildroot.org/results/a9e26d562ba4fe4d6a46620a08f6108d472f084e | ORPH
   mips64    |     host-e2fsprogs-1.47.3      | NOK | https://autobuild.buildroot.org/results/5cfb1ae6ee7efdda9bad7e61cdd2476c66c7a3dd | ORPH
  aarch64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/4ca5f3c2639ef7ded960f70d4b497a12ec240143 |     
   armeb     |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/f6a80f298e45cc328e1564c02dcdfd3ac372be7f |     
loongarch64  |        host-make-4.4.1         | NOK | https://autobuild.buildroot.org/results/e45e5b7932be631d7363b41cd2ae95788f100425 | ORPH
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/fc1d54b37621d7c704793ac319d967fb044a55bf |     
 aarch64_be  |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/73d9fd042834148c8a1d67136fc5973e0acb9201 | ORPH
    i686     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/e596b9448a03d3b240b94f01241ca10350cc26e4 | ORPH
  powerpc    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/f29ddf2415b1bfc399b908ff8d7421f3f5f4912f | ORPH
    sh4a     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/9223395462dc4aa7e40c5e2b3197d3f1f977da9b | ORPH
   armeb     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/145095bc8c939e4676c34f5c2a6a19ab42d47d2f | ORPH
    or1k     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/b1235c3abed5d602fd92a04178c1e0cca04bcf7a | ORPH
    arm      |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/a398a98323cce93865078cbc941a3987ddd8793b | ORPH
    or1k     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/e926a719ce13164c7a8a8b489099fe1d803411e7 |     
   mipsel    |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/05d48415b6cd1ccbf354c102adea524077753df0 |     
  mips64el   |      libmicrohttpd-1.0.2       | NOK | https://autobuild.buildroot.org/results/545ab52c15adf6b6348e8ed4637ed9917204eb0a |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/d1a2da56d822941918dab67d439ef78c9aa7f864 | ORPH
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/2409a61d4e6f9788d1c5486e729a0551056be5bb | ORPH
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/3a23456fb549c620fd193e270f266c8f0cbb9abe |     
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/7dd71951411ec5eac396a2997ce7353b72996dfc |     
powerpc64le  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/21b2e4b44d99812259aeecff48c14aadc92b6d02 |     
   mipsel    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/3547b5d53c3abc397f56c8e30b10e40a19b3b8be |     
    mips     |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/dda85b314db8a98ddc7ab94322fa2a97cbdbbe85 | ORPH
  powerpc    |          linux-6.17.8          | NOK | https://autobuild.buildroot.org/results/f110490b443ceb40e1133f6c69ada7dce5363fec | ORPH
   mips64    |          linux-6.17.8          | NOK | https://autobuild.buildroot.org/results/a2f493249c5cfc421645e2de8c7d13af144695ca | ORPH
   mipsel    |          linux-6.17.8          | NOK | https://autobuild.buildroot.org/results/e563db07cce3322d483398ec02b9c06e43218afe | ORPH
  mips64el   |          linux-6.17.8          | NOK | https://autobuild.buildroot.org/results/8a1a489e8c80dcfbe19a247e39e84180658bb69f | ORPH
   x86_64    |          linux-6.17.8          | NOK | https://autobuild.buildroot.org/results/04d0eda736b7f8186e89e26450aa532eac010130 | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/ac36fe7544426c04995f18cc587ff94845c346bd | ORPH
 microblaze  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/98f463b2653b5b3bea9561c85d85d59391be7622 | ORPH
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/4b43b9bce45c46da7f1eb01a842ccdc1c00170bf |     
 powerpc64   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/4fedd94a4b410204a8c5279c85800289b6a20401 |     
  mips64el   |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/971f733d048a2d616500437a5e28a8b58b29cee8 |     
  aarch64    |        netavark-v1.17.0        | NOK | https://autobuild.buildroot.org/results/45a81a70362b1f0f89d798c1c5b8518a13ebc872 | ORPH
  sparc64    |         nushell-0.96.1         | NOK | https://autobuild.buildroot.org/results/12840d30bfa9903be1f59cc7898225acdfa0fc16 | ORPH
   sparc     |         openal-1.24.3          | NOK | https://autobuild.buildroot.org/results/7433da62b0295f06c172c5364b419218280cbd0a | ORPH
   mips64    |        openblas-0.3.30         | NOK | https://autobuild.buildroot.org/results/93c7367feff7e6cb54d2e628b003c282eeaa4e09 |     
   sparc     |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/dcd7744169ecc612e14948eaec11210a8b50da96 | ORPH
    mips     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/fd1755c12c9011a127bbc5f2f51522922921ab4a |     
   arceb     |          perl-5.40.2           | NOK | https://autobuild.buildroot.org/results/96bbfcbbe94d3b4b8a73a541b80b752ef4191079 |     
   mipsel    |     perl-xml-libxml-2.0134     | NOK | https://autobuild.buildroot.org/results/1b30b3d71bea5e0d56427e579a69d6b4304daa03 |     
  powerpc    |      powerpc-utils-1.3.11      | NOK | https://autobuild.buildroot.org/results/0052ab92174a7b04bd70ae20b6c45712cf7bf2b7 | ORPH
    mips     |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/f460e8fc6a33bce7ea370e7b29b63651af756d02 | ORPH
  sparc64    |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/af1fce087eff1d645029eb8c0f2d1f3773d8470d |     
    sh4      |         python3-3.13.9         | NOK | https://autobuild.buildroot.org/results/19c821a433958505ef3172ed409d41a4e37e810f |     
    sh4a     |          readline-8.3          | NOK | https://autobuild.buildroot.org/results/6fd96512c0672ab8c750a18bbbf4dfae254f234c | ORPH
    m68k     |         s6-dns-2.4.0.0         | NOK | https://autobuild.buildroot.org/results/e14389147aca5d87df93b4641a9a90fe1dded008 |     
   sparc     |     s6-linux-utils-2.6.2.1     | NOK | https://autobuild.buildroot.org/results/e33cb0d31950aec57da4c12ad08b0ff277d46571 |     
   mips64    |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/d301c427bff9dc469c6977ba2920bac0892da848 |     
   mipsel    |            unknown             | NOK | https://autobuild.buildroot.org/results/be7b414a276b62e2dc65a37bdc7ea4e61c8ecc51 |     
   sparc     |            unknown             | NOK | https://autobuild.buildroot.org/results/96b98745b973f8e6d207bed479c57e19fe1cbf92 |     
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/1197bdef503cc360280df9c8f4bbc3f73e25818e |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/9da819877f350515882d6b6510f3aafaef535b7e |     
 powerpc64   |            unknown             | NOK | https://autobuild.buildroot.org/results/aa28fbd3584026aab9bf22aecef31250532cb85e |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

     libphidget-2.1.9.20190409 | 2 
                  cairo-1.18.4 | 1 
               freeipmi-1.6.14 | 1 
                 logsurfer-1.8 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |          cairo-1.18.4          | NOK | https://autobuild.buildroot.org/results/b119824a45907e80d29231ead4c8db845791b17c |     
   mips64    |        freeipmi-1.6.14         | NOK | https://autobuild.buildroot.org/results/2e87dadac63a07118f6ea65864ecc3c8b1e8583c |     
   mips64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/7094adbdd30e91cd8dca981023edc56866d3679d |     
   x86_64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/3c6cc35e8657b520255da1d3ed1b4cf9397eb1ad |     
   mipsel    |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/92c77d54401091dced8c8d4aeb16a405047d4134 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                    dust-1.1.2 | 1 
                     fd-10.2.0 | 1 
             gupnp-dlna-0.12.0 | 1 
          host-binutils-2.43.1 | 1 
           host-go-src-1.23.12 | 1 
              host-rust-1.82.0 | 1 
                  hwloc-2.11.2 | 1 
            igd2-for-linux-2.2 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   armeb     |           dust-1.1.2           | NOK | https://autobuild.buildroot.org/results/67433e5b425c1f0c8d7246d11d2020e0bc6169bc | ORPH
powerpc64le  |           fd-10.2.0            | NOK | https://autobuild.buildroot.org/results/f50d6bee8da7137f1ddc4a4a8371d302cbff5982 |     
    or1k     |       gupnp-dlna-0.12.0        | NOK | https://autobuild.buildroot.org/results/a5305d411f6a0ef5343142499d51c91bc9599b0a |     
   sparc     |      host-binutils-2.43.1      | NOK | https://autobuild.buildroot.org/results/1bec0592c1fc1ae8a9aac7cbe464c938a0ff6116 |     
    i586     |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/3f9338f6d472587e779aaace3f5499cd12b9547f |     
  aarch64    |        host-rust-1.82.0        | NOK | https://autobuild.buildroot.org/results/5c032c32158348cf8931325ddf0df8bc4348785a |     
   x86_64    |          hwloc-2.11.2          | NOK | https://autobuild.buildroot.org/results/11423ae9326a93c3a5a34c9d6ca3cf058e35bb81 |     
   mips64    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/5c7ccd21f40b5e2fde963d42bcda1ed04b34862f |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

               bctoolbox-4.4.8 | 1 
                 libgee-0.20.6 | 1 
      passt-2025_02_17.a1e48a0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        bctoolbox-4.4.8         | NOK | https://autobuild.buildroot.org/results/4dea386c3f02a161c109a003cea3566d54d07378 |     
   s390x     |         libgee-0.20.6          | NOK | https://autobuild.buildroot.org/results/820d76099c2d667ec299dda47eb7ee2fec9051c0 |     
    or1k     |    passt-2025_02_17.a1e48a0    | NOK | https://autobuild.buildroot.org/results/b698d6184534b2487252caceb6a08d7546f6ff2f | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
