From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 27 Dec 2017 10:31:22 +0100
Subject: [Buildroot] [PATCH] libv4l: restore LFS mismatch fix patch
In-Reply-To: <20171227084715.xibifbptse3c3vde@sapphire.tkos.co.il> (Baruch
 Siach's message of "Wed, 27 Dec 2017 10:47:15 +0200")
References: <2a31dda7a229212bd19f9fb8b2b6f50916fe11cc.1514354092.git.baruch@tkos.co.il>
 <87d130v9ym.fsf@dell.be.48ers.dk>
 <20171227084715.xibifbptse3c3vde@sapphire.tkos.co.il>
Message-ID: <874locv7o5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Wed, Dec 27, 2017 at 09:41:53AM +0100, Peter Korsgaard wrote:
 >> >>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:
 >> 
 >> > Restore the patch that commit 9345b85b47 (libv4l: bump to version
 >> > 1.12.6) has wrongly removed. This is needed for LFS builds for 32bit
 >> > targets.
 >> 
 >> > Fixes:
 >> > http://autobuild.buildroot.net/results/461/46100c008c894e3f998227b2a9c9a79bfcbbda7c/
 >> > http://autobuild.buildroot.net/results/63b/63babd09b8a64fd4da80d99c4c2aed25e5532aec/
 >> > http://autobuild.buildroot.net/results/92b/92bd49d881ed11b2540e434af57ae7347ac186d2/
 >> 
 >> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 >> 
 >> Committed, thanks.
 >> 
 >> It seems my patch never got upstreamed :/ Feel free to submit it if you
 >> actively use libv4l, otherwise I will try to find time to do so.

 > For that I'll have to actually understand what this patch does.

Are you saying my patch description isn't clear? ;)

It has been a while, but I believe the _FILE_OFFSET_BITS adds a bunch of
defines so E.G. read becomes read64 and you get LFS support without
explicitly calling the *64 versions.

As the libv4l preload library wants to overload both read and read64 we
should ensure this transparent read->read64 isn't used as we then cannot
access the real 'read' function.

It does need _LARGEFILE64_SOURCE so the *64 versions are available. For
more details, see:

https://www.gnu.org/software/libc/manual/html_node/Feature-Test-Macros.html

Rereading that page, the patch probably doesn't need to undefine
_LARGEFILE_SOURCE.

-- 
Bye, Peter Korsgaard
