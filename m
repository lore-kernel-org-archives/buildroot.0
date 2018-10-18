From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 18 Oct 2018 14:55:53 +0200
Subject: [Buildroot] [PATCH] python3: use stdlib UUID backend
In-Reply-To: <1539353688-32225-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1539353688-32225-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <20181018145553.35f185ab@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Oct 2018 09:14:48 -0500, Matt Weber wrote:

> diff --git a/package/python3/0031-Add-an-option-to-disable-uuid-module.patch b/package/python3/0031-Add-an-option-to-disable-uuid-module.patch
> deleted file mode 100644
> index c429c59..0000000
> --- a/package/python3/0031-Add-an-option-to-disable-uuid-module.patch
> +++ /dev/null
> @@ -1,33 +0,0 @@
> -From 1fe33c7bee9e6410f56c956ea19efd2f617176ae Mon Sep 17 00:00:00 2001
> -From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> -Date: Sat, 18 Aug 2018 10:54:56 +0200
> -Subject: [PATCH] Add an option to disable uuid module
> -
> -Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ----
> - configure.ac | 9 +++++++++
> - 1 file changed, 9 insertions(+)
> -
> -diff --git a/configure.ac b/configure.ac
> -index b022460e73..505b7c9be0 100644
> ---- a/configure.ac
> -+++ b/configure.ac
> -@@ -3258,6 +3258,15 @@ if test "$CURSES" = "no"; then
> -    DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _curses _curses_panel"
> - fi
> - 
> -+AC_SUBST(UUID)
> -+AC_ARG_ENABLE(uuid,
> -+	AS_HELP_STRING([--disable-uuid], [disable uuid]),
> -+	[ UUID="${enableval}" ], [ UUID=yes ])
> -+
> -+if test "$UUID" = "no"; then
> -+   DISABLED_EXTENSIONS="${DISABLED_EXTENSIONS} _uuid"
> -+fi
> -+
> - AC_SUBST(PYDOC)
> - 
> - AC_ARG_ENABLE(pydoc,

I am not sure it is a good idea to drop this patch. Indeed, without
this patch, Python will auto-detect the presence of util-linux (if it
gets built before), and use it. This means that we don't have the same
Python configuration depending on whether util-linux is built before
Python or not.

Keeping the patch would allow to pass an unconditional --disable-uuid.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
