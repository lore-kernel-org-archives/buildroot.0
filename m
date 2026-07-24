Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7EA4C53200
	for <buildroot@archiver.kernel.org>; Fri, 24 Jul 2026 14:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EF2A60BA8;
	Fri, 24 Jul 2026 14:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N03wVm5uT44p; Fri, 24 Jul 2026 14:14:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DEA260B8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784902473;
	bh=EucHK37Cv+H6Hlw0rPaBukb1ZLCjOm4Ai1ogay+eMmo=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dGC0hmj5C82FRM8aTJ1v3U2DrvRZUtdXw/T3T0AQ29oeeZqtIXJKxR1fzQl9IUpGM
	 qrzK/DpjY5w0FU76LG9+yf7e9rtKqs4yY1VT0uctNczMcEwYP8s43OtyfiJ/55eu+B
	 q9W48yz5h8F3Ehz0POnZAYzCZME7KzOQTBZLvBuJpGw2iRwmAmlSSkwF9uuMcgYcPc
	 5H9WP35omdQBBYv3vPzlCNbyTHXriwxbZVUElJUEKCTotKOajCRHlhqamyTH4hi9bs
	 j9/xtybpY9+feT78yOqvspIRmrs7qRMH03LmSbxVHb/ejMgRy2VZ32yn4z0WsTvVIh
	 vGD4XQBJI2Irg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DEA260B8A;
	Fri, 24 Jul 2026 14:14:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C44443B0
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B58E780D2B
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SXa9qCK1_iZm for <buildroot@buildroot.org>;
 Fri, 24 Jul 2026 14:14:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9BB6080B99
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BB6080B99
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9BB6080B99
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 14:14:29 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-49550ec592cso10370845e9.0
 for <buildroot@buildroot.org>; Fri, 24 Jul 2026 07:14:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784902467; x=1785507267;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rhMtrTBpWOrObo3jA4z70z/16r1Hg6kUy98xdONfT9w=;
 b=Nv7i1f3g0K5I4FnYfg17TfknSlUS5Prrje+HVReyRS/Bf11VfLs2IgyUaYyxbEnRz/
 NbwpitclyxFJmrSGc7VEGtoUfntaL5gI8UgDqvGJUyO71chQB5QWEi6hy5W3bWeyKZSH
 8WxA8ZuVlw/DQMlvED/j3g1R0VaRbQlns845gAJHmmCRo2UI73S2NX8qoCzYGJS7FP1n
 OG9stzEhu2PTWRrch/45qEcpdhLjso5pqbHYY443LgC/r2Rxu/3fuXxiTZCTWCd7sOBm
 6qvLDHlOAsN5djdlsPuoTXnoZ6lc5c1pTsYr1vDwx66fNF+rMUvOaJQjoNFR1QDsMTPI
 PMyA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqoPr7HRHomAupBfsCnTxNVHyLAjxvPT3oQ2BsOdPR5iBm6nRYq3FRJCf4XAXGd04U9PEVPOhhIYlE=@buildroot.org
X-Gm-Message-State: AOJu0YwDHELdcRKmdoouI4NrPRfBqT8bjSnRjFjJ1I4BOqBKLAUWXrUO
 PSQF0s45tdTsbU/vF14OH6+YQaQgQzCCr3OSQzu8yBhteWIkXtJp9dw2wAtTK3I4UG37foogJTY
 mu54X
X-Gm-Gg: AR+sD10Al7JhssNiNztHdCgaFpFVJnn4IdV8GFCVRiPbwwm2GL5jKeD7JB2eqF4Nhz2
 0bBEd4LpoZ7OBcmH+lIrL+eVmqrhzj8TpfOOYZe2wSPZxCsF2hhwzFDfHYyNMZQrdIUv2dRW0kn
 bmdOwyagE6hwNNgBBwEzVa/q0PDul90YE0++/FXD8pyp1A4xlPRfRVGKyNW4shWVuPrxtPN+mc4
 VGR45EkikaG+Ae6l9SvPQQq0CRdyhSsO3HisHj4vWjDI6BjVn8eP5UjgUrYAW8H23i8DxXx7lRz
 7Me4OEcQboxS/s98BTR/dlyEoDYkMAAx+4LzQ4e+F8I4RK4yJon139NBIiAsudOpQqtogXCs4W1
 Tjib+4vnWRLdzjsOAPD4uHu1uJf8Mqwoes2WtbqyyaQZnUrwN8+KdrAHjGnsFVGlOypUIS4M=
