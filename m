Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3834FE73156
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 10:30:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05855408BE;
	Mon,  2 Feb 2026 10:30:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PJsO-GRMiSyf; Mon,  2 Feb 2026 10:30:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BCE540A47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770028246;
	bh=6/b4xzO6YWzlW7KA7XT05OwjHewnIL7/QOVGy4vuzyQ=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gGFvnIGSUsnNc7DpgwAvLjmNPQBc98ZtAsiyZvcWS2ZCSufrZ26LnWxuZMAJOAJ41
	 Jmu0AlT3nShTJcQvus18iUvocvO1kg6o9OKPGJnQ4sW5HUbUvlWVfAupjPPF97yhiK
	 N/RY8muK/mIcYoARuVOFQSwBOX1xLy1uh3p9xt5ISJFsulA/ePjJAuqyaZ1TNSP2cv
	 Y5rvnsNASVq8LjwZi7Gox81fdto5ubgFeBuaH7k011ZsvEgQMCo26a/Y5R5XqAYNUj
	 oc86OWshq3E5ni+ZEpAy2XkpYMjvunRan/nEUd6tfxPTEU0EJclqqTkHc5HhPMPBXL
	 yTEEmtSGAJ9WA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BCE540A47;
	Mon,  2 Feb 2026 10:30:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 70DA4149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:30:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 60EC660724
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:30:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U62M8eHBa1mT for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 10:30:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5705060722
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5705060722
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5705060722
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 10:30:43 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 959810494; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Mon, 02 Feb 2026 10:30:40 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vmrCZ-00000005t2E-0QXP;
 Mon, 02 Feb 2026 11:30:39 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Waldemar Brodkorb <wbx@openadk.org>
Cc: buildroot@buildroot.org
In-Reply-To: <aWpqtkIY1vt9B4w5@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Fri, 16 Jan 2026 17:43:34 +0100")
References: <aWpqtkIY1vt9B4w5@waldemar-brodkorb.de>
Date: Mon, 02 Feb 2026 11:30:39 +0100
Message-ID: <87zf5r4euo.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=f11kSfc7pMk8bUPzxyRTicVMmgpxREpLg/Zn4Ro4R7g9Pj5FlE6j+PVdzJCtkf47deS06ZlsezaTgr0CEL+eODB82T6CWsJgQPtpT7PAuu28eoKEI24v+imRwyW8XDvw1slxGrLkdPkgyMMtHjqYcctSI30UrbPmRf4E5JF1KhwbOYcx0xyUZfeiznMx7JbhaV9nCTTEPvgML8dzgec0+0P8dRoxuN7DV2B3464Z3GhSyC8e3F0vQl3YgqGpnupDpmbUTnEk9dmm4yTGFbco89jz2U+yHBqV6zk0qx1ysDk9KKIBTeEkR0wH18pSdZZySVYWl+Oi/XdfaH5PH2GUNg==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=rIGamKSRVlIgd4MVhFP0nrWpCRl28V9N8ULjj5VJvzg=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=f11kSfc7
Subject: Re: [Buildroot] [PATCH v2] package/nginx: security bump to 1.28.1
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

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > See here for changes:
 > https://nginx.org/en/CHANGES-1.28

 > Following security related issues are fixed:
 >     *) Security: processing of a specially crafted login/password when using
 >        the "none" authentication method in the ngx_mail_smtp_module might
 >        cause worker process memory disclosure to the authentication server
 >        (CVE-2025-53859).
 >     *) Security: insufficient check in virtual servers handling with TLSv1.3
 >        SNI allowed to reuse SSL sessions in a different virtual server, to
 >        bypass client SSL certificates verification (CVE-2025-23419).
 >     *) Security: processing of a specially crafted mp4 file by the
 >        ngx_http_mp4_module might cause a worker process crash
 >        (CVE-2024-7347).
 >        Thanks to Nils Bars.
 >     *) Security: when using HTTP/3, processing of a specially crafted QUIC
 >        session might cause a worker process crash, worker process memory
 >        disclosure on systems with MTU larger than 4096 bytes, or might have
 >        potential other impact (CVE-2024-32760, CVE-2024-31079,
 >        CVE-2024-35200, CVE-2024-34161).
 >        Thanks to Nils Bars of CISPA.

 > Update patch 0007, which does not apply cleanly.
 > License file was changed, year was bumped to 2025.

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
