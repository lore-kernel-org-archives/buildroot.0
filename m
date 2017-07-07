From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 07 Jul 2017 08:50:25 +0200
Subject: [Buildroot] [PATCH] ccache: make default host-ccache cache dir
	fit for multi-user setups
In-Reply-To: <8c3c10e0-7f63-0063-5ec2-5edb24ce978f@mind.be> (Arnout
 Vandecappelle's message of "Fri, 7 Jul 2017 01:18:33 +0200")
References: <20170706104841.7711-1-peter@korsgaard.com>
 <8c3c10e0-7f63-0063-5ec2-5edb24ce978f@mind.be>
Message-ID: <87tw2owxji.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 06-07-17 12:48, Peter Korsgaard wrote:
 >> While building I noticed:
 >> 
 >>>>> host-ccache 3.3.4 Building
 >> conf.c: In function 'conf_create':
 >> conf.c:314:2: warning: too many arguments for format [-Wformat-extra-args]
 conf-> cache_dir = format("/home/peko/.buildroot-ccache", get_home_directory());
 >> ^
 >> 
 >> As host-ccache gets installed into $(HOST_DIR) and is part of the SDK,
 >> hardcoding the build user homedir isn't really nice for the relocatable
 >> SDK feature (or simply for a SDK used by multiple users).

 >  Absolutely true. However, I wonder if hardcoding the ccache path in the ccache
 > binary is really such a good idea in the context of an SDK. So perhaps we should
 > just replace the default with our own default, i.e.
 > sed s,%s/\.ccache,%s/.buildroot-ccache,

That is effectively what the patch does by default, while still allowing
you to hardcode an absolute path or a ~/ relative one.

We cannot easily remove the cache dir configuration option / default
fixup as we have supported this for more than 3 years now - Since:

commit d93a0b402934309c632d4a825b7fe6183ce8c4c7
Author: Danomi Manchego <danomimanchego123@gmail.com>
Date:   Wed Apr 30 22:05:06 2014 -0400

    ccache: change default cache directory path to match config setting


 >  Note also that it may have been intentional to point to a shared ccache
 > directory that happens to reside in some user's home directory. But of course,
 > in that case, the BR_CACHE_DIR we use will still take over.

Correct, that chould possibly be a use case, but I would argue a quite
unlikely one, whereas "I just enabled ccache in the sdk and now
everything breaks horribly for my colleagues" is more likely.


 >> #  - Change hard-coded last-ditch default to match path in .config, to avoid
 >> #    the need to specify BR_CACHE_DIR when invoking ccache directly.
 >> +#    CCache replaces "%s" with the home directory of the current user,
 >> +#    So rewrite BR_CACHE_DIR to take that into consideration for SDK purpose
 >> +HOST_CCACHE_DEFAULT_CCACHE_DIR = $(patsubst $(HOME)/%,\%s/%,$(BR_CACHE_DIR))

 >  This looked really really weird to me when I first saw it, but in the end it
 > does make sense.

I agree that it isn't really obvious (which is why I added the comments
above), but I don't see how we can otherwise fix it as BR_CACHE_DIR is
already expanded by the time we get here.


 >  Still, since nobody ever complained about this, I'm not so sure we should "fix"
 > it. It's just as likely to actually break things for some user. So it's a weak
 > NACK from me.

We are only now adding relocatable SDK support, so I would imagine reuse
of the $(HOST_DIR) between users & machines to grow in the future.

I don't agree with the "just as likely to actually break"
statement. CCache is already an advanced option. Using CCache and
customizing the cache dir to a fixed path that happens to reside under
the home directory of the user building it (on the build machine) is
IMHO significantly less unlikely than just enabling ccache and not
tweaking anything else.

And even if so, for those advanced use cases you can always set
BR_CACHE_DIR in the environment. Like for other features, we should make
sure that simple things work out of the box and that advanced things are
possible - But not that you should jump through extra hoops just to get
ccache to work.

-- 
Bye, Peter Korsgaard
