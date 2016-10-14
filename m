From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 14 Oct 2016 18:46:04 +0200
Subject: [Buildroot] [PATCH] contrib: add a directory to store "contrib"
 stuff
In-Reply-To: <1476455076-20590-1-git-send-email-yann.morin.1998@free.fr>
References: <1476455076-20590-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <e5586a90-0d09-7585-35c4-a079c8f211fc@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-10-16 16:24, Yann E. MORIN wrote:
> Add acontrib directory to store useful little scripts, tools, etc...
       ^

 As discussed orally, I propose to instead put it in a "tools" directory. Later
we can then move the user-visible scripts to this directory as well, and we can
add an entry in the manual to refer to that directory.

 The nice thing of the tools directory is that users could put it in their PATH
without risk. I would :-)

> but that can't really be part of Buildroot.

 Well, if we add this, it will be part of buildroot :-) But I get your drift.

> 
> Add the first contribution: brmake, a small script that redirects the
> build output log to a file, keeping just Buildroot's own messages, with
> the date+time added at the start of the line.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  contrib/00-README.txt |  8 ++++++++
>  contrib/brmake        | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
>  create mode 100644 contrib/00-README.txt
>  create mode 100755 contrib/brmake
> 
> diff --git a/contrib/00-README.txt b/contrib/00-README.txt
> new file mode 100644
> index 0000000..ab1548f
> --- /dev/null
> +++ b/contrib/00-README.txt
> @@ -0,0 +1,8 @@
> +This directory contains various useful scripts and tools
> +that were contributed, but that do not rellay belong to
> +the core Buildroot.

 I would leave out the last part. I never understood this concept of a "contrib"
directory, it's like a way of waiving responsibility but I don't think that
that's what we want to do here. So just:

This directory contains various useful scripts and tools for working with
Buildroot.

> +
> +brmake
> +    a script that can be run instead of make, that redirects all of the
> +    build output to a file, keeping the Buidlroot messages (those lines
                                              ^^

> +    starting with >>>) and prepend the date in front of each.
> diff --git a/contrib/brmake b/contrib/brmake
> new file mode 100755
> index 0000000..4ae2dc8
> --- /dev/null
> +++ b/contrib/brmake
> @@ -0,0 +1,32 @@
> +#!/bin/bash
> +# (C) 2016, "Yann E. MORIN" <yann.morin.1998@free.fr>
> +# License: WTFPLv2, https://spdx.org/licenses/WTFPL.html
> +
> +main() {
> +    local ret start d h m mf fs
> +
> +    start=${SECONDS}
> +
> +    ( exec 2>&1; unbuffer make "${@}"; ) \

 Maybe somewhere it should be documented how the user should install unbuffer...
FYI it's in expect-dev on Debian. And perhaps we don't want to fail if unbuffer
isn't there - usually it just delays the >>> output for a second so it's not
going to make a huge difference. stdbuf is normally installed, so you can use
stdbuf -o0 instead if unbuffer isn't available.


 Regards,
 Arnout

> +    > >( while read line; do
> +             printf "%(%Y-%m-%dT%H:%M:%S)T %s\n" -1 "${line}"
> +         done \
> +         |tee -a br.log \
> +         |grep --colour=never -E '>>>'
> +       )
> +    ret=${?}
> +
> +    d=$((SECONDS-start))
> +    printf "Done in "
> +    h=$((d/3600))
> +    d=$((d%3600))
> +    [ ${h} -eq 0 ] || { printf "%dh " ${h}; mf="02"; }
> +    m=$((d/60))
> +    d=$((d%60))
> +    [ ${m} -eq 0 ] || { printf "%${mf}dmin " ${m}; sf="02"; }
> +    printf "%${sf}ds\n" ${d}
> +
> +    return ${ret}
> +}
> +
> +main "${@}"
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
