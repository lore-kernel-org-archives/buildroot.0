From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Nov 2015 15:19:44 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/zmqpp: fix static build
 issues
In-Reply-To: <1448317402-10464-1-git-send-email-joerg.krause@embedded.rocks>
References: <1448317402-10464-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20151129151944.5d4e1627@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Mon, 23 Nov 2015 23:23:21 +0100, J?rg Krause wrote:

> diff --git a/package/zmqpp/0002-Allow-building-shared-or-static-library-only.patch b/package/zmqpp/0002-Allow-building-shared-or-static-library-only.patch
> new file mode 100644
> index 0000000..5dc2d86
> --- /dev/null
> +++ b/package/zmqpp/0002-Allow-building-shared-or-static-library-only.patch
> @@ -0,0 +1,81 @@
> +From 4c83dd96d1f92627ecdb6b6ed80b8c278aea82f7 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
> +Date: Fri, 20 Nov 2015 19:51:50 +0100
> +Subject: [PATCH 2/3] Allow building shared or static library only

You should generate your patches with git format-patch -N, so that we
don't get something like "PATCH 2/3" but just "PATCH". Those numbers
very often get wrong as other developers add more patches, or remove
some patches when bumping version.


> +ifeq ($(BR2_STATIC_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
> +TARGET_CONFIGURE_OPTS += BUILD_STATIC=yes

This is truly horrible. By changing TARGET_CONFIGURE_OPTS, you are
changing things for *ALL* packages in Buildroot!

Generally speaking a package should never ever create or modify a
variable that isn't prefixed with the package name. So I've changed
those lines to use ZMQPP_MAKE_OPTS instead.

Also, I've adjust the condition to make things smaller:

if static
...
else if static-shared
...
else if shared
...
endif

It ends up taking less line and is generally the way we handle this
choice.

Committed to master with those issues fixed. Thanks!

When you have time, please send an updated to use the latest version
with CMake, so that we can hopefully get rid of those patches.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
