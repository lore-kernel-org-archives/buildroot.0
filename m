Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93006CD13DA
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 03:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AE89413B3;
	Sun,  3 May 2026 03:19:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nzQ0hUH7X_ev; Sun,  3 May 2026 03:19:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CEE6941462
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777778370;
	bh=zxJOooU++/MCbmDlF6jRjOqTu7oi+U1BaToQYcqIovU=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=k9CKIOgPD/7nV3XJMah7lekLK49A6SGlidg/uBMeUCeM7ujy83y4AkMqg7N8l5GMk
	 SbW2nXyD9iq6qK+I6UV2YW7+5wLbGRXoRJA4vr0th+ByoMUxPWh5lEZ0mUhsKsDWEW
	 mE/BUmaBLmazsaGbpSg50ngCkakD1p8A7BufhIwrhN3tmP+rDAN7JgZMX2rmDbWFid
	 AqDg8VczPNl9GbOxU1VzUbtUtioVXr/ZGz6WhPKJoTz/wW+T2MnQ99XX9bOHah8+Qa
	 ZTLxzs9/KNnQu79EBn3y+hO1M9xeLmkKuJ9ylly+bFj0zSbJoRBratr8cRtThVhtfM
	 PLqfwnx1nUcEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEE6941462;
	Sun,  3 May 2026 03:19:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D63D190
 for <buildroot@buildroot.org>; Sun,  3 May 2026 03:19:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33D1E41462
 for <buildroot@buildroot.org>; Sun,  3 May 2026 03:19:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MryMQvCi2vla for <buildroot@buildroot.org>;
 Sun,  3 May 2026 03:19:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 82E5C413B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82E5C413B3
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82E5C413B3
 for <buildroot@buildroot.org>; Sun,  3 May 2026 03:19:27 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-48a3e9862f0so18969955e9.1
 for <buildroot@buildroot.org>; Sat, 02 May 2026 20:19:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777778365; x=1778383165;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i6CIusO4E69iRYvidi46nhhK0H+xrCvOJqc4ojab1dc=;
 b=in1ghUysB6liOp/4bmA92fsfZOavd/2+zHi/f7w7b8xnvF3fYUAMVTYJSlUWssgnbi
 jYIWPEJcxRk9YoMuhQDtozyU1SbaXyMHdDBkvLlLcoYJbz4PCOeR/gmDOto/jXGIQoDx
 flvAuYihQ/GcgoyA0UQ86bvWwbKx0V6gYbYd0W9uylu5KjG1tTGbxvbyzXF7TFCSbvh3
 OLkJ/SEySrvXrufWmV4UM8uUBT1j1+REhBCmP6xAeHMDfaQ+lm+Bni+dOHbyaVnqv6ca
 MgWb+byGWXKledndZiXjXtXGKq4yxn1Kz4VjWCQBQ+51efaEuKVCmnHsoC02fQG/tUU7
 Yh1w==
X-Gm-Message-State: AOJu0Yz1v+PmlpemyXnzuGLKe1R9OXCloUQzrxNZ9G0lUNXZegi2huw0
 bU40kcWPITlnP1k2UrDbjVs+JnSam+vuWoz7arTV+9rJYfWd0BRNdix9A2cXmLOd
X-Gm-Gg: AeBDiet7tnSRU5pSL4x7eHEyy925bC2tQaDaAi+nESthH0B+TB7+VG0jYTp8EcyL5Yp
 0g3at7K15qSEgieWKbUxuFSS5svJzby6wrvJHVOD6U9IhKmDcctQKIg0NYKmeVQ9d53Hwz06Egj
 Fhc0lcTKtYVU0P5GrzvPbW2ZrcNvfvArxMQtjgErJ18WGpogcj+yLVHOWwdtRj41q5gIXYwm7iE
 qtEBIDkxhJRCv3CxOTCyiJnfPmNygQKiwjP1zD9Htz52JQuiUQofhbBICe0HNW+zWyYuFBc6YUi
 niE3uwPTLeR3s4VhuZ9jvohMwKp3IFyp57gtGjIN/H/OhqpDJCKWx0mcP+b8HbPBr06GfqUhNPn
 RFU7vodoscP4lOtIctSW4+eXeoUCoY6hVK8ELQJzCiyXrR241ZhcONaccPDoGDfDGxlvY4cG2hi
 p2a2l3xlqXsgUmlH85wUuK1hcTNt57Y+JpK/rglH4h
