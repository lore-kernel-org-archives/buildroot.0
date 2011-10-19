From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Oct 2011 00:46:30 +0200
Subject: [Buildroot] [PATCH] -lsof was unable to patch Makefile.skel due
	to bad file permissions. Adding chmod solves it. (openSUSE)
In-Reply-To: <1319057745-31257-1-git-send-email-damian@veritymedical.co.uk>
References: <1319057745-31257-1-git-send-email-damian@veritymedical.co.uk>
Message-ID: <201110200046.30854.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Wednesday 19 October 2011 22:55:45, Damian Kaczmarek wrote:
>  # The .tar.bz2 contains another .tar, which contains the source code.
>  define LSOF_EXTRACT_TAR
>         $(TAR) $(TAR_STRIP_COMPONENTS)=1 -xf $(@D)/lsof_$(LSOF_VERSION)_src.tar -C $(@D)
> +       chmod +w -R $(@D)
>         rm -f $(@D)/lsof_$(LSOF_VERSION)_src.tar
>  endef

 Perhaps it would be better to override the extract command directly, like:


LSOF_EXTRACT_CMDS = \
        $(INFLATE.bz2) $(DL_DIR)/$(LSOF_SOURCE) | \
		$(TAR) -O $(TAR_OPTIONS) - lsof_$(LSOF_VERSION)/lsof_$(LSOF_VERSION)_src.tar | \
        $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LSOF_DIR) $(TAR_OPTIONS) -)

 (completely untested, of course)


 Regards,
 Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
