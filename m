Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB941C433EF
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 20:16:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A19E4040C;
	Mon,  4 Apr 2022 20:16:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id feOd2It1WESA; Mon,  4 Apr 2022 20:16:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4C2D240204;
	Mon,  4 Apr 2022 20:16:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECEB61BF232
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EACAF826C1
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:16:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cu10J8qWyIum for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 20:16:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63B6B82690
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 20:16:19 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id r13so22345710ejd.5
 for <buildroot@buildroot.org>; Mon, 04 Apr 2022 13:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=/Iuv+K+ptwNlHNdlUQslrprGyObgKlAMiVE7As+hhuY=;
 b=AWzj/owiX/zou1sDFsFnOH46fCH9K6rn43KBOOCTtQfzk0LVsXTETi59onVKbRKNKp
 p35bWDQfESOxE3xCMG1PTv6i5keVlSJTdWBQwGlC3BV2BFUlvnftDNIItD16fF0BUbiO
 +i/RGUk8GbwEUz6YcBPvZstzfeXUPkfOlnpkp2v99ovX4toxs1E58ewECBDFU+ngPByO
 YqPNV+nun3n2/56MKU1GPgGyx99BdkxvTX4Jn/Rg1Hj3SmG7WIwsLAMflqvHgMeAZfyZ
 YPQnY6YTLFCt69DjfuNQWvqaHvvT6CYhjZLmyRMkgBN6hlV6rKQmk55RSnuw7WvorI2x
 /VAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=/Iuv+K+ptwNlHNdlUQslrprGyObgKlAMiVE7As+hhuY=;
 b=dLWRTD6DStfB9/16hwXmpjwi2kRqLRHteaySsHCurZaROO8H/zKmTnJSSGnCYCu1nz
 aRC+se1ZPCkrqYDA0IkmRwjVIkchBaDGS7O3LgrKjcR7cw492l3LX+WXwyRRy9Uksz9m
 FcCd3TiUUGhunpajneEWo+E552fZr2FgpplBiRjz97GmnsbzOgI8oK6dVUAuJ4KP/4Hs
 /p5V6VTX4aR6EKMNsWxD+XbdWVbzKt8FJv6TvmJWmUniUoAM1RgpefT9HrEZNUBPxzp7
 upHhc0D9L+H7fY5DMnqxG3TWgIErY8OoB11rz2WvjxY4h3Th553FTz2K93Lsfwe5gl4U
 0Nvw==
X-Gm-Message-State: AOAM531AcxgSqDKhmMpX5TGG6lVsUoW/ZYTIYIbNLHFT8SJMFROgeRaO
 o2puglEbfJbRl7kOZcTn+7NoOw==
X-Google-Smtp-Source: ABdhPJxrUuiETeVEp/aH1xdXtUEXh3HofIITA2CwmDCeVfRk1sClvDu253ulTRDksH3bSEHaSSxQWQ==
X-Received: by 2002:a17:907:97d4:b0:6e7:e45a:ad48 with SMTP id
 js20-20020a17090797d400b006e7e45aad48mr1813801ejc.23.1649103377481; 
 Mon, 04 Apr 2022 13:16:17 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 hs12-20020a1709073e8c00b006dfd7dee980sm4723922ejc.30.2022.04.04.13.16.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 13:16:17 -0700 (PDT)
Message-ID: <e9fbf051-f026-d06c-f73c-7b4af2eaf72a@mind.be>
Date: Mon, 4 Apr 2022 22:16:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Peter Seiderer <ps.report@gmx.net>, buildroot@buildroot.org
References: <20220404071229.18768-1-ps.report@gmx.net>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220404071229.18768-1-ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH v1] package/util-linux: bump version to 2.38
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 04/04/2022 09:12, Peter Seiderer wrote:
> - remove 0001-libuuid-include-c-h-to-cover-restrict-keyword.patch
>    (from upstream [3])
> 
> - remove 0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch
>    (from upstream [4])
> 
> - handle new lsfd option
> - handle new ipcmk option
> 
> For details see [1] and [2].
> 
> [1] https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.38/v2.38-ChangeLog
> [2] https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.38/v2.38-ReleaseNotes
> [3] https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=5f9b88f43ba7f98f81bde3538d5f4e5cd1a6c01c
> [4] https://github.com/util-linux/util-linux/commit/84d38ae3eca523ef990cb848563cc63de25266e6
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

  Applied to master, thanks.

  Regards,
  Arnout

