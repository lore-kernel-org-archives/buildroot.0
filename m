From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 Aug 2015 23:05:19 +0200
Subject: [Buildroot] [PATCH v1 0/2] Checking whether a certain CONFIG_*
	is set
In-Reply-To: <877foo75em.fsf@dell.be.48ers.dk>
References: <87lhd98twt.fsf@dell.be.48ers.dk>
 <1439990076-10412-1-git-send-email-viktorin@rehivetech.com>
 <20150819194643.1fad6062@free-electrons.com>
 <20150819190534.GA13372@free.fr> <87r3mz6lba.fsf@dell.be.48ers.dk>
 <20150821132227.GA3753@free.fr> <877foo75em.fsf@dell.be.48ers.dk>
Message-ID: <20150821210519.GB3753@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-08-21 22:28 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
>  >> > I think the plan I'll be goign with is to add a hidden Kconfig knob that
>  >> > packages that want to build a kernel module will have to select.
>  >> 
>  >> Why not just like the kernel-module infrastructure handle it like I
>  >> proposed? I don't think it is very nice that people have to remember to
>  >> add the select as well (and chances are they won't notice if they
>  >> forget).
> 
>  > Because that would not work for packages in br2-external trees, as I
>  > already explained.
> 
> Are you sure? I didn't try it, but as we only *USE* the variable when
> LINUX_KCONFIG_FIXUP_CMDS runs, which is after all the .mk files have
> been parsed I think it should work?

Ah, just checking would indeed be doable, something similar (but more
restrictive) to the patch proposed by Jan:
    https://patchwork.ozlabs.org/patch/508729/

I.e. somthing like:

    define $(2)_KERNEL_MODULES_BUILD
        if ! grep -E "^CONFIG_MODULES=y\$$" $$(LINUX_DIR)/.config >/dev/null; then \
            printf "Error: your Linux kernel does not support modules\n"; \
            exit 1; \
        fi
        [--current code--]
    endef

Yes, that would work.

But I was focused on actually enabling the CONFIG_MODULES option when a
package wants to build a kernel module, and _that_ is not possible with
the kernel-module infra.

> > I know you are not using br2-external (and also do not really see the
>  > point of it), but a lot of people find this to be a really important
>  > feature. I also suspect some of our (corporate) users did choose
>  > Buildroot (partly) because of br2-external.
> 
> It's true that I don't personally use br2-external and don't find it
> such a killer feature, I *DO* acknowledge that some people do (which is
> why I merged the support for it in the first place) and will try to keep
> it working as good as possible.

OK, thanks! :-)

> With that said, we have a lot of other
> requirements for Buildroot (like keeping it simple), so will not bend
> over backwards to improve br2-external support if it means making big
> compromises elsewhere.

I do agree with that.

> br2-external stuff will always been more limited than normal packages in
> the tree.

Yes, probably. But what I argue is that we should not introduce
_arbitrary_ restrictions that we can easily avoid. And by "easily", I do
agree that it should not require huge changes in Buildroot, be simple
code, be simple to understand and be simple to use.

>  >> Like Thomas says, we are already doing the 2nd option and I think it
>  >> makes sense to keep on doing so - So I don't think there's a common need
>  >> for the first.
> 
>  > Still, we are currently not allowing another package to set kernel
>  > options _from_ that package's .mk file. All we have is the kernel
>  > (de)activating options based on the presence of other packages, and that
>  > excludes packages from br2-external. Unless Buildroot is modified
>  > accordingly (but then br2-external looses its attractiveness for that
>  > package).
> 
> Ok, but if all of these use the kernel-module infrastructure (which
> linux.mk knows about), then this should work for CONFIG_MODULES, right?

No, linux.mk does not know of the kernel-module infra. The kernel-module
infra is entirely implemented using post-build and post-install hooks of
the package itself, not of the kernel.

Maybe you confused kernel-module with the linux extensions?

So I guess I start to see where the misunderstanding comes from... The
kernel-module infra can indeed _check_ that CONFIG_MODULES is set, but
it can not set it.

(Arguably, we could do it for in-tree packages, because their .mk are
parsed before that of the kernel, so we could set a Makefiel variable to
tell linux.mk to enable CONFIG_MODULES. But since br2-external packages
are parsed after linux.mk, then we could not for those packages).

So, I've decided to prepare two patch series, and we can apply the one
that gets consensus:
  - one that does the check in the kernel-module infra,
  - one that forces CONFIG_MODULES when required.

When both are ready, I'll push them to the list.

I hope we can get either in *before* the release: the kernel-module
infra is brand new in this cycle, and I'd like we get a stable "API"
for it before releasing it to the wild.

> It naturally cannot work for random other config settings.

ACK.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
