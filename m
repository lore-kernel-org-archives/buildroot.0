Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D586EDF028
	for <buildroot@archiver.kernel.org>; Thu, 12 Feb 2026 04:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1271960BB6;
	Thu, 12 Feb 2026 04:20:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N1VT1tOraiNa; Thu, 12 Feb 2026 04:20:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6DAC611CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770870015;
	bh=KtEpv3k4tW9b4+DBKkjOiEh6D3Us+vAEpICgLT3Qe1A=;
	h=To:From:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=pApdz2Ljd57rXV6mdAlGaAdJzB8FnOwLgY/1kIBjNC1gufmn+9YRHOcPa/3gSD9V7
	 IJxAkXu0UH59qF1dnCpaaJdZtauSr1M9MFQHY55BdHWcDgIy2Uk1t6usPx9xwH15Fw
	 KRR4pG2rhkKzJPRZzTmt3J4YSSp00dDsddJAxGRH7rILywv+ToZQi7ZT1ZuUawgrLL
	 1Mj37J2o+vpO8DKoE/FW9f+uf5bzSGcnmTkQr8yZyj4o/xHlVK5T6gxasRk3S9Ho5O
	 XLymbkc7vE5j41TYe9EXQugeiAiDKaMXaLtJVu+OQoBvtjlO+5IZiZ/12ePA2qFzmm
	 IjkUQ4zZkQtwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6DAC611CA;
	Thu, 12 Feb 2026 04:20:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C5DF423F
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 04:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7A0741A69
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 04:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aXrW48K7pdAT for <buildroot@buildroot.org>;
 Thu, 12 Feb 2026 04:20:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=buildroot.notifications@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E93A841A33
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E93A841A33
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E93A841A33
 for <buildroot@buildroot.org>; Thu, 12 Feb 2026 04:20:11 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-47ee07570deso55381825e9.1
 for <buildroot@buildroot.org>; Wed, 11 Feb 2026 20:20:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770870010; x=1771474810;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i7Lj1UhW46A+mSgShN2iWvpVy7oyLZoW+R4y2Hvyg3Q=;
 b=QI8F5+R5HgflSW16CaHKbs6aFEc1GIKy7LB3iSjwDreNxV3McW1fFBL1lFOz8bAiA1
 9OxhBxrzF+GbCcIq2RTv7J/KM57CVa07OH8OVKDljOdV4AxObFErPhC5/rGcxGPN62sD
 HjiJVYz/ogBu5HAITcjc6t/tvoOtxcoQyqXjbcW9Hkp/Y9x9MhXt55LY+EsJqnYt1c/b
 o7oq9ZWIAuzjWCPDrFGR4tE6e/5V4RRuTgORCvf367ZLjkmSKHxVK12uWTHViEet/mn9
 l24UqgnQWbZcJXHZax5VCKyTvvMW8Ix2S5WYO/WQQ9ZWNGPJz7UikTWjaFUDq3U4v5Mm
 IMXw==
X-Gm-Message-State: AOJu0Yx8ATdf0ilqu/AE7akTfMDljEW4xIM16pxPKU2FF9dA2zC/zBN3
 /HG2heEb5/IavvBOqv5Uzo217VL7f98vuK0IgicIRMX3GEREjUy0kk4HKsWB3w==
X-Gm-Gg: AZuq6aLFKnmHdsUaWvjDlOU/jjXyN5iWhqMgoHb3hB7DHlyDV6Mhdr0fEc/Y947B9YE
 c8iIuoiMfHUAPUqGrvuPnuw/l4jMWmgpRVGyw3XPRJrBaV4mj1lkcYdZkOhigPNKbn//tAr1Keg
 7fsvLI0Ke5plAQ2ascmhp5hjrbfBoUn4Kg0y/YwrL/BNhTXYklroMkwVzxF9SE0S6mPmc7NyKA4
 HKcY4Jz88pDCkeAtkQ0DDBEp9KIVQMTqwRtbSaJVdyzsoJLkAMiEQvEqB/wBkjaA80Sc4GwlK3B
 Ms86kr+OjloonUJ1jyAoSX4U/bs2quqpBDjR6Cb3pChwn6Vma9t+p1P72PY2kTpMS8tM30+9QyX
 ebdOypInVd4tcPoGv8QadpxzhmrZ0tzwQgZYz23W0xk5zPWlxJsVZ7lJZfABbXrFlBmsm/KV1Eq
 Qz6cOTqM2icUZoZ0eqq29pxx32joNlgQ==
