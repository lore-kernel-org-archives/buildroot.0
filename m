From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 07 Jul 2017 00:28:49 +0200
Subject: [Buildroot] [PATCH] ccache: make default host-ccache cache dir
	fit for multi-user setups
In-Reply-To: <20170706212148.4f6a4f47@windsurf.lan> (Thomas Petazzoni's
 message of "Thu, 6 Jul 2017 21:21:48 +0200")
References: <20170706104841.7711-1-peter@korsgaard.com>
 <20170706212148.4f6a4f47@windsurf.lan>
Message-ID: <87y3s1w672.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

>> +HOST_CCACHE_DEFAULT_CCACHE_DIR = $(patsubst $(HOME)/%,\%s/%,$(BR_CACHE_DIR))

 > But this only solves the problem for the specific case where the ccache
 > cache is inside the same folder in user A home directory and user B
 > home directory.

 > If I set BR2_CCACHE_DIR to /home/thomas/projects/foobar/ccache/, which
 > works on my machine, you most likely won't
 > have /home/jacmet/projects/foobar/ccache/ on your machine.

No, but as far as I read the ccache code, it will create the cache dir +
parent directories if they don't exist.

E.G.:

CCACHE_DIR=/tmp/some/funky/sub/directory ccache -s
cache directory                     /tmp/some/funky/sub/directory
primary config                      /tmp/some/funky/sub/directory/ccache.conf
secondary config      (readonly)    /etc/ccache.conf
cache hit (direct)                     0
cache hit (preprocessed)               0
cache miss                             0
cache hit rate                      0.00 %
cleanups performed                     0
files in cache                         0
cache size                           0.0 kB
max cache size                       5.0 GB
ls -l /tmp/some/funky/sub/directory
total 4
-rw-r--r-- 1 peko peko 16 Jul  7 00:26 ccache.conf

Hardcoding /home/thomas/.buildroot-ccache is very unlikely to work for
other users, whereas ~/.buildroot-cache is quite likely.

-- 
Bye, Peter Korsgaard
