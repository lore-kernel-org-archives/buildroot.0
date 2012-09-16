From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 17 Sep 2012 00:57:45 +0200
Subject: [Buildroot] [PATCH 0/11 v3] Rework the gettext handling
Message-ID: <1347836276-24262-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This patch series is an aggregation of the gettext rework by Samuel,
Maxime, Thomas, and I.

See this post for the 6 first patches:
http://lists.busybox.net/pipermail/buildroot/2012-July/055871.html

    [PATCH 01/11] gettext: remove option to build statically
    [PATCH 02/11] gettext: remove the gettext-target make target, unused
    [PATCH 03/11] gettext: remove libintl handling
    [PATCH 04/11] Remove all references to libintl
    [PATCH 05/11] gettext: convert to autotools-package
    [PATCH 06/11] doc: update after gettext changes

The following 2 patches fix two packages in preparation for the end of the
series:

    [PATCH 07/11] package/lshw: add missing dependency on gettext
    [PATCH 08/11] package/pulseaudio: fix build-dependency on gettext

See this post for an explanation for the next 3 patches:
http://lists.busybox.net/pipermail/buildroot/2012-August/058042.html

    [PATCH 09/11] toolchain/common: rename BR2_NEEDS_GETTEXT
    [PATCH 10/11] toolchain/common: introduce blind options
                  BR2_NEEDS_GETTEXT{,_IF_LOCALE}
    [PATCH 11/11] packages: use the new gettext mechanism

The tests were done with two external uClibc-based toolchains built with
crosstool-NG, one with locale support, the other without. All packages
touched by the series were first built with both toolchains and the series
not applied (to check for any non-series related issues, see gmpc below),
then the series was fully applied, and the packages all re-built from
scratch.

gmpc failed to build, even before the series was applied, because it does
not link with -lm and thus misses some sumbols (eg. floor(3)). All other
packages were built successfully (albeit using a great deal of electrons
in the process! ;-) ). No test-run was done on my side.

Changes since v2:
  - fix conversion to autotools to always build libintl, even if locales are
    disabled, to fix packages that always require NLS
  - thus removed Arnout's Tested-by on patch 5/11, as it has changed
  - rebase on-top latest tree
  - also C: Samuel on the introductory message

Changes since v1:
  - drop the gettext-before-all patch (Arnout, Thomas)
  - keep and simplify build-dependency against gettext (Arnout)
  - add config-dependency against gettext for diffutils, flex, ndisc6
    and util-linux, in patch 11
  - rebase on-top latest tree (and upgrade new package linux-pam in the
    process)
  - update doc
  - add Tested-by and Acked-by Arnout were he said so
  - CC: Samuel Martin as a recognition for his original work on this topic,
    which this series is based on. (Arnout)

Regards,
Yann E. MORIN.
