From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  4 Apr 2015 10:25:29 -0300
Subject: [Buildroot] [PATCH 0/3] The big webkitgtk bump
Message-ID: <1428153932-15069-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the first vesion of the bump.

There's support for libgtk2 & libgtk3, though libgtk2 is always needed
for the plugin system.

GL* support was only tested via mesa software renderer.

Wayland support wasn't enabled because it still needs gtk2 (plugins) -
this could possibly be patched away.

Multimedia support is automatic via detection of gst1-plugins-good,
ideally this should be an option but right now opencv+gst generate a
dependency loop if gstreamer1 is selected. Also codecs will need to be
catered by the user via the appropiate gst selects.

MIPS support was disabled pending libatomic support for
__sync_fetch_and_add_8 which is handled there for some 32-bit
architectures.

Possible TODOs:
Wayland in a proper way, granite support, gcr support, more arch
testing/support.

v1:

* Bump webkitgtk to version 2.4.x in a versioned package.
  This is because midori can't use 2.6.x or 2.8.x and this way we can
  have another webkitgtk package in parallel for other uses.
  The series is still security-supported upstream.

* Bump midori to version 0.5.9.
  No effort was made to enable support for the old webkit 1.x. series,
  it may be possible to do so but it makes no sense.

* Deprecate old webkit package.
  Security bugs, build issues, general instability.

Gustavo Zacarias (3):
  webkitgtk24: new package
  midori: bump to version 0.5.9
  webkit: mark as deprecated

 package/Config.in                             |  1 +
 package/midori/0001-disable-libnotify.patch   | 43 ++++++++++++
 package/midori/Config.in                      | 39 +++++++----
 package/midori/midori.hash                    |  2 +
 package/midori/midori.mk                      | 57 ++++++++--------
 package/webkit/Config.in                      |  3 +
 package/webkitgtk24/0001-fix-bug-137640.patch | 17 +++++
 package/webkitgtk24/Config.in                 | 56 ++++++++++++++++
 package/webkitgtk24/webkitgtk24.hash          |  2 +
 package/webkitgtk24/webkitgtk24.mk            | 97 +++++++++++++++++++++++++++
 10 files changed, 278 insertions(+), 39 deletions(-)
 create mode 100644 package/midori/0001-disable-libnotify.patch
 create mode 100644 package/midori/midori.hash
 create mode 100644 package/webkitgtk24/0001-fix-bug-137640.patch
 create mode 100644 package/webkitgtk24/Config.in
 create mode 100644 package/webkitgtk24/webkitgtk24.hash
 create mode 100644 package/webkitgtk24/webkitgtk24.mk

-- 
2.0.5
