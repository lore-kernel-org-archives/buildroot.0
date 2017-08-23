From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 23 Aug 2017 18:46:39 +0200
Subject: [Buildroot] BR2_ENABLE_DEBUG is (incorrectly) using `Debug` for
 CMAKE_BUILD_TYPE instead of `RelWithDebInfo`
In-Reply-To: <CANF-O=aDUs4yojV3sLBG6AiNFcA4C16u90-YJ9+emiTfojFsOA@mail.gmail.com>
References: <CANF-O=aDUs4yojV3sLBG6AiNFcA4C16u90-YJ9+emiTfojFsOA@mail.gmail.com>
Message-ID: <CAHXCMM+D6cpnDdh2bMo3eL_-ahOQVz64_0ZOiAiKvrg9WbryNw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Mehdi,

On Wed, Aug 23, 2017 at 11:45 AM, Mehdi AMINI <joker.eph@gmail.com> wrote:
> Hi,
>
> I've been bitten by what I think is a surprising behavior of  :
> https://bugs.busybox.net/show_bug.cgi?id=10246
>
> Here is the documentation for BR2_ENABLE_DEBUG:
>
> config BR2_ENABLE_DEBUG
>         bool "build packages with debugging symbols"
>         help
>           Build packages with debugging symbols enabled. All libraries
>           and binaries in the 'staging' directory will have debugging
>           symbols, which allows remote debugging even if libraries and
>           binaries are stripped on the target. Whether libraries and
>           binaries are stripped on the target is controlled by the
>           BR2_STRIP_* options below.
>
>
> The option is supposed to enable debug symbols emission by the compiler. The
> description mentions that the purpose is to enable remote debugging using
> `staging` even after stripping the binaries in `target`.
> However, by using `Debug` as `CMAKE_BUILD_TYPE` the option is not orthogonal
> to other settings and have side-effects. In CMake, the CMAKE_BUILD_TYPE is
> not *only* controlling the debug info emission but also the optimization
> level for instance. Also, and with even more concerns, packages may use this
> to trigger other settings.
>
> It seems it has swing'd multiple times last year, first going from `Debug`
> to `RelWithDebInfo` here:
> http://lists.busybox.net/pipermail/buildroot/2016-June/163639.html and here
> http://lists.busybox.net/pipermail/buildroot/2016-July/165714.html ; and
> then back to `Debug` here:
> https://git.buildroot.org/buildroot/commit/package/pkg-cmake.mk?id=104bb29e0490bfb487e2e665448dd3ca07fcc2b5
> (haven't found the mailing list discussion)
> The latter claims that switching from `Release` to `Debug` is "semantically
> closer" to the intent of the option in buildroot. If that is the case, the
> doc does not seem to reflect correctly this intent to me: I always want to
> build a "release" package, only to have debug-info emitted in my staging
> directory.
>

You may not have the entire view that led to this, some valuable
details are in this change:
https://git.buildroot.org/buildroot/commit/?id=12494ef48f893684d0800e7f6fe39a2ceaed0451

> All the other settings mentioned in this commit message (assertions
> enabled/disabled, optimization level, etc.) can be (and actually are I
> think) handled orthogonally using other CMake flags.

We went to these conclusions mostly by experiments, because CMake does
not document the default values for all build type declinaison of
flags :-/
https://cmake.org/cmake/help/v3.9/variable/CMAKE_BUILD_TYPE.html

>
> Using the same CMAKE_BUILD_TYPE as a base and overriding individual setting
> seems like a more sane and robust approach to me.
>
> Two practical examples of packages that shows what can go wrong:
>
> 1) ceres-solver ( https://github.com/ceres-solver/ceres-solver )
>
> When configured with CMAKE_BUILD_TYPE=Release, it'll generate:
>
>     lib/libceres.a
>
> However with CMAKE_BUILD_TYPE=Debug we end up with:
>
>     lib/libceres-debug.a
>
>
> 2) the LLVM compiler is doing special casing based on the value of
> CMAKE_BUILD_TYPE. For example:
>
>     if (NOT uppercase_CMAKE_BUILD_TYPE STREQUAL "DEBUG" AND
>         NOT uppercase_CMAKE_BUILD_TYPE STREQUAL "RELWITHDEBINFO")
>       add_flag_if_supported("-gline-tables-only" GLINE_TABLES_ONLY)
>     endif()
>     # Use -O1 even in debug mode, otherwise sanitizers slowdown is too
> large.
>     if (uppercase_CMAKE_BUILD_TYPE STREQUAL "DEBUG")
>       add_flag_if_supported("-O1" O1)
>     endif()
>
> Or also:
>
> if( NOT uppercase_CMAKE_BUILD_TYPE STREQUAL "DEBUG" )
>   option(LLVM_ENABLE_ASSERTIONS "Enable assertions" OFF)
> else()
>   option(LLVM_ENABLE_ASSERTIONS "Enable assertions" ON)
> endif()
>
>
> In my experience it has been quite common for CMake projects to use
> CMAKE_BUILD_TYPE to differentiate on more than just default optimization
> level.

At the time the denounced changes were done, we did not have such
cases in mind, nor to support, though they are legit.
Enhancement welcome.

Regards,

-- 
Samuel
