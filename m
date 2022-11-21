Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7F4C4332F
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 20:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9966481E46;
	Mon, 21 Nov 2022 20:07:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9966481E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j6N5Q5Md0a1W; Mon, 21 Nov 2022 20:07:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84E0681902;
	Mon, 21 Nov 2022 20:07:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84E0681902
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6D45A1BF34D
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 20:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47AD081902
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 20:07:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47AD081902
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sX0NFUrg4yFf for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 20:07:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C9874817A5
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9874817A5
 for <buildroot@busybox.net>; Mon, 21 Nov 2022 20:07:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:187b:ecdb:c1bc:94df])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 9658E13F8D4;
 Mon, 21 Nov 2022 21:07:39 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 21 Nov 2022 21:07:39 +0100
Date: Mon, 21 Nov 2022 21:07:39 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Fischer <mf@go-sys.de>
Message-ID: <20221121200739.GK2516@scaer>
References: <20221121124001.24170-1-mf@go-sys.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221121124001.24170-1-mf@go-sys.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1669061262;
 bh=pN1+b2HRwBahXvGs85VnVQMnC0k75DJ48ESYW0oIj2A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HMcA/AY/BT9rOptM+/xbaafFKfrapHV8ZRzfCvWcfIrToL+U1D6CT9JU9YakwLiWj
 o47wATo9X3g1IjOlASXUkX3FQ0MeWnvTBMMdBl3VNEKavEXcVkWRltC2QWa2R98aZT
 k+tkdtwS5tW0wIwCNIky2YZ+m/Xmv6joRa+YXyVJaJPY061olfyklNznNe1Ollo18b
 Ae9GNxBrFLbxsMg4twnSO5dzzMG3p+VAHGPHuyQ0VGQzOZAs1CTGGcwyWEM/ojUu7b
 +g+pfvHcvea+wcmNmY3DRqDCvU9HI8CMj7a8oZIsn1PCBLVWwC3MZEfLLuWNbkni/z
 XwkE9y3JqJDNA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HMcA/AY/
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl2: fix sdl_init() error with
 kernel 5.15
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Michael, All,

On 2022-11-21 13:40 +0100, Michael Fischer spake thusly:
> Fixes #6421
> Backport from: da9ba3a2a1536017e4ce1ee0f4276578d1ce6e29
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>
> ---
>  package/sdl2/0001-fix-CRTC-default-mode.patch | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 package/sdl2/0001-fix-CRTC-default-mode.patch
> 
> diff --git a/package/sdl2/0001-fix-CRTC-default-mode.patch b/package/sdl2/0001-fix-CRTC-default-mode.patch
> new file mode 100644
> index 0000000000..5efc3f55c2
> --- /dev/null
> +++ b/package/sdl2/0001-fix-CRTC-default-mode.patch
> @@ -0,0 +1,66 @@
> +Patch to fix SDL_Init() error with kernel 5.15.x
> +Thanks to Sam Lantinga <slouken@libsdl.org> for his help.
> +Fix: #6421
> +
> +Backported from: da9ba3a2a1536017e4ce1ee0f4276578d1ce6e29

Since SDL2 is hosted as a git repository, we want this to be a
git-formatted patch, epecially since it is a backport.

So I fixed that; please check commit 7928c51bf6.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +Signed-off-by: Michael Fischer <mf@go-sys.de>
> +
> +
> +diff --git a/src/video/kmsdrm/SDL_kmsdrmvideo.c b/src/video/kmsdrm/SDL_kmsdrmvideo.c
> +index eae7214551a9..eeeefef2b2c1 100644
> +--- a/src/video/kmsdrm/SDL_kmsdrmvideo.c
> ++++ b/src/video/kmsdrm/SDL_kmsdrmvideo.c
> +@@ -666,8 +666,8 @@ KMSDRM_CrtcGetVrr(uint32_t drm_fd, uint32_t crtc_id)
> + /* Gets a DRM connector, builds an SDL_Display with it, and adds it to the
> +    list of SDL Displays in _this->displays[]  */
> + static void
> +-KMSDRM_AddDisplay (_THIS, drmModeConnector *connector, drmModeRes *resources) {
> +-
> ++KMSDRM_AddDisplay (_THIS, drmModeConnector *connector, drmModeRes *resources)
> ++{
> +     SDL_VideoData *viddata = ((SDL_VideoData *)_this->driverdata);
> +     SDL_DisplayData *dispdata = NULL;
> +     SDL_VideoDisplay display = {0};
> +@@ -770,14 +770,37 @@ KMSDRM_AddDisplay (_THIS, drmModeConnector *connector, drmModeRes *resources) {
> +         drmModeModeInfo *mode = &connector->modes[i];
> +
> +         if (!SDL_memcmp(mode, &crtc->mode, sizeof(crtc->mode))) {
> +-          mode_index = i;
> +-          break;
> ++            mode_index = i;
> ++            break;
> +         }
> +     }
> +
> +     if (mode_index == -1) {
> +-      ret = SDL_SetError("Failed to find index of mode attached to the CRTC.");
> +-      goto cleanup;
> ++        int current_area, largest_area = 0;
> ++
> ++        /* Find the preferred mode or the highest resolution mode */
> ++        for (i = 0; i < connector->count_modes; i++) {
> ++            drmModeModeInfo *mode = &connector->modes[i];
> ++
> ++            if (mode->type & DRM_MODE_TYPE_PREFERRED) {
> ++                mode_index = i;
> ++                break;
> ++            }
> ++
> ++            current_area = mode->hdisplay * mode->vdisplay;
> ++            if (current_area > largest_area) {
> ++                mode_index = i;
> ++                largest_area = current_area;
> ++            }
> ++        }
> ++        if (mode_index != -1) {
> ++            crtc->mode = connector->modes[mode_index];
> ++        }
> ++    }
> ++
> ++    if (mode_index == -1) {
> ++        ret = SDL_SetError("Failed to find index of mode attached to the CRTC.");
> ++        goto cleanup;
> +     }
> +
> +     /*********************************************/
> -- 
> 2.20.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
