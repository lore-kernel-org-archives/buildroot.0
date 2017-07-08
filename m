From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 8 Jul 2017 22:15:07 +0200
Subject: [Buildroot] [PATCH] manual: patches are not applied for SITE_METHOD
	= local
Message-ID: <20170708201507.20746-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We had several remarks on the mailing list of users that were surprised
that patches were not applied for packages whose SITE_METHOD is local.
So document this.

Note that for OVERRIDE_SRCDIR itself it is already documented:

  When Buildroot finds that for a given package, an
  <pkg>_OVERRIDE_SRCDIR has been defined, it will no longer attempt to
  download, extract and patch the package. Instead, it will directly use
  the source code available in in the specified directory.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 docs/manual/adding-packages-generic.txt | 5 ++++-
 docs/manual/adding-packages-hooks.txt   | 1 +
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
index 12cf1605d6..63ea51bf89 100644
--- a/docs/manual/adding-packages-generic.txt
+++ b/docs/manual/adding-packages-generic.txt
@@ -315,7 +315,10 @@ information is (assuming the package name is +libfoo+) :
   ** +local+ for a local source code directory. One should use this
      when +LIBFOO_SITE+ specifies a local directory path containing
      the package source code. Buildroot copies the contents of the
-     source directory into the package's build directory.
+     source directory into the package's build directory. Note that
+     for +local+ packages, no patches are applied. If you need to
+     still patch the source code, use +LIBFOO_POST_RSYNC_HOOKS+, see
+     xref:hooks-rsync[].
 
 * +LIBFOO_GIT_SUBMODULES+ can be set to +YES+ to create an archive
   with the git submodules in the repository.  This is only available
diff --git a/docs/manual/adding-packages-hooks.txt b/docs/manual/adding-packages-hooks.txt
index d25092ac25..0ce79f8907 100644
--- a/docs/manual/adding-packages-hooks.txt
+++ b/docs/manual/adding-packages-hooks.txt
@@ -59,6 +59,7 @@ endef
 LIBFOO_POST_PATCH_HOOKS += LIBFOO_POST_PATCH_FIXUP
 ----------------------
 
+[[hooks-rsync]]
 ==== Using the +POST_RSYNC+ hook
 The +POST_RSYNC+ hook is run only for packages that use a local source,
 either through the +local+ site method or the +OVERRIDE_SRCDIR+
-- 
2.13.2
