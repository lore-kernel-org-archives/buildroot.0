Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3DF5106FD78
	for <buildroot@archiver.kernel.org>; Fri, 13 Mar 2026 04:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1811608FD;
	Fri, 13 Mar 2026 04:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OaxX8u6bW-Mk; Fri, 13 Mar 2026 04:30:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3D66D6087F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773376237;
	bh=CxVSdJ0GckqGglZYY18Q0ieun1NtTZKbq3TYmSavzcg=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=YvOmtRrmwKIa4ZwIaROiKY36fqj9F1P0NSCOSlTg/qm7m7rjE1H58IoTDePVOn0Tk
	 tZhxd0SevHeDzgZWVpeNbGmzqw9/ACJbCdL1Xn+uAAohE3Ys0gB0CldhboT8nX0XU2
	 rUc06yb0woSZ+YPVurVyd75MLz92vSP5omIZ3czmoOsBUx6yI+qxRQe5Nldjk6bHnE
	 Z1RcdWNV5nYxsdsptLGzdXh+QEKaWc/0PkYS48gRXBdi6IJQi4Wz53QySc3s5oS/D9
	 AZ39uKWRmOhFIiIM5PQqgBXGLLdbuL2fMv/jENWj01JCsYqbd9TSf+D1ivP0BMdiTE
	 eEAGZVi2A1WtA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D66D6087F;
	Fri, 13 Mar 2026 04:30:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BFB3C786
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 04:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A5BE0810F0
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 04:30:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lfB5liOllFhH for <buildroot@buildroot.org>;
 Fri, 13 Mar 2026 04:30:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 91921810EC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 91921810EC
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 91921810EC
 for <buildroot@buildroot.org>; Fri, 13 Mar 2026 04:30:33 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-48334ee0aeaso15536545e9.1
 for <buildroot@buildroot.org>; Thu, 12 Mar 2026 21:30:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773376231; x=1773981031;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h9rgdhMT5S7egbSqFYTnzXZ9N+FwafNpQbNBQsjdx3w=;
 b=FiveOkfFf3Z/eI/RI+oj6C2829WlPM2nXlV8RFKUnRwbbVdbL9fsJViLTuxZfgoWTe
 Ia5dwQDOkvaE7wvJTZseKVQN5IbNUKIPHE5yxwytnScBbnQIlatxv6Pl0ha/OUawnLr0
 JA+ig0G7EBj2Fno9ofZn/vDEQo7r9ZXO9z3KtJXsNPldsxPn2kByKPWsUeuOr1UtdjlI
 P4x/ww1TNltMPM6o6tyXLklGVPt4pLK5e8dxJqBQs81y3Oh2JXCSLu8VEatysDCI2lKs
 BDASqVN4gZzOq26kqnhegJ3z8TlZCVvO4PyLlvs1qR6KyJjF9kORI3PbVEMofLAydG3u
 02Ew==
X-Gm-Message-State: AOJu0YxcAEyrIOgJOvirgtOCmqR6z2D/ICcRSdbPBJM37l/z1HejnUXS
 7/jy4XGXlOsUAd1d0hwqxHA4E4/yDMOVjCbJ+Q8quA2HlBftoNnpUtj8FejCeN8/
X-Gm-Gg: ATEYQzx9i5Yd0YBN9xEkUqV/A4hmd5CSiwPFPvaPl7NbfjtY8v4zftFgr5LXvissf8c
 lRcKkjuvkXVMbjEcgGeKBuMGLxRx9xnGPvWbna8t3yQP9XDOXMe/9c5FWtU+VpYCxPbfGK1nQrn
 HmBx4nyceCW9NxmT1KxoghBqc6aQY2CYJD4snOT2Dcx1nk5fh09O2XWhF4jNfjr3ZtBjrcolEXj
 +filfpXxFp9/lCzar0i9ePDd7qUCD2OFE4eA9COAJDUHyCZN3ECQQxJ8BoVURI3s9nRff6ldie1
 U8wt5T9wugzbG08NSgs5Di6/iHiO/WQ3omRDAi7CoBK7xP5UqxkTSfQtpun7bA+7XbHJxqlo8px
 j8UQTCQszPW5WvtOOFOi1m3rTMqL6H8EPkxYrM+RXCjsK2eaBBXKdoKdQPUOoQeYvnxuu3dWEKm
 RnNpdR+SvjImUPlyQZ7O/DSgttVg==
