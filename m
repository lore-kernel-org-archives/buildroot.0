From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 02 Jul 2014 23:46:08 +0200
Subject: [Buildroot] [PATCH 01/12] pkg-infra: move the git download
	helper to a script
In-Reply-To: <73772dd5b41b1da81ce523981cdcf2189a7a33ba.1404335385.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 2 Jul 2014 23:11:19 +0200")
References: <cover.1404335385.git.yann.morin.1998@free.fr>
 <73772dd5b41b1da81ce523981cdcf2189a7a33ba.1404335385.git.yann.morin.1998@free.fr>
Message-ID: <8738ejbfj3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The git download helper is getting a bit more complex. Fixing it in the
 > Makefile when it breaks (like the recent breakage with a non-existing
 > sha1-cset) proves to be challenging, to say the least.

 > Move it into a shell script in support/download/git, which will make
 > it much easier to read, maintain, fix and enhance in the future.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Peter Korsgaard <jacmet@uclibc.org>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Reviewed-by: Samuel Martin <s.martin49@gmail.com>
 > Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 > ---
 > Changes v9 -> v10:
 >   - use bash as shell  (Peter)
 > ---
 >  package/pkg-download.mk | 17 +++--------------
 >  support/download/git    | 37 +++++++++++++++++++++++++++++++++++++
 >  2 files changed, 40 insertions(+), 14 deletions(-)
 >  create mode 100755 support/download/git

 > diff --git a/package/pkg-download.mk b/package/pkg-download.mk
 > index e07fd1b..c848f6a 100644
 > --- a/package/pkg-download.mk
 > +++ b/package/pkg-download.mk
 > @@ -12,7 +12,7 @@ WGET := $(call qstrip,$(BR2_WGET)) $(QUIET)
 >  SVN := $(call qstrip,$(BR2_SVN))
 >  CVS := $(call qstrip,$(BR2_CVS))
 >  BZR := $(call qstrip,$(BR2_BZR))
 > -GIT := $(call qstrip,$(BR2_GIT))
 > +export GIT := $(call qstrip,$(BR2_GIT))
 >  HG := $(call qstrip,$(BR2_HG)) $(QUIET)
 >  SCP := $(call qstrip,$(BR2_SCP)) $(QUIET)
 >  SSH := $(call qstrip,$(BR2_SSH)) $(QUIET)
 > @@ -84,19 +84,8 @@ github = https://github.com/$(1)/$(2)/archive/$(3)
 >  # problems
 >  define DOWNLOAD_GIT
 >  	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
 > -	(pushd $(DL_DIR) > /dev/null && \
 > -	 ((test "`git ls-remote $($(PKG)_SITE) $($(PKG)_DL_VERSION)`" && \
 > -	   echo "Doing shallow clone" && \
 > -	   $(GIT) clone --depth 1 -b $($(PKG)_DL_VERSION) --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME)) || \
 > -	  (echo "Doing full clone" && \
 > -	   $(GIT) clone --bare $($(PKG)_SITE) $($(PKG)_BASE_NAME))) && \
 > -	pushd $($(PKG)_BASE_NAME) > /dev/null && \
 > -	$(GIT) archive --format=tar --prefix=$($(PKG)_BASE_NAME)/ -o $(DL_DIR)/.$($(PKG)_SOURCE).tmp $($(PKG)_DL_VERSION) && \
 > -	gzip -c $(DL_DIR)/.$($(PKG)_SOURCE).tmp > $(DL_DIR)/$($(PKG)_SOURCE) && \
 > -	rm -f $(DL_DIR)/.$($(PKG)_SOURCE).tmp && \
 > -	popd > /dev/null && \
 > -	rm -rf $($(PKG)_DL_DIR) && \
 > -	popd > /dev/null)

[snip]

 > +pushd "${repodir}"
 > +${GIT} archive --prefix="${basename}/" -o "${output}.tmp" --format=tar "${cset}"
 > +gzip -c "${output}.tmp" >"${output}"
 > +rm -f "${output}.tmp"
 > +popd

Purely cosmetical, but the pushd / popd calls are mising >/dev/null, so
it is quite verbose:

make libuci-source
>>> libuci ed938cc8e423d4a33b8f31e6e6d1eb0805ae3d10 Downloading
Doing full clone
Cloning into bare repository '/var/lib/downloads/libuci-ed938cc8e423d4a33b8f31e6e6d1eb0805ae3d10'...
remote: Counting objects: 1826, done.
remote: Compressing objects: 100% (619/619), done.
remote: Total 1826 (delta 1205), reused 1798 (delta 1188)
Receiving objects: 100% (1826/1826), 302.48 KiB | 0 bytes/s, done.
Resolving deltas: 100% (1205/1205), done.
Checking connectivity... done.
/var/lib/downloads/libuci-ed938cc8e423d4a33b8f31e6e6d1eb0805ae3d10 ~/source/buildroot
~/source/buildroot

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
