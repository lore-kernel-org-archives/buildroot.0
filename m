From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
Date: Thu, 30 Jan 2020 09:47:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/pkg-meson: use pkgconf to find host
 libraries.
Message-ID: <20200130084734.20100-1-nicolas.cavallari@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

meson makes a distinction between 'native' (i.e. host) dependencies
and 'host' (i.e. target) dependencies and can use a different pkg-config
binary for each case.

Currently, pkg-meson only pass the target pkg-config and meson
automatically guesses the host pkg-config by searching PATH, which finds
host/bin/pkg-config, which is the target pkg-config wrapper script.

As a result, meson uses the target pkg-config to find host dependencies,
with possibly incorrect results.

This patch causes meson to use host/bin/pkgconf directly to find host
dependencies, using the apparently recommended method[1] of
specifing the PKG_CONFIG environment variable.  pkgconf does not know
about the target sysroot, so only finds host dependencies.

[1] https://github.com/mesonbuild/meson/issues/1849

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
--

This meson.build snippet:

----------------------------
host_glib = dependency('glib-2.0', native: true, method: 'pkg-config')
gdbus_codegen = find_program(host_glib.get_pkgconfig_variable('bindir')
                             + '/gdbus-codegen')
----------------------------

Without the patch, it uses the target .pc file with a prefix of /usr,
and finds /usr/bin/gdbus-codegen from the host :

Found pkg-config: $OUTPUT/host/bin/pkg-config (1.6.1)
Build-time dependency glib-2.0 found: YES 2.62.4
Program /usr/bin/gdbus-codegen found: YES (/usr/bin/gdbus-codegen)

For a complete dummy example, use this dummy package:

base64 -d << EOF | tar -xJv
/Td6WFoAAATm1rRGAgAhARwAAAAQz1jM4Cf/AsJdADgYSJnNF3UkZpejSZiTToh3TmWwjd6v7C8E
PXLCFsW1o1RD4pKzYIacUzj5A1VS6TvDBN4+ynQO837jjfHvz6kgAyGryHKoSq7OI71xqrwiX/4W
E6a5fnuXGGuPAScuqHa/u88SKGfAOmh1xE5guv5qZcgyhDIB5H5nIQwzyb1trdobmRqUMFT1rT5T
sON0C/SB59IEbKITx5ItzheQu7D5erkFYrjhcBV1xNCh0J7uwF5XXF9qVHhlvQyp5AJFF9lSUJB2
eTX5ORhCpcGvO/AAhnnlf4DU8C9a7CFVfTfhP+sgs5T7aC1ymojylvBL5TmkAKCna5hN6Ckzr9qH
jKYDXAhwJTuMPZkgSFS8OVXkgKnxDS5vG9Ssg0ueb3G7tIEhxt2ehjMgDPK5N/blHnE1t/ZjXe2Q
g/TV83LE/MpUKiTQO7JwZ5+tWmT2WWgxK6fG8ckuhlwXhZmVkjWCw+1uxs0C8FrfZFH1ms5MhEyS
6Zgi0803KfOamnH/k6PtEPVB5G7BCWf/b+6Wfo/ZvPSgSYrpcDMJs5j+3KkUjnfpgCuXYXE5TSmE
DcrINQHDLYq3hHWklV0n7bFwS3loEWcti/OKQkjeu/3c4E5c/+IWyJFTeLoKEbrNIPtLOYAvsRf+
FJHYzqQyEWoqgAejX6K/XWclKrFAePkjKTouj10ppv9WENd+KCnK7JErZp2zqKwJeGZcOlHsFJ9C
dUTWFgOU3VzsWiYMnxuPHnvYt3uXr6XlFQHA818kZdcJIMvfUPLRNhrBwR893vTd5aw6/tb4EPeR
HacNklguWar6H9w69r8KY2yqk9cepySCDkomVGFqmi5gPH9anFGfEKEUJhKNdjMqF44jx76odAOZ
ijoW+F9h6qHVQFGSLhxchqcMWgA+0aBVz9My+PoRzIsXEmH+21W9ucie9zPCw3QWVVPxgAAAAACQ
pqAPsaqrpAAB3gWAUAAAeb5korHEZ/sCAAAAAARZWg==
EOF

I tested that the following packages still compile:
- libglib2
- gst1-plugins-bad
- gst1-plugins-base
- gst1-plugins-good
- gst1-plugins-ugly
- gstreamer1
- libdrm
- mesa3d
---
 package/pkg-meson.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index e7eea2aa58..349da39369 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -84,7 +84,8 @@ define $(2)_CONFIGURE_CMDS
 	    ) \
 	    package/meson/cross-compilation.conf.in \
 	    > $$($$(PKG)_SRCDIR)/build/cross-compilation.conf
-	PATH=$$(BR_PATH) $$($$(PKG)_CONF_ENV) $$(MESON) \
+	PATH=$$(BR_PATH) PKG_CONFIG=$(HOST_DIR)/bin/pkgconf \
+	$$($$(PKG)_CONF_ENV) $$(MESON) \
 		--prefix=/usr \
 		--libdir=lib \
 		--default-library=$(if $(BR2_STATIC_LIBS),static,shared) \
-- 
2.25.0
