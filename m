From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 9 May 2014 17:07:19 +0200
Subject: [Buildroot] [PATCH] graphs: add option to remove transitive
 dependencies in dependency graph
In-Reply-To: <20140509143830.GF3173@free.fr>
References: <1399416267-16009-1-git-send-email-yann.morin.1998@free.fr>
 <20140509095224.GB3173@free.fr> <877g5vb7bb.fsf@dell.be.48ers.dk>
 <20140509102029.GC3173@free.fr>
 <CAHXCMMK9Y-bReA=vij5ti0ZKeehXEx45nsw8H-+G01LUcF1RMw@mail.gmail.com>
 <20140509133441.GE3173@free.fr>
 <CAHXCMMLkk-0FxgrcExWQukmpZcwC4qELaRexRYDGnapyzPECFQ@mail.gmail.com>
 <20140509143830.GF3173@free.fr>
Message-ID: <CAHXCMMJWF8jpLEt=_a780Z7JoSbc+oaJU2=zCxgJuhddDRs6mQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, May 9, 2014 at 4:38 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Samuel, All,
>
> On 2014-05-09 16:09 +0200, Samuel Martin spake thusly:
>> On Fri, May 9, 2014 at 3:34 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>> > too) as make targets so it was easier for users to generate the graphs
>> > rather than directly call the scripts (since the scripts could even
>> > reside in another dir when building out-of-tree, and it would be more
>> > complex to reach for the scripts).
>>
>> Arf! I forgot this.
>>
>> In this case, I would do:
>> - to get the default graph:
>>   make foo-graph-depends
>> - to get a customized graph:
>>   make foo-graph-depends BR2_GRAPH_DEPS_OPTS="..."
>
> A single variable is not enough, since we have options:
>
>   - for support/scripts/graph-depends: maximum depth, transitive deps or
>     not
>
>   - the 'dot' utilities: draw top-down or left-right, and so on...
>
> So either greaph-depends has to understand a subset (or all) of dot's
> options (Eeek!), or we offer two variables.
>
>> And I'd expect to find some help somewhere in the doc to know what are
>> the supported options,
>
> Already in the manual, section 3.5, "Daily use" and sub-sections:
>
>     3.5.7. Graphing the dependencies between packages
>     http://buildroot.net/downloads/manual/manual.html#_graphing_the_dependencies_between_packages
>
>     3.5.8. Graphing the build duration
>     http://buildroot.net/downloads/manual/manual.html#_graphing_the_build_duration
>
>     3.5.5. Environment variables
>     http://buildroot.net/downloads/manual/manual.html#env-vars
>
>> or how to get the graph-depends help, so via
>> the manual or in the help message of the BR2_GRAPH_DEPS_OPTS kconfig
>> entry.
>
> We already document the mere existence of graph-build, graph-depends and
> PKG-graph-depends inthe output of make help:
>
>     <package>-graph-depends    - generate graph of the dependency tree
>                                  for package
>     graph-build            - generate graphs of the build times
>     graph-depends          - generate graph of the dependency tree
>
> But the variables are only documented in the manual (see above.)
>
>> So, in the end, the call to graph-depends script would just be:
>>   $(TOPDIR)/support/scripts/graph-depends $(BR2_GRAPH_DEPS_OPTS)
>> or:
>>   $(TOPDIR)/support/scripts/graph-depends -p $(1) $(BR2_GRAPH_DEPS_OPTS)
>
> Not really, it currently is (roughly):
>
>     $(TOPDIR)/support/scripts/graph-depends -d $(DEPTH) \
>     |tee $(O)/graphs/$(@).dot \
>     |dot $(DOT_OPTS) -o$(O)/graphs/$(@).$(BR_GRAPH_OUT)
>
> support/scripts/graph-depends /only/ generates a dot program, not the
> graph itself.

/me thinking at the same time i'm writing...

It's a bit weird to me to have to pass dot options... but it's dot
that generate the graph, so I see 2 options:
- in all cases, I think it's better to have a choice to select the
output format;
- option 1) BR2_GRAPH_DEPS_OPTS accepts dot options after "--", so the
graph-depends script should call itself the dot program;
- option 2) BR2_GRAPH_DEPS_OPTS is for graph-depends only, and we add
a 3rd kconfig entry for dot option.

Wild thought: do we check for the presence of dot program?


-- 
Samuel
