From: Adrian Perez de Castro <aperez@igalia.com>
Date: Mon, 18 Feb 2019 19:17:15 +0200
Subject: [Buildroot] [PATCH RFC/next 0/4] Unify configuration/makefiles for
 the GTK and WPE WebKit packages
Message-ID: <20190218171719.18721-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello!

Both the GTK and WPE WebKit ports share many dependencies (usage of GLib,
libsoup, GStreamer, Cairo, etc.), their supported platforms, and both
receive releases from the same stable branch following the same schedule:
major releases twice a year, around the release dates for GNOME.

Because of the above, it is possible to factor out commonalities from
the packaging for both the GTK and WPE WebKit ports. This patch set tries
to explore a possible way of doing it by moving both packages (plus libwpe
and wpebackend-fdo, which are specific to the WPE port) into a new
package/webkit/ subdirectory, where common parts live in a webkit.mk
and a Config.in file.

I would really like to make it easier to maintain both the webkitgtk
and wpewebkit packages by factoring out the commonalities, so I am looking
forward to read you feedback on this patch set :-)

Regards,


Adrian Perez de Castro (4):
  package/webkit: new home for GTK and WPE WebKit components
  package/webkit: unify *_ARCH_SUPPORTS{,_JIT}
  package/webkit: factor out common bits of .mk files
  package/webkit: factor out check for woff2

 package/Config.in                             |  9 ++---
 package/midori/Config.in                      |  4 +--
 package/webkit/Config.in                      | 29 +++++++++++++++
 package/{ => webkit}/libwpe/Config.in         |  0
 package/{ => webkit}/libwpe/libwpe.hash       |  0
 package/{ => webkit}/libwpe/libwpe.mk         |  0
 package/webkit/webkit.mk                      | 28 +++++++++++++++
 package/{ => webkit}/webkitgtk/Config.in      | 34 ++----------------
 package/{ => webkit}/webkitgtk/webkitgtk.hash |  0
 package/{ => webkit}/webkitgtk/webkitgtk.mk   | 18 +++-------
 package/{ => webkit}/wpebackend-fdo/Config.in |  0
 .../wpebackend-fdo/wpebackend-fdo.hash        |  0
 .../wpebackend-fdo/wpebackend-fdo.mk          |  0
 package/{ => webkit}/wpewebkit/Config.in      | 36 ++-----------------
 package/{ => webkit}/wpewebkit/wpewebkit.hash |  0
 package/{ => webkit}/wpewebkit/wpewebkit.mk   | 21 ++---------
 16 files changed, 76 insertions(+), 103 deletions(-)
 create mode 100644 package/webkit/Config.in
 rename package/{ => webkit}/libwpe/Config.in (100%)
 rename package/{ => webkit}/libwpe/libwpe.hash (100%)
 rename package/{ => webkit}/libwpe/libwpe.mk (100%)
 create mode 100644 package/webkit/webkit.mk
 rename package/{ => webkit}/webkitgtk/Config.in (71%)
 rename package/{ => webkit}/webkitgtk/webkitgtk.hash (100%)
 rename package/{ => webkit}/webkitgtk/webkitgtk.mk (85%)
 rename package/{ => webkit}/wpebackend-fdo/Config.in (100%)
 rename package/{ => webkit}/wpebackend-fdo/wpebackend-fdo.hash (100%)
 rename package/{ => webkit}/wpebackend-fdo/wpebackend-fdo.mk (100%)
 rename package/{ => webkit}/wpewebkit/Config.in (71%)
 rename package/{ => webkit}/wpewebkit/wpewebkit.hash (100%)
 rename package/{ => webkit}/wpewebkit/wpewebkit.mk (70%)

-- 
2.20.1
