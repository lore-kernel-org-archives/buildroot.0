Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB14BC5DF74
	for <buildroot@archiver.kernel.org>; Sun, 22 Feb 2026 04:30:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5F5C41845;
	Sun, 22 Feb 2026 04:30:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C6ND05GVwjnI; Sun, 22 Feb 2026 04:30:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87D0840D26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771734636;
	bh=6/Ybf7Ocl3VfmkSOuq/iFtu29nQXwNctJIq1jyAv3EM=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PURb4V1L4kyXyFYWxV59wUVRvp/kw+X/DV13sMnoyZ2gshuaBaZOqkOER5YJEMLG4
	 EP4y9VZEe/yO0UHYVBwehruRRZnCwYs+2etZiEZyWF2ZYWAZMn1hlRbJKweZhf/IXC
	 nRW5okNcMGc4hT1Mw0zg7QvslKawt6YZlY7QVtaKAvWTkm4vX1+cBcffpYQpyCI0Ct
	 sTJvRloWlNVTQKlbwWoZUauCaV2krtT16qUlW6oqRZoamq2rFml7bGelYe/uzZli3Y
	 bNeGDO0gsaHZbVeSHOJ07HUEbvjJKx6HhU1/2LJ1WjWdRNpaxBLCEk6MCGUofDfSb3
	 A8pB1uU785ikA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87D0840D26;
	Sun, 22 Feb 2026 04:30:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AD601CE
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 04:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E1B1160E02
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 04:30:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SiBaWme62Uh2 for <buildroot@buildroot.org>;
 Sun, 22 Feb 2026 04:30:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4B39460817
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B39460817
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4B39460817
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 04:30:32 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-435f177a8f7so3293454f8f.1
 for <buildroot@buildroot.org>; Sat, 21 Feb 2026 20:30:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771734630; x=1772339430;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t71yuFUcfw1cPJewy8NrGa75NhCOj8RYmVRlB7rHOXU=;
 b=jE3F+yutDxPtnH71WvEezBl0SlQK/I1qHh1JqHx+l85QGYj2/A95B4i4P97iSyghEc
 fWjr9bXRGEJT+9flb4oP+aM3EqQHx8FaA0YJHIr6aK9ei+AV+6ylV2HimfvJ1w/tt3QP
 p8szbp/HxS9f2vXOaT6EEyrtS30MpOEgVT3T8tUdbj5OJgQQTJDVhy3sNquYaOUbkbdD
 BbvUg+pnWLMFI6GnQ5qE5mVeiu7hE/22xaaZAVL+/DHvM2n8tcioOCihdSs9XgN0TvTl
 dMp9bhN2hXKAeDuQxVPqY0HYZTGG39WswrWVpaChUa9iv5nI+VA4T23rQcCvD/g0T21X
 EeOg==
X-Gm-Message-State: AOJu0YyG5w0rMocbK2jeCMhD7ss1LG8r2+qlefe/MV1f6FOjaSRwsl9W
 N46nFGrI9WYO9FKUb8wYafIy6gK5gBXtKg7hwnecW+XUfH9Nnfs38sHDF7I369Zu
X-Gm-Gg: AZuq6aKRCmXEXxDYoWx5mZa3hjYuTNcanDPLbPT1q/jvSgs6kCaJ4fJ+kibpRVdFYnI
 kB1YoGMFq09XgsW83UdZsJ/wGMkLRN1NFQFRI60G5wuGHHhABOBTVP2+JG0iO77aKd1r20N9aT6
 vUcCPCd0s3N/jgcXSmzdFYGMj8Weux/mEiJ+D8bGdY8PAP3XdZlh1q46WBv67BtBYq2KvKLOzxR
 B0sGTYKaeylEiNIsJmy1cgqdrpFzjkHS3dwpwreJVBpMfp7J9IoXBOF+AYofYLRQc4jaReJN1KV
 zE/TYdNuCcp0wHQCOmjkCV+/HMh1O2R7tirFoA6aOMtpOJmzffaOlyzFbGaHUCEeyNiDXfYywsX
 CmEGneGkEAPLG7XHSJCl44XXEAcc4ezSiTSmquHSfCl2LPguUhAYZ/NjlOZwP+P4IDXmyZ5D8K+
 x/zHqlyuwv7cfSCoi21TsKJr81LDaYVQ==
