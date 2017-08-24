From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 25 Aug 2017 00:00:40 +0200
Subject: [Buildroot] [PATCH 1/3] libv4l: ensure libv4l gets built,
 fixes mediastreamer build
In-Reply-To: <20170821205516.20620-1-thomas.petazzoni@free-electrons.com>
References: <20170821205516.20620-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170825000040.60ee3942@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 21 Aug 2017 22:55:14 +0200, Thomas Petazzoni wrote:
> In commit f837251785e9389f53d695ddb8a094707865171b ("package/libv4l:
> allow build of v4l2 utilities on noMMU platforms"), Hugues Fruchet
> added a bunch of patches to libv4l in order to allow the v4l utilities
> to be built on noMMU platforms.
> 
> However, as part of those patches, he entirely disabled the build of
> libv4l in static linking configurations, because libv4l uses
> dlopen(). Unfortunately, this breaks the build of applications like
> mediastreamer in static linking configurations, and generally makes
> our libv4l packages a little bit awkward: you can enable it, but it
> doesn't install anything (in static linking configurations).
> 
> A closer look shows that dlopen() is only used by libv4l for plugin
> support, and libv4l only provides one single plugin, and its build is
> already conditional. Therefore, this commit adds yet another patch to
> libv4l, which re-enables the build of libv4l, but disables the
> plugin-related logic when plugin support is disabled (and it was
> already automatically disabled in static linking configurations).
> 
> While at it, we update the comment in libv4l.mk that lists the patches
> that makes autoreconf necessary.
> 
> Fixes the build of mediastreamer:
> 
>   http://autobuild.buildroot.net/results/af091cfd0508df9395778cdc796f77e95c168410/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Hugues Fruchet <hugues.fruchet@st.com>
> ---
>  ...c-drop-disable-libv4l-disable-plugin-supp.patch | 216 +++++++++++++++++++++
>  package/libv4l/libv4l.mk                           |   2 +
>  2 files changed, 218 insertions(+)
>  create mode 100644 package/libv4l/0011-configure.ac-drop-disable-libv4l-disable-plugin-supp.patch

Applied to master, thanks. I've added details in the patch about the
upstreaming status: patch has been submitted, feedback is positive from
libv4l maintainer, but waiting for Hugues to comment on the patch.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