X-Received: by 2002:a05:600c:a315:b0:48a:79d8:a8d6 with SMTP id
 5b1f17b1804b1-48a970b8237mr58408865e9.7.1777778365055; 
 Sat, 02 May 2026 20:19:25 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48af0d3864asm44231015e9.1.2026.05.02.20.19.24
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2026 20:19:24 -0700 (PDT)
Message-ID: <69f6bebc.7b0a0220.1cda41.b493@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Sun, 03 May 2026 03:19:24 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777778365; x=1778383165; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=i6CIusO4E69iRYvidi46nhhK0H+xrCvOJqc4ojab1dc=;
 b=pVWrLBAGY1ZV2oaGncSiN6QTy0fuznrTQ0fi4ZqocWq8PO6agOCOYgtAQcJ0Gs8aN6
 XfRn+XcVh3VELrogKF+QxHfAsd804XprOMCwQxyVbfrex5ECD7HheWHB/UPT1lcAum51
 BsNFXn+xkCMkyggB/2HQyH61v23g7wPae6gmtndrLHSg3309ZRSsuOIgRbF6Tn5YRrUB
 pCF8YF9BT51RRV/THoS+MbgKdBwHNv5+eejk18RaFE3pVmT4iGeBqCR8BfNoy4GwzqmM
 OLvGNnjcyfz9qJBU/FaEIPgpKsDsCNPYJxaxOYGG7RoZ7RFLq/lYYuiy04+shiclfKcR
 hIIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=pVWrLBAG
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-05-02
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

Autobuild statistics for 2026-05-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 15  | 15  |  0  | 30  |
  2026.02.x  |  5  |  8  |  0  | 13  |
    master   | 42  | 70  |  3  | 115 |

Classification of failures by reason for master
-----------------------------------------------

phidgetwebservice-2.1.9.201... | 5 
odhcp6c-f19dd37fb467c9cf10c... | 4 
                       unknown | 3 
             util-linux-2.41.4 | 3 
glibc-2.43-17-gdd9945c0ba40... | 2 
                  iozone-3.508 | 2 
             libgphoto2-2.5.33 | 2 
                 libzlib-1.3.2 | 2 
                 linux-headers | 2 
               linux-pam-1.7.2 | 2 
                  ntp-4.2.8p18 | 2 
             parsec-tool-0.7.0 | 2 
                   perl-5.42.2 | 2 
uclibc-ng-test-132c6134d691... | 2 
                 aichat-0.30.0 | 1 
amazon-ecr-credential-helpe... | 1 
             batman-adv-2025.4 | 1 
                   dante-1.4.4 | 1 
                     fd-10.3.0 | 1 
                   gvfs-1.57.2 | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-15.2 | 1 
                  hwloc-2.12.2 | 1 
            igd2-for-linux-2.2 | 1 
             igt-gpu-tools-2.4 | 1 
               iproute2-6.17.0 | 1 
                jemalloc-5.3.0 | 1 
                     kbd-2.9.0 | 1 
kvmtool-7ad32e5514aca2b6d19... | 1 
                 lcdproc-0.5.9 | 1 
                 libavif-1.4.1 | 1 
         libhdhomerun-20210624 | 1 
                  libnfs-6.0.2 | 1 
                        libnss | 1 
              libopenssl-3.6.2 | 1 
                libxml2-2.15.3 | 1 
                    lua-ev-1.5 | 1 
               madplay-0.15.2b | 1 
                       mrp-1.2 | 1 
                      ndctl-83 | 1 
               openblas-0.3.32 | 1 
      passt-2025_06_11.0293c6f | 1 
               pax-utils-1.3.7 | 1 
           python-brotli-1.2.0 | 1 
           python-html5lib-1.1 | 1 
            resiprocate-1.13.2 | 1 
                 sqlite-3.53.0 | 1 
                tpm2-tss-4.1.3 | 1 
                          udev | 1 
ustream-ssl-5a81c108d20e247... | 1 
        util-linux-libs-2.41.4 | 1 
           xtables-addons-3.24 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |         aichat-0.30.0          | NOK | https://autobuild.buildroot.org/results/936e1c0d40da257501bb8aa06122dfa0e0ed26bf |     