X-Received: by 2002:a05:6000:4283:b0:435:9223:bfda with SMTP id
 ffacd0b85a97d-4396f157d14mr8993796f8f.21.1771734629834; 
 Sat, 21 Feb 2026 20:30:29 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d54760sm9527796f8f.35.2026.02.21.20.30.29
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Feb 2026 20:30:29 -0800 (PST)
Message-ID: <699a8665.df0a0220.245099.69c1@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 22 Feb 2026 04:30:29 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771734630; x=1772339430; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=t71yuFUcfw1cPJewy8NrGa75NhCOj8RYmVRlB7rHOXU=;
 b=BsLEXiI0NF+JdRqw/7xmKVxsw8YJw725G/bkvu4nIJiIKDb7X7X4t3zUnh1YZzLGaJ
 v9CWhDVDYm7l3F31ZPyYiBN6nkjUd3WSGUWB6aaIJ8V9iVe3uD3r2rED9HexUK7N5ClT
 XIrWhYuDG2KcPLJhVtzev9btQVlIJi4PMbUY8em4SuyNj+LWX52uuse8AXzPU19WKZSX
 fb2Rc6CRaK7p40WOYRc0IhM4d7mp/RRs2EUE4uxr9Snn86JXa8c8t+xZvew0rg1KCXYY
 uTq6Ln/zyMUiKDo/QuIX7gSa7Ew1sz3WHCnczTm+TiAEhtoZGA+uXKCgtG3KnBtx79wE
 XhRg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BsLEXiI0
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-02-21
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

Autobuild statistics for 2026-02-21
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  2  |  5  |  0  |  7  |
  2025.11.x  |  0  |  2  |  0  |  2  |
    master   | 25  | 51  |  1  | 77  |
     next    |  1  |  3  |  0  |  4  |

Classification of failures by reason for master
-----------------------------------------------

             dahdi-linux-3.3.0 | 3 
     libphidget-2.1.9.20190409 | 3 
                       unknown | 3 
  gobject-introspection-1.84.0 | 2 
              host-guile-3.0.9 | 2 
               host-runc-1.3.0 | 2 
               openscap-1.3.12 | 2 
uhttpd-15346de8d3ba42200249... | 2 
                 apitrace-13.0 | 1 
                 c-icap-0.5.10 | 1 
           crucible-2025.05.28 | 1 
          cups-pk-helper-0.2.7 | 1 
        edk2-edk2-stable202508 | 1 
firmware-utils-c42a3bc53da8... | 1 
flashbench-2e30b1968a661474... | 1 
                        gnutls | 1 
                   gssdp-1.6.4 | 1 
                 host-gdb-14.2 | 1 
    host-python-maturin-1.11.2 | 1 
               iproute2-6.17.0 | 1 
                  jasper-4.2.8 | 1 
                     kbd-2.9.0 | 1 
                  kexec-2.0.32 | 1 
              libcamera-v0.7.0 | 1 
               libcgroup-2.0.3 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
             libgphoto2-2.5.33 | 1 
                  libva-2.23.0 | 1 
          linux-5.10.246-cip66 | 1 
               linux-pam-1.6.1 | 1 
                 mdevd-0.1.6.5 | 1 
                memtest86-7.20 | 1 
            minizip-zlib-1.3.1 | 1 
odhcp6c-f19dd37fb467c9cf10c... | 1 
                openswan-3.0.0 | 1 
                   perl-5.42.0 | 1 
               tcpreplay-4.5.2 | 1 
              tinyproxy-1.11.2 | 1 
                tpm2-tss-4.1.3 | 1 
            transmission-4.1.0 | 1 
