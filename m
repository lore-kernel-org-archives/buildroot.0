From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 21 Aug 2014 15:19:47 +0200
Subject: [Buildroot] [git commit] imagemagick: Disable OpenMP
Message-ID: <20140821132010.C40DD9D4BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9579e6aac33aa828aa5a447727440be7b85efb03
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default (i.e. without adding libgomp.so* to
BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS), if an external toolchain with libgomp
support is used, then libgomp is installed to staging/ , but not to target/ .
Consequently, with such a toolchain, imagemagick's configure detected libgomp as
supported and enabled its usage for the build stage, but then it failed to run
on the target because libgomp was missing. This is the bug #7322.

Disable OpenMP for imagemagick as a temporary workaround, until a better long
term solution is agreed on and implemented.

Signed-off-by: Beno??t Th??baudeau <benoit.thebaudeau.dev@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/imagemagick/imagemagick.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
index 386da4f..aac0b5d 100644
--- a/package/imagemagick/imagemagick.mk
+++ b/package/imagemagick/imagemagick.mk
@@ -29,6 +29,7 @@ IMAGEMAGICK_CONF_ENV = ac_cv_sys_file_offset_bits=32
 endif
 
 IMAGEMAGICK_CONF_OPT = --program-transform-name='s,,,' \
+		--disable-openmp \
 		--without-perl \
 		--without-wmf \
 		--without-openexr \
