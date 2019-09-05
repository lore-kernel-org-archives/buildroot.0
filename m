From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Date: Thu, 5 Sep 2019 19:54:31 +0100
Subject: [Buildroot] [PATCH v2,
 1/1] package/libcamera: link with atomic when needed
In-Reply-To: <20190905165306.2178-1-fontaine.fabrice@gmail.com>
References: <20190905165306.2178-1-fontaine.fabrice@gmail.com>
Message-ID: <8ad77269-fa25-20b9-f130-7c6119f8c9d7@ideasonboard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

Thank you for the updated patch, This looks like a good workable
upstream solution.

On 05/09/2019 17:53, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.org/results/1f0b8338f5f39aa86b9d432598dae2f53c5f7c84
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2 (after review of Kieran Bingham):
>  - Use an upstreamable solution
> 
>  ...son.build-link-with-atomic-when-need.patch | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 package/libcamera/0001-src-libcamera-meson.build-link-with-atomic-when-need.patch
> 
> diff --git a/package/libcamera/0001-src-libcamera-meson.build-link-with-atomic-when-need.patch b/package/libcamera/0001-src-libcamera-meson.build-link-with-atomic-when-need.patch
> new file mode 100644
> index 0000000000..8c34497db4
> --- /dev/null
> +++ b/package/libcamera/0001-src-libcamera-meson.build-link-with-atomic-when-need.patch
> @@ -0,0 +1,28 @@
> +From 85b7aeef3c7765c5ba7e525c63a4c0f807f0bfc8 Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Thu, 5 Sep 2019 10:24:31 +0200
> +Subject: [PATCH] src/libcamera/meson.build: link with atomic when needed
> +

How about something a bit more descriptive here, something like:

"Sparc and MIPS compilers use an external library to provide atomic
functionality. Detect and link against libatomic when needed."


Then if you could instead post it to:
  libcamera-devel at lists.libcamera.org

we can get it integrated upstream and update the version sha on this
package instead.


> +Fixes:
> + - http://autobuild.buildroot.org/results/1f0b8338f5f39aa86b9d432598dae2f53c5f7c84
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + src/libcamera/meson.build | 1 +
> + 1 file changed, 1 insertion(+)
> +
> +diff --git a/src/libcamera/meson.build b/src/libcamera/meson.build
> +index c5d8f11..0706a08 100644
> +--- a/src/libcamera/meson.build
> ++++ b/src/libcamera/meson.build
> +@@ -99,6 +99,7 @@ version_cpp = vcs_tag(command : [gen_version, meson.build_root()],
> + libcamera_sources += version_cpp
> + 
> + libcamera_deps = [
> ++    cc.find_library('atomic', required: false),

Great - this works out to be quite elegant and simple.

--
Kieran


> +     cc.find_library('dl'),
> +     libudev,
> +     dependency('threads'),
> +-- 
> +2.23.0.rc1
> +
> 

-- 
Regards
--
Kieran
