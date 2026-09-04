Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70915C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 12:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E8D160E3F;
	Fri,  4 Sep 2026 12:19:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dTQ6laGZHdPD; Fri,  4 Sep 2026 12:19:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E901960E25
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788524363;
	b=hgOqd6tIz8ucEtn+iN6dbP066OA06IrRSsbqm2jZhVDgGZiw1zLfnFFAUO4oh1XFwpF0
	 iMagIW5Go83nA/8qc0OZC1LnOYb82YxGQ+HGf+vAy10IkxsasedZQgj5keoj6w/JPcctk
	 p5yhDlIrfdXOUYCh+TbWhcXuAC/5F4lrnrBCZ+F4uM0Y9ONmzIssRi4uzZm6tLRsqnkU8
	 pxTy0SoOfJVrH+XGx3FnL1+Ntg3FTGjdRwk9mzfxpx85NfxKebyWeT0sv556KnqRQDndu
	 h1uF84t1T1ylyB6TNkKlxkiFMWxdxkTVvkLRwAUZnxH29Hu11W/xMY5n9l7gJhm9sgQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788524363;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:To:Cc:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=rOqpTrAbi6zXAu2dUewgop6H2q3gmFW5IkoYZS8i664=;
	b=EAP9TvMSZc2YOC+U3pHN6WpxYtt1vcxCCmPJiyJ+uo7kAFynrDEcWHyUQdWxcDUYm+XH
	 fweVzErAeO/Q9R+1Ym/xuJQY57/eu/7UVMNvMDApG4N8FdGND0hZ4QXQB7VUdlomKF4ij
	 OyYV9sQXUZtfWycSTh/GilWIdgxKQ19J69lSwPdIJgXCGPKXLsqRuKrpO4GWjYqbm0PB2
	 UH4P/03R4f2Lf1JWnRIXwDQTDU7Iiwer+Ylw17ZsiXdT0kTEdZF23oJCUiXHebfolgRLZ
	 /v6YD2DtVYh2c3Fja3hgpfX9kgXNwldw+G2WUqURf2M08xZThiGjgH/jcHd/+rs1P5A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788524363;
	bh=rOqpTrAbi6zXAu2dUewgop6H2q3gmFW5IkoYZS8i664=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=YRJI/DkBtKFmNA61gr/UOL4tWNwuBXnWMsD4THOg+2GhxhGmxVGrnfd6X4SaVm3yC
	 exycM9SVBw47YhfbXoJ02ukTON35hcDRpybBD2cHOt5m+ASmgho6vb3IvX71h6WeOW
	 0GBum0462baUFX3+xT5WQ/U8dO0wesLvavJm6Bpn/f8lJmw8UDz9Lj7g5iRnuxCMBk
	 95/vDGPSAXaIkGVLXq/TGwfBs7wzNo+ptJn3vlmRX/pUcUOMxtRuKZgRkpORuXE4UT
	 CFF4HazDIBK52wb8fCa+tdPmKXgeUmxof9cX4K3Ozbp4BaqGthYpmwaLqC0/frVp9x
	 SBKgxCCF8Kzgg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E901960E25;
	Fri,  4 Sep 2026 12:19:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C8770F14
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AA26A81174
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AlzvMtsUiQWA for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 12:19:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0A47A81172
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788524351;
 b=F3Ca6Mkb3mYSJDd3VgZMEXoQhE1D2V8mX8WbIGhfGW83sI5pO9yC4y854yUNtItRwiAL
 rNSpsegNX2ecyCA3ZVOaWXKmCfCgjiYomxzJZH5MLI2ngaGRpvRCz30GLrT+F+XJsck+z
 r0wO1IIcCkMQ9N6+0Y2iYwfSqCmsrE/9rt3+ngCpnlwrXhQqikkGQFhTVzivhKrZ2ssD9
 GuRc9uB8KOdHnN8ZWGJ5FC0HKpaJXehOD/Xedp2lIdlKbxZEhdsJVOkNYf2L0kOp/LmFy
 dGiLY/IdylUXBPglfrlpK3iMTtQUxVsIPdLDUOrcs9BXO7WmN2xxOKhx1VpOahyIKMg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788524351;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding;
 bh=4Ra9lWG2X/itf0MUofYaKaSzdGqxxHoymfyxJLsNhbY=;
 b=lYt7XxP0lMVj6h+dqSbwEnOmA9lcXDuOHpm8luLfJPcnTkLdvyaALHPY2d3164LTUO40
 ifZ6tfelYP+Vc6D8xnmiXZsX+BrYwzxJCKYJ4r+tbyQ22SMorRHT1+5T23gnA79h3oY+d
 u9sFgexFMxPcWeWhAN93Y7ryT9j21iL6dJLAB+FsF1UeDWBCVv1WPIm7SDJhdru/4R3GG
 tPwipExVrGHKutzIhvd2WfJVwgy38zMs0g9RpENnxeW6GwPCwPBfSFrbjrzPEaH7I+UvO
 5N2UpxAfUJxBFU0Wbn7JuRvtsBjMSmGkCH7EmjKw5WOQRiqV0rEFK7ISM8x78qB+hkA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=mind.be; 
 dkim=pass header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Nkd24Kst; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A47A81172
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 12:19:10 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-48589798dbbso574059f8f.3
 for <buildroot@buildroot.org>; Fri, 04 Sep 2026 05:19:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788524348; x=1789129148;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=4Ra9lWG2X/itf0MUofYaKaSzdGqxxHoymfyxJLsNhbY=;
 b=Vv21don8p22YXNYp0/YgGWFsbA+EyRe6riZLhlmMMRA1ekGDMs3MSgpmEe/rHjj4LR
 H5o3D9lLXVkV6MP1cLlu8xEIhZDhVHRfjb42wvJT8Dfh2bD3J5CGQnWdoTz+XGFw638f
 qDJS0Te6h1m7VBH/bEkPjADfw/9o6vNzdyr3Yq6cG/gvV7Yph/ZtxXtdvLvUkba8/jR8
 WBlx1z9O+UKM7zws2zKpeAina1zVzIJapiFOR6xIm3H8C1U/NcDQg6MSC/Qy79tsIgPP
 JhUjdBrpT06WhJTdhAkemQ4ne6xNIhckiWh+o99Ylllq8mvT9qT71NG1Kn6SnRnTkyj8
 00LA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzXVZAENNn8AvZeDdwh4NnXXLVB4b/0aCRvgGIKiIyHAd8Gtvivu2+8Y9whUVCi3rBwQiDxkW+z1V8=@buildroot.org
