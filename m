From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Sep 2016 08:10:02 +0200
Subject: [Buildroot] Qt5WebKit anf gcc 6.x
In-Reply-To: <1474485754.5453.8.camel@synopsys.com>
References: <1474471693.4311.28.camel@synopsys.com>
 <20160921210949.7ce47d0c@free-electrons.com>
 <1474485754.5453.8.camel@synopsys.com>
Message-ID: <20160922081002.5c1b1e94@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Sep 2016 19:22:42 +0000, Alexey Brodkin wrote:

> For G++ "QMAKE_CFLAGS_ISYSTEM = -isystem", see?https://github.com/qt/qtbase/blob/dev/mkspecs/common/gcc-base.conf#L47
> 
> That's how include path gets prefixed with either normal "-I" if path has no matches in
> QMAKE_DEFAULT_INCDIRS otherwise "-isystem " prefix is used.

OK.

> > In any case, I believe this is where the problem is: I don't see why
> > Qt5 should mess up with the addition of -isystem flags.  
> 
> Agree, but see what Qt people say in similar bug reports:
> https://bugreports.qt.io/browse/QTBUG-53367
> https://bugreports.qt.io/browse/QTBUG-53375
> 
> And BTW that commit added all this mess:
> http://code.qt.io/cgit/qt/qtbase.git/commit?id=0b144bc76a368ecc6c5c1121a1b51e888a0621ac

Thanks for the pointers. Unfortunately, the commit log is useless: it
says what the commit does, but not *why*. So we have no idea why such a
change was done, and the author is not very helpful in explanations in
the bug reports.

So, I believe there are two possibilities here:

 - Check who is adding
   XXX/output/host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include
   to QMAKE_DEFAULT_INCDIRS, and change it to add it to INCLUDEPATH
   instead, so that it's not considered as a "system include path".
   This is what the developer suggested in
   https://bugreports.qt.io/browse/QTBUG-53367.

 - Change our package/qt5/qt5base/qmake.conf file to set
   QMAKE_CFLAGS_ISYSTEM to the empty value, which will disable this new
   "isystem" logic.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
