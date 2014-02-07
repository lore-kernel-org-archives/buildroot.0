From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Fri, 7 Feb 2014 13:57:24 +0100
Subject: [Buildroot] [PATCH v11 2/8] package: add toolchain dependency
	to every target package
In-Reply-To: <1389348368-2509-3-git-send-email-fabio.porcedda@gmail.com>
References: <1389348368-2509-1-git-send-email-fabio.porcedda@gmail.com>
 <1389348368-2509-3-git-send-email-fabio.porcedda@gmail.com>
Message-ID: <CAHkwnC-9nzZE1_w95wr_LuCWfyaTgie-P1=Gu0jHH69TKx0umA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jan 10, 2014 at 11:06 AM, Fabio Porcedda
<fabio.porcedda@gmail.com> wrote:
<snip>
> -
> -$(2)_DEPENDENCIES ?= $(filter-out $(1),$(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
> +# When a target package is a toolchain dependency set this variable to
> +# 'NO' so the 'toolchain' dependency is not added to prevent a circular
> +# dependency
> +$(2)_ADD_TOOLCHAIN_DEPENDENCY  ?= YES
>
> +$(2)_DEPENDENCIES ?= $(filter-out  host-toolchain $(1),\
> +       $(patsubst host-host-%,host-%,$(addprefix host-,$($(3)_DEPENDENCIES))))
> +ifeq ($(5),target)

This line should be changed to:

ifeq ($(4),target)

After the recently merged commit 26aef889f1df32d5a15cd70f6b1e316ebb830cb7
(infra: remove unused 4th parameter to package infrastructures (pkgparentdir))
the $(4) must be used instead of $(5).

Do you prefer that i send a fixed patch series or  i send a new commit
to fix that?
Which solution do you prefer?
If you prefer i can send a new version today.
I just don't want to delay anymore the merge of this patch series.

Best regards
Fabio Porcedda
