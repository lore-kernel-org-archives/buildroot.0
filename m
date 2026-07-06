Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82F0C43458
	for <buildroot@archiver.kernel.org>; Mon,  6 Jul 2026 19:42:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B63660677;
	Mon,  6 Jul 2026 19:42:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HKQPPgn4-ifj; Mon,  6 Jul 2026 19:42:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CBCFB606A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783366957;
	bh=h/5nro4dfj2SAMVRazCX4h0V4eNMm5glG+6zq4PTF7Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NVRA7C5KHje4KWAddiq+iYfEr6Nz04eXkYPe0Hb+OFGmMBV5mUvk5dYKN3Bae7kid
	 qfBepJfroo65+0mm58QZQzTraMGwD/bOuCsHcDU6S3OTaxYhTKcSmZI7sa184qJZpQ
	 aVbtpnity3YrpX3dauCkPfbD4SjvM+2iLPr8U7q8zOWgzUW5s8fe3KCy3CpOLFNtyO
	 mrYFaiOvT2w25ol+5/AS9QJdeRPk0KBx6QM6tcoHW0q/mDTuHU4bk0s9jNLvbtxwT5
	 IxPdxGXVIppD1jvmxyECkFROzNcuYR++BM6QdTxZgISy+IQT+plTBZmbCY6ck9vkk9
	 kGWuIpqeU/F3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CBCFB606A8;
	Mon,  6 Jul 2026 19:42:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E282C316
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 19:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C8A2B60677
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 19:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZJzjuGjFM86n for <buildroot@buildroot.org>;
 Mon,  6 Jul 2026 19:42:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BF06F606A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BF06F606A8
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BF06F606A8
 for <buildroot@buildroot.org>; Mon,  6 Jul 2026 19:42:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 1C7FE19F59C;
 Mon,  6 Jul 2026 21:42:32 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 06 Jul 2026 21:42:31 +0200
MIME-Version: 1.0
Date: Mon, 06 Jul 2026 21:42:31 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260706173349.2555859-1-bernd@kuhls.net>
References: <20260706173349.2555859-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <bb1db2eaac2ca62448845d68f3952ee6@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783366953;
 bh=xsseNXpyNXpG6JgFnrCaaPGFGXpK+ePYXkeLi/B+fo4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fJhxhitlseAhRhjCFVIh4IoNTo2HMDpT1sRsa8hTeAlXVl66Dh1M0TSCjWOxtN5Hy
 JNV1L6GYIpNQ5gbzxecVIRU2EuL7/7mWe8URL4+UkrP80c79Ye4kpYhNlKTZbin1jS
 xKtJxejyo7vu2LLtQjzQJhs6v8Jv4abjah1h1YGmbuHKbjpnUGNOEEG1SGLprbyna+
 Np6B5nGYsV0ZZkoqPKouI6+XSqsZT64gXKf7Bzj73jBVAzOnpa4qN40fIkRrRuBvtr
 UKL0EBwbDrWi3wPQ1Jhghe6EAic2JPvtQOHqZ1DfZuTc9ZAG2TXIVCL2QF/iUGw0h+
 lFhX6KGsyBSXg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fJhxhitl
Subject: Re: [Buildroot] [PATCH 1/1] package/openssh: security bump to
 version 10.4p1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 06/07/2026 19:33, Bernd Kuhls wrote:
> https://www.openssh.org/releasenotes.html#10.4p1
> 
> Changes since OpenSSH 10.3
> ==========================
> 
> This release contains a number of security fixes as well as general
> bugfixes and a couple of new features.
> 
> Security
> ========
> 
>  * sftp(1): when downloading files on the command-line using
>    "sftp host:/path .", a malicious server could cause the file to
>    be downloaded to an unexpected location. This issue was identified
>    by the Swival Security Scanner.
> 
>  * scp(1): when copying files between two remote destinations, do
>    not allow a malicious server to write files to the parent
>    directory of the intended target directory.  This issue was
>    identified by the Swival Security Scanner.
> 
>  * sshd(8): when using the "internal-sftp" SFTP server implementation
>    (this is not the default), long command lines were previously
>    truncated silently after the 9th argument. If a security-relevant
>    option was in the 10th or later position, it would be discarded.
>    Reported by Steve Caffrey.
> 
>  * sshd(8): add a documentation note to mention that the
>    GSSAPIStrictAcceptorCheck option is ineffective when the server
>    is joined to a Windows Active Directory. Reported by Yarin Aharoni
>    of Safebreach.
> 
>  * sshd(8): DisableForwarding=yes didn't override PermitTunnel=yes
>    as it was documented to do. Note that PermitTunnel is not enabled
>    by default. Reported independently by Huzaifa Sidhpurwala of
>    Redhat and Marko Jevtic.
> 
>  * sshd(8): avoid a potential pre-authentication denial of service
>    when GSSAPIAuthentication was enabled (this feature is off by
>    default). This was not mitigated by MaxAuthTries, but would be
>    penalised by PerSourcePenalties. This was reported by Manfred
>    Kaiser of the milCERT AT (Austrian Ministry of Defence).
> 
>  * sshd(8): fix a number of cases where the minimum authentication
>    delay was not being enforced. Reported by the Orange Cyberdefense
>    Vulnerability Team.
> 
>  * ssh(1): fix a possible client-side use-after-free if the server
>    changes its host key during a key reexchange. This was reported by
>    Zhenpeng (Leo) Lin of Depthfirst.
> [...]
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
