Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9B68C98305
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 09:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF80D80DE6;
	Tue, 22 Sep 2026 09:03:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eIe9HBE4pGrO; Tue, 22 Sep 2026 09:03:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org A0AE380DB9
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790067801;
	b=ceD3wMQ/17m8zwvnrIRqnafFwcYDofkENMJvXoboYEoqVx7A0rFPAjqVn7BsYdmnL75/
	 Dvq5u+7r6KtNiqFfv1CZj0UYBUKGSWAlg06o7mgSfq81vcJ5b+lkQ9wk92S65I1o2qBy9
	 eTLFuNXZDjsJZ1WVdYTDUH3EjWvids5hBcNNrH7CIyuVw+dUDzUvfWfvHuhXsNu/8q5yr
	 wV4CaiY2sIG0CSn0lSHfFzZtW8MitH9nfktKS4RxHx0V77Fnwo1v+1pWNqnv+jgqiaHXe
	 W4SFX7TlpyTJIq7G5PM2MgWlysTtMGqfqG/q1zASCub5XthMM5H3+ZBqLqP49GZLQwQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790067801;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:Message-ID:Date:MIME-Version:User-Agent:To:
	 Cc:References:Content-Language:Autocrypt:In-Reply-To:X-Provags-ID:
	 UI-OutboundReport:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=QcGRvlCmYIHIel7ZFTtLWJD3jIOSIOgJYuVwnHzTNog=;
	b=R8TlQOu4QNfhC3YVoyL9TiN3z6F8QrNg4Dx6s2wZ1TrGMmIF3JshIAW2IujJD5MZAD7u
	 knApAXj2OJTvPdQ5x5ENEYJOxja3pvZvP+MrjaSd/sNY4r4RyWTNFnbgs56JfNrYgMxar
	 /b14KTxLRURZ8EiE1dQHcSzZO1yg45BWt7mJH8/I4Ziq63D4poXNpJIQF9B1/IrAFJfoJ
	 Ey4iivu14xb2dtv/kKS45dlfgPBrEDm3jxNIksD0GWZnvaA+wYHHx/GuyAEjhoQQ9SRIU
	 WESJeacaGTPWsL00E7pMyT3uuZto04Vz+8yi5WHSVLZPIa//yVXfUamIFXCBTJpiQnQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790067801;
	bh=QcGRvlCmYIHIel7ZFTtLWJD3jIOSIOgJYuVwnHzTNog=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=N73L895hpXppI1qC1Y+I+/j/irlRMz/bhFsjA7+/TlQl3HluRwe06/XTEkLLpFfil
	 1x6vSDCgtliePF3BQvrCj/S4QKSX8ZaS8EtlByI/ve7Rlra3ZtvbtTroKyeSAlPAqb
	 TlIBze653OVK5AyH7HB2vP+/vGTelMgvmcvXpa0NmOsPaVLBVnwpYPGWZ87iszJ5AL
	 MWzWC13th3I7sj5EheqZhvdQDhoaYRDkT8W2RRCVuqK6QSOUDxlg7NEUy7Y9VUoi/d
	 zcme0i5dG/U1EdrwAOzg1T9iJTlYU/VjYdXiZyn4QOE3KIO/PSWEPDF5VPI7Q4V9ts
	 Gtm2rv6ffrKmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0AE380DB9;
	Tue, 22 Sep 2026 09:03:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5B00212C
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 09:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C86E40814
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 09:03:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HDztLp-NLVrj for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 09:03:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org AE98D40799
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790067798;
 b=SxAONtjW8cf4B2NP1Ajng5RiVFAIpgz7muFLPfeDW3GUpefL+oQbmmvbg/3nBLg7241Z
 lg7SaD/ArzDHS6RolqqF1Z8o+Z4i1F1FPCzQ+RAGXGhFX7pj0MkQOAa5rmT8T9RbuS0yC
 TFHJ3aHMHab4lOpVA9+k4PKv4evKhX1CZ+swrVaC/s561/YrQ5z6/5Q7+Cg5b27txRKEI
 MZdjWuiuqpXzDDcf5U1yLv0FNeAUjQlN/4vOu5n4HEbM/rIicolq+niDBo10Hd3lzaiaL
 hIXP79tZsWNoyu2KPYnyOamFDFF4yPGeMq5L2rqFq97sYDwjWV6VHxjmMw+I8lM+h2A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790067798;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=77iUVYObAnNRnpzwLtsjBI6LwHNg/yuDiXUHbCcy5Hg=;
 b=ekFXMvEwfX4/hrUe7fCAwixzmBFJ349jJ4JHNvP3rJkJDdMQ/ASediInxzplUduqVkeV
 fCaNCe5VTNCFusWoGhVGMHwukcAA1G4dBcZoHQ8mvoad403LI3CZiJFSAQ31HAWZza6q3
 dZRwUVxpED5Jy5uGjnDHik/sACiEVTF1wT2MulM1PDjfvBBnKYzp4MGQNJMQWdLcm21zV
 RSwDWbMCDZJtqbQCxeTcr+BawxAYchf9GvtIYKE5B6zQVZwjMFtHuKhiHCKcASyRO6Fdn
 AWDS5gKdbLFXKcE2Pa8XWn2s5ls1ZuepcfNCHf0vY/MSlSAsik/WxnF7sekmNsCWfOA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=b49tiEgc; 
 arc=none smtp.remote-ip=212.227.15.18
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE98D40799
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 09:03:17 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkYXs-1wTsA51AEg-00lDnl; Tue, 22
 Sep 2026 11:03:11 +0200
