From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 18 Nov 2013 12:37:21 +0100
Subject: [Buildroot] [PATCH] vim: fix gettext check
In-Reply-To: <87ob5jx7ka.fsf@dell.be.48ers.dk>
References: <0d216d9aa9ecfc7dbb82.1384679162@argentina>
 <87ob5jx7ka.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LWP1DLr+p3y=SwFGtbh0hSbtMs8YUABYsmi62doAV34vA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Sun, Nov 17, 2013 at 6:27 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
>  > Fixes http://autobuild.buildroot.net/results/21b5a910e6a27fa1cb12d0002ffed7e6ed9d6c83/
>
> As that URL doesn't currently work, could you explain a bit what the
> problem is?
>
> I've tried building it with a number of different toolchain
> configurations, and don't seem to be able to trigger the issue.

I attached the defconfig file.
This situation was seen on the SH architecture. This seems to contain
libelf, which also depends on libintl. If you can create a similar
configuration, you should see the problem too (it's not SH specific).

The following does it on the supplied config:
make clean toolchain elfutils vim

The bottom line is that vim tries to detect how to link with gettext,
but while doing so takes along other libraries as well. It then thinks
that gettext is available directly, without libintl (because it is
implicitly taken by libelf). Later, it uses as-needed in the link
step, which strips the implicit libintl dependency. The explanation in
the patch itself is probably much clearer about this.

By the way, in the mean time the patch has been accepted upstream:
http://article.gmane.org/gmane.editors.vim.devel/43528

>
> I see that vim.mk doesn't do anything with gettext. Shouldn't it atleast
> make sure it gets built after gettext if enabled and/or select gettext
> if BR2_NEEDS_GETTEXT_IF_LOCALE?

I think you're right that there should be a gettext dependency to vim.
Currently, even if you have locale support, you may or may not get it
in vim, depending on the order of packages.
However, that is another improvement, it has no direct relation to the
autobuild fix.

I will submit a new patch (along with the updated 'upstream-status' in
the first patch).

Thanks for your feedback,
Thomas
-------------- next part --------------
A non-text attachment was scrubbed...
Name: defconfig
Type: application/octet-stream
Size: 7144 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20131118/4794f173/attachment.obj>
