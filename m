From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 7 Nov 2011 20:01:48 +0100
Subject: [Buildroot] Report from the Buildroot Developer Day
In-Reply-To: <20111107133902.416ccf35@skate>
References: <20111102160349.4afe5935@skate>
 <CAAXf6LV8pXKtNqU5oey_yikX_7YMLLVJpd9aE9SpyCgiuCC7zw@mail.gmail.com>
 <20111107133902.416ccf35@skate>
Message-ID: <201111072001.48751.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas?, All,

On Monday 07 November 2011 13:39:02 Thomas Petazzoni wrote:
> Le Mon, 7 Nov 2011 10:58:22 +0100,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
> > One thing I really like about the internal build mechanism is that
> > it's internal. If you want to modify something about it, you can
> > directly patch the code and submit to the list.
> 
> Right. For crosstool-NG you can also patch the code and submit to the
> crosstool-NG list. However I agree that some additional steps are
> needed, but we think that the advantage of factorizing the toolchain
> build problem in crosstool-NG is much stronger than the drawback you're
> mentioning.

Thomas D.S. is right. Currently, the integration of crosstool-NG is not
as smooth as the internal mechanism. This is inherent to the fact that
crosstool-NG is an external program, just like the other tools buildroot
uses (host-ccache, host-gawk, host-automake...)

There are two ways to do a better integration:

1) Include the crosstool-NG menuconfig entries into the buildroot
   menuconfig. This will be difficule for two reasons:
   - namespace clashing [1]
   - maintenance when a newer crosstool-NG version gets integrated

2) Delegate all of the toolchain options down to crosstool-NG, and imagine
   an easy way to display the toolchain (crosstool-NG's) menuconfig to the
   user, either one of:
   - always show after standard menuconfig (cumbersome)
   - document, and tell the user, to run make ctng-menuconfig (that could
     be renamed to toolchainconfig in the end) after mangling the needed
     options (what we do now)
   - enhance kconfig to run commands upon selection from the user [2]

Either way is not really a priority, I guess. The most important thing is
to make the process reliable, and be sure thatcrosstool-NG can safely
replace the internal mechanism for good. Once this is fact, then we can
spend time and effort into making it as smooth as possible for the user.

> > This not only holds for the generation of the toolchain, but also for
> > side-aspects like downloading the necessary tarballs and patching.
> > Since crosstool-ng is treated as a package (at least currently it
> > is), any change you want to make to it, has to be done by adding a
> > patchfile to package/crosstool-ng/. This is much more cumbersome than
> > modifying buildroot files.
> > For example, I added scp support to buildroot some time ago, and use
> > it for the primary download site. When switching to crosstool-ng, this
> > no longer worked, I had to add scp support again.
> > 
> > I think it would be beneficial to buildroot if the integration of
> > crosstool-ng could increase. For example, crosstool-ng using the
> > download mechanisms of buildroot.
> 
> That could be discussed with Yann. I'm not sure how this could work
> practically, though.

From the crosstool-NG side, I had the idea that crosstool-NG could call
to an external program to do the download. Such a program would have
an API like that (not fixed, just a blind shot while writing the mail):
  <dl-program> <basename> <URI [URI ...]>

Then the program would output whatever it wants tos, how many lines it
wants to stdout (so it could be used by crosstool-NG to use as "progress
meter"), and print on the last line the absolute path where the tarball
was put.

On the buildroot side, I am not sure at all what could be done. Currently,
tarballs are downloaded because of Makefile dependencies. But in that case
there is no dependency at all, so it would be kind of weird to do it...
Maybe something along the lines of:
  make ext-download BASE=basename URI_LIST="list of URI"

The 'ext-download' rule would leverage the internal download helpers.
Then the program to use would be simply:
  #!/bin/sh
  set -e
  base="$1"; shift
  make BASE="${base}" URI_LIST="$*"
  printf "%s/%s" "${DL_DIR}/${base}"

Not too sure that would be nice enough, though...

> > Great, I hope to be able to join this time.
> Great!

Yes, indeed, that'd be nice to see others join in!


[1] I was thinking about enhancing kconfig to handle namespaces, such as:
      namespace FOO
      config bar
        bool "bar"
      endnamespace
    which would yield the following option (given the generic CONFIG_
    prefix, which could be seen as the top-level namespace):
      CONFIG_FOO_BAR

   But that's not easy to implement, and even less easy to use. Deriving
   a variable name only from the 'config' line would be complex and
   error-prone. There are many corner cases, eg.:
   - Wopuld it be valid to use the short name if refering to an option in
     the same namespace (eg. "depends on FOO_BAR" or "depends on BAR")?

[2] I've thought about something like for a long time now, to serve two
    purposes:
    - run a program to do various stuff
    - run a program to add/remove config options on the fly

  The first would allow to, for example, run secondary menuconfigs:
    config FOO
      action_TYPE "program arg1" ARG2_IS_A_CONFIG_OPTION "arg3"

  where TYPE could be:
    void  : the result of the program is consigned to oblivion
    bool  : set if program succeeds, unset otherwise
    int   : set to the program error-code (or its stdout?)
    string: the stdout of the program is affected to FOO

  The second could be used to add/remove secondary menuconfigs, but would
  probably require something like the namespace above. Anyway, someting
  like:
    menuconfig FOO
      action_include "program args..."

  then, when FOO is set, program is run, its output parsed as config
  options that are added to the current namespace. When FOO is unset
  program is run and its output interpreted as config options to remove
  from the current namespace. That will be *very* hard to do... :-/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