X-Received: by 2002:a05:600c:a15:b0:485:364e:9328 with SMTP id
 5b1f17b1804b1-48556714af0mr26939225e9.16.1773376230493; 
 Thu, 12 Mar 2026 21:30:30 -0700 (PDT)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48541b6f6e6sm494976105e9.10.2026.03.12.21.30.30
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 21:30:30 -0700 (PDT)
Message-ID: <69b392e6.050a0220.331d11.72e4@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Fri, 13 Mar 2026 04:30:30 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773376231; x=1773981031; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=h9rgdhMT5S7egbSqFYTnzXZ9N+FwafNpQbNBQsjdx3w=;
 b=Te7No7wOF0z9GSZya8YPndnZ718KFAqAT8VYQT64rl90/6xLHge/+7GSJFR0P2Fn69
 9C0KHYcYSeHwhxbjVgtEmzq4jaLy0nfGHqcRilRIr1s9QU00Qsl2URLVbYr9e7pbLOtJ
 gV5403ddM9i1zdcdB7It7tsklTPFNQYVyWugX5vCyvdU9VZi8Vf/ub0Dw3BkSOcKHFIz
 AqW8QmQTQQkKIG17hK3nRMtfoQMM0ECYAgAJ8+LGv/DAoqyySwHFu8QR14yK8HMs59dy
 s4HV7ZrsqpwFe4Opq8Sao6V3KG8SAUUXNzRXPLFTZr+0hYJez/CBWrp9HE+L+HVyL/cI
 ScNg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Te7No7wO
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-03-12
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

Autobuild statistics for 2026-03-12
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 12  | 29  |  0  | 41  |
  2025.11.x  |  4  | 16  |  0  | 20  |
    master   | 43  | 118 |  2  | 163 |

Classification of failures by reason for master
-----------------------------------------------

                       unknown | 11
ustream-ssl-5a81c108d20e247... | 4 
                   dante-1.4.4 | 3 
  gobject-introspection-1.84.0 | 3 
leafnode2-9543ffaf82406f943... | 3 
                 libmbus-0.9.0 | 3 
     libphidget-2.1.9.20190409 | 3 
        ltp-testsuite-20250930 | 3 
odhcp6c-f19dd37fb467c9cf10c... | 3 
             pptp-linux-1.10.0 | 3 
uhttpd-15346de8d3ba42200249... | 3 
host-gobject-introspection-... | 2 
              host-guile-3.0.9 | 2 
                host-odb-2.4.0 | 2 
              host-pahole-1.28 | 2 
host-vboot-utils-4b12d392e5... | 2 
               iproute2-6.17.0 | 2 
libdill-32d0e8b733416208e04... | 2 
                libglvnd-1.7.0 | 2 
              libopenssl-3.6.1 | 2 
     linux-5.10.246-cip66-rt29 | 2 
                 linux-headers | 2 
                 mdevd-0.1.6.5 | 2 
                   perl-5.42.0 | 2 
       shadowsocks-libev-3.3.5 | 2 
              skalibs-2.14.3.0 | 2 
             util-linux-2.41.3 | 2 
amazon-ecr-credential-helpe... | 1 
               asterisk-22.8.1 | 1 
             berkeleydb-5.3.28 | 1 
                 c-icap-0.5.10 | 1 
                   ccrypt-1.11 | 1 
             cni-plugins-1.7.1 | 1 
             dahdi-linux-3.3.0 | 1 
  distribution-registry-v3.0.0 | 1 
               freeipmi-1.6.16 | 1 
            gdk-pixbuf-2.42.12 | 1 
            gettext-gnu-0.22.4 | 1 
glibc-2.43-10-gc3ceb93dc4f6... | 1 
                haveged-1.9.19 | 1 
          host-binutils-2.45.1 | 1 
           host-libtpms-0.10.2 | 1 
            host-protobuf-34.0 | 1 
              host-rust-1.88.0 | 1 
                   i2pd-2.59.0 | 1 
                     kbd-2.9.0 | 1 
                 lcdproc-0.5.9 | 1 
                  libbpf-1.6.2 | 1 
