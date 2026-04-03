Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 613A4E7E366
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 372F0610EC;
	Fri,  3 Apr 2026 10:28:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qz0HRBRZEN2F; Fri,  3 Apr 2026 10:28:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12B4160A5A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212091;
	bh=ROBKI90hKHDidv6g285D0pFjdLdx6ME0nWMc3s1h45E=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=sG1OBJxvbAeQM04YwpMpyoZQ6YVCbu8m8JVm8MsRycdO2TBwqKOzcw+jPV3Ko2Egi
	 wfEn+xSF/3l0O2g+9KAxDq1ZY7i+FgH6/CAkgBq2ErANPeGDhhppQlP32qaYrTVmj3
	 oKJe2yyEq3Pq4T8fCG4f1pf3F9OVWtX6AS7Rn/d8pcPapKIUPdn7DN04TkrrZrwZ4J
	 0IQi9kTaq+ScFbebTXgBpqQ7l1A9BAqBzZJA+JEox7l4JzWfdQMJZuVCeBopehl90P
	 gnwrBueAVVl+78ihIUhBE2Qaei4o7y5u5lWP8K9aUzhzFSPJslk4x3CKgEZEWId7mf
	 rPO4ot1bvNJqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12B4160A5A;
	Fri,  3 Apr 2026 10:28:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id ADCC12CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93E5440E60
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1SbiHI0TJP9Z for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:28:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 86E4240E55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86E4240E55
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86E4240E55
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:08 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-488a041eae5so961715e9.1
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 03:28:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775212086; x=1775816886;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=UgxTI0u3dUHTqVXkcQLRNf+pA6YlxzN9XIuwmQ8F7T4=;
 b=OUIQoLscGXRr1n529wDVuW8hWlgaJwDD94xwfoepPYgJzLuMYd9YUBZfv8E1KtTw78
 TabWiILi16pSFu/Q9JcfGH9x4AP6d1mYu5p+8a44aLef4fGtTBUhMLcpl3Qw2P6eeyoA
 CPFldx0F9OkylMqnfQ8s5KMK3fmrpXVR7S37Zwkf8AtpLi+3w2SSwibRo1K9gVwERgIF
 94JxE8ri7tyjDCR6NYTeZD1Sn3gE1a290QGafBF+aQOEUvf8n1RKwR4hi8J4dcqZaJIr
 fcBE1b/jAJfcuLRYEsweeNq7cM0MxRdKKLWGdsXZZT2oDquedA+ey5Gp49tcg4OEHQ7X
 crHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyVLHhimjbO5cI7R66huvio5qjGde8di1RcxWdjruWECsZ6wHS6ZWniw5r36rgDRkMpPd9mHpqW50=@buildroot.org
X-Gm-Message-State: AOJu0YxyZEE3zNjjaMN2epJOKiaFnidMOF9nel0c6s0wsxT5Qg02S4Cl
 inOsf+9M2JGC/KVFzPz+ApQBDCNLYdV05awAm7L6y1cqXZvchobMX29hSkMP1MjqMp3ohqdeMgS
 59RjKV2E=
X-Gm-Gg: ATEYQzzVfWqrmil1brtwVvhKPuNVdGxlC803IW5TIeSzQ/Qeuy6p8iEiMVaFtJTqoUV
 yWVcgCsl2xYytu/VlzNtjBTUyiIfGCdJKB/YcTOlsJg61Jqz6SNDyJCGi0Ht+xK1E8lxlsd0Db9
 AT5W08SDL5V9KjiVluX+9kwqENsjxu5uahBOGu3pvRCsZac+h84gKMJeeN2na8XbIF985PpfVLd
 ri5tM97sfKFJZw8xspPvPhJ10t8bJIOECGwUf6plFraT0nKGEuxTrhNVaHLrbRCrc+gOewd/ien
 +2bLC7FIPAJcz+c8Ot06AVoMOuU//vRxBpDwSyXpbvFVZZ+irtF1Yk3jy5UzrIesBF0H/bRfDrw
 8CX2ewJxancSzSGFfCO6aTnACW1OW+DtlJ6OiL2T74Y3IpR8PgDovEEpYOinek+7GplTaSXa0VY
 OsXhL9ZNcjUs1eOIbf8vDmNLmPy8E=
