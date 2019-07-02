From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  2 Jul 2019 22:12:50 +0200
Subject: [Buildroot] [PATCH] core/pkg-infra: really build all dependencies
 of foo with foo-depends
Message-ID: <20190702201250.31638-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, foo-depends only builds build dependencies. This means that
download and extract dependencies are not built.

First, but a minor point, this is inconsistent with foo-show-depends,
which does display all dependencies:

    $ make host-gzip-show-depends
    host-skeleton host-tar
    $ make host-gzip-depends
        # Only host-skeleton is built and installed

Second, and more important, it makes it more difficult to preapre a
debug build, like so:

    $ make foo-depends
    $ tar cf output.tar output
    $ make foo
        # bummer, broken
        # edit foo.mk to try and fix it
    $ rm -rf output; tar xf output.tar
        # rince and repeat

Change foo-depends so that it really builds all the dependencies for
foo, bringing it on-par with foo-show-depends.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b00967c648..9620dec524 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -801,7 +801,7 @@ $(1)-extract:			$$($(2)_TARGET_EXTRACT)
 $$($(2)_TARGET_EXTRACT):	$$($(2)_TARGET_SOURCE)
 $$($(2)_TARGET_EXTRACT): | $$($(2)_FINAL_EXTRACT_DEPENDENCIES)
 
-$(1)-depends:		$$($(2)_FINAL_DEPENDENCIES)
+$(1)-depends:		$$($(2)_FINAL_ALL_DEPENDENCIES)
 
 $(1)-source:		$$($(2)_TARGET_SOURCE)
 $$($(2)_TARGET_SOURCE): | $$($(2)_FINAL_DOWNLOAD_DEPENDENCIES)
-- 
2.20.1
