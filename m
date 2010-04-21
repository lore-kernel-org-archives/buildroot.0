From: Luca Ceresoli <list@lucaceresoli.net>
Date: Wed, 21 Apr 2010 16:48:12 +0200
Subject: [Buildroot] ARM build fails on 64-bit host (tries linking with
	host libs?)
Message-ID: <L18EGC$C9E35AF739A1A5260C458F48F84A6DAA@aruba.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca Ceresoli wrote:
> Peter Korsgaard wrote:
> >  Luca> But my point in this ml is: why does the compilation of directfb have
> >  Luca> -L/usr/lib in its commandline?
> > 
> > That seems wrong indeed.
> 

I have solved the issue with this change to buildroot:

diff --git a/package/directfb/directfb-lib-search-path.patch b/package/directfb/
new file mode 100644
index 0000000..3f435b4
--- /dev/null
+++ b/package/directfb/directfb-lib-search-path.patch
@@ -0,0 +1,11 @@
+diff -u directfb-1.4.2-orig/ltmain.sh directfb-1.4.2/ltmain.sh
+--- directfb-1.4.2-orig/ltmain.sh      2010-04-21 14:42:01.911084805 +0200
++++ directfb-1.4.2/ltmain.sh   2010-04-21 14:43:39.388084944 +0200
+@@ -2824,7 +2824,6 @@
+             fi
+           else
+             # We cannot seem to hardcode it, guess we'll fake it.
+-            add_dir="-L$libdir"
+             # Try looking first in the location we're being installed to.
+             if test -n "$inst_prefix_dir"; then
+               case $libdir in

The origin of the patch is in
http://www.bitshrine.org/gpp_info/DirectFB-0.9.24-relink.patch.html
but that was outdated and I had to do it manually (not a big
effort indeed).

Not sure that it's a real solution or that it has no side effects,
but it worked for me.

Luca
