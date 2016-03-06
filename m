From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 6 Mar 2016 23:10:56 +0100
Subject: [Buildroot] [PATCH v6 1/3] yp-tools: new package
In-Reply-To: <1453832900-25757-2-git-send-email-yba@tkos.co.il>
References: <1453832900-25757-1-git-send-email-yba@tkos.co.il>
 <1453832900-25757-2-git-send-email-yba@tkos.co.il>
Message-ID: <20160306231056.6c8e9c9c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Jonathan Ben-Avraham,

On Tue, 26 Jan 2016 20:28:18 +0200, Jonathan Ben-Avraham wrote:
> Adds the yp-tools package that provides various NIS (yp) utilities.
> 
> Signed-off-by: Jonathan Ben-Avraham <yba@tkos.co.il>
> ---
>  package/Config.in              |  1 +
>  package/yp-tools/Config.in     | 15 +++++++++
>  package/yp-tools/mapv4v6addr.h | 69 ++++++++++++++++++++++++++++++++++++++++++

This mapv4v6addr.h thing always annoyed me. But luckily, yp-tools 4.1
has been released, and removes the need for this file completely.

Unfortunately, yp-tools 4.1 doesn't build, I've filled an issue
upstream:

  https://github.com/thkukuk/yp-tools/issues/2

Could you follow-up with this and submit an updated patch when yp-tools
4.1 has been fixed ?

> +# The github release tags are one to two releases ahead of the "Download"
> +# links on http://www.linux-nis.org/nis/yp-tools/
> +YP_TOOLS_VERSION = yp-tools-3_5
> +YP_TOOLS_SITE = $(call github,thkukuk,yp-tools,$(YP_TOOLS_VERSION))
> +YP_TOOLS_LICENSE = GPLv2
> +YP_TOOLS_LICENSE_FILES = COPYING
> +YP_TOOLS_AUTORECONF = YES
> +YP_TOOLS_DEPENDENCIES = host-pkgconf host-gettext
> +YP_TOOLS_PRE_CONFIGURE_HOOKS += YP_TOOLS_LOCAL_MAPV4V6ADDR_H

You should also add an optional dependency on libtirpc, since yp-tools
can optionally use it. And in fact, since you select rpcbind, libtirpc
will always be part of the build, but you don't have any guarantees on
whether it will be built before or after yp-tools. So this optional
dependency should be made explicit.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
