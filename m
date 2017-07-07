From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Jul 2017 09:28:08 +0200
Subject: [Buildroot] [PATCH] ccache: make default host-ccache cache dir
 fit for multi-user setups
In-Reply-To: <87y3s1w672.fsf@dell.be.48ers.dk>
References: <20170706104841.7711-1-peter@korsgaard.com>
 <20170706212148.4f6a4f47@windsurf.lan>
 <87y3s1w672.fsf@dell.be.48ers.dk>
Message-ID: <20170707092808.23bae4fd@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 07 Jul 2017 00:28:49 +0200, Peter Korsgaard wrote:

>  > If I set BR2_CCACHE_DIR to /home/thomas/projects/foobar/ccache/, which
>  > works on my machine, you most likely won't
>  > have /home/jacmet/projects/foobar/ccache/ on your machine.  
> 
> No, but as far as I read the ccache code, it will create the cache dir +
> parent directories if they don't exist.
> 
> E.G.:
> 
> CCACHE_DIR=/tmp/some/funky/sub/directory ccache -s
> cache directory                     /tmp/some/funky/sub/directory
> primary config                      /tmp/some/funky/sub/directory/ccache.conf
> secondary config      (readonly)    /etc/ccache.conf
> cache hit (direct)                     0
> cache hit (preprocessed)               0
> cache miss                             0
> cache hit rate                      0.00 %
> cleanups performed                     0
> files in cache                         0
> cache size                           0.0 kB
> max cache size                       5.0 GB
> ls -l /tmp/some/funky/sub/directory
> total 4
> -rw-r--r-- 1 peko peko 16 Jul  7 00:26 ccache.conf

OK, but I definitely don't want ccache to create a random directory
somewhere in my $HOME folder, just because it was hardcoded into the
ccache binary.

> Hardcoding /home/thomas/.buildroot-ccache is very unlikely to work for
> other users, whereas ~/.buildroot-cache is quite likely.

Sure. But if I set BR2_CCACHE_DIR to /opt/ccache/, it won't work when
the SDK is moved to another machine (permissions may not be set), and
if I set BR2_CCACHE_DIR to $HOME/projects/foobar/cache/, and you run my
SDK on your system, you will get this funky folder created.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
