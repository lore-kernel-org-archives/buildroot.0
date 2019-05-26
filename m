From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 May 2019 11:20:49 +0200
Subject: [Buildroot] [PATCH 8/8] utils/check-package: warn about
 overridden variables
In-Reply-To: <20190127185943.1136-9-ricardo.martincoski@gmail.com>
References: <20190127185943.1136-1-ricardo.martincoski@gmail.com>
 <20190127185943.1136-9-ricardo.martincoski@gmail.com>
Message-ID: <20190526092049.GI12162@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2019-01-27 16:59 -0200, Ricardo Martincoski spake thusly:
> For the general case, appending values to variables is OK and also a
> good practice, like this:
> |PACKAGE_VAR = value1
> |ifeq ...
> |PACKAGE_VAR += value2
> 
> or this, when the above is not possible:
> |PACKAGE_VAR = value1
> |ifeq ...
> |PACKAGE_VAR := $(PACKAGE_VAR), value2
> 
> But this override is an error:
> |PACKAGE_VAR = value1
> |PACKAGE_VAR = value2
> 
> as well this one:
> |ifeq ...
> |PACKAGE_VAR += value1
> |endif
> |PACKAGE_VAR = value2
> 
> And this override is error-prone:
> |PACKAGE_VAR = value1
> |ifeq ...
> |PACKAGE_VAR = value2
> 
> Create a check function to warn about overridden variables.
> 
> Some variables are likely to have a default value that gets overridden
> in a conditional, so ignore them. The name of such variables end in
> _ARCH, _CPU, _SITE, _SOURCE or _VERSION.

Since I updated my host distribution to Ubuntu 19.04, flake8 now reports
tons of errors:

    ./utils/checkpackagelib/lib_mk.py:22:7: W605 invalid escape sequence '\s'

This is because Ubuntu has update pycodestyle to 2.4.0, which introduced
this new W605 check. It mandates that regexps be prefixed by an 'r'
(like a binary string be prefixed by a 'b'), like:

    r"^\s*#"

However, when I fix all these 82 new errors, and run check-package, I
now get a warning about overriden license lists in the few packages
where we do override the license, like in dtc:

    ifeq ($(BR2_PACKAGE_DTC_PROGRAMS),y)
    DTC_LICENSE := $(DTC_LICENSE), GPL-2.0+ (programs)
    [...]
    endif

However, as far as I understand the code, there is an explicit condition
that allows concatenating to a variable (the CONCATENATING regexp), now
line 127.

Do you have an idea what's going on now?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
