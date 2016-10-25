From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 25 Oct 2016 16:21:50 -0500
Subject: [Buildroot] [PATCH] support/scripts: tool to create fragments
In-Reply-To: <1477425699-37971-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1477425699-37971-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <CANQCQpY5RonQSBNtU3=9ABAvEyaAi5k0b6kLeg+_YgJhbfEbmw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sam,

On Tue, Oct 25, 2016 at 3:01 PM, Matt Weber <
matthew.weber@rockwellcollins.com> wrote:

> From: Sam Voss <samuel.voss@rockwellcollins.com>
>
> Add script to create kconfig fragment; defaults to busybox fragment if
> only one config is specified (compares to package/busybox/busybox.config).
>
> Signed-off-by: Sam Voss <samuel.voss@rockwellcollins.com>
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> ---
>  support/scripts/gen-config-fragment.sh | 59
> ++++++++++++++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
>  create mode 100755 support/scripts/gen-config-fragment.sh
>
> diff --git a/support/scripts/gen-config-fragment.sh
> b/support/scripts/gen-config-fragment.sh
> new file mode 100755
> index 0000000..a8b5345
> --- /dev/null
> +++ b/support/scripts/gen-config-fragment.sh
> @@ -0,0 +1,59 @@
> +#!/bin/bash
> +
> +###########################################################
> #####################
> +# DESCRIPTION:
> +#     Creates a fragment by comparing two kconfigs. Default usage creates
> a
> +#       busybox fragment, however providing two config files will
> override this.
> +#
> +#     Required arguments:
> +#       $1 - config #1. This is generally the new one created
> +#
> +#     Optional arguments:
> +#       $2 - config #2: The configuration file to compare against. If none
> +#            supplied, will compare against package/busybox/busybox.config
> +###########################################################
> #####################
> +usage ()
> +{
> +use="gen-config-fragment.sh:
> +    Creates a fragment by comparing two kconfigs. Default usage creates a
> +      busybox fragment, however providing two config files will override
> this.
> +
> +    Required arguments:
> +      $1 - config #1. This is generally the new one created
> +
> +    Optional arguments:
> +      $2 - config #2: The configuration file to compare against. If none
> +           supplied, will compare against package/busybox/busybox.config"
> +        printf "$use"
> +        exit 1
> +}
> +
> +if [ -z "$1" ]; then
> +        usage
> +else
> +        FirstConfig="$1"
> +fi
> +
> +if [ -z "$2" ]; then
> +        SecondConfig="package/busybox/busybox.config"
> +else
> +        SecondConfig="$2"
> +fi
> +
> +loadedFirstConfig=()
> +loadedSecondConfig=()
> +while read line; do
> +        if [[ ${line:0:1} != '#' ]] || [[ ${line:2:3} == 'BR2' ]]; then
> +                loadedFirstConfig+=("${line// /_space_}")
>

Oops need to update for kernel config use,  you must have just tested
against buildroot.


> +        fi
> +done < $FirstConfig
> +
> +while read -r line; do
> +        if [[ ${line:0:1} != '#' ]] || [[ ${line:2:3} == 'BR2' ]]; then
> +                loadedSecondConfig+=("${line// /_space_}")
>

same here


> +        fi
> +done < $SecondConfig
> +
> +
> +D=($(comm -23 <(printf '%s\n' "${loadedFirstConfig[@]}" | sort -d)
> <(printf '%s\n' "${loadedSecondConfig[@]}" | sort -d)))
> +printf '%s\n' "${D[@]//_space_/ }" > "$FirstConfig.fragment"
> --
> 1.9.1
>
>


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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161025/ef3992ff/attachment.html>
