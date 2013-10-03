From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 03 Oct 2013 07:30:01 +0200
Subject: [Buildroot] [PATCH 2 of 3 v2] manual: add section about
 depending on target and toolchain options
In-Reply-To: <679aaf4f4d6cb323f13d.1380099395@argentina>
References: <patchbomb.1380099393@argentina>
 <679aaf4f4d6cb323f13d.1380099395@argentina>
Message-ID: <524D00D9.9070800@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/25/13 10:56, Thomas De Schampheleire wrote:
> Currently, the comments in Config.in files when depending on toolchain options
> are not at all lined up. This patch adds a section to the documentation that
> explains which format is to be used.
>
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> ---
> v2:
> - explicitly add parts on target architecture and MMU support (no comment
>    needed) (comment ThomasP)
> - remove 'without scrolling' text (comment Arnout)
>
> Notes:
> - How we will specify the C library is currently marked as 'to be decided'.
> This patch series does not yet unify that, but I plan to do that in a new
> patch (or update this series if we can reach a decision shortly).  The problem
> is that not all packages that have a dependency on e.g. glibc add a comment to
> show this to the user. A proposal would be to have a comment like:
>      foo needs a (e)glibc toolchain w/ featA, featB, featC
> where the '(e)glibc' string would be left out if there is no constraint on the
> C library.

  Looks good to me. Though for glibc there is only one feature AFAIK: C++.

>
>
>   docs/manual/adding-packages-directory.txt |  88 ++++++++++++++++++++++++++++--
>   1 files changed, 80 insertions(+), 8 deletions(-)
>
> diff --git a/docs/manual/adding-packages-directory.txt b/docs/manual/adding-packages-directory.txt
> --- a/docs/manual/adding-packages-directory.txt
> +++ b/docs/manual/adding-packages-directory.txt
> @@ -70,13 +70,9 @@ rules:
>
>   * Use a +depends on+ type of dependency when the user really needs to
>     be aware of the dependency. Typically, Buildroot uses this type of
> -  dependency for dependencies on toolchain options (target
> -  architecture, MMU support, C library, C++ support, large file
> -  support, thread support, RPC support, IPV6 support, WCHAR support),
> -  or for dependencies on "big" things, such as the X.org system. For
> -  dependencies on toolchain options, there should be a +comment+ that
> -  is displayed when the option is not
> -  enabled, so that the user knows why the package is not available.
> +  dependency for dependencies on target architecture, MMU support and
> +  toolchain options (see xref:dependencies-target-toolchain-options[]),
> +  or for dependencies on "big" things, such as the X.org system.
>     The +depends on+ keyword expresses the dependency with a forward
>     semantic.
>
> @@ -101,7 +97,7 @@ config BR2_PACKAGE_ACL
>
>             http://savannah.nongnu.org/projects/acl
>
> -comment "acl requires a toolchain with LARGEFILE support"
> +comment "acl needs a toolchain w/ largefile"
>           depends on !BR2_LARGEFILE
>   --------------------------
>
> @@ -167,6 +163,82 @@ package.
>   Further formatting details: see xref:writing-rules-config-in[the
>   coding style].
>
> +[[dependencies-target-toolchain-options]]
> +Dependencies on target and toolchain options
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +Many packages depend on certain options of the toolchain, like the

  "like" indicates that you're giving a few examples, but you're actually 
giving an exhaustive list. So instead I't put a colon.

> +C library, C++ support, largefile support, thread support, RPC

  the choice of C library,

> +support, IPv6 support, wchar support, or dynamic libraries. Some

  dynamic library support.

> +packages can only be built on certain target architectures, or if an
> +MMU is available in the processor.
> +These dependencies have to expressed with the appropriate 'depends on'
> +statements in the Config.in file. Additionally, for dependencies on
> +toolchain options, a +comment+ should be displayed when the option is
> +not enabled, so that the user knows why the package is not available.
> +Dependencies on target architecture or MMU support should not be
> +made visible in a comment: since it is unlikely that the user can
> +freely choose another target, it makes little sense to show these
> +dependencies explicitly.
> +
> +The general format of a dependency +comment+ for package foo is:
> +--------------------------
> +foo needs a toolchain w/ featA, featB, featC
> +--------------------------
> +
> +for example:
> +--------------------------
> +aircrack-ng needs a toolchain w/ largefile, threads
> +--------------------------
> +
> +Note that this text is kept brief on purpose, so that it will fit on a
> +80-character terminal.
> +
> +The rest of this section enumerates the different target and toolchain
> +options, the corresponding config symbols to depend on, and the string
> +literals to use in the comment.

  "string literals" sounds a bit strange here. "text" seems more 
appropriate to me.

> +
> +* Target architecture
> +** Dependency symbol: +BR2_powerpc+, +BR2_mips+, ... (see +arch/Config.in+)
> +** Comment string: no comment to be added
> +

  I could be wrong, but I think asciidoc doesn't allow an empty line 
here: you'll end up with two <ul>s with a single <li>. Can you verify that?

> +* MMU support
> +** Dependency symbol: +BR2_USE_MMU+
> +** Comment string: no comment to be added
> +
> +* C library
> +** Dependency symbol: +BR2_TOOLCHAIN_USES_GLIBC+,
> ++BR2_TOOLCHAIN_USES_UCLIBC+
> +** Comment string: (to be decided)
> +
> +* C++ support
> +** Dependency symbol: +BR2_INSTALL_LIBSTDCPP+
> +** Comment string: `C++`
> +
> +* largefile support
> +** Dependency symbol: +BR2_LARGEFILE+
> +** Comment string: +largefile+
> +
> +* thread support
> +** Dependency symbol: +BR2_TOOLCHAIN_HAS_THREADS+
> +** Comment string: +threads+
> +
> +* RPC support
> +** Dependency symbol: +BR2_TOOLCHAIN_HAS_NATIVE_RPC+
> +** Comment string: +RPC+
> +
> +* IPv6 support
> +** Dependency symbol: +BR2_INET_IPV6+
> +** Comment string: +IPv6+ (lowercase v)
> +
> +* wchar support
> +** Dependency symbol: +BR2_USE_WCHAR+
> +** Comment string: +wchar+
> +
> +* dynamic library
> +** Dependency symbol: +BR2_PREFER_STATIC_LIB+

  !BR2_PREFER_STATIC_LIB

> +** Comment string: +dynamic library+

  For the sake of brevity, maybe "DLL"?

  Regards,
  Arnout

> +
> +
>   The +.mk+ file
>   ~~~~~~~~~~~~~~
>   [[adding-packages-mk]]
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
