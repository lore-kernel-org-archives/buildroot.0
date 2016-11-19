From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Sat, 19 Nov 2016 14:59:54 +0100
Subject: [Buildroot] [PATCH v2 04/15] fs/tar: make results reproducible
In-Reply-To: <b19d2886-5502-d2e2-5acc-040e921ebf39@mind.be>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-5-git-send-email-jezz@sysmic.org>
 <b19d2886-5502-d2e2-5acc-040e921ebf39@mind.be>
Message-ID: <3312066.pnY3ae4NBr@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Saturday 19 November 2016 10:12:24 Arnout Vandecappelle wrote:
> On 18-11-16 10:10, J?r?me Pouiller wrote:
> > In order to make tar images reproducible, we use --sort flag. However,
> > this flags is available only from tar 1.28. So we also bump necessary
> > host-tar version.
> > 
> > This work was sponsored by `BA Robotic Systems'.
> > 
> > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> > ---
> >  fs/tar/tar.mk                          | 2 +-
> >  support/dependencies/check-host-tar.sh | 5 ++---
> >  2 files changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/fs/tar/tar.mk b/fs/tar/tar.mk
> > index 11c69c5..5a1b263 100644
> > --- a/fs/tar/tar.mk
> > +++ b/fs/tar/tar.mk
> > @@ -7,7 +7,7 @@
> >  TAR_OPTS := $(call qstrip,$(BR2_TARGET_ROOTFS_TAR_OPTIONS))
> >  
> >  define ROOTFS_TAR_CMD
> > -	tar $(TAR_OPTS) -cf $@ --numeric-owner -C $(TARGET_DIR) .
> > +	tar $(TAR_OPTS) -cf $@ --sort=name --numeric-owner -C $(TARGET_DIR) .
> 
>  Instead of requiring a specific version of tar, I would prefer to use the same
> solution we already have in the git wrapper, and which is also what is proposed
> by reproducible-builds.org:
> 
> find src -print0 | LC_ALL=C sort -z |
>     tar --null -T - --no-recursion -cf $@ --numeric-owner -C $(TARGET_DIR)
> 
>  The find | sort part we probably want to factor into the rootfs infra, because
> the same thing will have to be done for all other rootfs types as well. But that
> refactoring can be done later (when the other rootfs types are tackled).

It makes sense. I will do that.


-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