X-Received: by 2002:a05:600c:1908:b0:493:ecf5:89fd with SMTP id
 5b1f17b1804b1-4969f3e203emr8337915e9.17.1784902467378; 
 Fri, 24 Jul 2026 07:14:27 -0700 (PDT)
Received: from arch ([212.233.37.141]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957afb4e48sm76822195e9.13.2026.07.24.07.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jul 2026 07:14:27 -0700 (PDT)
To: Joachim Wiberg <troglobit@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 24 Jul 2026 16:14:26 +0200
Message-ID: <20260724141426.477586-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717142528.2709557-3-troglobit@gmail.com>
References: <20260717142528.2709557-3-troglobit@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1784902467; x=1785507267; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rhMtrTBpWOrObo3jA4z70z/16r1Hg6kUy98xdONfT9w=;
 b=NowSLoRJM8QYBIs6zFAOGakahRxaAOj0BTr0JxmfBmyrG9px5c55hwrGi4B/pcjB2W
 TzcQlCfCB8sTstKIe+UoCylVQE2uAPdF+w9kBcmwiDvsz4Nn1tl1H3ar64CEdZJ4pSU+
 7V/6m/b7ng5eNSKUwPjz4+fXbr5rovII1bdf2HK6vpXvgVF8n6pV7qm2OFfWtmF0D0cr
 dIKDmHpA/sOjnpAevUtyMsBZRulTaMb5JrgE7hRJ00BZrZK0pRbMMNX9IzCubHg7Ldke
 tHMP1OT8VgAfpj5XGyCp3odFSZVUoT1FlJmx+OriOL0KwSmlAmUTU5wfwM5fmDiNckhJ
 VdTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=NowSLoRJ
Subject: Re: [Buildroot] [PATCH 3/3] support/testing: mdnsd: new runtime test
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
> Boot an armv5 image running the mdnsd responder alongside the mquery
> client, then check that service discovery works: mquery browses for the
> bundled _http._tcp service and mdnsd, on the same host, answers over the
> loopback of the eth0 multicast group.
> 
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to 2026.05.x & 2025.02.x. Thanks

> ---
>  DEVELOPERS                                  |  1 +
>  support/testing/tests/package/test_mdnsd.py | 38 +++++++++++++++++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 support/testing/tests/package/test_mdnsd.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index fdfab8b489..82300c4a18 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1664,6 +1664,7 @@ F:	package/ssdp-responder/
>  F:	package/sysklogd/
>  F:	package/uredir/
>  F:	package/watchdogd/
> +F:	support/testing/tests/package/test_mdnsd.py
>  
>  N:	Jochen Baltes <jochen.baltes@gmail.com>
>  F:	package/altera-stapl
> diff --git a/support/testing/tests/package/test_mdnsd.py b/support/testing/tests/package/test_mdnsd.py
> new file mode 100644
> index 0000000000..43057d4351
> --- /dev/null
> +++ b/support/testing/tests/package/test_mdnsd.py
> @@ -0,0 +1,38 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestMdnsd(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
> +        """
> +        BR2_PACKAGE_MDNSD=y
> +        BR2_PACKAGE_MDNSD_MQUERY=y
> +        BR2_PACKAGE_MDNSD_HTTP_SERVICE=y
> +        BR2_SYSTEM_DHCP="eth0"
> +        BR2_TARGET_ROOTFS_CPIO=y
> +        # BR2_TARGET_ROOTFS_TAR is not set
> +        """
> +
> +    def test_run(self):
> +        img = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", img,
> +                                    "-net", "nic,model=rtl8139",
> +                                    "-net", "user"])
> +        self.emulator.login()
> +
> +        # The responder is started at boot by /etc/init.d/S50mdnsd and
> +        # advertises the bundled _http._tcp service from /etc/mdns.d/.
> +        self.assertRunOk("pidof mdnsd")
> +
> +        # mdnsd only answers on multicast capable interfaces that are
> +        # up, so wait for eth0 to get its DHCP address before querying.
> +        cmd = "while ! ifconfig eth0 | grep -q 'inet addr'; do sleep 1; done"
> +        self.assertRunOk(cmd, timeout=30)
> +
> +        # mquery sends a multicast query for the advertised service;
> +        # output is one "+ NAME (IP)" line per instance
> +        cmd = "mquery -T _http._tcp |grep -F buildroot._http._tcp.local"
> +        self.assertRunOk(cmd, timeout=30)
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
