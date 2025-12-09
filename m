Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54EEAD1CDC6
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 04:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5B8540C4D;
	Tue,  9 Dec 2025 04:24:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d0LAYzOy9ZFu; Tue,  9 Dec 2025 04:24:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CFD240C51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765254279;
	bh=jkWRZQJOkBSQ21+fWGYAnY9BIsha8M38XkxeNffEgWE=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=eiUdfNVCU10SaWDA/6o59rPYiuvfAz81bj1gXe3cKtz7ET4sMzR+m74ls7wposOtG
	 oL/LZHrndBOcH7JR6RktAxak37h97rChj7uF9RsQXKkMcbJabPz/bLqzEfcAhflSKO
	 xKkHO4rhw+xynFL7VNBAKTa3dp1vEZhkeyA8UggW2BubtBUVYpTjjQ/aQAsQJEfGxx
	 yjAHEZHtFUejWUeiUS8ScVRecQ2xIqOsBOmMkD5JsZ35vXs9jFY0Jrlxewf1FcpzQf
	 cH0vXT4Gv9fVfPoX3gj8jafuVQHfnp+BJsf6Zcbgpg/C7iNUv8m2R+RAN8mDca1TAs
	 QZkMw6EOPxH8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CFD240C51;
	Tue,  9 Dec 2025 04:24:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1D22E151
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 04:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F1DE40248
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 04:24:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7qRBPfd6yTIG for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 04:24:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9DC454014E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9DC454014E
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9DC454014E
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 04:24:36 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42e29739ff1so2118649f8f.1
 for <buildroot@buildroot.org>; Mon, 08 Dec 2025 20:24:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765254275; x=1765859075;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gvvCscdkbfoxsNargHCz1Y2CzlT+mBeEkXp1oZoACWM=;
 b=cEYyt/8QxkH4K2CJBierltDDAn4eBVesuY4cGCIgOC3tsZ80q736CaGy5KYtWzFcUj
 HO9sJmc8O5398E0H5xjsHKjcWUdT8xf2Pg6tbNsEsz+SMPnqynB4EVZ9cdBMw9PNfFMj
 jXPU5Rh7s28XuTTqfG++CNYxUrfuTrx3kUtfFzvg/ckpg5nE4EPRAY1eWAJKBh8NC5vi
 5sMiYMieY2Y0kft0ODSmST8dCC3/yiAGb/xa5d+b+5qxX45hsaKAYvoWOQhfyA7EIloW
 rJpxRwSETsLZ78lC767Fj8lFN4A5DFx4GJvp1NZpi5kl9YFKI0U87LFPzXGTjDUuJuj1
 j+Dg==
X-Gm-Message-State: AOJu0YyAOyeNybyF8Bv4uJfQ+OXpDLa3jGMs6sfKX+lOpRgsY2sd54WP
 BBprB5SUSnhMDmyVzMSb9FNbKVIzVQv/ASsSwVLxo5Nin2u6ozqpNYzq3R95axuY
X-Gm-Gg: ASbGncvWiz2aYzJ4cxZu77y025gfpROq7aOYas7LWK6GCFqtDwafd2UvFg0P5ygRoWz
 q3ylLAzuk/VnXdP/fkqQ1Ufi1obpL5YEyeYZ81fmlGQzFCpflimiceoDYXq/VymlRITVJlLTX50
 ISz1Ffyxav6kwzVDkiwe74A6TFKAXQTKw2Zuhn9DPHtqTEE01pI689tmdIk5zLIOvoA9VLWEBV2
 Np+ph07ACmr2F6wlnTy77vjiWPahE8ovLNPhY9/+4RGuJt5siUOEDfQiCt8vWq+vHuPSVRD+XCI
 x7lCOPts7xTCp0TuDS/uOOygv5bWmrACQ/cUHuctyX8NMp+PORr8tKJWZMr1I6xGNf0RWz0gLJ4
 oRUCVJbBEGkv9rG+M7vvuUETAqsm3Vy9G8ZTc2R2ERo3b1NnwRU0siz6Lk4sWc7gD+i1jB+4RTe
 QjZPHxIMSMZOcgbIkfqgEJy9HZZAFf
