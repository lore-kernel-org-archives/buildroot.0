From: Christian Stewart <christian@paral.in>
Date: Mon, 03 Aug 2015 21:23:34 +0000
Subject: [Buildroot] [PATCH v1 2/3] aufs: new kernel extension.
In-Reply-To: <20150803211325.GQ3647@free.fr>
References: <1438387017-10597-1-git-send-email-christian@paral.in>
 <1438387017-10597-2-git-send-email-christian@paral.in>
 <20150803211325.GQ3647@free.fr>
Message-ID: <CA+h8R2pFkwsu+1dN=W_kjPHQq8du5MhaHjCNoP2D=K8ZMEvkug@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Remove this 'depends on' but enclose the options inside an if...endif
> block.
>

Done here:

https://github.com/paralin/buildroot/commit/8dd9e882fac4a4512d9dcad8fe19da02ff901e45


> +     default BR2_PACKAGE_AUFS_4X if BR2_KERNEL_HEADERS_4_0 ||
> BR2_KERNEL_HEADERS_4.1
> > +     default BR2_PACKAGE_AUFS_3X if !(BR2_KERNEL_HEADERS_4_0 ||
> BR2_KERNEL_HEADERS_4.1)
>
> See the comment below, about kernel version...
>

As you caught in your next email, these are *defaults*, or guesses. The
user should still verify if the version is correct. The guess is correct a
lot of the time and is helpful to the user because the aufs branches are
often not obviously named.

The help entry goes last (i.e. after the defaults).
>

Fixed.

So, this means we can't build aufs except with an internal toolchain.
>

No, just guesses.

> +define AUFS_STANDALONE_PREPARE_KERNEL
> > +     if test -d $(LINUX_DIR)/fs/aufs/; then \
> > +             echo "Your kernel already supports AUFS. Not patching."; \
>
> This should be a hard-error.
>
> Also, we want to check that the aufs version indeed matches that of hte
> kernel, and error-out if not.
>

As far as I can tell this is not something the Buildroot system is capable
of doing on its own. It's a complex process to check if the versions match.
The aufs make system will do this on its own, so there is already a hard
error if you have the wrong versions checked out. I vote to just let this
error happen at build time.

Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20150803/6ecd8369/attachment.html>