Message-ID: <24793bb5-3406-4353-8be5-15bdab0da78d@gmx.de>
Date: Tue, 22 Sep 2026 11:03:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com, buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
References: <6e9cc7dc8ad61d29d10b302f3654bfd0ca839d72.1790053648.git.yann.morin@orange.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <6e9cc7dc8ad61d29d10b302f3654bfd0ca839d72.1790053648.git.yann.morin@orange.com>
X-Provags-ID: V03:K1:jVr4wIK/m3p4yMGHzFAT4/Hq1ifVKx9Fkp2DsjN+sKm4ph4IjvF
 41guW0UEKwJxyG+BGPrjC3judOWFTN4AxeAGPtP0D/VA6tEomI/1OAbIyw02HGeyzxH0Ste
 mB+899eK/4QCNJf9lJAG9e5ji7/2kOhwxPqHujOkXSZPK4ae/i504Ul3qB55w1E1MP6WnDp
 pNhcPBJmC6LXoGJWhrGlA==
UI-OutboundReport: notjunk:1;M01:P0:BFVsE0pC4qA=;Hr+FylRGo3yZqg3BwKQtx91OvQH
 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
 0YcKuAyz5Bw3P
Subject: Re: [Buildroot] [PATCH] package/skopeo: use new upstream location
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 22.09.26 um 07:07 schrieb yann.morin@orange.com:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> The upstream location has changed (with a forward from the old one, so
> we did not notice earlier) [0] [1], with 1.23.0 the first release being
> made from the new location, which was accounted for in 96aac440dd79
> (package/skopeo: bump version to 1.23.0) as it required the change of
> the gomod, but where the new location was missed.
> 
> Eventually switch to the new location now.
> 
> [0] https://github.com/podman-container-tools/skopeo/pull/2854
> [1] https://github.com/podman-container-tools/go.podman.io/pull/6
> 
> Reported-by: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Applied to master, thank you.

> ---
>   package/skopeo/skopeo.mk | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/skopeo/skopeo.mk b/package/skopeo/skopeo.mk
> index 5a22658611..5d23cbf451 100644
> --- a/package/skopeo/skopeo.mk
> +++ b/package/skopeo/skopeo.mk
> @@ -5,7 +5,7 @@
>   ################################################################################
>   
>   SKOPEO_VERSION = 1.24.1
> -SKOPEO_SITE = $(call github,containers,skopeo,v$(SKOPEO_VERSION))
> +SKOPEO_SITE = $(call github,podman-container-tools,skopeo,v$(SKOPEO_VERSION))
>   
>   SKOPEO_LICENSE = Apache-2.0
>   SKOPEO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
