From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Dec 2015 23:38:11 +0100
Subject: [Buildroot] [git commit] libass: allow compilation without a system
	font provider
Message-ID: <20151216223815.AB4EB822D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=196104ea2b257602829adfc7c968c38cb24bf2dc
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If no system font provider is provided, then libass will fail to build
because it requires one by default. The error looks like this:

    configure: error: Either DirectWrite (on Windows), CoreText (on OSX),
    or Fontconfig(Linux, other) is required. If you really want to compile
    withouta system font provider, add --disable-require-system-font-provider

(typo is from the actual message)

But, as the error messages says, we can allow the compilation without a
system font provider if we use the above configure option, so let's do
it.

Fixes:
    http://autobuild.buildroot.net/results/3a4/3a4c07a0a54d5497fa8a4be2191856e286729637/
    http://autobuild.buildroot.org/results/d5a/d5a93b5a870de748259b097ec0b98b207cfaa303/
    and many others...

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
[yann.morin.1998 at free.fr: move the --disable option in the !fontconfig
 case]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libass/libass.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index 83939e2..2f0ca08 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -28,7 +28,7 @@ ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 LIBASS_DEPENDENCIES += fontconfig
 LIBASS_CONF_OPTS += --enable-fontconfig
 else
-LIBASS_CONF_OPTS += --disable-fontconfig
+LIBASS_CONF_OPTS += --disable-fontconfig --disable-require-system-font-provider
 endif
 
 ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
