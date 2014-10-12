From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 07:46:28 +0200
Subject: [Buildroot] [git commit] doc/asciidoc: always use UTC
Message-ID: <20141012072420.4F92BB1909@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e2cd2337d7baa5c157c0b6a76cc8fcf8ab4b6138
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the manual is rendered with the timezone of the user running
the rendering. This timezone can fluctuate, depending on the date, due
to DST (Daylight Saving Time). Currently, the manual is rendered in
either CET or CEST (Central European Time, or its DST variant.)

So, a manual rendered during the summer or the winter would refer to a
non-constant timezone. If the machine and/or user doing the rendering
also changes, there is no guarantee the timezone would still be CET/CEST.
This is not a hard issue, since the user can still deduce the time in
UTC, but is just incoherent.

Just force the timezone to be UTC when doing the rendering of the
manual, so we are not dependent on the machine or user doing the
rendering.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Reviewed-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/doc-asciidoc.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/doc-asciidoc.mk b/package/doc-asciidoc.mk
index f59f9fa..6ab5ad2 100644
--- a/package/doc-asciidoc.mk
+++ b/package/doc-asciidoc.mk
@@ -98,6 +98,8 @@ define $(2)_$(4)_INSTALL_CMDS
 endef
 endif
 
+$$(O)/docs/$(1)/$(1).$(6): export TZ=UTC
+
 ifeq ($(6)-$$(GENDOC_XSLTPROC_IS_BROKEN),pdf-y)
 $$(O)/docs/$(1)/$(1).$(6):
 	$$(warning PDF generation is disabled because of a bug in \
