From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 31 Aug 2012 01:50:54 +0200
Subject: [Buildroot] [RFC] Handling gettext
Message-ID: <201208310150.54511.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Currently, defining dependency upon gettext is a bit convoluted:

  config BR2_PACKAGE_FOO
    select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT
    select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE

I think that packages should not have to do that in this way, because
I believe they should not have to deal with that complexity.

What I mean is, for example, should the gettext issue gains some complexity,
of is simplified, of we decide to always use a library instead of the libc's
gettext, it would mean updating all packages.

Also, it breaks my script about the _AVAILABLE sutff.

What I suggest is the following:

0) Rename the current options:

  BR2_NEEDS_GETTEXT            -->  BR2_NEEDS_EXTERNAL_GETTEXT

1) Add blind options that do the conditional selects:

  config BR2_NEEDS_GETTEXT
    bool
    select BR2_PACKAGE_GETTEXT if BR2_NEEDS_EXTERNAL_GETTEXT

  config BR2_NEEDS_LIBINTL
    bool
    select BR2_PACKAGE_LIBINTL if BR2_NEEDS_EXTERNAL_GETTEXT

2) simplify packages by selecting appropriate options:

  config BR2_PACKAGE_FOO
    select BR2_NEEDS_GETTEXT
    select BR2_NEEDS_LIBINTL

3) Ditto for the _IF_LOCALE variants.

4) A similar approach (that I haven't yet thought about) for the .mk file.
   Maybe something along the lines of:

  In package's .mk file:
  FOO_DEPENDENCIES += $(needs_gettext)

  In one of the infrastructure .mk files:
  needs_gettext = $(if $(BR2_NEEDS_EXTERNAL_GETTEXT),gettext)

Comments?

I was initially a bit puzzled when reading the doc, and really wondered
*why* I needed to do that in my package (remember, the huge QEMU stack
in the coming). I had to read the docs twice before I really saw where we
were going with these.

And no, updating the doc (my original issue) is not what I suggest. In
fact, the doc is pretty clear what to do and why. It's just that, in my
poor convoluted mind, I expected something much simpler than that. ;-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
