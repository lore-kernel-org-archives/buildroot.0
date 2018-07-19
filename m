From: Hollis Blanchard <hollis_blanchard@mentor.com>
Date: Wed, 18 Jul 2018 20:42:32 -0700
Subject: [Buildroot] [PATCH v2] download: fix file:// BR2_PRIMARY_SITE
 (download cache)
Message-ID: <20180719034232.20746-1-hollis_blanchard@mentor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As far as I can tell, wget is the only downloader currently usable with
BR2_PRIMARY_SITE, and that doesn't work at all for file:// URLs. The symptoms
are these:

	support/download/dl-wrapper -c '2.4.47' -d '/PATH/build/sw/source/attr' -D '/PATH/build/sw/source' -f 'attr-2.4.47.src.tar.gz' -H 'package/attr//attr.hash' -n 'attr-2.4.47' -N 'attr' -o '/PATH/build/sw/source/attr/attr-2.4.47.src.tar.gz'  -u file\|urlencode+file:///NFS/buildroot_dl_cache/attr -u file\|urlencode+file:///NFS/buildroot_dl_cache -u http+http://download.savannah.gnu.org/releases/attr -u http\|urlencode+http://sources.buildroot.net/attr -u http\|urlencode+http://sources.buildroot.net  -- 
	file:///NFS/buildroot_dl_cache/attr/attr-2.4.47.src.tar.gz: Unsupported scheme `file'.
	ERROR: attr-2.4.47.src.tar.gz has wrong sha256 hash:
	ERROR: expected: 25772f653ac5b2e3ceeb89df50e4688891e21f723c460636548971652af0a859
	ERROR: got     : e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
	ERROR: Incomplete download, or man-in-the-middle (MITM) attack

In the case of custom Linux kernel versions, this is fatal, because there isn't
necessarily a hash file to indicate that wget's empty tarball is wrong.

This seems to have been broken by commit c8ef0c03b0b, because:
1. BR2_PRIMARY_SITE always appends "urlencode" (package/pkg-download.mk)
2. Anything with the "|urlencode" suffix in $uri will end up using wget due to
   the backend case wildcarding.
3. The wget backend rejects file:/// URLs ("unsupported scheme"), and we end up
   with an empty .tar.gz file in the downloads directory.

Fix that by shell-extracting the backend name from the left of "|". I'm not
positive if all URLs will have a "|", so this code only looks for a "|" left of
the "+".

Signed-off-by: Hollis Blanchard <hollis_blanchard@mentor.com>
---
 support/download/dl-wrapper | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/support/download/dl-wrapper b/support/download/dl-wrapper
index 8d6365e08d..610dcba5a5 100755
--- a/support/download/dl-wrapper
+++ b/support/download/dl-wrapper
@@ -88,7 +88,8 @@ main() {
     download_and_check=0
     rc=1
     for uri in "${uris[@]}"; do
-        backend=${uri%%+*}
+        backend_urlencode=${uri%%+*}
+        backend=${backend_urlencode%|*}
         case "${backend}" in
             git|svn|cvs|bzr|file|scp|hg) ;;
             *) backend="wget" ;;
-- 
2.13.0
