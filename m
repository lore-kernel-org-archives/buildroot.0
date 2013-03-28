From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 28 Mar 2013 07:52:57 +0100
Subject: [Buildroot] git sourced packages with submodules
In-Reply-To: <CAHCQUcDjKiUyFrnTotjuOEUBgCHFr2BR5w_hRJgZXTnLx5=Rmg@mail.gmail.com>
References: <CAHCQUcDjKiUyFrnTotjuOEUBgCHFr2BR5w_hRJgZXTnLx5=Rmg@mail.gmail.com>
Message-ID: <5153E8C9.2050401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/03/13 10:31, Magnus Edenhill wrote:
> Hi,
>
> I have a bunch of git sourced packages that utilise submodules.
> The submodules (and autoconf* stuff) are set up by calling a ./autogen.sh
> script (typically from .._PRE_CONFIGURE_HOOKS).

  The "buildroot way" is to:

- create separate packages rather than using submodules (as is the case 
for gstreamer, for instance);

- even better, use a release tarball and add custom patches on top of 
that; during development, you can have GSTREAMER_OVERRIDE_SRCDIR point to 
a git checkout;

- not use an autogen.sh sript, but use our own reconfigure (which will 
also fixup libtool).


  I admit that it doesn't work perfectly. In the specific case of 
gstreamer, the submodule is used to instantiate the common/ subdirectory 
which is not released as a separate tarball and which has to be present 
before you can do an autoreconf.

  But then, I think it's better to create the common/ directory in a 
post-extract hook. Something like:

define GSTREAMER_COMMON_DOWNLOAD
	$(call DOWNLOAD,$(GSTREAMER_COMMON_SITE))
endef
GSTREAMER_POST_DOWNLOAD_HOOKS += GSTREAMER_COMMON_DOWNLOAD

define GSTREAMER_COMMON_EXTRACT
	$(INFLATE.gz) $(DL_DIR)/$(GSTREAMER_COMMON_SOURCE) | \
         $(TAR) $(TAR_STRIP_COMPONENTS)=1 \
		-C $(GSTREAMER_DIR)/common $(TAR_OPTIONS) -
endef
GSTREAMER_POST_EXTRACT_HOOKS += GSTREAMER_COMMON_EXTRACT


  Alternatively, you can define a new gstreamer-common package and 
symlink to it from the gstreamer directory:

define GSTREAMER_LINK_COMMON
	ln -s -f $(GSTREAMER_COMMON_DIR) $(@D)/common
endef
GSTREAMER_POST_EXTRACT_HOOKS += GSTREAMER_LINK_COMMON


> But this unfortunately does not work since the 'git submodule *'-commands
> rely on residing in a functional git repository, but the git downloader
> (DOWNLOAD_GIT) uses 'git archive' to move the cloned repository to
> output/build/..., and 'git archive' strips the .git/ repo.
>
> The current workaround is to use ..._EXTRACT_CMDS:
>
> define GSTREAMER_EXTRACT_CMDS
> rm -rf $(@D)
> (git clone --depth 1 $(GSTREAMER_SITE) $(@D) && \
>   cd $(@D) && \
> git submodule init && \
> git submodule update)
> touch $(@D)/.stamp_downloaded
> endef
>
>
> But its a bit intrusive since 'git clone' refuses to clone into a
> non-empty directory, so the dest directory needs to be cleaned up (remove
> .stamp_downloaded) and then re-setup (create .stamp_downloaded again),
> and this relies on the package knowing buildroot internals which is less
> than optimal.
>
> A more convenient method would be if there was a ...._PRE_ARCHIVE_HOOKS
> that was run just before the 'git archive' in DOWNLOAD_GIT, that would
> let the package set up submodules and whatnot.

  The download methods are already very complex and kludgy. I wouldn't 
like adding a feature there for such a corner case.

  If some feature is added to the infrastructure, I would prefer it to be 
that you can specify additional sources to download and extract. That's 
also a non-trivial modification, but it's less intrusive I think.

> The other vcs downloaders look similar (svn export...)
>
> Regards,
> Magnus
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
