From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Apr 2017 19:36:08 +0200
Subject: [Buildroot] genimage.sh arguments [was: [PATCH v8 1/2]
 genimage.sh: fix calling from BR2_ROOTFS_POST_IMAGE_SCRIPT]
In-Reply-To: <20170418135208.nkfmfpx5blltfcfl@gportay>
References: <20170416174048.4737-1-abhimanyu.v@gmail.com>
 <20170416212937.64yzqpdbbivp3qep@gportay>
 <CA+V_ovuOD_kqkdvrLaKwkVVTCS9NN+8m7SOpRmT-8vg30O_eQQ@mail.gmail.com>
 <20170417142020.3gx4zqnvlv7cbmiv@gportay>
 <7dc5c839-7e26-8768-0722-edd82f1b4d0c@mind.be>
 <20170418135208.nkfmfpx5blltfcfl@gportay>
Message-ID: <79a32991-4d50-7b94-53f6-d682d16b4506@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-04-17 15:52, Ga?l PORTAY wrote:
> Arnout,
> 
> On Tue, Apr 18, 2017 at 01:51:28PM +0200, Arnout Vandecappelle wrote:
>>  [Adding Etienne to the Cc as the main contributor of genimage.sh]
>>
>> On 17-04-17 16:20, Ga?l PORTAY wrote:
>>> Hello Abhimanyu,
>>>
>> [snip]
>>> Initially, genimage.sh script was NOT intend to be run either as or inside a
>>> post-image. It was a Makefile target [1]. [2] and [3] are use cases.
>>
>>  True, but since [1] isn't applied yet and is still under discussion, we really
>> want to be able to call it as a post-image script directly.
>>
> 
> Okay.
> 
> The question is, do we "accept" to run genimage.sh inside a post-image script?

 Of course we do, because in some cases, genimage.sh cannot replace the
post-image script - even with [1] applied, you still need a post-image script
that calls genimage, and the genimage.sh wrapper is still useful in that case.


> If yes, developpers have to call genimage.sh with a fake first argument (or the
> binary directory).

 Well, Abhimanyu's patch avoids that, by ignoring non-option arguments. And this
was the reason I told Etienne to use the -c option to begin with: to make
handling of options more flexible.

> 
> If no, the shift is a fair solution alongside a comment.
> 
> A second solution consists in using this first argument in the script:
> 
> 	# First argument is the binary directory
> 	bindir="$1"
> 	shift
> 	while getopts :c: OPT ; do
> 		case "${OPT}" in
> 		c) GENIMAGE_CFG="${OPTARG}";;
> 		:) die "option '${OPTARG}' expects a mandatory argument";;
> 		\?) die "unknown option '${OPTARG}'";;
> 		esac
> 	done
> 
> 	# ...
> 
> 	genimage \
> 	--rootpath "${TARGET_DIR}"     \
> 	--tmppath "${GENIMAGE_TMP}"    \
> 	--inputpath "${bindir}"  \
> 	--outputpath "${bindir}" \
> 	--config "${GENIMAGE_CFG}"
> 
> But, if we deprecated the first argument, it also impacts the genimage.sh.

 Exactly. And it's not very useful, since it should *never* be different from
BINARIES_DIR.


>>> Maybe, a cleaner solution consists in updating the Makefile to remove this first
>>> argument given to both post-build and post-image scripts. But it breaks the
>>> existing.
>>
>>  I don't think we can do that. Most "interesting" post-* scripts are out of
>> tree, so we can't change them. Although updating Buildroot is expected to have
>> some implications on the user integration layer (cfr. the change in br2-external
>> handling), we try to avoid it.
>>
> 
> That is why I added Thomas and you in copy :)
> 
>>  It would indeed be good to remove that first argument, but then I think we have
>> to go through a (long) deprecation period. That means right now: mark it as
>> legacy in the manual and help text.
>>
>>> Thomas, Arnout, do you have a better idea?
>>>
>>> I had a quick look to scripts in-tree; they do not seem to use this parameter.
>>>
>>> Instead, they access directly to $TARGET_DIR or $BINARIES_DIR values using the
>>> environment variables.
>>>
>>> For extra arguments, they use $2, $3; they need to be updated.
>>
>>  ... which proves that deprecating it is not easy, because it's fairly difficult
>> to make a script compatible with both the "new" and the "old" way - cfr. the
>> special care taking in the genimage.sh script, and that's relatively easy
>> because the argument has a -c added to it.
> 
> I agree.
> 
>>
>> [snip]
>>> [1] http://patchwork.ozlabs.org/patch/744825/
>>> [2] http://patchwork.ozlabs.org/patch/744826/
>>> [3] http://patchwork.ozlabs.org/patch/744824/
>>
> 
> Something that would be nice is to allow to give extra arguments to genimage.
> genimage.sh is acting as a wrapper.
> 
> 	BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
> 	BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/boardname/genimage.cfg -- --loglevel 1"

 Yes, that could be useful. Although the -- makes is difficult again because
it's not compatible with getopt so Abhimanyu's patch wouldn't work anymore. But
I could accept it with extra quoting:

BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/boardname/genimage.cfg -O '--loglevel 1'"

 However, I don't really see the usefulness of this feature. loglevel is in fact
the only option that you could usefully pass on to genimage. So just adding a -v
option to genimage.sh is probably more convenient.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
