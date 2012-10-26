From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 27 Oct 2012 00:02:49 +0200
Subject: [Buildroot] Licensing information
Message-ID: <201210270002.49578.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

In a few packages I've encountered, and for which we may install only part
of the package (eg. only the libs, or the libs and the programs), and those
parts are not under the same licensing terms (but not necesarily conflicting),
there is no way in buildroot to convey such information.

Also, there is no way (AFAICS) to specify a muti-licensed component.

For example, let's look at dtc, the Device Tree Compiler:
 - there are two parts in dtc:
   - libfdt, dual-licensed GPLv2+/BSD-2c
   - dtc (and accompanying tools), licensed GPLv2+

If we only install the library, should we write:
  DTC_LICENSE = GPLv2+/BSD-2c    # notice this is a single word
or
  DTC_LICENSE = GPLv2+ BSD-2c    # notice the space-separation

Then, now we also install the programs, should we write:
  DTC_LICENSE = GPLv2+/BSD-2c GPLv2+
or
  DTC_LICENSE = GPLv2+ BSD-2c

Then, reviewing the licensing information, the user may conclude (wrongly)
that dtc (the package) is dual-licensed GPLv2+ and BSD-2c, and thus decide
to choose the BSD-2c, and not redistribute the dtc package. This would be
bad (TM) in case the dtc programs are installed.

Unfortunately, we have no way to express this kind of multi-licensing cases.
Not that we would want to handle all possibilities either (it would be such
a nightmare), we should at least have a way to draw the user's attention
to such cases.

Here are a few ideas I write as I think of them:

 - add a keyword which genarates a warning:
    DTC_LICENSE = GPLv2+/BDS2- GPLv2+ WARNING

 - allow multi-licensing constructs:
    DTC_LICENSE = GPLV2+/BSD-2c GPLv2+
   (which would say: one part is dual-licensed GPLv2+/BSD-2c, another
   part is licensed GPLv2+)

 - add multi-license keywords:
    DTC_LICENSE += multi:GPLV2+/BSD-2c GPLv2+
   or to be pedantic:
    DTC_LICENSE += multi:GPLV2+/BSD-2c single:GPLv2+

 - don't care. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
