From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 Jan 2018 17:57:06 +0100
Subject: [Buildroot] [PATCH v3] tcfagent: new package
In-Reply-To: <CADYdroPpPWkH1600q-u=PZBcZBOrev6Tu8+LEB5jBgTcfHzGKQ@mail.gmail.com>
References: <20171204114306.28242-1-nolange79@gmail.com>
 <20171204120912.9850-1-nolange79@gmail.com>
 <20171213144932.31025d0f@windsurf>
 <CADYdroO+HVzM8QDxu=XBG+ORYHwnBoiM=pGB62AQ7_RVQtf6hA@mail.gmail.com>
 <CADYdroPpPWkH1600q-u=PZBcZBOrev6Tu8+LEB5jBgTcfHzGKQ@mail.gmail.com>
Message-ID: <20180102175706.1181ee14@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 2 Jan 2018 17:34:19 +0100, Norbert Lange wrote:

> before I do the bureaucratic work and more testing,
> there is some mixed information from you and the docs.
> 
> To quote the manual:
> > Target architecture
> >
> > Dependency symbol: BR2_powerpc, BR2_mips, ? (see arch/Config.in)
> > Comment string: no comment to be added  

This is correct. However, we don't want a comment to show up saying
"you need thread support to enable tcf-agent" if anyway tcf-agent is
not available on the currently selected architecture. So the comment is
not about the architecture dependency, but the comment should not be
displayed if the architectures dependencies are not met.

> config BR2_PACKAGE_TCFAGENT
> bool "tcfagent"
> depends on BR2_TOOLCHAIN_HAS_THREADS
> depends on BR2_PACKAGE_TCFAGENT_ARCH_SUPPORTS
> select BR2_PACKAGE_UTIL_LINUX
> select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> help
>   Target Communication Framework Agent is an example application
>   using the Target Communication Framework Library.
> 
>   Target Communication Framework is universal, extensible, simple,
>   lightweight, vendor agnostic framework for tools and targets to
>   communicate for purpose of debugging, profiling, code patching
>   and other device software development needs.
> 
>   tcf-agent is a daemon, which provides TCF services that can be
>   used by local and remote clients.
> 
> config BR2_PACKAGE_TCFAGENT_ARCH
> string
> default "arm"        if BR2_arm || BR2_armeb
> default "a64"        if BR2_aarch64 || BR2_aarch64be
> default "i686"       if BR2_i386 && BR2_ARCH="i686"
> default "i386"       if BR2_i386
> default "x86_64"     if BR2_x86_64
> default "powerpc"    if BR2_powerpc
> default "ppc64"      if BR2_powerpc64 || BR2_powerpc64le
> #   Supported with 1.6, enable when released
> # default "microblaze" if BR2_microblaze || BR2_microblazeel
> 
> config BR2_PACKAGE_TCFAGENT_ARCH_SUPPORTS
> bool
> default y if BR2_PACKAGE_TCFAGENT_ARCH != ""
> 
> comment "tcfagent needs a toolchain w/ threads"

Just add:

	depends on BR2_PACKAGE_TCFAGENT_ARCH_SUPPORTS

here, so that the comment doesn't show up on unsupported architectures.

> depends on !BR2_TOOLCHAIN_HAS_THREADS

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
