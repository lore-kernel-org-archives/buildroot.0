From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Oct 2014 19:35:57 +0200
Subject: [Buildroot] [PATCH] libxml2: Add patch to remove weak symbol
 trickery
In-Reply-To: <1410410325-23801-1-git-send-email-maarten@treewalker.org>
References: <1410410325-23801-1-git-send-email-maarten@treewalker.org>
Message-ID: <20141005193557.25145932@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Maarten ter Huurne,

On Thu, 11 Sep 2014 06:38:45 +0200, Maarten ter Huurne wrote:
> This avoids runtime problems when linking libpthread statically and it
> fixes compilation with musl libc.
> 
> The patch is based on this one:
> 
>   https://github.com/sabotage-linux/sabotage/blob/master/KEEP/libxml2-pthread.patch
> 
> I added the configure modification to ensure that libxml-2.0.pc will
> list libpthread as a private dependency.

Missing SoB line.

I'm a bit worried about upstream reaction: they say that they won't
support static linking anymore. So this means that this patch will
never be upstreamed, while we generally try to not carry patches that
really have zero chance to go upstream, unless they are
cross-compilation fixes.

> ---
>  ...bxml2-pthread-remove-weak-symbol-trickery.patch | 82 ++++++++++++++++++++++

Patch should follow the patch naming convention:

	<pkg>-<seqnumber>-<description>.patch

>  1 file changed, 82 insertions(+)
>  create mode 100644 package/libxml2/libxml2-pthread-remove-weak-symbol-trickery.patch
> 
> diff --git a/package/libxml2/libxml2-pthread-remove-weak-symbol-trickery.patch b/package/libxml2/libxml2-pthread-remove-weak-symbol-trickery.patch
> new file mode 100644
> index 0000000..8e9a139
> --- /dev/null
> +++ b/package/libxml2/libxml2-pthread-remove-weak-symbol-trickery.patch
> @@ -0,0 +1,82 @@
> +libxml2 contains some trickery to avoid linking to libpthread.
> +However, this is unsafe in several ways:
> +
> +Bug 704904 - Incorrect and unsafe use of weak references to pthread functions
> +https://bugzilla.gnome.org/show_bug.cgi?id=704904
> +
> +As a side effect, the following compilation error with musl libc is also
> +fixed by this patch:
> +
> +Bug 704908 - Failure to suppress macros when re-declaring pthread functions
> +https://bugzilla.gnome.org/show_bug.cgi?id=704908
> +

Missing SoB line.

Also, our libxml2 package does not depends on threads right now. What
happens once we apply your patch?

I'll mark this patch as Changes Requested in patchwork, so please
resend if needed.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
