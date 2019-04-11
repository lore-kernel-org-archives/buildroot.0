From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Apr 2019 23:20:02 +0200
Subject: [Buildroot] [PATCH 00/10] infra: add solution to dump metadata
 from packages (branch yem/misc)
In-Reply-To: <20190411192651.5196cd1c@windsurf.home>
References: <cover.1554637858.git.yann.morin.1998@free.fr>
 <20190411192651.5196cd1c@windsurf.home>
Message-ID: <20190411212002.GG2539@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2019-04-11 19:26 +0200, Thomas Petazzoni spake thusly:
> On Sun,  7 Apr 2019 13:51:06 +0200
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> 
> > This series is a proposal to allow extracting metadata about packages,
> > in a way that makes it reusable for tooling outside of Buildroot, that
> > is both reliable and extendable, without causing too much burden on
> > Buildroot own infrastructure.
> 
> Overall, I am quite happy with the general idea (as we have already
> discussed). It allows to extract a lot of information about the
> packages, in a format that is easily parseable.
> 
> My small annoyance is that we start to have some overlap between the
> following mechanisms:
> 
>  - The "make printvars" mechanism, which essentially already allows to
>    dump the metadata of all packages. Admittedly, in a format that is a
>    lot less nice. I think this overlap is OK, since "make printvars" is
>    mainly intended as a debugging mechanism, not so much as a real tool
>    whose output can be parsed. The new JSON stuff could presumably be
>    used as a replacement to "printvars" for people who need to
>    currently parse the "printvars" output.

I don't see printvars and show-info to compete against each other.
Instead, printvars is indeed more about debugging Buildroot, or poking
at internals. That really what it is: dumping Buildroot internals; there
is no guarantee about its stability, i.e. it is not an API of some sorts.

show-info, on the other hand, really exposes metadata so that it can be
consumed by external tooling provided by the user, and for which we
actually want to expose that data in a reliable and stable way.

>  - The "make legal-info" mechanism, which also outputs some metadata
>    about the packages.

When I wrote show-info, I realy pondered whether to expose the licensing
information or not, because of legal-info, and maybe I should have
refrained from doing so, with it maybe as an addition in the future.

legal-info does not print much information, though. It does collect that
information and makes it available for the user in the form of a
directory with source code, license files, and so on...

But I don't see putting the source code, the license texts and all the
content of legal-info/ into the JSON output, while the license list is
toally trivial.

I also pondered adding the licenses for the dependencies in
foo-show-info, but I did not do so, on the assumption that users who
want to make use of it would anyway have to write their JSON extractor,
in which case they would be able to very easily generate the
licenses-of-dependencies.

> I'm not at all saying that we shouldn't merge this JSON output, I just
> wanted to point out the different ways that already exist to extract
> some package metadata out of Buildroot.

Well, my idea wuld maybe to actually phase-out those rules, or at least
base them on this new JSON output.

Heck, even graph-depends could use that instead of the recently
introduced show-dependency-tree, and this is what I was going to do
before the release, so that show-dependency-tree never ever gets into
a release.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
