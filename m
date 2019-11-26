From: James Byrne <james.byrne@origamienergy.com>
Date: Tue, 26 Nov 2019 11:24:36 +0000
Subject: [Buildroot] [PATCH 1/1] package/ntp: remove host shell check
In-Reply-To: <20191123103011.GQ32494@scaer>
References: <0102016e898693a5-82db32f2-a59d-42c1-996b-97661b367c25-000000@eu-west-1.amazonses.com>
 <20191123103011.GQ32494@scaer>
Message-ID: <0102016ea774bea7-76dccffb-b6a8-4689-974e-22e8fa8189df-000000@eu-west-1.amazonses.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On 23/11/2019 10:30, Yann E. MORIN wrote:
> This is not nice, as this patch can't be upstreamed, and we'll have tio
> live with it for the eons to come.
> 
> What about using AC_CACHE_CHECK [0] to do the check, which can be
> overriden on the command line. For example:
> 
>      [
>      AC_CACHE_CHECK([for a posix-compliant shell], [ntp_ac_cv_posix_shell],
>      [while :
>      do
>          blablabla
>      done
>      ])
>      AC_DEFINE_UNQUOTED([POSIX_SHELL], ["${ntp_ac_cv_posix_shell}"],
>        [define to a working POSIX compliant shell])
>      ]
> 
> And then in ntp.mk we could do (in addition to the existing one, of
> course):
> 
>      NTP_CONF_ENV = ntp_ac_cv_posix_shell=/bin/sh
> 
> And such a patch will probably be more acceptable for upstream.

Your comments prompted me to do some more digging, and it turns out that 
the issue has been addressed in a later version of AutoGen, which is 
where the issue comes from - see the change to libopts.def in:

https://sourceforge.net/p/autogen/code/ci/e51f2a781500236b2ba92a4ccd854771a7c28b61/

I will resubmit a V2 patch based on pulling in this change, then if the 
upstream ntp package is updated to use a newer version of AutoGen at 
some point in the future, the patch can go away.

Regards,

James
