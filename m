From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Aug 2015 11:47:47 +0200
Subject: [Buildroot] [PATCH v2] pkg-kernel-module: Die when kernel
 module are disabled
In-Reply-To: <87h9nx887c.fsf@dell.be.48ers.dk>
References: <1439795444-32337-1-git-send-email-nrubinstein@aldebaran.com>
 <20150817163030.15ea69aa@free-electrons.com>
 <87h9nx887c.fsf@dell.be.48ers.dk>
Message-ID: <20150818094747.GC3799@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2015-08-18 07:41 +0200, Peter Korsgaard spake thusly:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > Dear No? Rubinstein,
>  > On Mon, 17 Aug 2015 09:10:44 +0200, No? Rubinstein wrote:
>  >> Test the config of the kernel to see if loadable module support is
>  >> enabled, and error out otherwise. This makes the build failure less
>  >> confusing.
>  >> 
>  >> Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>
>  >> Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  >> ---
>  >> package/pkg-kernel-module.mk | 4 ++++
>  >> 1 file changed, 4 insertions(+)
> 
>  > Applied after tweaking the commit log, thanks.
> 
> Couldn't we instead just force modules support on in the kernel if the
> pkg-kernel-module infrastructure is used?

And how do you suggest we test whether the kernel-module infra is used?

    1) it *is* used already: we do have packages that do call
        $(eval $(kernel-module)) , but I guess that's not what
        you meant. ;-)

    2) so you probably meant: if we actually need to build a kernel
       module.

But that's not so easy:

  - we need to know whether to enable moduls when parsing linux/linux.mk

  - external packages may call kernel-module

  - external packages are parsed after linux.mk

So, too late...

We can't enable kernel modules just from the .mk, we can only check for
them.

Unless we add an hidden kconfig knob BR2)LINUX_NEEDS_MODULES that
packages may select if they want to build modules. Of a visible knob
(user-selectable) that packages can depend on if they need to build
kernel modules...

Needless to say, for 2015.08, No?'s patch is good to go in, while the
alternatives are not; they can however be done post-2015.08.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
