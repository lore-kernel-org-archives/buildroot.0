From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Mon, 20 Jan 2020 08:14:37 +0100
Subject: [Buildroot] [PATCH] package/gettext-tiny: bump version to latest
In-Reply-To: <20200119225348.29225-1-giulio.benetti@benettiengineering.com>
References: <20200119225348.29225-1-giulio.benetti@benettiengineering.com>
Message-ID: <CAEyMn7ZjxJc5n94D2p-+-XUBoUQeHyK8xRQtWLV4YMnjgNtZKw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Tested with:
utils/test-pkg -p minicom -d ~/pkg-test-m4
                             br-arm-full [1/6]: OK
                  br-arm-cortex-a9-glibc [2/6]: OK
                   br-arm-cortex-m4-full [3/6]: SKIPPED
                          br-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
6 builds, 1 skipped, 0 build failed, 0 legal-info failed

Am So., 19. Jan. 2020 um 23:53 Uhr schrieb Giulio Benetti
<giulio.benetti@benettiengineering.com>:
>
> Drop patch already upstreamed to fix install failure if path contains
> "m4/ string.
>
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Tested-by: Heiko Thiery <heiko.thiery@gmail.com>

> ---
>  ...tall-failure-if-path-contains-m4-str.patch | 31 -------------------
>  package/gettext-tiny/gettext-tiny.hash        |  2 +-
>  package/gettext-tiny/gettext-tiny.mk          |  2 +-
>  3 files changed, 2 insertions(+), 33 deletions(-)
>  delete mode 100644 package/gettext-tiny/0001-Makefile-fix-install-failure-if-path-contains-m4-str.patch
>
> diff --git a/package/gettext-tiny/0001-Makefile-fix-install-failure-if-path-contains-m4-str.patch b/package/gettext-tiny/0001-Makefile-fix-install-failure-if-path-contains-m4-str.patch
> deleted file mode 100644
> index f1c68ee1e7..0000000000
> --- a/package/gettext-tiny/0001-Makefile-fix-install-failure-if-path-contains-m4-str.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 2ad9d66d733396b655f05b477a5e91592378fb21 Mon Sep 17 00:00:00 2001
> -From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> -Date: Fri, 17 Jan 2020 18:34:42 +0100
> -Subject: [PATCH] Makefile: fix install failure if path contains "m4/" string
> -
> -Actually Makefile install recipe substitutes every occurence of "m4/" in
> -file name of the target of the rule($@), in an absolute path there could
> -more than one "m4/" occurence, so install will fail. Let's change
> -$(subst ...) with $(patsubst ...) substituting only last occurence of
> -"m4/" pattern.
> -
> -Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ----
> - Makefile | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/Makefile b/Makefile
> -index 4a3c3f6..2e13403 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -88,6 +88,6 @@ $(DESTDIR)$(datadir)/%: %
> -       $(INSTALL) -D -m 644 $< $@
> -
> - $(DESTDIR)$(acdir)/%: %
> --      $(INSTALL) -D -l ../$(subst $(datarootdir)/,,$(datadir))/$< $(subst m4/,,$@)
> -+      $(INSTALL) -D -l ../$(subst $(datarootdir)/,,$(datadir))/$< $(patsubst %m4/,%,$(dir $@))/$(notdir $@)
> -
> - .PHONY: all clean install
> ---
> -2.20.1
> -
> diff --git a/package/gettext-tiny/gettext-tiny.hash b/package/gettext-tiny/gettext-tiny.hash
> index 4de837da46..9232fe8530 100644
> --- a/package/gettext-tiny/gettext-tiny.hash
> +++ b/package/gettext-tiny/gettext-tiny.hash
> @@ -1,5 +1,5 @@
>  # Locally Computed:
> -sha256 ba7b6960018022d876e39aa723d40b6745823b2ff71dae591d05bbd1b8ec180f  gettext-tiny-73fc3e7ef7e016a3874b632fd0475969d288f309.tar.gz
> +sha256 efc740007c82a9b3a0d382fb50d212fa7dc0beddb9695409ee79684f9f2124b2  gettext-tiny-adaa9c64921e80f2b8dd3610ffb508618b9204f3.tar.gz
>  sha256 b57aa4fdc1c614c28d41c1e2d5c4090935964c5f86291ba7d1c99ffd1d698b34  LICENSE
>  sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  extra/COPYING
>  # From http://lists.gnu.org/archive/html/bug-gettext/2016-06/msg00008.html
> diff --git a/package/gettext-tiny/gettext-tiny.mk b/package/gettext-tiny/gettext-tiny.mk
> index 6ee6269e09..09a98f99b4 100644
> --- a/package/gettext-tiny/gettext-tiny.mk
> +++ b/package/gettext-tiny/gettext-tiny.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -GETTEXT_TINY_VERSION = 73fc3e7ef7e016a3874b632fd0475969d288f309
> +GETTEXT_TINY_VERSION = adaa9c64921e80f2b8dd3610ffb508618b9204f3
>  GETTEXT_TINY_SITE = $(call github,sabotage-linux,gettext-tiny,$(GETTEXT_TINY_VERSION))
>  GETTEXT_TINY_LICENSE = MIT, GPL-3.0+ (extra gettext)
>  GETTEXT_TINY_INSTALL_STAGING = YES
> --
> 2.20.1
>
