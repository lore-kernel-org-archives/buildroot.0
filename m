From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 27 Nov 2014 18:58:20 +0100
Subject: [Buildroot] [PATCH RFC] Makefile: from a defconfig file,
 point to the corresponding board/ entry
In-Reply-To: <CAAXf6LU7cF0+R=7T6RE4M3efW52a1v+JyqkjgOEJ3ZXsV+dm8g@mail.gmail.com>
References: <1417043635-9055-1-git-send-email-yann.morin.1998@free.fr>
 <CAAXf6LU7cF0+R=7T6RE4M3efW52a1v+JyqkjgOEJ3ZXsV+dm8g@mail.gmail.com>
Message-ID: <20141127175819.GC3900@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-11-27 11:37 +0100, Thomas De Schampheleire spake thusly:
> On Thu, Nov 27, 2014 at 12:13 AM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > This is an RFC!
> >
> > When configuring Buildroot from a defconfig files, soem users complain
> > it is non-obvious that the corresponding board documentattion is to be
> > found in the board/ sub-directory.
> >
> > So, deduce the board name from the defconfig file, look for a similarly
> > named sub-dir of board (first level only), and if such a directory
> > exists, print a message stating extra documentation for that board is to
> > be found there.
> >
> > This works for only 5 of our 69 defconfig files, because:
> >
> >   - some boards docs are in sub-sub-dirs (count raises to 11 in that
> >     case);
> >
> >   - most boards dirs are not directly named after the defconfig file,
> >     like:
> >         board/olimex/imx233_olinuxino/
> >         configs/olimex_imx233_olinuxino_defconfig
> >
> > So, we could maybe improve this by renaming and moving our boards docs
> > so there is a one-to-one mapping from the board directory to the
> > corresponding defconfig file (but not necessarily the other way around).
> 
> 
> I would like to point out that automatically detecting the board
> directory is fragile, because
> - the mapping may not be obvious, as you already found
> - there may be more than one 'board' directory. For example, a typical
> setup when having multiple more-or-less-related projects in a company
> is to have several layers of post-build/rootfs-overlay/..., for
> example:
> board/company/common/...
> board/company/project1/...
> board/company/project2/...
> In the defconfigs of both project1 and project2, the post-build and
> rootfs-overlay settings would contain multiple entries, being
> common+project1 and common+project2 respectively.
> There may even be more levels than that, for example (in my case)
> common, architecture-specific, project-family-specific,
> board-specific.

Well, I was not even thinking about company-specific stuff (rather, I
did not consider them _on purpose_).

I was mostly trying to addres the newcomer to Buildroot, and help him
find the documentation corresponding to the defconfig he is using.

We could really do better, as someone explained on IRC:

  - the manual does not even hint at running "make foo-defconfig" at
    all (only in the part targeted at the developer), but directly
    instructs to run "make menconfig" in the quick-start section. Adding
    a blurb that says there are pre-defined defconfig files would be
    nice.

  - the documentation for a defconfig file is not ostensibly exposed to
    the user of a defconfig file.

That's what I'm trying to address with this patch. And I think cattering
for company stuff is not a high priority : surely the boards docs are
hosted somewhere else than in the Buildroot (or br2-external) tree; and
if it is, then users (in that company!) know where to find it (or there
is anotgher problem, that is not related to the tool).

Of course, if we can find a way to get it to work for comany stuff
without too much trouble, that's fine. ;-)

Maybe I should have made my intentions clearer in the commit log, my
bad, and the patch was just quickly hacked in just under 5 minutes (and
is broken for br2-exteral anyway).

But anyway, this is just an RFC, and I got what I asked for: comments.
I'll consider these when reworking the patch. Thanks all! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
