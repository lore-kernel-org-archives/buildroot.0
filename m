From: Brent Sink <brents_3@hotmail.com>
Date: Thu, 15 Jun 2017 01:18:00 +0000
Subject: [Buildroot] Error when building Qt5 Webengine from buildroot
In-Reply-To: <20170611185020.jjlo6za6ln7we4f5@gportay>
References: <BN6PR03MB29143BD3F821BA358530ADF4BFC80@BN6PR03MB2914.namprd03.prod.outlook.com>
 <BN6PR03MB2914ED0870804EEF5408B906BFC90@BN6PR03MB2914.namprd03.prod.outlook.com>
 <20170609090628.5f4d5af3@free-electrons.com>
 <BN6PR03MB29148981A29B24CED48107ADBFCE0@BN6PR03MB2914.namprd03.prod.outlook.com>
 <BN6PR03MB2914652860FFB5C01F6CE128BFCC0@BN6PR03MB2914.namprd03.prod.outlook.com>,
 <20170611185020.jjlo6za6ln7we4f5@gportay>
Message-ID: <BN6PR03MB29141517CD6964AC705F195CBFC30@BN6PR03MB2914.namprd03.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gael,


> I built Qt WE 5.8 with GCC 6.x with glibc.

>
> I am not sure, but I think I met the same issue with GCC 5.x.

Thanks for the tip!  Looking at your patch a little closer I realized that you are using Qt 5.8, and I'm on Qt 5.6.  I had changed GCC to version 6.2 but the problem did not go away.  I noticed that <string> was not included, so I added it to the offending file (touch_evdev_debug_buffer.h) and that ended up solving that problem.  After a little digging, I found that the chromium source already has this fix, so it seems that the Qt5 Webengine 5.6.2 is a little behind.  Here is the commit where it was fixed: https://chromium.googlesource.com/chromium/src/+/34fc1adb8866eae31d330c2983de17896bc1c1e2%5E%21/#F0

I guess that explains why it worked with Qt 5.8. I modified your patch slightly so that it would download Qt WE 5.6.2 instead of 5.8 like your patch does.  I had to also add NEON support like you did in the third patch, and then I enabled -bz2 support for host-python.  Once I did those things, I was able to run the QtWebEngine demos and it worked!  Thanks so much!  I did get some weird errors when navigating to the http://www.qt.io site, but other websites worked without any problems.

> If you build for rpi 3, are you using the raspberrypi3_qt5_defconfig I sent from
> the patch 3/3 [1]? Normally, this defconfig works fine for rpi3.

I only applied the first patch - I'm using an iMX6 instead of a rpi, but the same concept applies to the iMX6.  Thanks for the patch and the help!



-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170615/79d7c08d/attachment.html>
