From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Oct 2016 23:56:09 +0200
Subject: [Buildroot] [PATCH] core/graph-depends: add option to graph
 reverse dependencies
In-Reply-To: <20161025230434.2a2a69b1@free-electrons.com>
References: <1477236531-16771-1-git-send-email-yann.morin.1998@free.fr>
 <1477243184-32610-1-git-send-email-yann.morin.1998@free.fr>
 <20161025230434.2a2a69b1@free-electrons.com>
Message-ID: <20161025215609.GA3450@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-10-25 23:04 +0200, Thomas Petazzoni spake thusly:
> On Sun, 23 Oct 2016 19:19:44 +0200, Yann E. MORIN wrote:
> > Now that we can dump the reverse dependencies of a package, add the
> > ability to graph those.
[--SNIP--]
> I've applied, thanks. However, our logic that gets rid of "redundant"
> dependencies also has the consequence of creating some graphs that are
> quite weird.
> 
> I tested a configuration where I enabled python and libglib2, both of
> which depend on libffi. When you do:
> 
> $ make libffi-show-rdepends
> 
> You get as expected "libglib2 python"
> 
> However, when you do
> 
> $ make libffi-graph-rdepends
> 
> The resulting graph is a bit weird. You would expect something like
> this:
> 
>            libffi
>        ------/ \------
>        |             |
>     libglib2       python

make BR2_GRAPH_DEPS_OPTS='--transitive -d1' libffi-graph-rdepends
would give you the expected graph.

But using options is not what you want. ;-)

> But instead, what you get is:
> 
>   libffi
>     /\
>     ||
>    python
>     /\
>     ||
>  util-linux
>     /\
>     ||
>   libglib2
> 
> Because indeed libglib2 depends on util-linux, and util-linux can
> optionally build python bindings and therefore depend on python.
> 
> Not sure what we can do about this: keeping all dependencies was really
> creating huge and unreadable graphs.

Well, that's the crux of the issue: keeping the whole graph is quickly
unworkable with even non-complex configurations.

Maybe what we should stress is that the graph-depends and graph-rdepends
display the build-order dependencies.

But yes, the apparent discrepancies between foo-show-rdepends and
foo-graph-rdepends can look weird on first sight, but both are correct.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
