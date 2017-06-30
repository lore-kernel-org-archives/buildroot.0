From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 30 Jun 2017 23:17:29 +0200
Subject: [Buildroot] [PATCH v2] Makefile: unconfigured "make toolchain"
 should run report error
In-Reply-To: <20170630170033.25708-1-arnout@mind.be>
References: <20170630170033.25708-1-arnout@mind.be>
Message-ID: <e9641d01-780a-ac1c-4948-23b1bf615953@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

I might be wrong, but the patch title sounds wrong to me:

> Makefile: unconfigured "make toolchain" should run report error

Shouldn't it be:

  Makefile: unconfigured "make toolchain" should report an error

?

On 30/06/2017 19:00, Arnout Vandecappelle (Essensium/Mind) wrote:
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

s/Thise/This/

With the above fixed:
Tested by: Luca Ceresoli <luca@lucaceresoli.net>
Acked by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
