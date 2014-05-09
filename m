From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 9 May 2014 16:38:30 +0200
Subject: [Buildroot] [PATCH] graphs: add option to remove transitive
 dependencies in dependency graph
In-Reply-To: <CAHXCMMLkk-0FxgrcExWQukmpZcwC4qELaRexRYDGnapyzPECFQ@mail.gmail.com>
References: <1399416267-16009-1-git-send-email-yann.morin.1998@free.fr>
 <20140509095224.GB3173@free.fr> <877g5vb7bb.fsf@dell.be.48ers.dk>
 <20140509102029.GC3173@free.fr>
 <CAHXCMMK9Y-bReA=vij5ti0ZKeehXEx45nsw8H-+G01LUcF1RMw@mail.gmail.com>
 <20140509133441.GE3173@free.fr>
 <CAHXCMMLkk-0FxgrcExWQukmpZcwC4qELaRexRYDGnapyzPECFQ@mail.gmail.com>
Message-ID: <20140509143830.GF3173@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-05-09 16:09 +0200, Samuel Martin spake thusly:
> On Fri, May 9, 2014 at 3:34 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > too) as make targets so it was easier for users to generate the graphs
> > rather than directly call the scripts (since the scripts could even
> > reside in another dir when building out-of-tree, and it would be more
> > complex to reach for the scripts).
> 
> Arf! I forgot this.
> 
> In this case, I would do:
> - to get the default graph:
>   make foo-graph-depends
> - to get a customized graph:
>   make foo-graph-depends BR2_GRAPH_DEPS_OPTS="..."

A single variable is not enough, since we have options:

  - for support/scripts/graph-depends: maximum depth, transitive deps or
    not

  - the 'dot' utilities: draw top-down or left-right, and so on...

So either greaph-depends has to understand a subset (or all) of dot's
options (Eeek!), or we offer two variables.

> And I'd expect to find some help somewhere in the doc to know what are
> the supported options,

Already in the manual, section 3.5, "Daily use" and sub-sections:

    3.5.7. Graphing the dependencies between packages
    http://buildroot.net/downloads/manual/manual.html#_graphing_the_dependencies_between_packages

    3.5.8. Graphing the build duration
    http://buildroot.net/downloads/manual/manual.html#_graphing_the_build_duration

    3.5.5. Environment variables
    http://buildroot.net/downloads/manual/manual.html#env-vars

> or how to get the graph-depends help, so via
> the manual or in the help message of the BR2_GRAPH_DEPS_OPTS kconfig
> entry.

We already document the mere existence of graph-build, graph-depends and
PKG-graph-depends inthe output of make help:

    <package>-graph-depends    - generate graph of the dependency tree
                                 for package
    graph-build            - generate graphs of the build times
    graph-depends          - generate graph of the dependency tree

But the variables are only documented in the manual (see above.)

> So, in the end, the call to graph-depends script would just be:
>   $(TOPDIR)/support/scripts/graph-depends $(BR2_GRAPH_DEPS_OPTS)
> or:
>   $(TOPDIR)/support/scripts/graph-depends -p $(1) $(BR2_GRAPH_DEPS_OPTS)

Not really, it currently is (roughly):

    $(TOPDIR)/support/scripts/graph-depends -d $(DEPTH) \
    |tee $(O)/graphs/$(@).dot \
    |dot $(DOT_OPTS) -o$(O)/graphs/$(@).$(BR_GRAPH_OUT)

support/scripts/graph-depends /only/ generates a dot program, not the
graph itself.

> No black magics with the args... just keep it simple ;-)
> "Buildroot is a simple, efficient and easy-to-use tool" (not from me,
> from http://buildroot.org/ :-])

Yes, but all the alternate solutions are ending being more complex that
mere environment variables.

Grantes, I do not like the environment variables much, since it is easy
to forget them on a subsequent make. That's why my series (I still have
to post it) gets rid of as many variables as possible.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
