From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 4 Jan 2019 18:51:50 +0100
Subject: [Buildroot] [PATCH v3] core/pkg-generic: only save latest
 package list
In-Reply-To: <25b04dd9-68de-9f1e-c830-fa6e86cb6d68@green-communications.fr>
References: <20180501132629.4a4831bb.john@metanate.com>
 <20180501122841.13818-1-john@metanate.com>
 <20190104131250.GA19623@scaer>
 <25b04dd9-68de-9f1e-c830-fa6e86cb6d68@green-communications.fr>
Message-ID: <20190104175150.GD19623@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Nicolas, All,

On 2019-01-04 16:30 +0100, Nicolas Cavallari spake thusly:
> On 04/01/2019 14:12, Yann E. MORIN wrote:
> > On 2018-05-01 13:28 +0100, John Keeping spake thusly:
> >> When rebuilding a package, simply appending the package's file list to
> >> the global list means that the package list grows for every rebuild, as
> > 
> > Is there a particular issue with those three files growing on rebuild?
> 
> The problem is that not only does this makes the file list grow, it also
> adds loads of incorrect data: when rebuilding a package that was
> compiled early, all files modified since the package was built will be
> included. So the list will include files that have been installed by
> this package and all packages compiled after it. For some core packages,
> this usually means "almost everything".

Sorry, but I don't understand what you mean.

Whether you install or reinstall a package, there is no guarantte on the
order of the other packages it is unrelated to: they may very well be
built before or after the package.

So yes, when you re-install a package, the file list contains all files
installed before it, but they are not assigned to this package, with one
exception: the .la files, which are all assigned to the latest package
installed. And in any case, even if you were not re-installing your
package, but it was the latest to be built, then you'd still have the
issue that the .la files would all be accounted to for your package.

But, two things;
  - this only accounts for .la files in staging, not in target/, and
  - I have already fixed that locally and will send the patch shortly.

Still, I am not usre I understood your problem anyway, so can you
explain in more details, and provide an easy reproducing sequence (based
on the git master)?

> > Compared to the rest of the build tree, those three files have very
> > small sizes in fact, and if they eventually end up big enough to be a
> > substantial part of the build tree, it's most probably time for a clean
> > build from scratch anyway, no?
> 
> Having a big list would not a problem if nobody used the content of this
> file, but some tools scans it and use it to check files. After many
> recompiling, I remember having problems with one tool taking a
> considerable amount of time for each build because of all the duplicates
> in the list. But i don't remember which tool it was.

Are you talking about a tool in Buildroot? Can you try to provide more
details, please? Are you still able to reproduce the slowness on the
current git master?

The only two tools that make use of the packages-file-list.txt are
check-uniq-files (which actually checks that files are not installed by
two or more packages), and support/scripts/size-stats, which graphs a
pie-chart representing the size contribution of each package to the
content of target/. The former is always run at the end of the build, in
the target-finalize step, while the latter is only run on-demand.

They both are written in python, and check-uniq-files is pretty trivial
and lightwieght, and in my experience, very fast.

And in any case, if the list becomes *so big* that reading it takes an
insane amount of time, then probably your host/ staging/ and target/
directories are in a state that is so far from being clean that you
probably should condider a rebuild from scratch at that point.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
