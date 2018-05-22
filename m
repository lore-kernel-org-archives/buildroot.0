From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 22 May 2018 18:17:41 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2018-05-21
In-Reply-To: <20180522060038.2D49D20828@mail.bootlin.com>
References: <20180522060038.2D49D20828@mail.bootlin.com>
Message-ID: <20180522151741.6uqpst3wexs33yh6@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Tue, May 22, 2018 at 08:00:38AM +0200, Thomas Petazzoni wrote:
>       mipsel |                   dash-0.5.9.1 | NOK | http://autobuild.buildroot.net/results/fc4e4ab47455ac47dd4a3a60083cec2848e74dbb | ORPH

/bin/sh mktokens
/bin/sh mktokens
/bin/sh mkbuiltins builtins.def
/usr/bin/gcc -I. -I..   -g -O2 -Wall    -o mksyntax mksyntax.c
In file included from mksyntax.c:43:0:
parser.h: In function 'parser_eof':
parser.h:100:37: error: 'TEOF' undeclared (first use in this function)
  return tokpushback && lasttoken == TEOF;
                                     ^

I could not reproduce this one here. Might be a parallel build issue, where 
token.h (the generated header that defines TEOF) exists but is still empty 
when mksyntax.c compiles. Maybe the two invocations of mktokens are racing 
against each other. But I can't see why mktokens runs twice.

Another option is that the content of token.h is not generated correctly for 
some reason.

The autobuilder recorded[1] a few occurrences of the same failure (all error 
from January and before) not only on your machine.

[1] http://autobuild.buildroot.net/?reason=dash-0.5.9.1

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
