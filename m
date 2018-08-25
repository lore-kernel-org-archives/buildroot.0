From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 25 Aug 2018 15:05:12 +0200
Subject: [Buildroot] Autobnuilders timeouts [was: Re: autobuilder flock
 hangs]
In-Reply-To: <821f032d-836a-41c2-d50c-eaa4687c5b22@mentor.com>
References: <20180812060015.A385B207E5@mail.bootlin.com>
 <20180812223629.2bac8ebe@windsurf>
 <1a4b53ec-1ed3-7770-3a65-8d4f4f596918@mentor.com>
 <20180816111059.3a7f1b59@windsurf> <20180824070203.GK9365@scaer>
 <821f032d-836a-41c2-d50c-eaa4687c5b22@mentor.com>
Message-ID: <20180825130512.GB2419@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hollis, Thomas, All,

On 2018-08-24 16:45 -0700, Hollis Blanchard spake thusly:
> On 08/24/2018 12:02 AM, Yann E. MORIN wrote:
> >Hollis, Julien, Matthew, Thomas, All,
> >
> >On 2018-08-16 11:10 +0200, Thomas Petazzoni spake thusly:
> >>On Mon, 13 Aug 2018 11:18:10 -0700, Hollis Blanchard wrote:
> >>>flock was hanging. I don't know why; have you experienced anything like
> >>>that?
> >>This happened again:
> >>   http://autobuild.buildroot.net/results/ddb/ddbc96b24017f2a2b06c6091dea3e19520bf2dd1/
> >I think we now can see a pattern in those timeouts from Hollis'
> >autobuilder: they only ever happen on a slect group of 4 packages that
> >are downloaded with git:
> >   - linux-firmware      (kernel.org)
> >   - f2fs-tools          (kernel.org)
> >   - azure-iot-sdk-c     (github.com)
> >   - uhttpd              (openwrt.org)
> >
> >Could you try to download them manually from your autobuilder, and see
> >if that works or not, please?
> >
> >Is there something on your network that systematically makes those
> >packages fail to download? Do you have firewalling restrictions or
> >extreme traffic shapping?
> 
> azure-iot-sdk-c takes just 26 seconds to clone by hand.

OK.

> I stopped the autobuilder, then ran a br-reproduce job that took all day,
> which ended up at the "rauc" error that y'all just fixed. So... I guess it
> didn't time out.

Dang, I hate it when a failure is not reproducible... Heisenbugs are the
worst...

> While the autobuilder was still running, I did see some strange processes
> though:
> 
> init(1)-+
>         |-flock(3937)
>         |-flock(4688)
>         |-flock(4774)
>         |-flock(9733)
>         |-flock(10710)
>         |-flock(10885)---bash(10886)---bash(10889)---git(10898)---git-remote-http(10899)---git(10902)
>         |-flock(11942)
>         |-flock(13311)---bash(13312)---bash(13315)---git(13324)---git-remote-http(13325)---git(13328)
>         |-flock(13681)
>         |-flock(13915)
>         |-flock(14113)
>         |-flock(17018)
>         |-flock(18869)
>         |-flock(19152)---bash(19153)---bash(19156)---git(19227)---git-submodule(19228)---git-submodule(19329)---git-submodule(20382+
>         |-flock(19819)
>         |-flock(21944)
>         |-flock(22375)
>         |-flock(25233)
>         |-flock(25622)
>         |-flock(26921)
>         |-flock(28424)---bash(28425)---bash(28428)---git(28437)---git-remote-http(28438)---git(28441)
>         |-flock(30945)
>         |-flock(31269)
>         |-flock(31271)
>         |-flock(32627)
>         |-sh(20815)---bash(20816)---bash(20818)---git(20823)---git-remote-http(20824)---git(20826)
> 
> They disappeared when I killed the autobuilder (which is surprising -- seems
> like they're children of init, so why did they die?).

Indeed, that is really weird. :-/

> I suspect a) something goes wrong with the buildroot job, b) it's killed in
> a way that leaves a dangling flock, c) future buildroot jobs run headlong
> into the lingering flock and triggers a timeout.

So I had a look at the autobuilder code, and we kill the build process
with SIGKILL (-9)., so it has no chance of propagating it down to its
children.

I wonder if, should we were to use SIGTERM instead, there would be an
improvement. Could you try to leave your autobuilder running with this
patch, please?

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 3d2e99a..ba86d3d 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -390,7 +390,7 @@ def stop_on_build_hang(monitor_thread_hung_build_flag,
                 if sub_proc.poll() is None:
                     monitor_thread_hung_build_flag.set() # Used by do_build() to determine build hang
                     log_write(log, "INFO: build hung")
-                    sub_proc.kill()
+                    sub_proc.terminate()
                 break
         monitor_thread_stop_flag.wait(30)
 

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
