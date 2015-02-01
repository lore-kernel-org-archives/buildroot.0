From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 1 Feb 2015 11:55:01 +0100
Subject: [Buildroot] [PATCH v3 1/3] pkg-generic.mk: reinstall targets
In-Reply-To: <1417188306-9035-2-git-send-email-rdkehn@yahoo.com>
References: <1417188306-9035-1-git-send-email-rdkehn@yahoo.com>
 <1417188306-9035-2-git-send-email-rdkehn@yahoo.com>
Message-ID: <20150201105500.GA4305@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Doug, All,

Sorry to come back to this so late...

On 2014-11-28 09:25 -0600, Doug Kehn spake thusly:
> Add reinstall targets for host, target, staging, and images variants.
> clean-for-reinstall targets added to remove package
> .stamp_target_install file to allow package install.  Additionally, when
> OVERRIDE_SRCDIR is provided, .stamp_rsynced is removed to ensure pakcage
> is up to date before reinstalling.
> 
> Signed-off-by: Doug Kehn <rdkehn@yahoo.com>

I have some comments below...

> ---
>  package/pkg-generic.mk | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> index 9643a30..0fe7059 100644
> --- a/package/pkg-generic.mk
> +++ b/package/pkg-generic.mk
> @@ -480,34 +480,51 @@ $(1):			$(1)-install
>  
>  ifeq ($$($(2)_TYPE),host)
>  $(1)-install:	        $(1)-install-host
> +$(1)-reinstall:		$(1)-reinstall-host

Indentation here (and in other places in that file) is off, but that's
not your fault: the existing code is already borked.

>  else
>  $(1)-install:		$(1)-install-staging $(1)-install-target $(1)-install-images
> +$(1)-reinstall:		$(1)-reinstall-staging $(1)-reinstall-target $(1)-reinstall-images
>  endif
>  
>  ifeq ($$($(2)_INSTALL_TARGET),YES)
>  $(1)-install-target:		$$($(2)_TARGET_INSTALL_TARGET)
> +$(1)-reinstall-target:		$(1)-clean-for-reinstall-target $$($(2)_TARGET_INSTALL_TARGET)
> +$(1)-clean-for-reinstall-target:$(1)-clean-for-reinstall
> +			rm -f $$($(2)_TARGET_INSTALL_TARGET)

I am not very happy with the fact that we add new actions here; the rest
of the code block is so far only concerned about ordering, not the
actual commands to execute.

The only other similar make target that removes stuff is the
$(1)-dirclean target, that uses a fake stamp-file (that it actually does
not touch) to actually does the cleanup.

I agree this is a bit convoluted, but I'd prefer we keep the current
layout: the code around here gets concerned about ordering, and we
actually implement the rules above (around line 248-250), using a fake
stamp file (obviously, one for each new -reinstall target).

Are you still interested in this? Would you mind looking at that?

Again, sorry for the delay in reviewing this series... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