uclibc-ng-test-132c6134d691... | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |         apitrace-13.0          | NOK | https://autobuild.buildroot.org/results/e07ecf63f8265ed9fe793850a8cf42d5a4387bd8 |     
    sh4      |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/415d6432eefdc69737e9ec9796c92d5aa7691639 | ORPH
    arm      |      crucible-2025.05.28       | NOK | https://autobuild.buildroot.org/results/ba88e85615b05bbc1c908024cf4973718c7739f1 |     
    hppa     |      cups-pk-helper-0.2.7      | NOK | https://autobuild.buildroot.org/results/d73a007a4b6b616318465215ae1c15a5ef7e2ec6 | ORPH
   mipsel    |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/18baefc9d4fed5586003585bae97f5ba83aa3020 | ORPH
    hppa     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d6b4f60f26fe94f887e70dd5f5cbabaa6f05cc2d | ORPH
powerpc64le  |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/d243149af1df512996de3d5ce2284cdcbb47ca32 | ORPH
    i686     |     edk2-edk2-stable202508     | NOK | https://autobuild.buildroot.org/results/a2adf3f2bfb09203ebfbae32c3cfe4c2da9a43a6 |     
    or1k     | firmware-utils-c42a3bc53da8... | NOK | https://autobuild.buildroot.org/results/8e45594e105eb51b23e0c961a9f11afca15458c7 |     
   mipsel    | flashbench-2e30b1968a661474... | NOK | https://autobuild.buildroot.org/results/3408d7e0130e0d2634016fa6672798f25ef471ba | ORPH
    hppa     |             gnutls             | TIM | https://autobuild.buildroot.org/results/70c4d6cce8f0818eadf3141f1c8cd596c3b4967d |     
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/41dd870c3a7c60e3263f5f41577172dfba649b3e | ORPH
    sh4      |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/c14d2faf28f2e05afe1a296fbe33f33eb6097d19 | ORPH
    or1k     |          gssdp-1.6.4           | NOK | https://autobuild.buildroot.org/results/af83d2e8ae56e663bab83a0e09c90620fb9ce2d1 |     
   mipsel    |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/f8e86f7bb50376170a7a7e21e85d58c7c0193ff7 | ORPH
  powerpc    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/79bef66191229b3b1fd13f42689826fc9b7f349a |     
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/c8c55283338060846b6ffa33c57d2f4478a1c336 |     
   s390x     |   host-python-maturin-1.11.2   | NOK | https://autobuild.buildroot.org/results/045beab24969f0a399843dd810e7952c2ffc7cf2 |     
   sh4eb     |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/da2d5504e5174a1629e99c63f2b9234689c2222e |     
   sparc     |        host-runc-1.3.0         | NOK | https://autobuild.buildroot.org/results/b30c9b5f3fc704334d7d966331f6800b0eb58d28 |     
   armeb     |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/117e6525c37a8ff4df83f21eca12fd4afe2fc939 |     
   mips64    |          jasper-4.2.8          | NOK | https://autobuild.buildroot.org/results/450f911d922131bbacae7d7d94bb49929e5d3a90 |     
  aarch64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/5b8c2d68c2bb6410ccce8a746dafa4a2e5fee0a3 | ORPH
  powerpc    |          kexec-2.0.32          | NOK | https://autobuild.buildroot.org/results/6cbee82e9e5ad820a123cbc276aaef3337be551a |     
  sparc64    |        libcamera-v0.7.0        | NOK | https://autobuild.buildroot.org/results/6f21ba1a858f353a59bb0107ceb2135ad3371abb |     
microblazeel |        libcgroup-2.0.3         | NOK | https://autobuild.buildroot.org/results/1b66e8a9f16d7bab543fd3412f19986f552f796c |     
    arm      | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/b97f6dc630ddd1df2fe16dbf2f08606d12cc408e |     
   armeb     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/a8dd550314a6f930b00c9371ed71423875c324f0 |     
