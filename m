Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B201DE7E366
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D22A61108;
	Fri,  3 Apr 2026 10:28:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QgqzPkPccAPh; Fri,  3 Apr 2026 10:28:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0D2A6110A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212099;
	bh=IfOzlxWNl7Yt/HhjvnW8GtjadsUFO/ZmZPZoPTDf/Sg=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=htTVESc3DGfIeoKOAEKAE9HU2iJQ6lAyJ4TtyUc2oOMk+GF6GLCHFh6SoHHmazKoc
	 fAgHGu7Bpuj9PUZ7EJVT4nAln96Q7cX3Qfnp/KK+3btjXGophNUzwz+c+9qj8dgr6T
	 UQy+HFWUm8PDveVyFCzE2L5NRDI+5PxkeG2TUKRf8IHAjrBFFc3NMq7jpE8fmw/IZh
	 aNhFWfNmJ1oYUQLBliwifZM3hByxZ8W6ItXW3JXH3pFNlHeFGckMjpk5Tan41psqEO
	 9l0tx+vJpJmili9mMsaHG352Qjq4V4KBvwWQCrqSgrehjjvhTH7NrNrM4jDu3wOz4X
	 m76Lo/bN23nsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0D2A6110A;
	Fri,  3 Apr 2026 10:28:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7DE111A9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6437A40E60
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Er3cnMp6Ipi for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:28:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 569CF40E55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 569CF40E55
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 569CF40E55
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:15 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-486b9675d36so15182665e9.0
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 03:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775212093; x=1775816893;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=eyfscECdWLwlOdeUKGs5E2JzMqmpe0+wfloiqT8j+RI=;
 b=aXUeZZ1tof8ci9aTgw1XvU8ILiWiFwRw+9kE7e7wSYf/7Sj/gOVOTNZ5NpFRxvcMUE
 Ra+P5uXj9lTUBq5l/q7q3IbHQXduvashlGn9p0SUUD5CP3YVNLHY+ymuzWz4s7Dosy+j
 OjfdvnQjmGA+0xU9G/3vEh3AxAfUWEgaufo29DiVpMNoVArjCTfkSVqjwxw6W4tZj3iC
 YQpKgcLI3Ght27H/Qo6Lk59+KQ5dB1RKsvAuPtB8KR5dsZw0kwZE+XEAgihlwwmU8j7y
 O6FNStIE7prrLTPPX+WRxrmCP4VrWypcUbxC/ZHZcG8YbrJyI0tBdpLtTVMusPNuHho1
 twQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzGFM7PCDQO2xZLwo788yjA+j9Ph1446sIb8iSKOSMbc0m0/tNEJ+ymxBFcXw9jNbohvsrPdk/lFQ=@buildroot.org
X-Gm-Message-State: AOJu0YxKjnkAhykPx+Uc03QUSt1sNJTnt1oDi25WJgWTsqOG7eGnP+04
 fy38uRlnCHBEaoXinF4TITzMKfauQ1hbppV02ghy/VchTSoE6+D4sP0FycYdJhbS4rcqttcjTUD
 IONZqghY=
X-Gm-Gg: ATEYQzx8mltF/nDgOyZsHo0sZ+F23rQ9oAkEHoNJf4VD9cZae4/zSoe3aM4d+CehOfe
 PraOBQMt0C4o4q4WiO/h2cSc3fmCQdF8fBkf+Q78IJ4vKdQT8l8GIhz5x+QqB+Gl38uaCdUw1qt
 V9yzJ7GxX1ktFCTjvCVOvem8mLfnVLO7cTxQ1NgWWlHMk0fp8z6y43EujCUa04qv8jjz8u1Tk5y
 HZix1rASq93wdC9RJ+z/4N3G18zQvG2CJfLljfXxOzjJWx3988LHilcQwLWl9rzjTJgzgZRBBbU
 G1njVkzXW4fjKXwOMZcXiAiaS4d7+9ZKiGbiaMi5pEfThmZDVLxdroZqkjhx47EunX/TpBty9H3
 Bv3rA1blabc9k7gPmNwCuN9EixuZzu7vBQHOOfYQZxT/rJhxXoC2VGgRXv2wdK379jubQ+vrI6e
 eFSoHRv3ORIfoSB6GtmImcZGHBQRI=
