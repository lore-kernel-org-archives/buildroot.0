From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 24 Jan 2016 16:49:21 +0100
Subject: [Buildroot] [PATCH] support/download: protect from custom
 commands with spaces in args
In-Reply-To: <20160124020636.GA1387@jack.zhora.eu>
References: <1449480415-10043-1-git-send-email-yann.morin.1998@free.fr>
 <20160124020636.GA1387@jack.zhora.eu>
Message-ID: <20160124154921.GC3405@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Andi, All,

On 2016-01-24 11:06 +0900, Andi Shyti spake thusly:
> > Some users may provide custom download commands with spaces in their
> > arguments, like so:
> >     BR2_HG="hg --config foo.bar='some space-separated value'"
> 
> this patch is breaking the build. With configs like this:
> 
> BR2_LINUX_KERNEL=y
> BR2_LINUX_KERNEL_CUSTOM_GIT=y
> BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
> BR2_LINUX_KERNEL_DEFCONFIG="exynos"
> BR2_LINUX_KERNEL_DTS_SUPPORT=y
> BR2_LINUX_KERNEL_INTREE_DTS_NAME="exynos5422-odroidxu4"

You forgot to specify a kernel version here, which is the ultimate
reason for the failure.

It does not make sense to use a git tree without specifying either a tag
or a sha1 to checkout.

> the command sent is:
> 
> git clone --mirror 'git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git' ''
> 
> git dosn't like empty strngs and provides this output:
> 
> fatal: The empty string is not a valid path
> 
> Besides, I have never seen spaces in branch name, repositories
> names and it is quite a corner case. I think this patch should be
> reverted (at least) in the case of git.

No, the patch is correct. What we should however check is that the
version string is not empty, and bail out on that error instead.

Somehow, when the user forgets to specify a version string, we call the
download scripts with no basename, and the empty string you see in the
git call above should have been the basename of the directory to clone
into, i.e. something like:  linux-VERSION/

Care to have a look into that? ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
