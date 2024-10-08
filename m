Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2050CEF172
	for <buildroot@archiver.kernel.org>; Tue,  8 Oct 2024 14:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58BC74058C;
	Tue,  8 Oct 2024 14:42:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9FVPdEcPsmZ4; Tue,  8 Oct 2024 14:42:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3E42E4058F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E42E4058F;
	Tue,  8 Oct 2024 14:42:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D6DD1BF3AD
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 14:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C245405A1
 for <buildroot@lists.busybox.net>; Tue,  8 Oct 2024 14:42:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LN41YU5-PSLK for <buildroot@lists.busybox.net>;
 Tue,  8 Oct 2024 14:42:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=68.232.141.245;
 helo=esa1.hgst.iphmx.com; envelope-from=prvs=00474e317=niklas.cassel@wdc.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 79C1A4058C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79C1A4058C
Received: from esa1.hgst.iphmx.com (esa1.hgst.iphmx.com [68.232.141.245])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79C1A4058C
 for <buildroot@buildroot.org>; Tue,  8 Oct 2024 14:42:08 +0000 (UTC)
X-CSE-ConnectionGUID: 09Xcz7ARSD6hTo31YJMLXw==
X-CSE-MsgGUID: JTHOVtEeQ9uD/qB3PtNdhg==
X-IronPort-AV: E=Sophos;i="6.11,187,1725292800"; d="scan'208";a="29415879"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Oct 2024 22:42:07 +0800
IronPort-SDR: 670537b9_5+P5DCRVwDQbN4Z4VHDvawykCkO9S6CILXiuk1cTocsPFv5
 yvCizy3XL605a7zu2fqIoZp/InfzCl/lVes1I0Q==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Oct 2024 06:46:34 -0700
WDCIronportException: Internal
Received: from dellx5-r.wdc.com (HELO x1-carbon.wireless.wdc) ([10.200.210.11])
 by uls-op-cesaip02.wdc.com with SMTP; 08 Oct 2024 07:42:05 -0700
Date: Tue, 8 Oct 2024 16:42:04 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZwVETB1Ca+AlrNpd@x1-carbon.wireless.wdc>
References: <20240902112735.728574-1-michael@walle.cc>
 <ZtWx2nqI0YTpwb-P@ryzen.lan>
 <feb35dcc410e1808d220a272ae6cdc96@walle.cc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <feb35dcc410e1808d220a272ae6cdc96@walle.cc>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1728398528; x=1759934528;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=lA6sdtGAMua9iypA+bl4vB5yP+/DEjToNEOegFdWq5o=;
 b=Jx4LydSZVmTeU/5G/9O5HFlLY4O7zMeJ00D38lGF6YqQOLrSxWqthZAF
 2Q8jQwJEt3tNOpbmOy04qo/ovQ2Fu+1nIFKIwI3TwhA5LiE/bmm90XcIo
 7bqiO0pbkDdN2fAyoVrKIo/7UEC1600I7e0aDZmRrLyUsXVaHWX6w6y8h
 D/scbbdgiElnZAftbWMMNd/29iZ6C1XLvtYPoHGQJ17PyXRbbTgqRVo8I
 HVqYfrGp1nB+/7+YHaHBvgCFpNwuV0+fJ2QGWcvi55jLBYjtuy/5TEF8X
 FIgqmVqcI3PKqJSxcczrWIxidJLERjDsl9Y7TwA/fqO0OFJ25YbVZdRaT
 Q==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=wdc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=wdc.com header.i=@wdc.com header.a=rsa-sha256
 header.s=dkim.wdc.com header.b=Jx4LydSZ
Subject: Re: [Buildroot] [PATCH v2] linux: add support for device tree
 overlays
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: =?utf-8?B?R2HDq2w=?= PORTAY <gael.portay@rtone.fr>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Michael Walle <michael@walle.cc>, Damien Le Moal <dlemoal@kernel.org>,
 buildroot@buildroot.org, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Sep 02, 2024 at 05:07:20PM +0200, Michael Walle via buildroot wrote:
> 
> > Either way:
> > Reviewed-by: Niklas Cassel <niklas.cassel@wdc.com>
> 
> Thanks!

Thomas,

Any chance of getting this patch picked up?


Kind regards,
Niklas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
