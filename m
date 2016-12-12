From: James Knight <james.knight@rockwellcollins.com>
Date: Mon, 12 Dec 2016 17:31:28 -0500
Subject: [Buildroot] [PATCH RFC] Revert "Added local directory as source
 of kernel code"
In-Reply-To: <20161212185211.41d61776@free-electrons.com>
References: <1467066844-28355-1-git-send-email-yann.morin.1998@free.fr>
 <20160827222353.02bc0df2@free-electrons.com> <87twe4aav2.fsf@dell.be.48ers.dk>
 <20160828214805.GE5758@free.fr> <20160829091638.1236158a@free-electrons.com>
 <CALAjcgVnSzgNmmue22YdgSyd1b2-ZywEZZYmJm+U04HF4_DwVQ@mail.gmail.com>
 <20161212173527.GC3509@free.fr> <20161212185211.41d61776@free-electrons.com>
Message-ID: <CALe+oY9jox598a+pNWhg6jO+ATDn93aY2i==vakhZ7ORN+nDOQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Yann;

On Mon, Dec 12, 2016 at 11:27 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> I think the reason we removed it is because someone
> wanted to add the same feature to U-Boot or some other package, and we
> said we didn't want to add this possibility to each and every package
> in Buildroot.
...
On Mon, Dec 12, 2016 at 12:35 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> It's an endless hunt, and one we do not want to pursue.

I completely understand. The only reason why thought it was more
"acceptable" for Linux kernel sources is just as Thomas mentioned:

On Mon, Dec 12, 2016 at 12:52 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> One could however say (with good reason) that the Linux kernel, and a
> few other HW-related packages (bootloaders) are special.

That being said, it doesn't mean I couldn't just make respective
modifications into `local.mk`. My initial reasoning for wanting to
avoid the override file was that I didn't want to require/share the
use of the `local.mk` file. I didn't want to impose changes in my
Buildroot repository or my external Buildroot module (BR2_EXTERNAL)
that could affect others using the same modules but for other purposes
(ie. their own platform work). I did, however, overlook the
BR2_PACKAGE_OVERRIDE_FILE configuration option. I should be able to
use this, point to a custom sub-folder for my platform variant and
make appropriate changes for pulling in kernel sources. I'll just hope
any future modifications to my dependent Buildroot external modules do
not force the use of their own BR2_PACKAGE_OVERRIDE_FILE (which I
assume they should never do). Also, developers needing to make their
own system-testing modifications can just modify the file specified in
BR2_PACKAGE_OVERRIDE_FILE (instead of local.mk) when dealing with
custom tests for the platform variants using this kernel-fetch
modification (although, I could probably just add a line to chain an
existing local.mk file as well).

On Mon, Dec 12, 2016 at 11:27 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Why is it that you need to "prepare your
> kernel sources" before starting the build? Why aren't you referencing a
> given commit in some Git repository?
> ...
> But I'm still interested in understanding
> your more global use case for this functionality.

Now knowing of alternative methods available, preference. For my
environment, I drive all my builds from a `releng` module. To produce
a complete build of all my current platform variants, I require a
Buildroot repository, external Buildroot repositories (well, only one
(1) at this time), kernel repository and cache repository (dl
packages). The driver of releng can specify where to acquire any
repository from a series of servers, just custom locations (if sources
have been prepared using other means; ie. a developer environment,
Jenkins, etc.) or mixed. By defining all my variants to have something
like this:

    BR2_LINUX_KERNEL_CUSTOM_LOCAL=y
    BR2_LINUX_KERNEL_CUSTOM_LOCAL_PATH="$(MYCUSTOM_LINUX_DIR)"
    BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
    BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="$(BR2_EXTERNAL)/board/proj_x86_MYCUSTOM/configurations/linux-${MYCUSTOM_LINUX_VER_SERIES}-x86.config"

I'm able to target variant kernel versions/branches using the releng
module without modifying my variant Buildroot configurations
(although, this is probably something Buildroot (by design) may be
trying to avoid). What I like about this approach is that I can also
perform the fetch stage independent to the build stage, which has
helped in a series of minor use cases (configuration management,
quick-prep for pending tags, etc.); however, even though I may like
this type of approach, it may not be ideal for Buildroot (for
maintenance, etc.). I'll try to focus on getting
BR2_PACKAGE_OVERRIDE_FILE (and respective changes) working.

---

I assume when I eventually add LINUX_OVERRIDE_SRCDIR (and possibly
LINUX_HEADERS_OVERRIDE_SRCDIR), it doesn't matter which kernel
(header) choice configuration is selected?
