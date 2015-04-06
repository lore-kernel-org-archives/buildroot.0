From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Apr 2015 11:40:17 +0200
Subject: [Buildroot] [PATCH 21/35] Makefile: simplify show-targets
In-Reply-To: <20150330212107.GF4318@free.fr>
References: <1427650429-9293-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1427650429-9293-22-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150330212107.GF4318@free.fr>
Message-ID: <20150406114017.3eb61812@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 30 Mar 2015 23:21:07 +0200, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2015-03-29 19:33 +0200, Thomas Petazzoni spake thusly:
> > show-targets is only used currently by the graph-depends script, which
> > already recurses into the dependencies of the selected packages to
> > build the dependency graph. Therefore, dumping the contents of
> > $(PACKAGES) and $(ROOTFS_TARGETS) is sufficient: $(HOST_DEPS) and
> > $(TARGET_HOST_DEPS) will contain packages that are dependencies of
> > packages already listed in $(PACKAGES), which graph-depends will
> > discover by itself.
> > 
> > This allows to remove one more usage of $(HOST_DEPS) and
> > $(TARGET_HOST_DEPS), which is one more step towards their removal.
> 
> This means a lot of host packages no longer show up in show-targets.

This is expected. "make show-targets" has *never* guaranteed you that
it would list *all* packages.

Remember, before this patch series, the main Makefile only had some
logic to do a two-level recursion on the dependencies of host packages.
So what the graph-depends script does is that it takes the output of
"make show-targets" as an initial list of packages, and then walks the
dependency tree by itself by calling "make <pkg>-show-depends"
recursively, starting from the list of packages listed by "make
show-targets".

So, from this commit, "make show-targets" will only list the target
packages selected by menuconfig (i.e all those listed in the
global PACKAGES variable). All other packages will be figured out by
iterating recursively using "make <pkg>-show-depends".

So indeed, this changes the output of "make show-targets", but this
output was wrong. And there is no way to make it correct without
iterating recursively through dependencies.

Note that this target is actually called "make show-targets" and not
"make show-packages". So it does not give the guarantee that all
packages will be listed.

For me, this target is only an internal details of the graph-depends
logic. As long as the global graph-depends graph remains the same, then
I believe this is fine.

Let me know what you think,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
