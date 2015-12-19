From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sat, 19 Dec 2015 10:13:39 +0100
Subject: [Buildroot] [PATCH v2] package/uclibc: Enable compile in thumb
 mode configuration option
In-Reply-To: <5671DC55.2010508@mind.be>
References: <1449269795-17864-1-git-send-email-paul.enman@gmail.com>
 <1450056520-18750-1-git-send-email-paul.enman@gmail.com>
 <20151215230351.5dc6e91d@free-electrons.com>
 <20151216071009.GW19876@waldemar-brodkorb.de>
 <5671DC55.2010508@mind.be>
Message-ID: <20151219091339.GE19876@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,
Arnout Vandecappelle wrote,

> On 16-12-15 08:10, Waldemar Brodkorb wrote:
> > Hi,
> > Thomas Petazzoni wrote,
> >> Paul,
> >>
> >>> +	$(call KCONFIG_DISABLE_OPT,UCLIBC_HAS_CONTEXT_FUNCS,$(@D)/.config)
> >>
> >> What is the relation between this and Thumb ?
> > 
> > The user context manipulation functions in uClibc are using
> > non-thumb instructions and result in a compile failure.
> 
>  Some packages need context functions, that's why they are enabled in our
> default uClibc config. Cfr. d01aaa7 (by you, Waldemar).

Yeah. But the context functions are deprecated and POSIX suggests
not to use them. Unfortunately they are only implemented for
arm/mips/x86/x86_64 in uClibc. Someone could port the implementation
for other architectures from GNU libc. But then still all noMMU
architectures would be missing. Furthermore the GNU libc
implementation does not work for THUMB only builds.
 
>  So if you do this, you'll need to make some packages depend on !THUMB. While
> they actually did work before this commit.

They did work before for people trying to run thumb code on a ARM
core which allows both modes. (arm and thumb)
But without this patch people can not use it to do a thumb2-only
build, which is a requirement to support ARM noMMU processors like
Cortex-M3 and Cortex-M4.
 
>  Can't uClibc be fixed to enable interworking for the context functions so they
> will work even if the rest of the library is compiled in thumb mode?

I think the intention of this patch is to support thumb2 only
builds. There is no interworking support for Cortex-M3/Cortex-M4.
 
>  As I commented in v1 of this patch, as long as 0.9.33 is not killed, we can't
> do this. We could however add a condition on -ng.

Then I would suggest to add a condition on -ng.

I think there is some userbase for it, because I remember seeing the
third person trying to get something similar committed.

Best regards
 Waldemar
