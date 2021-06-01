From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jun 2021 22:54:27 +0200
Subject: [Buildroot] [PATCHv4 00/16] Introduce BR2_ENABLE_RUNTIME_DEBUG
In-Reply-To: <20210601143422.25064-1-patrickdepinguin@gmail.com>
References: <20210601143422.25064-1-patrickdepinguin@gmail.com>
Message-ID: <20210601205427.GF168928@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2021-06-01 16:34 +0200, Thomas De Schampheleire spake thusly:
> This patch series started with as main goal to fix the performance degradation
> found when testing gRPC in combination with BR2_ENABLE_DEBUG.
> 
> Its implementation strives to settle a discussion that has happened several
> times, regarding the CMAKE_BUILD_TYPE that Buildroot should set, by not forcing
> anything upon the user but allowing the choice.
> 
> Additionally, it cleans up some related changes done in specific packages.
> 
> After this series, there are still packages that set CMAKE_BUILD_TYPE
> explicitly, but the associated comments indicate that they are needed to avoid
> build failures, so they are not touched.

I had started to add my rev-tag to individual commits, until Arnout just
suggested I apply the full series instead. So I did just that: applied
to next, thanks.

However, please see a little comment about the penultimate commit in
your series, about the meson package infra...

Regards,
Yann E. MORIN.

> v2: fix sysrepo after comment by Jan Kundr?t (thanks!)
> v3:
> - new patch setting -g0 (Arnout)
> - don't set -DNDEBUG globally anymore, and drop related libjson change
> - flare-engine, supertux: retain disabling of -pg option (Arnout)
> - sysrepo: new patch for host-sysrepo, disable tests for target (Arnout)
> - update several packages to use BR2_ENABLE_RUNTIME_DEBUG instead of
>   BR2_ENABLE_DEBUG
> v4:
> - drop uclibc patch (Arnout)
> - reintroduce global -DNDEBUG
> - sofia-sip: fix then remove the handling of NDEBUG
> - zmqpp: change buildtype to 'buildroot' in case of BR2_ENABLE_RUNTIME_DEBUG
> 
> Thomas De Schampheleire (16):
>   core: introduce BR2_ENABLE_RUNTIME_DEBUG
>   core: enable 'NDEBUG' unless BR2_ENABLE_RUNTIME_DEBUG is set
>   package/pkg-cmake.mk: determine CMAKE_BUILD_TYPE depending on
>     BR2_ENABLE_RUNTIME_DEBUG
>   package/flare-engine: disable effect of CMAKE_BUILD_TYPE
>   package/sysrepo: use default CMAKE_BUILD_TYPE for host package
>   package/sysrepo: remove explicit setting of CMAKE_BUILD_TYPE
>   package/boost: use BR2_ENABLE_RUNTIME_DEBUG iso BR2_ENABLE_DEBUG
>   package/oracle-mysql: use BR2_ENABLE_RUNTIME_DEBUG iso
>     BR2_ENABLE_DEBUG
>   package/qt5: use BR2_ENABLE_RUNTIME_DEBUG iso BR2_ENABLE_DEBUG
>   package/ripgrep: use BR2_ENABLE_RUNTIME_DEBUG iso BR2_ENABLE_DEBUG
>   package/sofia-sip: correct passing of '--enable-ndebug'
>   package/sofia-sip: don't set 'NDEBUG' explicitly
>   package/zmqpp: don't set CONFIG=debug
>   package/zmqpp: use BR2_ENABLE_RUNTIME_DEBUG iso BR2_ENABLE_DEBUG
>   package/pkg-meson.mk: determine 'buildtype' based on
>     BR2_ENABLE_RUNTIME_DEBUG iso BR2_ENABLE_DEBUG
>   utils/genrandconfig: also test BR2_ENABLE_RUNTIME_DEBUG
> 
>  Config.in                             | 13 +++++++++++++
>  docs/manual/adding-packages-cmake.txt |  2 +-
>  package/Makefile.in                   |  3 +++
>  package/boost/boost.mk                |  2 +-
>  package/flare-engine/flare-engine.mk  | 12 ++++--------
>  package/oracle-mysql/oracle-mysql.mk  |  2 +-
>  package/pkg-cmake.mk                  |  2 +-
>  package/pkg-meson.mk                  |  2 +-
>  package/qt5/qt5base/qt5base.mk        |  2 +-
>  package/ripgrep/ripgrep.mk            |  2 +-
>  package/sofia-sip/sofia-sip.mk        |  4 ----
>  package/sysrepo/sysrepo.mk            |  9 ++++++---
>  package/zmqpp/zmqpp.mk                |  2 +-
>  utils/genrandconfig                   |  2 ++
>  14 files changed, 36 insertions(+), 23 deletions(-)
> 
> -- 
> 2.26.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