X-Received: by 2002:a05:600c:3e0d:b0:482:e5d4:b7ca with SMTP id
 5b1f17b1804b1-483656ae354mr19084125e9.8.1770870009412; 
 Wed, 11 Feb 2026 20:20:09 -0800 (PST)
Received: from [138.201.205.61] ([2a01:4f8:173:1526::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4834d482480sm198476625e9.0.2026.02.11.20.20.09
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Feb 2026 20:20:09 -0800 (PST)
Message-ID: <698d54f9.050a0220.208256.f051@mx.google.com>
MIME-Version: 1.0
To: buildroot@buildroot.org
From: Buildroot Notifications <buildroot.notifications@gmail.com>
Date: Thu, 12 Feb 2026 04:20:09 -0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1770870010; x=1771474810; darn=buildroot.org;
 h=date:from:to:subject:content-transfer-encoding:mime-version
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=i7Lj1UhW46A+mSgShN2iWvpVy7oyLZoW+R4y2Hvyg3Q=;
 b=IFroISkJhdRa6OA1jyw+1XfBS0DDVVb2O+mUmpA7s2NNsrV0ifftCb9hDk7BFxcD35
 D4/brkRAweqfNv9qT6sSikfA+G/0xwJ8pYZTMJ1sYRKx5fq4MRFazNqItxGj3wXU7VfA
 64QuEUf8n+vvOHPj9B93BSwTaaH5htECd2eAAs2wnIS69E9Czi1Uo7ErIvk8H9gPViSC
 5vkH9VXwzj2ZqRud341xdvWd/9IH4wsjwmpNluNHFbVbbrrMnUVaHH07VNAfcq3/CoCq
 X8IwkCx38jnwlrBT0QKsWqC/wDi5mtUbVVC+R9D/b8+FgKvZkoeyCHH1OSyAOdcCoiIl
 hvUw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=IFroISkJ
Subject: [Buildroot] [autobuild.buildroot.org] Daily results for 2026-02-11
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

Autobuild statistics for 2026-02-11
===================================

      branch |  OK | NOK | TIM | TOT |
  2025.02.x  |  1  |  9  |  0  | 10  |
  2025.11.x  |  0  |  6  |  0  |  6  |
    master   | 37  | 52  |  3  | 92  |

Classification of failures by reason for master
-----------------------------------------------

                   perl-5.42.0 | 3 
  gobject-introspection-1.84.0 | 2 
              host-guile-3.0.9 | 2 
    host-mender-artifact-4.2.0 | 2 
              libopenssl-3.6.1 | 2 
                   strace-6.18 | 2 
uclibc-ng-test-132c6134d691... | 2 
ustream-ssl-5a81c108d20e247... | 2 
android-tools-4.2.2+git2013... | 1 
             bmap-writer-1.0.2 | 1 
cegui-e7a03afc70c6182a091ff... | 1 
             dahdi-linux-3.3.0 | 1 
                   dante-1.4.4 | 1 
docker-credential-acr-env-0... | 1 
              e2fsprogs-1.47.3 | 1 
            erofs-utils-1.8.10 | 1 
              fstrcmp-0.7.D001 | 1 
            gdk-pixbuf-2.42.12 | 1 
           ghostscript-10.06.0 | 1 
glibc-2.42-51-gcbf39c26b258... | 1 
                   host-gnutls | 1 
                 host-rust-bin | 1 
            igd2-for-linux-2.2 | 1 
                  iozone-3.508 | 1 
                  janet-1.40.1 | 1 
libdill-32d0e8b733416208e04... | 1 
                  libva-2.23.0 | 1 
              libxmlsec1-1.3.9 | 1 
                linux-firmware | 1 
               linux-pam-1.6.1 | 1 
                     mdadm-4.3 | 1 
                 mdevd-0.1.6.5 | 1 
                memtest86-7.20 | 1 
                       mrp-1.2 | 1 
                openssh-10.2p1 | 1 
            optee-client-4.9.0 | 1 
        perl-xml-libxml-2.0134 | 1 
                petitboot-1.15 | 1 
               pulseaudio-17.0 | 1 
python-remi-2022.7.27-37-g1... | 1 
             stress-ng-0.20.00 | 1 
              tailscale-1.78.1 | 1 
uhttpd-15346de8d3ba42200249... | 1 
ulog-0389d243352255f6182326... | 1 
               valgrind-3.26.0 | 1 
                 zlib-ng-2.3.3 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      | android-tools-4.2.2+git2013... | NOK | https://autobuild.buildroot.org/results/cd0a62540a9a22d0ce2a90ad47e9e6f251f1ab3e |     
powerpc64le  |       bmap-writer-1.0.2        | NOK | https://autobuild.buildroot.org/results/39b16a429fe7755e3e7680b394088127a4534226 |     
  sparc64    | cegui-e7a03afc70c6182a091ff... | NOK | https://autobuild.buildroot.org/results/88d0f8e591aeea5f7f582822e7c8a6df2bb80cb8 | ORPH
   armeb     |       dahdi-linux-3.3.0        | NOK | https://autobuild.buildroot.org/results/da5faf3e85e6ec068fc5b778081cabf355d51f66 | ORPH
   armeb     |          dante-1.4.4           | NOK | https://autobuild.buildroot.org/results/f35b75bb5f0f7e670b49b99c5274e318f646403d | ORPH
    i586     | docker-credential-acr-env-0... | NOK | https://autobuild.buildroot.org/results/d306ce50b90195ab7d469783bfe09acea2352588 | ORPH
 microblaze  |        e2fsprogs-1.47.3        | NOK | https://autobuild.buildroot.org/results/5a6784fe26749e5dc9813839f061b2d6026b761d | ORPH
  riscv32    |       erofs-utils-1.8.10       | NOK | https://autobuild.buildroot.org/results/c3d31c5af6077516f0ace3de4435d18028a39d7c |     
   armeb     |        fstrcmp-0.7.D001        | NOK | https://autobuild.buildroot.org/results/d9885c774f4f6fa9358f3422731341d01c6bca50 |     
loongarch64  |       gdk-pixbuf-2.42.12       | NOK | https://autobuild.buildroot.org/results/e2a939443f715b89c0b5c49a645a7f081031b661 | ORPH
    arm      |      ghostscript-10.06.0       | NOK | https://autobuild.buildroot.org/results/eb577879dee7232d8890f6c2bf0fbb5fb554af9e |     
   x86_64    | glibc-2.42-51-gcbf39c26b258... | NOK | https://autobuild.buildroot.org/results/36f38715ea999a001de7b4cd0ca26609c81c2e27 |     
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/d959666e7f4b460499d3b0e93092ba6021546f2a | ORPH
   mipsel    |  gobject-introspection-1.84.0  | NOK | https://autobuild.buildroot.org/results/8233845400083f7fb30ec3e3c4887821213161bb | ORPH
loongarch64  |          host-gnutls           | TIM | https://autobuild.buildroot.org/results/4d2656dbf0719322bb286ca2c81b8895a98d60b1 |     
    arm      |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/0c7fe4eb963e2995b5f227989c7456ad36f9c3c0 |     
  mips64el   |        host-guile-3.0.9        | NOK | https://autobuild.buildroot.org/results/8a87c83d7ed61e202603a96f9e4fdfa6ec38d58c |     
   mips64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/0f3107de327151147f9e9a4fef6a2a0ad7665f34 |     
  riscv64    |   host-mender-artifact-4.2.0   | NOK | https://autobuild.buildroot.org/results/403f6e678f24067a8eb9a388ceefb6a69439d0c1 |     
    m68k     |         host-rust-bin          | TIM | https://autobuild.buildroot.org/results/95f81b335974d91a632ef90815fcdc0a8288d129 |     
   s390x     |       igd2-for-linux-2.2       | NOK | https://autobuild.buildroot.org/results/f7bdfd2d9da272d6737e37b2228b8a520bca5cac |     
 aarch64_be  |          iozone-3.508          | NOK | https://autobuild.buildroot.org/results/133b2868f653d90324a272fee55dc4235fa2d8b5 |     
   xtensa    |          janet-1.40.1          | NOK | https://autobuild.buildroot.org/results/538d653683b83ec3774ffb5ebaa04e9dab7a97aa |     
    or1k     | libdill-32d0e8b733416208e04... | NOK | https://autobuild.buildroot.org/results/c90905a2aeb6369a0acbbf62b7b0df63c3c864c4 |     
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/46ac236442671e3b86157a128fb1188762f16699 | ORPH
  riscv64    |        libopenssl-3.6.1        | NOK | https://autobuild.buildroot.org/results/6872c7fa8f26a382212923a566c08f0dbc1aaae2 | ORPH
   mips64    |          libva-2.23.0          | NOK | https://autobuild.buildroot.org/results/01af1dc8cd464e97bbf06af13668aae8311ca7ab |     
  mips64el   |        libxmlsec1-1.3.9        | NOK | https://autobuild.buildroot.org/results/958d66659953256181e7ecfcee1ed48811279e51 |     
   armeb     |         linux-firmware         | TIM | https://autobuild.buildroot.org/results/d59f79c817a3c463be27022b4a725f43a47b1dc3 |     
  sparc64    |        linux-pam-1.6.1         | NOK | https://autobuild.buildroot.org/results/79880c82dbc39949df34ea6b947accf425ec4b9e | ORPH
powerpc64le  |           mdadm-4.3            | NOK | https://autobuild.buildroot.org/results/ce2937b28d3e5f76754caee044f99e9f769403b8 | ORPH
   mips64    |         mdevd-0.1.6.5          | NOK | https://autobuild.buildroot.org/results/c67df835911982a06f46b6446c7a026670287193 |     
   x86_64    |         memtest86-7.20         | NOK | https://autobuild.buildroot.org/results/092631be8b0b2d9c214344db577bf586f448048d |     
   mipsel    |            mrp-1.2             | NOK | https://autobuild.buildroot.org/results/1ef870f5e7446e4dba3775a077a0293745691a2a |     
powerpc64le  |         openssh-10.2p1         | NOK | https://autobuild.buildroot.org/results/552e44c90e29b586f798148fce40786d77786206 | ORPH
  mips64el   |       optee-client-4.9.0       | NOK | https://autobuild.buildroot.org/results/cbf7382794e2e2c4ee69bb67f5b9d75ee6961a53 |     
   s390x     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/553523ef7262a2b878835a2c7fc94add9e0b655c |     
    arm      |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/05104d29138275f4059d3925de261ec3db8c3faa |     
   sparc     |          perl-5.42.0           | NOK | https://autobuild.buildroot.org/results/b5350438262e848d82a448757795f701c77d3cbd |     
 microblaze  |     perl-xml-libxml-2.0134     | NOK | https://autobuild.buildroot.org/results/b2e46ec3364ddd5402f377d55b766f293d26b47a |     
   s390x     |         petitboot-1.15         | NOK | https://autobuild.buildroot.org/results/31f6be871a783365db88d9b1ef68c745c289fb9b |     
 microblaze  |        pulseaudio-17.0         | NOK | https://autobuild.buildroot.org/results/a0394a17eaf7654921fd5ea626c980c682601ff0 | ORPH
 powerpc64   | python-remi-2022.7.27-37-g1... | NOK | https://autobuild.buildroot.org/results/070fbd1866a9c45b5d8caab0f7803506f8ba6de9 |     
   sparc     |          strace-6.18           | NOK | https://autobuild.buildroot.org/results/00b7003d1b0dbd6f332d13892de698c3d85131e5 |     
    arm      |          strace-6.18           | NOK | https://autobuild.buildroot.org/results/7a35bfcae87b1fbe1d6e0c4271a364ce330c1d51 |     
   s390x     |       stress-ng-0.20.00        | NOK | https://autobuild.buildroot.org/results/24b141807d049b7522d2e82420adfcce326ddab8 |     
powerpc64le  |        tailscale-1.78.1        | NOK | https://autobuild.buildroot.org/results/4dc3e221304b05159d8103474461795f89a9ebce |     
    hppa     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/ad631c6c12a3e35fda332fbf6484857b248cd5f0 |     
   armeb     | uclibc-ng-test-132c6134d691... | NOK | https://autobuild.buildroot.org/results/db79598d2333909a745c46c09326ba036f611edd |     
   xtensa    | uhttpd-15346de8d3ba42200249... | NOK | https://autobuild.buildroot.org/results/cbff6e957bb386c62562c58cc0a0a19fda2a4af6 | ORPH
    arc      | ulog-0389d243352255f6182326... | NOK | https://autobuild.buildroot.org/results/98f2c57afea246527739da688f2ce3404d54e7b7 |     
 powerpc64   | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/259186a17a83cb7fc96426751af109e39a831229 | ORPH
 powerpc64   | ustream-ssl-5a81c108d20e247... | NOK | https://autobuild.buildroot.org/results/1e60882900a8c29dd101fc7f32e0a08a82525423 | ORPH
  powerpc    |        valgrind-3.26.0         | NOK | https://autobuild.buildroot.org/results/8e8ce585d7daff0ab02e1f6f333eab22696bf93f | ORPH
  powerpc    |         zlib-ng-2.3.3          | NOK | https://autobuild.buildroot.org/results/a0fa5a175c546993d818371a0de93b2e9845a183 |     


Classification of failures by reason for 2025.11.x
--------------------------------------------------

libesmtp-v1.1.0-14-g335ee8d... | 1 
              libmhash-0.9.9.9 | 1 
     libphidget-2.1.9.20190409 | 1 
        ltp-testsuite-20250530 | 1 
                    mpir-3.0.0 | 1 
                   perl-5.40.3 | 1 


Detail of failures for 2025.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i686     | libesmtp-v1.1.0-14-g335ee8d... | NOK | https://autobuild.buildroot.org/results/7e4e8a2090484ff75f67f7ab6b9f048fdcd1f7d9 | ORPH
   sh4aeb    |        libmhash-0.9.9.9        | NOK | https://autobuild.buildroot.org/results/6f7849f8d21c962f38fd59477609ba4fa7ae8d6e |     
   s390x     |   libphidget-2.1.9.20190409    | NOK | https://autobuild.buildroot.org/results/e5b22f5137cdb0571f16ca2332f04a8cce02b01f |     
    arc      |     ltp-testsuite-20250530     | NOK | https://autobuild.buildroot.org/results/ee53f104458af675d35475a91f71b99d98207b4c |     
   mips64    |           mpir-3.0.0           | NOK | https://autobuild.buildroot.org/results/e45eeec1b1f0879e6770b6f3d79989fa3391f75e |     
 microblaze  |          perl-5.40.3           | NOK | https://autobuild.buildroot.org/results/d327fbc225f9b44e929f130fdde21241c168e008 |     


Classification of failures by reason for 2025.02.x
--------------------------------------------------

                libselinux-3.7 | 3 
           host-libselinux-3.7 | 2 
          cryptodev-linux-1.13 | 1 
          linux-5.10.246-cip66 | 1 
                 openssh-9.9p2 | 1 
              xmlstarlet-1.6.1 | 1 


Detail of failures for 2025.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |      cryptodev-linux-1.13      | NOK | https://autobuild.buildroot.org/results/f7632524a8cedeefe63dd43d677da630003f819f | ORPH
   mips64    |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/22962b95643db710b0494411048afdd06a975e87 |     
 microblaze  |      host-libselinux-3.7       | NOK | https://autobuild.buildroot.org/results/59024bf5363e009ff91b081ca2cdd0bba731cc8a |     
  powerpc    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/9fa3a3f4647810301c4a4d0e088891b619635c4d |     
  sparc64    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/eb5d63987ef344f0bbdd3a3ef0b8dbaa3c0e4194 |     
  sparc64    |         libselinux-3.7         | NOK | https://autobuild.buildroot.org/results/ebcc5db360ce5d64be0f2e01dcade01b30b5c23a |     
    m68k     |      linux-5.10.246-cip66      | NOK | https://autobuild.buildroot.org/results/6914f2e493e95210b2121ba38951c90a66213fbf | ORPH
  mips64el   |         openssh-9.9p2          | NOK | https://autobuild.buildroot.org/results/72bd47ffdc78c41f92c7b4ee5ec150863917694a | ORPH
   armeb     |        xmlstarlet-1.6.1        | NOK | https://autobuild.buildroot.org/results/c604951c23a4be839d257e16406d42cc42a975ef | ORPH



-- 
https://autobuild.buildroot.org
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
