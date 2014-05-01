From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 May 2014 22:31:03 +0200
Subject: [Buildroot] [PATCH] Rebuild busybox when an external config is
 updated
In-Reply-To: <CAAXf6LVyQfj8Z=RQkfq_tyjN-e305bZSpKaOg5N5FpVSsc1Tbg@mail.gmail.com>
References: <1396469147-21713-1-git-send-email-sojka@merica.cz>
 <CAAXf6LVyQfj8Z=RQkfq_tyjN-e305bZSpKaOg5N5FpVSsc1Tbg@mail.gmail.com>
Message-ID: <20140501203103.GA3231@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Michal, All,

On 2014-05-01 21:46 +0200, Thomas De Schampheleire spake thusly:
> On Wed, Apr 2, 2014 at 10:05 PM, Michal Sojka <sojka@merica.cz> wrote:
> > This patch adds dependency of busybox configure target to the
> > configuration file specified with BUSYBOX_CONFIG_FILE variable. This
> > means that the following sequence of commands rebuilds busybox after
> > the busybox.config is changed:
> >
> >   make BUSYBOX_CONFIG_FILE=$PWD/busybox.config
> >   echo SOME_OPTION=y >> busybox.config
> >   make BUSYBOX_CONFIG_FILE=$PWD/busybox.config
> >
> > This behaviour is handy when a per-project busybox config is
> > maintained in another repository and the config gets updated by
> > another user (e.g. after git pull).
> >
> > Without this patch, the last command above does not rebuild busybox.
> >
> > This patch also modifies bysubox-update-config target to preserve the
> > timestamp of "exported" config. This is to ensure, that the following
> > sequence of commands builds busybox only once.
> >
> >   make BUSYBOX_CONFIG_FILE=$PWD/busybox.config
> >   make BUSYBOX_CONFIG_FILE=$PWD/busybox.config busybox-update-config
> >   make BUSYBOX_CONFIG_FILE=$PWD/busybox.config
> >
> 
> The issue you're describing is not limited to busybox alone. There are
> other packages using config files that have the same limitation: linux
> and uclibc for example.
> 
> In general, buildroot is mainly aimed at building a given
> configuration completely. It is not really targeted at development
> environment, where you change part of the configuration (like the
> busybox config file) and then can rebuild all necessary components
> automatically.
> In fact, there are many different type of situations related to this:
> for example, if you start from an existing built system, and then
> enable one package (like a library), not all of the other packages
> that have optional dependencies are automatically rebuilt. Buildroot
> does not even attempt to do this.
> 
> So I'm not sure if this patch is desirable given the above.
> Other contributors may think otherwise, of course.

We've already talked about it with Thomas P on IRC a while back. Here's
the transcript of our discussion:

--- Log opened Sun Apr 20 10:52:25 2014
[--SNIP--]
12:02 < kos_tom> opinions about http://patchwork.ozlabs.org/patch/336465/ ?
12:04 < y_morin> kos_tom: http://patchwork.ozlabs.org/patch/336465/  <--
                 we have PKG-clean-for-reconfigure for this, no?
12:05 < y_morin> kos_tom: But most importantly: if we do that for
                 busybox, we need to do that for: linux, uClibc and any
                 other package for which the user can provide a .config
12:06 < y_morin> kos_tom: So, I'd suggest we mark is as "Rejected" and
                 ask to modify the manual about his situation.
12:09 < kos_tom> y_morin: to me, it's part of the "we don't try to be
                 smart and to detect what needs to be rebuilt"
12:11 < kos_tom> clean-for-* are internal targets, they are not really
                 meant to be used, and they are not documented
12:12 < y_morin> kos_tom: Well, we do have rebuild and reconfigure.


So, it looks like both Thomas and me thinks this is not really something
we want. I especially like kos_tom's comment:

    it's part of the "we don't try to be smart and to detect what needs
    to be rebuilt"

I still stand by this position.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
