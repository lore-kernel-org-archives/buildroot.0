From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 8 Jul 2018 14:42:52 +0200
Subject: [Buildroot] [PATCH 50/50 v2] support/scripts: don't draw most
 of busybox' dependencies
In-Reply-To: <7bdd1aa7-3e94-7e02-a45c-9dfac841b190@mind.be>
References: <cover.1531043163.git.yann.morin.1998@free.fr>
 <7d4417e280d8c1db48496f8e35895c4819cae957.1531043163.git.yann.morin.1998@free.fr>
 <7bdd1aa7-3e94-7e02-a45c-9dfac841b190@mind.be>
Message-ID: <20180708124252.GB7163@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2018-07-08 13:25 +0200, Arnout Vandecappelle spake thusly:
> On 08-07-18 11:46, Yann E. MORIN wrote:
> > Since most dependencies of busybox' are there to guarantee that busybox
> > does not install applets that are already provided by other packages,
> > they are not really functional dependencies, and mostly clutter the
> > dependency graph.
> 
>  The thing is, they still are dependencies. I often use graph-depends to do a
> poor man's TLPB by starting builds of individual packages in separate shells,
> but then I first have to check that their dependency chains are non-overlapping.
> If you're going to hide some dependencies, that's not going to work any more...
> 
>  I also sometimes use it to understand why make decides to execute things in a
> particular order. Again, hiding dependencies doesn't help there.
> 
>  On the other hand, it's like the toolchain: you know everything depends on the
> toolchain, and similarly you know that buildroot depends on everything. So maybe
> it's not that bad.

Well, I like the depednency graph to also represent "why is the foo
package enabled, when I don;t want it? Oh, it is a dependnecy of bar,
I should disable bar then." In the case of busybox, that is wrong:
busybox does not need those packages, so graphing such dependency can
be misleading...

But I don;t care much, so I marked it as rejected.

Regards,
Yann E. MORIN.

> > 
> > Only the dependencies on libraries are interesting, so that is all we
> > keep.
> > 
> > Even though that function is only called with pkg set to 'busybox', we
> > still pass it as an argument, for symetry with the other functions that
> > removes the dependencies of a package.
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
> > Cc: Carlos Santos <casantos@datacom.com.br>
> > 
> > ---
> > Changes v1 -> v2:
> >   - carry tag from Matt
> >   - clarify linux-pam case  (Carlos)
> > ---
> >  support/scripts/graph-depends | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> > 
> > diff --git a/support/scripts/graph-depends b/support/scripts/graph-depends
> > index 621e603278..0a3bc11be7 100755
> > --- a/support/scripts/graph-depends
> > +++ b/support/scripts/graph-depends
> > @@ -181,6 +181,15 @@ def remove_mandatory_deps(pkg, deps):
> >      return [p for p in deps[pkg] if p not in ['toolchain', 'skeleton']]
> >  
> >  
> > +# This function removes all dependencies of busybox, except its
> > +# dependencies on libraries (of which libpam, from linux-pam) and
> > +# host-pkgconf.
> > +def remove_busybox_deps(pkg, deps):
> > +    busybox_dep_whitelist = ['linux-pam', 'host-pkgconf']
> > +    return [p for p in deps[pkg]
> > +            if p.startswith('lib') or p in busybox_dep_whitelist]
> 
>  This feels horribly fragile to me...
> 
> 
>  I would feel more comfortable if we would introduce _INSTALL_DEPENDENCIES, as
> discussed in v1 of the series, and then simply exclude the _INSTALL_DEPENDENCIES
> from the graph. Or maybe even add a graph-depends option to do that.
> 
> 
>  Note: I have *not* marked this patch as changes requested, since it's actually
> good to go, except that I have more fundamental concerns about it.
> 
>  Regards,
>  Arnout
> 
> 
> > +
> > +
> >  # This function will check that there is no loop in the dependency chain
> >  # As a side effect, it builds up the dependency cache.
> >  def check_circular_deps(deps):
> > @@ -211,6 +220,8 @@ def check_circular_deps(deps):
> >  # This functions trims down the dependency list of all packages.
> >  # It applies in sequence all the dependency-elimination methods.
> >  def remove_extra_deps(deps, transitive):
> > +    if 'busybox' in list(deps.keys()):
> > +        deps['busybox'] = remove_busybox_deps('busybox', deps)
> >      for pkg in list(deps.keys()):
> >          if not pkg == 'all':
> >              deps[pkg] = remove_mandatory_deps(pkg, deps)
> > 
> 
> -- 
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