X-Received: by 2002:a05:600c:630a:b0:485:2fe9:336f with SMTP id
 5b1f17b1804b1-488998e3cbemr38339745e9.30.1775212086443; 
 Fri, 03 Apr 2026 03:28:06 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4887e829c43sm237621815e9.5.2026.04.03.03.28.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 03:28:06 -0700 (PDT)
To: Franciszek Stachura <fbstachura@gmail.com>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Apr 2026 12:28:05 +0200
Message-ID: <20260403102805.210174-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260205184800.3308827-2-fbstachura@gmail.com>
References: <20260205184800.3308827-2-fbstachura@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775212086; x=1775816886; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UgxTI0u3dUHTqVXkcQLRNf+pA6YlxzN9XIuwmQ8F7T4=;
 b=D2mppVGMKPIAkCzsn4DkO/uv0qycnPH4X0XpXxPoBAttNbYD/SorqPDRT3nHefpPeZ
 doivOTEaQbJSNFznPL4zuG1jmFBOH51Ok8M1yAMSF8bceta7p/FL9QmXbycjtQiu8By0
 hI5ZBIahUm3LV2FNW4rxq6Xhg1QzKmWhlwtBxjYPcT3C/3dfuCxnkxlaekW4S2mPe5eM
 +FifuNBBFLfM3CM9jc5OYZF8VXoYFzbuggks5kWhfEGUDPMZrjSCa9MjTN74tPfQHJ1L
 Q7o9Zj1VOFJoNYrXG+/qq9vcRvfWO1AQC5A/lahyCPAznJSsVN3zYeWjM9rw5U1DCvn4
 +OJA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=D2mppVGM
Subject: Re: [Buildroot] [PATCH] support/testing: add memcached test
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
> Add a basic runtime test for memcached. The test starts memcached and
> checks if it responds to a basic set/get request.
> 
> Signed-off-by: Franciszek Stachura <fbstachura@gmail.com>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  DEVELOPERS                                    |  3 ++
>  .../testing/tests/package/test_memcached.py   | 35 +++++++++++++++++++
>  2 files changed, 38 insertions(+)
>  create mode 100644 support/testing/tests/package/test_memcached.py
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 8290ccc281..f2f3bb8e44 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1160,6 +1160,9 @@ F:	package/tbb/
>  N:	Francisco Gonzalez <gzmorell@gmail.com>
>  F:	package/ser2net/
>  
> +N:	Franciszek Stachura <fbstachura@gmail.com>
> +F:	support/testing/tests/package/test_memcached.py
> +
>  N:	Francois Dugast <francois.dugast.foss@gmail.com>
>  F:	board/sipeed/licheepi_nano/
>  F:	board/visionfive2/
> diff --git a/support/testing/tests/package/test_memcached.py b/support/testing/tests/package/test_memcached.py
> new file mode 100644
> index 0000000000..2d00e47ab4
> --- /dev/null
> +++ b/support/testing/tests/package/test_memcached.py
> @@ -0,0 +1,35 @@
> +import os
> +
> +import infra.basetest
> +
> +
> +class TestMemcached(infra.basetest.BRTest):
> +    config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + """
> +    BR2_TARGET_ROOTFS_CPIO=y
> +    BR2_PACKAGE_MEMCACHED=y
> +    BR2_PACKAGE_NETCAT=y
> +    BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
> +    """
> +
> +    def test_run(self):
> +        cpio_file = os.path.join(self.builddir, "images", "rootfs.cpio")
> +        self.emulator.boot(arch="armv5",
> +                           kernel="builtin",
> +                           options=["-initrd", cpio_file])
> +        self.emulator.login()
> +
> +        output, exit_code = self.emulator.run("memcached -u root &")
> +
> +        set_key_cmd = "set test_key 0 100 10\\r\\ntest_value\\r\\nquit\\r\\n"
> +        output, exit_code = self.emulator.run(
> +            f"echo -ne '{set_key_cmd}' | nc localhost 11211"
> +        )
> +        self.assertEqual(exit_code, 0)
> +        self.assertEqual(output[0].strip(), 'STORED')
> +
> +        get_key_cmd = "get test_key\\r\\nquit\\r\\n"
> +        output, exit_code = self.emulator.run(
> +            f"echo -ne '{get_key_cmd}' | nc localhost 11211"
> +        )
> +        self.assertEqual(exit_code, 0)
> +        self.assertEqual(output[2].strip(), 'test_value')
> -- 
> 2.53.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