X-Gm-Message-State: AFuF++kWR1+Im7x+h831Q28LZvTt+cdoWHF5oQc0241HSERyli1AFlzg
 4xFzn4Hu2FYwOn2i9SkZYkGa4r9RkfBIG4aMrjZUso72hMW8vuZscv2SV4RyNwjROyk=
X-Gm-Gg: AYBFou09grrOU0dmJoJI/Cf/BsbPjUmbuN9ACKbMrDTep6S9UWDYIbGwLRs8gO5I6Aj
 N83+5/3RytlTiIElbSykg2UHU0HN5tAf3hQWyi0jR3HPY81Wb0OBLT9AHEaNrUlSNik9yFDBL5M
 ZJDevF6lJkLzF6wLkfDu0WObUl3jYihhuNZ93DvVCdipXi/P9Tj1tGhqCF3YdoXI3xX0M5DxZtI
 EqzKyqMUemGwQ2QOtBLfaF9m1UmFAc1AqAtyIyzjB0HZen57O9P/HNFbN6H+yeikt9/K18z3r30
 SZLNH7nBeZfooF5zA/mLIL1cuNPuFy76vMST9CeeAkyg5Mx+wc/Fog4M3tyndd354fX1AXRaqAb
 yXm27KSBJV7uWe9WwFU7PMRCzFknyq86KwXX20SVhSaqPHuSCkLKUaaORSxfigWOdTGCnACK7CF
 NHWpnTgbz/wI71mm/FXSHlSVEN0fI1OVVNaMXQURQeGLnqiToGgzPE9Q==
