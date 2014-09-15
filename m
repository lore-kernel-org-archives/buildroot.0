From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Mon, 15 Sep 2014 15:51:50 +0200
Subject: [Buildroot] [PATCH v7] openvmtools: new package
In-Reply-To: <20140915133811.166295a3@free-electrons.com>
References: <1409674416-33961-1-git-send-email-kaszak@gmail.com>
 <20140915092122.7582b3f9@free-electrons.com>
 <CABbD_XCb4POKdky+D6QPO0+zQSqgr4q0_KDRsHMLkCfzXygB-Q@mail.gmail.com>
 <20140915133811.166295a3@free-electrons.com>
Message-ID: <CABbD_XBqsG91xOVimTEXT2rC-=A-E8Jjwt0KH20xrK9hDoOihA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Found it.
This is because of gcc 4.8's intended behaviour on sizeof() function in
cases when calling on a pointer.
See https://gcc.gnu.org/gcc-4.8/porting_to.html "New warnings for pointer
access".
It also exists as an unconfirmed bug:
https://gcc.gnu.org/bugzilla/show_bug.cgi?id=54381.
This behaviour is only gcc 4.8, while 4.9 and pre-4.8 versions shouldn't do
this (Sourcery uses 4.7 and 4.6, I used the own toolchain w/ 4.9)

On the open-vm-tools mail list, it came up
http://sourceforge.net/p/open-vm-tools/mailman/message/32550520/ , but they
used -Wno-sizeof-pointer-memaccess for compilation - basically silencing
the warning.

Would you recommend using -Wno-sizeof-pointer-memaccess in the .mk file or
just use a 1 line patch to syncDriverPosix.c - dereferencing
gRemoteFSTypes[i] with an asterisk?


On Mon, Sep 15, 2014 at 1:38 PM, Thomas Petazzoni <
thomas.petazzoni@free-electrons.com> wrote:

> Dear K?roly Kasza,
>
> On Mon, 15 Sep 2014 13:19:06 +0200, K?roly Kasza wrote:
>
> > At first sight something happens with the ctng toolchain, while using own
> > toolchain or Sourcery w/ the same packages/options the problem does not
> > occur. I'm looking in the x86_64-ctng_locales-linux-gnu toolchain right
> now.
>
> Note that it does not happen only with a ctng toolchain. See for
> example
>
> http://autobuild.buildroot.org/results/d1b/d1bf0d43389ff536ec79dd5d6a7cd0b12293233d//
> ,
> where the same problem happens with a BR toolchain.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
>



-- 

?dv,
KK
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140915/ffedbbba/attachment.html>
