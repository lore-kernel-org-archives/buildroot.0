From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Feb 2017 22:31:36 +0100
Subject: [Buildroot] [PATCH v5 02/19] fakedate: new package
In-Reply-To: <1482241596-31688-3-git-send-email-jezz@sysmic.org>
 (=?utf-8?B?IkrDqXLDtG1l?=
 Pouiller"'s message of "Tue, 20 Dec 2016 14:46:19 +0100")
References: <1482241596-31688-1-git-send-email-jezz@sysmic.org>
 <1482241596-31688-3-git-send-email-jezz@sysmic.org>
Message-ID: <87bmudr8lj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "J?r?me" == J?r?me Pouiller <jezz@sysmic.org> writes:

 > `date' is widely used by packages to include build information in their
 > binaries. Unfortunately, this is incompatible with  BR2_REPRODUCIBLE.

 > Instead of having to identify all `date' invocations in the different
 > packages, this commit adds a small tool that allows to always return
 > the same date.

 > This work was sponsored by `BA Robotic Systems'.

 > Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
 > ---

 > Notes:
 >     v3:
 >       - Do not force $PATH. Find true `date' binary instead (Thomas)
 >       - Add explanations (Thomas)
 >       - Fix options detection (Arnout)
 >       - Rename INHIBIT in FORCE_EPOCH (Thomas)
 >       - Break after FORCE_EPOCH=0 (Arnout)
 >       - Add support for '--reference'
 >       - Add full copyright blurb (Arnout)

 >  package/fakedate/fakedate    | 59 ++++++++++++++++++++++++++++++++++++++++++++
 >  package/fakedate/fakedate.mk | 15 +++++++++++
 >  2 files changed, 74 insertions(+)
 >  create mode 100755 package/fakedate/fakedate
 >  create mode 100644 package/fakedate/fakedate.mk

 > diff --git a/package/fakedate/fakedate b/package/fakedate/fakedate
 > new file mode 100755
 > index 0000000..074c517
 > --- /dev/null
 > +++ b/package/fakedate/fakedate
 > @@ -0,0 +1,59 @@
 > +#!/bin/sh
 > +# vim: set sw=4 expandtab:
 > +#
 > +# This program is free software; you can redistribute it and/or modify
 > +# it under the terms of the GNU General Public License as published by
 > +# the Free Software Foundation; either version 2 of the License, or
 > +# (at your option) any later version.
 > +#
 > +# This program is distributed in the hope that it will be useful,
 > +# but WITHOUT ANY WARRANTY; without even the implied warranty of
 > +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 > +# General Public License for more details.
 > +#
 > +# You should have received a copy of the GNU General Public License
 > +# along with this program; if not, write to the Free Software
 > +# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
 > +#
 > +# Copyright (C) 2016 J?r?me Pouiller <jezz@sysmic.org>
 > +#
 > +LOG=/dev/null
 > +
 > +# Sanity check
 > +if ! readlink -f "$0" | grep -q fakedate; then
 > +    echo "fakedate: Please name this script \`fakedate'"
 > +    exit 1
 > +fi
 > +
 > +DATE_BIN=false
 > +# Do not call `date'd directly since it will produce an infinite recursion.
 > +# Instead, find path of true `date' binary.
 > +for P in `echo $PATH | tr ':' ' '`; do
 > +    if [ -x "$P/date" ]; then
 > +        if readlink -f "$P/date" | grep -qv fakedate; then
 > +            DATE_BIN="$P/date"
 > +            break;
 > +        fi
 > +    fi
 > +done
 > +
 > +if [ -n "$SOURCE_DATE_EPOCH" ]; then
 > +    FORCE_EPOCH=1
 > +    for i in "$@"; do
 > +        # Use of --date, --file and --reference (and their short option counter
 > +        # parts) is incompatible with SOURCE_DATE_EPOCH.
 > +        # -u and -R are the only short options without argument. So they could
 > +        # appear between '-' and option we want to match.
 > +        if echo "$i" | grep -qE '^-([uR]*d|-date|[uR]*f|-file|[uR]*r|--reference)'; then
 > +            FORCE_EPOCH=0
 > +            break;
 > +        fi
 > +    done
 > +    if [ $FORCE_EPOCH -eq 1 ]; then
 > +        echo "date: Warning: using \$SOURCE_DATE_EPOCH instead of true time" >&2
 > +        echo "Catch call to date from `pwd` with parameters: '$@'" >> $LOG

I don't think this LOG debug stuff makes much sense as you have to edit the
file anyway, so you can just add any adhoc debug statements on the fly
anyway.

Committed with that removed, thanks.

-- 
Bye, Peter Korsgaard
