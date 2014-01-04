From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 4 Jan 2014 18:01:58 +0100
Subject: [Buildroot] [PATCH 4/5] fs/custom: add support for squashfs
In-Reply-To: <CAGduivx8F02CaJ52nnv6pFKPTJ_4LCBAKymu0RQeoBhtrC8NOg@mail.gmail.com>
References: <cover.1388768519.git.yann.morin.1998@free.fr>
 <f19557ea778ede9bf0de8be578a2fdd6cdd1785c.1388768519.git.yann.morin.1998@free.fr>
 <CAGduivx8F02CaJ52nnv6pFKPTJ_4LCBAKymu0RQeoBhtrC8NOg@mail.gmail.com>
Message-ID: <20140104170157.GA3417@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

Thanks for the review! :-)

On 2014-01-04 17:43 +0100, Maxime Hadjinlian spake thusly:
> On Fri, Jan 3, 2014 at 6:19 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Ryan Barnett <rjbarnet@rockwellcollins.com>
> > ---
> >  docs/manual/partition-layout.txt | 11 ++++++++++-
> >  fs/custom/fs/squashfs            | 19 +++++++++++++++++++
> >  2 files changed, 29 insertions(+), 1 deletion(-)
> >  create mode 100644 fs/custom/fs/squashfs
> >
[--SNIP--]
> > diff --git a/fs/custom/fs/squashfs b/fs/custom/fs/squashfs
> > new file mode 100644
> > index 0000000..132d3ef
> > --- /dev/null
> > +++ b/fs/custom/fs/squashfs
> > @@ -0,0 +1,19 @@
> > +# Create a squashfs filesystem
> > +
> > +#-----------------------------------------------------------------------------
> > +DEPENDS+=( squashfs )
> > +
> > +#-----------------------------------------------------------------------------
> > +do_image() {
> > +    local root_dir="${1}"
> > +    local img="${2}"
> > +    local -a fs_opts
> > +
> > +    fs_opts+=( -no-progress -noappend )
> > +    [ -z "${squashfs_comp}"  ] || fs_opts+=( -comp "${squashfs_comp}" )
> It just a question of taste, but I really do prefer to read something like:
> [ -n "${squashfs_comp}"  ] && fs_opts+=( -comp "${squashfs_comp}" )
> But that's just a personal taste.

The genimages script runs with 'set -e -E', which means to exit as soon
as one command exits with a !0 exit code.

If we do as you suggested:
    [ -n "${squashfs_comp}"  ] && fs_opts+=( -comp "${squashfs_comp}" )

and "${squashfs_comp}" is empty, then the test is false, and the whole
list also is false, which amkes the shell error out.

If we do the way I did:
    [ -z "${squashfs_comp}"  ] || fs_opts+=( -comp "${squashfs_comp}" )

then it ensures that the list is never false, and thus there is no
error.

If this construct is not welcome, then we have to use if...fi blocks
instead:
    if [ -n "${squashfs_comp}" ]; then
        fs_opts+=( -comp "${squashfs_comp}" )
    fi

This is a bit more verbose, but maybe more explicit. I prefer concise,
since I know why it is written this way, but I don't really care.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
