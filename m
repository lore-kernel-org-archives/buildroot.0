From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Sep 2014 15:56:52 +0200
Subject: [Buildroot] [PATCH v7] openvmtools: new package
In-Reply-To: <CABbD_XBqsG91xOVimTEXT2rC-=A-E8Jjwt0KH20xrK9hDoOihA@mail.gmail.com>
References: <1409674416-33961-1-git-send-email-kaszak@gmail.com>
 <20140915092122.7582b3f9@free-electrons.com>
 <CABbD_XCb4POKdky+D6QPO0+zQSqgr4q0_KDRsHMLkCfzXygB-Q@mail.gmail.com>
 <20140915133811.166295a3@free-electrons.com>
 <CABbD_XBqsG91xOVimTEXT2rC-=A-E8Jjwt0KH20xrK9hDoOihA@mail.gmail.com>
Message-ID: <20140915155652.5a575f39@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear K?roly Kasza,

On Mon, 15 Sep 2014 15:51:50 +0200, K?roly Kasza wrote:

> Found it.
> This is because of gcc 4.8's intended behaviour on sizeof() function in
> cases when calling on a pointer.
> See https://gcc.gnu.org/gcc-4.8/porting_to.html "New warnings for pointer
> access".
> It also exists as an unconfirmed bug:
> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=54381.
> This behaviour is only gcc 4.8, while 4.9 and pre-4.8 versions shouldn't do
> this (Sourcery uses 4.7 and 4.6, I used the own toolchain w/ 4.9)
> 
> On the open-vm-tools mail list, it came up
> http://sourceforge.net/p/open-vm-tools/mailman/message/32550520/ , but they
> used -Wno-sizeof-pointer-memaccess for compilation - basically silencing
> the warning.
> 
> Would you recommend using -Wno-sizeof-pointer-memaccess in the .mk file or
> just use a 1 line patch to syncDriverPosix.c - dereferencing
> gRemoteFSTypes[i] with an asterisk?

Thanks for the investigation!

As the solution, I would change the package to not use -Werror. Maybe
it has a configure option to do so? If not, adding one would be good
(so that the patch could potentially be upstreamed), or just changing
the package to not use -Werror at all.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