X-Google-Smtp-Source: AGHT+IEPWGTs6Uyk2PZ2BaKGlWyHrU/RAqoR0lnzqWy28aIAN3IXGcJWmixD+QfpAjgwa3QANg/8bw==
X-Received: by 2002:a05:6000:1843:b0:42b:3108:5671 with SMTP id
 ffacd0b85a97d-42fa086938bmr163764f8f.29.1765254273349; 
 Mon, 08 Dec 2025 20:24:33 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42f7cbe8fe8sm29208738f8f.2.2025.12.08.20.24.33
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Dec 2025 20:24:33 -0800 (PST)
Message-ID: <6937a481.df0a0220.c399e.694d@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Tue, 09 Dec 2025 04:24:33 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1765254275; x=1765859075; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=gvvCscdkbfoxsNargHCz1Y2CzlT+mBeEkXp1oZoACWM=;
 b=RA8ukkRJQsJ30/zNBpKOQU49OULbwY9fo7vKOSBamoOD1s0CnVHS/aMh5bASSZvuz0
 Vgx45zWMqeUQbiN1c2dr8NiqsW2Va9cBULNfbrjhPrxf1FlNtMlS/XkMsGj7Z71mCz5n
 tTL3/Awx5i/JNTCLSm3GQ57L+3+6SH//KCm4W9SQQZ+5BnQW1ugA3E4a51PvW7OA+x70
 9KvnJaAjCkYo3APYjb3ZKCjbHfRjB75vaVidhwaa4AwhEQIPF1flUFMeKJ5I+7Duyh5f
 /Gg86hXZ0pUT3UAWKELS08ppB9FTRHmwQq28c4Sp3xVY1HnISBDqWH+oBzc9z5fRjwKC
 iMxA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=RA8ukkRJ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2025-12-08
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

Autobuild statistics for 2025-12-08
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  | 12  |  8  |  0  | 20  |
  2025.05.x  |  3  |  7  |  0  | 10  |
  2025.08.x  |  0  |  4  |  0  |  4  |
    master   | 45  | 64  |  0  | 109 |

Classification of failures by reason for master
-----------------------------------------------

                   cvs-1.12.13 | 5 
                 host-gdb-15.2 | 4 
                     kbd-2.9.0 | 4 
                  libsvg-0.1.4 | 4 
                       unknown | 4 
                   dante-1.4.4 | 2 
                      fio-3.41 | 2 
                 host-gdb-14.2 | 2 
                    mpir-3.0.0 | 2 
                 pixman-0.44.2 | 2 
rtl8723ds-546ffb2cb735e0c33... | 2 
               asterisk-22.5.2 | 1 
                    azmq-1.0.3 | 1 
                  bitcoin-30.0 | 1 
                 c-icap-0.5.10 | 1 
                  cc-tool-0.27 | 1 
                 dc3dd-7.2.641 | 1 
          esp-hosted-1.0.4.0.0 | 1 
                  faad2-2.11.2 | 1 
           ghostscript-10.06.0 | 1 
  gobject-introspection-1.84.0 | 1 
                 highway-1.3.0 | 1 
              host-guile-3.0.9 | 1 
    host-mender-artifact-4.2.0 | 1 
          host-python3-3.13.11 | 1 
 host-softether-4.30-9700-beta | 1 
                   libcap-2.77 | 1 
           libmicrohttpd-1.0.2 | 1 
              libopenssl-3.6.0 | 1 
     linux-5.10.162-cip24-rt10 | 1 
                    linux-6.18 | 1 
                 mbedtls-3.6.5 | 1 
                netdata-1.37.1 | 1 
           oath-toolkit-2.6.12 | 1 
                openocd-0.12.0 | 1 
                    php-8.4.15 | 1 
python-remi-2022.7.27-37-g1... | 1 
                 s6-rc-0.5.5.0 | 1 
              shellinabox-2.20 | 1 
                   strace-6.17 | 1 
             strongswan-5.9.14 | 1 
                 xinetd-2.3.15 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 microblaze  |        asterisk-22.5.2         | NOK | https://autobuild.buildroot.org/results/426336052c50768b06dd047ce4b8283e6da377d4 |     
   mips64    |           azmq-1.0.3           | NOK | https://autobuild.buildroot.org/results/3c96882c0e0a58714eff7bc342981d381339d7c0 |     
    m68k     |          bitcoin-30.0          | NOK | https://autobuild.buildroot.org/results/cca7a8576244fc33859cecfb996ddf3c7b70296c |     
   s390x     |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/d2129387df065f8373f5ae9e36b7be2922b632e6 | ORPH
