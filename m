Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A81C4451B
	for <buildroot@archiver.kernel.org>; Fri, 17 Jul 2026 17:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2868640A72;
	Fri, 17 Jul 2026 17:03:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ilvWpMktqA2P; Fri, 17 Jul 2026 17:03:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35216409B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784307780;
	bh=6QyYphIsLxSlHBo2SWeH9eSbeXRRXFQDDfrfEDEG298=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Squf/bK564Vl5e2MrpUxEgXiqp1JTyr6CqaKTXnICb3MNQDNhqwJad9B6FvF9H0za
	 xseADtEv/OLDDmuYhR4/4b+6eXp0NfNKsWRWDvmiYYjkFE6msuC4sA4B4I1ToueXf3
	 N0NtVoE2xnlA4Azmo5vV8562sW50hfC3mWJfp+HRyaMVx9lHGfQVLvrV09IDYwMdU+
	 hStRzQ4KsYERFcNwWy4pUDxgaNL4p418d71maTTRMdefBYR+SDnT5wNaWamSJ+WYGz
	 Thjdppj1amp5NXrqeg7GshUjff1xTQxZKdRQSwqnG/lZOubulpNSZQ84FlExenCMz9
	 z5J7AqqwVrCgw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35216409B6;
	Fri, 17 Jul 2026 17:03:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 166C8320
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 17:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 085C940279
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 17:02:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1G7Sp2pHpJ2z for <buildroot@buildroot.org>;
 Fri, 17 Jul 2026 17:02:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 01CF940056
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 01CF940056
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 01CF940056
 for <buildroot@buildroot.org>; Fri, 17 Jul 2026 17:02:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E9852B0054E;
 Fri, 17 Jul 2026 19:02:54 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 17 Jul 2026 19:02:54 +0200
MIME-Version: 1.0
Date: Fri, 17 Jul 2026 19:02:54 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260715203510.1121926-1-bernd@kuhls.net>
References: <20260715203510.1121926-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <0de8319aeab457805ececec6f65c50d0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784307776;
 bh=7E8pl6xLPMu5KHnZ4fRH7ylsPHMz+CQr2X5njNrbyM8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=F8iggCaM4Pq1q/EjqQOJe02C2xO5sJGYftCzDZiIQEIyw73nq4SynPvlS2mlfNUKQ
 DtvOWb20qqAHWqht+qzCe3FBFvVvBGmMT4ubc1nnJpw/t/xFpLKpYfXGKLNf5PZIEc
 PHEWnBiNNGv3UJp6wZEA0QG0CkGnqWhYVau1JZfEw4tbojjlkVfJomleGqMtEFCWXy
 AQ5hzlnkqI6cjXPoqjxg3GPUDwSMYOtahpxOEAjR/DY86bNlid/I8i/B86HsLlgn1J
 +EMmGnAU6eZgiE5u4hU5atbaaNT+hfbnloIJOallrbBF2O5iRn6mWQay+4BzdMC8C3
 X5UfgyvXRvsJQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=F8iggCaM
Subject: Re: [Buildroot] [PATCH 1/1] package/pppd: bump version to 2.5.3
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

On 15/07/2026 22:35, Bernd Kuhls wrote:
> https://github.com/ppp-project/ppp/releases/tag/v2.5.3
> 
> Removed patch 0001 which is not needed anymore due to fixes committed 
> to
> all relevant kernel versions:
> https://github.com/ppp-project/ppp/pull/504#issuecomment-2337005682
> 
> Removed patches 0002 & 0003 which are included in this release.
> 
> Added new patch to fix build errors seen with older gcc versions
> detected by the Gitlab pipelines. These build errors are introduced in
> the new dhcpv6relay plugin which was added to pppd 2.5.3, no backport 
> to
> buildroot LTS branches necessary.
> 
> Switched back to upstream tarball which now contains the previously
> missing license files added by upstream commit
> https://github.com/ppp-project/ppp/commit/9f612dc02c34509f062ed63b60bcc7e937e25178
> and drop autoreconf as well.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
