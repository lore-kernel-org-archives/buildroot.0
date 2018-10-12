From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 12 Oct 2018 09:12:46 +0200
Subject: [Buildroot] [PATCH 3/6] package/qt5: prepare for per-version
 hash files
In-Reply-To: <cb17b9830b43b22d08ed65f5252a036f9ca3a94d.1538913431.git.yann.morin.1998@free.fr>
References: <cover.1538913431.git.yann.morin.1998@free.fr>
 <cb17b9830b43b22d08ed65f5252a036f9ca3a94d.1538913431.git.yann.morin.1998@free.fr>
Message-ID: <12e99890-01c9-4a50-9276-b99815b90b71@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 07/10/2018 13:57, Yann E. MORIN wrote:
> The Qt5 packages may have different licensing terms between the two
> versions we support, and in some cases, those different terms are
> expressed in similarly named files, like files named plain 'LICENSE' for
> example. This is problematic, because, in a .hash file, we can't store
> two different hashes for the same file.
> 
> We've started to handle this case by moving the licenses hashes to the
> per-version sub directories.
> 
> However, the hashes for the downloads are still stored inside the non-
> versioned hash file of the package, which is not totally coherent: if we
> have a per-version hash file, it should list all the hases for that
> version, downloads included, and there should be no unversioned hash
> file.
> 
> In preparation for this, we duplicate the downloads hashes from the main
> hash files, and into the versioned ones. Once the download infra learns
> to look for those hashes in these per-version subdirs, we'll remove the
> unversioned hash files.
> 
> Note that there are a few other packages for which we support differents
> versions (uboot, binutils, gcc, gdb, lua, xserver_xorg-server), but none
> of those have different licensing terms due to the version. Qt5 is alone
> is this case.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Ga?l Portay <gael.portay@savoirfairelinux.com>
> Cc: Peter Seiderer <ps.report@gmx.net>
> Cc: Julien Corjon <corjon.j@ecagroup.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Baruch Siach <baruch@tkos.co.il>
> ---
>  package/qt5/qt5base/5.11.2/qt5base.hash                       | 11 +++++++++++
>  package/qt5/qt5base/5.6.3/qt5base.hash                        |  3 +++
>  package/qt5/qt5quickcontrols2/5.11.2/qt5quickcontrols2.hash   |  7 +++++++
>  package/qt5/qt5quickcontrols2/5.6.3/qt5quickcontrols2.hash    |  3 +++
>  package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash          |  5 -----
>  package/qt5/qt5virtualkeyboard/2.0/qt5virtualkeyboard.hash    |  3 +++
>  package/qt5/qt5virtualkeyboard/5.11.2/qt5virtualkeyboard.hash |  9 +++++++++
>  7 files changed, 36 insertions(+), 5 deletions(-)
>  create mode 100644 package/qt5/qt5base/5.11.2/qt5base.hash
>  create mode 100644 package/qt5/qt5quickcontrols2/5.11.2/qt5quickcontrols2.hash
>  create mode 100644 package/qt5/qt5virtualkeyboard/5.11.2/qt5virtualkeyboard.hash
> 
> diff --git a/package/qt5/qt5base/5.11.2/qt5base.hash b/package/qt5/qt5base/5.11.2/qt5base.hash
> new file mode 100644
> index 0000000000..1c11adba2d
> --- /dev/null
> +++ b/package/qt5/qt5base/5.11.2/qt5base.hash
> @@ -0,0 +1,11 @@
> +# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtbase-everywhere-src-5.11.2.tar.xz.mirrorlist
> +sha256 6381e7c3468d5a1dcfe3683b29eeced192faa0f8a32434fec071a59b8bcd0107 qtbase-everywhere-src-5.11.2.tar.xz
> +
> +# Hashes for license files:
> +sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 LICENSE.GPL2
> +sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 LICENSE.GPL3
> +sha256 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652 LICENSE.GPL3-EXCEPT
> +sha256 88ec689407cf2df9b2eb5c45952564d51ce73c129a3bdffb15c0d2d161ad7558 LICENSE.LGPLv3
> +sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
> +sha256 1f4fa3d202198f5d836993748eac9d91157e2cec7fb8426f56000a02a677cdc5 header.BSD
> +sha256 2a886915de4f296cdae5ed67064f86dba01d0c55286d86e8487f2a5caaf40216 src/3rdparty/harfbuzz-ng/COPYING
> diff --git a/package/qt5/qt5base/5.6.3/qt5base.hash b/package/qt5/qt5base/5.6.3/qt5base.hash
> index f113f82c73..2dae2e8bf0 100644
> --- a/package/qt5/qt5base/5.6.3/qt5base.hash
> +++ b/package/qt5/qt5base/5.6.3/qt5base.hash
> @@ -1,3 +1,6 @@
> +# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtbase-opensource-src-5.6.3.tar.xz.mirrorlist
> +sha256 fef48529a6fc2617a30d75d952cb327c6be341fd104154993922184b3b3b4da1 qtbase-opensource-src-5.6.3.tar.xz
> +
>  # Hashes for license files:
>  sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
>  sha256 66f6bb53f6d985a4d651bf1ecfe8bbcbe32b0f744708d588f047580ee85d8ec8 LICENSE.LGPLv21
> diff --git a/package/qt5/qt5quickcontrols2/5.11.2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/5.11.2/qt5quickcontrols2.hash
> new file mode 100644
> index 0000000000..bdf844eb91
> --- /dev/null
> +++ b/package/qt5/qt5quickcontrols2/5.11.2/qt5quickcontrols2.hash
> @@ -0,0 +1,7 @@
> +# Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtquickcontrols2-everywhere-src-5.11.2.tar.xz.mirrorlist
> +sha256 aa0549f9a4135f9d600b57f53347ebf344e60d21f90c6d844109755da12dcb84 qtquickcontrols2-everywhere-src-5.11.2.tar.xz
> +
> +# Hashes for license files:
> +sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
> +sha256 9e63a04ce021b8bf811b30881fa51c8c3db88afeead942cd59322f2fb69c75bc LICENSE.LGPLv3
> +sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
> diff --git a/package/qt5/qt5quickcontrols2/5.6.3/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/5.6.3/qt5quickcontrols2.hash
> index 6f5bf29400..01fe5dcd61 100644
> --- a/package/qt5/qt5quickcontrols2/5.6.3/qt5quickcontrols2.hash
> +++ b/package/qt5/qt5quickcontrols2/5.6.3/qt5quickcontrols2.hash
> @@ -1,3 +1,6 @@
> +# Hash from: https://download.qt.io/official_releases/qt/5.6/5.6.3/submodules/qtquickcontrols2-opensource-src-5.6.3.tar.xz.mirrorlist
> +sha256 ec5078470abe2da888c2be5d1749b5961ef5132487c180ce4d4aa19ea7ff81cb qtquickcontrols2-opensource-src-5.6.3.tar.xz
> +
>  # Hashes for license files:
>  sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL
>  sha256 245248009fd0af1725d183248380e476c1283383909358a13686606352bf2a17 LICENSE.GPLv3
> diff --git a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
> index 1ebed34166..eb97371337 100644
> --- a/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
> +++ b/package/qt5/qt5quickcontrols2/qt5quickcontrols2.hash
> @@ -3,8 +3,3 @@ sha256 ec5078470abe2da888c2be5d1749b5961ef5132487c180ce4d4aa19ea7ff81cb qtquickc
>  
>  # Hash from: https://download.qt.io/official_releases/qt/5.11/5.11.2/submodules/qtquickcontrols2-everywhere-src-5.11.2.tar.xz.mirrorlist
>  sha256 aa0549f9a4135f9d600b57f53347ebf344e60d21f90c6d844109755da12dcb84 qtquickcontrols2-everywhere-src-5.11.2.tar.xz
> -
> -# Hashes for license files:
> -sha256 d2cfc059acb4abd8e513cd0a73cd8489f34cbafa7bc34d5d31fb3210821cf8ca LICENSE.GPLv3
> -sha256 9e63a04ce021b8bf811b30881fa51c8c3db88afeead942cd59322f2fb69c75bc LICENSE.LGPLv3
> -sha256 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d LICENSE.FDL

Shouldn't this removal happen in patch 5?

-- 
Luca
