From: Maxime Petazzoni <maxime.petazzoni@bulix.org>
Date: Tue, 13 Jul 2010 09:15:00 +0200
Subject: [Buildroot] [PATCH/RFC] Git/Svn downloaders
Message-ID: <1279005304-8780-1-git-send-email-maxime.petazzoni@bulix.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

As Thomas mentioned a few days ago in "Makefile.package.in: allow
packages to override download step", here's the "other approach being
developed" for supporting non-wget downloads in Buildroot.

The approach used in the patch series is somewhat different from Luca's,
and it offers a few additional features as well.

Both Git and Subversion repositories are supported, and it is easily
extendible to other VCS (Bazaar for example, which came up in the
discussions on the list). When a package needs its source taken from a
VCS -- like tremor and libsvgtiny from Subversion --, one simply needs
to add to its .mk file the following variables:

  ..._SITE_METHOD = svn
  ..._VERSION = 42

For Subversion, the SITE_METHOD is 'svn' and the VERSION is the revision
you want to checkout (it can be HEAD, which is useful when checking out
a Subversion tag/branch).

For Git, the SITE_METHOD is 'git' and the VERSION can be a commit ID, a
branch name, a tag name... whatever can be checked out by 'git
checkout'. For example for Busybox:

  BUSYBOX_SITE_METHOD = git
  BUSYBOX_VERSION = remotes/origin/1_14_stable

The package's version is automatically sanitized by replacing all '/' by
'_' since it is used in file names, paths, etc.

If the SITE_METHOD is not specified, the download helper falls back to
the default WGET download.

Where this approach differs significantly from Luca's is that we don't
bypass the .stamp_extracted target, meaning we download from the VCS
with the goal of creating a source archive from what was checked out.
The archive is named $($(PKG)_SOURCE) so further attempts at
building/downloading the package will simply use this archive and the
download process does not hijack the output directory which would be
troublesome to re-implement the spider/source-check feature.

This also means that the "multi-site" download (primary site, package
site, backup site) is not altered, and that archives for packages
usually downloaded from VCS can be easily created and placed on the
Buildroot backup site, with the direct benefit that if the package's
repository is unavailable, the package can still be downloaded and
built.

On the patch series itself: the first patch removes the spider feature
since it only worked with wget downloads. I'm looking at re-implementing
this, which is rather easy for all packages using the GENTARGETS
infrastructure (and the fact that we create and keep tarballs even for
VCS downloads makes it even easier, and allows for example the creation
of the Buildroot backup site in just one command). But for packages that
don't use GENTARGETS it's a bit more problematic so I need a little more
time to come up with an elegant solution there.

The second patch implements the Git and Svn download helpers, with the
corresponding needed changes to GENTARGETS. This is where the fun
begins.

The third and fourth patches fix the tremor and libsvgtiny, which both
download from Subversion, to make them use the normal infrastructure
again as it now supports Svn download. This is where the fun *happens*!

Thanks for your review and feedback!
- Maxime
