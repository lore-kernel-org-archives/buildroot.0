From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 12 Mar 2013 10:05:04 +0100
Subject: [Buildroot] [RFC/PATCH] fs/common.mk: Fix wrong double dollar
	usage
In-Reply-To: <1362863052-8781-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1362863052-8781-1-git-send-email-ezequiel.garcia@free-electrons.com>
Message-ID: <CAAXf6LXzA2qSxq+5XRzRQUrXTHhTwYg2VA9GdTiNpPzkcNndxQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sat, Mar 9, 2013 at 10:04 PM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
> Double dollar sign is used to put an explicit dollar sign,
> for instance, when writing a makefile rule.
>
> In this case, there are some makefile conditionals where
> makefile variables are evaluated using double dollar signs
> instead of single dollar, which is wrong.
>
> In particular, this fixes a buildroot 'make' stall
> when building with an empty device table (empty BR2_ROOTFS_DEVICE_TABLE).
>
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
> I'm sending this as RFC because I'm new to buildroot
> and because I'm not a makefile wizard.
> AFAIK, this fixes a real bug in my compilation,
> as explained in the commit message.

In fact you are reverting changes made by Arnout a while back, see git
commit 847895d29524d81b64afb059b8649a77802a469b
http://git.buildroot.org/buildroot/commit/?id=847895d29524d81b64afb059b8649a77802a469b
There were specific reasons to make these changes, so I don't think we
should revert them like this.

Be aware that these make targets are inside a 'define
ROOTFS_TARGET_INTERNAL' statement, and later in the file this
'function' is executed with 'call'. This makes the rules for $ or $$ a
little different than in standard make recipes.

You mention a 'stall', can you elaborate more? What happens exactly?
Can you debug this further?

Best regards,
Thomas