libftdi1-v1.5-62-g5e67403c4... | 1 
libfutils-c326ce0cc2a735438... | 1 
               libglib2-2.86.2 | 1 
                 libiconv-1.19 | 1 
                 libjcat-0.2.3 | 1 
                libressl-3.9.2 | 1 
               lrzsz-0.12.21rc | 1 
                    mpd-0.24.8 | 1 
                       mrp-1.2 | 1 
                 nanomsg-1.2.2 | 1 
                  nginx-1.28.1 | 1 
             ntfs-3g-2022.10.3 | 1 
   nxp-mwifiex-lf-6.6.52_2.2.0 | 1 
                   oatpp-1.3.1 | 1 
                openssh-10.2p1 | 1 
             parsec-tool-0.7.0 | 1 
           python-html5lib-1.1 | 1 
              python-xlib-0.33 | 1 
                 rtl_433-25.02 | 1 
          sphinxbase-5prealpha | 1 
         spice-protocol-0.14.4 | 1 
                 sqlite-3.52.0 | 1 
               usbredir-0.14.0 | 1 
               valgrind-3.26.0 | 1 
                 wolfssl-5.7.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | amazon-ecr-credential-helpe... | NOK | https://autobuild.buildroot.org/results/b2df738f717d201bee6017cba91b313393d817c7 | ORPH
    or1k     |        asterisk-22.8.1         | NOK | https://autobuild.buildroot.org/results/9af4fbf0ce8158203a568ffe80cc1c1ac6e93aea |     
   sh4eb     |       berkeleydb-5.3.28        | NOK | https://autobuild.buildroot.org/results/1ea9139b4f9292214efd3bd4fa152868855fa401 | ORPH
    mips     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/1056c5083c96d97612188008069b2ce4ecfd1161 | ORPH
    arm      |          ccrypt-1.11           | NOK | https://autobuild.buildroot.org/results/63b37177926cf68d067ced9756e682cdec0cf116 | ORPH
    i686     |       cni-plugins-1.7.1        | NOK | https://autobuild.buildroot.org/results/d31d123868ac4950a766c9ae89049cd40ef52091 |     
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/71e0dadad7bb8bf5cd7e6aff553a00d760e185d0 | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/0ba66cf48d3a451f897af6a788a7c46e3ba54f12 | ORPH
   x86_64    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/91ca02fb202ec888323e1e5819565900c4443f99 | ORPH
powerpc64le  |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/ba95e6f71bacbecdfb97e2115b0946568978ad15 | ORPH
    i686     |  distribution-registry-v3.0.0  | NOK | https://autobuild.buildroot.org/results/c5614e8d6a6e5ac0cac655b851f7010031f54db0 | ORPH
   mipsel    |        freeipmi-1.6.16         | NOK | https://autobuild.buildroot.org/results/f75d3255ad0a36dd29fdc849b7d3dc818596bc1e |     
  powerpc    |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/045909f335194575c05a4f649aef7fc97c3232d7 | ORPH
  powerpc    |       gettext-gnu-0.22.4       | NOK | https://autobuild.buildroot.org/results/71f0b452d38d0f79de1ecdb9efe1935555f830b6 | ORPH
    hppa     | glibc-2.43-10-gc3ceb93dc4f6... | NOK | https://autobuild.buildroot.org/results/4ef9ef51760faa884cf018b6ea4abb8499d343d8 |     
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/e115349879619616912a1516d9b0ffe4d7a9087d | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/ce78a22c8556b3d280b38344c66e693b7063b8b2 | ORPH
  sparc64    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d6dbeb3e282b8466f4c1503022fe7f8a05825792 | ORPH
    arm      |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/ec017a068f94efe3e3ac2b198d125903ca81f4b1 |     
  aarch64    |      host-binutils-2.45.1      | NOK | https://autobuild.buildroot.org/results/de880816b2dda78c2c5169eaed8203dfc5d04619 |     
 powerpc64   | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e3203e31098d7d9558f098e11c3e8d3abec0bfb5 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/e873fa19f48c896fc1ea7296d5e5be8250330273 | ORPH
