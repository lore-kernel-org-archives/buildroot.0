From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Jun 2018 18:27:39 +0200
Subject: [Buildroot] [PATCH v2] package/clang: fix host-clang binaries
In-Reply-To: <20180530114651.3225-1-valentin.korenblit@smile.fr> (Valentin
 Korenblit's message of "Wed, 30 May 2018 13:46:51 +0200")
References: <20180530114651.3225-1-valentin.korenblit@smile.fr>
Message-ID: <87wovixyis.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Valentin" == Valentin Korenblit <valentin.korenblit@smile.fr> writes:

 > This patch fixes the following error when trying to execute clang compiler
 > (host-variant):

 > CommandLine Error: Option 'x86-use-base-pointer' registered more than once!
 > LLVM ERROR: inconsistency in registered CommandLine options

 > The same happens for the other binaries, such as clang-format:

 > ./clang-format
 > : CommandLine Error: Option 'help-list' registered more than once!
 > LLVM ERROR: inconsistency in registered CommandLine options

 > Clang binaries are tools, and given that DLLVM_LINK_LLVM_DYLIB is set,
 > they are linked against libLLVM.so. The problem is that binaries are
 > also linking against some LLVM static libraries, resulting in the error
 > shown above. However, it is not the same case for libclang, which is also
 > a tool but links only against libLLVM.so.

 > To fix this problem, add LLVM_DYLIB_COMPONENTS=all.

 > Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
 > ---
 > Currently there is no package in Buildroot that needs host-clang compiler. 
 > This error was found when trying to build libclc (WIP) after having applied:
 > http://lists.busybox.net/pipermail/buildroot/2018-May/221386.html

 > Changes v1 -> v2:

 > *Use LLVM_DYLIB_COMPONENTS=all instead of patching CMakeLists.txt of clang binaries.

Committed, thanks.

-- 
Bye, Peter Korsgaard
