From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Feb 2017 10:52:39 +0100
Subject: [Buildroot] [PATCH] support/scripts: add script to test a
	package
In-Reply-To: <CAAXf6LVfFMFd4fSVrn6EEkzszWPs4XmmEtBWAUX8kJeZskZc-g@mail.gmail.com>
References: <1486404173-31700-1-git-send-email-yann.morin.1998@free.fr>
 <CAAXf6LVfFMFd4fSVrn6EEkzszWPs4XmmEtBWAUX8kJeZskZc-g@mail.gmail.com>
Message-ID: <20170207095239.GC3578@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas DS, All,

On 2017-02-06 21:44 +0100, Thomas De Schampheleire spake thusly:
> On Mon, Feb 6, 2017 at 7:02 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > This script helps in testing that a pacakge builds fine on a wide range
> 
> package

Meh... ;-)

> > +        printf "error: no toolchain found (networking issue?)\n" 2>&1; exit 1
> What is the purpose of 2>&1 ? Don't you mean >&2 , i.e. send the print
> command to stderr ?

Yup...

> > +    local tc="${2}"
> Pretty cryptic, 'tc' for 'toolchain, IMO.
[--SNIP--]
> > +    if ! curl -s "${TOOLCHAINS_BASE_URL}/${toolchain}.config" >"${dir}/.config"; then
> Here you use 'toolchain' iso 'tc', which is the loop variable used
> before calling this function. This works 'by luck', but is not the
> intended design.

Fixed.

> > +    printf ", olddefconfig"
> > +    if ! make O="${dir}" olddefconfig >/dev/null 2>&1; then
> > +        printf ": FAILED\n"
> > +        return
> > +    fi
> > +    while read line; do
> > +        if ! grep "^${line}\$" "${dir}/.config" >/dev/null 2>&1; then
> > +            printf ", SKIPPED\n"
> > +            return
> > +        fi
> > +    done <"${cfg}"
> 
> I think a brief comment of what is happening before each block would be useful.
> What is happening here? You try to set the config provided by the user
> and then check if it worked?

Would the following be OK? ;-)

    We want all the options from the snippet to be present as-is (=y or
    not set) in the actual .config; if one of them is not, it means some
    dependency from the toolchain or arch is not available, in which
    case this config is untestable and we skip it.

> If that understanding is correct,
> couldn't the 'SKIPPED' message not be more verbose in explaining _why_
> it was skipped? A short explanation, and the line/config option that
> caused this skip.

I'd like to keep the output as simple as possible. The missing stuff can
be stored in a file in the output dir.

> > +${my_name}: test that a package builds with various toolchains and archs
> 
> I would start discussing about 'archs' vs 'arches' so perhaps we
> should just use 'architectures'.

OK.

> > +${my_name} will test-build a package (as specified in a .config snippet)
> > +against various toolchains on different architectures.
> > +
> > +The list of toolchains is retrieved from Buidlroot autobuilders.
> > +
> > +In case failures are noticed, you have the opportunity to fix the issue
> > +and relaunch the test.
> 
> I find it a bit odd to 'get the opportunity to fix', isn't this
> obvious that if it failed you need to fix and retest?

I'll try to rephrase that.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