loongarch64  |          cc-tool-0.27          | NOK | https://autobuild.buildroot.org/results/d0443ec44d2349518e65b1ebf5d0f29354a4b68e |     
 powerpc64   |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/1023e93533bfeec7a8e80f251356356d04b2b834 | ORPH
   s390x     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/f0bccadccbd12026aa91ecae6d685b4aa9e27d5e | ORPH
microblazeel |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/8989096e6ea1e1338ef35a7e0a94f380b7220763 | ORPH
    arm      |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/4083e75b2eb147c3e594ed51391bf2121a214a3c | ORPH
    mips     |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/29fe3fb46ddc9d8ae3b210714afdff9a33d8a016 | ORPH
   sh4aeb    |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/b5aa2abaec8dcbe2dabc1c1e7507b01b896504ce | ORPH
    m68k     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/17c0212e370739d9defc194574fb02af5056d0a4 | ORPH
  riscv64    |         dc3dd-7.2.641          | NOK | https://autobuild.buildroot.org/results/4795435a1632c864700594917890bac70a96790e | ORPH
  riscv64    |      esp-hosted-1.0.4.0.0      | NOK | https://autobuild.buildroot.org/results/4767cd070dbed74c83f0a12929304f06b19afde9 |     
  powerpc    |          faad2-2.11.2          | NOK | https://autobuild.buildroot.org/results/2623a9776c2d022c1d0c7d61e035359390fb9ea0 |     
powerpc64le  |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/75f11c125ce87cb961fa53386fe73ae14dc83d7d |     
    sh4a     |            fio-3.41            | NOK | https://autobuild.buildroot.org/results/a21e9a747d8ea9b4dd8ad6e1d5136c209eca041d |     
   armeb     |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/621448c2b5b832334b190445177c96eed2b4c9ba |     
    mips     |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/280e34604ab2f51efc3c3674c64b29f1a02b0c53 | ORPH
   xtensa    |         highway-1.3.0          | NOK | https://autobuild.buildroot.org/results/14d4fbc437780cab402492287dd9d9829630ea37 |     
   s390x     |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/0707478cbee8b108108fae0b9e9a1ce676c40e24 | ORPH
  mips64el   |         host-gdb-14.2          | NOK | https://autobuild.buildroot.org/results/75880b4412787215ea4c602459535d446dff085e | ORPH
    mips     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/625d20f758d73705caced19996a7d7e65e4ba036 | ORPH
 powerpc64   |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/c6e7ed9f7fc8f93564abd24d121b634ca75d0380 | ORPH
   sh4eb     |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/99cbe600d8c79132477d0e13a82cc54d08d56479 | ORPH
   mips64    |         host-gdb-15.2          | NOK | https://autobuild.buildroot.org/results/70079dab7180670ecbf9afb4c5ee4905a653523c | ORPH
  sparc64    |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/5721f03b52d1227b70e55683a0bd59107b6d93d2 |     
   s390x     |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/370683b561d3528948aac194a21e12b80dbaa98e |     
   s390x     |      host-python3-3.13.11      | NOK | https://autobuild.buildroot.org/results/89c7a6e7289736d85eacf40ae05acf46ed50bfde |     
   mips64    | host-softether-4.30-9700-beta  | NOK | https://autobuild.buildroot.org/results/c3b099d99a80329949f30a0be985f55dcddbe335 | ORPH
   x86_64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/96e3690837fd0002dc70ef7c9f1fbe0a16ef92e9 | ORPH
  aarch64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/4cd89b6180e863b5ff9535b53bbede7eb6b7ecf3 | ORPH
    or1k     |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/87b551b1a1c18e7e782319a240c6fff6e7d75f64 | ORPH
  sparc64    |           kbd-2.9.0            | NOK | https://autobuild.buildroot.org/results/7942d1b1a729847296d07f50e1831637839e5653 | ORPH
   arceb     |          libcap-2.77           | NOK | https://autobuild.buildroot.org/results/1bb862b4b77033539daed292ee40e5df77a978f0 |     
    arc      |      libmicrohttpd-1.0.2       | NOK | https://autobuild.buildroot.org/results/992bf08643fec38be63da2fe47b2d2e0979dca91 |     
  riscv64    |        libopenssl-3.6.0        | NOK | https://autobuild.buildroot.org/results/e245d63da74e16d4c9f528552d15e8f30f2276bb | ORPH
    sh4      |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/dcb4ae8badd89a8b8f63f91158e68948753da0e0 |     
  sparc64    |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/daf0ac5592553cb236146d8137fefd4ede07c006 |     
    sh4a     |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/4995777f56d73a9168c07bf44077a11a7aa7c61b |     
 microblaze  |          libsvg-0.1.4          | NOK | https://autobuild.buildroot.org/results/bc57e1f6bcc7189a4b26c3f5101f5df73c3b131c |     
