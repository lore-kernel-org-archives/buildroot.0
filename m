From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 16 Nov 2012 00:54:34 +0100
Subject: [Buildroot] [git commit] qextserialport: don't require Qt GUI
 module
In-Reply-To: <20121114214738.427A799B26@busybox.osuosl.org>
References: <20121114214738.427A799B26@busybox.osuosl.org>
Message-ID: <50A580BA.5020402@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 14/11/12 22:44, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=bac970e99d751dd58561313a38311962ea0a79f1
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> Fixes e.g.
> http://autobuild.buildroot.net/results/e80ae76fa21f87bef10e08c7452b796dc0986ff2/
>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>
> Signed-off-by: Peter Korsgaard<jacmet@sunsite.dk>
> ---
>   package/qextserialport/qextserialport-gui.patch |   16 ++++++++++++++++
>   1 files changed, 16 insertions(+), 0 deletions(-)
>
> diff --git a/package/qextserialport/qextserialport-gui.patch b/package/qextserialport/qextserialport-gui.patch
> new file mode 100644
> index 0000000..d3dedae
> --- /dev/null
> +++ b/package/qextserialport/qextserialport-gui.patch
> @@ -0,0 +1,16 @@
> +Don't require Qt GUI module
> +
> +Signed-off-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>
> +---
> +diff -Nrup qextserialport-f83b4e7ca922e53.orig/qextserialport.pro qextserialport-f83b4e7ca922e53/qextserialport.pro
> +--- qextserialport-f83b4e7ca922e53.orig/qextserialport.pro	2012-10-17 09:13:53.000000000 +0200
> ++++ qextserialport-f83b4e7ca922e53/qextserialport.pro	2012-11-13 22:48:29.249431510 +0100
> +@@ -41,6 +41,8 @@ macx:qesp_mac_framework {
> +
> + win32|mac:!wince*:!win32-msvc:!macx-xcode:CONFIG += debug_and_release build_all
> +
> ++!win32*:!wince*:QT -= gui
> ++
> + #generate proper library name
> + greaterThan(QT_MAJOR_VERSION, 4) {
> +     QESP_LIB_BASENAME = QtExtSerialPort

  After submitting this patch upstream, the feedback I got is that it should
not be necessary to do this.  Looking a bit deeper, it turns out they are
right, in a way.  We use the qws mkspecs file, which includes
QT += core gui network

  I.e., by default the gui will always be linked in, and -DQT_GUI_LIB will be added
to the compile flags. It seems logical that Qt would remove the ones that aren't
installed, but it doesn't.  So we should do it ourselves.

  While we're at it, we could also throw out our patching of the platform-specific
qws config file: we are anyway replacing all "interesting" variables with our own
values, so all useful content is thrown away.  Instead, we could make our own spec
file that contains exactly what we need:

include(../../common/linux.conf)
include(../../common/gcc-base-unix.conf)
include(../../common/g++-unix.conf)
include(../../common/qws.conf)
<our stuff goes here>
load(qt_config)


  What do you think?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
