From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 30 Aug 2012 00:53:31 +0200
Subject: [Buildroot] libffi or the crazy world of toolchain options
In-Reply-To: <201208262240.51214.yann.morin.1998@free.fr>
References: <1345907166-29628-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <201208261223.46075.yann.morin.1998@free.fr>
 <201208262240.51214.yann.morin.1998@free.fr>
Message-ID: <201208300053.32183.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Sunday 26 August 2012 22:40:50 Yann E. MORIN wrote:
> On Sunday 26 August 2012 12:23:46 Yann E. MORIN wrote:
> OK, now I have a shell+awk script (pkg-avail, attached) that:
>   - adds a BR2_PACKAGE_XXX_AVAILABLE symbol for all packages
>   - moves packages dependencies to that symbol
>   - adds a single dependency against that symbol to the corresponding
>     BR2_PACKAGE_XXX /main/ symbol

OK, this is iteration 3 of the script.

It now runs three pases:

1) - introduces a BR2_PACKAGE_XXX_AVAILABLE symbol
   - moves all the package dependencies to this symbol
   - has the package depends only on this symbol

2) - transforms all 'depends on BR2_PACKAGE_XXX' into a dependency
     on the corresponding _AVAILABLE symbol
   - adds a select on the corresponding package

3) - checks and fixes 'select BR2_PACKAGE_XXX' that does not have a
     corresponding 'depends on BR2_PACKAGE_XXX_AVAILABLE'

NOTE: the coverage of this script is NOT 100%. Some manual inspection
and fixes are still required.

Pass 1 treats all 817 packages. After a quick glance, all appears OK,
but a more thorough analysis must be conducted.

Pass 2 finds 67 packages that needs munging. There are a few packages
left over, becasue they ahve constructs like
    depends on PKG_FOO || PKG_BAR

Pass 3 finds 401 packages that 'select' packages without a corresponding
'depends on' on the _AVAILABLE symbol. A casual glance found that pass
to be pretty OK, although a complete analysis has not ben done so far.

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
Size: 6962 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120830/6ae428c6/attachment.bin>