microblazeel |   linux-5.10.162-cip24-rt10    | NOK | https://autobuild.buildroot.org/results/f760e191c424056a1c31504047596b10c45410a6 | ORPH
  powerpc    |           linux-6.18           | NOK | https://autobuild.buildroot.org/results/63835fa811ad0566a3e373d79686405fdb5a0df0 | ORPH
 aarch64_be  |         mbedtls-3.6.5          | NOK | https://autobuild.buildroot.org/results/3b93996ebd22e9c18c8f27c189d59e9d15d1216a |     
   mipsel    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/431638816a7cf26aef20f31b9ed7f1be0b5f6798 |     
  sparc64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/0bd494f1bd2a893f2c597e5f41e90dacf402c676 |     
   armeb     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/2f7d721643ab18196aad90afa7b63109e78c4a61 |     
powerpc64le  |      oath-toolkit-2.6.12       | NOK | https://autobuild.buildroot.org/results/858680a2356d604df899e09ff9f98bb55cd71521 |     
   mipsel    |         openocd-0.12.0         | NOK | https://autobuild.buildroot.org/results/265290882cef0995a0b8c42d4e8e3ebe29ac411a | ORPH
    sh4      |           php-8.4.15           | NOK | https://autobuild.buildroot.org/results/078db6681bc8df1f355b191faa1c1720e0e674cb |     
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/fcfb7cdcde5dcea2d4aa546556147f28155a0cec | ORPH
  riscv64    |         pixman-0.44.2          | NOK | https://autobuild.buildroot.org/results/e446d8fdb87d80b881dacb46bcdd89114225492a | ORPH
microblazeel | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/462056eaed90018e42a24dcaef09983f04e6d4ad |     
  mips64el   | rtl8723ds-546ffb2cb735e0c33... | NOK | https://autobuild.buildroot.org/results/52081e3a500dd2566af145e8c6d793df7f72d025 |     
 powerpc64   | rtl8723ds-546ffb2cb735e0c33... | NOK | https://autobuild.buildroot.org/results/aaafca68105ee38422335bfb0868a45f151ed636 |     
   xtensa    |         s6-rc-0.5.5.0          | NOK | https://autobuild.buildroot.org/results/e8040e6b20bcd1819faa44f4660b58e785d7f002 |     
   armeb     |        shellinabox-2.20        | NOK | https://autobuild.buildroot.org/results/735eb589f807faac9aef4f2239bb8f7bd5ae05b9 |     
loongarch64  |          strace-6.17           | NOK | https://autobuild.buildroot.org/results/8e3de892a1c4aa176a8b3a5defba48aa9830bc89 |     
  aarch64    |       strongswan-5.9.14        | NOK | https://autobuild.buildroot.org/results/acd4019a1a874976c236b579ec5c91f64250a9db |     
   x86_64    |            unknown             | NOK | https://autobuild.buildroot.org/results/547fa479aeb627f041e07c688dd7b722da27cd8b |     
    m68k     |            unknown             | NOK | https://autobuild.buildroot.org/results/62d05adbad2369e34d95cb7e3161c91085995acb |     
    mips     |            unknown             | NOK | https://autobuild.buildroot.org/results/39fa512e8a455732398390e07a498e72a692f70e |     
   armeb     |            unknown             | NOK | https://autobuild.buildroot.org/results/742acee599b9ad0b02d0cfcbecaaf0d0c94679d6 |     
    m68k     |         xinetd-2.3.15          | NOK | https://autobuild.buildroot.org/results/9157838655210fe8700e821a1fc8a5d6e63779d0 |     