powerpc64le  | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/d80f2a8d6db27924762506350147881f4143afaa | ORPH
  powerpc    |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/f806340c3156bbbf4aaa317b8d1d380180149e6d |     
  aarch64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/351aef40fdc5d842c7f9f746869ce240fdfe0d82 | ORPH
  aarch64    |           fd-10.3.0            | NOK | https://autobuild.buildroot.org/results/b681ff9bab4e62d846f255ce6bf8098bf23a41ef |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/f8df0b09c75d201108e4c0d97149053349f57e20 |     
    hppa     | glibc-2.43-17-gdd9945c0ba40... | NOK | https://autobuild.buildroot.org/results/0b4d971d512ebc9bd4e1708fdca511fa964a484b |     
 powerpc64   |          gvfs-1.57.2           | NOK | https://autobuild.buildroot.org/results/462611e56bcdcbcc248ae37a655153c3e63be051 | ORPH
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/7eb37534848b92a57889a90984780cd4a10d8e29 | ORPH
    or1k     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/cda4c8f6a7979ed3d6880158e97878905765bcc9 | ORPH
   x86_64    |          hwloc-2.12.2          | NOK | https://autobuild.buildroot.org/results/73d6bbfaa58629000766f28996c2081d3afaeaec |     
   mipsel    |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/66e62a476fe5fe849332156d10fe469d2dce3a8a |     
  aarch64    |       igt-gpu-tools-2.4        | NOK | https://autobuild.buildroot.org/results/51222dd00319895dd00e18c337a821b25b3d4757 |     
    or1k     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/f359c6240f5a0144325ca5975703fed20a6e5217 |     
    arc      |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/2ebe15b467836fe01ac711d52a40949da914449f |     
   s390x     |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/d4fcd6d3842490e54b44233f8067b4d909c4b9b0 |     
  riscv32    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/90c6f3010faa38d84fcbe7a803b008c6a817994b |     
microblazeel |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/ae953e64f408de254247d5a437c30f1f8e961d42 | ORPH
    arm      | kvmtool-7ad32e5514aca2b6d19... | NOK | https://autobuild.buildroot.org/results/bb6808ee1555aa50ae2f829fb7f8f539e1102408 | ORPH
powerpc64le  |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/e7fef81e574819e0d54204e5bf3a969d0f4c358a | ORPH
    arc      |         libavif-1.4.1          | NOK | https://autobuild.buildroot.org/results/eedc1e1131c2108be99e93560455e513ae6d5d07 |     
    hppa     |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/b741b35c848cbac2426afe172cb51f909fa05ae5 |     
    arc      |       libgphoto2-2.5.33        | NOK | https://autobuild.buildroot.org/results/2f88c60d90a5df951b8c06b2ba0da56d84e9deee |     
  mips64el   |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/c6c4de8e9f36d29260bb67b67e71e79fc2da98d3 |     
   sparc     |          libnfs-6.0.2          | NOK | https://autobuild.buildroot.org/results/9cf4814de8faf76e34c11dc2f80b6494afb36c2e | ORPH
 aarch64_be  |             libnss             | TIM | https://autobuild.buildroot.org/results/be2635f2778de6be1977e50bdd33902e56968127 |     
  riscv64    |        libopenssl-3.6.2        | NOK | https://autobuild.buildroot.org/results/510d0fbaac486a21b11db39604023c26b515debb | ORPH
    m68k     |         libxml2-2.15.3         | NOK | https://autobuild.buildroot.org/results/96679516d351eef8d3dbc1b41378ae36d2549c19 |     
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/b3d5301983969695223ce67fbfb7a7f036392f71 | ORPH
   s390x     |         libzlib-1.3.2          | NOK | https://autobuild.buildroot.org/results/e7032b8d520de61e8704d9a81f3aab10c4dfee2a | ORPH
    arm      |         linux-headers          | TIM | https://autobuild.buildroot.org/results/ec2ae10f98a6fc436af1294906df57d7c8cdcd83 |     
powerpc64le  |         linux-headers          | TIM | https://autobuild.buildroot.org/results/29e6cb4813c39ec0939b29ffbce6a31bb7642332 |     
microblazeel |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/690b63e2843c09df5173d0d483077dfb4be14de5 | ORPH
 microblaze  |        linux-pam-1.7.2         | NOK | https://autobuild.buildroot.org/results/985dfa2ee2abf5b6b5babc3aff11a654951e8524 | ORPH
    arm      |           lua-ev-1.5           | NOK | https://autobuild.buildroot.org/results/ed5a9d2155e1b83b207ef0eba8b8672d39070cff |     
  mips64el   |        madplay-0.15.2b         | NOK | https://autobuild.buildroot.org/results/21e65ec4e54c0ec6c224ad9c46418a2ac1f3490e | ORPH
   x86_64    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/fd47b633adf04241e4031a52f7f3760a7a7077e7 |     
