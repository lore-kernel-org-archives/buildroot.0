From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 21 Jun 2014 12:06:33 +0200
Subject: [Buildroot] [PATCH 2/2] Change Makefile into a crosscompile
 friendly version
In-Reply-To: <53A4B2C2.4070107@mind.be>
References: <1403215223-10871-1-git-send-email-limpens@gmail.com>
 <1403215223-10871-2-git-send-email-limpens@gmail.com>
 <53A4B2C2.4070107@mind.be>
Message-ID: <20140621100633.GA3501@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Eric, All,

On 2014-06-21 00:16 +0200, Arnout Vandecappelle spake thusly:
>  If this patch fixes a build issue, then it should be squashed with the previous
> patch. You can do that by doing 'git rebase -i origin/master' and then replacing
> the 'pick' of this patch with 'fixup'.

Yep, Eric said on IRC he made a mistake when sending the patches.

> On 20/06/14 00:00, Eric Limpens wrote:
> > Signed-off-by: Eric Limpens <limpens@gmail.com>
> > ---
> >  ...ifmrds-000-Makefile-crosscompile-friendly.patch | 25 ++++++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >  create mode 100644 package/pifmrds/pifmrds-000-Makefile-crosscompile-friendly.patch
> > 
> > diff --git a/package/pifmrds/pifmrds-000-Makefile-crosscompile-friendly.patch b/package/pifmrds/pifmrds-000-Makefile-crosscompile-friendly.patch
> > new file mode 100644
> > index 0000000..8b8cd49
> > --- /dev/null
> > +++ b/package/pifmrds/pifmrds-000-Makefile-crosscompile-friendly.patch
> > @@ -0,0 +1,25 @@
> 
>  The patch should start with a description, like a normal commit message. This
> description should also contain your Signed-off-by tag (its meaning is different
> because it implies publication under the upstream's GPLv3 license, not under
> buildroot's GPLv2 license).
> 
>  Also, it would be good to upstream this patch.
> 
> 
> > +diff -purN PiFmRds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/Makefile pifmrds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/Makefile
> > +--- PiFmRds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/Makefile	2014-05-04 18:21:40.000000000 +0200
> > ++++ pifmrds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/Makefile	2014-06-19 21:21:14.220328601 +0200
> > +@@ -1,20 +1,8 @@
> > +-CC = gcc
> > +-STD_CFLAGS = -Wall -std=gnu99 -c -g -O3
> > +-
> > +-# Enable ARM-specific options only on ARM, and compilation of the app only on ARM
> > +-UNAME := $(shell uname -m)
> > +-
> > +-ifeq ($(UNAME), armv6l)
> > +-	CFLAGS = $(STD_CFLAGS) -march=armv6 -mtune=arm1176jzf-s -mfloat-abi=hard -mfpu=vfp -ffast-math
> > ++all:	app rds_wav
> > + 
> > + app: rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o
> > + 	$(CC) -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o -lm -lsndfile
> 
>  Actually, moving this outside the condition and adding the 'all' target is all
> that is really necessary to make cross-compilation possible. The rest maybe
> makes it nicer, but is not really necessary. It also won't be acceptable
> upstream because it makes native compilation more difficult.

I think we do not want the Makefile to override the CFLAGS. Buildroot
already pases appropriate CFLAGS, and keeping the ones above would be
only confusing, especially since it forces the float ABI and use of the
VFP.

Maybe we should however carry the -ffast-math flag, however.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
