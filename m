Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12575EF586E
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 16:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12E8F40A99;
	Sun, 15 Feb 2026 16:17:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1yhPV2eGxf36; Sun, 15 Feb 2026 16:17:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98E2E406EA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771172246;
	bh=wc4ZC69e8A5j9tx0AqUylWUDm7RHn2fF3dzyUtemSZI=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=ZRUfQMD+XOWFZx7u56vK4PwotxlcpUu6P8qeozHcr+r2lq27+HFGG6fU1wpPoZqKE
	 Kp2ch+4l+CA0N2RWDBxtNwKevJHycXXCBlyO/D1+Z65aMtkXqe6nWFB7ok2EhfXJ9A
	 zgPqQb90VNlMlk4aehk2qD70vEt6ZCgiZvAG2xx0WpAZH2D/QM6keqRrEk1znUPDL9
	 eQ1tBEEgGuwjQD1xabgs7gWvveNo9ZlGdJCRTcSo/CloucKOJUp/SifNzAsSoHFuAp
	 7+r6IDSSaeaV1fnMKRSENW+EgB5yxht2EbA+vobyf1w3k/Fg+fFdr6RhyJ3eIky5sp
	 c0ygV0ykhXpPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98E2E406EA;
	Sun, 15 Feb 2026 16:17:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E80135B
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 16:17:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D33460850
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 16:17:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zcq44-xMu_RC for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 16:17:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 18059608A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18059608A4
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18059608A4
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 16:17:22 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:7f99:e996:ad1b:cb5] (unknown
 [IPv6:2a01:e0a:12:eba0:7f99:e996:ad1b:cb5])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 413FEC08A0;
 Sun, 15 Feb 2026 17:11:58 +0100 (CET)
Message-ID: <1b70a9ec-bc22-4f48-9fc6-71d3c6e4f5ab@grenoble.cnrs.fr>
Date: Sun, 15 Feb 2026 17:11:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Peter Korsgaard <peter@korsgaard.com>, buildroot@buildroot.org
References: <20260215105358.2089856-1-peter@korsgaard.com>
 <20260215105358.2089856-3-peter@korsgaard.com>
Content-Language: en-US, fr
In-Reply-To: <20260215105358.2089856-3-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1771171918;
 bh=o6mvG27MtMmbx7gNWKBEbqovF6dT/5Tj23xQlXo/29o=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=AsoOR8+YIVywTjE2F8B9dIAOm2CiZc+lGr5270TmPNOJ6/JWh/OXEXiDFjDDrjb/z
 7IcqQws69AfIZLfZ1pljMi0JABsgsS0BlR0gXhkdt9mD63EmEhJOGdDfapzVZZVYUy
 WKuTOvzIFP5lV7mZjsRTBQI+DNlVw6zxFrqH0D7UpAEMmHgrzbgM9QC6+98MxH5MAp
 Y+HkJV7jrcrceaTIRFNM7MkVbFXIJ1VQDnmHbwurP96SUkwn+DJc/BykU/hJQhv1BS
 pgNSAwKeCOeXj9Wnr8gKmagcaag9bdfpI/MhIni04S0lo8NmFmdY8g3YEEAegEYOvY
 CA1L+SAtDaU/A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=AsoOR8+Y
Subject: Re: [Buildroot] [PATCH 3/3] openblocks_a6_defconfig: specify Linux
 license file
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
From: Edgar Bonet via buildroot <buildroot@buildroot.org>
Reply-To: Edgar Bonet <bonet@grenoble.cnrs.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello!

On 2026-02-15, Peter Korsgaard wrote:
> The used Linux kernel (4.14.336) does not contain the default license files
> as those were only added in 4.16 with commit e00a844aca ("LICENSES: Add
> Linux syscall note exception"), so specify the correct license file to fix:

Note that there are three other defconfigs with kernels older than 4.16:

  * s6lx9_microboard_defconfig (4.4.7)
  * ts4900_defconfig (4.12)
  * ts5500_defconfig (4.14)

Regards,

Edgar Bonet.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
