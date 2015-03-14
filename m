From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 14 Mar 2015 17:26:57 +0100
Subject: [Buildroot] [V2 2/2] graph-depends: add an option
 --stop-on-virtual
In-Reply-To: <20150309211508.39c2a0ac@free-electrons.com>
References: <1420295353-8065-1-git-send-email-francois.perrad@gadz.org>
 <1420295353-8065-2-git-send-email-francois.perrad@gadz.org>
 <20150308221843.2d6fbf7d@free-electrons.com>
 <CAB0FRsvxotGUKRC2q7R_JKPCajZb68X3r2qnjciehP-cqXENBg@mail.gmail.com>
 <20150309211508.39c2a0ac@free-electrons.com>
Message-ID: <20150314162657.GA4009@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Fran?ois, All,

On 2015-03-09 21:15 +0100, Thomas Petazzoni spake thusly:
> On Mon, 9 Mar 2015 20:32:16 +0100, Fran?ois Perrad wrote:
> > The current option --depth seems to be only a workaround against an
> > infinite recursion when the graph has a cycle.
> 
> Well, I don't really think --depth is meant to avoid infinite
> recursion: I don't think it's possible to have infinite recursion since
> we can't have cyclic dependencies in Buildroot.

No, -depth was never meant to be a stop-gap for recursion: we can *not*
have recursive depedencies.

What I introduced --depth for, is because often only the first few level
of dependencies of a given package are of interest. --depth is
essentially meant for use when graphing the dependencies of a single
package, like so:

    BR2_GRAPH_DEPS_OPTS='--depth 2' make foo-graph-depends

that would limit graphinh the dependencies of 'foo' down to two levels.

> > But at this time, we haven't found the good way (or the good use
> > cases) to limit the size of the graph.
> 
> I believe being able to exclude certain packages (and their dependency
> tree) would be useful.

What about something like:

    BR2_GRAPH_DEPS_OPTS='--stop-on PKGS' make graph-depends

where 'PKGS' would be a comma-separated list of packages, possibly a
glob or regexp, or even the keyword 'virtual' to stop on virtual
packages?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
