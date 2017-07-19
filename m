From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 Jul 2017 15:31:21 +0200
Subject: [Buildroot] [PATCH] busybox: disable CONFIG_FEATURE_CLEAN_UP in
	default configs
In-Reply-To: <20170705093454.8326-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Wed, 5 Jul 2017 11:34:54 +0200")
References: <20170705093454.8326-1-peter@korsgaard.com>
Message-ID: <878tjkbljq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > FEATURE_CLEAN_UP is a configuration feature to get busybox to explicitly
 > call free() on dynamic allocated memory just before exiting so memory leak
 > detectors like valgrind don't get confused.  Upstream explicitly recommends
 > to NOT enable this option:

 > config FEATURE_CLEAN_UP
 > 	bool "Clean up all memory before exiting (usually not needed)"
 > 	default n
 > 	help
 > 	  As a size optimization, busybox normally exits without explicitly
 > 	  freeing dynamically allocated memory or closing files. This saves
 > 	  space since the OS will clean up for us, but it can confuse debuggers
 > 	  like valgrind, which report tons of memory and resource leaks.

 > 	  Don't enable this unless you have a really good reason to clean
 > 	  things up manually.

 > Having this option enabled adds a bit of bloat, but more significantly these
 > cleanup code paths don't get tested very often so some times get out of sync
 > with the allocation code which can lead to crashes (or security issues from
 > double frees), so it is safer to disable the option.

 > For people wanting to debug memory leak issues with busybox, the option can
 > still be enabled with a configuration fragment (or a custom config).

 > The size difference isn't huge (br-arm-full-static):

 > -rwxr-xr-x 1 peko peko 886K Jul  5 10:56 output-busybox1/target/bin/busybox
 > -rwxr-xr-x 1 peko peko 882K Jul  5 10:53 output-busybox2/target/bin/busybox

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2017.02.x and 2017.05.x, thanks.

-- 
Bye, Peter Korsgaard
