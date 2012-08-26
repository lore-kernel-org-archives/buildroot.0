From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Aug 2012 22:40:50 +0200
Subject: [Buildroot] libffi or the crazy world of toolchain options
In-Reply-To: <201208261223.46075.yann.morin.1998@free.fr>
References: <1345907166-29628-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <201208261223.46075.yann.morin.1998@free.fr>
Message-ID: <201208262240.51214.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 26 August 2012 12:23:46 Yann E. MORIN wrote:
> On Saturday 25 August 2012 17:06:05 Thomas Petazzoni wrote:
> > This patch, I hope, illustrate how crazy this story of "depends on"
> > needed for toolchain options has become. We need to find a solution
> > for this. Yann has proposed something (see
> > http://lists.busybox.net/pipermail/buildroot/2012-August/057144.html).
> > 
> > Opinions? My patch, or Yann's solution? Other solutions?
[--SNIP--]
> Today, I'll be working on my proposal (eg. the BR2_PKG_XX_AVAILABLE stuff),
> and will post a patchset.

OK, now I have a shell+awk script (pkg-avail, attached) that:
  - adds a BR2_PACKAGE_XXX_AVAILABLE symbol for all packages
  - moves packages dependencies to that symbol
  - adds a single dependency against that symbol to the corresponding
    BR2_PACKAGE_XXX /main/ symbol

and a second shell script (pkg-avail-test, attached too) that:
  - runs a batch of randconfig before the changes, and saves the
    generated .config files
  - applies the changes
  - uses the previous batch of randconfigs as defconfig files
  - compares the initial .config with the new .config

Note that the pkg-avail-test script does a few tricks to be able to compare
before and after the change:
  - removes the commented date-line
  - fakes any required DEFCONFIG files (eg. for barebox, the kernel, the
    ct-ng bachkend)
  - removes the _AVAILABLE symbols in new .config files

So far, I've run 10.000 iterations (took ~1h), and I saw no difference.

(
  What I saw, however, is that there are at least two 'select' on packages
  that have 'unmet direct dependencies':
    - (BR2_INIT_SYSV) selects BR2_PACKAGE_SYSVINIT which has unmet direct
      dependencies (BR2_PACKAGE_BUSYBOX_SHOW_OTHERS)
    - (BR2_PACKAGE_COLLECTD_RRDTOOL) selects BR2_PACKAGE_RRDTOOL which has
      unmet direct dependencies (BR2_USE_WCHAR)
  I hope that this can be solved by this on-going change, but I'll anyway
  try to send a fix for those two so it can go in 2012.08.
)

What's left, now, is to change each dependency on a package /main/ symbol
to a dependency on the corresponding _AVAILABLE symbol, plus a select on
the the /main/ symbol. I hope to update my scripts with this functionality.
I definitely do not want to manually review hundreds of packages! ;-)

Both scripts use stgit to manage the stack queue of changes (I heavily
use stgit, it eases things for me).

I am not posting the corresponding patchset, because:
  - it is really big
  - it's not final
  - anyone can experiment with my two scripts

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
-------------- next part --------------
A non-text attachment was scrubbed...
Name: pkg-avail
Type: application/x-shellscript
Size: 2482 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120826/fa42b733/attachment.bin>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: pkg-avail-test
Type: application/x-shellscript
Size: 1514 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120826/fa42b733/attachment-0001.bin>