Classification of failures by reason for 2025.08.x
--------------------------------------------------

               apcupsd-3.14.14 | 1 
                 c-icap-0.5.10 | 1 
glibc-2.41-70-g1502c248d58c... | 1 
             util-linux-2.41.1 | 1 


Detail of failures for 2025.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | https://autobuild.buildroot.org/results/1998aa9e1d72a3927c07572a68131ba152253b12 |     
  mips64el   |         c-icap-0.5.10          | NOK | https://autobuild.buildroot.org/results/dadfa3f41667c565138c33eb50e48150b8d21919 | ORPH
   mips64    | glibc-2.41-70-g1502c248d58c... | NOK | https://autobuild.buildroot.org/results/c294aeaf30f26c9a180145e1aafe7bb077b063ee |     
  riscv64    |       util-linux-2.41.1        | NOK | https://autobuild.buildroot.org/results/b9720bba916bf87557f90f2783fef8e569a42feb | ORPH


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                   cvs-1.12.13 | 1 
                   dante-1.4.4 | 1 
  gobject-introspection-1.82.0 | 1 
host-go-bootstrap-stage2-1.... | 1 
                  iozone-3.508 | 1 
                libressl-3.9.2 | 1 
                netdata-1.37.1 | 1 
python-remi-2022.7.27-37-g1... | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          cvs-1.12.13           | NOK | https://autobuild.buildroot.org/results/79bb1e5a58dd6069f20498fd96e93ca5ae5cd3c5 | ORPH
   s390x     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/028bb184f3f9256070b1311fbe2a5cff62325b95 | ORPH
  sparc64    |  gobject-introspection-1.82.0  | NOK | https://autobuild.buildroot.org/results/498873da36d85d764d9ce44ed32b71be2c76fe9b | ORPH
    i686     | host-go-bootstrap-stage2-1.... | NOK | https://autobuild.buildroot.org/results/e53ef712ad1215f37931ef2af142d84fd99b0888 |     
   sparc     |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/c66dff5e7bc31c37fc0fe0b239cb0bdfbd13495b |     
    arm      |         libressl-3.9.2         | NOK | https://autobuild.buildroot.org/results/9ad4b12feae8d128f208b838f3a4265ca06a8b6d | ORPH
    mips     |         netdata-1.37.1         | NOK | https://autobuild.buildroot.org/results/178d5d383bb9bb715341a486532aed2467e5189d |     
    sh4a     | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/4afb433f4ca45af3a2cc23ee5096475ce330aeda |     


Classification of failures by reason for 2025.05.x
--------------------------------------------------

                       unknown | 2 
               graphene-1.10.8 | 1 
             gupnp-dlna-0.12.0 | 1 
                 logsurfer-1.8 | 1 
                    sdl-1.2.15 | 1 
                     wine-10.0 | 1 


Detail of failures for 2025.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |        graphene-1.10.8         | NOK | https://autobuild.buildroot.org/results/89e00068a0f035bec6c4ced6d37ca451ade0e370 |     
  riscv32    |       gupnp-dlna-0.12.0        | NOK | https://autobuild.buildroot.org/results/bad63997784bc3dd65f271a7daeec92379a53856 |     
 powerpc64   |         logsurfer-1.8          | NOK | https://autobuild.buildroot.org/results/cff46a61f0b70eeea50137a5959c3c112e355d82 |     
microblazeel |           sdl-1.2.15           | NOK | https://autobuild.buildroot.org/results/163b3f0dee285d8e82571ee3ca29070a0f552b1a | ORPH
    or1k     |            unknown             | NOK | https://autobuild.buildroot.org/results/b5486b84634cddc213dcd3cbaf2dafaf804aa8c7 |     
  sparc64    |            unknown             | NOK | https://autobuild.buildroot.org/results/e9e800cbf039ba0036ea310497c45b8e377ddaff |     
    i686     |           wine-10.0            | NOK | https://autobuild.buildroot.org/results/01143cb8f8026224a675c290ab81697c1b75e4b3 |     



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