powerpc64le  |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/261ff205095867434598d6bcea6f657db26ccdb6 |     
  mips64el   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/68a206443c90244329f3b7a25b49ecf185e39175 |     
  powerpc    |      host-libtpms-0.10.2       | NOK | https://autobuild.buildroot.org/results/e02982b17e9d4ad50062e9c88f3114b9243dbe40 |     
   xtensa    |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/ab133db84ac9fd1037846d44f56ef91109da2c3b | ORPH
   s390x     |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/a0e7bcff424eef9f4ba32d9f8b6617fd7c6537f7 | ORPH
  powerpc    |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/0e232c4543835f4e2d3c60fd83794f9d4f3549e1 |     
    hppa     |        host-pahole-1.28        | NOK | https://autobuild.buildroot.org/results/0d53b0d21022b0de0ff5ed4c1de162ef61c3afcf |     
microblazeel |       host-protobuf-34.0       | NOK | https://autobuild.buildroot.org/results/9f16f6ab26c3358c818fa9fce73fac50763f0fb0 |     
   x86_64    |        host-rust-1.88.0        | NOK | https://autobuild.buildroot.org/results/684d55151229ecc0e635a95405ce1ac59c7262ec |     
   armeb     | host-vboot-utils-4b12d392e5... | NOK | https://autobuild.buildroot.org/results/fc8061574d04c6419d3a0e8d00912c0a6153100f |     
powerpc64le  | host-vboot-utils-4b12d392e5... | NOK | https://autobuild.buildroot.org/results/f3307d44dc5d234ef67bf7352084cc46a4befb36 |     
    or1k     |          i2pd-2.59.0           | NOK | https://autobuild.buildroot.org/results/64ee15161244c70abfa13619fe1ce26ac9b3e16a |     
  mips64el   |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/8a9f0109b11797e86dad91cb899681856d1c91c8 |     
  mips64el   |        iproute2-6.17.0         | NOK | https://autobuild.buildroot.org/results/e8e0592448f01dbc588b2c2ad4fe41c946b5bb47 |     
   mipsel    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/134b811f531554e43f54e31eccb4b77c0e0ba657 | ORPH
   mipsel    |         lcdproc-0.5.9          | NOK | https://autobuild.buildroot.org/results/169ac54abf6d73b1baf1a73317e58d56504906ca | ORPH
 aarch64_be  | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/0555ca625cfd3766f9d0f0da0d1414b612981a5e |     
 microblaze  | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/8f59f890e835763e68b70c14048eb980525b22a3 |     
   armeb     | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/e96171baf8975d308b3c12e5625fff1dafd71e53 |     
    or1k     |          libbpf-1.6.2          | NOK | https://autobuild.buildroot.org/results/fadd1772c256942693a2fde2cafd886320899829 |     
microblazeel | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/46eac2b7b0579e136ab655c85a38260908eb0736 |     
   s390x     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/ebff67f2129ccef04c528d3cac41dbb659d37ee8 |     
    sh4      | libftdi1-v1.5-62-g5e67403c4... | NOK | https://autobuild.buildroot.org/results/21987375fb0335327a74395f3ca4dd0bdb4d7e40 |     
 microblaze  | libfutils-c326ce0cc2a735438... | NOK | https://autobuild.buildroot.org/results/69fec1e59176fceb7001cb078161e7dbdb423ce6 |     
    m68k     |        libglib2-2.86.2         | NOK | https://autobuild.buildroot.org/results/5cdb9138491ee28837d69f6c552c7f7383ddddc5 |     
    m68k     |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/1d3448c6a5adcb1fe1921a4f7c02832f224a969d | ORPH
  mips64el   |         libglvnd-1.7.0         | NOK | https://autobuild.buildroot.org/results/f884b0cebdf525d12a3ca0033360aa60a60b0f0e | ORPH
microblazeel |         libiconv-1.19          | NOK | https://autobuild.buildroot.org/results/20d1dd030a02b871b6f28d9c1639da2035e65a86 | ORPH
   x86_64    |         libjcat-0.2.3          | NOK | https://autobuild.buildroot.org/results/7506fe86fcfd8c61d4d10dba2a0228987c10ca67 |     
  riscv64    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/6bb221c9d9ff5e3525fe30a20d8e7e82f9302693 | ORPH
  powerpc    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/9deca62d8e65c637b2a22b84587e3c685a4642fd | ORPH
