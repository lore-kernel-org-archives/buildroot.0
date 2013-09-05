From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  5 Sep 2013 23:27:47 +0200
Subject: [Buildroot] [RFCv1 09/11] package: add a <pkg>_SOURCE_ADDONS
	variable
In-Reply-To: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378416469-17708-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1378416469-17708-10-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Converting the external toolchain logic into a package raises a very
special use case that wasn't handled by the package infrastructure:
the Blackfin toolchain is delivered as two tarballs instead of
one. Unfortunately <pkg>_SOURCE only allows to pass one tarball name.

However, we really want both tarballs to be known by the package
infrastructure, so that the normal 'source' and 'external-deps'
mechanism work fine.

In order to achieve this, we add a <pkg>_SOURCE_ADDONS variable, which
allows a package to list other stuff it would like to see downloaded,
but that are otherwise not used by the package infrastructure itself:
it is up to the package to do it by itself.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-generic.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b6f0bdd..2ce615f 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -40,6 +40,7 @@ ifeq ($(DL_MODE),DOWNLOAD)
 	fi
 endif
 	$(if $($(PKG)_SOURCE),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$($(PKG)_SOURCE)))
+	$(foreach p,$($(PKG)_SOURCE_ADDONS),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))$(sep))
 	$(foreach p,$($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE:/=)/$(p))$(sep))
 	$(foreach hook,$($(PKG)_POST_DOWNLOAD_HOOKS),$(call $(hook))$(sep))
 ifeq ($(DL_MODE),DOWNLOAD)
-- 
1.8.1.2
