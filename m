From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 5 Mar 2012 20:56:28 +0100
Subject: [Buildroot] [git commit] package: fix WGET download method
Message-ID: <20120305201124.3FF7290D04@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3311e41dc0f36967bbadc972839269197c5e88a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In cf2486bf317e4bbf88c801fb96183ba62be78cc8, we changed from using the
-P option of wget (to set the output *directory*) to using the -O
option (to set the output *file*). Unfortunately, wget -O has a
strange behaviour: it creates an empty 0-byte file even if the
download fails (for example when there is no network connection).

The problem is that then Buildroot thinks the download was successful
and therefore goes on with extracting the tarball.

The following succession of events makes Buildroot think that the
download has been sucessful:

 * Buildroot calls the DOWNLOAD_WGET macro with the URL of the
   official site

   * It tests if the file exists in the download directory, it doesn't
     exist.

   * It calls wget. wget fails to download the file and returns an
     error code, but leaves an empty file with the correct name in the
     downloaded directory.

 * Since the previously download failed, Buildroot tries another
   download from the Buildroot mirror (sources.buildroot.net)

   * It tests if the file exists in the download directory... and it
     exists! So this second download returns with success, and
     Buildroot assumes the file has been downloaded properly.

This scenario brings us with the following result, where the download
fails, but Buildroot continues its execution and tries to extract the
tarball:

$ rm /opt/dl/glib-2.30.2.tar.bz2
rm: cannot remove `/opt/dl/glib-2.30.2.tar.bz2': No such file or directory
$ rm -rf build/host-libglib2-2.30.2/
$ make
make -C /home/thomas/projets/buildroot O=/opt/outputs/udisks/.
>>> host-libglib2 2.30.2 Downloading
--2012-03-03 12:06:25--  http://ftp.gnome.org/pub/gnome/sources/glib/2.30/glib-2.30.2.tar.bz2
Resolving ftp.gnome.org... failed: Name or service not known.
wget: unable to resolve host address `ftp.gnome.org'
>>> host-libglib2 2.30.2 Extracting
bzcat /opt/dl//glib-2.30.2.tar.bz2 | tar --strip-components=1 -C /opt/outputs/udisks/build/host-libglib2-2.30.2  -xf -
bzcat: Compressed file ends unexpectedly;
	perhaps it is corrupted?  *Possible* reason follows.
[...]
tar: This does not look like a tar archive
tar: Exiting with failure status due to previous errors
make[1]: *** [/opt/outputs/udisks/build/host-libglib2-2.30.2/.stamp_extracted] Error 2
make: *** [all] Error 2
$ ls -l /opt/dl/glib-2.30.2.tar.bz2
-rw-r--r-- 1 thomas thomas 0 Mar  3 12:12 /opt/dl/glib-2.30.2.tar.bz2

Therefore, this commit modifies DOWNLOAD_WGET so that it removes the
downloaded file if wget returns with an error.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.package.in |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index ea44c6c..59adce1 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -235,10 +235,14 @@ define SHOW_EXTERNAL_DEPS_HG
   echo $($(PKG)_SOURCE)
 endef
 
-
+# Download a file using wget. Only download the file if it doesn't
+# already exist in the download directory. If the download fails,
+# remove the file (because wget -O creates a 0-byte file even if the
+# download fails).
 define DOWNLOAD_WGET
 	test -e $(DL_DIR)/$(2) || \
-	$(WGET) -O $(DL_DIR)/$(2) $(call qstrip,$(1))/$(2)
+	$(WGET) -O $(DL_DIR)/$(2) $(call qstrip,$(1))/$(2) || \
+	(rm -f $(DL_DIR)/$(2) ; exit 1)
 endef
 
 define SOURCE_CHECK_WGET
