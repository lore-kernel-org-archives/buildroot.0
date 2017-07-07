From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 07 Jul 2017 11:48:08 +0200
Subject: [Buildroot] [PATCH] ccache: make default host-ccache cache dir
	fit for multi-user setups
In-Reply-To: <20170707092808.23bae4fd@windsurf.lan> (Thomas Petazzoni's
 message of "Fri, 7 Jul 2017 09:28:08 +0200")
References: <20170706104841.7711-1-peter@korsgaard.com>
 <20170706212148.4f6a4f47@windsurf.lan>
 <87y3s1w672.fsf@dell.be.48ers.dk>
 <20170707092808.23bae4fd@windsurf.lan>
Message-ID: <87podcwpbb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> No, but as far as I read the ccache code, it will create the cache dir +
 >> parent directories if they don't exist.
 >> 
 >> E.G.:
 >> 
 >> CCACHE_DIR=/tmp/some/funky/sub/directory ccache -s
 >> cache directory                     /tmp/some/funky/sub/directory
 >> primary config                      /tmp/some/funky/sub/directory/ccache.conf
 >> secondary config      (readonly)    /etc/ccache.conf
 >> cache hit (direct)                     0
 >> cache hit (preprocessed)               0
 >> cache miss                             0
 >> cache hit rate                      0.00 %
 >> cleanups performed                     0
 >> files in cache                         0
 >> cache size                           0.0 kB
 >> max cache size                       5.0 GB
 >> ls -l /tmp/some/funky/sub/directory
 >> total 4
 >> -rw-r--r-- 1 peko peko 16 Jul  7 00:26 ccache.conf

 > OK, but I definitely don't want ccache to create a random directory
 > somewhere in my $HOME folder, just because it was hardcoded into the
 > ccache binary.

Ehh, that is what ccache normally does (E.G. ~/.ccache), similar to a
bunch of other utilities. Without this change things will just break
instead as you most likely don't have a /home/peko/.buildroot-ccache on
your system (or if you do, have write access to it).


 >> Hardcoding /home/thomas/.buildroot-ccache is very unlikely to work for
 >> other users, whereas ~/.buildroot-cache is quite likely.

 > Sure. But if I set BR2_CCACHE_DIR to /opt/ccache/, it won't work when
 > the SDK is moved to another machine (permissions may not be set), and
 > if I set BR2_CCACHE_DIR to $HOME/projects/foobar/cache/, and you run my
 > SDK on your system, you will get this funky folder created.

You presumably would have specific reasons to customize BR2_CCACHE_DIR
like this (and make the needed arrangements to have E.G /opt/ccache
available), so I don't see what the problem would be.

Having a BR2_CCACHE_DIR option (with a default value of
$(HOME)/.buildroot-cache) ending up hardcoding
/home/$sdkbuilduser/.buildroot-cache in the binary seems to me far from
obvious behavior and goes against the goals of reproducible builds and
reusable sdks.

-- 
Bye, Peter Korsgaard
