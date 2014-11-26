From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 26 Nov 2014 20:18:57 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-11-22
In-Reply-To: <CAHXCMMKM4PHGDAD0SMZuXSX-ksB+j6tR_r1JPhoi7HNVGatuzA@mail.gmail.com>
References: <20141123073011.CCE601014E6@stock.ovh.net>
 <CAHXCMM+JcRY090g3jcYGOzahveW2gYzKu_=QaDGmP2JTBXcRMQ@mail.gmail.com>
 <20141123182619.23fbfdba@free-electrons.com>
 <CAHXCMMKM4PHGDAD0SMZuXSX-ksB+j6tR_r1JPhoi7HNVGatuzA@mail.gmail.com>
Message-ID: <1417033136.5064.8.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Samuel,

On Sun, 2014-11-23 at 18:29 +0100, Samuel Martin wrote:
> On Sun, Nov 23, 2014 at 6:26 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Dear Samuel Martin,
> >
> > On Sun, 23 Nov 2014 18:24:02 +0100, Samuel Martin wrote:
> >
> >> Nginx failure root cause seems to be a kernel with no sysctl syscall.
> >> This seems to happen only on arc.
> >>
> >> Anton, Alexey, is it intended that CONFIG_SYSCTL_SYSCALL is disabled
> >> in the arc kernel config?
> >
> > Yes, see
> > http://lists.busybox.net/pipermail/buildroot/2014-November/112629.html.
> 
> Oh! I missed it! :-S
> Thanks.

Actually I'm wondering why "BR2_PACKAGE_NGINX_RTSIG_MODULE=y" is
implemented in "package/nginx/Config.in"?

As I may see from http://nginx.org/en/CHANGES sysctl was substituted
with procfs in nginx:
--->---
Changes with nginx 0.3.58                                 14 Aug 2006
...
    *) Change: now the procfs interface instead of sysctl is used on
Linux.
--->---

Also from here
http://hg.nginx.org/nginx/file/2c10db908b8c/auto/os/linux#l29 I may
conclude that rt signals were used for Linux kernels between 2.2.19 and
2.6.17.

In other words it looks like rt signals should not be used in modern
nginx running on top of modern Linux kernel.

Probably there's a real need for rt signals to be used still - I'm not
an expert in nginx of any kind.

If there's no such requirement/need for rt signals I would propose to
remove BR2_PACKAGE_NGINX_RTSIG_MODULE completely so users don't select
deprecated options.

-Alexey
