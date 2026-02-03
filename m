Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C48E8782D
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 13:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 325D8607B9;
	Tue,  3 Feb 2026 13:46:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WO_mV4mUYlS3; Tue,  3 Feb 2026 13:46:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 451C8607D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770126417;
	bh=YP2exbUn50OZUbSQYgSAZ2rb9F6aYHXqtgsatEeTZnk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=p9ky/LUUfkOJdMwNOm1N3uLBDCwf5ty8KooywvFnJpLSYMiXqznJ3gQH66nYZfpL0
	 98aprfKLbVfmuyYOmBrTvGSlt/k0XP7Anp3Z0ipkm548ofI9fmKd49jtZuaVCQn4l3
	 mD5zlSK/AjmWfpiZpkxxzwZBtFLBL1ObG6MnAmaFNRQ9w5NgHIaXYs+28QDXoi0Tcv
	 7XWcs639vaM9VOiuLz5TryXhpBH/0PTiET/8aCwuIeFbXSsbIo9++CACp1PrSIvZ4a
	 rnPoxa3JQ7qJOoi2uMySO+fMYckDyxodzCKjq5vOF5okei1BZE/LZ8PkoC+5sFl2qU
	 0HnmSTN+RQpoQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 451C8607D9;
	Tue,  3 Feb 2026 13:46:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D1CDF4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 346E581992
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:46:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JZoUmbDj9NGr for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 13:46:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4E6E8814D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4E6E8814D5
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4E6E8814D5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 13:46:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 9AEFB60129;
 Tue,  3 Feb 2026 14:46:48 +0100 (CET)
Received: from host-109-89-232-55.dynamic.voo.be ([109.89.232.55:46804])
 via host-109-89-232-55.dynamic.voo.be ([109.89.232.55])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 03 Feb 2026 14:46:48 +0100
MIME-Version: 1.0
Date: Tue, 03 Feb 2026 14:46:48 +0100
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>,
 Julien Viard de Galbert <julien@vdg.name>, Nimai Mahajan <nimaim@gmail.com>
In-Reply-To: <20260120082405.46683-1-thomas.perale@mind.be>
References: <20260120082405.46683-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.12
Message-ID: <082126685df3df328ec9d9169ba0e1d5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770126413;
 bh=X2JHli7r3MfIKIzGu3J8IEmsO0iWA22PQt61sRKP+eo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=KXYaxIhbILQZ4IRbDHr0BdxI0bD6DgXwSZfzz74xPhG2qSK1OtveSk6HSpVsi0BQT
 LF4AFDGYvknTk6m7ImNApySuwodHKQVzwbjNw6x9XncmAOBqt8fQiM1ELdSbxyZUTl
 h2pA2CaaYxHzXVJqyF50hrWAJSMgF3lyas0U8DMfLmaHsfDlJr2MCWm1UYeE5pyD++
 pLRHbCiPr1+1j8z27zSmH8hPi/Fp+uOGRtZp9nIJq2h7/OO1dKz2kVrAmuF0V2GbN1
 xmR464KpV/HEGRjw0biwIap1nAV38LootLIcgBu/c13r8XkBVaMOaZic14qIgIaAKl
 Z1I9fpy6MOaxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KXYaxIhb
Subject: Re: [Buildroot] [PATCH 1/6] package/docker-engine: update CPE
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

On 20/01/2026 09:24, Thomas Perale via buildroot wrote:
> While `docker:docker` is not marked as deprecated by NVD after a
> scan through the CVEs the last entry for `docker:docker`
> is CVE-2022-34883 [1]. Replacing this tuple with `mobyproject:moby` 
> that
> is referenced in the upstream project GHSA [2]. The last entry for this
> CPE is CVE-2025-54410 [3].
> 
> [1] https://nvd.nist.gov//vuln/detail/CVE-2023-5166
> [2] https://github.com/moby/moby/security/advisories
> [3] https://nvd.nist.gov//vuln/detail/CVE-2025-54410
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Series applied to master, thanks.

I also added a note with links about the Moby project. See:
https://gitlab.com/buildroot.org/buildroot/-/commit/9abaa88df92f6ac1b18f177b21377280a6ea1af4

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
