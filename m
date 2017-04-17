From: abhimanyu.v at gmail.com <abhimanyu.v@gmail.com>
Date: Mon, 17 Apr 2017 15:38:27 +0530
Subject: [Buildroot] [PATCH v8 1/2] genimage.sh: fix calling from
	BR2_ROOTFS_POST_IMAGE_SCRIPT
In-Reply-To: <20170416212937.64yzqpdbbivp3qep@gportay>
References: <20170416174048.4737-1-abhimanyu.v@gmail.com>
 <20170416212937.64yzqpdbbivp3qep@gportay>
Message-ID: <CA+V_ovuOD_kqkdvrLaKwkVVTCS9NN+8m7SOpRmT-8vg30O_eQQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thankyou Ga?l for review!

On Mon, Apr 17, 2017 at 3:08 AM, Ga?l PORTAY <
gael.portay@savoirfairelinux.com> wrote:

> Hello Abhimanyu,
>
> On Sun, Apr 16, 2017 at 11:10:47PM +0530, Abhimanyu Vishwakarma wrote:
> > From: Abhimanyu Vishwakarma <Abhimanyu.V@gmail.com>
> >
> > When called from BR2_ROOTFS_POST_IMAGE_SCRIPT, this script
> > ends up with following error:
> >
> > Error: Missing argument
> >
> > This is because, extra positional argument is also passed
> > along with BR2_ROOTFS_POST_SCRIPT_ARGS. genimage.sh didnt
> > had support to parse positional and optional argument
> > together.
> >
>
> Indeed, the problem comes from the first argument given to any post-image
> scripts [1] (which is the binary directory).
>
> A more simple fix consists in adding the shift instruction before right
> before
> the while getopts.
>
> +       shift
>         while getopts c: OPT ; do
>                 case "${OPT}" in
>                 c) GENIMAGE_CFG="${OPTARG}";;
>                 :) die "option '${OPTARG}' expects a mandatory
> argument\n";;
>                 \?) die "unknown option '${OPTARG}'\n";;
>         esac
>         done
>
>
Yes you are right, this is simple fix. What i had in mind was to make the
script independent of any positional argument. With proposed solution if in
future we add extra argument to POST_SCRIPTS then this script can cope with
it. Please let me know your thought. I will prepare patch accordingly.

<snip>


> Furthermore, I see an error in traces. To display the traces properly, the
> optstring required to start with a colon (:), and the trailling \n is not
> required.
>
>         while getopts :c: OPT ; do
>
>
Thanks, I will fix it.


> [1] https://github.com/buildroot/buildroot/blob/2017.02.1/Makefile#L717
>
> Regards,
> Ga?l
>

Regards
Abhimanyu V
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170417/3e8d2afd/attachment.html>
