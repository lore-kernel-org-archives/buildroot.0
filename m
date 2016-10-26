From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 26 Oct 2016 16:38:31 -0500
Subject: [Buildroot] [PATCH] support/scripts: tool to create fragments
In-Reply-To: <20161026211708.GA3593@free.fr>
References: <1477425699-37971-1-git-send-email-matthew.weber@rockwellcollins.com>
 <20161026211708.GA3593@free.fr>
Message-ID: <CANQCQpZCuqUMAWdukjfgvYK1t3+09xBuvFEthOXVisMcXny_hw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann,

On Wed, Oct 26, 2016 at 4:17 PM, Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Matt, Sam, All,
>
> On 2016-10-25 15:01 -0500, Matt Weber spake thusly:
> > From: Sam Voss <samuel.voss@rockwellcollins.com>
> >
> > Add script to create kconfig fragment; defaults to busybox fragment if
> > only one config is specified (compares to package/busybox/busybox.
> config).
>
> As stated by Thomas, this is re-inventing diffconfig.
>
> The only difference being the output format.
>
> Currently diffconfig can output a diff-like, but it can also output a
> "merge" style (although I'm not sure what it means, given that a merge
> on your example is just empty).
>
> I think it would be much better to update diffconfig to allow it to spit
> out a fragment format. Maybe something like:
>
>     $ diffconfig -f config.base config.modified
>     CONFIG_DEVTMPFS_MOUNT=y
>     CONFIG_DEVTMPFS=y
>     # CONFIG_X86_MPPARSE is not set
>
> Thoughts?
>

We could propose a wrapper which lives as support/scripts/diffconfig which
checks to see if the linux source has been extracted and if it is, calls
the diffconfig tool as is.  Except for the new case of -f where it does
additional formatting.
Most of our use cases are with a complete build we're trying to split out
configs.  However if you didn't have build the script would be of no use.


> Note: either way, I'd prefer both files to be mandatory arguments, with
> the original one specified first and the modified one specified last,
> and that there is no default comparison against busybox.
>
> Otherwise, some review below...
>
> > Signed-off-by: Sam Voss <samuel.voss@rockwellcollins.com>
> > Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> > ---
> >  support/scripts/gen-config-fragment.sh | 59
> ++++++++++++++++++++++++++++++++++
> >  1 file changed, 59 insertions(+)
> >  create mode 100755 support/scripts/gen-config-fragment.sh
> >
> > diff --git a/support/scripts/gen-config-fragment.sh
> b/support/scripts/gen-config-fragment.sh
> > new file mode 100755
> > index 0000000..a8b5345
> > --- /dev/null
> > +++ b/support/scripts/gen-config-fragment.sh
> > @@ -0,0 +1,59 @@
> > +#!/bin/bash
> > +
> > +###########################################################
> #####################
> > +# DESCRIPTION:
> > +#     Creates a fragment by comparing two kconfigs. Default usage
> creates a
> > +#       busybox fragment, however providing two config files will
> override this.
> > +#
> > +#     Required arguments:
> > +#       $1 - config #1. This is generally the new one created
> > +#
> > +#     Optional arguments:
> > +#       $2 - config #2: The configuration file to compare against. If
> none
> > +#            supplied, will compare against
> package/busybox/busybox.config
> > +###########################################################
> #####################
> > +usage ()
> > +{
> > +use="gen-config-fragment.sh:
> > +    Creates a fragment by comparing two kconfigs. Default usage creates
> a
> > +      busybox fragment, however providing two config files will
> override this.
> > +
> > +    Required arguments:
> > +      $1 - config #1. This is generally the new one created
> > +
> > +    Optional arguments:
> > +      $2 - config #2: The configuration file to compare against. If none
> > +           supplied, will compare against package/busybox/busybox.
> config"
> > +        printf "$use"
> > +        exit 1
>
> Dont use a variable; use an here-document (leading TABS, repesented by
> ???? here, are ignored):
>
>     cat <<-_EOF_
>     ????gen-config-fragment.sh:
>     ????    Creates a fragment by comparing two kconfigs.
>
>     ????Arguments:
>     ????    $1 : the unmodified original configuration file
>     ????    $2 : the modified configuration file
>
>     ????Blabla...
>     _EOF_
>
> > +}
> > +
> > +if [ -z "$1" ]; then
> > +        usage
> > +else
> > +        FirstConfig="$1"
> > +fi
> > +
> > +if [ -z "$2" ]; then
> > +        SecondConfig="package/busybox/busybox.config"
> > +else
> > +        SecondConfig="$2"
> > +fi
> > +
> > +loadedFirstConfig=()
> > +loadedSecondConfig=()
>
> Declare the variables:
>
>     declare -a loadedFirstConfig loadedSecondConfig
>
> > +while read line; do
> > +        if [[ ${line:0:1} != '#' ]] || [[ ${line:2:3} == 'BR2' ]]; then
>
> Use just plain '[ ... ]' to do tests, since they are POSIX; quote
> strings:
>
>     if [ "${line:0:3}" = "BR2_" -o "${line:2:4}" = "BR2_" ]; then
>
> > +                loadedFirstConfig+=("${line// /_space_}")
>
> I'm not too fond of the magic placeholder _space_. But I can't find an
> easy and better solution... Maybe make it even less probable, like:
>     _S_P_A_C_E_
>
> > +        fi
> > +done < $FirstConfig
>
> Quote strings:  "${FirstConfig}"
>
> But there is a better and faster way to fill in the array:
>
>     loadedFirstConfig=( $( sed -r -e 's/ /_S_P_A_C_E_/g' "${FirstConfig}"
> ) )
>
> But it turns out you don;t need the array in the first place, see below.
>
> > +
> > +while read -r line; do
> > +        if [[ ${line:0:1} != '#' ]] || [[ ${line:2:3} == 'BR2' ]]; then
> > +                loadedSecondConfig+=("${line// /_space_}")
> > +        fi
> > +done < $SecondConfig
> > +
> > +
> > +D=($(comm -23 <(printf '%s\n' "${loadedFirstConfig[@]}" | sort -d)
> <(printf '%s\n' "${loadedSecondConfig[@]}" | sort -d)))
>
> Line too long; split it.
>
> > +printf '%s\n' "${D[@]//_space_/ }" > "$FirstConfig.fragment"
>
> Just output to stdout; let the user redirect to the file of his choice.
>
> But we can do it much more simply, in a single command. Your script
> would be just (without even a requirement for bash):
>
>     #!/bin/sh
>
>     usage() {
>         cat <<-_EOF_
>         Blabla
>         _EOF_
>     }
>
>     [ ${#} -eq 2 ] || { usage; exit 1; }
>     [ -f "${1}" ]  || { usage; exit 1; }
>     [ -f "${2}" ]  || { usage; exit 1; }
>
>     comm -23 <( sed -r -e 's/ /_S_P_A_C_E_/g' "${FirstConfig}"  |sort -d )
> \
>              <( sed -r -e 's/ /_S_P_A_C_E_/g' "${SecondConfig}" |sort -d )
> \
>     |sed -r -e 's/_S_P_A_C_E_/ /g'
>

Will give that a try.  Thanks !


-- 
Matthew L Weber / Pr Software Engineer
Airborne Information Systems / Security Systems and Software / Secure
Platforms
MS 131-100, C Ave NE, Cedar Rapids, IA, 52498, USA
www.rockwellcollins.com

Note: Any Export License Required Information and License Restricted Third
Party Intellectual Property (TPIP) content must be encrypted and sent to
matthew.weber at corp.rockwellcollins.com.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161026/3307cc8c/attachment.html>