> ---
>   ...nclude-c-h-to-cover-restrict-keyword.patch |  30 ----
>   ...cache-as-probed-if-sys-not-available.patch | 141 ------------------
>   package/util-linux/Config.in                  |  12 ++
>   ...nclude-c-h-to-cover-restrict-keyword.patch |   1 -
>   ...cache-as-probed-if-sys-not-available.patch |   1 -
>   package/util-linux/util-linux.hash            |   4 +-
>   package/util-linux/util-linux.mk              |   8 +-
>   7 files changed, 20 insertions(+), 177 deletions(-)
>   delete mode 100644 package/util-linux/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch
>   delete mode 100644 package/util-linux/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch
>   delete mode 120000 package/util-linux/util-linux-libs/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch
>   delete mode 120000 package/util-linux/util-linux-libs/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch
> 
> diff --git a/package/util-linux/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch b/package/util-linux/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch
> deleted file mode 100644
> index 3b4f510920..0000000000
> --- a/package/util-linux/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -From 5f9b88f43ba7f98f81bde3538d5f4e5cd1a6c01c Mon Sep 17 00:00:00 2001
> -From: Karel Zak <kzak@redhat.com>
> -Date: Thu, 5 Aug 2021 09:46:21 +0200
> -Subject: libuuid: include c.h to cover restrict keyword
> -
> -References: https://github.com/karelzak/util-linux/issues/1405
> -Signed-off-by: Karel Zak <kzak@redhat.com>
> -
> -[Retrieved from:
> -https://git.kernel.org/pub/scm/utils/util-linux/util-linux.git/commit/?id=5f9b88f43ba7f98f81bde3538d5f4e5cd1a6c01c]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - libuuid/src/unparse.c | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/libuuid/src/unparse.c b/libuuid/src/unparse.c
> -index f9a5e4315..ffeed2ed6 100644
> ---- a/libuuid/src/unparse.c
> -+++ b/libuuid/src/unparse.c
> -@@ -33,6 +33,7 @@
> -  */
> -
> - #include <stdio.h>
> -+#include "c.h"
> -
> - #include "uuidP.h"
> -
> ---
> -cgit 1.2.3-1.el7
> -
> diff --git a/package/util-linux/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch b/package/util-linux/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch
> deleted file mode 100644
> index bfc8f60834..0000000000
> --- a/package/util-linux/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch
> +++ /dev/null
> @@ -1,141 +0,0 @@
> -From 84d38ae3eca523ef990cb848563cc63de25266e6 Mon Sep 17 00:00:00 2001
> -From: Karel Zak <kzak@redhat.com>
> -Date: Fri, 19 Nov 2021 14:19:03 +0100
> -Subject: [PATCH] libblkid: don't mark cache as "probed" if /sys not available
> -
> -For "mount --all" we need to read the cache more than once in a short
> -time. The library checks the delay between probes, and if the delay is
> -too short, it does not read devices. This is a problem on boot when there
> -are no /sys, and the cache is empty. In this case, we need to check
> -for /sys until it's available constantly.
> -
> -https://github.com/util-linux/util-linux/issues/1492
> -Signed-off-by: Karel Zak <kzak@redhat.com>
> -
> -[Retrieved from:
> -https://github.com/util-linux/util-linux/commit/84d38ae3eca523ef990cb848563cc63de25266e6]
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ----
> - libblkid/src/devname.c | 26 +++++++++++++++++---------
> - libblkid/src/resolve.c |  2 +-
> - libblkid/src/tag.c     |  8 +++++---
> - 3 files changed, 23 insertions(+), 13 deletions(-)
> -
> -diff --git a/libblkid/src/devname.c b/libblkid/src/devname.c
> -index 90a8245fc9..9a173e3489 100644
> ---- a/libblkid/src/devname.c
> -+++ b/libblkid/src/devname.c
> -@@ -429,6 +429,8 @@ sysfs_probe_all(blkid_cache cache, int only_if_new, int only_removable)
> - 	if (!sysfs)
> - 		return -BLKID_ERR_SYSFS;
> -
> -+	DBG(DEVNAME, ul_debug(" probe /sys/block"));
> -+
> - 	/* scan /sys/block */
> - 	while ((dev = xreaddir(sysfs))) {
> - 		DIR *dir = NULL;
> -@@ -533,14 +535,18 @@ sysfs_probe_all(blkid_cache cache, int only_if_new, int only_removable)
> - /*
> -  * Read the device data for all available block devices in the system.
> -  */
> --static int probe_all(blkid_cache cache, int only_if_new)
> -+static int probe_all(blkid_cache cache, int only_if_new, int update_interval)
> - {
> -+	int rc;
> -+
> - 	if (!cache)
> - 		return -BLKID_ERR_PARAM;
> -
> - 	if (cache->bic_flags & BLKID_BIC_FL_PROBED &&
> --	    time(NULL) - cache->bic_time < BLKID_PROBE_INTERVAL)
> -+	    time(NULL) - cache->bic_time < BLKID_PROBE_INTERVAL) {
> -+		DBG(PROBE, ul_debug("don't re-probe [delay < %d]", BLKID_PROBE_INTERVAL));
> - 		return 0;
> -+	}
> -
> - 	blkid_read_cache(cache);
> - #ifdef VG_DIR
> -@@ -548,7 +554,13 @@ static int probe_all(blkid_cache cache, int only_if_new)
> - #endif
> - 	ubi_probe_all(cache, only_if_new);
> -
> --	sysfs_probe_all(cache, only_if_new, 0);
> -+	rc = sysfs_probe_all(cache, only_if_new, 0);
> -+
> -+	/* Don't mark the change as "probed" if /sys not avalable */
> -+	if (update_interval && rc == 0) {
> -+		cache->bic_time = time(NULL);
> -+		cache->bic_flags |= BLKID_BIC_FL_PROBED;
> -+	}
> -
> - 	blkid_flush_cache(cache);
> - 	return 0;
> -@@ -567,11 +579,7 @@ int blkid_probe_all(blkid_cache cache)
> - 	int ret;
> -
> - 	DBG(PROBE, ul_debug("Begin blkid_probe_all()"));
> --	ret = probe_all(cache, 0);
> --	if (ret == 0) {
> --		cache->bic_time = time(NULL);
> --		cache->bic_flags |= BLKID_BIC_FL_PROBED;
> --	}
> -+	ret = probe_all(cache, 0, 1);
> - 	DBG(PROBE, ul_debug("End blkid_probe_all() [rc=%d]", ret));
> - 	return ret;
> - }
> -@@ -589,7 +597,7 @@ int blkid_probe_all_new(blkid_cache cache)
> - 	int ret;
> -
> - 	DBG(PROBE, ul_debug("Begin blkid_probe_all_new()"));
> --	ret = probe_all(cache, 1);
> -+	ret = probe_all(cache, 1, 0);
> - 	DBG(PROBE, ul_debug("End blkid_probe_all_new() [rc=%d]", ret));
> - 	return ret;
> - }
> -diff --git a/libblkid/src/resolve.c b/libblkid/src/resolve.c
> -index 641b022860..16653fa8e1 100644
> ---- a/libblkid/src/resolve.c
> -+++ b/libblkid/src/resolve.c
> -@@ -32,7 +32,7 @@ char *blkid_get_tag_value(blkid_cache cache, const char *tagname,
> - 	blkid_cache c = cache;
> - 	char *ret = NULL;
> -
> --	DBG(TAG, ul_debug("looking for %s on %s", tagname, devname));
> -+	DBG(TAG, ul_debug("looking for tag %s on %s device", tagname, devname));
> -
> - 	if (!devname)
> - 		return NULL;
> -diff --git a/libblkid/src/tag.c b/libblkid/src/tag.c
> -index 390a648648..178336505f 100644
> ---- a/libblkid/src/tag.c
> -+++ b/libblkid/src/tag.c
> -@@ -326,14 +326,14 @@ blkid_dev blkid_find_dev_with_tag(blkid_cache cache,
> - 	blkid_dev	dev;
> - 	int		pri;
> - 	struct list_head *p;
> --	int		probe_new = 0;
> -+	int		probe_new = 0, probe_all = 0;
> -
> - 	if (!cache || !type || !value)
> - 		return NULL;
> -
> - 	blkid_read_cache(cache);
> -
> --	DBG(TAG, ul_debug("looking for %s=%s in cache", type, value));
> -+	DBG(TAG, ul_debug("looking for tag %s=%s in cache", type, value));
> -
> - try_again:
> - 	pri = -1;
> -@@ -366,9 +366,11 @@ blkid_dev blkid_find_dev_with_tag(blkid_cache cache,
> - 		goto try_again;
> - 	}
> -
> --	if (!dev && !(cache->bic_flags & BLKID_BIC_FL_PROBED)) {
> -+	if (!dev && !probe_all
> -+	    && !(cache->bic_flags & BLKID_BIC_FL_PROBED)) {
> - 		if (blkid_probe_all(cache) < 0)
> - 			return NULL;
> -+		probe_all++;
> - 		goto try_again;
> - 	}
> - 	return dev;
> diff --git a/package/util-linux/Config.in b/package/util-linux/Config.in
> index 9e9b8933e5..d3c0070160 100644
> --- a/package/util-linux/Config.in
> +++ b/package/util-linux/Config.in
> @@ -146,6 +146,11 @@ config BR2_PACKAGE_UTIL_LINUX_HWCLOCK
>   	help
>   	  Query or set the hardware clock (RTC)
>   
> +config BR2_PACKAGE_UTIL_LINUX_IPCMK
> +	bool "ipcmk"
> +	help
> +	  Make various IPC resources
> +
>   config BR2_PACKAGE_UTIL_LINUX_IPCRM
>   	bool "ipcrm"
>   	help
> @@ -198,6 +203,13 @@ config BR2_PACKAGE_UTIL_LINUX_LOSETUP
>   	help
>   	  Set up and control loop devices
>   
> +config BR2_PACKAGE_UTIL_LINUX_LSFD
> +	bool "lsfd"
> +	depends on BR2_USE_MMU # libsmartcols
> +	select BR2_PACKAGE_UTIL_LINUX_LIBSMARTCOLS
> +	help
> +	  List file descriptors (modern replacement for lsof)
> +
>   config BR2_PACKAGE_UTIL_LINUX_LSLOGINS
>   	bool "lslogins"
>   	depends on BR2_USE_MMU # libsmartcols
> diff --git a/package/util-linux/util-linux-libs/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch b/package/util-linux/util-linux-libs/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch
> deleted file mode 120000
> index beecc3a48f..0000000000
> --- a/package/util-linux/util-linux-libs/0001-libuuid-include-c-h-to-cover-restrict-keyword.patch
> +++ /dev/null
> @@ -1 +0,0 @@
> -../0001-libuuid-include-c-h-to-cover-restrict-keyword.patch
> \ No newline at end of file
> diff --git a/package/util-linux/util-linux-libs/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch b/package/util-linux/util-linux-libs/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch
> deleted file mode 120000
> index 2f3c482144..0000000000
> --- a/package/util-linux/util-linux-libs/0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch
> +++ /dev/null
> @@ -1 +0,0 @@
> -../0002-libblkid-don-t-mark-cache-as-probed-if-sys-not-available.patch
> \ No newline at end of file
> diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
> index 748a36e0be..6f1bb74ecb 100644
> --- a/package/util-linux/util-linux.hash
> +++ b/package/util-linux/util-linux.hash
> @@ -1,5 +1,5 @@
> -# From https://www.kernel.org/pub/linux/utils/util-linux/v2.37/sha256sums.asc
> -sha256  634e6916ad913366c3536b6468e7844769549b99a7b2bf80314de78ab5655b83  util-linux-2.37.4.tar.xz
> +# From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.38/sha256sums.asc
> +sha256  6d111cbe4d55b336db2f1fbeffbc65b89908704c01136371d32aa9bec373eb64  util-linux-2.38.tar.xz
>   # License files, locally calculated
>   sha256  869660b5269f4f40a8a679da7f403ea3a6e71d46087aab5e14871b09bcb55955  README.licensing
>   sha256  9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3-Clause
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index 891c17d1d9..9d9b61d8f5 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -7,8 +7,8 @@
>   # When making changes to this file, please check if
>   # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
>   
> -UTIL_LINUX_VERSION_MAJOR = 2.37
> -UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).4
> +UTIL_LINUX_VERSION_MAJOR = 2.38
> +UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR)
>   UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
>   UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
>   
> @@ -140,6 +140,7 @@ UTIL_LINUX_CONF_OPTS += \
>   	$(if $(BR2_PACKAGE_UTIL_LINUX_FSCK),--enable-fsck,--disable-fsck) \
>   	$(if $(BR2_PACKAGE_UTIL_LINUX_HARDLINK),--enable-hardlink,--disable-hardlink) \
>   	$(if $(BR2_PACKAGE_UTIL_LINUX_HWCLOCK),--enable-hwclock --disable-hwclock-gplv3,--disable-hwclock) \
> +	$(if $(BR2_PACKAGE_UTIL_LINUX_IPCMK),--enable-ipcmk,--disable-ipcmk) \
>   	$(if $(BR2_PACKAGE_UTIL_LINUX_IPCRM),--enable-ipcrm,--disable-ipcrm) \
>   	$(if $(BR2_PACKAGE_UTIL_LINUX_IPCS),--enable-ipcs,--disable-ipcs) \
>   	$(if $(BR2_PACKAGE_UTIL_LINUX_KILL),--enable-kill,--disable-kill) \
> @@ -153,6 +154,7 @@ UTIL_LINUX_CONF_OPTS += \
>   	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGGER),--enable-logger,--disable-logger) \
>   	$(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN),--enable-login,--disable-login) \
>   	$(if $(BR2_PACKAGE_UTIL_LINUX_LOSETUP),--enable-losetup,--disable-losetup) \
> +	$(if $(BR2_PACKAGE_UTIL_LINUX_LSFD),--enable-lsfd,--disable-lsfd) \
>   	$(if $(BR2_PACKAGE_UTIL_LINUX_LSLOGINS),--enable-lslogins,--disable-lslogins) \
>   	$(if $(BR2_PACKAGE_UTIL_LINUX_LSMEM),--enable-lsmem,--disable-lsmem) \
>   	$(if $(BR2_PACKAGE_UTIL_LINUX_MESG),--enable-mesg,--disable-mesg) \
> @@ -214,7 +216,9 @@ HOST_UTIL_LINUX_CONF_OPTS += \
>   	--disable-agetty \
>   	--disable-chfn-chsh \
>   	--disable-chmem \
> +	--disable-ipcmk \
>   	--disable-login \
> +	--disable-lsfd \
>   	--disable-lslogins \
>   	--disable-mesg \
>   	--disable-more \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
