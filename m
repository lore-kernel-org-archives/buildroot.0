Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13A98E7E363
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0AA66112C;
	Fri,  3 Apr 2026 10:28:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y-OF3139xDUz; Fri,  3 Apr 2026 10:28:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51DF560A7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212119;
	bh=WOUBbMzclAkyFektaEm8Yn/SorBGTAU0pKv74SgyxJ0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cexlSdNlCam/PabnE8pBGETmBMZ1KDm4fp6r/hQjk/H94t1XtWDZHxjlePZdGWDik
	 l8p246/In/nq8mKYRNb79y8rhVLPkmi3BKYI8KnmPDSBlnhllhjSShaiCFqnTsVAqj
	 1TcPfLkjNb7WjUvyaUNZCSeEdlqxTK8oifWHT/EYD5P3KhDcA3x4F0FnGW+iJLGNTl
	 u5C9eRyhC5AYP/WNH38wP4BH7xLUrK26t6FIgWVwaQhpNhycP3PZa10ZBFAY7dIa7R
	 jUMIgnrEyWyB2YV1ehe+yp5IyeXFOdxEkjiT43th6Lp5JzgqJBTyf6hIfXN2pqN+K6
	 gnL33eOoSmYvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51DF560A7F;
	Fri,  3 Apr 2026 10:28:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 694062CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5AED6608F9
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TRwAxN2J8U4T for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:28:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2EDE460898
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EDE460898
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EDE460898
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:36 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-43cfb723698so1620092f8f.3
 for <buildroot@buildroot.org>; Fri, 03 Apr 2026 03:28:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775212114; x=1775816914;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2JOyUFh5n8rXI7PvFUImy4400cNy6K6hk164sviLAis=;
 b=O3/1Wib1sZ3qqJIvZiebSGQn8se3cS+ANsN/1pIWvlhTUOlFIi5tiGYFLjE0kqz0Fm
 WeYmhMt9xhRybBWEeBZR3cxsLnKiAmrXuEe613EP0benbLkFV+iNZsu1b32/tfdEKGBm
 xYY2XzJMJAZMe1qUlrtmOsXYOz4jwNoo3JJMzy92BBkkCyGWTaxzO7sd6Sl7TBnLTmA/
 Ajyy6mfmilK29efD/5AfgIhp7FwP7JpoJrBeyIX9Z/doZfTroK1afSoES1xFzJqk4teM
 hjB25/IQ47UOoXTpxOOjvB2ZbDrMIDBO9PhFXYCW51Kd5FbbgolHaGc53UUO6Hn7L2zB
 KXRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXL7izDsIX6PLrwsvufYoEQWMtSZ1LkV2XJ/weduu1KurZC28+u98dCPdRnCAWn6lOVGyM2CPclZpQ=@buildroot.org
X-Gm-Message-State: AOJu0Yzq/+/RqWS2NUqrT6xwSpyETsTyDlyFA5Urvn2ptRySK4WjTKrm
 XUGpNmlIcOAjVAl2chpfZyKyPw4WD9QfRa4dotnGuxnMO11Rg2sSBmWhNJj6fwZ1H5Q=
X-Gm-Gg: AeBDieuEN1bAuvHDFW4/IFuNrnYRqMa+CaNA9tHlH1nav02u/cnW5xhnioEateNmh41
 AGYP1rfMfHwY5WX6a72rS/Yth9ndqSqzWxsaUMZwKlI1UAJY209pYExrGOQOe7THWAOKrczZUM6
 yqVFPr9BTIw5w532MGaeg57j0pNgsZTIFBzvTkx3fHurJQUOe7IjxxklxFSoR03jCqQnwYvgpQ1
 NKOgLBEkjzUevGrzGP2LacSoot9hRARJX4FEyGOdncXdRv5lsb/OeDejx+Euc2GbxWlUwI0qzF0
 iXY5ASEQYBiirzCAoU7rQe4epVg5qaogygK9guF8D5+bYp7Qp5mLbvzGQgDKlwud40mFjxRoVmV
 ZPcO0JZGYyht0bJFoxKQz76FPN5liDL9YH9ogGK5u3kqmWUcuuN9URtQ5Bm8zbI1GITpKexmViH
 FRBW45JIf/k6/Ws+2r
X-Received: by 2002:a5d:5f92:0:b0:43c:f976:b8de with SMTP id
 ffacd0b85a97d-43d2928b7a0mr4068156f8f.20.1775212114132; 
 Fri, 03 Apr 2026 03:28:34 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d1e4d2971sm15314925f8f.22.2026.04.03.03.28.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2026 03:28:33 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri,  3 Apr 2026 12:28:33 +0200
Message-ID: <20260403102833.210853-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326211448.3598621-1-bernd@kuhls.net>
References: <20260326211448.3598621-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775212114; x=1775816914; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2JOyUFh5n8rXI7PvFUImy4400cNy6K6hk164sviLAis=;
 b=OY3HQDhY9b0zbZ8xYhPpz1uDGWX54QuiZ4ov1GjvPHZt888A4YKZHAfWnZPYkHhzrj
 oHgLkhFXSCZH55Aa/Tdv4327SnYFcMy4hGMhJIJO3z0AGOg6M19mtBxWtnJ471QPfds+
 CAoCQ39Mz3FHh5jQ8Dyb3P7puVFYBD2S99ti9idC22Lch80GWl3F/cHexW1Wr8qlGzlz
 sOIsSDGdpQr2IxsrjwchXAb79WhVzkN2gCR+Qqr1nzcGns+2/uABr093W0+djAv32jqQ
 BLjAGw1GuAWj9e6JS01D1ezRpcMtmaDAC7qWr37HapAEyBaHzVwHla+PXC2JKMSoOE8i
 qtyA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OY3HQDhY
Subject: Re: [Buildroot] [PATCH 1/1] package/freetype: security bump version
 to 2.14.3
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
> https://sourceforge.net/projects/freetype/files/freetype2/2.14.3/
> "- A bunch of potential security problems have been found.  All users
>  should update."
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2026.02.x. Thanks

> ---
>  package/freetype/freetype.hash | 6 +++---
>  package/freetype/freetype.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
> index 520e6c2bcf..9bd01d3ad6 100644
> --- a/package/freetype/freetype.hash
> +++ b/package/freetype/freetype.hash
> @@ -1,6 +1,6 @@
> -# From https://sourceforge.net/projects/freetype/files/freetype2/2.14.2/
> -sha1  28200b8f8df5a524f476bdacb20f05da1c33280c  freetype-2.14.2.tar.xz
> -sha256  4b62dcab4c920a1a860369933221814362e699e26f55792516d671e6ff55b5e1  freetype-2.14.2.tar.xz
> +# From https://sourceforge.net/projects/freetype/files/freetype2/2.14.3/
> +sha1  62e26b89a057ad4f1e28af977945d5c1975a8e67  freetype-2.14.3.tar.xz
> +sha256  36bc4f1cc413335368ee656c42afca65c5a3987e8768cc28cf11ba775e785a5f  freetype-2.14.3.tar.xz
>  
>  # Locally calculated
>  sha256  bd36c8b474855fa294c2ec5c184544478ef3720aad37d65a6296a4f264fd2d3b  LICENSE.TXT
> diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
> index fbf9d13235..634d9107fe 100644
> --- a/package/freetype/freetype.mk
> +++ b/package/freetype/freetype.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FREETYPE_VERSION = 2.14.2
> +FREETYPE_VERSION = 2.14.3
>  FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
>  FREETYPE_SITE = https://download.savannah.gnu.org/releases/freetype
>  FREETYPE_INSTALL_STAGING = YES
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
