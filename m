From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 30 Jun 2010 10:44:08 +0200
Subject: [Buildroot] Getting package sources from git/svn/bzr
Message-ID: <L4TK9K$D17BBF1C51BFC0643CBBFAC2EB922E1E@aruba.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm trying to understand how a buildroot generic (or autotools-based)
package can download sources from a git repository instead of just
grabbing a tarball.

In an old post Peter wrote:
> See the tremor handling in package/multimedia/libvorbis/libvorbis.mk
> for an example. You could argue about the usefullness of creating a
> dated tarball of the checkout or not.
(http://lists.busybox.net/pipermail/buildroot/2009-August/028932.html)

The odd thing is that tremor does *not* checkout anything: it just
downloads a tarball which presumably contains the snapshot (see log below).
I didn't find any other supposedly-working example in the current tree.

So I'd renew the question: is git/svn/bzr repository download actually
working? I spent a little time in trying, but after a few dirty hacks I
couldn't produce anything really working.

Am I missing something obvious?

I suspect it is not currently possible, and a clean way to do it would
require some changes in package/Makefile.package.in, making the download
step overridable by the package, such as:

@@ -118,19 +118,19 @@
 # Retrieve the archive
 $(BUILD_DIR)/%/.stamp_downloaded:
 # support make source-check/external-deps
 ifeq ($(SPIDER),)
 # Only show the download message if it isn't already downloaded
 	$(Q)(test -e $(DL_DIR)/$($(PKG)_SOURCE) && \
 		(test -z $($(PKG)_PATCH) || test -e $(DL_DIR)$($(PKG)_PATCH))) || \
 		$(call MESSAGE,"Downloading")
 endif
-	$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_SOURCE))
+	$($(PKG)_DOWNLOAD_CMDS)
 	$(if $($(PKG)_PATCH),$(call DOWNLOAD,$($(PKG)_SITE),$($(PKG)_PATCH)))

where of course $(PKG)_DOWNLOAD_CMDS would default to $(call DOWNLOAD,...).

Of course a more complete approach would be to have a DOWNLOAD function
that actually understands git/svn/bzr, but this may be less interesting
until there are only very few packages using such a feature in mainline
buildroot.

Is my view correct?

Thanks,
Luca


Tremor download log follows.

-------------------------------8<-------------------------------

>>> tremor 16259 Downloading
--2010-06-30 10:03:47--  http://garr.dl.sourceforge.net/sourceforge/tremor/Tremor-svn-r16259.tar.bz2
Connecting to 172.20.0.254:8080... connected.
Proxy request sent, awaiting response... 302 Found
Location: http://downloads.sourceforge.net/sourceforge/tremor/Tremor-svn-r16259.tar.bz2?download&failedmirror=garr.dl.sourceforge.net [following]
--2010-06-30 10:03:48--  http://downloads.sourceforge.net/sourceforge/tremor/Tremor-svn-r16259.tar.bz2?download&failedmirror=garr.dl.sourceforge.net
Connecting to 172.20.0.254:8080... connected.
Proxy request sent, awaiting response... 404 Not Found
2010-06-30 10:03:48 ERROR 404: Not Found.

--2010-06-30 10:03:48--  http://buildroot.net/downloads/sources//Tremor-svn-r16259.tar.bz2
Connecting to 172.20.0.254:8080... connected.
Proxy request sent, awaiting response... 301 Moved Permanently
Location: http://sources.buildroot.net//Tremor-svn-r16259.tar.bz2 [following]
--2010-06-30 10:03:50--  http://sources.buildroot.net//Tremor-svn-r16259.tar.bz2
Connecting to 172.20.0.254:8080... connected.
Proxy request sent, awaiting response... 200 OK
Length: 209977 (205K) [application/x-bzip2]
Saving to: `/home/murray/src/Tremor-svn-r16259.tar.bz2'

     0K .......... .......... .......... .......... .......... 24% 4.29M 0s
    50K .......... .......... .......... .......... .......... 48% 25.2M 0s
   100K .......... .......... .......... .......... .......... 73% 11.1M 0s
   150K .......... .......... .......... .......... .......... 97% 11.1M 0s
   200K .....                                                 100% 8.39M=0.02s

2010-06-30 10:03:52 (8.82 MB/s) - `/home/murray/src/Tremor-svn-r16259.tar.bz2' saved [209977/209977]

>>> tremor 16259 Extracting

-------------------------------8<-------------------------------
