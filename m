From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Date: Fri, 11 Sep 2020 19:37:15 +0000
Subject: [Buildroot] [PATCH v2] binutils/ARC: cleanup
In-Reply-To: <20200911111828.5c9ea5d5@windsurf.hq.k.grp>
References: <20191206221918.1c05e316@windsurf.home>
 <20191217213253.12446-1-vgupta@synopsys.com>
 <20191222224144.38603994@windsurf>
 <3b18564e-be2e-91b3-def1-6c3591288ecc@synopsys.com>
 <20200911111828.5c9ea5d5@windsurf.hq.k.grp>
Message-ID: <afd5edc5-93b8-e838-d79c-9f14d7a60943@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 9/11/20 2:18 AM, Thomas Petazzoni wrote:
> Hello Vineet,
>
> On Thu, 10 Sep 2020 23:21:43 +0000
> Vineet Gupta <Vineet.Gupta1@synopsys.com> wrote:
>
>>>> -ifeq ($(BINUTILS_VERSION),arc-2019.09-rc1)
>>>> +ifeq ($(BR2_BINUTILS_VERSION_ARC),y)  
>> Looks like we need this specific thunk anyways. When I select pristine upstream
>> binutils (not ARC fork @ github), the above forces it to download from github
>> which it should not and will not if the tag/branch has not been mirrored there.
> So I guess you're talking about the situation where a host-binutils is
> not enabled, and only a target binutils is used. 

No sorry, I was not. I was trying to build a host binutils off upstream 2.34 and
must have some local change to make it download 2.34 off of github ARC fork. I
can't reproduce it now.

> In this case, indeed:
>
> ifeq ($(BINUTILS_VERSION),)
> ifeq ($(BR2_arc),y)
> BINUTILS_VERSION = arc-2020.03-release
> else
> BINUTILS_VERSION = 2.33.1
> endif
> endif # BINUTILS_VERSION
>
> will kick in and set BINUTILS_VERSION to arc-2020.03-release, which
> will lead to:
>
> ifeq ($(BINUTILS_VERSION),arc-2020.03-release)
> BINUTILS_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,binutils-gdb,$(BINUTILS_VERSION))
> BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
> BINUTILS_FROM_GIT = y
> endif

The use of a single release string to decide where to download off of seems a bit
fragile. But given we are moving away from fork gradually it seems OK.

> being taken into account.
>
> What happens with target binutils is:
>
>  (1) If a host-binutils is built (because Buildroot is building the
>      toolchain), then we're using the same version as the
>      host-binutils, which is defined by the choice in
>      package/binutils/Config.in.host.
>
>  (2) If not host-binutils is built (because we're using an external
>      toolchain), then there is no version selection: we unconditionally
>      use 2.33.1, except on ARC where we use the special ARC fork.
>
> So I guess the decision to take is: do we want to switch to using the
> upstream binutils, even for ARC, when no host-binutils is built ?

I suppose so. upstream binutils is perhaps an odd commit or two behind the fork,
if at all.
I'll pester Alexey to just ditch binutils fork for upstream buildroot.

>
> Best regards,
>
> Thomas
