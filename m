From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 17 Oct 2013 18:18:26 +0200
Subject: [Buildroot] [PATCH] rsync: use system zlib and popt,
 also do not lose debug options
In-Reply-To: <CAB++i-LMOO8owKF2V9eJdi_vX5W6LETLF-ywJ+x5bUMiGeoU+w@mail.gmail.com>
References: <1381923631-26549-1-git-send-email-denis@mingulov.com>
 <525F0956.1040406@mind.be>
 <CAB++i-LMOO8owKF2V9eJdi_vX5W6LETLF-ywJ+x5bUMiGeoU+w@mail.gmail.com>
Message-ID: <52600DD2.1000502@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/10/13 08:05, Denis Mingulov wrote:
> Hi,
>
>  > building only rsync before and after your patch, and although the
> binary becomes smaller with your patch, the overall filesystem becomes
> larger.
>
> Yes, in case of the only selected package it will be so. Due to overhead
> of shared library / not removed unused components.
> But for this particular case - you most probably have openssh (depends to
> zlib) or dropbear (depends to zlib if not 'small' version is selected
> separately) also already.
>
>  > I'd therefore propose to only use the system library if it is anyway
> selected.
>
> Sorry I am disagree, even without considering the security issue, just
> because zlib/popt for rsync are not optional libraries, they are
> mandatory, and will be compiled in any case.
> In the current buildroot .mk files such 'if' use case might be useful for
> optional components only, something like 'nice to have, will be supported
> if already present'. Otherwise there might be tens of components
> compiling its own 'zlib' version (tens different versions) - and the
> Buildroot user must somehow found FAQ or understand himself, that he must
> 'include zlib to the package manually' (zlib or tens of other libraries).
>
> Also it will be opposite to the current Buildroot configuration. In the
> latest master there are 9 packages with 'select BR2_PACKAGE_POPT'
> (cryptsetup, gptfdisk, libiscsi, librsync, logrotate, lttng-tools,
> oprofile, rpm, samba) and 50 packages with the same for zlib (of course
> not every one has its own zlib/popt).
>
> Might be, later it would be nice to have something like
> 'select_if_multiple' in Config files, to select other package if more
> than 1 component is selecting it, but it will do Configs more complex,
> and the use case is quite rare.

  Yeah, you're right.

  It was the "binary size is reduced by 25%" thing in your commit message 
that triggered me. That difference is probably irrelevant, because it 
hardly affects the overall filesystem size (rsync binary is relatively 
small).


  Regards,
  Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
