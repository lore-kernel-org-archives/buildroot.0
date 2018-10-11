From: Daniel Palmer <daniel@0x0f.com>
Date: Thu, 11 Oct 2018 18:25:39 +0900
Subject: [Buildroot] meson for host package with executables doesn't work.
Message-ID: <CAFr9PXm1Y=HHy4znDBVdxpd2ndHKdu+_unfgSGHkJFotSZ9HKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

There don't seem to be any in-tree packages that use meson for host
packages so maybe this hasn't come up before but as far as I can tell
it doesn't work.
In my case I have an out of tree package that requires json-glib to be
installed for the host as well as the target so I've changed the
makefile to do that as follows:

diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index 77c0c4532374..4cd754a3a6c5 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -17,4 +17,9 @@ JSON_GLIB_DEPENDENCIES = \
       host-pkgconf \
       libglib2

+HOST_JSON_GLIB_DEPENDENCIES = \
+        host-pkgconf \
+        host-libglib2
+
$(eval $(meson-package))
+$(eval $(host-meson-package))

That was working fine a few months ago but now I get this:

***
*** ERROR: package host-json-glib installs executables without proper RPATH:
***   <snip>/buildroot-firmware/output/host/bin/json-glib-validate
***   <snip>/buildroot-firmware/output/host/bin/json-glib-format

As far as I know meson strips RPATH on install and there is no way to
stop it doing that outside of adjusting the build file.

Does anyone have any ideas about how this should be fixed?

Cheers,

Daniel
