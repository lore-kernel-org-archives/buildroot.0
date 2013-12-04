From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 4 Dec 2013 23:28:15 +0100
Subject: [Buildroot] [PATCHv5 5/5] manual: fix manual generation with
 BR2_EXTERNAL support
In-Reply-To: <1386183373-17611-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386183373-17611-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386183373-17611-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131204222815.GG3332@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Samuel, All,

On 2013-12-04 19:56 +0100, Thomas Petazzoni spake thusly:
> From: Samuel Martin <s.martin49@gmail.com>
> 
> This patch fixes 2 issues that occur during the manual build process:
> 
> * In manual.mk, it forces BR2_EXTERNAL to the default dummy tree coming
>   within Buildroot tree.
>   This is needed to not include the packages from BR2_EXTERNAL because
>   they are not part of Buildroot.
> 
> * During the package list generation, the python script using
>   kconfiglib module reads and parses the Config.in files. So, symbols,
>   including environment variables, got expanded and/or resolved.
>   In kconfiglib.py, this patch fixes the regex that did not allow to use
>   numbers in the environment variable names, so '$BR2_EXTERNAL' got
>   wrongly expanded like it was '${BR}2_EXTERNAL':

As an afterthought, I think this patch should go before the whole series
gets applied, since the manual is broken as soon as we introduce
BR2_EXTERNAL.

So, a first patch to fix the regexp, since this is not specific to
BR2_EXTERNAL, I may already which to use $(YEM2_SCRIPTS)/post-image.sh
as a post-image script right now.

And the BR2_EXTERNAL fix should be squashed in the first patch of the
current series.

Otherwise, wee below...

> <snip>
> >>>   Updating the manual lists...
> Traceback (most recent call last):
>   File "/opt/buildroot/master/support/scripts/gen-manual-lists.py", line 375, in <module>
>     buildroot = Buildroot()
>   File "/opt/buildroot/master/support/scripts/gen-manual-lists.py", line 216, in __init__
>     self.root_config))
>   File "/opt/buildroot/master/support/scripts/kconfiglib.py", line 214, in __init__
>     self.top_block = self._parse_file(filename, None, None, None)
>   File "/opt/src/buildroot/master/support/scripts/kconfiglib.py", line 919, in _parse_file
>     return self._parse_block(line_feeder, None, parent, deps, visible_if_deps, res)
>   File "/opt/buildroot/master/support/scripts/kconfiglib.py", line 1114, in _parse_block
>     self.base_dir))
> IOError: /opt/buildroot/master/Config.in:490: sourced file "$BR2_EXTERNAL/Config.in" (expands to
> "2_EXTERNAL/Config.in") not found. Perhaps base_dir
> (argument to Config.__init__(), currently
> "/opt/buildroot/master") is set to the wrong value.
> docs/manual/manual.mk:2: recipe for target 'manual-update-lists' failed
> make: *** [manual-update-lists] Error 1
> </snip>
> 
> Reported-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Tested-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
