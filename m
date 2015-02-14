From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 15 Feb 2015 00:20:36 +0100
Subject: [Buildroot] [PATCH v2] Linux kernel: add support for config
 fragment files
In-Reply-To: <54DFCE8C.9060107@je-eigen-domein.nl>
References: <1423921601-20473-1-git-send-email-bos@je-eigen-domein.nl>
 <20150214165911.GE3886@free.fr>
 <54DFCE8C.9060107@je-eigen-domein.nl>
Message-ID: <20150214232036.GI3886@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Floris, All,

On 2015-02-14 23:39 +0100, Floris Bos spake thusly:
> On 02/14/2015 05:59 PM, Yann E. MORIN wrote:
> >On 2015-02-14 14:46 +0100, Floris Bos spake thusly:
> >>Adds configuration option to merge additional kernel configuration files
> >>to the main kernel configuration using support/kconfig/merge_config.sh
[--SNIP--]
> >Could you rework your patch to integrate this feature in the
> >kconfig-package infra, please?
[--SNIP--]
> >     LINUX_KCONFIG_FILE = $(KERNEL_SOURCE_CONFIG) $(call qstrip,$(LINUX_KERNEL_CONFIG_FRAGMENTS))
[--SNIP--]
> Problem I see with passing multiple files in the LINUX_KCONFIG_FILE variable
> -as opposed to using a separate variable- is that the variable is currently
> also used as destination file.

Ah, you're right, of coursei. Nice catch!

Then you'll have to introduce a new FOO_KCONFIG_FRAGMENT_FILES.

> If you do "make linux-menuconfig", change some settings, do "make
> linux-updateconfig", the kconfig infrastructure copies .config back to
> LINUX_KCONFIG_FILE.

Yes, that's right.

> Talking about which.
> I am also not sure how updateconfig should behave in case there are
> fragments.
> Should it compute the differences between the original configuration and
> after the user edited it, and save the changes to the (last) fragment in the
> list?
> Is there any good ready-made shell script for comparing .config files that
> we could use for that?
> I know that there is diffconfig that comes with the kernel source, but it
> requires python, and would need to be modified to output in the right
> format.

There are three options here:

 1- we just copy the .config back to FOO_KCONFIG_FILE, and leave to the
    user the duty to further strip it if need be;

 2- we try to be smart and deal with regenerating a config file that
    does not contain any of the fragments, and we fail (because that is
    really complex);

 3- we just error out in case fragments are being used, because we don't
    know how to save a (def)config file in this case (see above: it's
    really compex).

My opinion would be we go with 3 (my prefernce) or 1, not 2.

Note that the problem of saving back the (def)config is not due to
integrating support for fragments in the kconfig-package infra; your
initial patch already exposed that problem (whether the kernel used or
not the kconfig-package infra).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
