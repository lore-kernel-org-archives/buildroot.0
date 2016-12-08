From: James Knight <james.knight@rockwellcollins.com>
Date: Wed,  7 Dec 2016 19:28:52 -0500
Subject: [Buildroot] [RFC 1/1] rpm: omit additional advanced tools
Message-ID: <20161208002852.14260-1-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adjusts RPM's configuration to explicitly disable DWARF library
support. This indirectly disables the attempt to build any additional
advanced tools (debugedit, elfdeps, sepdebugcrcfix). The use of these
tools, specifically sepdebugcrcfix, require the use of binutils.
Requiring binutils would restrict this package from building on AArch64
and Nios II. Opting to remove the optional utilities.

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
This change is being introduced to address the series of autobuild
issues experienced when introducing the RPM v4.13.0 series [1]. The
majority of these builds fail due to the lack of binutils requirement
when the dwarf library is reachable:

    tools/sepdebugcrcfix.c:31:17: fatal error: bfd.h: No such file or directory
    #include <bfd.h>

Unfortunately, for my own build environments (Fedora-based), the dwarf
library is never detected and my attempts to reproduce these autobuild
have eluded me:

    http://autobuild.buildroot.net/results/4e0/4e0b98e152d3b016d0e88da1ccbef2845fc3d327
    http://autobuild.buildroot.net/results/a74/a742b9c96e9a53b8bcf2c00e213cb7978ee11496
    http://autobuild.buildroot.net/results/b23/b23110e01829582c03e5795f22c024431acf9fe3
    http://autobuild.buildroot.net/results/23a/23abd8ec7f055125327203fccc1f177c6824cb08
    http://autobuild.buildroot.net/results/09f/09f420ecb6c6a53aba6832977dcb0c5a59bca42d
    http://autobuild.buildroot.net/results/47a/47aab284da117497b21dd394773de8792d542bad
    http://autobuild.buildroot.net/results/365/36526040b5d97077d0455d76a25a6e54308889de
    http://autobuild.buildroot.net/results/23a/23abd8ec7f055125327203fccc1f177c6824cb08

This is the main reason why I've tagged this patch as RFC. While this
solution should resolve these autobuild issues, I do not have the
correct test environment up to validate. It very well could be I'm
using `br-reproduce-build` incorrectly. At the same time, I didn't want
hold back a possible fix while build servers kept failing on the rpm
package. If anyone is willing to assist myself in preparing an
environment where these issues occur so I can validate, I'm more then
happy for the feedback; else wise, I have no problem if someone is able
to verify this patch resolves their own issues.

[1]: http://autobuild.buildroot.net/?reason=rpm-4.13.0
[2]: https://buildroot.org/downloads/manual/manual.html#_analyzing_and_fixing_autobuild_failures
---
 package/rpm/rpm.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index accb625..023e7da 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -71,8 +71,14 @@ ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
 RPM_CONF_OPTS += --disable-nls
 endif
 
+# ac_cv_header_dwarf_h: Indirectly disables a series of additional tools
+#                        (debugedit, elfdeps, sepdebugcrcfix) that are not
+#                        required and would need additional libraries which
+#                        would restrict the RPM package to binutils-supported
+#                        environments.
 # ac_cv_prog_cc_c99: RPM uses non-standard GCC extensions (ex. `asm`).
 RPM_CONF_ENV = \
+	ac_cv_header_dwarf_h=no \
 	ac_cv_prog_cc_c99='-std=gnu99' \
 	CFLAGS="$(TARGET_CFLAGS) $(RPM_CFLAGS)"
 
-- 
2.8.4.windows.1
