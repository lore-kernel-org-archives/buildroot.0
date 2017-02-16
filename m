From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 16 Feb 2017 18:21:11 +0100
Subject: [Buildroot] [PATCH 1/7 v4] docs/manual: document the test-pkg
 script
In-Reply-To: <20170215232547.24a6cb92@free-electrons.com>
References: <cover.1487195062.git.yann.morin.1998@free.fr>
 <85dd7875a12e1ceb9dab2f006dd34a8259836729.1487195062.git.yann.morin.1998@free.fr>
 <20170215232547.24a6cb92@free-electrons.com>
Message-ID: <20170216172111.GA4986@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2017-02-15 23:25 +0100, Thomas Petazzoni spake thusly:
> On Wed, 15 Feb 2017 22:44:29 +0100, Yann E. MORIN wrote:
[--SNIP--]
> > +The results mean:
> > +
> > +* `OK`: the build was successful
> > +* `SKIPPED`: one or more config options from the config snippet were
> > +  missing in the resulting configuration; inspect the file +config.missing+
> > +  in the output build directory (+~/br-test-pkg/TOOLCHAIN_NAME/+ by
> > +  default)
> 
> I would expand this explanation a bit here. As you wrote it might seem
> like it is not normal for a toolchain to be skipped. What about instead:
> 
>  `SKIPPED`: one or more configuration options listed in the config
>  snipped were not present in the final configuration. This is due to
>  options having dependencies not satisfied by the toolchain, such as
>  for example a package that +depends on BR2_USE_MMU+ with a noMMU
>  toolchain.

Very good, thanks! :-)

I'll keep the part that says where such missing options are stored,
though.

> > +When there are failures, you can just re-run the script with the same
> > +options (after you fixed your package); the script will attempt to re-build
> > +the package for all toolchains, without the need to re-build all the
> > +dependencies of that package (but it requires the +-p+ optiopn, see below).
> 
> "see below" ? but there's nothing below.

Doh... I initially listed all the options in a paragraph below, but
decided against, because it was duplicating the help text of the script
and instead just instructed the user to run the script with -h.

And I forgot to remove that blurb here. Will fix.

Actually, I think that running the script without specifying the package
is incorrect. One can not expect to restart correctly in this case.

For example, say package A has a dependency on package B, but the user
forgot to add it in A_DEPEDENCIES. The buildsystem of the package if
foobared enough that it incorrectly checks at configure time, but uses
configure-time variables to link with a lib (this situation does happen).

The build fails, the user fixes the dependencies, and rstart the build.
But then, configure is not run, and the build still fails, which leaves
the user in the dark...

While specifying the package ensures the build wil start afresh for that
package thanks to the dirclean.

Thoughts?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
