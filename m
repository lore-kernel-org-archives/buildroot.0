From: Murat Demirten <mdemirten@yh.com.tr>
Date: Tue, 5 Jul 2011 12:42:05 +0300
Subject: [Buildroot] [PATCH] Add package fribidi
In-Reply-To: <87zkktw13z.fsf@macbook.be.48ers.dk>
References: <BANLkTinpAtwa0MsVbvyR7cTrbewGt5Jc6A@mail.gmail.com>
 <87zkktw13z.fsf@macbook.be.48ers.dk>
Message-ID: <CA+pfegEo9-Q9y8TQxwnbhASem=a1uU5=YnuvY=MbZ3rO1-ycPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

There is no information about toolchain or localization requirements. But I
just look at the source code and it seems that
this library can be compiled in all the cases, there is no special
requirements.

We need a custom install step because we don't want to see other than the
library itself on the target.

But in some cases, maybe fribidi and fribidi-config binary required by
someone else on target. So, keeping these binaries in target usr/bin
and giving the possibility to remove with standard postbuild script
mechanism will be fine (Is there any hints to not install header files on
the target?).

What do you think about? Is there any policy for the packages which provides
useful libraries and some binaries rarely need on target? Do we have to put
all the binaries in target too? Sometimes these types of binaries not
prepared for running on the target (like navit->maptool). Putting this
binaries only to
staging area keeps the target clean but I see that, there must be a policy,
we can't put custom binary install logic for every single package.

Regards,

2011/7/5 Peter Korsgaard <jacmet@uclibc.org>

> >>>>> "Murat" == Murat Demirten <mdemirten@yh.com.tr> writes:
>
>  Murat> Hi,
>  Murat> I'm sending the patch for the new package fribidi.
>
>  Murat> Fribidi is a free implementation of the Unicode BiDi algorithm for
> Hebrew and/
>  Murat> or Arabic languages.
>  Murat> It is required mostly by the applications which have I18n support.
>
> Thanks. Could you perhaps use git format-patch -s / git send-email in
> the future to make it easier to commit?
>
>  Murat> [master 7d6b6b6] GNU fribidi package added
>  Murat>  3 files changed, 24 insertions(+), 0 deletions(-)
>  Murat>  create mode 100644 package/fribidi/Config.in
>  Murat>  create mode 100644 package/fribidi/fribidi.mk
>  Murat> ---
>
>  Murat>  package/Config.in          |    1 +
>  Murat>  package/fribidi/Config.in  |    6 ++++++
>  Murat>  package/fribidi/fribidi.mk |   17 +++++++++++++++++
>  Murat>  3 files changed, 24 insertions(+), 0 deletions(-)
>  Murat>  create mode 100644 package/fribidi/Config.in
>  Murat>  create mode 100644 package/fribidi/fribidi.mk
>
>  Murat> diff --git a/package/Config.in b/package/Config.in
>  Murat> index 10d435c..81701d8 100644
>  Murat> --- a/package/Config.in
>  Murat> +++ b/package/Config.in
>  Murat> @@ -344,6 +344,7 @@ endmenu
>  Murat>
>  Murat>  menu "Text and terminal handling"
>  Murat>  source "package/enchant/Config.in"
>  Murat> +source "package/fribidi/Config.in"
>  Murat>  source "package/icu/Config.in"
>  Murat>  source "package/libiconv/Config.in"
>  Murat>  source "package/ncurses/Config.in"
>  Murat> diff --git a/package/fribidi/Config.in b/package/fribidi/Config.in
>  Murat> new file mode 100644
>  Murat> index 0000000..f8f4bc1
>  Murat> --- /dev/null
>  Murat> +++ b/package/fribidi/Config.in
>  Murat> @@ -0,0 +1,6 @@
>  Murat> +config BR2_PACKAGE_FRIBIDI
>  Murat> +       bool "fribidi"
>
> Doesn't this need wide characters or localization support in the
> toolchain?
>
>  Murat> +       help
>  Murat> +         Free Implementation of the Unicode BiDi algorithm for
> Hebrew and/or
>
> Please keep help text lines < 70 chars.
>
>  Murat> Arabic languages.
>  Murat> +
>  Murat> +         http://fribidi.org/download
>
> Drop /download
>
>  Murat> diff --git a/package/fribidi/fribidi.mk b/package/fribidi/
> fribidi.mk
>  Murat> new file mode 100644
>  Murat> index 0000000..532d648
>  Murat> --- /dev/null
>  Murat> +++ b/package/fribidi/fribidi.mk
>  Murat> @@ -0,0 +1,17 @@
>  Murat> +#############################################################
>  Murat> +#
>  Murat> +# fribidi
>  Murat> +#
>  Murat> +#############################################################
>  Murat> +FRIBIDI_VERSION = 0.10.9
>  Murat> +FRIBIDI_SOURCE = fribidi-$(FRIBIDI_VERSION).tar.gz
>  Murat> +FRIBIDI_SITE = http://fribidi.org/download
>  Murat> +FRIBIDI_INSTALL_STAGING = YES
>  Murat> +FRIBIDI_INSTALL_TARGET = YES
>  Murat> +
>  Murat> +define FRIBIDI_INSTALL_TARGET_CMDS
>  Murat> +       mkdir -p $(TARGET_DIR)/usr/lib
>  Murat> +       cp -dpf $(@D)/.libs/libfribidi.so* $(TARGET_DIR)/usr/lib/
>  Murat> +endef
>
> Why do you need a custom install step?
>
>
> --
> Bye, Peter Korsgaard
>



-- 
Murat Demirten
Genel M?d?r
http://www.yh.com.tr
(212) 210 77 36 - 103
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110705/18657b02/attachment.html>
