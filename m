From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 10 Feb 2014 13:02:06 +0100
Subject: [Buildroot] Bugs cleanup (input requested)
In-Reply-To: <CAAXf6LX719WwMSZUGShzANA22z0g+zo5hYNbFYwfHG3ZEGBioQ@mail.gmail.com>
References: <CAAXf6LX719WwMSZUGShzANA22z0g+zo5hYNbFYwfHG3ZEGBioQ@mail.gmail.com>
Message-ID: <CAGduivw8=tvBiMUw-hLYVQ+OBt1bj639BACgwi-NHqyh_HUaAA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Mon, Feb 10, 2014 at 11:21 AM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> All,
>
> I have been looking at some bugs / enhancement requests this weekend.
>
> *For the entries proposing new packages*, I have updated the todo
> list. Feel free to adopt these patches (but please wait until next
> release cycle): http://elinux.org/Buildroot#Packages
We should organize and specify clearly who is working on what, to
avoid work done twice. In the bug tracker, it can be assigned to the
person wanting to adopt this one, other than that. The wiki should be
edited or a mail sent to the mailing.
>
> *For some entries, I have resubmitted the patch to the mailing list*.
> Three of these have already been integrated (thanks!), following is
> still remaining:
>
> https://bugs.busybox.net/show_bug.cgi?id=6542
> external python modules fail to compile to pyc if \\N escapes are used
>
> Corresponding patch is: http://patchwork.ozlabs.org/patch/317659/
> ThomasP commented that a similar change is also made by his upcoming
> Python patch series, but since this won't be included in 2014.02, I
> think the proposed patch can already be applied.
>
>
> *Finally, for some entries we need to make a decision on how to
> proceed*. I am listing these entries below:
>
>
> https://bugs.busybox.net/show_bug.cgi?id=3811
> Added auto-mount for USB and SD Card (mdev) (for 2011.05)
>
> In my opinion, this script/proposal is very project-specific and does not need
> to be part of mainline buildroot. What is the opinion of other buildroot
> developers?
> If you agree, I would propose to close this bug as Resolved/Wontfix.
I agree, it seems too specific, this could be done in a post build script.
>
>
> https://bugs.busybox.net/show_bug.cgi?id=4454
> There should be simple way to update image, when changing external fs skeleton
>
> This is about changing the custom target skeleton after the first
> build, and then expecting these changes to be applied on the target
> image. This is not something we support, and we propose the post-build
> script / rootfs overlay mechanisms for it.
> So my proposal is also to close this bug as Resolved/Wontfix, if you agree.
Also agreed.
>
>
> https://bugs.busybox.net/show_bug.cgi?id=2419
> Add a bundle of Lua modules
>
> This is a bug from 2010 by Francois, and as far as I can see this is
> about the luarocks infrastructure. So I think this bug can be closed
> now, but I wanted to check with you to be sure.
>
>
> https://bugs.busybox.net/show_bug.cgi?id=4339
> Allow override of DL_DIR in extract step
>
> I have requested the author of the problem for additional info, which
> was provided. They are using a custom dl dir for company packages, by
> adding the following in these packages' .mk file:
> $($(PKG)_BUILD_DIR)/.stamp_% : DL_DIR=$(OUR_SPECIAL_DL_DIR)
> In order to make this work, they need the following change in
> package/pkg-generic.mk:
>
>   # default extract command
>   $(2)_EXTRACT_CMDS ?= \
> -     $$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE)))
> $(DL_DIR)/$$($(2)_SOURCE) | \
> +     $$(if $$($(2)_SOURCE),$$(INFLATE$$(suffix $$($(2)_SOURCE)))
> $$(DL_DIR)/$$($(2)_SOURCE) | \
>       $(TAR) $(TAR_STRIP_COMPONENTS)=1 -C $$($(2)_DIR) $(TAR_OPTIONS) -)
>
>   # post-steps hooks
>
> Although the usage is pretty funky, the patch is not very invasive and
> I don't have a strong objection.  But I could understand that other
> people don't like this. I think there are three alternatives:
> - accept the patch
> - reject the patch
> - reject the patch but propose another solution
Maybe I am mistaken, but BR2_EXTERNAL seems to fit their uses ? They
could keep their internals packages separated this way, using also the
PROPRIETARY license along with LIBFOO_REDISTRIBUTE.
>
>
> Thanks for your feedback,
> Thomas
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
