From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Dec 2014 23:27:45 +0100
Subject: [Buildroot] [PATCH] pinentry: Fix pinentry-qt4 build failure
In-Reply-To: <1418053293-64672-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1418053293-64672-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141214222745.GG4121@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2014-12-08 15:41 +0000, Vicente Olivert Riera spake thusly:
> - pinentry-qt4 needs Qt with accessibility support, so remove the
> '-no-accessibility' configure option in the 'package/qt/qt.mk' file to
> build Qt with accessibility support. Otherwise the build process will
> fail showing errors like these ones:
> 
> pinentrydialog.moc:9:52: fatal error:
> ../../../s/pinentry/qt4/pinentrydialog.h: No such file or directory
> 
> main.cpp: In function 'int qt_cmd_handler(pinentry_t)':
> main.cpp:220:51: error: 'class QAbstractButton' has no member named
> 'setAccessibleDescription'
> 
> - The options to disable pinentry-gtk(1) and pinentry-qt(3) are no
> longer needed.
> 
> - The include paths in the .moc files under the 'pinentry-0.9.0/qt4'
> directory are wrong. Add a patch to fix it so we avoid a build failure
> like this one:
> 
> In file included from pinentryconfirm.cpp:52:0:
> pinentryconfirm.moc:9:53: fatal error:
> ../../../s/pinentry/qt4/pinentryconfirm.h: No such file or directory
>  #include "../../../s/pinentry/qt4/pinentryconfirm.h"
> 
> This issue has been reported upstream:
>   https://bugs.g10code.com/gnupg/issue1784
> 
> Fixes:
>   http://autobuild.buildroot.org/results/314/314de324a09f64f8b95882ca169c77847d75680c/

I was working on those build failures that happen since pinentry was
bumped to 0.9.0.

I was about to send my patches when I decided to look at the mailing
list, and found this mail of yours.

Well, I'm OK with the changes, since I've done the same.

However, this patch is doing many different things:
  - fixes the incorrect include paths;
  - fixes the build without Qt accessibility;
  - does not disable accessibility in Qt;
  - removes superfluous configure options

This should be two separate patches.

I'll shortly send what I have, and you can take them and respin if you
think I forgot something.

For one, I have included your no-accessibility patch that was since
accepted upstream, so I'll use that instead of forcefully enabling
accessibility in Qt. And as you previously discussed with Thomas P.,
this should probably be an option in Qt; accessib8ility should not
always be enabled.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
