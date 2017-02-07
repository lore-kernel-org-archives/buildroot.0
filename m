From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Feb 2017 10:33:03 +0100
Subject: [Buildroot] [PATCH] support/scripts: add script to test a
	package
In-Reply-To: <508724e1-501e-4e44-6817-55bcdbf2f8ee@lucaceresoli.net>
References: <1486404173-31700-1-git-send-email-yann.morin.1998@free.fr>
 <508724e1-501e-4e44-6817-55bcdbf2f8ee@lucaceresoli.net>
Message-ID: <20170207093303.GB3578@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2017-02-06 21:40 +0100, Luca Ceresoli spake thusly:
> On 06/02/2017 19:02, Yann E. MORIN wrote:
[--SNIP--]
> > +    printf ", olddefconfig"
> > +    if ! make O="${dir}" olddefconfig >/dev/null 2>&1; then
> > +        printf ": FAILED\n"
> > +        return
> > +    fi
> > +    while read line; do
> > +        if ! grep "^${line}\$" "${dir}/.config" >/dev/null 2>&1; then
> 
> I suggest removing the redirects and using 'grep -q' here.

grep -q is not POSIX. ;-)

> > +    printf ", source"
> > +    if ! make O=${dir} source >> ${dir}/logfile 2>&1; then
> > +        printf ": FAILED\n"
> > +        return
> > +    fi
> 
> Splitting the source step from the build step is nice since it clearly
> separated download-related issues (wrong URL, network down...) from
> build errors.
> 
> But as discussed IRL it also means we download the ACTUAL_SOURCE files,
> which means hundreds of megabytes with external toolchains. Possible
> solutions:
> 
>  * remove the "make source" step and let "make ${pkg}" download only the
>    sources that are really needed for building
>  * remove the "make source" step as above, but only if ${pkg} is empty
>  * add a "source-only-filed-needed-for-build" :) target and use that

I'll remove the separate source action, it makes it simpler.

> > +help() {
> > +    cat <<_EOF_
> > +${my_name}: test that a package builds with various toolchains and archs
> > +
> > +${my_name} will test-build a package (as specified in a .config snippet)
> > +against various toolchains on different architectures.
> > +
> > +The list of toolchains is retrieved from Buidlroot autobuilders.
> 
> Buidlroot -> Buildroot

Buidlroot sounds more like Beetlejuice. ;-)

> Also why not appending "available at ${TOOLCHAINS_BASE_URL}"?

Can do.

> > +    -p PKG, --package PKG
> > +        Test-build the package PKG.
> 
> Add: 'if not specified, runs "make" without a target'

Can do.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
