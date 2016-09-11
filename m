From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 11 Sep 2016 15:54:12 +0200
Subject: [Buildroot] [PATCH 0/4] Fix a few unmet dependencies (branch
 yem/unmet-deps)
In-Reply-To: <20160911154921.32548505@free-electrons.com>
References: <cover.1473597259.git.yann.morin.1998@free.fr>
 <20160911154921.32548505@free-electrons.com>
Message-ID: <20160911135412.GM5740@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-09-11 15:49 +0200, Thomas Petazzoni spake thusly:
> On Sun, 11 Sep 2016 14:38:52 +0200, Yann E. MORIN wrote:
> > However, there is one such unmet direct dependency I was not able to
> > understand (with this series already applied):
> > 
> >     $ make KCONFIG_SEED=0x9F309288 randconfig
> >     warning: (BR2_PACKAGE_OPENCV_WITH_GSTREAMER && BR2_PACKAGE_OPENCV3_WITH_GSTREAMER)
> >     selects BR2_PACKAGE_GST_PLUGINS_BASE which has unmet direct dependencies
> >     (BR2_PACKAGE_GSTREAMER)
> >     warning: (BR2_PACKAGE_FREERDP_GSTREAMER && BR2_PACKAGE_QT_WEBKIT &&
> >     BR2_PACKAGE_OPENCV_WITH_GSTREAMER && BR2_PACKAGE_OPENCV3_WITH_GSTREAMER) selects
> >     BR2_PACKAGE_GST_PLUGINS_BASE_PLUGIN_APP which has unmet direct dependencies
> >     (BR2_PACKAGE_GSTREAMER && BR2_PACKAGE_GST_PLUGINS_BASE)
> > 
> > As far as I can see, the dependencies of gstreamer and gst-plugins-base
> > *are* properly propagated to the offending packages. I think I'm gonna
> > loose my sanity on that one... :-/ If any one feels adventurous...
> 
> Do you have some sample .config that exhibits those problems?

As explained above, just run:

    make KCONFIG_SEED=0x9F309288 randconfig

But it may no longer work, since the set of options has changed now. You
can reproduce it with:

    $ git checkout f4918b3a
    $ make KCONFIG_SEED=0x9F309288 randconfig

(f4918b3a is master before you applied the last few patches changing the
set of options).

> I had a
> quick look, and it indeed seems weird. opencv is select both gstreamer
> and gst-plugins-base, so I don't see why the dependency of
> gst-plugins-base on gstreamer is a problem.

Neither do I.

And if you run "make olddefconfig" there is no error anymore... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
