From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 19:06:28 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/fontconfig: bump version
 to 2.12.4
In-Reply-To: <20170806073155.18409-1-bernd.kuhls@t-online.de>
References: <20170806073155.18409-1-bernd.kuhls@t-online.de>
Message-ID: <20170902190628.462af963@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  6 Aug 2017 09:31:55 +0200, Bernd Kuhls wrote:
> Removed patch applied upstream:
> https://cgit.freedesktop.org/fontconfig/commit/?id=1ab5258f7c2abfafcd63a760ca08bf93591912da
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

This commit broke the build, because the host-gperf dependency is still
necessary. I hadn't noticed it used to be there, so I simply reverted.

I think it's weird for fontconfig to need host-gperf, as it already
ships the generated files: but the dependencies in the Makefile.am look
bogus to me.

So, can we have a bump to 2.12.4 that keeps the host-gperf dependency,
*and* a bug report submitted upstream about this host-gperf dependency ?

I think rules like:

fcobjshash.gperf: Makefile stamp-fcobjshash.gperf

and:

fcobjshash.h: Makefile fcobjshash.gperf

are bogus, because the configure script generates the Makefile. So the
Makefile is always going to be newer than the shipped fcobjshash.h and
fcobjhash.gperf, and those will always be re-generated.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
