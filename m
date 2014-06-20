From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 21 Jun 2014 00:16:34 +0200
Subject: [Buildroot] [PATCH 2/2] Change Makefile into a crosscompile
 friendly version
In-Reply-To: <1403215223-10871-2-git-send-email-limpens@gmail.com>
References: <1403215223-10871-1-git-send-email-limpens@gmail.com>
 <1403215223-10871-2-git-send-email-limpens@gmail.com>
Message-ID: <53A4B2C2.4070107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Eric,

 If this patch fixes a build issue, then it should be squashed with the previous
patch. You can do that by doing 'git rebase -i origin/master' and then replacing
the 'pick' of this patch with 'fixup'.

On 20/06/14 00:00, Eric Limpens wrote:
> Signed-off-by: Eric Limpens <limpens@gmail.com>
> ---
>  ...ifmrds-000-Makefile-crosscompile-friendly.patch | 25 ++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>  create mode 100644 package/pifmrds/pifmrds-000-Makefile-crosscompile-friendly.patch
> 
> diff --git a/package/pifmrds/pifmrds-000-Makefile-crosscompile-friendly.patch b/package/pifmrds/pifmrds-000-Makefile-crosscompile-friendly.patch
> new file mode 100644
> index 0000000..8b8cd49
> --- /dev/null
> +++ b/package/pifmrds/pifmrds-000-Makefile-crosscompile-friendly.patch
> @@ -0,0 +1,25 @@

 The patch should start with a description, like a normal commit message. This
description should also contain your Signed-off-by tag (its meaning is different
because it implies publication under the upstream's GPLv3 license, not under
buildroot's GPLv2 license).

 Also, it would be good to upstream this patch.


> +diff -purN PiFmRds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/Makefile pifmrds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/Makefile
> +--- PiFmRds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/Makefile	2014-05-04 18:21:40.000000000 +0200
> ++++ pifmrds-c67306ea9b8d827f45e0d90279d367e97119bcb1/src/Makefile	2014-06-19 21:21:14.220328601 +0200
> +@@ -1,20 +1,8 @@
> +-CC = gcc
> +-STD_CFLAGS = -Wall -std=gnu99 -c -g -O3
> +-
> +-# Enable ARM-specific options only on ARM, and compilation of the app only on ARM
> +-UNAME := $(shell uname -m)
> +-
> +-ifeq ($(UNAME), armv6l)
> +-	CFLAGS = $(STD_CFLAGS) -march=armv6 -mtune=arm1176jzf-s -mfloat-abi=hard -mfpu=vfp -ffast-math
> ++all:	app rds_wav
> + 
> + app: rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o
> + 	$(CC) -o pi_fm_rds rds.o waveforms.o pi_fm_rds.o fm_mpx.o control_pipe.o -lm -lsndfile

 Actually, moving this outside the condition and adding the 'all' target is all
that is really necessary to make cross-compilation possible. The rest maybe
makes it nicer, but is not really necessary. It also won't be acceptable
upstream because it makes native compilation more difficult.


 Regards,
 Arnout

> + 
> +-else
> +-	CFLAGS = $(STD_CFLAGS)
> +-endif
> +-
> +-
> + rds_wav: rds.o waveforms.o rds_wav.o fm_mpx.o
> + 	$(CC) -o rds_wav rds_wav.o rds.o waveforms.o fm_mpx.o -lm -lsndfile
> + 
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