powerpc64le  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/4588c9a954aee499a1ef7d8c92b91e9128a1539f |     
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/dd57386c9d196cb87a919f1736d8a128571a62d4 |     
  aarch64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/49278d15fcddee33ea4e24a871853ce18e4c626d |     
   mips64    |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/a082f3a530d21dd7d86c6f71820bcef413ef2f15 |     
   mips64    |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/2b117a565d8fc8aa71381d01ffe3e150478489df | ORPH
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/299f653b7f07be7173d4f9b53af783b6f9e2273a | ORPH
    arm      |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/f790d4ff853c5528b18aaf9b1284a0d9b389940c |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/5725dcf1bdf7b0308a70808f404692a79504b671 |     
   armeb     |       minizip-zlib-1.3.1       | NOK | https://autobuild.buildroot.org/results/11239312907365f468943c65da0724abc71da2b3 |     
 microblaze  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/cef9dc44947f52af5bf1b49ec498e20a678ac888 |     
 aarch64_be  |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/79e4d79a4ba40e0c8450366162aa4064905c9ea7 |     
 powerpc64   |        openscap-1.3.12         | NOK | https://autobuild.buildroot.org/results/06e54513fdbe4070d8b1bce33d4f745d27f2b616 |     
microblazeel |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/bacc1790d17992413503a4d62fe11ec56d0a8edc | ORPH
   armeb     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/5be592925f74b49ddf6a7698504bf960c9c06619 |     
    mips     |        tcpreplay-4.5.2         | NOK | https://autobuild.buildroot.org/results/a1073759ada6faf7317c8077ed55a94b2efff7e5 | ORPH
microblazeel |        tinyproxy-1.11.2        | NOK | https://autobuild.buildroot.org/results/7490841995ee0b1cee7d4d5519c5cb85118c034c | ORPH
   xtensa    |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/2e75f746bc0dff638cb18c3fa25128809fe49d4d | ORPH
  sparc64    |       transmission-4.1.0       | NOK | https://autobuild.buildroot.org/results/59f045e31db6c6211aae186993acd7e0888f5404 |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/6edd0df883aa6e579732c42231277370fd058a60 |     
  powerpc    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/1f18b6552100664597e400592724fc568234e323 | ORPH
   armeb     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/1f8f6da2b2d06c6ac6a515f145af243615592980 | ORPH
   xtensa    |            unknown             | NOK | https://autobuild.buildroot.org/results/9714c539bfc3efe19bcd1b5ff3bb1d858ab79b57 |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/53fb9707dc0f551eb060a56e3da05e3f4cee47b3 |     
powerpc64le  |            unknown             | NOK | https://autobuild.buildroot.org/results/4a7bef59bb60c356f096f2fe1c32646abcecf16a |     


Classification of failures by reason for next
---------------------------------------------

     libphidget-2.1.9.20190409 | 1 
                openssh-10.2p1 | 1 
                       unknown | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  sparc64    |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/c79cef924e7eabb7eec1008ce154fdd1a0a9ea0c |     
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/08ac1e301651cb8fb5fe0a86b90694611c4af871 | ORPH
  riscv64    |            unknown             | NOK | https://autobuild.buildroot.org/results/673cffedb79898b8e4179d59784703e69975e078 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

              host-rust-1.88.0 | 1 
package/linux-headers/linux... | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/00e1fa5e23e1b3bf0ce3bc0aa1fac38e4b54fdda |     
   sparc     | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/58b4f63a525add35e9cb0c45654c4d0522fb2d44 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   dillo-3.0.5 | 1 
              libsodium-1.0.18 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                 openssh-9.9p2 | 1 
                       unknown | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          dillo-3.0.5           | NOK | https://autobuild.buildroot.org/results/6f47b51907904a5262cf304595792b8f1d557f16 | ORPH
   sparc     |        libsodium-1.0.18        | NOK | https://autobuild.buildroot.org/results/3ec50ebbe5b23dad1ba6d915ef746182dfa72914 |     
   mipsel    | libsvgtiny-ea9d99fc8b231c22... | NOK | https://autobuild.buildroot.org/results/af80557fda4aa8669a0fc1b39fec3ce786242ad9 |     
    mips     |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/2b515ca92f0fa22e335b428b2ddd79e78d82c5a7 | ORPH
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/b5285f47ba720c7c8d05d4f4a880d8a982b82778 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
