From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Jul 2017 10:11:23 +0200
Subject: [Buildroot] [PATCH v2] Makefile: unconfigured "make toolchain"
 should run report error
In-Reply-To: <20170630170033.25708-1-arnout@mind.be>
References: <20170630170033.25708-1-arnout@mind.be>
Message-ID: <20170701101123.1290d1e2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 30 Jun 2017 19:00:33 +0200, Arnout Vandecappelle
(Essensium/Mind) wrote:
> As reported by Alessandro Power on StackOverflow [1], the behaviour
> of "make toolchain" in an unconfigured tree is misleading.
> 
> When .config doesn't exist, we don't read in the package .mk files, so
> "make <package>" doesn't work:
> 
>     $ make busybox
>     make: *** No rule to make target 'busybox'.  Stop.
> 
> However, for "linux" and "toolchain", the corresponding file (or
> actually directory) already exists. So instead, we get:
> 
>     $ make linux
>     make: Nothing to be done for 'linux'.
> 
> This is confusing, because it looks as if the build succeeded.
> 
> The obvious solution is to make linux and toolchain PHONY targets when
> .config doesn't exist. However, that actually does the reverse, because
> then a rule _does_ exist for them and since they don't have
> dependencies, make will consider them to be ready.
> 
> Therefore, we also have to provide an explicit rule for them, and
> explicitly error out. Thise behaviour is still different from other
> packages, but at least it is much less confusing.
> 
> [1] https://stackoverflow.com/questions/44521150
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> ---
> v2: Simpler way of erroring out, don't try to make all packages
>     behave the same (Luca)
> ---
>  Makefile | 8 ++++++++
>  1 file changed, 8 insertions(+)

Applied to master, thanks. And yes, I forgot to fix the commit title
when applying. Sorry :-/

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
