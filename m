Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E370AC433F5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 22:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86DEF84C76;
	Wed, 26 Jan 2022 22:05:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oes41t5Tz4pY; Wed, 26 Jan 2022 22:05:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0714C84CFB;
	Wed, 26 Jan 2022 22:05:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 399AB1BF475
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 25187417D7
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:05:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FMdbgz9vDmta for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 22:05:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D886041717
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 22:05:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A6FA5240006;
 Wed, 26 Jan 2022 22:05:33 +0000 (UTC)
Date: Wed, 26 Jan 2022 23:05:32 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220126230532.43ebcc51@windsurf>
In-Reply-To: <20220124213445.2426794-1-fontaine.fabrice@gmail.com>
References: <20220124213445.2426794-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/poppler: fix introspection build
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
Cc: Olivier Schonken <olivier.schonken@gmail.com>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

+Adam for GOI expertise.

On Mon, 24 Jan 2022 22:34:45 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since commit
> 9d1d4818c39d97ad7a1cdf6e075b9acae6dfff71:
> 
> [ 98%] Generating Poppler-0.18.typelib
> Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
> error parsing file /home/giuliobenetti/autobuild/run/instance-1/output-1/build/poppler-21.12.0/glib/Poppler-0.18.gir: Failed to parse included gir GObject-2.0
> If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the .mk file should help.
> Typically like this: PKG_MAKE_ENV += GIR_EXTRA_LIBS_PATH="$(@D)/.libs"
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d2f50aa56410c2fff8a0538c57038104906e747e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...txt-allow-the-user-to-configure-INTR.patch | 43 +++++++++++++++++++
>  package/poppler/poppler.mk                    |  4 +-
>  2 files changed, 46 insertions(+), 1 deletion(-)
>  create mode 100644 package/poppler/0002-glib-CMakeLists.txt-allow-the-user-to-configure-INTR.patch
> 
> diff --git a/package/poppler/0002-glib-CMakeLists.txt-allow-the-user-to-configure-INTR.patch b/package/poppler/0002-glib-CMakeLists.txt-allow-the-user-to-configure-INTR.patch
> new file mode 100644
> index 0000000000..473966d7c9
> --- /dev/null
> +++ b/package/poppler/0002-glib-CMakeLists.txt-allow-the-user-to-configure-INTR.patch
> @@ -0,0 +1,43 @@
> +From f9e5d423b0f765f2393a95c3299a2d827b9d3fb3 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Mon, 24 Jan 2022 09:28:20 +0100
> +Subject: [PATCH] glib/CMakeLists.txt: allow the user to configure
> + INTROSPECTION_COMPILER_ARGS
> +
> +Allow the user to add its own parameters such as
> +--includedir=$(STAGING_DIR)/usr/share/gir-1.0 to
> +INTROSPECTION_COMPILER_ARGS to avoid the following build failure when
> +cross-compiling with buildroot:
> +
> +[ 98%] Generating Poppler-0.18.typelib
> +Could not find GIR file 'GObject-2.0.gir'; check XDG_DATA_DIRS or use --includedir
> +error parsing file /home/giuliobenetti/autobuild/run/instance-1/output-1/build/poppler-21.12.0/glib/Poppler-0.18.gir: Failed to parse included gir GObject-2.0
> +If the above error message is about missing .so libraries, then setting up GIR_EXTRA_LIBS_PATH in the .mk file should help.
> +Typically like this: PKG_MAKE_ENV += GIR_EXTRA_LIBS_PATH="$(@D)/.libs"
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/d2f50aa56410c2fff8a0538c57038104906e747e
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +[Upstream status:
> +https://gitlab.freedesktop.org/poppler/poppler/-/merge_requests/1049]
> +---
> + glib/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/glib/CMakeLists.txt b/glib/CMakeLists.txt
> +index 7510e69e..f5130e3c 100644
> +--- a/glib/CMakeLists.txt
> ++++ b/glib/CMakeLists.txt
> +@@ -119,7 +119,7 @@ if (HAVE_INTROSPECTION AND BUILD_SHARED_LIBS)
> +   # General gir: Reset object-list for introspection & load tool args
> +   set(INTROSPECTION_GIRS)
> +   set(INTROSPECTION_SCANNER_ARGS "--add-include-path=${CMAKE_CURRENT_SOURCE_DIR}" "--warn-all")
> +-  set(INTROSPECTION_COMPILER_ARGS "--includedir=${CMAKE_CURRENT_SOURCE_DIR}")
> ++  set(INTROSPECTION_COMPILER_ARGS ${INTROSPECTION_COMPILER_ARGS} "--includedir=${CMAKE_CURRENT_SOURCE_DIR}")

Is this the right way of doing this? I see that glib-2.0.pc file has a
"girdir" variable (which you have added in
package/libglib2/0004-meson.build-add-girdir-to-gio-2.0.pc-and-glib-2.0.pc.patch
to fix build issues in atk or libnice). So it seems like atk and
libnice are automatically able to use these pkg-config files to find
out this gir directory.

Shouldn't poppler do the same ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