loongarch64  |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/ba75c531e7e5fbaec425a7235ebed120faf29c7d | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/d9726525f36658a43383efdc0f33585d15df073d | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/fb54b805c86baf01e914616dd988993b5502f7fb | ORPH
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/bea69438be42187bab25b1cc1cb93a2956dfae91 |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/adc8402db05c7f2bc2d17b387e5ffea0a84c524f |     
loongarch64  |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/00f54e5b038c438520001572fea9c927e7be09e0 |     
    arm      |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/85de3d0838b1e788921edbfc34d42a558ab55090 | ORPH
  aarch64    |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/4a692a66ff95f3311bf8a7bfbb137c8bca3c04aa | ORPH
microblazeel |   linux-5.10.246-cip66-rt29    | NOK | https://autobuild.buildroot.org/results/2a7487a8fd30bc5aa804d7db6effdbcdff07d377 | ORPH
loongarch64  |         linux-headers          | TIM | https://autobuild.buildroot.org/results/ac7819f960186ea9a88a8c2b81de1c6c28a34810 |     
    arc      |         linux-headers          | TIM | https://autobuild.buildroot.org/results/925c3a07678cfcb2a6746845f293eeefd1dc438b |     
  aarch64    |        lrzsz-0.12.21rc         | NOK | https://autobuild.buildroot.org/results/8c05fb68f9c8453f66ed4dfae4972ce03fac72e2 | ORPH
    sh4      |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/7b1b2c3624483de419e56a7813367cc4a4f41209 |     
   x86_64    |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/80599f63f332298757d3c136c421ec29d9abdf04 |     
 microblaze  |     ltp-testsuite-20250930     | NOK | https://autobuild.buildroot.org/results/5a6f6edcf86f5c2e01d41921262d74ded9ce4a38 |     
   x86_64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/e3cd7ed69171aa192d53bbbb2dfa1ce0dd409155 |     
   mips64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/def59b79d76e1acb43ab5d26e31bcb7c95563c7b |     
microblazeel |           mpd-0.24.8           | NOK | https://autobuild.buildroot.org/results/59b0be79b1ca1469477e7634205f3eaaebef7d5f |     
  mips64el   |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/6f7beebe1fb7a8acb0ff1fb2eae4df22b358673a |     
 aarch64_be  |         nanomsg-1.2.2          | NOK | https://autobuild.buildroot.org/results/9fd6bf8fe59be79a9834f7f1793a861aa5d459b5 |     
   sparc     |          nginx-1.28.1          | NOK | https://autobuild.buildroot.org/results/b1c9e665272e6108d7482cdcfafe1f16c467a227 | ORPH
   s390x     |       ntfs-3g-2022.10.3        | NOK | https://autobuild.buildroot.org/results/b835fa461fc93de23f9ac08d4ce71e337664aa36 | ORPH
powerpc64le  |  nxp-mwifiex-lf-6.6.52_2.2.0   | NOK | https://autobuild.buildroot.org/results/aa39d7115fe9023ddc0164fbbc9adc9c17388e0b |     
    i686     |          oatpp-1.3.1           | NOK | https://autobuild.buildroot.org/results/b6458984ab77b51aa68874829edbce66b8b85238 |     
   s390x     | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/f14457a457d7217dc9328e9fff728555cc506ca4 |     
  powerpc    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/e6f763a0fc8e77aaafe425bbafbaf605184c5d58 |     
   x86_64    | odhcp6c-f19dd37fb467c9cf10c... | NOK | https://autobuild.buildroot.org/results/e52fd506c37570ca4c4baeca86466a67faf2971f |     
   mips64    |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/825d61cf715489f04324025276e035ac0a4daa75 | ORPH
   s390x     |       parsec-tool-0.7.0        | NOK | https://autobuild.buildroot.org/results/d4f05127efeccef5676827a895bee5e76606752e |     
  riscv64    |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/a689e72de8522df567bb3578fc01c08a084d6359 |     
 microblaze  |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/fbbc007c1cea7ef2db1fa6382dcbb2e13e8f5e3c |     
  powerpc    |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/6d02427057a80b62107ad67bb01c252f5c61d9bf | ORPH
    sh4a     |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/3d0589bd706beba0240ad91faa065f040340bc9c | ORPH
