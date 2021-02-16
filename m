From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 16 Feb 2021 22:38:22 +0100
Subject: [Buildroot] [PATCHv2 3/7] package/pkg-cmake.mk: determine
 CMAKE_BUILD_TYPE depending on BR2_ENABLE_RUNTIME_DEBUG
In-Reply-To: <20210212135451.22786-4-patrickdepinguin@gmail.com>
References: <20210212135451.22786-1-patrickdepinguin@gmail.com>
 <20210212135451.22786-4-patrickdepinguin@gmail.com>
Message-ID: <e45518a8-6b4a-8de9-f85d-b61f494ebbe7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/02/2021 14:54, Thomas De Schampheleire wrote:
> With the introduction of BR2_ENABLE_RUNTIME_DEBUG, Buildroot can now cater
> for all cases:
> 
> - use CMAKE_BUILD_TYPE=Release by default. This makes sure that there is no
>   unexpected performance degradation triggered by enabling BR2_ENABLE_DEBUG.
> 
> - users can optionally enable BR2_ENABLE_RUNTIME_DEBUG if they want runtime
>   debug info like assertions, at the risk of introducing performance
>   degradation. In this case, we switch to CMAKE_BUILD_TYPE=Debug.
> 
> - orthogonally to the above, BR2_ENABLE_DEBUG still determines passing the
>   '-g' flag to enable debug symbols, and BR2_OPTIMIZE_X still determines the
>   used optimization flags.

 I think this is indeed the way to go.

 However, note that this means that BR2_ENABLE_RUNTIME_DEBUG is *not* orthogonal
to BR2_ENABLE_DEBUG. If BR2_ENABLE_DEBUG is not set, *no* -g option is forced on
the compiler, so whatever gets passed by the package build system will be used.
So for CMake packages, that means that BR2_ENABLE_DEBUG=n with
BR2_ENABLE_RUNTIME_DEBUG=y will still result in a -g option in the compile.

 Maybe we should do an explicit -g0 in case BR2_ENALBE_DEBUG is not set.

 Regards,
 Arnout
