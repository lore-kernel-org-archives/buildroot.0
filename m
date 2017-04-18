From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Tue, 18 Apr 2017 09:52:08 -0400
Subject: [Buildroot] genimage.sh arguments [was: [PATCH v8 1/2]
 genimage.sh: fix calling from BR2_ROOTFS_POST_IMAGE_SCRIPT]
In-Reply-To: <7dc5c839-7e26-8768-0722-edd82f1b4d0c@mind.be>
References: <20170416174048.4737-1-abhimanyu.v@gmail.com>
 <20170416212937.64yzqpdbbivp3qep@gportay>
 <CA+V_ovuOD_kqkdvrLaKwkVVTCS9NN+8m7SOpRmT-8vg30O_eQQ@mail.gmail.com>
 <20170417142020.3gx4zqnvlv7cbmiv@gportay>
 <7dc5c839-7e26-8768-0722-edd82f1b4d0c@mind.be>
Message-ID: <20170418135208.nkfmfpx5blltfcfl@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Tue, Apr 18, 2017 at 01:51:28PM +0200, Arnout Vandecappelle wrote:
>  [Adding Etienne to the Cc as the main contributor of genimage.sh]
> 
> On 17-04-17 16:20, Ga?l PORTAY wrote:
> > Hello Abhimanyu,
> > 
> [snip]
> > Initially, genimage.sh script was NOT intend to be run either as or inside a
> > post-image. It was a Makefile target [1]. [2] and [3] are use cases.
> 
>  True, but since [1] isn't applied yet and is still under discussion, we really
> want to be able to call it as a post-image script directly.
> 

Okay.

The question is, do we "accept" to run genimage.sh inside a post-image script?

If yes, developpers have to call genimage.sh with a fake first argument (or the
binary directory).

If no, the shift is a fair solution alongside a comment.

A second solution consists in using this first argument in the script:

	# First argument is the binary directory
	bindir="$1"
	shift
	while getopts :c: OPT ; do
		case "${OPT}" in
		c) GENIMAGE_CFG="${OPTARG}";;
		:) die "option '${OPTARG}' expects a mandatory argument";;
		\?) die "unknown option '${OPTARG}'";;
		esac
	done

	# ...

	genimage \
	--rootpath "${TARGET_DIR}"     \
	--tmppath "${GENIMAGE_TMP}"    \
	--inputpath "${bindir}"  \
	--outputpath "${bindir}" \
	--config "${GENIMAGE_CFG}"

But, if we deprecated the first argument, it also impacts the genimage.sh.

> 
> > Maybe, a cleaner solution consists in updating the Makefile to remove this first
> > argument given to both post-build and post-image scripts. But it breaks the
> > existing.
> 
>  I don't think we can do that. Most "interesting" post-* scripts are out of
> tree, so we can't change them. Although updating Buildroot is expected to have
> some implications on the user integration layer (cfr. the change in br2-external
> handling), we try to avoid it.
> 

That is why I added Thomas and you in copy :)

>  It would indeed be good to remove that first argument, but then I think we have
> to go through a (long) deprecation period. That means right now: mark it as
> legacy in the manual and help text.
> 
> > Thomas, Arnout, do you have a better idea?
> > 
> > I had a quick look to scripts in-tree; they do not seem to use this parameter.
> > 
> > Instead, they access directly to $TARGET_DIR or $BINARIES_DIR values using the
> > environment variables.
> > 
> > For extra arguments, they use $2, $3; they need to be updated.
> 
>  ... which proves that deprecating it is not easy, because it's fairly difficult
> to make a script compatible with both the "new" and the "old" way - cfr. the
> special care taking in the genimage.sh script, and that's relatively easy
> because the argument has a -c added to it.

I agree.

> 
> [snip]
> > [1] http://patchwork.ozlabs.org/patch/744825/
> > [2] http://patchwork.ozlabs.org/patch/744826/
> > [3] http://patchwork.ozlabs.org/patch/744824/
> 

Something that would be nice is to allow to give extra arguments to genimage.
genimage.sh is acting as a wrapper.

	BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
	BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/boardname/genimage.cfg -- --loglevel 1"

Regards,
Ga?l