loongarch64  |            ndctl-83            | NOK | https://autobuild.buildroot.org/results/bf435265d1aae8a45313cad71a131a5e383a35cc |     
 powerpc64   |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/c0103079afeb10a68c1bd9d828d03929c607af2c |     
   xtensa    |          ntp-4.2.8p18          | NOK | https://autobuild.buildroot.org/results/d4b29c7c29db0706d4dbf275970cacfeb8cb9607 |     
    i686     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/bd174e997c3ea8f36b3131ea01bab905a7892596 |     
powerpc64le  | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/1aeb25a42d195b824a23d625fc87ec987de1fa16 |     
   armeb     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/76c2f7726c1c5304f1e5c9c67ae5b9f00e3fc779 |     
  powerpc    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/b840461df222a71b140089dba05b245edf736105 |     
   mips64    |        openblas-0.3.32         | NOK | https://autobuild.buildroot.org/results/ebaeabf40a0d563730521cbcaf26f80447e50bc1 |     
 powerpc64   |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/6a3e98aab796ebb32719a807618e7fb90bf8ccbe |     
  sparc64    |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/59e67c696801780a8c69d670e18472438db8134c |     
  mips64el   |    passt-2025_06_11.0293c6f    | NOK | https://autobuild.buildroot.org/results/3525fbe506fea383a7535a8cde742ecb96cd1fcb | ORPH
  riscv64    |        pax-utils-1.3.7         | NOK | https://autobuild.buildroot.org/results/1223131ebc66ad9d5d56cf573dabea6636ef3643 | ORPH
    m68k     |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/c5974785ee119453d774913b31ca4feda7104b90 |     
 microblaze  |          perl-5.42.2           | NOK | https://autobuild.buildroot.org/results/4deefdeb1a29bedde4865872a6d1382dde66bd23 |     
    hppa     | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/c1632e2e571d00039ffd3cf1975ee6db6fa81e99 |     
   mips64    | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/ca84d5d74294b822aef3e96188d89d9caeac0224 |     
   s390x     | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/ec7903b5a79f286c1e95576c394d3d5e37b87885 |     
loongarch64  | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/d81da5b2a0090abd3d8b55fefea8a3c9d1c80975 |     
 aarch64_be  | phidgetwebservice-2.1.9.201... | NOK | https://autobuild.buildroot.org/results/22e57f7a3a8eb4e70550e28178c09aee95da8116 |     
loongarch64  |      python-brotli-1.2.0       | NOK | https://autobuild.buildroot.org/results/846fd73bafec1361e92addf072fd4ef0f78abad8 |     
    hppa     |      python-html5lib-1.1       | NOK | https://autobuild.buildroot.org/results/ab8df60bd3f522d3bbd620485125b55715444e17 |     
   s390x     |       resiprocate-1.13.2       | NOK | https://autobuild.buildroot.org/results/e86ad3350210822dd41edb9674f55bce84743dfa | ORPH
    m68k     |         sqlite-3.53.0          | NOK | https://autobuild.buildroot.org/results/bf184850517029b11678ae318608f0b668c05d73 |     
   s390x     |         tpm2-tss-4.1.3         | NOK | https://autobuild.buildroot.org/results/9a7da9ba39aeb41e348a23f1f3708fb67f6b62e1 | ORPH
  mips64el   | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/b74e794409d61b98c1451ee9036fc137173ce1b4 |     
loongarch64  | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/7346d7e182887d1c7bf2f33def711a2a3b07c236 |     
 powerpc64   |              udev              | NOK | https://autobuild.buildroot.org/results/c8336675d93cfc76d11f8f9db5500a99afac1602 |     
  powerpc    |            unknown             | NOK | https://autobuild.buildroot.org/results/72bbdb758b0c48871d8554d959408129a9917c7e |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/44a15bcd7f36beb6d8213771acf34e71be4e0919 |     
  mips64el   |            unknown             | NOK | https://autobuild.buildroot.org/results/92d7516bc5861d6acd8e16ca5c54fe4d96dbab9f |     
microblazeel | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/82af42ca2ae926e887f61353b5f1f9486fa9986d | ORPH
    m68k     |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/19c729b81fbe71c64d0776652d82bb0bf62f5448 |     
