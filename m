From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 05 Feb 2014 09:20:54 +0100
Subject: [Buildroot] [PATCH] opus: allow to select fixed-point
	implementation
In-Reply-To: <1391588079-15608-1-git-send-email-neumann@teufel.de> (Sven
 Neumann's message of "Wed, 5 Feb 2014 09:14:39 +0100")
References: <1391588079-15608-1-git-send-email-neumann@teufel.de>
Message-ID: <87d2j22cnt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sven" == Sven Neumann <neumann@teufel.de> writes:

 > The default of choosing the fixed-point implementation if
 > the target hardware does not have floating-point unit is not
 > always the best choice. Modern ARM hardware has floating
 > point support but most likely the fixed-point implementation
 > in Opus will still perform better. In particular if your CPU
 > supports the NEON extension.

 > This commit allows to select the fixed-point implementation
 > manually and sets the default based on the availability of
 > a floating-point unit.

 > Signed-off-by: Sven Neumann <neumann@teufel.de>
 > ---
 >  package/opus/Config.in | 11 +++++++++++
 >  package/opus/opus.mk   |  2 +-
 >  2 files changed, 12 insertions(+), 1 deletion(-)

 > diff --git a/package/opus/Config.in b/package/opus/Config.in
 > index 12bdfbb..1cd991a 100644
 > --- a/package/opus/Config.in
 > +++ b/package/opus/Config.in
 > @@ -13,3 +13,14 @@ config BR2_PACKAGE_OPUS
 >  	  quality stereo music.
 
 >  	  http://opus-codec.org
 > +
 > +if BR2_PACKAGE_OPUS
 > +
 > +config BR2_PACKAGE_OPUS_FIXED_POINT
 > +	bool "opus fixed-point implementation"

this should probably be:

     bool "use fixed-point" if !BR2_SOFT_FLOAT

E.G. only allow it to be disabled if you have hardware floating point.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
