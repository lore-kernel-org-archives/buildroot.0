From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Jan 2020 10:21:51 +0100
Subject: [Buildroot] Package can create
 LINUX_FINAL_RECURSIVE_DEPENDENCIES
In-Reply-To: <CAEyMn7b_ESWcZ8ZBQAVYHxyXNQHrQUGx--8QGD1C6jj+F1=2gA@mail.gmail.com>
References: <CAEyMn7b_ESWcZ8ZBQAVYHxyXNQHrQUGx--8QGD1C6jj+F1=2gA@mail.gmail.com>
Message-ID: <20200126092151.GI32369@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Heiko, All,

On 2020-01-24 08:37 +0100, Heiko Thiery spake thusly:
> I have a custom package (MYPACKAGE) in my BR2_EXTERNAL. This package
> uses the "$(eval $(kernel-module))". In addition this package also
> adds a kernel patch hook via BR2_EXTERNAL/linux-ext-MYPACKAGE.mk.
> 
> As far as I see MYPACKAGE depends on linux (due to kernel-module) and
> LINUX depends on MYPACKAGE due to the dependency created to
> LINUX_PATCH_DEPENDENCIES.

While reviewing our existing linux extensions to prepare my previous
reply, I noticed that we do have the same problem in Buildroot itself.
The package that provides the RTAI extension has an explicit dependency
on linux:

    https://git.buildroot.org/buildroot/tree/package/rtai/rtai.mk#n19

And indeed, runing 'make legal-info' does break in a similar fashion:

    package/rtai/rtai.mk:32: *** Recursive variable
    'RTAI_FINAL_RECURSIVE_DEPENDENCIES' references itself (eventually).
    Stop.

Damned... :-/ We'll have to come up with a fix...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
