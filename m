From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Fri, 2 Dec 2011 22:25:07 +0100
Subject: [Buildroot] crosstool-ng and uClibc toolchain
In-Reply-To: <4ED8E43B.6020102@carallon.com>
References: <4ED8E43B.6020102@carallon.com>
Message-ID: <201112022225.07805.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Will, All,

On Friday 02 December 2011 15:44:11 Will Wagner wrote:
> I have been looking at building a toolchain using 2011.11 building it 
> with crosstools-ng and uClibc.
> 
> It currently seems a little bit broken/limited. I can supply a custom 
> ct-ng config, which specifies 0.9.32 but I am unable to select NPTL 
> threading or to specify a custom uClibc config file.

Yes, indeed. The problem is that buildroot has no way of knowing what
version of uClibc will be chosen in the crosstool-Ng configuration, so
there is no way to know if NPTL is available or not.

Nothe, that's the current state, not what we want. ;-)

> Also if I choose to use libthreads.new then the build fails as the 
> config file passed to build libc headers has no threading option 
> enabled. This problem is I think caused by the uClibc config file you 
> have to use. It contains LINUXTHREADS_OLD=y but there is not a not set 
> entry for LINUXTHREADS_NEW which means the sed command to set it can't work.

OK, I see the issue. Maybe something like:

if LT_NEW:
  s/^(CT_LIBC_UCLIBC_LNXTHRD_)(NEW|OLD)=y/\1_NEW=y/;
  s/^(CT_LIBC_UCLIBC_LNXTHRD_OLD)=y/# \1 is not set/;
elif LT_OLD:
  s/^(CT_LIBC_UCLIBC_LNXTHRD_)(NEW|OLD)=y/\1_OLD=y/;
  s/^(CT_LIBC_UCLIBC_LNXTHRD_NEW)=y/# \1 is not set/;
endif

(Not taking NPTL into account, that should be another patch).

> In fact the uClibc config you are forced to use has lots of settings I 
> would consider wrong.
> Am I correct thinking these things are broken or am I missing something?

They are not what I would call 'wrong', because these default settings do
provide a working toolchain, by _default_.

Surely, all that sed mangling is complex...

But I agree that the situation could be enhanced...

> Am currently working on a patch that does the following:
> - Allow user to pick uClibc version when using ct-ng
> - Allow user to select nptl when using 0.9.32
> - Supply better default uClibc config files (Using same config files as 
> for internal buildroot config)
> - Allow user to specify a custom uClibc config file
> 
> Assuming I can get it working I'll post it.

Please, keep me in CC, so I do not miss the message...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
