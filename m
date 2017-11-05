From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 05 Nov 2017 20:49:24 +0100
Subject: [Buildroot] [PATCH 1/2] jimtcl: explicitly set --host / --build
In-Reply-To: <618a9fff-a540-1081-cdc1-ee0b228447ef@mind.be> (Arnout
 Vandecappelle's message of "Sun, 5 Nov 2017 18:04:08 +0100")
References: <20171103222838.3974-1-peter@korsgaard.com>
 <618a9fff-a540-1081-cdc1-ee0b228447ef@mind.be>
Message-ID: <87375s1p6j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 03-11-17 23:28, Peter Korsgaard wrote:
 >> Fixes:
 >> http://autobuild.buildroot.net/results/d13/d137680bf1c0ebfacef635cb2f0fc14524759143/
 >> 
 >> Otherwise the (handwritten) configure script uses a config.guess script from
 >> 2010 to figure out the build host, breaking builds on ppc64le hosts.
 >> 
 >> The result of --host / --build is only used to detect if we are building for
 >> Windows or not, which is why things are working on x86(-64) build hosts
 >> without specifying --host even though we are cross compiling - But this may
 >> change in the future, so we better pass the correct values.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> package/jimtcl/jimtcl.mk | 2 ++
 >> 1 file changed, 2 insertions(+)
 >> 
 >> diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
 >> index cdbf8ae477..313970d94a 100644
 >> --- a/package/jimtcl/jimtcl.mk
 >> +++ b/package/jimtcl/jimtcl.mk
 >> @@ -42,6 +42,8 @@ define JIMTCL_CONFIGURE_CMDS
 >> (cd $(@D); \
 >> $(TARGET_CONFIGURE_OPTS) CCACHE=none \
 >> ./configure --prefix=/usr \
 >> +		--host=$(GNU_TARGET_NAME) \
 >> +		--build=$(GNU_HOST_NAME) \

 >  For consistency with pkg-autotools, perhaps you should specify --target as well?

--target is only for cross compilers, and the configure script (or
rather system.tcl) doesn't accept it:

Error: Unknown option --target
Try: 'configure --help' for options

So committed as is, thanks.

-- 
Bye, Peter Korsgaard
