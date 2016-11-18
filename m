From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 18 Nov 2016 12:48:06 +0100
Subject: [Buildroot] [PATCH v2 09/15] fakedate: new package
In-Reply-To: <1479460224-6119-10-git-send-email-jezz@sysmic.org>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-10-git-send-email-jezz@sysmic.org>
Message-ID: <20161118124806.01b19431@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 18 Nov 2016 10:10:18 +0100, J?r?me Pouiller wrote:
> `date' is widely used by packages to include build information in their
> binaries. Unfortunately, this is incompatible with  BR2_REPRODUCIBLE.
> 
> Instead to find all `date' invocation in build process, we add small tool
> allowing to alway return same date.

Instead of having to identify all `date' invocations in the different
packages, this commit adds a small tool that allows to always return
the same date.

> +PATH=/bin:/usr/bin

It is not really nice to override the PATH. I guess you want to remove
$(HOST_DIR)/usr/bin from the PATH to not call yourself recursively, but
I think we should do better than assuming /bin:/usr/bin is OK.

> +LOG=/dev/null

This variable is used by?

> +if [ -n "$SOURCE_DATE_EPOCH" ]; then
> +    INHIBIT=0
> +    for i in "$@"; do
> +        case $i in
> +        -d|-[!-]*d|--date=*|-f|-[!-]*f|--file=*)
> +            INHIBIT=1
> +            ;;
> +        esac
> +    done
> +    if [ $INHIBIT -eq 0 ]; then
> +        echo "date: Warning: using \$SOURCE_DATE_EPOCH instead of true time" >&2
> +        echo "Catch call to date from `pwd` with parameters: '$@'" >> $LOG
> +        exec date -d "@$SOURCE_DATE_EPOCH" "$@"
> +    fi
> +fi
> +
> +exec date "$@"

Could you explain a bit the logic here?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
