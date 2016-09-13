From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 13 Sep 2016 23:34:57 +0200
Subject: [Buildroot] [PATCH 1/2 v8] core: don't build host-cmake if it
 is available on the build host
In-Reply-To: <73437706-39d8-50af-7a08-df3ec45deaa1@lucaceresoli.net>
References: <cover.1473717489.git.yann.morin.1998@free.fr>
 <3ce0d5355eee13e5667c5ef3233514e2308044d8.1473717489.git.yann.morin.1998@free.fr>
 <73437706-39d8-50af-7a08-df3ec45deaa1@lucaceresoli.net>
Message-ID: <20160913213457.GB6175@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2016-09-13 23:05 +0200, Luca Ceresoli spake thusly:
> On 12/09/2016 23:59, Yann E. MORIN wrote:
> > From: Luca Ceresoli <luca@lucaceresoli.net>
> > Currently all cmake packages depend on host-cmake. Unfortunately
> > host-cmake takes a long time to configure and build: almost 7 minutes
> > on a dual-core i5 with SSD. The time does not change even with ccache
> > enabled.
[--SNIP--]
> > diff --git a/support/dependencies/check-host-cmake.sh b/support/dependencies/check-host-cmake.sh
> > new file mode 100755
> > index 0000000..9b63b06
> > --- /dev/null
> > +++ b/support/dependencies/check-host-cmake.sh
> > @@ -0,0 +1,39 @@
> > +#!/bin/sh
> > +
> > +candidate="${1}"
> > +version_min="${2}"
> > +
> > +major_min="${version_min%.*}"
> > +minor_min="${version_min#*.}"
> > +
> > +cmake=`which ${candidate}`
> > +if [ ! -x "${cmake}" ]; then
> > +    # echo nothing: no suitable cmake found
> > +    exit 1
> > +fi
> > +
> > +# Extract version X.Y from versions in the form X.Y or X.Y.Z
> > +# with X, Y and Z numbers with one or more digits each, e.g.
> > +#   3.2     -> 3.2
> > +#   3.2.3   -> 3.2
> > +#   3.2.42  -> 3.2
> > +#   3.10    -> 3.10
> > +#   3.10.4  -> 3.10
> > +#   3.10.42 -> 3.10
> > +version="$(${cmake} --version \
> > +           |sed -r -e '/.* ([[:digit:]]+\.[[:digit:]]+).*$/!d;' \
> > +                   -e 's//\1/'
> > +          )"
> > +major="${version%.*}"
> > +minor="${version#*.}"
> 
> You removed the 'head -n1' in the pipe.

Indeed, but look at the sed script (which is not that complicated): all
lines that do not match the pattern are ignored.

        |sed -r -e '/.* ([[:digit:]]+\.[[:digit:]]+).*$/!d;' \
                                               Here ----^

"!d" means "if no match, delete line".

Then the next expression is only aplied on matching lines, and "\1"
refers to the ()-match, which is the version string.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
