From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Feb 2016 22:18:40 +0100
Subject: [Buildroot] [PATCH v2 1/1] package/gstreamer/gst-plugins-base:
	Fix build on x86 if emmintrin.h is available but can't be used
In-Reply-To: <1454177927-13601-1-git-send-email-bernd.kuhls@t-online.de>
 (Bernd Kuhls's message of "Sat, 30 Jan 2016 19:18:47 +0100")
References: <1454177927-13601-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <87y4b49ljj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bernd" == Bernd Kuhls <bernd.kuhls@t-online.de> writes:

 > I stumbled across this error using a musl-based allyesconfig but I
 > doubt it is related to musl. The autobuilders did not catch this
 > problem yet but the patch I found fits my config (BR2_i386=y,
 > BR2_x86_i586=y) and it solved the problem right away.

 > Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
 > ---
 > v2: used GST_PLUGINS_BASE_PATCH instead of including the patch file
 >     (Thomas)

 >  package/gstreamer/gst-plugins-base/gst-plugins-base.hash | 2 ++
 >  package/gstreamer/gst-plugins-base/gst-plugins-base.mk   | 2 ++
 >  2 files changed, 4 insertions(+)

 > diff --git a/package/gstreamer/gst-plugins-base/gst-plugins-base.hash b/package/gstreamer/gst-plugins-base/gst-plugins-base.hash
 > index 77eba71..7c691f3 100644
 > --- a/package/gstreamer/gst-plugins-base/gst-plugins-base.hash
 > +++ b/package/gstreamer/gst-plugins-base/gst-plugins-base.hash
 > @@ -1,2 +1,4 @@
 >  # From http://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-base-0.10.36.tar.xz.md5
 >  md5	3d2337841b132fe996e5eb2396ac9438	gst-plugins-base-0.10.36.tar.xz
 > +# Locally computed
 > +sha256	2c509252f103847a85c4a64d1d4519ab521d8f0021400cc7ebcf725fc5584a0d	sse.patch
> diff --git a/package/gstreamer/gst-plugins-base/gst-plugins-base.mk b/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
 > index e1374ed..902ee05 100644
 > --- a/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
 > +++ b/package/gstreamer/gst-plugins-base/gst-plugins-base.mk
 > @@ -7,6 +7,8 @@
 >  GST_PLUGINS_BASE_VERSION = 0.10.36
 >  GST_PLUGINS_BASE_SOURCE = gst-plugins-base-$(GST_PLUGINS_BASE_VERSION).tar.xz
 >  GST_PLUGINS_BASE_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-base
 > +GST_PLUGINS_BASE_PATCH = \
 > +	http://git.alpinelinux.org/cgit/aports/plain/main/gst-plugins-base0.10/sse.patch

Thanks, but I'm not too happy about these git.alphinelinux.org
downloads as:

- We have no guarantees that the URL stays valid (E.G. doesn't specify
  any git version).

- The filename is very generic (sse.patch), so we end up with that on
  sources.buildroot.net and basically have to keep it "forever".

As these patches are very small and already in upstream git I have
instead picked them (it turned out the alphinelinux patch was a squash
of two commits) from the upstream git repo and added them in buildroot.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