X-Received: by 2002:a5d:5e91:0:b0:483:3695:6ea6 with SMTP id
 ffacd0b85a97d-485872c1debmr8334330f8f.20.1788524348455; 
 Fri, 04 Sep 2026 05:19:08 -0700 (PDT)
Received: from arch ([213.219.153.196]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858ab73c2bsm4533493f8f.22.2026.09.04.05.19.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2026 05:19:08 -0700 (PDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  4 Sep 2026 14:19:07 +0200
Message-ID: <20260904121907.406630-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827165534.3741128-2-peter@korsgaard.com>
References: <20260827165534.3741128-2-peter@korsgaard.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] support/testing: add haproxy test
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> Based on the lighttpd test case.  Verify that we can download index.html
> from haproxy in front of lighttpd.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
>  DEVELOPERS                                    |  1 +
>  support/testing/conf/haproxy.cfg              | 13 +++++++
>  support/testing/tests/package/test_haproxy.py | 38 +++++++++++++++++++
>  3 files changed, 52 insertions(+)
>  create mode 100644 support/testing/conf/haproxy.cfg
>  create mode 100644 support/testing/tests/package/test_haproxy.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 5eb438906f..b39e01fe46 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2715,6 +2715,7 @@ F:	package/wireguard-linux-compat/
>  F:	package/wireguard-tools/
>  F:	support/testing/tests/package/test_agec.py
>  F:	support/testing/tests/package/test_docker_compose.py
> +F:	support/testing/tests/package/test_haproxy.py
>  F:	support/testing/tests/package/test_python_hid.py
>  
>  N:	Peter Seiderer <ps.report@gmx.net>
> diff --git a/support/testing/conf/haproxy.cfg b/support/testing/conf/haproxy.cfg
> new file mode 100644
> index 0000000000..41e983ea97
> --- /dev/null
> +++ b/support/testing/conf/haproxy.cfg
> @@ -0,0 +1,13 @@
> +defaults
> +    timeout connect 10s
> +    timeout client 30s
> +    timeout server 30s
> +
> +frontend myfrontend
> +  mode http
> +  bind :81
> +  default_backend web_servers
> +
> +backend web_servers
> +  mode http
> +  server s1 localhost:80 check
> diff --git a/support/testing/tests/package/test_haproxy.py b/support/testing/tests/package/test_haproxy.py
> new file mode 100644
> index 0000000000..6fba0c3809
> --- /dev/null
> +++ b/support/testing/tests/package/test_haproxy.py
> @@ -0,0 +1,38 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestHaproxy(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_ROOTFS_POST_BUILD_SCRIPT="{}"
> +        BR2_ROOTFS_POST_SCRIPT_ARGS="{}"
> +        BR2_PACKAGE_HAPROXY=y
> +        BR2_PACKAGE_LIGHTTPD=y
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """.format(
> +            infra.filepath("tests/package/copy-sample-script-to-target.sh"),
> +            infra.filepath("conf/haproxy.cfg")
> +        )
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        msg = "Hello Buildroot!"
> +
> +        # sanity check
> +        self.assertRunOk("haproxy -v")
> +        self.assertRunOk("haproxy -c -f .")
> +
> +        # proxy to lighttpd
> +        self.assertRunOk("haproxy -D -f .")
> +
> +        self.assertRunOk(f"echo '{msg}' > /var/www/index.html")
> +        self.assertRunOk("wget http://localhost:81/index.html")
> +        self.assertRunOk(f"grep -F '{msg}' index.html")
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