powerpc64le  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/40873b10405f0824c6f6f0e4361614a003c575e4 |     
powerpc64le  |       util-linux-2.41.4        | NOK | https://autobuild.buildroot.org/results/b16f7363e6f569c217009c11bb459afcab61d44d |     
  powerpc    |     util-linux-libs-2.41.4     | NOK | https://autobuild.buildroot.org/results/69c8a5290f7ebab0d047bae9f2dddbbdd787278d |     
powerpc64le  |      xtables-addons-3.24       | NOK | https://autobuild.buildroot.org/results/d7a3b5df1ebe2d68329996de0370c199a415e03e | ORPH


Classification of failures by reason for 2026.02.x
--------------------------------------------------

             batman-adv-2025.4 | 1 
glibc-2.42-51-gcbf39c26b258... | 1 
              host-rust-1.88.0 | 1 
         libhdhomerun-20210624 | 1 
          linux-5.10.246-cip66 | 1 
                       mrp-1.2 | 1 
                openswan-3.0.0 | 1 
             util-linux-2.41.3 | 1 


Detail of failures for 2026.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |       batman-adv-2025.4        | NOK | https://autobuild.buildroot.org/results/846002c87bbf69aba92876c9ad768c7aefb0a4f8 |     
    hppa     | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/a7dfb80bb1a2b2e0eea588eead7d877ad11c8b4c |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/ea25515e76abf9139a2a47668ca4b3820dcf1572 |     
   sh4eb     |     libhdhomerun-20210624      | NOK | https://autobuild.buildroot.org/results/07ad55fe31e7a5f42a46564616111cbc91fa0d05 |     
   x86_64    |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/928068d9b2f7355a71de9d5c0ed93c5c01da7bd6 | ORPH
 powerpc64   |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/4dac6ce01e34514e1514d54f923a3ec75c51b51f |     
 microblaze  |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/4d030e49d6d5f051094de451feba3a672f6f6752 |     
    sh4      |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/494151c85fa569fcb19f6b012554a3a7e83708ec |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

package/linux-headers/linux... | 2 
                  dpdk-24.11.1 | 1 
           host-go-src-1.23.12 | 1 
                  iozone-3.508 | 1 
                  libnfc-1.8.0 | 1 
              libopenssl-3.5.6 | 1 
libuci-f3fc0b76040685829191... | 1 
                   linux-tools | 1 
        ltp-testsuite-20250130 | 1 
make: *** Waiting for unfin... | 1 
                    sslh-2.0.1 | 1 
           uboot-tools-2021.07 | 1 
                       unknown | 1 
                    wipe-2.3.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |          dpdk-24.11.1          | NOK | https://autobuild.buildroot.org/results/fbbc636a0e8607e1811ae6d44a64c9f0ae2da6b4 |     
   mips64    |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/d2d92558f99d45efb50c1848ab90ee691b07dbdd |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/6646210a81b407d39822a99bb9c7cd5d27850916 |     
    or1k     |          libnfc-1.8.0          | NOK | https://autobuild.buildroot.org/results/5e3f656306f1f56ead832a1bbbf08c0d73257046 |     
  riscv64    |        libopenssl-3.5.6        | NOK | https://autobuild.buildroot.org/results/ccf7e037de0f0e959924f41eae96351fb9115125 | ORPH
   sparc     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/88040734c7d1c4d563455bed3fb39fe571f1d4ae |     
powerpc64le  |          linux-tools           | NOK | https://autobuild.buildroot.org/results/085097a20c592c7636f9087b0905f7343c11dc3f | ORPH
  sparc64    |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/2d574133bf240ba858016727696d8c270618bcf8 |     
    sh4      | make: *** Waiting for unfin... | NOK | https://autobuild.buildroot.org/results/2ce2b260f8e8d88b5a635fe6d35c70dbe6490547 |     
   xtensa    | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/4c3da909a8ba579f79737ce7f842da3986190297 |     
    arm      | package/linux-headers/linux... | NOK | https://autobuild.buildroot.org/results/e9217194a2f98224afa22ef2660296e9854fac49 |     
   sh4aeb    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/020d39e1f6f6ee45f4bcefcace1e974734926e73 | ORPH
   s390x     |      uboot-tools-2021.07       | NOK | https://autobuild.buildroot.org/results/c2efb107adbc9a6dc529d49167a2930e4a303381 | ORPH
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/e99c7329a736c11ae219d39748fbefd5e2263e60 |     
  mips64el   |           wipe-2.3.1           | NOK | https://autobuild.buildroot.org/results/3ea1985f727e6f09312de414fbe074f0a191d191 | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
