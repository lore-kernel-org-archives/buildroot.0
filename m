From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 21:35:16 +0100
Subject: [Buildroot] [PATCH v2] core/pkg-cmake: better way to pass our
 CMAKE_MODULE_PATH
In-Reply-To: <1488648524-23368-1-git-send-email-yann.morin.1998@free.fr>
References: <1488648524-23368-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20170305213516.4c13f548@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  4 Mar 2017 18:28:44 +0100, Yann E. MORIN wrote:
> Currently, we tell cmake where to look for our own custom platform
> description by passing the path to the moduls directory on the command
> line.
> 
> However, this causes two different problems.
> 
> First, some packages simply set CMAKE_MODULE_PATH in their
> CMakeList.txt, thus overriding our own path, and then our platform
> description is not found.
> 
> Second, cmake may internally call sub-cmake (e.g. in the try_compile
> macro), but the CMAKE_MODULE_PATH is not automatically passed down in
> this case.
> 
> For the first problem, we could hunt down and fix all offenders, but
> this is an endless endeavour, especially since packagers are told to do
> so on the cmake wiki [0]:
> 
>     CMAKE_MODULE_PATH
>         tell CMake to search first in directories listed in
>         CMAKE_MODULE_PATH when you use FIND_PACKAGE() or INCLUDE()
>         SET(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/MyCMakeScripts)
>         FIND_PACKAGE(HelloWorld)
> 
> The second problem could be solved by passing yet another variable on
> the command line, that tells cmake to explicitly pass arbitrary
> variables down to sub-cmake calls:
> 
>     -DCMAKE_TRY_COMPILE_PLATFORM_VARIABLES=CMAKE_MODULE_PATH
> 
> However, this only covers the case of try_compile. Even though no other
> case is known yet, we'd still risk missing locations where we would need
> to propagate CMAKE_MODULE_PATH, even some where we'd have no solution
> like for try_compile.
> 
> Instead, ngladitz on IRC suggested that CMAKE_MODULE_PATH be set
> directly from the toolchain file.
> 
> And indeed this fixes both problems explained above.
> 
> So be it.
> 
> [0] https://cmake.org/Wiki/CMake_Useful_Variables
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: J?rg Krause <joerg.krause@embedded.rocks>
> Cc: Ben Boeckel <mathstuf@gmail.com>
> Cc: Baruch Siach <baruch@tkos.co.il>
> Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Peter Korsgaard <peter@korsgaard.com>
> ---
> Changes v1 -> v2:
>   - fix really bad typo in title

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
