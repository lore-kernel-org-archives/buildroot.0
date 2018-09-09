From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Sep 2018 09:36:16 +0200
Subject: [Buildroot] [PATCH v5 0/3] Add tainting support to buildroot
In-Reply-To: <1536186133-9933-1-git-send-email-angelo.compagnucci@gmail.com>
References: <1536186133-9933-1-git-send-email-angelo.compagnucci@gmail.com>
Message-ID: <20180909073616.GC2841@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, Thomas, All,

On 2018-09-06 00:22 +0200, Angelo Compagnucci spake thusly:
> Packages that need to resolve dependencies internally
> and use a package manager would harm the reproducibility
> of a build, moreover they escape the legal infrastructure
> not giving enough informations on licensing.

So, I am not in favour of having support for such package managers in
Buildroot, to begin with.

As you say, the reproducibility of a build, as offered by Buildroot, is
really a very important point. In my opinion, reproducibility is even
paramount. Whatever gets in the way should be banned.

> This patch adds a tainting mechanism in the form of a
> variable FOO_TAINTS that can be used to signal that
> a package harms the reproducibility or licensing under
> certain conditions.

When I read that, it comes that the tainting mechanism serves two
purposes: first, mark (non-)reproducibility, and second, mark incorrect
and/or incomplete licensing information.

This does not sound nice to me.

For the licensing information, I would just rely on the existing
licensing infra, and be done with it, i.e. add :

    ifneq ($(FOO_NON_REPRODUCIBLE_EXTERNAL_DATA),)
    FOO_LICENSE += Unknown (non reproducible external data)
    endif

I.e., no need for the tainting mechanism to represent the licensing
problem, as we already have what is needed to cover it.

Now, what would be the purpose for this "tainted" flag? I understand
clearly what it provides, indeed, technically, but what would it serve
to the user?

If I were to use a non-reproduible set of data ffor;, say, nodejs, then
I know that this is not handled by Buildroot, and thus it is not
reproducible. I don't need to be told it, escept maybe as a note in the
manual: "If you use external data from npm/pypi, cpan, whatnot, then
your build is not reproducible; that will be hurting kittens."

Instead, I am more in favour of packaging such external stuff as
Buildroot packages, like we've been doing for erlang, lua, perl, and
python, even if we have to add new infrastructures for thos (npm, I'm
looking at you!)

Besides, you're missing a big piece of potential non-reproducibility
source: br2-external trees. If we ever were to have such a tainting
mechanism, we should mark the build as tainted as soon as there is a
br2-external tree.

Ditto as soon as we have a FOO_OVERRIDE_SRCDIR set, which should mark
the build as tainted. Except we already use FOO_OVERRIDE_SRCDIR when
FOO_SITE = local...

> This opens the door to include per language dependency
> managers in buildroot.

Instead, why not provide a helper script (or enhance the existing ones
if need be), than generated buildroot packages for those external packge
managers?

Sorry, this is not the technical review you may have expected. Instead,
it is a position statement on my part.

Regards,
Yann E. MORIN.

> Angelo Compagnucci (3):
>   Makefile: add tainting support
>   docs/manual: adding infos about tainting
>   package/nodejs: taint the build on external modules
> 
>  Makefile                                | 10 ++++++++++
>  docs/manual/adding-packages-generic.txt |  6 ++++++
>  docs/manual/legal-notice.txt            | 12 ++++++++++++
>  package/nodejs/nodejs.mk                |  1 +
>  package/pkg-generic.mk                  | 15 +++++++++++++++
>  5 files changed, 44 insertions(+)
> 
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
