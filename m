From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 11 Feb 2017 23:24:11 +0100
Subject: [Buildroot] [PATCH 5/6] support/test-pkg: add option to use an
 alternate list of toolchains
In-Reply-To: <CAAXf6LUziDRqmGPj5OOToOUZN8Ynb+VKkL5VEyyWhjtx3by9GA@mail.gmail.com>
References: <cover.1486584734.git.yann.morin.1998@free.fr>
 <03ebcd068e7602bfbb059ed2c6759c8ba03819e9.1486584734.git.yann.morin.1998@free.fr>
 <CAAXf6LUziDRqmGPj5OOToOUZN8Ynb+VKkL5VEyyWhjtx3by9GA@mail.gmail.com>
Message-ID: <20170211222411.GE20146@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas DS, All,

On 2017-02-11 20:53 +0100, Thomas De Schampheleire spake thusly:
> On Wed, Feb 8, 2017 at 9:15 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > For now, testing a package requires network access. However, there are
> > situations where everything is already cached locally (especially the
> > toolchains tarballs) and network is not available (e.g. in the train,
> > travelling back from FOSDEM...)
> >
> > Alternatively, one may also want to test against a subset of the default
> > toolchains (e.g. the ones known to have a specific issue).
> >
> > Add an option to use an alternate URL, which can be remote or a path to
> > a local file.
[--SNIP--]
> > +    # Transform local paths to URI to make curl happy and simplify
> > +    # our code path
> > +    case "${url}" in
> > +    (/*)    url="file://${url}";;
> > +    esac
> > +
> >      # Extract the URLs of the toolchains; drop internal toolchains
> >      # E.g.: http://server/path/to/name.config,arch,libc
> >      #  -->  http://server/path/to/name.config
> > -    toolchains=( $( curl -s "${TOOLCHAINS_URL}" \
> > +    toolchains=( $( curl -s "${url}" \
> >                      |sed -r -e 's/,.*//; /internal/d;' \
> >                      |if [ ${random} -gt 0 ]; then \
> >                          sort -R |head -n ${random}
> > @@ -102,6 +112,12 @@ build_one() {
> >      local pkg="${4}"
> >      local toolchain line skip
> >
> > +    # Transform local paths to URI to make curl happy and simplify
> > +    # our code path
> > +    case "${url}" in
> > +    (/*)    url="file://${url}";;
> > +    esac
> 
> Some duplication that could be extracted to a function?

I wondered as much, too, but this is really trivial code. Also, if this
gets to be a function, then that would have to be used using shell
expansion, like:

    url="$(canonical_url "${url}")"

which does not look very nice either.

So I believe duplication is acceptable in this case.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
