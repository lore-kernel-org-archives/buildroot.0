Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAFAC44506
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 20:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B02A440A2B;
	Fri, 10 Jul 2026 20:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5lKS5wnTyqjd; Fri, 10 Jul 2026 20:26:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 662BA40977
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783715174;
	bh=+KlHVfCFLvVanKO6axJTa/W0L1nu5XDNCE+25xOmDlA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=IlWcrHvaCVGzfFvrv232Sv4pSabWUyibZoUohlYB2D0GPOHqZzeyshRxgMmgGc38t
	 W4s9WmE4i4kN6oM+Lwephgsir5Hu0QHDe8oYkGuWxdb0yxOKtck1opdzFXgoEYTqpA
	 rGAkNYyv4Vsz0VQF/bTiBVBbL4RlzNlWAQcJxk+oSIGIsQt1ulJ5kUXYGPVsWP2kcY
	 YNebqbXh8Y3txqWyq+BOjQKAdxTGW1fjanXZ3XYh7CI/6OLaXAv3eLF6PDjKXzUOFx
	 mHWgLOBF2f2YInV4hl63ChWkIQ//EZp2hz8BtdAvG4+adgP+GJjDv9l5y3Vyd7RueP
	 /4ecbYZhJArFA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 662BA40977;
	Fri, 10 Jul 2026 20:26:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B2F53372
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A485C40977
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5e0E7dKWL5lR for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 20:26:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C2EBB40966
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C2EBB40966
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C2EBB40966
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 20:26:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id DA15F13F88F;
 Fri, 10 Jul 2026 22:26:06 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 10 Jul 2026 22:26:06 +0200
MIME-Version: 1.0
Date: Fri, 10 Jul 2026 22:26:06 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thierry Bultel <tbultel@free.fr>
In-Reply-To: <20260708195358.1653881-1-bernd@kuhls.net>
References: <20260708195358.1653881-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <354eb5fd4ba17d7e373bf9818447532a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1783715169;
 bh=TtiHwPwhEC76UFZgEYgdIyRwvcQDHVY0um22RXq2F8Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=L6zim5evFTwUIB2tW1I7TkikOkU4QL7PkDXAcNa+ly0PkCzY98OxE7tt/tkuEGVBi
 OkszX7aZ5HfM1w+N7SNKpE4UO5MD19g3/pvhkOOF9zUyoh2USZaOWUFHowHhl+dOGd
 UA7TGBPm4vTICerqK0lbwMJqKhEncQLV4wy+LO9b4gM18zwSPDQnaKb9jYJiSoQ1Kv
 FKMMi3opgY4UenDm3JtlWxsAgpvsbuTqG1TNUz5zUPfTUTHsyoJPNqmvv8CJ3k02Cm
 F6SlrAAvz9XrcrOGa5bSV2MXnCkW0G31H1VChPeydxjCWp/j2XLDiHWAtwMNyhhoVb
 Zv3n7WiN8OSyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=L6zim5ev
Subject: Re: [Buildroot] [PATCH 1/1] package/dracut: bump version to 111
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

On 08/07/2026 21:53, Bernd Kuhls wrote:
> https://github.com/dracut-ng/dracut/blob/111/NEWS.md
> 
> Removed patch which is included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