loongarch64  |       pptp-linux-1.10.0        | NOK | https://autobuild.buildroot.org/results/a0adfe907fdcc12503e7a70e741e490f3ec4c2f4 | ORPH
    sh4      |      python-html5lib-1.1       | NOK | https://autobuild.buildroot.org/results/a7111483e6481185e2e845fa90e71872c01094f1 |     
   s390x     |        python-xlib-0.33        | NOK | https://autobuild.buildroot.org/results/427cf89668cfe2477d01247b6f906cbc8b2c4b12 |     
   sparc     |         rtl_433-25.02          | NOK | https://autobuild.buildroot.org/results/3962b5ec2105131b53c6f1572af36daa3dca91bc |     
 microblaze  |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/2c5dcf8c80d43eb9b88f83c7be045cb5dd2e60fa | ORPH
  aarch64    |    shadowsocks-libev-3.3.5     | NOK | https://autobuild.buildroot.org/results/d252da93ef3bf952de8c11d0380a2862aa0e4494 | ORPH
   sh4eb     |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/8806eaaf8275dc5735486510766a415f22320394 |     
loongarch64  |        skalibs-2.14.3.0        | NOK | https://autobuild.buildroot.org/results/89b607b0810a82be4947e84e3eac355f7ab86465 |     
   sh4aeb    |      sphinxbase-5prealpha      | NOK | https://autobuild.buildroot.org/results/5a29c4c0e88b82137494c54d7d0feee6040278fe |     
    or1k     |     spice-protocol-0.14.4      | NOK | https://autobuild.buildroot.org/results/2d9c74ea32d8c4477238497bcd91818bae650d5f | ORPH
    m68k     |         sqlite-3.52.0          | NOK | https://autobuild.buildroot.org/results/5831a31d271e62a4aabb1b92b61be8014f535831 |     
   s390x     | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/baaaa72fbdbbd0375766c76c5b2f56f877c54b32 | ORPH
 microblaze  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/b34d84ca41278ed80147878a1495d301d28b2c1d | ORPH
loongarch64  | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/01c0616a3222af280aba03c9401f6ef20bd0a254 | ORPH
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/e71dd6a162aceeafa2ddf79919b652369953466b |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/e366c84611cbc096f4dc51d6b06470021f130461 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/3fd80cbd31684fa25bd4499834693d000aebc56a |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/0e9834d99d2ee697f2d79702d0e634ea6747725f |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/0b3a70dd84c99ac95a4a6ee24c5af1f90bb5990f |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/2e825b8ce76fb00f9a9fdd779c5742bc11b6f963 |     
  aarch64    |            unknown             | NOK | https://autobuild.buildroot.org/results/a1a5c6951c2f88ed61176f4514cafcd66ef895d8 |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/133908688d96f10033e7796c5f8c9c704e9faafd |     
    arc      |            unknown             | NOK | https://autobuild.buildroot.org/results/31abed2ee926ebaf8673ef39632475d7d2d82ca6 |     
loongarch64  |            unknown             | NOK | https://autobuild.buildroot.org/results/c18378a33b59b87f36f2cbd3dbef62e6a4bc4ec8 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/56cc78e0aae4319d93d0ce0a55970cdcb8fc411f |     
  mips64el   |        usbredir-0.14.0         | NOK | https://autobuild.buildroot.org/results/23a6d8d341b6eb0632c1abe680f7c6aca8c3c2c8 | ORPH
   xtensa    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/2688133dfd23efdd834a1d9920d089cf0f789451 | ORPH
    i686     | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/3ac0fdcfc2c081d26c625e2fa487dc6582e9e393 | ORPH
   xtensa    | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/0dbbecde39c626ae599eeea1fd94c1a392be5c94 | ORPH
loongarch64  | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/098d3ab848035e067a41aed20a9043a5fe8478b8 | ORPH
   mips64    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/84278d9dec8ecf015c1573f499eb2c87adc793f3 |     
  riscv32    |       util-linux-2.41.3        | NOK | https://autobuild.buildroot.org/results/6f0c18715fb181e5420683f76b4004a843873420 |     
    i686     |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/a404e34402d646e585e7e32000eb42b1ee4b8150 | ORPH
   mips64    |         wolfssl-5.7.2          | NOK | https://autobuild.buildroot.org/results/290fb1776d2dcc14516663b4bbc63c6e8c042c59 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

