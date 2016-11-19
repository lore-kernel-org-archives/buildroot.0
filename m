From: =?ISO-8859-1?Q?J=E9r=F4me?= Pouiller <jezz@sysmic.org>
Date: Sat, 19 Nov 2016 14:24:24 +0100
Subject: [Buildroot] [PATCH v2 09/15] fakedate: new package
In-Reply-To: <20161118124806.01b19431@free-electrons.com>
References: <1479460224-6119-1-git-send-email-jezz@sysmic.org>
 <1479460224-6119-10-git-send-email-jezz@sysmic.org>
 <20161118124806.01b19431@free-electrons.com>
Message-ID: <1726749.nuZtMxpYh2@sagittea>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Friday 18 November 2016 12:48:06 Thomas Petazzoni wrote:
> On Fri, 18 Nov 2016 10:10:18 +0100, J?r?me Pouiller wrote:
[...]
> > +PATH=/bin:/usr/bin
> 
> It is not really nice to override the PATH. I guess you want to remove
> $(HOST_DIR)/usr/bin from the PATH to not call yourself recursively, but
> I think we should do better than assuming /bin:/usr/bin is OK.

My initial idea was something based on:
    sed "s/@@DATE_CMD@@/`which date`/"

However, I worried about people who add $HOST_DIR in their $PATH and
call host-fakedate-reinstall.

However, stripping $(dirname $0) from PATH during runtime seems a good
idea. I will try that.

> > +LOG=/dev/null
> 
> This variable is used by?

In my initial version, I logged calls to fakedate in $BUILD_DIR.
I removed the log file, but it may be convenient to easily restore it
if necessary.

> > +if [ -n "$SOURCE_DATE_EPOCH" ]; then
> > +    INHIBIT=0
> > +    for i in "$@"; do
> > +        case $i in
> > +        -d|-[!-]*d|--date=*|-f|-[!-]*f|--file=*)
> > +            INHIBIT=1
> > +            ;;
> > +        esac
> > +    done
> > +    if [ $INHIBIT -eq 0 ]; then
> > +        echo "date: Warning: using \$SOURCE_DATE_EPOCH instead of true time" >&2
> > +        echo "Catch call to date from `pwd` with parameters: '$@'" >> $LOG
> > +        exec date -d "@$SOURCE_DATE_EPOCH" "$@"
> > +    fi
> > +fi
> > +
> > +exec date "$@"
> 
> Could you explain a bit the logic here?

If this script is called with '--date', '--file' or any aliases of
these option, just call `date' as usual. Else, this script force
returned date.


BR,

-- 
J?r?me Pouiller, Sysmic
Embedded Linux specialist
http://www.sysmic.fr
