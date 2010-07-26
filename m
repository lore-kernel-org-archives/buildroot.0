From: Quotient Remainder <quotientvremainder@gmail.com>
Date: Mon, 26 Jul 2010 18:14:14 +0100
Subject: [Buildroot] [PATCH 4/6] Implement basic non-wget download
 methods
In-Reply-To: <1279625588-26570-5-git-send-email-maxime.petazzoni@bulix.org>
References: <1279625588-26570-1-git-send-email-maxime.petazzoni@bulix.org>
	<1279625588-26570-5-git-send-email-maxime.petazzoni@bulix.org>
Message-ID: <1280164454.22687.6.camel@dubciaranr1.verifone.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ar M?irt, 2010-07-20 ag 13:33 +0200, scr?obh Maxime Petazzoni:
> Packages can now be sourced from Git and Subversion repositories. The
> download method will be autodetected from the URI (git://, svn://, etc).
> If the repository is accessed through http(s), you can force the
> download method by setting a _SITE_METHOD variable to either 'git' or
> 'svn', respectively and without the quotes.
> 
> The package's _VERSION variable defines which commit, revision, tag or
> branch should be checked out. For Git, it can be HEAD, a commit ID, a
> tag name or branch name (anything that can be checked out with `git
> checkout`). For Subversion, it must be a revision number, or HEAD.
> ...

Maxime, if I'm reading this right, the package source archive gets
created in the downloaded directory $($(PKG)_DL_DIR) instead of
$(DL_DIR) and so gets removed as soon as it's created by the "rm
-rf ...".
The following patch to your patch may be needed.

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index fc76156..5444472 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -79,7 +79,7 @@ define DOWNLOAD_GIT
        $(GIT) clone $($(PKG)_SITE) $($(PKG)_BASE_NAME) && \
        pushd $($(PKG)_BASE_NAME) > /dev/null && \
        $(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ $($(PKG)_DL_VERSION) | \
-               gzip -c > $($(PKG)_SOURCE) && \
+               gzip -c > $(DL_DIR)/$($(PKG)_SOURCE) && \
        popd > /dev/null && \
        rm -rf $($(PKG)_DL_DIR) && \
        popd > /dev/null
