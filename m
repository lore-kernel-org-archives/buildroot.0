From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 3 Jul 2018 22:37:43 +0200
Subject: [Buildroot] Building the Rockchip libv4l plugin
In-Reply-To: <20180703033709.vkytmzcwaybt4wu7@tarshish>
References: <20180702082211.bwi2ynnjnfzx3mhm@tarshish>
 <20180702211635.6d55d14a@gmx.net>
 <20180703033709.vkytmzcwaybt4wu7@tarshish>
Message-ID: <20180703223743.447c9f7f@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Baruch,

On Tue, 3 Jul 2018 06:37:09 +0300, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi peter,
> 
> On Mon, Jul 02, 2018 at 09:16:35PM +0200, Peter Seiderer wrote:
> > On Mon, 2 Jul 2018 11:22:11 +0300, Baruch Siach <baruch@tkos.co.il> wrote:  
> > > I'm trying to build the Rockchip libv4l2 plugin in Buildroot. The source 
> > > is at
> > > 
> > >   https://chromium.googlesource.com/chromiumos/third_party/libv4lplugins/+/master/libv4l-rockchip_v2/
> > > 
> > > As upstream indicated[1], the code is meant to build as part of libv4l, not as 
> > > a standalone library. ChromiumOS sees to copy the code into the libv4l source 
> > > tree, and modify the relevant build configuration files[2].
> > > 
> > > What would be the best way to do that in Buildroot? A symlink to the plugin 
> > > source tree? Copy of the code to libv4l?  
> > 
> > ...or add a configure.ac/configure file to the source?  
> 
> Unfortunately the plugin really needs internal libv4l headers, so this is not 
> possible.

Something like the following (quick hack) patch, done the following first (should be added to libv4l):
 
	$ mkdir staging/usr/include/libv4l-1.14.2
	$ cp build/libv4l-1.14.2/config.h staging/usr/include/libv4l-1.14.2/

But failes with:

libv4l-encplugin-rockchip.c: In function ?ioctl_qbuf_locked?:
libv4l-encplugin-rockchip.c:392:8: error: ?struct v4l2_buffer? has no member named ?config_store?
  buffer->config_store = buffer->index + 1;
        ^~
libv4l-encplugin-rockchip.c: In function ?set_encoder_config_locked?:
libv4l-encplugin-rockchip.c:662:11: error: ?struct v4l2_ext_controls? has no member named ?config_store?
  ext_ctrls.config_store = buffer_index + 1;
           ^

Regards,
Peter
