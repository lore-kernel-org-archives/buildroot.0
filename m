From: yann.morin at orange.com <yann.morin@orange.com>
Date: Thu, 27 Feb 2020 07:51:51 +0100
Subject: [Buildroot] [PATCH] package/qt5/qt5tools: mark qdoc option as
 broken
In-Reply-To: <20200226232237.292826-1-romain.naour@smile.fr>
References: <20200226232237.292826-1-romain.naour@smile.fr>
Message-ID: <15341_1582786313_5E576709_15341_100_1_20200227065151.GA3323@r-lnx-nyma7486-2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-02-27 00:22 +0100, Romain Naour spake thusly:
> When qdoc option was added by [1] for Qt 5.12, the host-clang
> dependecy was added as if host-clang would provide a host native
> compiler.
> 
> The host-clang package provide host libclang libraries needed by
> the cross-build process for target packages. The default target
> arch is set with the target architecture. It would require adding
> compiler flag to select the architecture to generate binaries
> (host or target).
> 
> We can consider adding native build suport by merging the
> patch [3]. But it was not merged in time for Buildroot
> 2020.02.
> 
> So in the current state, host-clang is added to qt5tools
> dependency without taking into account BR2_PACKAGE_LLVM_ARCH_SUPPORTS.

Then when don't we simply add that depednency instead of hiding it
behind BROKEN?

See below for a phrasing proposal...

> But even with host native support in llvm/clang host packages, the
> host-clang dependency itself increase a lot the build time.
> 
> On a laptop with a i7-8565U CPU @ 1.80GHz, host-llvm takes 1100 sec
> (18,3min) to build and host-clang takes 1200 sec (20min) to build.
> qt5tools takes 18sec to build.
> 
> Increasing the build time by 40min just for the sake of building qdoc
> is not great.

Yes, and so what? If people want to build qdoc because they want to
generate documentation for their Qt-based programs, and upstream Qt has
decided they need clang, there is not much we can do about that, can we?

The build time is no reason to hide away a feature, so there is no
reason to reference that in the commit log (it could be a post-commit
note, though).

> Instead we may consider adding a new check in support/dependencies/dependencies.sh
> for llvm/clang installed on the build machine.
> This llvm/clang would be used for building qdoc (or mabe other host package).
> 
> But we need to be careful for the case where host-llvm and host-clang
> package are already build.
> 
> Then, the qt5tools package would set LLVM_INSTALL_DIR in the
> additional environment variables to pass to make in the build step,
> to provide the patch to llvm/clang headers and libraries.
> 
> Something like:
> define QT5TOOLS_BUILD_CMDS
> 	$(TARGET_MAKE_ENV) LLVM_INSTALL_DIR="`/usr/bin/llvm-config --prefix`" \
> 		$(MAKE) -C $(@D) sub-src-qmake_all
> [...]

All those proposals do not belogn to the commit log, but to a
post-commit note, too.

> Since all possible solution are too late for 2020.02 release, disable

*solution_s_.

> BR2_PACKAGE_QT5TOOLS_QDOC_TOOL option.
> 
> Fixes:
> http://autobuild.buildroot.net/results/3c0/3c0f27e953fa41bd973003a4b42b768b1636c91a/build-end.log
> 
> [1] 57c1d3be4ecadd6802414a0943185c4ab6d82937
> [2] https://www.linuxembedded.fr/2018/07/llvmclang-integration-into-buildroot
> [3] http://patchwork.ozlabs.org/patch/1204740/
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Yann E. MORIN <yann.morin@orange.com>
> Cc: Julien Corjon <corjon.j@ecagroup.com>
> Cc: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/qt5/qt5tools/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/qt5/qt5tools/Config.in b/package/qt5/qt5tools/Config.in
> index 14178abc29..5ef85a88b3 100644
> --- a/package/qt5/qt5tools/Config.in
> +++ b/package/qt5/qt5tools/Config.in
> @@ -19,6 +19,9 @@ config BR2_PACKAGE_QT5TOOLS_LINGUIST_TOOLS
>  
>  config BR2_PACKAGE_QT5TOOLS_QDOC_TOOL
>  	bool "qdoc host tool"
> +	# Needs llvm-config and libclang installed on the build machine.

No, that's wrong: it does not need them to be "installed on the build
machine". It just needs them.

> +	# host-llvm and host-clang packages doesn't provide a host compiler.
> +	depends on BROKEN

Here's my counter-proposal:

    config BR2_PACKAGE_QT5TOOLS_QDOC_TOOL
        bool "qdoc host tool"
        # Needs llvm-config and libclang for the host, which is not
        # currently supported in Buildroot, unless the target is
        # already supported by llvm.
        depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS

And a comment about it:

    comment "qdoc not supported for current target"
        depends on !BR2_PACKAGE_LLVM_ARCH_SUPPORTS

Regards,
Yann E. MORIN.

>  	help
>  	  This option enables the qdoc host tool.
>  
> -- 
> 2.24.1
> 

-- 
                                        ____________
.-----------------.--------------------:       _    :------------------.
|  Yann E. MORIN  | Real-Time Embedded |    __/ )   | /"\ ASCII RIBBON |
| +33 534.541.179 | Software  Designer |  _/ - /'   | \ / CAMPAIGN     |
| +33 638.411.245 '--------------------: (_    `--, |  X  AGAINST      |
|      yann.morin (at) orange.com      |_="    ,--' | / \ HTML MAIL    |
'--------------------------------------:______/_____:------------------'


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.
