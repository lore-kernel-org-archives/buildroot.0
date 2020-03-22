From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Mar 2020 16:18:29 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/rcw : bump to LSDK-19.09
In-Reply-To: <CACGVVZg_3UzO=B4ZF5LUTnv+QaDhF3OvcyC_y7wHhnQ1gN5P2A@mail.gmail.com>
References: <20200322103143.18772-1-laurent.hartanerot@gmail.com>
 <20200322131255.GB2364@scaer>
 <CACGVVZg_3UzO=B4ZF5LUTnv+QaDhF3OvcyC_y7wHhnQ1gN5P2A@mail.gmail.com>
Message-ID: <20200322151829.GF2364@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Laurent, All,

On 2020-03-22 15:51 +0100, Laurent Hartanerot spake thusly:
> Hello Yann,
> Thank you for the feedback,
> - I thought I followed the explanations by making a first patch :
> [1]https://patchwork.ozlabs.org/patch/1258063/
> and the second patch (this) for the version bump...
> Maybe, I shouldn't have done it in response to this email (--in-reply-to=)

Ah, sorry, I had missed that one (and so did not completely understand
where the existing dependency on host-python came from... My bad.

> - I take this opportunity to explain why I have not used
> +HOST_RCW_DEPENDENCIES = $(BR2_PYTHON3_HOST_DEPENDENCY)
> but
> +HOST_RCW_DEPENDENCIES = host-python3
> in the first case the host-python3 dependency is not added
> When I check the varaibles (in the first case) I get :
> $ make printvars "VARS=HOST_RCW_DEPENDENCIES"
> HOST_RCW_DEPENDENCIES= host-skeleton
> $ make printvars "VARS=BR2_PYTHON3_HOST_DEPENDENCY"
> but in the second case :
> $ make printvars "VARS=BR2_PYTHON3_HOST_DEPENDENCY"
> $ make printvars "VARS=HOST_RCW_DEPENDENCIES"
> HOST_RCW_DEPENDENCIES=host-python3 host-skeleton
> I don't find the reason why $(BR2_PYTHON3_HOST_DEPENDENCY) is not equals to host-python3.

That's probably because you already have a python3 installed in your
machine?

That's exactly the purpose of BR2_PYTHON3_HOST_DEPENDENCY: if the
build machine already has a python3 (3.4 or later), then there is no
need to build our own. If the build machine does not already have
python3 or it is older than 3.4, then we need to build our own.

See:
    support/dependencies/check-host-python3.mk
    support/dependencies/check-host-python3.sh

Regards,
Yann E. MORIN.

> Thanks for support
> Le?dim. 22 mars 2020 ??14:13, Yann E. MORIN < [2]yann.morin.1998@free.fr> a ?crit?:
> 
>   Laurent, All,
> 
>   On 2020-03-22 11:31 +0100, Laurent Hartanerot spake thusly:
>   > From: Laurent Hartanerot < [3]laurent.hartanerot@atos.net>
>   >
>   > Upgrade python to python3 : "Only Python versions 3.0+ are supported"
>   >
>   > Signed-off-by: Laurent Hartanerot < [4]laurent.hartanerot@atos.net>
>   > ---
>   >? package/rcw/rcw.hash | 2 +-
>   >? package/rcw/ [5]rcw.mk? ?| 6 +++---
>   >? 2 files changed, 4 insertions(+), 4 deletions(-)
>   >
>   > diff --git a/package/rcw/rcw.hash b/package/rcw/rcw.hash
>   > index 7de1ec659a..76b6373942 100644
>   > --- a/package/rcw/rcw.hash
>   > +++ b/package/rcw/rcw.hash
>   > @@ -1,3 +1,3 @@
>   >? # Locally calculated
>   > -sha256 1421ada9fec10b12ff21cd9ad82f0a835b191cb2dde80f03547764574b1346c3 rcw-LSDK-18.12.tar.gz
>   > +sha256 b69a6a8b187ba794e0af716a509ced2bbac83da0f6e94b5c7331a34619db21b1 rcw-LSDK-19.09.tar.gz
>   >? sha256 a531b3146425e592db17a51ff39c4801cb01fb4055ffdaada0572decc0655bcd LICENSE
>   > diff --git a/package/rcw/ [6]rcw.mk b/package/rcw/ [7]rcw.mk
>   > index dbfeae7b21..928135abfc 100644
>   > --- a/package/rcw/ [8]rcw.mk
>   > +++ b/package/rcw/ [9]rcw.mk
>   > @@ -4,13 +4,13 @@
>   >? #
>   >? ################################################################################
>   >?
>   > -RCW_VERSION = LSDK-18.12
>   > +RCW_VERSION = LSDK-19.09
>   >? RCW_SITE = [10]https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
>   >? RCW_SITE_METHOD = git
>   >? RCW_LICENSE = BSD-3-Clause
>   >? RCW_LICENSE_FILES = LICENSE
>   >?
>   > -HOST_RCW_DEPENDENCIES = host-python
>   > +HOST_RCW_DEPENDENCIES = host-python3
> 
>   As far as I can see, that's not what Thomas requested in his previous
>   review [11]http://lists.busybox.net/pipermail/buildroot/2020-March/277531.html
> 
>   Thomas requested that the bump be split in two changes:
> 
>   ? - a first patch that does not update the version, but adds the missing
>   ? ? dependency to host-python, making sure to use by replacing the call
>   ? ? to 'python' by a call to $(HOST_DIR)/bin/python, so that we can
>   ? ? backport that fix into our LTS branch, 2020.02;
> 
>   ? - a second patch that does the version bump, and in the process,
>   ? ? changes the dependency on host-python to using the conditional
>   ? ? depednency set in the variable $(BR2_PYTHON3_HOST_DEPENDENCY).
> 
>   If you have issues with the above, then do not hesitate to explain your
>   concerns, instead of re-sending almost exactly the same change.
> 
>   In the meantime, I've marked the patch as changes-requested in patchwork.
> 
>   Regards,
>   Yann E. MORIN.
> 
>   >? RCW_FILES = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_CUSTOM_PATH))
>   >?
>   > @@ -41,7 +41,7 @@ endef
>   >? HOST_RCW_POST_PATCH_HOOKS += HOST_RCW_ADD_CUSTOM_RCW_FILES
>   >?
>   >? define HOST_RCW_BUILD_CMDS
>   > -? ? ?$(HOST_DIR)/bin/python $(@D)/rcw.py \
>   > +? ? ?$(HOST_DIR)/bin/python3 $(@D)/rcw.py \
>   >? ? ? ? ? ? ? ?-i $(@D)/custom_board/rcw/$(RCW_PROJECT) \
>   >? ? ? ? ? ? ? ?-I $(@D)/custom_board -o $(@D)/PBL.bin
>   >? endef
>   > --
>   > 2.20.1
>   >
>   > _______________________________________________
>   > buildroot mailing list
>   > [12]buildroot at busybox.net
>   > [13]http://lists.busybox.net/mailman/listinfo/buildroot
> 
>   --
>   .-----------------.--------------------.------------------.--------------------.
>   |? Yann E. MORIN? | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>   | +33 662 376 056 | Software? Designer | \ / CAMPAIGN? ? ?|? ___? ? ? ? ? ?
>   ? ?|
>   | +33 561 099 427 `------------.-------:? X? AGAINST? ? ? |? \e/? There is no? |
>   | [14]http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL? ? |? ?v? ?conspiracy.? |
>   '------------------------------^-------^------------------^--------------------'
> 
> --
> Laurent HARTANEROT
> [15]Laurent.Hartanerot at gmail.com
> tel : 06 49 14 93 74
> 
> Links:
> 1. https://patchwork.ozlabs.org/patch/1258063/
> 2. mailto:yann.morin.1998 at free.fr
> 3. mailto:laurent.hartanerot at atos.net
> 4. mailto:laurent.hartanerot at atos.net
> 5. http://rcw.mk
> 6. http://rcw.mk
> 7. http://rcw.mk
> 8. http://rcw.mk
> 9. http://rcw.mk
> 10. https://source.codeaurora.org/external/qoriq/qoriq-components/rcw
> 11. http://lists.busybox.net/pipermail/buildroot/2020-March/277531.html
> 12. mailto:buildroot at busybox.net
> 13. http://lists.busybox.net/mailman/listinfo/buildroot
> 14. http://ymorin.is-a-geek.org/
> 15. mailto:Laurent.Hartanerot at gmail.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
