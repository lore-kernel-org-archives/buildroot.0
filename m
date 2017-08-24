From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 25 Aug 2017 00:46:04 +0200
Subject: [Buildroot] [PATCH 1/1] Support: Config generation script
In-Reply-To: <1503498086-1593-1-git-send-email-sam.voss@rockwellcollins.com>
References: <1503498086-1593-1-git-send-email-sam.voss@rockwellcollins.com>
Message-ID: <9d276ffc-212c-b0b5-c96c-9edfb7ffa433@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Sam,

 The summary line should be something like:

utils/diffconfig: new kconfig fragment generation script

On 23-08-17 16:21, Sam Voss wrote:
> Add script to create kconfig fragments that are directly usable.
> 
> - Sort commented out packages
> - Output to stdout, must be redirected
> - Add linux example
> 
> Signed-off-by: Sam Voss <sam.voss@rockwellcollins.com>
> 
> ---
> 
> Relates to: https://patchwork.ozlabs.org/patch/686694/

 Good that you added a reference to that previous version!


> Missing feature to combine all fragments used to create newest
> configuration file, which can make it difficult to diff large fragment
> sets. I was hoping to leverage buildroot's fragment combiner, but haven't
> had a chance to look into it.
> ---
>  support/scripts/diffconfig.sh | 75 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
>  create mode 100755 support/scripts/diffconfig.sh
> 
> diff --git a/support/scripts/diffconfig.sh b/support/scripts/diffconfig.sh
> new file mode 100755
> index 0000000..59227ad
> --- /dev/null
> +++ b/support/scripts/diffconfig.sh

 We recently added a top-level utils/ directory for the user-facing scripts. It
also has a readme.txt that should be updated with a brief explanation of the tool.

 Drop the .sh extension. It's not relevant that it's a shell script.

 I'm also not entirely convinced that diffconfig is the best name, since it
completely different from the one in the kernel, and it's not at all making a
diff of configs. Perhaps splitconfig? fragmentconfig? But I'm not too bothered
about the exact name.

 However, why don't you just copy the kernel's diffconfig script? What is
missing in 'diffconfig -m' that this script adds? And in fact, why do we need
this script in Buildroot? Shouldn't we just refer to it from the documentation?

> @@ -0,0 +1,75 @@
> +#!/bin/bash

 Use /usr/bin/env bash for people who put bash somewhere else.

> +
> +################################################################################
> +# DESCRIPTION:
> +#     Creates a fragment by comparing two kconfigs.
> +#
> +#     Required arguments:
> +#       $1 - config #1. This is generally the new one created
> +#       $2 - config #2: The configuration file to compare against.

 This just repeats the usage() immediately below so not very useful.

> +#
> +# Linux Example
> +# ./support/scripts/diffconfig.sh <outputdir>/build/linux-x.y.z/defconfig
> +#     board/custom-board/linux-x.y.z.config

 This would be useful to add to usage() output. And extend it a little:

Example to generate a linux config fragment:
make linux-savedefconfig
$0 output/build/linux-4.*/defconfig board/my-board/linux.config \
   > board/my-board/linux-feature.fragment

 However, I think it's more intuitive to swap the two arguments, i.e. first old,
then new; or first minimal, then complete. That's more analogous to diff: the
fragment is a patch, and you apply the patch to the first argument of diff to
get the second argument.

> +################################################################################
> +
> +usage ()
> +{
> +cat <<-_EOF_
> +	diffconfig.sh:

 Use $0 to get the actual executable name.

 Also you usually put the arguments here, like

	Usage: $0 FULLCONFIG BASECONFIG

> +	Creates a fragment by comparing two kconfigs.

 Summary line uses an imperative, so "Create a fragment ..."

> +
> +	Required arguments:
> +	$1 - config #1. This is generally the new one created

 $1 will be expanded, no? Use the names you used above, so FULLCONFIG here.

> +	$2 - config #2: The configuration file to compare against.
> +_EOF_
> +
> +    exit 1
> +}
> +
> +if [ -z "$1" ] || [ -z "$2" ]; then

 Both must exist already, so test with -e instead. Or even -r (readable).

> +        usage
> +fi
> +
> +declare -a loaded_first_config loaded_second_config
> +
> +# spaces must be removed, and then re-replaced.
> +SPACE_DELIM="_s_p_a_c_e_"

 Why is this needed? You do proper quoting everywhere, and sort and comm work
line by line...

> +
> +while read line; do
> +        if [ "${line:0:1}" != "#" ]; then
> +                loaded_first_config+=("${line// /${SPACE_DELIM}}")
> +        elif [ "${line:2:3}" = "BR2" ] || [ "${line:2:6}" = "CONFIG" ]; then

 That's not so nice, it might start with something else as well... A commented
line will always end with " is not set" so I would match with that. I think it
would be easier to write these conditions as a case:

	case "${line}" in
	("# "*" is not set")
		...
		;;
	("# "*) ;; # Ignore comments
	(*)
		loaded_first_config+=...

 You should probably also eliminate empty lines, so use (?*) instead of (*).

> +                # was a commented line, but still needs alpha sorting
> +                NOC="${line:2}"
> +                loaded_first_config+=("${NOC// /${SPACE_DELIM}}")
> +        fi
> +done < "$1" # load file 1

 Could you factor this into a function? Instead of appending to the array, you
can just echo the lines. And then...

> +
> +while read line; do
> +        if [ "${line:0:1}" != "#" ]; then
> +                loaded_second_config+=("${line// /${SPACE_DELIM}}")
> +        elif [ "${line:2:3}" = "BR2" ] || [ "${line:2:6}" = "CONFIG" ]; then
> +                # was a commented line, but still needs alpha sorting
> +                NOC="${line:2}"
> +                loaded_second_config+=("${NOC// /${SPACE_DELIM}}")
> +        fi
> +done < "$2" # load file 2
> +
> +D=($(comm -23 <(printf '%s\n' "${loaded_first_config[@]}" | sort -d) <(printf '%s\n' "${loaded_second_config[@]}" | sort -d)))

 ... this becomes

D=($(comm -23 <(load_config $1 | sort -d) <(load_config $2 | sort -d))

 Don't you also have to do a comm -13 to get the lines that were removed, and
add those commented out? And what with string or integer options that get a
different value?

> +
> +# Earlier, the '# ' were removed from the beginning of not-set packages for
> +#  sorting. Add them back.
> +declare -a NFRAG
> +
> +for line in "${D[@]}"; do
> +    # if the line does not have an '=', it was a comment
> +    if [ "${line#*=*}" = "${line}" ]; then
> +        NFRAG+=("# ${line}")

 Instead of building up yet another array, you could directly do the printf
here. Or do line="# ${line}" here and do the printf after the condition.

 Regards,
 Arnout


> +    else
> +        NFRAG+=($line)
> +    fi
> +done
> +
> +# Earlier, spaces were replaced with '_space_'. Revert this and dump to stdout.
> +printf "%s\n" "${NFRAG[@]//${SPACE_DELIM}/ }"
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
