From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 2 Mar 2020 22:03:23 +0100
Subject: [Buildroot] [PATCH v1] package/mesa3d: fix nouveau std::isinf
 related compile failure
In-Reply-To: <20200302110719.30935-1-ps.report@gmx.net>
References: <20200302110719.30935-1-ps.report@gmx.net>
Message-ID: <f53c92c3-012a-a0c8-185c-9fe4797e5fcd@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

Le 02/03/2020 ? 12:07, Peter Seiderer a ?crit?:
> Add missing cmath include to already existing patch
> 0005-src-gallium-drivers-nouveau-codegen-nv50_ir_ra.cpp-p.patch.
> 
> Fixes:
>   http://autobuild.buildroot.net/results/cbefc5d4a4fefb674e596400fa1d2698cd89c5b3/
>   http://autobuild.buildroot.net/results/dc974da012f53fa4ed3be616f937b0afae423d66/
> 
>   ../src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp: In member function 'bool nv50_ir::GCRA::simplify()':
>   ../src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp:1348:19: error: expected unqualified-id before '(' token
>             if (std::isinf(bestScore)) {
>                      ^
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Notes:
>  - There are already three mesa3d upstream commits which tried to
>    fix the same problem [1], [2], [3].
>    Maybe the check for glibc in [3] is the root cause for the
>    buildroot failures both using uclibc.

uClibc impersonate Glibc 2.10 IIRC. That is why the test is false and the cmath
header is not added.

Reviewed-by: Romain Naour <romain.naour@gmail.com>

Best regards,
Romain


> 
> [1] https://cgit.freedesktop.org/mesa/mesa/commit/?id=f525db6358fbaa7b4296d2e6484e0b1ae703ac78
> [2] https://cgit.freedesktop.org/mesa/mesa/commit/?id=121a0cedc80c5541d51599383486ba9a7397c6ce
> [3] https://cgit.freedesktop.org/mesa/mesa/commit/?id=649704f1f7c9e1d0990d34a76154b2eb656bee42
> ---
>  ...ers-nouveau-codegen-nv50_ir_ra.cpp-p.patch | 23 ++++++++++++++-----
>  1 file changed, 17 insertions(+), 6 deletions(-)
> 
> diff --git a/package/mesa3d/0005-src-gallium-drivers-nouveau-codegen-nv50_ir_ra.cpp-p.patch b/package/mesa3d/0005-src-gallium-drivers-nouveau-codegen-nv50_ir_ra.cpp-p.patch
> index 73e75993de..dac1b79a8a 100644
> --- a/package/mesa3d/0005-src-gallium-drivers-nouveau-codegen-nv50_ir_ra.cpp-p.patch
> +++ b/package/mesa3d/0005-src-gallium-drivers-nouveau-codegen-nv50_ir_ra.cpp-p.patch
> @@ -1,4 +1,4 @@
> -From f2ce27b761eeca301a109856f20ed9a8eb06796d Mon Sep 17 00:00:00 2001
> +From 07de6302aefbe340e54276b4a9a8edd9a3fba270 Mon Sep 17 00:00:00 2001
>  From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  Date: Sat, 28 Dec 2019 21:49:43 +0100
>  Subject: [PATCH] src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp: prefix
> @@ -25,15 +25,26 @@ Fixes:
>  Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>  [Upstream status:
>  https://gitlab.freedesktop.org/mesa/mesa/merge_requests/3227]
> +
> +[Added missing cmath include]
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>  ---
> - src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> + src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp | 3 ++-
> + 1 file changed, 2 insertions(+), 1 deletion(-)
>  
>  diff --git a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
> -index 6df2664da22..e81fb117213 100644
> +index 6df2664..5959210 100644
>  --- a/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
>  +++ b/src/gallium/drivers/nouveau/codegen/nv50_ir_ra.cpp
> -@@ -1345,7 +1345,7 @@ GCRA::simplify()
> +@@ -24,6 +24,7 @@
> + #include "codegen/nv50_ir_target.h"
> + 
> + #include <algorithm>
> ++#include <cmath>
> + #include <stack>
> + #include <limits>
> + #if __cplusplus >= 201103L
> +@@ -1345,7 +1346,7 @@ GCRA::simplify()
>                  bestMaxReg = it->maxReg;
>               }
>            }
> @@ -43,5 +54,5 @@ index 6df2664da22..e81fb117213 100644
>               return false;
>            }
>  -- 
> -2.24.0
> +2.25.1
>  
> 