host-gobject-introspection-... | 2 
leafnode2-9543ffaf82406f943... | 2 
           oath-toolkit-2.6.12 | 2 
                apr-util-1.6.3 | 1 
                   dante-1.4.4 | 1 
                    ficl-4.1.0 | 1 
host-am335x-pru-package-5f3... | 1 
          host-faketime-0.9.12 | 1 
       host-libunistring-1.4.1 | 1 
               host-zeek-4.1.1 | 1 
              libmodbus-3.1.11 | 1 
                openswan-3.0.0 | 1 
                       unknown | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   arceb     |         apr-util-1.6.3         | NOK | https://autobuild.buildroot.org/results/ba433fa3a28e0d3948bc2048bbce8b836d965ca0 |     
  powerpc    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/91099d0df4ea6224cf78112cb324e657ebffa891 | ORPH
powerpc64le  |           ficl-4.1.0           | NOK | https://autobuild.buildroot.org/results/297fc0981845297cc6f2ea3230909fbb5d8e358a |     
    arm      | host-am335x-pru-package-5f3... | NOK | https://autobuild.buildroot.org/results/cc1638e6f11f072be5af40246843dc8b08706b69 |     
 powerpc64   |      host-faketime-0.9.12      | NOK | https://autobuild.buildroot.org/results/dd1cc789ac757773119f6b5524c58dd7b745c05d | ORPH
    mips     | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/72dce4510963dd8a8bc843df20952a106e772931 | ORPH
  aarch64    | host-gobject-introspection-... | NOK | https://autobuild.buildroot.org/results/fe5974eb9e1a2b194a0ca195a39200f056447f57 | ORPH
   sh4eb     |    host-libunistring-1.4.1     | NOK | https://autobuild.buildroot.org/results/3250c7eed3f56531da196a12ebafe23fe0151a4f |     
 aarch64_be  |        host-zeek-4.1.1         | NOK | https://autobuild.buildroot.org/results/4d0a13b0d06a272fa6bf98291726253d65d480af |     
 powerpc64   | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/88e907b2168555ba1077445b37c813ce4fe2a44c |     
    arm      | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/a9728c5c3c7a72bd9387ec25616595409f2cfb46 |     
   sh4eb     |        libmodbus-3.1.11        | NOK | https://autobuild.buildroot.org/results/7c8677382741c826530e50db9bcc0e1c25ee6b96 |     
 microblaze  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/2c16360630833322b4624b0a0d519bcd4c89e67a |     
microblazeel |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/362723306ac0d2d414c35e87d0f1472f8145c0c6 |     
   mipsel    |         openswan-3.0.0         | NOK | https://autobuild.buildroot.org/results/bd03e8940e24c1c0d341cb17ecbeec3e8f64d1af | ORPH
 aarch64_be  |            unknown             | NOK | https://autobuild.buildroot.org/results/38ff390bd9474e3de4c04a041e615a4013ad2d07 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

           host-go-src-1.23.12 | 3 
                haveged-1.9.19 | 2 
 host-softether-4.30-9700-beta | 2 
                  boinc-7.20.2 | 1 
                 dmidecode-3.6 | 1 
host-binutils-arc-2023.09-r... | 1 
          host-faketime-0.9.10 | 1 
                 host-gdb-14.2 | 1 
                 host-gdb-16.3 | 1 
host-go-bootstrap-stage3-1.... | 1 
                host-odb-2.4.0 | 1 
                jemalloc-5.3.0 | 1 
leafnode2-9543ffaf82406f943... | 1 
                 libmbus-0.9.0 | 1 
              libopenssl-3.4.4 | 1 
                 libssh-0.11.4 | 1 
libuci-f3fc0b76040685829191... | 1 
        ltp-testsuite-20250130 | 1 
                memtest86-7.20 | 1 
                 openssh-9.9p2 | 1 
                   perl-5.40.3 | 1 
