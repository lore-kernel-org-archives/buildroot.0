Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13061C982C9
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 19:48:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF15F60618;
	Wed, 16 Sep 2026 19:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yiSe-xR7u-NW; Wed, 16 Sep 2026 19:48:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org CDCC66061B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789588129;
	b=nzitD9Q310QixqEJI7aItTaG/aB7Bp/kVJomJ2lRGKTHc5d7JJ8S2ZD9aAsX/AIcQB01
	 k6wG83mNmmofNje3qJNhD0cAnt5Q2rw9CdWoVhePgshYO7QtWY36tVdlU/9+pUpDbKcTc
	 CVJUN5mOTnF6GS/cxxJ5JfndKAafjwRi+bskSvtwLjeJsaV5h7qTrMN4obgQQnDrv8E30
	 2E089YPqF8pfZ8rW6pVWQ4T+Y77ASGQaV1ntqY46YoQtRvjBma8+7DqFlewOPlboLhkJG
	 u1OhJD5ur5GDzsLUYazdO5g7EDc75iCtYxcZiNsCKZFoYNFk9bVk3L9HAIqTop8a4bw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789588129;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:Date:From:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=9uW7Sr7UyDhiW747/8Irfbh8rsWnyetomdXVkdISUzQ=;
	b=p+z89y4miIt4i0xW7WMlKirv4k8cuuPYo4jYKa19DxhzG3D92ubTw4Tp+lQw/6zpUL8B
	 2jZLcmIPRj9VrVQ/ax+Qo5bTrLLg2YjZ80/RHZvfcQSNL/4rzuiv4WPpVsd0xJQ1/3sbj
	 7bvV/UTsRyjLmOORTHga709fWFBYOp0s9BMiuKFSwFpHSIxM2muqoxkHqIvnbRlZiabBg
	 WWjk/p7G2qGD8LuOQ5TvhlCmz1Mvzw6TYyT7aXxW0x/DNzXedmb4XiS6Ljeo48drQHpLx
	 K8ADzUdQsH35+SsIFkGZZVe540KxSBOJaiSWroeoU4EMucLB8kaOXNUabvXM/ofQYhg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789588129;
	bh=9uW7Sr7UyDhiW747/8Irfbh8rsWnyetomdXVkdISUzQ=;
	h=Date:From:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l6swxTjse5V0AhPbsSI5z+A444Pj/AoCbVTbf8VItiIv2l5i3nszzbG/rhGILsPC0
	 P4dOT26KmsycFd4SgeVU9YHwSkuoOcv50bH3vARZJLBIjy8BGxp7h9drZxYZQPhmqL
	 MvprnVu5mnwpH3X6kxUUPwFkZ7hqcpNwbH9wPz11r4no4PdLRf+qgIag7s5Cuehvkx
	 mRE3NtZCCb0eX088VEmahGk63YvE1CAldElRRoyFW76XrxzlXR3VmzlmTba3ax3pg3
	 Lrq9Ct8m1MJKftzY2rJLAsDs443o7pt8L1WVc/2zY70SEgTe7aQSGm2T2KDTm9KJXh
	 iqtHsX2vILc5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDCC66061B;
	Wed, 16 Sep 2026 19:48:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 40EFB2E3
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:48:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E7B8404F9
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:48:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4HJ-lUMaPoVu for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 19:48:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org BAED8404EF
Authentication-Results: smtp4.osuosl.org;
 arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789588127;
 b=rMN/M5BBpCPJz0wEFI5rz4HeNFrpdU/PpAFLv9Z8moToOi8POKDIgZ6fQWbd6u7LkOFx
 pKx22z+7KLrtQm6cgXiSYx68w03m+GmavaEVMTt0YM/llADEwYFwbOniOqG7KS4p8g77j
 1OkBye41+uaHAt5oXOYDXWE6PS5lxmvJ0gqJYC6EcYfogS1iWnNp3lq65N+5Uhos3Me9c
 9iv/6cb/33I+PfdQamin0CcwV29856GI9CTCse8hr9DiuXo+UsObtl3jCYMzOFnyLEInm
 l/ij+TNhu9+PwGq+AE5JNTpzbJU0QfBjRUOM1Tol3rXzayvAIHJoPy/gt9JAvDzHGDw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789588127;
 h=Received-SPF:Received:DKIM-Signature:Date:From:To:Cc:Subject:
 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
 In-Reply-To;
 bh=GJbu/NMGPo/jJXaSPly0w5zh0lpGh7eYhHrMYanGWMc=;
 b=I8N+H7aUwOwFPVBqZHocwbH0k2n4jxDJIcj7ABRdo57dPjU3KNAKYs7HFxixk7Mh7qY/
 tMYx7UOpOGx1mP9eZiL/RiOQLmh98VO7baJ5vDSnUxgNOX8qnZiyPECHUpLrbaKmdeS/M
 hC9HT8HrSTJtgp/28ml3z5Qchyo13QxLFO/FdgS44ve46JFulTfPZpL6xMX6eJC8H83DG
 vg6/m5baQaOu6Rsq2fWeGI0BiorzmvHMA4R1IWCeeloy5EZJj54HCIB7YKbp7qGepZgQB
 6BH0rsXgMCsACawmTVcXB/h7YZggHhqjMtS6AOS4MrvY8e/vYuDP3K0+XPTB374SXEg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=ideasonboard.com; 
 dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=hTFEbKSS; 
 arc=none smtp.remote-ip=213.167.242.64
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.167.242.64;
 helo=perceval.ideasonboard.com;
 envelope-from=laurent.pinchart@ideasonboard.com; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=ideasonboard.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=hTFEbKSS
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BAED8404EF
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 19:48:45 +0000 (UTC)
Received: from killaraus.ideasonboard.com
 (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3482E512;
 Wed, 16 Sep 2026 21:47:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1789588020;
 bh=ep/OnIYG8364wVH8K6ebJbp1gsYBZKCr8yJwYyf2Awg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hTFEbKSSZAP3jeVhbM805kuaD+3nDOoCMqHpBe5NMGuRhYdlydtmn80cbb6Ll9bbq
 EoJUvEjNIR6KkmNbBAUK56p2Qc4xZ4N5YB3AbABZnUwaONyooguWAkTOJsQiGfmqFj
 70F6aSjhvsYmTx8fuCuFKzKxQm35+ji9yHYnwbTY=
Date: Wed, 16 Sep 2026 22:48:40 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Fiona Klute <fiona.klute@gmx.de>
Cc: Paul Elder <paul.elder@ideasonboard.com>, buildroot@buildroot.org,
 sakari.ailus@iki.fi, Eric Le Bihan <eric.le.bihan.dev@free.fr>
Message-ID: <20260916194840.GC191870@killaraus.ideasonboard.com>
References: <20260916090705.2796356-1-paul.elder@ideasonboard.com>
 <20260916164355.GA191870@killaraus.ideasonboard.com>
 <c245e93b-d27e-454b-bba5-bc2eaf2fbb53@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c245e93b-d27e-454b-bba5-bc2eaf2fbb53@gmx.de>
Subject: Re: [Buildroot] [PATCH] package/raw2rgbpnm: Add package for
 raw2rgbpnm
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

Hello Fiona,

Thank you for the quick reviews.

On Wed, Sep 16, 2026 at 08:34:54PM +0200, Fiona Klute wrote:
> Hi Paul, Laurent, everyone!
> 
> Am 16.09.26 um 18:43 schrieb Laurent Pinchart:
> > On Wed, Sep 16, 2026 at 06:07:04PM +0900, Paul Elder wrote:
> >> Add package for raw2rgbpnm. It is a tool for converting raw images to
> >> RGB PNM. While the original repo is at:
> >> https://git.retiisi.eu/?p=~sailus/raw2rgbpnm.git
> >> A mirror is hosted on freedesktop:
> >> https://gitlab.freedesktop.org/camera/raw2rgbpnm
> >> so use that instead.
> 
> Why use a mirror instead of the primary repository?

The primary repository is on a small self-hosted server that may have
trouble coping with higher traffic. Sakari, could you tell what your
preference is ?

> >> As the build is simple and has no dependencies nor releases, use the
> >> master branch for the version.
> > 
> > I don't know what buildroot's policy is with this, but using the master
> > branch will make builds non-reproducible. I would instead use the commit
> > ID of the current master branch head. It can be updated in future
> > buildroot releases.
> 
> That is indeed against policy: "Note: Using a branch name as FOO_VERSION 
> is not supported, because it does not and can not work as people would 
> expect it should" [1]. The version must be fixed, if there are no 
> releases using a commit hash is the right thing to do.
> 
> Also, Buildroot policy is that a package must contain a hash file that 
> gives hashes of relevant archives and license files, see section 18.4. 
> "The .hash file" [2] in the manual. That is missing here, and would 
> necessarily break with a branch HEAD.
> 
> >> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
> >>
> >> ---
> >> This patch is based on 2026.08.
> >> ---
> >>   package/Config.in                |  1 +
> >>   package/raw2rgbpnm/Config.in     |  6 ++++++
> >>   package/raw2rgbpnm/raw2rgbpnm.mk | 16 ++++++++++++++++
> >>   3 files changed, 23 insertions(+)
> >>   create mode 100644 package/raw2rgbpnm/Config.in
> >>   create mode 100644 package/raw2rgbpnm/raw2rgbpnm.mk
> >>
> >> diff --git a/package/Config.in b/package/Config.in
> >> index 6058800682b4..6d9daeadafec 100644
> >> --- a/package/Config.in
> >> +++ b/package/Config.in
> >> @@ -195,6 +195,7 @@ menu "Development tools"
> >>   	source "package/mawk/Config.in"
> >>   	source "package/patch/Config.in"
> >>   	source "package/pkgconf/Config.in"
> >> +	source "package/raw2rgbpnm/Config.in"
> >>   	source "package/ripgrep/Config.in"
> >>   	source "package/sed/Config.in"
> >>   	source "package/subversion/Config.in"
> >> diff --git a/package/raw2rgbpnm/Config.in b/package/raw2rgbpnm/Config.in
> >> new file mode 100644
> >> index 000000000000..3d8f36459f4e
> >> --- /dev/null
> >> +++ b/package/raw2rgbpnm/Config.in
> >> @@ -0,0 +1,6 @@
> >> +config BR2_PACKAGE_RAW2RGBPNM
> >> +	bool "raw2rgbpnm"
> >> +	help
> >> +	  Convert raw bayer images to RGB PNM for easier viewing
> >> +
> >> +	  https://gitlab.freedesktop.org/camera/raw2rgbpnm
> >> diff --git a/package/raw2rgbpnm/raw2rgbpnm.mk b/package/raw2rgbpnm/raw2rgbpnm.mk
> >> new file mode 100644
> >> index 000000000000..275fe6f32be3
> >> --- /dev/null
> >> +++ b/package/raw2rgbpnm/raw2rgbpnm.mk
> >> @@ -0,0 +1,16 @@
> >> +################################################################################
> >> +#
> >> +# raw2rgbpnm
> >> +#
> >> +################################################################################
> >> +
> >> +RAW2RGBPNM_SITE = https://gitlab.freedesktop.org/camera/raw2rgbpnm
> >> +RAW2RGBPNM_SITE_METHOD = git
> >> +RAW2RGBPNM_VERSION = master
> >> +
> >> +RAW2RGBPNM_LICENSE = GPL-2.0
> 
> SPDX has deprecated "GPL-2.0" because it's easily confused with the "or 
> later" version, this should be "GPL-2.0-only" [3].
> 
> @Laurent, you appear to be the author of the raw2rgbpnm meson.build 
> file. The license is listed as "GPL 2.0+" there, which is not an SPDX 
> identifier (dash, not space) and does not match the C file headers, 
> which indicate 2.0 *only*.

Good point. I'll send patches to fix that. Or I'll nicely ask Paul to do
so :-)

> >> +RAW2RGBPNM_LICENSE_FILES = LICENSE
> >> +
> >> +RAW2RGBPNM_INSTALL_TARGET = YES
> 
> This is the default, so remove it. If you run "make check-package", it 
> should warn you about that.
> 
> @Paul: Also the initial patch didn't go over the mailing list, only 
> Laurent's reply. Have you subscribed to the ML?
> 
> Best regards,
> Fiona
> 
> 
> [1] https://nightly.buildroot.org/#generic-package-reference
> [2] https://nightly.buildroot.org/#adding-packages-hash
> [3] https://spdx.org/licenses/GPL-2.0.html
> [4] https://git.retiisi.eu/?p=~sailus/raw2rgbpnm.git;a=commitdiff;h=HEAD;hp=c23c8fa65fcfdfbb6c3ebd63d101fe9844e3c19f
> 
> >> +$(eval $(meson-package))

-- 
Regards,

Laurent Pinchart
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
