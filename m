From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 5 May 2014 13:18:04 +0200
Subject: [Buildroot] [PATCH] freetype: freetype-patch: depends on
	host-automake
In-Reply-To: <CAHkwnC_UsBmWC2QdY_=kjMsm35dXiYPc636_ySqx81oJtjMcpA@mail.gmail.com>
References: <1399282934-14517-1-git-send-email-fabio.porcedda@gmail.com>
 <CAHXCMMKtYtZxf3=FnOUTFcEo6mB3LC65VYUkAkbFnqfVDzoBaw@mail.gmail.com>
 <CAHkwnC_UsBmWC2QdY_=kjMsm35dXiYPc636_ySqx81oJtjMcpA@mail.gmail.com>
Message-ID: <CAHkwnC_2oP8HZVxAToOUBOOvaXAG8Rnb23QcYecb8Qb=WQ9FUw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 5, 2014 at 12:01 PM, Fabio Porcedda
<fabio.porcedda@gmail.com> wrote:
> On Mon, May 5, 2014 at 11:55 AM, Samuel Martin <s.martin49@gmail.com> wrote:
>> Hi Fabio, all,
>>
>> On Mon, May 5, 2014 at 11:42 AM, Fabio Porcedda
>> <fabio.porcedda@gmail.com> wrote:
>>> The "make freetype-patch" fails because does not found autogen.sh,
>>> because autogen.sh available only for the configure stage.
>>> To fix this add host-automake as a prerequisite to freetype-patch too.
>>>
>>> This also fix the support to top-level parallel make.
>>>
>>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>>> ---
>>>  package/freetype/freetype.mk | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>> diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
>>> index c7c9a06..33a6317 100644
>>> --- a/package/freetype/freetype.mk
>>> +++ b/package/freetype/freetype.mk
>>> @@ -83,3 +83,6 @@ HOST_FREETYPE_POST_INSTALL_HOOKS += HOST_FREETYPE_FIX_FREETYPE_INCLUDE
>>>
>>>  $(eval $(autotools-package))
>>>  $(eval $(host-autotools-package))
>>> +
>>> +# freetype-patch uses autogen.sh so add it as a prerequisite
>>> +$(FREETYPE_TARGET_PATCH): host-automake
>>
>> It's an unusual way of doing this!
>> How about moving the *FREETYPE_RUN_AUTOGEN hook in
>> *FREETYPE_PRE_CONFIGURE_HOOKS?
>
> Unfortunately that's alone does not work because  LIBTOOL_PATCH_HOOK
> it's going to fail, the only solution i've found is to move
> LIBTOOL_PATCH_HOOK to PRE_CONFIGURE too, but i'm not sure is it fine
> to do that, what do you think about that?
>
> patch:
> diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
> index c7c9a06..8aac8a2 100644
> --- a/package/freetype/freetype.mk
> +++ b/package/freetype/freetype.mk
> @@ -25,8 +25,8 @@ HOST_FREETYPE_CONF_OPT = --without-zlib
> --without-bzip2 --without-png
>  define FREETYPE_RUN_AUTOGEN
>         cd $(@D) && PATH=$(BR_PATH) ./autogen.sh
>  endef
> -FREETYPE_POST_PATCH_HOOKS += FREETYPE_RUN_AUTOGEN
> -HOST_FREETYPE_POST_PATCH_HOOKS += FREETYPE_RUN_AUTOGEN
> +FREETYPE_PRE_CONFIGURE_HOOKS += FREETYPE_RUN_AUTOGEN
> +HOST_FREETYPE_PRE_CONFIGURE_HOOKS += FREETYPE_RUN_AUTOGEN
>  FREETYPE_DEPENDENCIES += host-automake host-autoconf host-libtool
>  HOST_FREETYPE_DEPENDENCIES += host-automake host-autoconf host-libtool
>
> diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
> index a646612..38b8c4c 100644
> --- a/package/pkg-autotools.mk
> +++ b/package/pkg-autotools.mk
> @@ -193,7 +193,7 @@ endef
>
>  # default values are not evaluated yet, so don't rely on this defaulting to YES
>  ifneq ($$($(2)_LIBTOOL_PATCH),NO)
> -$(2)_POST_PATCH_HOOKS += LIBTOOL_PATCH_HOOK
> +$(2)_PRE_CONFIGURE_HOOKS += LIBTOOL_PATCH_HOOK
>  endif
>
>  #

I've tried to build a allyespackageconfig with the above patch but it fails:

>>> php-gnupg 1.3.3 Patching libtool

Applying buildroot-libtool-v1.5.patch using patch:
patching file ltmain.sh
Reversed (or previously applied) patch detected!  Skipping patch.
5 out of 5 hunks ignored -- saving rejects to file ltmain.sh.rej
Patch failed!  Please fix buildroot-libtool-v1.5.patch!
make: *** [/home/fabiopo/buildroot/output/build/php-gnupg-1.3.3/.stamp_configured]
Error 1

Regards
-- 
Fabio Porcedda
