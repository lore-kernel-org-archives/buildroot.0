From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 29 Oct 2017 08:56:06 +0100
Subject: [Buildroot] ldconfig Support on Target
In-Reply-To: <30ab70ac842c48ef8e6035cbc2c49cd4@PGHPRDEXCH02.corp.bbns.com>
References: <30ab70ac842c48ef8e6035cbc2c49cd4@PGHPRDEXCH02.corp.bbns.com>
Message-ID: <20171029075606.GC2899@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

John, All,

On 2017-10-27 12:20 +0000, John O'Sullivan spake thusly:
> I have a buildroot 2017.02.4 based system. I have a number of binary
> only applications that I am trying to accommodate which have dynamic
> linkage.  I believe I would need ldconfig and associated environment
> to assist resolving the dependencies.

Then you believe wrongly. ;-)

> I cannot see any
> options for ldconfig for target. Could someone clarify the situation.

No, there is no ldconfig on the target, because it is not needed:
Buildroot onoly ever installs libraries in /lib and /usr/lib, both of
whioch are standard search paths for the dynamic linker, so it will
always find the libraries. So we need not create the ld cache at all.

Now, to see what libraries your binaries need, you can very easily do so
on your build machine:

    readelf -d your-binary |grep NEEDED

which will give you the list of libraries needed for that executable.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
