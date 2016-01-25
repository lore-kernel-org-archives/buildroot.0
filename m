From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 25 Jan 2016 14:19:28 +0100
Subject: [Buildroot] [PATCH] support/download: protect from custom
 commands with spaces in args
In-Reply-To: <20160125124552.GA12615@jack.zhora.eu>
References: <1449480415-10043-1-git-send-email-yann.morin.1998@free.fr>
 <20160124020636.GA1387@jack.zhora.eu> <20160124154921.GC3405@free.fr>
 <20160125124552.GA12615@jack.zhora.eu>
Message-ID: <CAAXf6LUmb8y4W+KBfv2Q56zxz8Uq8y3XJvdaF-p8KTuh6VeDmw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 25, 2016 at 1:45 PM, Andi Shyti <andi.shyti@gmail.com> wrote:
> Hi Yann,
>
>> > > Some users may provide custom download commands with spaces
>> > > in their
>> > > arguments, like so:
>> > >     BR2_HG="hg --config foo.bar='some space-separated
>> > >     value'"
>> >
>> > this patch is breaking the build. With configs like this:
>> >
>> > BR2_LINUX_KERNEL=y
>> > BR2_LINUX_KERNEL_CUSTOM_GIT=y
>> > BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git"
>> > BR2_LINUX_KERNEL_DEFCONFIG="exynos"
>> > BR2_LINUX_KERNEL_DTS_SUPPORT=y
>> > BR2_LINUX_KERNEL_INTREE_DTS_NAME="exynos5422-odroidxu4"
>>
>> You forgot to specify a kernel version here, which is the
>> ultimate
>> reason for the failure.
>>
>> It does not make sense to use a git tree without specifying
>> either a tag
>> or a sha1 to checkout.
>
> actually I haven't forgotten, but I normally expect to clone
> master out of a git clone without having specified any
> branch/sha1/tag (the way it was working before).
>
> Indeed, by setting
>
> BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="master"
>
> it worked.
>
>> > the command sent is:
>> >
>> > git clone --mirror
>> > 'git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git'
>> > ''
>> >
>> > git dosn't like empty strngs and provides this output:
>> >
>> > fatal: The empty string is not a valid path
>> >
>> > Besides, I have never seen spaces in branch name,
>> > repositories
>> > names and it is quite a corner case. I think this patch
>> > should be
>> > reverted (at least) in the case of git.
>>
>> No, the patch is correct. What we should however check is that
>> the
>> version string is not empty, and bail out on that error
>> instead.
>>
>> Somehow, when the user forgets to specify a version string, we
>> call the
>> download scripts with no basename, and the empty string you see
>> in the
>> git call above should have been the basename of the directory
>> to clone
>> into, i.e. something like:  linux-VERSION/
>
> I think that buildroot should not fail if the version is not
> specified, but go ahead with a default solution, which can be
> master.
>
> Something like this, perhaps?
>
>  linux/linux.mk | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/linux/linux.mk b/linux/linux.mk
> index 3c53a0b..61f7468 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -20,6 +20,11 @@ LINUX_SITE_METHOD = local
>  else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_GIT),y)
>  LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
>  LINUX_SITE_METHOD = git
> +
> +ifeq ($(strip $(LINUX_VERSION)),)
> +LINUX_VERSION = "master"
> +endif
> +
>  else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_HG),y)
>  LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
>  LINUX_SITE_METHOD = hg
>


No, this is bad practice:  master is a moving target. Tomorrow it
can/will point to another commit than today. If you use such a
changing name in a build system, you do not get reproducible builds at
all.

That is why it is reasonable to expect a real SHA or tag name for
packages coming from version control.

/Thomas
