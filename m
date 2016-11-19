From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Nov 2016 11:21:39 +0100
Subject: [Buildroot] [PATCH v2 09/15] fakedate: new package
In-Reply-To: <1479460224-6119-10-git-send-email-jezz@sysmic.org>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-10-git-send-email-jezz@sysmic.org>
Message-ID: <7024db7a-ff5f-312d-fb00-16ed463c79e0@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-11-16 10:10, J?r?me Pouiller wrote:
> `date' is widely used by packages to include build information in their
> binaries. Unfortunately, this is incompatible with  BR2_REPRODUCIBLE.
> 
> Instead to find all `date' invocation in build process, we add small tool
> allowing to alway return same date.
> 
> This work was sponsored by `BA Robotic Systems'.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
> ---
>  package/fakedate/fakedate    | 28 ++++++++++++++++++++++++++++
>  package/fakedate/fakedate.mk | 14 ++++++++++++++
>  2 files changed, 42 insertions(+)
>  create mode 100755 package/fakedate/fakedate
>  create mode 100644 package/fakedate/fakedate.mk
> 
> diff --git a/package/fakedate/fakedate b/package/fakedate/fakedate
> new file mode 100755
> index 0000000..2eded22
> --- /dev/null
> +++ b/package/fakedate/fakedate
> @@ -0,0 +1,28 @@
> +#!/bin/sh
> +# vim: set sw=4 expandtab:
> +#
> +# Licence: GPL

 Please use a proper copyright blurb. Yes, it's long, but it's also more
accurate. You seem to be saying here that it is GPLv1 only, which is most likely
not what you want.

> +# Created: 2016-11-04 16:31:18+01:00
> +# Main authors:
> +#     - J?r?me Pouiller <jezz@sysmic.org>
> +#
> +
> +PATH=/bin:/usr/bin
> +LOG=/dev/null
> +if [ -n "$SOURCE_DATE_EPOCH" ]; then
> +    INHIBIT=0

 INHIBIT is a bit vague. How about DATE_IS_FORCED?

> +    for i in "$@"; do
> +        case $i in
> +        -d|-[!-]*d|--date=*|-f|-[!-]*f|--file=*)

 We use [^-] everywhere else. Note that this pattern will also match something
like -rfrood, i.e. --reference=frood. Fixing that becomes tricky without regexp.

 Anyway, the -d option doesn't really need to be checked. 'date -d foo -d bar'
will ignore the first -d, so things work OK. It's just that you get the spurious
warning. So we could limit to checking -f, and limit to -f|--file=*). In that
case, if someone passes something like -uf we'll get an error and the build will
most likely terminate, so that particular error can be fixed.

> +            INHIBIT=1

 You could add a break here.

> +            ;;
> +        esac
> +    done
> +    if [ $INHIBIT -eq 0 ]; then
> +        echo "date: Warning: using \$SOURCE_DATE_EPOCH instead of true time" >&2

 Is it really needed to print this warning?

> +        echo "Catch call to date from `pwd` with parameters: '$@'" >> $LOG
> +        exec date -d "@$SOURCE_DATE_EPOCH" "$@"
> +    fi
> +fi
> +
> +exec date "$@"
> diff --git a/package/fakedate/fakedate.mk b/package/fakedate/fakedate.mk
> new file mode 100644
> index 0000000..e81ce5d
> --- /dev/null
> +++ b/package/fakedate/fakedate.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# fakedate
> +#
> +################################################################################
> +
> +# source included in buildroot
> +HOST_FAKEDATE_LICENSE = GPLv2+

 This is inconsistent with the script itself, which specifies GPLv1 only :-P

 Regards,
 Arnout

> +
> +define HOST_FAKEDATE_INSTALL_CMDS
> +	$(INSTALL) -D -m 755 package/fakedate/fakedate $(HOST_DIR)/usr/bin/date
> +endef
> +
> +$(eval $(host-generic-package))
> 

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