X-Received: by 2002:a05:600c:6385:b0:488:90ac:8f8d with SMTP id
 5b1f17b1804b1-48899776385mr39452425e9.16.1775212093395; 
 Fri, 03 Apr 2026 03:28:13 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e2c5253sm13567647f8f.9.2026.04.03.03.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 03:28:13 -0700 (PDT)
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Apr 2026 12:28:12 +0200
Message-ID: <20260403102812.210516-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326081422.945900-3-titouan.christophe@mind.be>
References: <20260326081422.945900-3-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775212093; x=1775816893; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eyfscECdWLwlOdeUKGs5E2JzMqmpe0+wfloiqT8j+RI=;
 b=P3LL8HRTrLEagl4ZQVqWmSh9u8kSXvwHDwfPFEZ9ED3Q1MQJWFBTC5U6di+ftnHQpz
 dbyxR7fvzAfMrsO3f4Xj+4cCBRsIOq9/CjPy/tJO93rHwEfdcHFL2U/nqUekypJ4ECLH
 WiV8tAtPrr4sQoibYdEVvw5/Wmg0Udi3hCB3w2fhJH85HXWKltF0hEOKmCBv4IbxroGB
 xylRXdvHQ1HFNa99eYDWLNAOQ3rvkg0lTQrpwcZAM3DJH1P+0jMw7XqIEzkCyVAkrzPn
 Www+8ADDV/mgcn+4S1qiQrU53yhsE6t+UGIO5ycyeSHjALlHv7UyQadNAcrVq507g7Bc
 E8Zg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=P3LL8HRT
Subject: Re: [Buildroot] [PATCH v2 2/2] SECURITY.md: add new file
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
> This is an in-tree description of Buildroot's security policies
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> Changes v1->v2:
> - Add references to the Buildroot User Manual for vulnerability tracking
> - Add links to autobuilder pkg-stats and Buildroot security website
> - Link to CPE info for Buildroot
> - Explicitely say that security@buildroot.org is a private ML
> ---
>  SECURITY.md | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
>  create mode 100644 SECURITY.md
> 
> diff --git a/SECURITY.md b/SECURITY.md
> new file mode 100644
> index 0000000000..6b21ffd2b9
> --- /dev/null
> +++ b/SECURITY.md
> @@ -0,0 +1,36 @@
> +# Security Policy
> +
> +## Security advisories
> +
> +Advisories for Buildroot security vulnerabilities are reported on the
> +developer's mailing list. A public archive can be consulted on
> +https://lists.buildroot.org/mailman/listinfo/buildroot
> +
> +Buildroot itself has a CPE to track its published vulnerabilities:
> +https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=buildroot
> +
> +The Buildroot project provides some ways for its users to track known
> +vulnerabilites in the packages included in the generated images, see:
> +- https://nightly.buildroot.org/manual.html#_details_about_packages
> +
> +In addition, detailed informations for all packages integrated with Buildroot
> +are updated daily on the following public web pages:
> +- https://security.buildroot.org/
> +- https://autobuild.buildroot.org/stats/
> +
> +## Reporting a Vulnerability
> +
> +To report a security vulnerability found in the Buildroot build system itself,
> +please send an email to [security@buildroot.org](mailto:security@buildroot.org).
> +
> +This is a private mailing list contacting the Buildroot maintainers only.
> +
> +## Vulnerabilities in packages
> +
> +Buildroot is a build system that cross-compiles packages from third-party
> +sources. The Buildroot developers are not responsible for security
> +vulnerabilities in these packages. Such vulnerabilities should be reported
> +directly to the upstream project that maintains the affected package.
> +
> +When vulnerabilities are fixed upstream, send a patch to update the affected
> +packages in Buildroot.
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
