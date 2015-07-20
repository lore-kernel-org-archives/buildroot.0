From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 20 Jul 2015 15:28:13 +0000
Subject: [Buildroot] [arc-buildroot] [autobuild.buildroot.net] arc build
 results for 2015-07-19
In-Reply-To: <20150720063017.17A55101C2C@stock.ovh.net>
References: <20150720063017.17A55101C2C@stock.ovh.net>
Message-ID: <1437406093.4091.26.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2015-07-20 at 08:30 +0200, Thomas Petazzoni wrote:
> Those results are limited to the arc architecture.
> 
> Build statistics for 2015-07-19
> ===============================
> 
>         success : 2  
>        failures : 21 
>        timeouts : 0  
>           TOTAL : 23 
> 
> Classification of failures by reason
> ====================================
> 
>                   snmppp-3.3.5 | 4 
>                   zeromq-4.0.5 | 3 
>                   mysql-5.1.73 | 3 
>              libselinux-2.1.13 | 2 
>                       atf-0.21 | 1 
>                   cairo-1.14.2 | 1 
>                   bonnie-1.03e | 1 
>              armadillo-5.100.2 | 1 
>                   fan-ctrl-1.3 | 1 
>                 bellagio-0.9.3 | 1 
> flann-04b4a56533faf8c8228d0... | 1 
>                alsa-lib-1.0.29 | 1 
>                   bcusdk-0.0.5 | 1 
> 
> Detail of failures
> ===================
> 
>          arc |                alsa-lib-1.0.29 | NOK | 
> http://autobuild.buildroot.net/results/77766d3b102ccb12da9242027a994e199b6b9b34/

That's a problem with multiply defined "vfork" in static build.
We are looking into it currently.

>          arc |              armadillo-5.100.2 | NOK | 
> http://autobuild.buildroot.net/results/a1edda4f84feb5f04749c6bce17357878d39c0a8/

That's undefined ".tbss". I didn't expect it to happen.
Looks like a valid problem in assembler/compiler.
Reported to toolchain developers.

>          arc |                       atf-0.21 | NOK | 
> http://autobuild.buildroot.net/results/cdf0729496153598e3a2f2903f69ce2879745c03/

I believe that's the same issue as for armadillo.
-------------------------->8--------------------------
configure: error: C++ compiler cannot create executables
-------------------------->8--------------------------

The thing is attempt to link anything against libstdc++ leads to failure with
missing .tbss.

>          arc |                   bcusdk-0.0.5 | NOK | 
> http://autobuild.buildroot.net/results/8e78a8a3f2c9d216543eddadfdae7da4ef4b24a7/

The same.

>          arc |                 bellagio-0.9.3 | NOK | 
> http://autobuild.buildroot.net/results/203eb72ead23ea7930dc1a55dd54a8b3eea5c576/

The same.

>          arc |                   bonnie-1.03e | NOK | 
> http://autobuild.buildroot.net/results/8291d199d76f39c513029a1d63c44370c5e30bb9/

The same.

>          arc |                   cairo-1.14.2 | NOK | 
> http://autobuild.buildroot.net/results/e516b72cde1a299510588977131ca21708ea2fce/

The same.

>          arc |                   fan-ctrl-1.3 | NOK | 
> http://autobuild.buildroot.net/results/cb614f3344a7e15034409898e95de9578581b71f/

That's most probably SourceForge issue, see they experience problems:
http://sourceforge.net/blog/sourceforge-infrastructure-and-service
-restoration/?utm_source=rss&utm_medium=rss&utm_campaign=sourceforge-infrastructure-and-service-restoration

>          arc | flann-04b4a56533faf8c8228d0... | NOK | 
> http://autobuild.buildroot.net/results/3c9885e01a75530641012466d00a59dad2378375/

Missing ".tbss".

>          arc |              libselinux-2.1.13 | NOK | 
> http://autobuild.buildroot.net/results/fb333a453b869cd87730e5b55289cc28d9688af1/
>          arc |              libselinux-2.1.13 | NOK | 

> http://autobuild.buildroot.net/results/b184b5e3f4d45a7fb7331208048f22e165c47432/

Interesting enough I cannot reproduce it with recent tools built from sources.
Probably update of BR prebuilt toolchain to arc-2015.06 will resolve
autobuilder problem as well.


>          arc |                   mysql-5.1.73 | NOK | 
> http://autobuild.buildroot.net/results/f97d4386fae4d7939f417f0059412d0d55553e71

Missing ".tbss".
> 
>          arc |                   snmppp-3.3.5 | NOK | 
> http://autobuild.buildroot.net/results/c123b3b4001f961ce5efe870d52da0079fef7670/
> 
The same.

>          arc |                   zeromq-4.0.5 | NOK | 
> http://autobuild.buildroot.net/results/f406a42b017316d52d5adf3f9ac1a47d5c4e3b51/
>          arc |                   zeromq-4.0.5 | NOK | 
> http://autobuild.buildroot.net/results/ed5c5b50df91f1025dc615e9cb2b11a1efdbf3fb/
>          arc |                   zeromq-4.0.5 | NOK | 
> http://autobuild.buildroot.net/results/cad220d090afbf75bc08a7d57bcaff44631c000b/
> 

Looks like Buildroot pre-built tools are a bit outdated.
br-arcle-hs38-full-2015.05-496-g85945aa.tar.bz2

Consider rebuilding?

-Alexey
