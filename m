From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 20 Oct 2011 13:22:13 +0200
Subject: [Buildroot] [PATCH] -lsof was unable to patch Makefile.skel due
	to bad file permissions. Adding chmod solves it. (openSUSE)
In-Reply-To: <201110200046.30854.arnout@mind.be>
References: <1319057745-31257-1-git-send-email-damian@veritymedical.co.uk>
 <201110200046.30854.arnout@mind.be>
Message-ID: <201110201322.13259.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On Thursday 20 October 2011 004630 Arnout Vandecappelle wrote:
> On Wednesday 19 October 2011 22:55:45, Damian Kaczmarek wrote:
> >  # The .tar.bz2 contains another .tar, which contains the source code.
> >  define LSOF_EXTRACT_TAR
> >         $(TAR) $(TAR_STRIP_COMPONENTS)=1 -xf $(@D)/lsof_$(LSOF_VERSION)_src.tar -C $(@D)
> > +       chmod +w -R $(@D)
> >         rm -f $(@D)/lsof_$(LSOF_VERSION)_src.tar
> >  endef
> 
>  Perhaps it would be better to override the extract command directly, like:
> 
> 
> LSOF_EXTRACT_CMDS = \
>         $(INFLATE.bz2) $(DL_DIR)/$(LSOF_SOURCE) | \
> 		$(TAR) -O $(TAR_OPTIONS) - lsof_$(LSOF_VERSION)/lsof_$(LSOF_VERSION)_src.tar | \
>         $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $(LSOF_DIR) $(TAR_OPTIONS) -)

That would not work, because the first $(TAR) will extract actual files
to the disk, and does not send the extracted files to the stdio, so the
second $(TAR) will get nothing on its stdin (at best), or only get
garbage (at worst).

To extract a tar-in-a-tar, you have to extract the outermost tar, to be
able to extract the innermost one. This _has_ to be a two-step procedure.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
