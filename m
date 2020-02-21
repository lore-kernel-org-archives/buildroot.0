From: aduskett at gmail.com <aduskett@gmail.com>
Date: Fri, 21 Feb 2020 14:43:10 -0800
Subject: [Buildroot] [PATCH 0/3] package/gobject-introspection: fix meson
 support
Message-ID: <20200221224313.854089-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

This patch series addresses two remaining issues with gobject-introspection.

  1) host-goi doesn't build .typelib or .gir files. These missing files can be
     an issue when there is a host package that requires introspection, but
     they are missing.
  
  2) Meson doesn't work due to linking issues.

This patch series fixes both issues.

Patch 1 exports LD_LIBRARY_PATH when building host-gobject-introspection,
which allows GOI to link against the hosts libglib2 library.

Patch 2 explicitly exports CC in g-ir-scanner.in.

Patch 3 adds g-ir-scanner and g-ir-compiler paths to cross-compilation.conf.in

I tested this patch with a few autotools packages and with gstreamer1, and it
works quite well!

Adam Duskett (3):
  package/gobject-introspection: fix host-linking
  package/gobject-introspection: export cc in g-ir-scanner
  package/meson: add gobject-introspection tools to
    cross-compilation.conf.in

 package/gobject-introspection/g-ir-scanner.in        |  2 ++
 .../gobject-introspection/gobject-introspection.mk   | 12 +++++++-----
 package/meson/cross-compilation.conf.in              |  2 ++
 3 files changed, 11 insertions(+), 5 deletions(-)

-- 
2.24.1
