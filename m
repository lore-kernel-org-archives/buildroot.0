From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Mon, 17 Apr 2017 10:20:24 -0400
Subject: [Buildroot] [PATCH v8 1/2] genimage.sh: fix calling from
 BR2_ROOTFS_POST_IMAGE_SCRIPT
In-Reply-To: <CA+V_ovuOD_kqkdvrLaKwkVVTCS9NN+8m7SOpRmT-8vg30O_eQQ@mail.gmail.com>
References: <20170416174048.4737-1-abhimanyu.v@gmail.com>
 <20170416212937.64yzqpdbbivp3qep@gportay>
 <CA+V_ovuOD_kqkdvrLaKwkVVTCS9NN+8m7SOpRmT-8vg30O_eQQ@mail.gmail.com>
Message-ID: <20170417142020.3gx4zqnvlv7cbmiv@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Abhimanyu,

On Mon, Apr 17, 2017 at 03:38:27PM +0530, abhimanyu.v at gmail.com wrote:
> Thankyou Ga?l for review!
> 
> [...]
> >
> > Indeed, the problem comes from the first argument given to any post-image
> > scripts [1] (which is the binary directory).
> >
> > A more simple fix consists in adding the shift instruction before right
> > before
> > the while getopts.
> >
> > +       shift
> >         while getopts c: OPT ; do
> >                 case "${OPT}" in
> >                 c) GENIMAGE_CFG="${OPTARG}";;
> >                 :) die "option '${OPTARG}' expects a mandatory
> > argument\n";;
> >                 \?) die "unknown option '${OPTARG}'\n";;
> >         esac
> >         done
> >
> >
> Yes you are right, this is simple fix. What i had in mind was to make the
> script independent of any positional argument. With proposed solution if in
> future we add extra argument to POST_SCRIPTS then this script can cope with
> it. Please let me know your thought. I will prepare patch accordingly.
> 
> <snip>
> 

Afterward, my suggestion about shift does not suit me.

If genimage.sh is run inside a post-image script, this same script have to give
a fake parameter as first argument.

	#!/bin/sh
	#
	# BR post-image script
	#
	# (...)

	support/scripts/genimage.sh "$1" -c path/to/genimage.cfg

Initially, genimage.sh script was NOT intend to be run either as or inside a
post-image. It was a Makefile target [1]. [2] and [3] are use cases.

Maybe, a cleaner solution consists in updating the Makefile to remove this first
argument given to both post-build and post-image scripts. But it breaks the
existing.

Thomas, Arnout, do you have a better idea?

I had a quick look to scripts in-tree; they do not seem to use this parameter.

Instead, they access directly to $TARGET_DIR or $BINARIES_DIR values using the
environment variables.

For extra arguments, they use $2, $3; they need to be updated.

> > Furthermore, I see an error in traces. To display the traces properly, the
> > optstring required to start with a colon (:), and the trailling \n is not
> > required.
> >
> >         while getopts :c: OPT ; do
> >
> >
> Thanks, I will fix it.
> 
> 
> > [1] https://github.com/buildroot/buildroot/blob/2017.02.1/Makefile#L717
> >
> > Regards,
> > Ga?l
> >
> 
> Regards
> Abhimanyu V

> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Regards,
Ga?l

[1] http://patchwork.ozlabs.org/patch/744825/
[2] http://patchwork.ozlabs.org/patch/744826/
[3] http://patchwork.ozlabs.org/patch/744824/> 
