From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Feb 2017 22:29:22 +0100
Subject: [Buildroot] [PATCH 1/2] package/directfb: hack .pc file for static
	link
In-Reply-To: <cover.1487885342.git.yann.morin.1998@free.fr>
References: <cover.1487885342.git.yann.morin.1998@free.fr>
Message-ID: <c0fb315bbbf9623ec32fe0e140b1ceef709d7cd1.1487885342.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

DirectFB is written in C++, but can be linked to by a C library or
program.

When doing shared link, this is fine because the linker gets help from
the DT_NEEDED flags and nows what libraries to pull in during the link.

However, during a static link, the linker does not get such help. So
pkg-config was invented to compensate for that deficiency, whereby a
library would define its dependencies in a .pc file.

Alas, the .pc file for DirectFB does not define that it requires
libstdc++, for the good reason that there is provision in pkg-config to
properly cover this case. See this thread:
    https://lists.freedesktop.org/archives/pkg-config/2016-August/001053.html

So, we hack our way around this issue by appending -lstdc++ to the
Libs.Private field in directfb.pc. This is but a hack; as per the thread
above, this is perfectly acceptable given the conditions...

Step 1 at fixing:
    http://autobuild.buildroot.org/results/3d3/3d3036d40ddad71d872d910aae7a24975706d2e9/
    http://autobuild.buildroot.org/results/d1c/d1c35a6003396942b584f2f2a5e8bf4ac2fbe370/
    http://autobuild.buildroot.org/results/d45/d4504871bd47930e8363032d380cdfcc5bb8aee7/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/directfb/directfb.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 595d590..47cbf4e 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -166,6 +166,12 @@ HOST_DIRECTFB_BUILD_CMDS = \
 HOST_DIRECTFB_INSTALL_CMDS = \
 	$(INSTALL) -m 0755 $(@D)/tools/directfb-csource $(HOST_DIR)/usr/bin
 
+define DIRECTFB_FIX_PC
+	$(SED) 's/^\(Libs.private:.*\)$$/\1 -lstdc++/' \
+		$(STAGING_DIR)/usr/lib/pkgconfig/direct.pc
+endef
+DIRECTFB_POST_INSTALL_STAGING_HOOKS += DIRECTFB_FIX_PC
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
 
-- 
2.7.4
