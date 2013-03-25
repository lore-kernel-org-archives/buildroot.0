From: Magnus Edenhill <magnus@edenhill.se>
Date: Mon, 25 Mar 2013 10:31:29 +0100
Subject: [Buildroot] git sourced packages with submodules
Message-ID: <CAHCQUcDjKiUyFrnTotjuOEUBgCHFr2BR5w_hRJgZXTnLx5=Rmg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I have a bunch of git sourced packages that utilise submodules.
The submodules (and autoconf* stuff) are set up by calling a ./autogen.sh
script (typically from .._PRE_CONFIGURE_HOOKS).
But this unfortunately does not work since the 'git submodule *'-commands
rely on residing in a functional git repository, but the git downloader
(DOWNLOAD_GIT) uses 'git archive' to move the cloned repository to
output/build/..., and 'git archive' strips the .git/ repo.

The current workaround is to use ..._EXTRACT_CMDS:

define GSTREAMER_EXTRACT_CMDS
rm -rf $(@D)
(git clone --depth 1 $(GSTREAMER_SITE) $(@D) && \
  cd $(@D) && \
git submodule init && \
git submodule update)
 touch $(@D)/.stamp_downloaded
endef


But its a bit intrusive since 'git clone' refuses to clone into a non-empty
directory, so the dest directory needs to be cleaned up (remove
.stamp_downloaded) and then re-setup (create .stamp_downloaded again), and
this relies on the package knowing buildroot internals which is less than
optimal.

A more convenient method would be if there was a ...._PRE_ARCHIVE_HOOKS
that was run just before the 'git archive' in DOWNLOAD_GIT, that would let
the package set up submodules and whatnot.

The other vcs downloaders look similar (svn export...)

Regards,
Magnus
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130325/35fcaa11/attachment.html>
