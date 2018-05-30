From: Joseph Kogut <joseph.kogut@gmail.com>
Date: Wed, 30 May 2018 16:36:00 -0700
Subject: [Buildroot] [PATCH v2] package/clang: fix host-clang binaries
In-Reply-To: <20180530114651.3225-1-valentin.korenblit@smile.fr>
References: <20180530114651.3225-1-valentin.korenblit@smile.fr>
Message-ID: <CAMWSM7gLPDWz07Ep9z7k5FyrhtO-ikWstm3U0a3uPRF7pAtD3g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Valentin,

On Wed, May 30, 2018 at 4:46 AM, Valentin Korenblit
<valentin.korenblit@smile.fr> wrote:
> This patch fixes the following error when trying to execute clang compiler
> (host-variant):
>
> CommandLine Error: Option 'x86-use-base-pointer' registered more than once!
> LLVM ERROR: inconsistency in registered CommandLine options
>
> The same happens for the other binaries, such as clang-format:
>
> ./clang-format
> : CommandLine Error: Option 'help-list' registered more than once!
> LLVM ERROR: inconsistency in registered CommandLine options
>
> Clang binaries are tools, and given that DLLVM_LINK_LLVM_DYLIB is set,
> they are linked against libLLVM.so. The problem is that binaries are
> also linking against some LLVM static libraries, resulting in the error
> shown above. However, it is not the same case for libclang, which is also
> a tool but links only against libLLVM.so.
>
> To fix this problem, add LLVM_DYLIB_COMPONENTS=all.
>
> Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>

Tested-by: Joseph Kogut <joseph.kogut@gmail.com>

> ---
> Currently there is no package in Buildroot that needs host-clang compiler.
> This error was found when trying to build libclc (WIP) after having applied:
> http://lists.busybox.net/pipermail/buildroot/2018-May/221386.html
>
> Changes v1 -> v2:
>
> *Use LLVM_DYLIB_COMPONENTS=all instead of patching CMakeLists.txt of clang binaries.
>
>  package/clang/clang.mk | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/package/clang/clang.mk b/package/clang/clang.mk
> index ae0140c783..dc086c6eed 100644
> --- a/package/clang/clang.mk
> +++ b/package/clang/clang.mk
> @@ -89,5 +89,9 @@ HOST_CLANG_POST_INSTALL_HOOKS = HOST_CLANG_INSTALL_CLANG_TBLGEN
>  HOST_CLANG_CONF_OPTS += -DLLVM_LINK_LLVM_DYLIB=ON
>  CLANG_CONF_OPTS += -DLLVM_LINK_LLVM_DYLIB=ON
>
> +# Prevent clang binaries from linking against LLVM static libs
> +HOST_CLANG_CONF_OPTS += -DLLVM_DYLIB_COMPONENTS=all
> +CLANG_CONF_OPTS += -DLLVM_DYLIB_COMPONENTS=all
> +
>  $(eval $(cmake-package))
>  $(eval $(host-cmake-package))
> --
> 2.14.3
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
