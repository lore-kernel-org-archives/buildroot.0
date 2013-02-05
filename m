From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 05 Feb 2013 11:17:07 +0100
Subject: [Buildroot] [PATCH 2/3] gnutls: make it non-wchar friendly
In-Reply-To: <1356530149-12305-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 26 Dec 2012 10:55:48 -0300")
References: <1356530149-12305-1-git-send-email-gustavo@zacarias.com.ar>
 <1356530149-12305-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87ip67t68s.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Make gnutls work for non-wchar toolchains.
 Gustavo> It's just a matter of throwing a helping hand to configure.

While this makes gnutls build, it doesn't actually work as there's no
rpl_wctomb implementation so the .so ends up with an undefined reference
to wctomb:

./host/usr/bin/arm-linux-nm -D staging/usr/lib/libgnutls.so.28|grep wctomb
         U wctomb

Causing linker errors for packages trying to use it:

  CCLD   msmtp
host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgnutls.so: undefined reference to `wctomb'
collect2: ld returned 1 exit status

So I'll have to revert this.

-- 
Bye, Peter Korsgaard
