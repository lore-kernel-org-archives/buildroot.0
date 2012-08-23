From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 22 Aug 2012 23:03:42 -0400
Subject: [Buildroot] relative DL_DIR okay?
Message-ID: <CANxTyt6qz5eUv54zyJXBsg_jVZjKjc+vETz905P-L9ST45j7bQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I have a question about the DL_DIR path:  is DL_DIR required to be an
absolute path?

Background: For our projects, we have been setting DL_DIR to a relative
path, e.g.  "../../../packages".  This has worked fine for us, until I
recently tried to add a new package that uses git.  At that point, I found
that DOWNLOAD_GIT failed to create the archive, because it wants to send
the gzipped output to "$(DL_DIR)/$($(PKG)_SOURCE)".  But DL_DIR is a
relative path from buildroot/, not $(DL_DIR)/$($(PKG)_BASE_NAME), so the
output tries to go to the wrong place, and fails, because the directory
doesn't exist.

So, if DL_DIR must be an absolute path, then I think that I can fix this
problem by setting DL_DIR to "$(CURDIR)/../../../packages" in my menuconfig.

If an absolute path requirement was not intended, then I believe that this
problem can be fixed with the following mod to DOWNLOAD_GIT:

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 9e98581..e1b1bed 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -68,10 +68,10 @@ define DOWNLOAD_GIT
        test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
        (pushd $(DL_DIR) > /dev/null && \
        $(GIT) clone --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
-       pushd $($(PKG)_BASE_NAME) > /dev/null && \
+       cd $($(PKG)_BASE_NAME) && \
        $(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/
$($(PKG)_DL_VERSION) | \
-               gzip -c > $(DL_DIR)/$($(PKG)_SOURCE) && \
-       popd > /dev/null && \
+               gzip -c > ../$($(PKG)_SOURCE) && \
+       cd .. && \
        rm -rf $($(PKG)_DL_DIR) && \
        popd > /dev/null)
 endef

(The pushd/popd don't have to change to cd, but I think it emphasizes the
relationship to the "../".)

Let me know,
Danomi -
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120822/8da7543b/attachment-0001.html>