python-remi-2022.7.27-37-g1... | 1 
                    sslh-2.0.1 | 1 
                       unknown | 1 
                 vmtouch-1.3.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |          boinc-7.20.2          | NOK | https://autobuild.buildroot.org/results/8cf54a9409d63bd42f886832a8f9f2018bd73427 |     
  aarch64    |         dmidecode-3.6          | NOK | https://autobuild.buildroot.org/results/e40a04f74159d6621c7a580d93030ec0e1718bd5 |     
   xtensa    |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/83d6be7da571129f40e7fa9f22cd86b47078754a |     
   sparc     |         haveged-1.9.19         | NOK | https://autobuild.buildroot.org/results/f2b4b86c1571d84f4a40dc56cd9eadfe8652e905 |     
   arceb     | host-binutils-arc-2023.09-r... | NOK | https://autobuild.buildroot.org/results/04024ea1071e79ca36134ea6c8a718fa01567541 |     
   sh4eb     |      host-faketime-0.9.10      | NOK | https://autobuild.buildroot.org/results/b8426611788189a10cce6789b12c04188e532440 | ORPH
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/a537bc64276a54970ef34b333ed8d7dc9582d266 | ORPH
  powerpc    |         host-gdb-16.3          | NOK | https://autobuild.buildroot.org/results/7c0fe8bf36d9da8818ee7bd9e9407f892f3f642b | ORPH
    i686     | host-go-bootstrap-stage3-1.... | NOK | https://autobuild.buildroot.org/results/2a065dee1632925d97d336077d723e452a6627a5 |     
  sparc64    |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/6e214338927fd53bc1136cd410339de6152f86ad |     
microblazeel |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/1b87675427bd4eab0aa61cb9c0a4d2ecaaebbc7a |     
powerpc64le  |      host-go-src-1.23.12       | NOK | https://autobuild.buildroot.org/results/a65a563fe029314ec8bedbf2550b2a9891a82c63 |     
microblazeel |         host-odb-2.4.0         | NOK | https://autobuild.buildroot.org/results/6fc136dcc1d1256369c6996192603edcd9a33714 | ORPH
 aarch64_be  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/e5827601b55fd638aab8a0c4713490b8a2c53c1e |     
 microblaze  | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/0cb468584ed3c5e3febda1380dbde2468a54739f |     
  riscv64    |         jemalloc-5.3.0         | NOK | https://autobuild.buildroot.org/results/b0bab4adcc006efeae9d8311e3caf655d68300c1 |     
   xtensa    | leafnode2-9543ffaf82406f943... | NOK | https://autobuild.buildroot.org/results/cb4640244a26b50c2672280236ae16bb71e64ba2 |     
  aarch64    |         libmbus-0.9.0          | NOK | https://autobuild.buildroot.org/results/b68db2f7df8eaa9898e9a154d6405ed580067bd3 | ORPH
 powerpc64   |        libopenssl-3.4.4        | NOK | https://autobuild.buildroot.org/results/edd80220d00b4618bfc5f5e0194f02b669014cef | ORPH
   mipsel    |         libssh-0.11.4          | NOK | https://autobuild.buildroot.org/results/9e7568c5eebb5dd0f2b1376a727543eb0f4e8c57 | ORPH
   sparc     | libuci-f3fc0b76040685829191... | NOK | https://autobuild.buildroot.org/results/25ecd89648905549fa96d6ec3acb98dbb308ed6a |     
  mips64el   |     ltp-testsuite-20250130     | NOK | https://autobuild.buildroot.org/results/87ad2395a716bdccc0866acfdc4bf29f534542f3 |     
    i686     |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/cf7ce5cb85972de114b6de253fdf9a114ca25347 |     
    arm      |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/27b58cf80114bea16301828dcdb2b085104ef9c7 | ORPH
  powerpc    |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/b4992d55ea59c9b7a2128d65f21511c3ddd0d957 |     
  mips64el   | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/2311e3ea3645ac7bd353accd9c1afa87658dec0f |     
   sh4aeb    |           sslh-2.0.1           | NOK | https://autobuild.buildroot.org/results/dcd4cfe3b1fcdaf343e93d1d102642e8b171b8ce | ORPH
    i686     |            unknown             | NOK | https://autobuild.buildroot.org/results/2caab6cb88a274ee823dae1b43acba45ed968b59 |     
    m68k     |         vmtouch-1.3.1          | NOK | https://autobuild.buildroot.org/results/f544c4a1a6042296423b61d4892b64c399ad0a56 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
