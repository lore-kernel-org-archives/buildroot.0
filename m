From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 22 May 2014 15:41:36 +0200
Subject: [Buildroot] [PATCH 1/3] qt5: bump to 5.3.0
In-Reply-To: <1400587934-17338-1-git-send-email-fatih.asici@gmail.com> ("Fatih
 =?utf-8?B?QcWfxLFjxLEiJ3M=?= message of "Tue, 20 May 2014 15:12:12 +0300")
References: <1400587934-17338-1-git-send-email-fatih.asici@gmail.com>
Message-ID: <87sio2c4mn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fatih" == Fatih A??c? <fatih.asici@gmail.com> writes:

 > Remove upstreamed patches.
 > See http://qt-project.org/qt5/qt53 for the release information.

Thanks. It unfortunately doesn't build for me with the default
uClibc/gcc versions:

kernel/qdnslookup_unix.cpp: In static member function ?static void QDnsLookupRunnable::query(int, const QByteArray&, const QHostAddress&, QDnsLookupReply*)?:
kernel/qdnslookup_unix.cpp:165:27: error: ?struct __res_state::<anonymous union>::<anonymous>? has no member named ?nsmap?
Makefile:16244: recipe for target '.obj/qdnslookup_unix.o' failed
make[3]: *** [.obj/qdnslookup_unix.o] Error 1

Seems to have been introduced here:

https://qt.gitorious.org/qt/qtbase/commit/62f01d581bdda6f67cd96af179ae1953e30fa218

uClibc doesn't have a nsmap member in __res_state:

http://git.uclibc.org/uClibc/tree/include/resolv.h

So I guess this need to go in an #ifndef __UCLIBC__ conditional.

Care to create a patch (and send upstream!)?

-- 
Bye, Peter Korsgaard
